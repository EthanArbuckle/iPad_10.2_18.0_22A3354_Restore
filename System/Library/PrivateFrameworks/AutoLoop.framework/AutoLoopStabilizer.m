@implementation AutoLoopStabilizer

- (AutoLoopStabilizer)init
{
  char *v2;
  char *v3;
  __int128 *v4;
  __int128 *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AutoLoopStabilizer;
  v2 = -[AutoLoopStabilizer init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)(v2 + 60) = 4294967294;
    v4 = (__int128 *)MEMORY[0x1E0CA2E10];
    v17 = *MEMORY[0x1E0CA2E10];
    v18 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
    objc_msgSend(v2, "setRefFrameTime:", &v17);
    v15 = *MEMORY[0x1E0CA2E18];
    v16 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    objc_msgSend(v3, "setMinimumFrameDuration:", &v15);
    v5 = (__int128 *)MEMORY[0x1E0CA2E68];
    v13 = *MEMORY[0x1E0CA2E68];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v3, "setMaxAllowedTrimTimeStart:", &v13);
    v11 = *v5;
    v12 = *((_QWORD *)v5 + 2);
    objc_msgSend(v3, "setMaxAllowedTrimTimeEnd:", &v11);
    *((_DWORD *)v3 + 14) = -8888;
    v3[10] = 1;
    *(_OWORD *)(v3 + 24) = xmmword_1D4C953A0;
    *((_QWORD *)v3 + 5) = 0x3F59999A3F266666;
    objc_msgSend(v3, "setUseLimitedTime:", 0);
    v9 = *v4;
    v10 = *((_QWORD *)v4 + 2);
    objc_msgSend(v3, "setTrimStart:", &v9);
    v7 = *v4;
    v8 = *((_QWORD *)v4 + 2);
    objc_msgSend(v3, "setTrimLength:", &v7);
    objc_msgSend(v3, "setDisableGPUStabilization:", 0);
    objc_msgSend(v3, "setOptimizeProcessingForMemory:", 0);
  }
  return (AutoLoopStabilizer *)v3;
}

- (void)dealloc
{
  objc_super v3;

  ICDestroyResult();
  self->icCorrectionResultRef = 0;
  v3.receiver = self;
  v3.super_class = (Class)AutoLoopStabilizer;
  -[AutoLoopStabilizer dealloc](&v3, sel_dealloc);
}

- (unint64_t)FindFrameIndexForReferenceTimeInHomographies:(const void *)a3
{
  int32_t v5;
  unint64_t v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_refFrameTime;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMTimeEpoch v11;
  $95D729B680665BEAEFA1D6FCA8238556 v13;
  CMTime v14;
  CMTime time2;
  CMTime time1;

  time1 = (CMTime)self->refFrameTime;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  v5 = CMTimeCompare(&time1, &time2);
  v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  if (!v5)
    return v6 >> 1;
  p_refFrameTime = &self->refFrameTime;
  v8 = -1431655765 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  v9 = 24 * v6 - 24;
  while ((int)v8 >= 1)
  {
    --v8;
    v10 = *(_QWORD *)a3 + v9;
    v11 = *(_QWORD *)(v10 + 16);
    *(_OWORD *)&v14.value = *(_OWORD *)v10;
    v14.epoch = v11;
    v13 = *p_refFrameTime;
    v9 -= 24;
    if (CMTimeCompare(&v14, (CMTime *)&v13) <= 0)
      return v8;
  }
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)GetPreciseReferenceTimeFromHomographies:(SEL)a3
{
  uint64_t v6;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
  {
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE FindFrameIndexForReferenceTimeInHomographies:](self, "FindFrameIndexForReferenceTimeInHomographies:");
    v6 = *(_QWORD *)a4 + 24 * (_QWORD)self;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v6;
    retstr->var3 = *(_QWORD *)(v6 + 16);
  }
  return self;
}

- (float)CropRatio:(const CGRect *)a3
{
  float32x2_t v3;

  v3 = vcvt_f32_f64(vdivq_f64((float64x2_t)a3->size, (float64x2_t)self->inputMovieDimensions));
  if (v3.f32[0] >= v3.f32[1])
    v3.f32[0] = v3.f32[1];
  return v3.f32[0];
}

- (BOOL)CropRectValid:(const CGRect *)a3
{
  double width;
  double height;
  CGFloat x;
  CGFloat y;
  CGRect v9;

  width = a3->size.width;
  height = a3->size.height;
  if (width < 1.0 || height < 1.0)
    return 0;
  x = a3->origin.x;
  y = a3->origin.y;
  v9.size.width = self->inputMovieDimensions.width;
  v9.size.height = self->inputMovieDimensions.height;
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  return CGRectIntersectsRect(*(CGRect *)(&width - 2), v9);
}

