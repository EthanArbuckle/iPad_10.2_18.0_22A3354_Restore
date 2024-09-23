@implementation VCPSceneChangeAnalyzer

- (VCPSceneChangeAnalyzer)init
{
  char *v2;
  VCPSceneChangeSegment *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPSceneChangeAnalyzer;
  v2 = -[VCPSceneChangeAnalyzer init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VCPSceneChangeSegment);
    v4 = (void *)*((_QWORD *)v2 + 1792);
    *((_QWORD *)v2 + 1792) = v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 1793);
    *((_QWORD *)v2 + 1793) = v5;

    v2[14352] = 1;
    v2[14353] = 1;
    v7 = *MEMORY[0x1E0CA2E50];
    v8 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    *(_OWORD *)(v2 + 14372) = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)(v2 + 14388) = v8;
    *(_OWORD *)(v2 + 14356) = v7;
    v2[14404] = 0;
    v2[14405] = 0;
    *((_QWORD *)v2 + 5) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    v9 = v2;
  }

  return (VCPSceneChangeAnalyzer *)v2;
}

- (void)ComputeSceneDelta:(void *)a3
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float *sceneDeltaBuffer;
  float v11;
  uint64_t v12;
  float v13;
  float v14;

  v3 = *(_DWORD *)a3;
  v4 = *(_DWORD *)a3 - 3;
  if (*(int *)a3 >= 3)
  {
    if (v3 <= 0xC)
      v7 = v4;
    else
      v7 = 10;
    v8 = ma::FrameBuffer::Get((ma::FrameBuffer *)&self->_frameBuffer, v3 - 2);
    v9 = ma::Histogram::EarthMoverDistance((ma::Histogram *)((char *)a3 + 360), (const ma::Histogram *)(v8 + 360));
    if ((_DWORD)v7)
    {
      sceneDeltaBuffer = self->_sceneDeltaBuffer;
      v11 = 0.0;
      v12 = v7;
      do
      {
        v13 = *sceneDeltaBuffer++;
        v11 = v11 + v13;
        --v12;
      }
      while (v12);
      v14 = fmaxf(v9 - (float)(v11 / (float)(int)v7), 0.0) / (float)((float)(v11 / (float)(int)v7) + 0.000001);
    }
    else
    {
      v14 = 0.0;
    }
    self->_sceneDeltaBuffer[v4 % 0xA] = v9;
    *((float *)a3 + 75) = v9;
    *((float *)a3 + 76) = v14;
  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  __int128 v10;
  char *Next;
  double v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CFDictionaryRef v20;
  void *v21;
  CFDictionaryRef v22;
  void *v23;
  VCPSceneChangeSegment *v24;
  MotionResult *p_motion_result;
  void *v26;
  void *v27;
  __int128 v29;
  int64_t v30;
  __int128 v31;
  int64_t v32;
  CMTime time[2];
  __int128 v34;
  int64_t v35;
  __int128 v36;
  int64_t var3;
  CMTime v38;
  CMTime v39;
  CMTime duration;
  CMTime start;
  CMTimeRange v42;
  CMTime v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  start = *(CMTime *)a4;
  duration = *(CMTime *)a5;
  CMTimeRangeMake(&v42, &start, &duration);
  v10 = *(_OWORD *)&v42.start.epoch;
  *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[5] = *(_OWORD *)&v42.start.value;
  *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.confidence_[3] = v10;
  *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.action_score_ = *(_OWORD *)&v42.duration.timescale;
  Next = ma::FrameBuffer::GetNext((ma::FrameBuffer *)&self->_frameBuffer);
  v39 = *(CMTime *)a4;
  v38 = *(CMTime *)a5;
  *(_QWORD *)&v12 = ma::Frame::Initialize((ma::Frame *)Next, &v39, &v38, a3, 1).n128_u64[0];
  v14 = v13;
  if (!v13)
  {
    if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.significant_values_[4]))
    {
      v15 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
      v36 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      objc_msgSend(v15, "resetSegment:", &v36);
      BYTE1(self->_frameBuffer.buffer_[34].motion_result_.significant_values_[4]) = 0;
      *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1) = 0;
    }
    else
    {
      -[VCPSceneChangeAnalyzer ComputeSceneDelta:](self, "ComputeSceneDelta:", Next, v12);
      if (-[VCPSceneChangeAnalyzer decideLensSwitchPoint:](self, "decideLensSwitchPoint:", Next))
      {
        *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1) = 1;
        v16 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        v34 = *(_OWORD *)&a4->var0;
        v35 = a4->var3;
        objc_msgSend(v16, "finalizeAtTime:", &v34);
        v17 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
        v44[0] = CFSTR("start");
        v18 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        if (v18)
          objc_msgSend(v18, "timeRange");
        else
          memset(&v42, 0, sizeof(v42));
        time[0] = v42.start;
        v20 = CMTimeCopyAsDictionary(time, 0);
        v45[0] = v20;
        v44[1] = CFSTR("duration");
        v21 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        if (v21)
          objc_msgSend(v21, "timeRange");
        else
          memset(time, 0, sizeof(time));
        v43 = time[1];
        v22 = CMTimeCopyAsDictionary(&v43, 0);
        v45[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

        v24 = objc_alloc_init(VCPSceneChangeSegment);
        p_motion_result = &self->_frameBuffer.buffer_[34].motion_result_;
        v26 = *(void **)p_motion_result->significant_values_;
        *(_QWORD *)p_motion_result->significant_values_ = v24;

        v27 = *(void **)p_motion_result->significant_values_;
        v31 = *(_OWORD *)&a4->var0;
        v32 = a4->var3;
        objc_msgSend(v27, "resetSegment:", &v31);
      }
      else
      {
        *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1) = 0;
        v19 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
        v29 = *(_OWORD *)&a4->var0;
        v30 = a4->var3;
        objc_msgSend(v19, "updateSegment:", &v29);
      }
    }
  }
  return v14;
}

