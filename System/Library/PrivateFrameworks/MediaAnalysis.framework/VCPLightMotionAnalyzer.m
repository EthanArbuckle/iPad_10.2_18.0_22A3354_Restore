@implementation VCPLightMotionAnalyzer

- (VCPLightMotionAnalyzer)initWithQueue:(id)a3 turbo:(BOOL)a4
{
  id v7;
  VCPLightMotionAnalyzer *v8;
  VCPLightMotionAnalyzer *v9;
  ma::EncodeAnalysis *v10;
  ma::EncodeAnalysis *v11;
  VCPLightMotionAnalyzer *v12;
  VCPLightMotionAnalyzer *v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VCPLightMotionAnalyzer;
  v8 = -[VCPLightMotionAnalyzer init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_frame.histogram_.moments_hist_[1] = 0;
    LOBYTE(v9->_flags) = a4;
    v10 = (ma::EncodeAnalysis *)operator new(0x3B8uLL, MEMORY[0x1E0DE4E10]);
    v11 = v10;
    if (v10)
    {
      ma::EncodeAnalysis::EncodeAnalysis(v10, 0, a4, 1, 0);
      v12 = v9;
    }
    else
    {
      v12 = 0;
    }
    v9->_encodeAnalysis = v11;
    v9->_frame.frame_idx_ = 0;
    *(_QWORD *)&v9->_cameraMotionConfidences[5][3] = 0;
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)prewarmWithWidth:(int)a3 height:(int)a4
{
  int result;
  int *Async;
  int *v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  if (self->_frame.histogram_.moments_hist_[1])
    return 0;
  result = 0;
  if (a4 >= 1 && a3 >= 1 && self->_queue)
  {
    Async = (int *)ma::EncodeStatsHW::CreateAsync(*(ma::EncodeStatsHW **)&a3, a4, LOBYTE(self->_flags), 1);
    self->_frame.histogram_.moments_hist_[1] = Async;
    if (Async)
    {
      *((_QWORD *)self->_encodeAnalysis + 12) = Async;
      v7 = self->_frame.histogram_.moments_hist_[1];
      v9 = v7[44];
      v8 = v7[45];
      v11 = v9 + 15;
      v10 = v9 < -15;
      v12 = v9 + 30;
      if (!v10)
        v12 = v11;
      v13 = v12 >> 4;
      v14 = v8 + 15;
      v10 = v8 < -15;
      v15 = v8 + 30;
      if (!v10)
        v15 = v14;
      return ma::EncodeAnalysis::Initialize((ma::EncodeAnalysis *)self->_encodeAnalysis, v13, v15 >> 4);
    }
    else
    {
      return -108;
    }
  }
  return result;
}

- (id).cxx_construct
{
  ma::Frame::Frame((ma::Frame *)&self->_frame);
  return self;
}

+ (float)autoLiveMotionScore:(id)a3
{
  int v3;
  int v4;
  int v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  float v16;
  float v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  void *v27;
  __int16 v28;
  float v29;
  float v30;
  id v32;
  int v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v3 = objc_msgSend(v32, "count");
  v4 = v3;
  if (v3 >= 5)
    v5 = 5;
  else
    v5 = v3;
  v6 = 1.0;
  if ((v5 & 0x80000000) == 0)
  {
    v7 = 0;
    v8 = (v5 + 1);
    while (1)
    {
      objc_msgSend(v32, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("flags"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      if ((v11 & 0x1000) != 0)
        break;
      if (v8 == ++v7)
        goto LABEL_10;
    }
    v6 = 0.05;
  }
LABEL_10:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v32;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v13)
  {
    v33 = 0;
    v14 = *(_QWORD *)v36;
    if (v4 >= 0)
      v15 = v4;
    else
      v15 = v4 + 1;
    v34 = v15 >> 1;
    v16 = 0.0;
    v17 = 0.0;
    do
    {
      v18 = 0;
      v19 = v33;
      v33 += v13;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("subjectMotionScore"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (!v22)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("subjectMotionScore"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          v25 = v24;

          *(float *)&v26 = v6;
          if (v19 + (int)v18 >= 6)
          {
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("flags"), v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "integerValue");

            LODWORD(v26) = 1.0;
            if ((v28 & 0x1000) != 0)
            {
              if (v19 + (int)v18 >= v34)
                *(float *)&v26 = 1.0;
              else
                *(float *)&v26 = 0.05;
            }
          }
          v16 = v16 + *(float *)&v26;
          v17 = v17 + (float)(*(float *)&v26 * (float)(v25 * v25));
        }
        ++v18;
      }
      while (v13 != v18);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);

    v29 = 1.0;
    if (v16 > 0.0)
    {
      v30 = fabsf(sqrtf(v17 / v16));
      if ((float)(v17 / v16) == -INFINITY)
        v29 = INFINITY;
      else
        v29 = v30;
    }
  }
  else
  {

    v29 = 1.0;
  }

  return v29;
}

- (VCPLightMotionAnalyzer)init
{

  return 0;
}

- (void)dealloc
{
  ma::EncodeAnalysis *encodeAnalysis;
  objc_super v4;

  encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
  if (encodeAnalysis)
  {
    ma::EncodeAnalysis::~EncodeAnalysis(encodeAnalysis);
    MEMORY[0x1BCCA12BC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPLightMotionAnalyzer;
  -[VCPLightMotionAnalyzer dealloc](&v4, sel_dealloc);
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  int result;
  Frame *p_frame;
  ma::EncodeAnalysis *encodeAnalysis;
  int v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  CMTime v15;
  CMTime v16;

  if (self->_queue)
    return -18;
  p_frame = &self->_frame;
  v16 = *(CMTime *)a4;
  v15 = *(CMTime *)a5;
  ma::Frame::Initialize((ma::Frame *)&self->_frame, &v16, &v15, a3, 0);
  if (!result)
  {
    encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
    v14 = *a4;
    result = ma::EncodeAnalysis::ProcessFrame(encodeAnalysis, (CMTime *)&v14, a3, (ma::Frame *)p_frame, 0, 0);
    if (!result)
    {
      result = -[VCPLightMotionAnalyzer cameraMotionDetection:](self, "cameraMotionDetection:", &p_frame->acc_var_.z_);
      if (!result)
      {
        result = -[VCPLightMotionAnalyzer computeMotionDivScore:](self, "computeMotionDivScore:", ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis));
        if (!result)
        {
          if (a6)
            *a6 |= *(_QWORD *)&self->_cameraMotionConfidences[5][3];
          result = 0;
          HIDWORD(self->_flags) = LODWORD(p_frame->motion_result_.confidence_[5]);
          if (p_frame->frame_idx_ == 2147483646)
            v13 = 0;
          else
            v13 = p_frame->frame_idx_ + 1;
          p_frame->frame_idx_ = v13;
        }
      }
    }
  }
  return result;
}

- (int)generateThresholds:(float)a3[6] withConfidences:(float)a4[6]
{
  uint64_t i;
  float v5;
  float v6;

  for (i = 0; i != 6; ++i)
  {
    v5 = a4[i];
    v6 = -4.5;
    if (v5 >= 0.1)
    {
      v6 = -0.1;
      if (v5 <= 0.9)
        v6 = (float)(v5 * 5.5) + -5.05;
    }
    a3[i] = v6;
  }
  return 0;
}

- (int)cameraMotionDetection:(void *)a3
{
  double v3;
  uint64_t v5;
  EncodeStatsHW **p_stats;
  int frame_idx;
  float *v8;
  uint64_t i;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];

  v5 = 0;
  v25[3] = *MEMORY[0x1E0C80C00];
  p_stats = &self->_stats;
  frame_idx = self->_frame.frame_idx_;
  v8 = &self->_cameraMotionParams[5][3];
  do
  {
    *(_DWORD *)((char *)&self->_stats + 4 * (frame_idx % 5) + v5 * 4) = *(_DWORD *)a3;
    self->_cameraMotionParams[5][frame_idx % 5 + 3 + v5] = *((float *)a3 + 6);
    v5 += 5;
    a3 = (char *)a3 + 4;
  }
  while (v5 != 30);
  memset(v25, 0, 24);
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  if (frame_idx >= 5)
  {
    for (i = 0; i != 6; ++i)
    {
      v10 = 0;
      v11 = *((float *)&v22 + i);
      v12 = *((float *)v25 + i);
      do
      {
        v11 = *(float *)((char *)p_stats + v10 * 4) + v11;
        v12 = v8[v10++] + v12;
      }
      while (v10 != 5);
      *((float *)&v22 + i) = v11;
      *((float *)v25 + i) = v12;
      p_stats = (EncodeStatsHW **)((char *)p_stats + 20);
      v8 += 5;
    }
    v13 = 0;
    LODWORD(v3) = 5.0;
    do
    {
      *(float *)((char *)&v22 + v13) = *(float *)((char *)&v22 + v13) / 5.0;
      *(float *)((char *)v25 + v13) = *(float *)((char *)v25 + v13) / 5.0;
      v13 += 4;
    }
    while (v13 != 24);
    -[VCPLightMotionAnalyzer generateThresholds:withConfidences:](self, "generateThresholds:withConfidences:", &v19, v25, v3);
    v14 = 0;
    v15 = 3.4028e38;
    do
    {
      if (*(float *)((char *)&v22 + v14) < v15)
        v15 = *(float *)((char *)&v22 + v14);
      v14 += 4;
    }
    while (v14 != 24);
    v16 = *(float *)&v23 < (float)(v15 * 0.5) && *(float *)&v23 < *(float *)&v20;
    v17 = 4096;
    if (!v16)
      v17 = 0;
    *(_QWORD *)&self->_cameraMotionConfidences[5][3] = *(_QWORD *)&self->_cameraMotionConfidences[5][3] & 0xFFFFFFFFFFFFEFFFLL | v17;
  }
  return 0;
}

- (int)computeMotionDivScore:(EncodeStats *)a3
{
  int var25;
  int var26;
  BOOL v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  float v12;
  float v13;
  float v14;
  unint64_t v15;
  BOOL *var1;
  uint64_t v17;
  float v19;
  int v20;
  float v21;
  float v22;

  if (!a3)
    return -18;
  var25 = a3->var25;
  var26 = a3->var26;
  v6 = var25 + 15;
  v5 = var25 < -15;
  v7 = var25 + 30;
  if (!v5)
    v7 = v6;
  v8 = v7 >> 4;
  v9 = var26 + 15;
  v5 = var26 < -15;
  v10 = var26 + 30;
  if (!v5)
    v10 = v9;
  v11 = (v10 >> 4) * v8;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  if (v11 >= 1)
  {
    v15 = 0;
    var1 = a3->var1;
    v17 = 2 * v11;
    do
    {
      if (*var1++)
      {
        v19 = (float)(HIBYTE(a3->var15[v15 / 2]) + HIBYTE(a3->var16[v15 / 2]));
        v13 = v13
            + (float)(v19
                    * (float)(vabds_f32((float)*((__int16 *)a3->var3 + v15), *(float *)&self->_frame.motion_result_.support_size_)+ vabds_f32((float)*((__int16 *)a3->var3 + v15 + 1), self->_frame.motion_result_.residual_var_)));
        v14 = v14 + (float)(v19 + 2.0);
      }
      v15 += 2;
    }
    while (v17 != v15);
  }
  v20 = 0;
  v21 = (float)(v13 / (float)(v14 + 10.0)) / 40.0;
  v22 = 1.0;
  if (v21 < 1.0)
    v22 = v21;
  if (v21 > 0.0)
    v12 = v22;
  *(float *)&self->_turbo = v12;
  return v20;
}

- (void)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 completion:(id)a6
{
  id v10;
  ma::EncodeStatsHW *Width;
  int32_t Height;
  int32_t v13;
  uint64_t v14;
  uint64_t v15;
  int *Async;
  _QWORD v17[5];
  id v18;
  __CVBuffer *v19;
  __int128 v20;
  int64_t v21;
  __int128 v22;
  int64_t var3;
  CMTime v24;
  CMTime v25;

  v10 = a6;
  CFRetain(a3);
  Width = (ma::EncodeStatsHW *)CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (!self->_queue)
  {
LABEL_9:
    v15 = 4294967278;
    goto LABEL_10;
  }
  v13 = Height;
  v25 = (CMTime)*a4;
  v24 = (CMTime)*a5;
  ma::Frame::Initialize((ma::Frame *)&self->_frame, &v25, &v24, a3, 0);
  v15 = v14;
  if (!(_DWORD)v14)
  {
    Async = self->_frame.histogram_.moments_hist_[1];
    if (Async
      || (Async = (int *)ma::EncodeStatsHW::CreateAsync(Width, v13, LOBYTE(self->_flags), 1),
          (self->_frame.histogram_.moments_hist_[1] = Async) != 0))
    {
      if (Async[44] == (_DWORD)Width && Async[45] == v13)
      {
        v22 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke;
        v17[3] = &unk_1E6B16B58;
        v20 = v22;
        v21 = var3;
        v17[4] = self;
        v19 = a3;
        v18 = v10;
        v15 = ma::EncodeStatsHW::ProcessFrameAsync((uint64_t)Async, (uint64_t)&v22, a3, v17);

        if (!(_DWORD)v15)
          goto LABEL_13;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
LABEL_10:
  if (a3)
    CFRelease(a3);
  (*((void (**)(id, _QWORD, uint64_t, float, float))v10 + 2))(v10, 0, v15, -1.0, -1.0);
LABEL_13:

}

void __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke_2;
  block[3] = &unk_1E6B16B30;
  block[1] = 3221225472;
  block[4] = v2;
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v5;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke_2(uint64_t a1, __n128 a2, __n128 a3)
{
  ma::EncodeStatsHW *v4;
  int v5;
  _QWORD *v6;
  ma::EncodeAnalysis *v7;
  ma::EncodeStats *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  uint64_t v13;
  CMTime v14;

  v4 = *(ma::EncodeStatsHW **)(*(_QWORD *)(a1 + 32) + 432);
  v5 = *((_DWORD *)v4 + 46);
  if (!v5)
  {
    v5 = ma::EncodeStatsHW::ParseStatsFromSampleBuffer(v4, *(CMSampleBufferRef *)(a1 + 48));
    if (!v5)
    {
      v6 = *(_QWORD **)(a1 + 32);
      v7 = (ma::EncodeAnalysis *)v6[1];
      v8 = (ma::EncodeStats *)v6[54];
      v14 = *(CMTime *)(a1 + 64);
      v5 = ma::EncodeAnalysis::AnalyzeFrame(v7, v8, &v14, *(CVPixelBufferRef *)(a1 + 56), (ma::Frame *)(v6 + 3), 0, 0);
      if (!v5)
      {
        v5 = objc_msgSend(*(id *)(a1 + 32), "cameraMotionDetection:", *(_QWORD *)(a1 + 32) + 152);
        if (!v5)
        {
          v5 = objc_msgSend(*(id *)(a1 + 32), "computeMotionDivScore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
          if (!v5)
          {
            *(_DWORD *)(*(_QWORD *)(a1 + 32) + 692) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 204);
            ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
            v9 = *(_QWORD *)(a1 + 32);
            v5 = 0;
            if (*(_DWORD *)(v9 + 24) == 0x7FFFFFFF)
              *(_DWORD *)(v9 + 24) = 0;
          }
        }
      }
    }
  }
  v10 = *(const void **)(a1 + 48);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(a1 + 56);
  if (v11)
    CFRelease(v11);
  if (v5)
  {
    a2.n128_u32[1] = -1074790400;
    a2.n128_f32[0] = -1.0;
    a3.n128_f32[0] = -1.0;
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    a2.n128_u32[0] = *(_DWORD *)(v13 + 692);
    a3.n128_u32[0] = *(_DWORD *)(v13 + 696);
  }
  return (*(uint64_t (**)(__n128, __n128))(*(_QWORD *)(a1 + 40) + 16))(a2, a3);
}

- (float)actionScore
{
  return *((float *)&self->_flags + 1);
}

- (float)motionDivScore
{
  return *(float *)&self->_turbo;
}

- (void).cxx_destruct
{
  Frame *p_frame;

  p_frame = &self->_frame;
  ma::Histogram::~Histogram((ma::Histogram *)&self->_frame.colorfulness_score_);
  ma::MotionResult::~MotionResult((ma::MotionResult *)&p_frame->acc_var_.z_);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