- (id)getVideoTrack
{
  void *v2;
  void *v3;
  void *v4;

  -[AutoLoopStabilizer movieAssetIn](self, "movieAssetIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)getNaturalTimeScaleForVideoTrackInAsset
{
  void *v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  -[AutoLoopStabilizer getVideoTrack](self, "getVideoTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[AutoLoopStabilizer setNaturalTimeScale:](self, "setNaturalTimeScale:", objc_msgSend(v3, "naturalTimeScale"));
    objc_msgSend(v4, "minFrameDuration");
    v6 = v8;
    v7 = v9;
    -[AutoLoopStabilizer setMinimumFrameDuration:](self, "setMinimumFrameDuration:", &v6);
  }

  return v4 != 0;
}

- ($4C6D1E162277694FB76656457146213A)determinePreciseTimeRange
{
  uint64_t v5;
  __int128 v6;
  int64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  CMTimeEpoch epoch;
  int32_t v13;
  CMTime *v14;
  $4C6D1E162277694FB76656457146213A *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime time2;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  _BYTE v29[32];
  __int128 v30;
  __int128 v31;
  _BYTE v32[32];

  v5 = MEMORY[0x1E0CA2E10];
  v6 = *MEMORY[0x1E0CA2E10];
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E10];
  v7 = *(_QWORD *)(v5 + 16);
  retstr->var0.var3 = v7;
  *(_OWORD *)&retstr->var1.var0 = v6;
  retstr->var1.var3 = v7;
  -[AutoLoopStabilizer getVideoTrack](self, "getVideoTrack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "timeRange");
    v10 = *(_OWORD *)&v29[16];
    v31 = *(_OWORD *)v29;
    *(_OWORD *)v32 = *(_OWORD *)&v29[16];
    v11 = v30;
    *(_OWORD *)&v32[16] = v30;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v29;
    *(_OWORD *)&retstr->var0.var3 = v10;
    *(_OWORD *)&retstr->var1.var1 = v11;
    if (-[AutoLoopStabilizer useLimitedTime](self, "useLimitedTime"))
    {
      memset(v29, 0, 24);
      *(_OWORD *)&lhs.value = v31;
      lhs.epoch = *(_QWORD *)v32;
      rhs = *(CMTime *)&v32[8];
      CMTimeAdd((CMTime *)v29, &lhs, &rhs);
      -[AutoLoopStabilizer trimStart](self, "trimStart");
      *(_OWORD *)&time2.value = v31;
      time2.epoch = *(_QWORD *)v32;
      if (CMTimeCompare(&time1, &time2) < 1)
      {
        *(_OWORD *)&retstr->var0.var0 = v31;
        epoch = *(_QWORD *)v32;
      }
      else
      {
        -[AutoLoopStabilizer trimStart](self, "trimStart");
        *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v24.value;
        epoch = v24.epoch;
      }
      retstr->var0.var3 = epoch;
      memset(&v24, 0, sizeof(v24));
      *(_OWORD *)&v23.value = *(_OWORD *)&retstr->var0.var0;
      v23.epoch = epoch;
      -[AutoLoopStabilizer trimLength](self, "trimLength");
      CMTimeAdd(&v24, &v23, &v22);
      v20 = v24;
      v19 = *(CMTime *)v29;
      v13 = CMTimeCompare(&v20, &v19);
      v14 = &v24;
      if (v13 > 0)
        v14 = (CMTime *)v29;
      v21 = *v14;
      v17 = v21;
      var0 = retstr->var0;
      CMTimeSubtract(&v18, &v17, (CMTime *)&var0);
      retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;
    }
  }

  return result;
}

- (BOOL)CheckForTripodOKInHomographies:(const void *)a3 firstIndex:(unint64_t)a4 lastIndex:(unint64_t)a5 refIndex:(unint64_t)a6 cropRectOut:(CGRect *)a7 minConfidence:(float)a8 confidenceOut:(float *)a9
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  char CanDoTripod;
  id v21;
  void *v22;
  float v23;
  float v24;
  BOOL v25;

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D3AA70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D3AAA0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D3AAB0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (_QWORD *)MEMORY[0x1E0D3AAB8];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D3AAB8]);

  CanDoTripod = ICCalcCanDoTripod();
  v21 = 0;
  objc_msgSend(v21, "objectForKeyedSubscript:", *v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;

  if (a9)
    *a9 = v24;
  if (v24 >= a8)
    v25 = CanDoTripod;
  else
    v25 = 0;

  return v25;
}