- (void)PrintSegments
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  const __CFDictionary *v7;
  double Seconds;
  Float64 v9;
  CMTimeRange range;
  CMTime v11;
  CMTime time;
  CMTimeRange v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.significant_values_[4]))
  {
    printf("===========SceneChangeSegments=============");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v15 != v5)
            objc_enumerationMutation(v3);
          v7 = *(const __CFDictionary **)(*((_QWORD *)&v14 + 1) + 8 * i);
          memset(&v13, 0, sizeof(v13));
          CMTimeRangeMakeFromDictionary(&v13, v7);
          time = v13.start;
          Seconds = CMTimeGetSeconds(&time);
          range = v13;
          CMTimeRangeGetEnd(&v11, &range);
          v9 = CMTimeGetSeconds(&v11);
          printf("[%f, %f]", Seconds, v9);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v4);
    }

  }
}

- (BOOL)decideLensSwitchPoint:(void *)a3
{
  float v4;
  BOOL v5;
  unint64_t v6;
  BOOL v7;
  BOOL result;

  v4 = *((float *)a3 + 76);
  v5 = !self->_frameBuffer.buffer_[34].motion_result_.is_stable_;
  if (!self->_frameBuffer.buffer_[34].motion_result_.is_stable_)
  {
    if (v4 > 6.8 && *((float *)a3 + 75) > 3.5)
    {
      v7 = 1;
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 >= 1.0)
    return 0;
  v6 = objc_msgSend(*(id *)self->_frameBuffer.buffer_[34].motion_result_.significant_values_, "numOfFrames");
  v7 = 0;
  result = 0;
  if (v6 >= 4)
  {
LABEL_11:
    self->_frameBuffer.buffer_[34].motion_result_.is_stable_ = v7;
    return v5;
  }
  return result;
}

- (int)finalizeAnalysisPass:(id *)a3
{
  id *p_motion_result;
  void *v5;
  __int128 v6;
  void *v7;
  CFDictionaryRef v8;
  void *v9;
  CFDictionaryRef v10;
  void *v11;
  CMTime v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTimeRange range;
  CMTime v18;
  CMTime time;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  p_motion_result = (id *)&self->_frameBuffer.buffer_[34].motion_result_;
  v5 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
  v6 = *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.confidence_[3];
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[5];
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_frameBuffer.buffer_[34].motion_result_.action_score_;
  CMTimeRangeGetEnd(&v18, &range);
  objc_msgSend(v5, "finalizeAtTime:", &v18);
  v7 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
  v20[0] = CFSTR("start");
  if (*p_motion_result)
  {
    objc_msgSend(*p_motion_result, "timeRange");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  *(_OWORD *)&v13[0].value = v14;
  v13[0].epoch = v15;
  v8 = CMTimeCopyAsDictionary(v13, 0);
  v21[0] = v8;
  v20[1] = CFSTR("duration");
  v9 = *(void **)self->_frameBuffer.buffer_[34].motion_result_.significant_values_;
  if (v9)
    objc_msgSend(v9, "timeRange");
  else
    memset(v13, 0, sizeof(v13));
  time = v13[1];
  v10 = CMTimeCopyAsDictionary(&time, 0);
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  -[VCPSceneChangeAnalyzer PrintSegments](self, "PrintSegments");
  return 0;
}

- (id)results
{
  void *v3;
  uint64_t v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2], "count");
  if (v3)
  {
    v4 = *(_QWORD *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2];
    v6 = CFSTR("SceneChangeResults");
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isSegmentPoint
{
  return *(&self->_frameBuffer.buffer_[34].motion_result_.is_stable_ + 1);
}

- (void).cxx_destruct
{
  float *v3;
  uint64_t v4;

  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.significant_values_[2], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_, 0);
  v3 = &self->_frameBuffer.buffer_[33].motion_result_.motion_param_diff_.__elems_[3];
  v4 = -14280;
  do
  {
    ma::Histogram::~Histogram((ma::Histogram *)(v3 + 58));
    ma::MotionResult::~MotionResult((ma::MotionResult *)v3);
    v3 -= 102;
    v4 += 408;
  }
  while (v4);
}

- (id).cxx_construct
{
  ma::FrameBuffer::FrameBuffer((ma::FrameBuffer *)&self->_frameBuffer);
  return self;
}

@end
