@implementation AVAssetTrack(AVAdditions)

- (void)avkit_timeForFrameSteppedByFrameCount:()AVAdditions fromFrameAtTime:
{
  uint64_t v8;
  void *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  CMTime v13;
  CMTime time1;

  v8 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)a4 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(a4 + 16) = *(_QWORD *)(v8 + 16);
  objc_msgSend(a1, "mediaType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8A808]);

  if ((v10 & 1) == 0)
  {
    _AVLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(time1.value) = 0;
      v12 = "Invalid track type for frame stepping.";
      goto LABEL_13;
    }
LABEL_8:

    return;
  }
  if ((a3->flags & 0x1D) != 1)
  {
    time1 = *a3;
    v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&time1, &v13) < 0)
    {
      _AVLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(time1.value) = 0;
        v12 = "Invalid input base frame time.";
LABEL_13:
        _os_log_error_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&time1, 2u);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
  }
  *(_OWORD *)a4 = *(_OWORD *)&a3->value;
  *(_QWORD *)(a4 + 16) = a3->epoch;
  if (a2)
  {
    v13 = *a3;
    objc_msgSend(a1, "_avkit_timeForFrameUsingSampleCursorSteppedByFrameCount:fromFrameAtTime:", a2, &v13);
    *(CMTime *)a4 = time1;
    if ((*(_BYTE *)(a4 + 12) & 1) == 0)
    {
      v13 = *a3;
      objc_msgSend(a1, "_avkit_findTimeForFrameUsingFrameRateSteppedByFrameCount:fromFrameAtTime:", a2, &v13);
      *(CMTime *)a4 = time1;
    }
  }
}

- (__n128)_avkit_timeForFrameUsingSampleCursorSteppedByFrameCount:()AVAdditions fromFrameAtTime:
{
  uint64_t v1;
  __n128 result;

  v1 = MEMORY[0x1E0CA2E18];
  result = *(__n128 *)MEMORY[0x1E0CA2E18];
  *(_OWORD *)a1 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v1 + 16);
  return result;
}

- (CMTime)_avkit_findTimeForFrameUsingFrameRateSteppedByFrameCount:()AVAdditions fromFrameAtTime:
{
  CMTime *v7;
  float v8;
  float v9;
  double v10;
  int v11;
  double v12;
  CMTime rhs;
  CMTime time;
  CMTime v15;

  *(_OWORD *)a4 = *(_OWORD *)&a3->value;
  *(_QWORD *)(a4 + 16) = a3->epoch;
  if (a2)
  {
    v7 = result;
    -[CMTime nominalFrameRate](result, "nominalFrameRate");
    v9 = v8;
    if ((-[CMTime _avkit_frameRateIsValid:](v7, "_avkit_frameRateIsValid:") & 1) == 0)
    {
      memset(&v15, 0, sizeof(v15));
      -[CMTime minFrameDuration](v7, "minFrameDuration");
      time = v15;
      v10 = 1.0 / CMTimeGetSeconds(&time);
      v9 = v10;
    }
    *(float *)&v10 = v9;
    v11 = -[CMTime _avkit_frameRateIsValid:](v7, "_avkit_frameRateIsValid:", v10);
    v12 = 1.0 / v9;
    if (!v11)
      v12 = 0.1;
    CMTimeMakeWithSeconds(&rhs, v12 * (double)a2, 6000);
    time = *a3;
    result = CMTimeAdd(&v15, &time, &rhs);
    *(CMTime *)a4 = v15;
  }
  return result;
}

- (BOOL)_avkit_frameRateIsValid:()AVAdditions
{
  _BOOL4 v1;

  v1 = a1 < 0.0;
  if (a1 > 0.0)
    v1 = 1;
  if (a1 == 3.4028e38)
    v1 = 0;
  return a1 != 1.1755e-38 && v1;
}

@end