- (BOOL)tripodOKWithTrimming:(const void *)a3 frameTimes:(const void *)a4 minConfidence:(float)a5
{
  CMTime *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CMTime *v19;
  char *v20;
  CMTimeEpoch v21;
  int32_t v22;
  double v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  CMTimeEpoch v29;
  unint64_t v30;
  double v31;
  int64_t v32;
  CMTime *v33;
  unint64_t v34;
  _BOOL4 v35;
  double v36;
  uint64_t v37;
  unint64_t v38;
  BOOL v39;
  CMTime *v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  CMTimeEpoch epoch;
  float v49;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime rhs;
  CMTime lhs;
  CMTime v60;
  CMTime v61;
  float v62;
  CMTime v63;
  CMTime v64;
  CMTime time2;
  CMTime time1;
  float v67;
  _BYTE v68[32];

  if (!a3)
  {
    LOBYTE(v11) = 0;
    return v11;
  }
  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1))
    goto LABEL_31;
  v67 = 0.0;
  -[AutoLoopStabilizer setDidDrop:](self, "setDidDrop:", 0);
  -[AutoLoopStabilizer maxAllowedTrimTimeStart](self, "maxAllowedTrimTimeStart");
  v9 = (CMTime *)MEMORY[0x1E0CA2E68];
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    -[AutoLoopStabilizer maxAllowedTrimTimeEnd](self, "maxAllowedTrimTimeEnd");
    v63 = *v9;
    v10 = CMTimeCompare(&v64, &v63) > 0;
  }
  else
  {
    v10 = 1;
  }
  self->droppedStartFrameCount = 0;
  self->droppedEndFrameCount = 0;
  v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3) - 1;
  v13 = -[AutoLoopStabilizer FindFrameIndexForReferenceTimeInHomographies:](self, "FindFrameIndexForReferenceTimeInHomographies:", a4);
  *(float *)&v14 = a5;
  if (-[AutoLoopStabilizer CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:](self, "CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:", a3, 0, v12, v13, v68, &v67, v14))
  {
    -[AutoLoopStabilizer CropRatio:](self, "CropRatio:", v68);
    v15 = v67;
LABEL_9:
    self->_lastTripodQuality = v15;
    if (v15 >= a5)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      self->_lastTripodQuality = 0.0;
    }
    return v11;
  }
  if (!v10)
  {
LABEL_31:
    LOBYTE(v11) = 0;
    return v11;
  }
  v62 = 0.0;
  v61 = *(CMTime *)(*((_QWORD *)a4 + 1) - 24);
  memset(&v60, 0, sizeof(v60));
  lhs = v61;
  -[AutoLoopStabilizer maxAllowedTrimTimeEnd](self, "maxAllowedTrimTimeEnd");
  CMTimeSubtract(&v60, &lhs, &rhs);
  v16 = (*((_QWORD *)a4 + 1) - *(_QWORD *)a4) / 24;
  v17 = 24 * v16 - 48;
  while (1)
  {
    v18 = v16;
    v19 = *(CMTime **)a4;
    if (v18 < 2)
      break;
    v57 = v60;
    v20 = (char *)v19 + v17;
    v21 = *((_QWORD *)v20 + 2);
    *(_OWORD *)&v56.value = *(_OWORD *)v20;
    v56.epoch = v21;
    v22 = CMTimeCompare(&v57, &v56);
    v17 -= 24;
    v16 = v18 - 1;
    if ((v22 & 0x80000000) == 0)
    {
      v19 = *(CMTime **)a4;
      break;
    }
  }
  v55 = *v19;
  memset(&v54, 0, sizeof(v54));
  v53 = v55;
  -[AutoLoopStabilizer maxAllowedTrimTimeStart](self, "maxAllowedTrimTimeStart");
  CMTimeAdd(&v54, &v53, &v52);
  v24 = 0;
  v25 = v18 - 1;
  v26 = (v18 - 1) & ~((v18 - 1) >> 63);
  v27 = 24;
  while (v26 != v24)
  {
    v51 = v54;
    ++v24;
    v28 = *(_QWORD *)a4 + v27;
    v29 = *(_QWORD *)(v28 + 16);
    *(_OWORD *)&v50.value = *(_OWORD *)v28;
    v50.epoch = v29;
    v27 += 24;
    if (CMTimeCompare(&v51, &v50) <= 0)
    {
      v26 = v24 - 1;
      break;
    }
  }
  if (v26 >= v13)
    v26 = v13;
  if (v25 <= v13)
    v30 = v13;
  else
    v30 = v25;
  *(float *)&v23 = a5;
  v11 = -[AutoLoopStabilizer CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:](self, "CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:", a3, v26, v30, v13, v68, &v62, v23);
  if (v11)
  {
    v15 = v62;
    v49 = 0.0;
    if (v26)
    {
      *(float *)&v31 = a5;
      if (-[AutoLoopStabilizer CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:](self, "CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:", a3, v26 - 1, v30, v13, v68, &v49, v31))
      {
        while (1)
        {
          v15 = v49;
          v32 = v26 - 2;
          if (v26 < 2)
            break;
          *(float *)&v31 = a5;
          --v26;
          if (!-[AutoLoopStabilizer CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:](self, "CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:", a3, v32, v30, v13, v68, &v49, v31))goto LABEL_35;
        }
        v26 = 0;
      }
    }
LABEL_35:
    v33 = *(CMTime **)a4;
    v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
    if (v30 < v34 - 1)
    {
      *(float *)&v31 = a5;
      v35 = -[AutoLoopStabilizer CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:](self, "CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:", a3, v26, v30 + 1, v13, v68, &v49, v31);
      v33 = *(CMTime **)a4;
      v37 = *((_QWORD *)a4 + 1);
      if (v35)
      {
        if (v13 <= v25)
          v38 = v25;
        else
          v38 = v13;
        while (1)
        {
          v30 = v38 + 1;
          v15 = v49;
          v34 = 0xAAAAAAAAAAAAAAABLL * ((v37 - (uint64_t)v33) >> 3);
          if (v38 + 1 >= v34 - 1)
            break;
          *(float *)&v36 = a5;
          v39 = -[AutoLoopStabilizer CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:](self, "CheckForTripodOKInHomographies:firstIndex:lastIndex:refIndex:cropRectOut:minConfidence:confidenceOut:", a3, v26, v38 + 2, v13, v68, &v49, v36);
          v33 = *(CMTime **)a4;
          v37 = *((_QWORD *)a4 + 1);
          v38 = v30;
          if (!v39)
            goto LABEL_42;
        }
      }
      else
      {
LABEL_42:
        v34 = 0xAAAAAAAAAAAAAAABLL * ((v37 - (uint64_t)v33) >> 3);
      }
    }
    self->droppedStartFrameCount = v26;
    self->droppedEndFrameCount = v34 + ~v30;
    v40 = &v33[v26];
    v41 = *(_OWORD *)&v40->value;
    epoch = v40->epoch;
    v47 = v41;
    -[AutoLoopStabilizer setFirstFrameTimeAfterDrop:](self, "setFirstFrameTimeAfterDrop:", &v47);
    v42 = *(_QWORD *)a4 + 24 * v30;
    v43 = *(_QWORD *)(v42 + 16);
    v45 = *(_OWORD *)v42;
    v46 = v43;
    -[AutoLoopStabilizer setLastFrameTimeAfterDrop:](self, "setLastFrameTimeAfterDrop:", &v45);
    -[AutoLoopStabilizer setDidDrop:](self, "setDidDrop:", 1);
    goto LABEL_9;
  }
  return v11;
}

- (BOOL)updateStabilizerStatus
{
  uint64_t (**statusUpdateBlock)(float);

  statusUpdateBlock = (uint64_t (**)(float))self->_statusUpdateBlock;
  if (statusUpdateBlock)
    return statusUpdateBlock[2](self->progressValue);
  else
    return 1;
}

- (void)ICReportProgress:(float)a3
{
  -[AutoLoopStabilizer setProgressValue:](self, "setProgressValue:");
  if (!-[AutoLoopStabilizer updateStabilizerStatus](self, "updateStabilizerStatus"))
    self->canceledAnalysis = 1;
}

- (BOOL)ICShouldBeCanceled
{
  return self->canceledAnalysis != 0;
}

- (int)analyzeForAutoloopWithDirect:(BOOL)a3 toAnalysisOutput:(void *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSString *currentStatusString;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int32_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  char *v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  char *v39;
  char *v40;
  id v41;
  char *v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  _OWORD v52[3];
  CMTime v53;
  CMTime v54;
  CMTime v55;
  __int128 v56;
  _BYTE v57[32];
  void *__p;
  char *v59;
  char *v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  _OWORD v66[2];
  CMTime v67;
  CMTime v68;
  CMTime v69;
  CMTime v70;
  CMTime v71;
  CMTime v72;
  CMTime v73;
  CMTime v74;
  CMTime v75;
  CMTime v76;
  CMTime v77;
  CMTime v78;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  CMTime v82;
  CMTime duration;
  CMTime start;
  CMTimeRange v85;
  CMTime v86;
  CMTime v87;
  CMTime v88;
  CMTime v89;
  CMTime v90;
  CMTime v91;
  CMTime v92;
  CMTime v93;
  CMTime v94;
  CMTime v95;
  CMTime v96;
  CMTime v97;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTime v101;
  CMTime v102;
  CMTime rhs;
  CMTime lhs;
  CMTime v105;
  CMTime v106;
  CMTime v107;

  if (a3)
    NSLog(CFSTR("Error: doDirectTripod not yet supported, falling back to sequential.\n"), a2);
  self->canceledAnalysis = 0;
  v6 = (void *)MEMORY[0x1D82662EC](self, a2);
  -[AutoLoopStabilizer statsFileOutURL](self, "statsFileOutURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AutoLoopStabilizer statsFileOutURL](self, "statsFileOutURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "cStringUsingEncoding:", 4);

  }
  -[AutoLoopStabilizer getNaturalTimeScaleForVideoTrackInAsset](self, "getNaturalTimeScaleForVideoTrackInAsset");
  memset(v66, 0, sizeof(v66));
  v65 = 0u;
  -[AutoLoopStabilizer determinePreciseTimeRange](self, "determinePreciseTimeRange");
  currentStatusString = self->currentStatusString;
  self->currentStatusString = (NSString *)CFSTR("Stabilizing: sequential analyze");

  self->canceledAnalysis = !-[AutoLoopStabilizer updateStabilizerStatus](self, "updateStabilizerStatus");
  if (self->canceledAnalysis)
  {
    v11 = 0;
    v12 = -8888;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AutoLoopStabilizer disableGPUStabilization](self, "disableGPUStabilization"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D3A9D8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AutoLoopStabilizer optimizeProcessingForMemory](self, "optimizeProcessingForMemory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D3AA20]);

    if ((BYTE12(v65) & 1) != 0
      && (BYTE4(v66[1]) & 1) != 0
      && !*((_QWORD *)&v66[1] + 1)
      && (*((_QWORD *)&v66[0] + 1) & 0x8000000000000000) == 0)
    {
      v63 = v65;
      v64 = *(_QWORD *)&v66[0];
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v63);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D3AA60]);

      v61 = *(_OWORD *)((char *)v66 + 8);
      v62 = *((_QWORD *)&v66[1] + 1);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v61);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D3AA58]);

    }
    if (self->doLoopClosureCorrection)
    {
      v56 = v65;
      *(_OWORD *)v57 = v66[0];
      *(_OWORD *)&v57[16] = v66[1];
      v18 = -[AutoLoopStabilizer naturalTimeScale](self, "naturalTimeScale");
      -[AutoLoopStabilizer minimumFrameDuration](self, "minimumFrameDuration");
      -[AutoLoopStabilizer maxAllowedTrimTimeStart](self, "maxAllowedTrimTimeStart");
      -[AutoLoopStabilizer maxAllowedTrimTimeEnd](self, "maxAllowedTrimTimeEnd");
      memset(&v105, 0, sizeof(v105));
      lhs.epoch = *(_QWORD *)v57;
      *(_OWORD *)&lhs.value = v56;
      rhs = *(CMTime *)&v57[8];
      CMTimeAdd(&v105, &lhs, &rhs);
      memset(&v102, 0, sizeof(v102));
      CMTimeMakeWithSeconds(&v102, 1.0, v18);
      memset(&v101, 0, sizeof(v101));
      time1 = v102;
      time = v55;
      CMTimeMultiply(&time2, &time, 15);
      CMTimeMaximum(&v101, &time1, &time2);
      *(_OWORD *)&v97.value = v56;
      v97.epoch = *(_QWORD *)v57;
      v95 = v55;
      CMTimeMultiply(&v96, &v95, 2);
      CMTimeAdd(&v107, &v97, &v96);
      v94 = v105;
      v92 = v55;
      CMTimeMultiply(&v93, &v92, 3);
      CMTimeSubtract(&v106, &v94, &v93);
      __p = 0;
      v59 = 0;
      v60 = 0;
      v91 = v107;
      v90 = v106;
      if (CMTimeCompare(&v91, &v90) < 0)
      {
        v88 = v106;
        v87 = v107;
        CMTimeSubtract(&v89, &v88, &v87);
        v86 = v101;
        if ((CMTimeCompare(&v89, &v86) & 0x80000000) == 0)
        {
          start = v107;
          v82 = v106;
          v81 = v107;
          CMTimeSubtract(&duration, &v82, &v81);
          CMTimeRangeMake(&v85, &start, &duration);
          v19 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (_BYTE *)__p) >> 4) + 1;
          if (v19 > 0x555555555555555)
            sub_1D4C590D0();
          if (0x5555555555555556 * ((v60 - (_BYTE *)__p) >> 4) > v19)
            v19 = 0x5555555555555556 * ((v60 - (_BYTE *)__p) >> 4);
          if (0xAAAAAAAAAAAAAAABLL * ((v60 - (_BYTE *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL)
            v20 = 0x555555555555555;
          else
            v20 = v19;
          if (v20)
            v21 = (char *)sub_1D4C5B64C((uint64_t)&v60, v20);
          else
            v21 = 0;
          v22 = &v21[16 * ((v59 - (_BYTE *)__p) >> 4)];
          v23 = *(_OWORD *)&v85.start.value;
          v24 = *(_OWORD *)&v85.duration.timescale;
          *((_OWORD *)v22 + 1) = *(_OWORD *)&v85.start.epoch;
          *((_OWORD *)v22 + 2) = v24;
          *(_OWORD *)v22 = v23;
          __p = v22;
          v60 = &v21[48 * v20];
          v59 = v22 + 48;
        }
      }
      *(_OWORD *)&v80.value = v56;
      v80.epoch = *(_QWORD *)v57;
      v79 = v54;
      CMTimeAdd(&v85.start, &v80, &v79);
      v107 = v85.start;
      v78 = v105;
      v77 = v53;
      CMTimeSubtract(&v85.start, &v78, &v77);
      v106 = v85.start;
      v76 = v107;
      v75 = v85.start;
      if (CMTimeCompare(&v76, &v75) < 0)
      {
        v73 = v106;
        v72 = v107;
        CMTimeSubtract(&v74, &v73, &v72);
        v71 = v101;
        if ((CMTimeCompare(&v74, &v71) & 0x80000000) == 0)
        {
          v70 = v107;
          v68 = v106;
          v67 = v107;
          CMTimeSubtract(&v69, &v68, &v67);
          CMTimeRangeMake(&v85, &v70, &v69);
          v25 = v59;
          if (v59 >= v60)
          {
            v29 = (char *)__p;
            v30 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (_BYTE *)__p) >> 4) + 1;
            if (v30 > 0x555555555555555)
              sub_1D4C590D0();
            if (0x5555555555555556 * ((v60 - (_BYTE *)__p) >> 4) > v30)
              v30 = 0x5555555555555556 * ((v60 - (_BYTE *)__p) >> 4);
            if (0xAAAAAAAAAAAAAAABLL * ((v60 - (_BYTE *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL)
              v31 = 0x555555555555555;
            else
              v31 = v30;
            if (v31)
            {
              v32 = (char *)sub_1D4C5B64C((uint64_t)&v60, v31);
              v29 = (char *)__p;
              v25 = v59;
            }
            else
            {
              v32 = 0;
            }
            v33 = &v32[16 * ((v59 - (_BYTE *)__p) >> 4)];
            v34 = *(_OWORD *)&v85.start.value;
            v35 = *(_OWORD *)&v85.duration.timescale;
            *((_OWORD *)v33 + 1) = *(_OWORD *)&v85.start.epoch;
            *((_OWORD *)v33 + 2) = v35;
            v36 = &v32[48 * v31];
            *(_OWORD *)v33 = v34;
            v28 = v33 + 48;
            if (v25 == v29)
            {
              v39 = v33;
            }
            else
            {
              do
              {
                v37 = *((_OWORD *)v25 - 3);
                v38 = *((_OWORD *)v25 - 1);
                v39 = v33 - 48;
                *((_OWORD *)v33 - 2) = *((_OWORD *)v25 - 2);
                *((_OWORD *)v33 - 1) = v38;
                *((_OWORD *)v33 - 3) = v37;
                v25 -= 48;
                v33 -= 48;
              }
              while (v25 != v29);
            }
            __p = v39;
            v59 = v28;
            v60 = v36;
            if (v29)
              operator delete(v29);
          }
          else
          {
            v26 = *(_OWORD *)&v85.start.value;
            v27 = *(_OWORD *)&v85.duration.timescale;
            *((_OWORD *)v59 + 1) = *(_OWORD *)&v85.start.epoch;
            *((_OWORD *)v25 + 2) = v27;
            *(_OWORD *)v25 = v26;
            v28 = v25 + 48;
          }
          v59 = v28;
        }
      }
      v40 = (char *)__p;
      if (__p != v59)
      {
        v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v42 = (char *)__p;
        v43 = v59;
        do
        {
          v45 = *((_OWORD *)v42 + 1);
          v44 = *((_OWORD *)v42 + 2);
          v52[0] = *(_OWORD *)v42;
          v52[1] = v45;
          v52[2] = v44;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", v52);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v46);

          v42 += 48;
        }
        while (v42 != v43);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D3AA18]);

        v40 = (char *)__p;
      }
      if (v40)
      {
        v59 = v40;
        operator delete(v40);
      }
    }
    LODWORD(v85.start.value) = 0;
    -[AutoLoopStabilizer movieAssetIn](self, "movieAssetIn");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)ICAnalyzeInputMotion();

    v12 = 2 * (LODWORD(v85.start.value) == 0);
  }
  objc_autoreleasePoolPop(v6);
  if (self->canceledAnalysis)
    v48 = -1;
  else
    v48 = v12;
  if ((v48 - 1) > 0xFFFFFFFD)
  {
    ICDestroyResult();
  }
  else
  {
    ICGetResultStats();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x1E0D3AA50]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "getValue:size:", &self->inputMovieDimensions, 16);
    *a4 = v11;

  }
  self->_analysisResult = v48;
  return v48;
}

- (int)FindAcceptableTripodSegmentForInput:(const void *)a3 frameTimes:(const void *)a4
{
  double v4;
  double v8;

  *(float *)&v4 = self->confidenceHighQualityThreshold;
  if (-[AutoLoopStabilizer tripodOKWithTrimming:frameTimes:minConfidence:](self, "tripodOKWithTrimming:frameTimes:minConfidence:", v4))
  {
    return 1;
  }
  if (self->onlyProcessForHighQualityTripod)
    return -3;
  *(float *)&v8 = self->minConfidenceForTripodAccept;
  if (!-[AutoLoopStabilizer tripodOKWithTrimming:frameTimes:minConfidence:](self, "tripodOKWithTrimming:frameTimes:minConfidence:", a3, a4, v8))return -3;
  if (self->_lastTripodQuality >= self->minimumHighQualityConfidenceValue)
    return 1;
  return 2;
}

- (int)processStabilizationAnalysis:(void *)a3 forcePassThru:(BOOL)a4 forceSmoothing:(BOOL)a5 forceSequentialTripod:(BOOL)a6
{
  AutoLoopStabilizer *v10;
  NSDictionary *featuresDictionary;
  int v12;
  int result;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _OWORD *v18;
  __int128 v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  __int128 v26;
  char *v27;
  char *v28;
  char *v29;
  __int128 v30;
  int v31;
  float v32;
  BOOL v33;
  char v34;
  float v35;
  char *v36;
  _BYTE *v37;
  int64_t droppedStartFrameCount;
  int64_t droppedEndFrameCount;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSDictionary *v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  _QWORD *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSDictionary *v59;
  BOOL v60;
  char v61;
  void *v62;
  AutoLoopStabilizer *v63;
  CMTime v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  void *__p;
  _QWORD *v70;
  char *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v10 = self;
  featuresDictionary = self->featuresDictionary;
  self->featuresDictionary = 0;

  v10->_lastTripodQuality = 0.0;
  ICDestroyResult();
  v10->icCorrectionResultRef = 0;
  v63 = v10;
  if (!a4)
  {
    ICGetResultFramePresentationTimes();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    __p = 0;
    v70 = 0;
    v71 = 0;
    sub_1D4C5B0B0(&__p, objc_msgSend(v62, "count"));
    v60 = a6;
    v61 = a5;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v14 = v62;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v66 != v16)
            objc_enumerationMutation(v14);
          CMTimeMakeFromDictionary(&v64, *(CFDictionaryRef *)(*((_QWORD *)&v65 + 1) + 8 * i));
          v18 = v70;
          if (v70 >= (_QWORD *)v71)
          {
            v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v70 - (_BYTE *)__p) >> 3);
            v22 = v21 + 1;
            if (v21 + 1 > 0xAAAAAAAAAAAAAAALL)
              sub_1D4C590D0();
            if (0x5555555555555556 * ((v71 - (_BYTE *)__p) >> 3) > v22)
              v22 = 0x5555555555555556 * ((v71 - (_BYTE *)__p) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v71 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
              v23 = 0xAAAAAAAAAAAAAAALL;
            else
              v23 = v22;
            if (v23)
              v24 = (char *)sub_1D4C59158((uint64_t)&v71, v23);
            else
              v24 = 0;
            v25 = &v24[24 * v21];
            v26 = *(_OWORD *)&v64.value;
            *((_QWORD *)v25 + 2) = v64.epoch;
            *(_OWORD *)v25 = v26;
            v28 = (char *)__p;
            v27 = (char *)v70;
            v29 = v25;
            if (v70 != __p)
            {
              do
              {
                v30 = *(_OWORD *)(v27 - 24);
                *((_QWORD *)v29 - 1) = *((_QWORD *)v27 - 1);
                *(_OWORD *)(v29 - 24) = v30;
                v29 -= 24;
                v27 -= 24;
              }
              while (v27 != v28);
              v27 = (char *)__p;
            }
            v20 = v25 + 24;
            __p = v29;
            v70 = v25 + 24;
            v71 = &v24[24 * v23];
            if (v27)
              operator delete(v27);
          }
          else
          {
            v19 = *(_OWORD *)&v64.value;
            v70[2] = v64.epoch;
            *v18 = v19;
            v20 = (_QWORD *)v18 + 3;
          }
          v70 = v20;
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v15);
    }

    if ((v61 & 1) != 0)
    {
      v12 = -2;
    }
    else
    {
      v31 = -[AutoLoopStabilizer FindAcceptableTripodSegmentForInput:frameTimes:](v63, "FindAcceptableTripodSegmentForInput:frameTimes:", a3, &__p);
      v12 = v31;
      if (v60 || (v31 - 1) <= 1)
      {
        v37 = __p;
        v36 = (char *)v70;
        droppedStartFrameCount = v63->droppedStartFrameCount;
        droppedEndFrameCount = v63->droppedEndFrameCount;
        v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", droppedStartFrameCount);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D3AA70]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ~droppedEndFrameCount - 0x5555555555555555 * ((v36 - v37) >> 3));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D3AAA0]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[AutoLoopStabilizer FindFrameIndexForReferenceTimeInHomographies:](v63, "FindFrameIndexForReferenceTimeInHomographies:", &__p));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0D3AAB0]);

        LODWORD(v64.value) = 0;
        v63->icCorrectionResultRef = (void *)ICCalcTripodCorrections();
        if (ICGetCorrectionResultCropData() && !CGRectIsEmpty(v63->cropRect))
        {
          v44 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (_QWORD *)MEMORY[0x1E0D3AAC0];
          objc_msgSend(v44, "dictionaryWithObject:forKey:", v45, *MEMORY[0x1E0D3AAC0]);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          ICGetResultOptionalData();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKeyedSubscript:", *v46);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v63->featuresDictionary;
          v63->featuresDictionary = (NSDictionary *)v49;

        }
        else
        {
          v12 = 0;
        }

        goto LABEL_44;
      }
    }
    if (!v63->onlyProcessForHighQualityTripod)
    {
      ICGetResultConfidence();
      v33 = v32 == 0.0;
      LODWORD(v64.value) = 0;
      v63->icCorrectionResultRef = (void *)ICCalcSmoothingCorrections();
      if (LODWORD(v64.value) || !ICGetCorrectionResultCropData())
        goto LABEL_38;
      -[AutoLoopStabilizer CropRatio:](v63, "CropRatio:", &v63->cropRect);
      v34 = v33 & ~v61;
      if (v35 < v63->cropRatioMinimum)
        v34 = 1;
      if ((v34 & 1) != 0)
      {
LABEL_38:
        ICDestroyResult();
        v63->icCorrectionResultRef = 0;
      }
      else
      {
        v53 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (_QWORD *)MEMORY[0x1E0D3AAC0];
        objc_msgSend(v53, "dictionaryWithObject:forKey:", v54, *MEMORY[0x1E0D3AAC0]);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        ICGetResultOptionalData();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectForKeyedSubscript:", *v55);
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = v63->featuresDictionary;
        v63->featuresDictionary = (NSDictionary *)v58;

        v12 = 3;
      }
    }
LABEL_44:
    if (__p)
    {
      v70 = __p;
      operator delete(__p);
    }

    v10 = v63;
    if (v63->icCorrectionResultRef)
      goto LABEL_49;
    goto LABEL_47;
  }
  v12 = -2;
LABEL_47:
  if (!v10->onlyProcessForHighQualityTripod)
  {
    LODWORD(__p) = 0;
    v63->icCorrectionResultRef = (void *)ICCalcPassThruCorrections();
    ICGetCorrectionResultCropData();
    v12 = 4;
    v10 = v63;
  }
LABEL_49:
  v51 = -[AutoLoopStabilizer CropRectValid:](v10, "CropRectValid:", &v10->cropRect);
  if (v12 == -3)
    v52 = 1;
  else
    v52 = v51;
  if (v52)
    result = v12;
  else
    result = 0;
  v63->_lastStabilizationResult = result;
  return result;
}

- (int)processStabilizationAnalysisForCinematicL1:(void *)a3
{
  NSDictionary *featuresDictionary;
  float v5;
  float v6;
  int v7;
  int result;

  if (!a3)
    return 0;
  featuresDictionary = self->featuresDictionary;
  self->featuresDictionary = 0;

  self->_lastTripodQuality = 0.0;
  ICDestroyResult();
  self->icCorrectionResultRef = 0;
  ICGetResultConfidence();
  if (v5 != 0.0
    && (self->icCorrectionResultRef = (void *)ICCalcCinematicL1Corrections(),
        ICGetCorrectionResultCropData()
     && (-[AutoLoopStabilizer CropRatio:](self, "CropRatio:", &self->cropRect), v6 >= self->cropRatioMinimum)))
  {
    v7 = 5;
  }
  else
  {
    v7 = -2;
  }
  if (!self->icCorrectionResultRef)
  {
    self->icCorrectionResultRef = (void *)ICCalcPassThruCorrections();
    ICGetCorrectionResultCropData();
    v7 = 4;
  }
  if (-[AutoLoopStabilizer CropRectValid:](self, "CropRectValid:", &self->cropRect))
    result = v7;
  else
    result = 0;
  self->_lastStabilizationResult = result;
  return result;
}

- (AVAsset)movieAssetIn
{
  return self->movieAssetIn;
}

- (void)setMovieAssetIn:(id)a3
{
  objc_storeStrong((id *)&self->movieAssetIn, a3);
}

- (NSURL)statsFileOutURL
{
  return self->statsFileOutURL;
}

- (void)setStatsFileOutURL:(id)a3
{
  objc_storeStrong((id *)&self->statsFileOutURL, a3);
}

- (unint64_t)frameSearchLength
{
  return self->frameSearchLength;
}

- (void)setFrameSearchLength:(unint64_t)a3
{
  self->frameSearchLength = a3;
}

- (NSString)currentStatusString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentStatusString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (float)progressValue
{
  return self->progressValue;
}

- (void)setProgressValue:(float)a3
{
  self->progressValue = a3;
}

- (BOOL)drawFeaturesFlag
{
  return self->drawFeaturesFlag;
}

- (void)setDrawFeaturesFlag:(BOOL)a3
{
  self->drawFeaturesFlag = a3;
}

- (int64_t)droppedStartFrameCount
{
  return self->droppedStartFrameCount;
}

- (void)setDroppedStartFrameCount:(int64_t)a3
{
  self->droppedStartFrameCount = a3;
}

- (int64_t)droppedEndFrameCount
{
  return self->droppedEndFrameCount;
}

- (void)setDroppedEndFrameCount:(int64_t)a3
{
  self->droppedEndFrameCount = a3;
}

- (void)icCorrectionResultRef
{
  return self->icCorrectionResultRef;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->cropRect.origin.x;
  y = self->cropRect.origin.y;
  width = self->cropRect.size.width;
  height = self->cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)inputMovieDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->inputMovieDimensions.width;
  height = self->inputMovieDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)refFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setRefFrameTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->refFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->refFrameTime.value = v3;
}

- (int)canceledAnalysis
{
  return self->canceledAnalysis;
}

- (void)setCanceledAnalysis:(int)a3
{
  self->canceledAnalysis = a3;
}

- (float)necessaryCropGainFractionPerDroppedFrame
{
  return self->necessaryCropGainFractionPerDroppedFrame;
}

- (void)setNecessaryCropGainFractionPerDroppedFrame:(float)a3
{
  self->necessaryCropGainFractionPerDroppedFrame = a3;
}

- (float)minConfidenceForTripodAccept
{
  return self->minConfidenceForTripodAccept;
}

- (void)setMinConfidenceForTripodAccept:(float)a3
{
  self->minConfidenceForTripodAccept = a3;
}

- (float)confidenceHighQualityThreshold
{
  return self->confidenceHighQualityThreshold;
}

- (void)setConfidenceHighQualityThreshold:(float)a3
{
  self->confidenceHighQualityThreshold = a3;
}

- (float)minimumHighQualityConfidenceValue
{
  return self->minimumHighQualityConfidenceValue;
}

- (void)setMinimumHighQualityConfidenceValue:(float)a3
{
  self->minimumHighQualityConfidenceValue = a3;
}

- (float)cropRatioMinimum
{
  return self->cropRatioMinimum;
}

- (void)setCropRatioMinimum:(float)a3
{
  self->cropRatioMinimum = a3;
}

- (BOOL)onlyProcessForHighQualityTripod
{
  return self->onlyProcessForHighQualityTripod;
}

- (void)setOnlyProcessForHighQualityTripod:(BOOL)a3
{
  self->onlyProcessForHighQualityTripod = a3;
}

- (float)alwaysAcceptedTripodCropRatio
{
  return self->alwaysAcceptedTripodCropRatio;
}

- (void)setAlwaysAcceptedTripodCropRatio:(float)a3
{
  self->alwaysAcceptedTripodCropRatio = a3;
}

- (BOOL)doLoopClosureCorrection
{
  return self->doLoopClosureCorrection;
}

- (void)setDoLoopClosureCorrection:(BOOL)a3
{
  self->doLoopClosureCorrection = a3;
}

- (NSDictionary)featuresDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFeaturesDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (float)minAllowedRemainingTripodCrop
{
  return self->_minAllowedRemainingTripodCrop;
}

- (void)setMinAllowedRemainingTripodCrop:(float)a3
{
  self->_minAllowedRemainingTripodCrop = a3;
}

- (id)statusUpdateBlock
{
  return self->_statusUpdateBlock;
}

- (void)setStatusUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)useLimitedTime
{
  return self->_useLimitedTime;
}

- (void)setUseLimitedTime:(BOOL)a3
{
  self->_useLimitedTime = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimStart
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 200);
  return self;
}

- (void)setTrimStart:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_trimStart.epoch = a3->var3;
  *(_OWORD *)&self->_trimStart.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trimLength
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (void)setTrimLength:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_trimLength.epoch = a3->var3;
  *(_OWORD *)&self->_trimLength.value = v3;
}

- (int)naturalTimeScale
{
  return self->_naturalTimeScale;
}

- (void)setNaturalTimeScale:(int)a3
{
  self->_naturalTimeScale = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 248);
  return self;
}

- (void)setMinimumFrameDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_minimumFrameDuration.epoch = a3->var3;
  *(_OWORD *)&self->_minimumFrameDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxAllowedTrimTimeStart
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- (void)setMaxAllowedTrimTimeStart:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxAllowedTrimTimeStart.epoch = a3->var3;
  *(_OWORD *)&self->_maxAllowedTrimTimeStart.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxAllowedTrimTimeEnd
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (void)setMaxAllowedTrimTimeEnd:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxAllowedTrimTimeEnd.epoch = a3->var3;
  *(_OWORD *)&self->_maxAllowedTrimTimeEnd.value = v3;
}

- (NSArray)presentationTimesOfFramesToSkip
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPresentationTimesOfFramesToSkip:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int)analysisResult
{
  return self->_analysisResult;
}

- (int)lastStabilizationResult
{
  return self->_lastStabilizationResult;
}

- (NSArray)skipFrameTimes
{
  return self->_skipFrameTimes;
}

- (void)setSkipFrameTimes:(id)a3
{
  objc_storeStrong((id *)&self->_skipFrameTimes, a3);
}

- (BOOL)disableGPUStabilization
{
  return self->_disableGPUStabilization;
}

- (void)setDisableGPUStabilization:(BOOL)a3
{
  self->_disableGPUStabilization = a3;
}

- (BOOL)optimizeProcessingForMemory
{
  return self->_optimizeProcessingForMemory;
}

- (void)setOptimizeProcessingForMemory:(BOOL)a3
{
  self->_optimizeProcessingForMemory = a3;
}

- (BOOL)didDrop
{
  return self->_didDrop;
}

- (void)setDidDrop:(BOOL)a3
{
  self->_didDrop = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstFrameTimeAfterDrop
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 320);
  return self;
}

- (void)setFirstFrameTimeAfterDrop:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_firstFrameTimeAfterDrop.epoch = a3->var3;
  *(_OWORD *)&self->_firstFrameTimeAfterDrop.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFrameTimeAfterDrop
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 344);
  return self;
}

- (void)setLastFrameTimeAfterDrop:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastFrameTimeAfterDrop.epoch = a3->var3;
  *(_OWORD *)&self->_lastFrameTimeAfterDrop.value = v3;
}

- (float)lastTripodQuality
{
  return self->_lastTripodQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skipFrameTimes, 0);
  objc_storeStrong((id *)&self->_presentationTimesOfFramesToSkip, 0);
  objc_storeStrong(&self->_statusUpdateBlock, 0);
  objc_storeStrong((id *)&self->featuresDictionary, 0);
  objc_storeStrong((id *)&self->currentStatusString, 0);
  objc_storeStrong((id *)&self->statsFileOutURL, 0);
  objc_storeStrong((id *)&self->movieAssetIn, 0);
}

@end
