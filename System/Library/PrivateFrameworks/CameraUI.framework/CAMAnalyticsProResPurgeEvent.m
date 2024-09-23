@implementation CAMAnalyticsProResPurgeEvent

- (CAMAnalyticsProResPurgeEvent)initWithRequestType:(int64_t)a3 graphConfiguration:(id)a4 totalBytesInSystem:(int64_t)a5
{
  id v9;
  CAMAnalyticsProResPurgeEvent *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CAMAnalyticsProResPurgeEvent *v26;
  uint64_t v28;
  objc_super v29;

  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CAMAnalyticsProResPurgeEvent;
  v10 = -[CAMAnalyticsEvent init](&v29, sel_init);
  if (v10)
  {
    v10->__startTime = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v10->__graphConfiguration, a4);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "mode");
    v13 = objc_msgSend(v9, "device");
    v14 = objc_msgSend(v9, "videoEncodingBehavior");
    v15 = objc_msgSend(v9, "videoConfiguration");
    LOBYTE(v28) = objc_msgSend(v9, "prefersHDR10BitVideo");
    v16 = objc_msgSend(v11, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", v12, v13, v14, v15, 0, 0, v28);
    -[CAMAnalyticsEvent _eventMap](v10, "_eventMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = CFSTR("UserInitiated");
    if (a3 != 1)
      v19 = 0;
    if (a3)
      v20 = v19;
    else
      v20 = CFSTR("Auto");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("requestType"));
    switch(v16)
    {
      case 0:
        v21 = CFSTR("Auto");
        break;
      case 1:
        v21 = CFSTR("1080p60");
        break;
      case 2:
        v21 = CFSTR("720p120");
        break;
      case 3:
        v21 = CFSTR("720p240");
        break;
      case 4:
        v21 = CFSTR("1080p120");
        break;
      case 5:
        v21 = CFSTR("4k30");
        break;
      case 6:
        v21 = CFSTR("720p30");
        break;
      case 7:
        v21 = CFSTR("1080p30");
        break;
      case 8:
        v21 = CFSTR("1080p240");
        break;
      case 9:
        v21 = CFSTR("4k60");
        break;
      case 10:
        v21 = CFSTR("4k24");
        break;
      case 11:
        v21 = CFSTR("1080p25");
        break;
      case 12:
        v21 = CFSTR("4k25");
        break;
      case 13:
        v21 = CFSTR("4k120");
        break;
      case 14:
        v21 = CFSTR("4k100");
        break;
      default:
        switch(v16)
        {
          case 10000:
            v21 = CFSTR("ImagePickerHigh");
            break;
          case 10001:
            v21 = CFSTR("ImagePickerMedium");
            break;
          case 10002:
            v21 = CFSTR("ImagePickerLow");
            break;
          case 10003:
            v21 = CFSTR("ImagePickerVGA");
            break;
          case 10004:
            v21 = CFSTR("ImagePickeriFrame720p");
            break;
          case 10005:
            v21 = CFSTR("ImagePickeriFrame540p");
            break;
          default:
            v21 = 0;
            break;
        }
        break;
    }
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("videoConfiguration"));
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)objc_opt_class(), "gigabytesForBytes:", a5);
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("totalSystemGB"));

    objc_msgSend((id)objc_opt_class(), "bucketedGigabytesStringForBytes:allowZero:minPositiveValue:maxValue:", a5, 0, 64.0, 4096.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("totalSystemGBRange"));

    v25 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("didPurge"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("didCancel"));
    v26 = v10;

  }
  return v10;
}

- (id)eventName
{
  return CFSTR("prores.purge");
}

- (void)publish
{
  void *v3;
  double Current;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMAnalyticsProResPurgeEvent _startTime](self, "_startTime");
  v6 = Current - v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  objc_msgSend((id)objc_opt_class(), "durationRangeStringForDuration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("durationRange"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "gigabytesForBytes:", -[CAMAnalyticsProResPurgeEvent _totalBytesPurged](self, "_totalBytesPurged"));
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("totalPurgedGB"));

  objc_msgSend((id)objc_opt_class(), "bucketedGigabytesStringForBytes:", -[CAMAnalyticsProResPurgeEvent _totalBytesPurged](self, "_totalBytesPurged"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("totalPurgedGBRange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsProResPurgeEvent _purgeOperationCount](self, "_purgeOperationCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("purgeOperationCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsProResPurgeEvent _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsProResPurgeEvent _purgeOperationCount](self, "_purgeOperationCount")));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("purgeOperationCountRange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsProResPurgeEvent _purgeOperationCount](self, "_purgeOperationCount") > 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("didPurge"));

  v17.receiver = self;
  v17.super_class = (Class)CAMAnalyticsProResPurgeEvent;
  -[CAMAnalyticsEvent publish](&v17, sel_publish);
  v15 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMAnalyticsProResPurgeEvent eventName](self, "eventName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v16;
    v20 = 2114;
    v21 = v3;
    _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "CoreAnalytics: %{public}@: %{public}@", buf, 0x16u);

  }
}

- (void)updateBeforePurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6
{
  if (!-[CAMAnalyticsProResPurgeEvent _didUpdateForFirstPurgeOperation](self, "_didUpdateForFirstPurgeOperation"))
  {
    -[CAMAnalyticsProResPurgeEvent _updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:](self, "_updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:", 1, a3, a4, a5, a6);
    -[CAMAnalyticsProResPurgeEvent _setDidUpdateForFirstPurgeOperation:](self, "_setDidUpdateForFirstPurgeOperation:", 1);
  }
}

- (void)updateAfterPurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6 bytesPurged:(int64_t)a7
{
  -[CAMAnalyticsProResPurgeEvent _updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:](self, "_updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:", 0, a3, a4, a5, a6);
  -[CAMAnalyticsProResPurgeEvent _setTotalBytesPurged:](self, "_setTotalBytesPurged:", -[CAMAnalyticsProResPurgeEvent _totalBytesPurged](self, "_totalBytesPurged") + a7);
  -[CAMAnalyticsProResPurgeEvent _setPurgeOperationCount:](self, "_setPurgeOperationCount:", -[CAMAnalyticsProResPurgeEvent _purgeOperationCount](self, "_purgeOperationCount") + 1);
}

- (void)_updateForIsBeforePurge:(BOOL)a3 withFreeBytes:(int64_t)a4 fastPurgeableBytes:(int64_t)a5 slowPurgeableBytes:(int64_t)a6 maxRecordingTimeSeconds:(double)a7
{
  _BOOL4 v8;
  BOOL v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v39;
  __CFString *v42;
  id v43;

  v8 = a3;
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v9 = !v8;
  if (v8)
    v10 = CFSTR("freeGBBefore");
  else
    v10 = CFSTR("freeGBAfter");
  if (v8)
    v11 = CFSTR("freeGBBeforeRange");
  else
    v11 = CFSTR("freeGBAfterRange");
  if (v8)
    v12 = CFSTR("fastPurgeableGBBefore");
  else
    v12 = CFSTR("fastPurgeableGBAfter");
  if (v9)
    v13 = CFSTR("fastPurgeableGBAfterRange");
  else
    v13 = CFSTR("fastPurgeableGBBeforeRange");
  if (v9)
    v14 = CFSTR("slowPurgeableGBAfter");
  else
    v14 = CFSTR("slowPurgeableGBBefore");
  if (v9)
    v15 = CFSTR("slowPurgeableGBAfterRange");
  else
    v15 = CFSTR("slowPurgeableGBBeforeRange");
  if (v9)
    v16 = CFSTR("maxRecordingTimeSecondsAfter");
  else
    v16 = CFSTR("maxRecordingTimeSecondsBefore");
  if (v9)
    v17 = CFSTR("maxRecordingTimeSecondsAfterRange");
  else
    v17 = CFSTR("maxRecordingTimeSecondsBeforeRange");
  v18 = CFSTR("captureAllowedBefore");
  if (v9)
    v18 = CFSTR("captureAllowedAfter");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  v42 = v18;
  v39 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  v25 = v11;
  v26 = v10;
  objc_msgSend((id)objc_opt_class(), "gigabytesForBytes:", a4);
  objc_msgSend(v19, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v27, v26);

  objc_msgSend((id)objc_opt_class(), "bucketedGigabytesStringForBytes:", a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v28, v25);

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "gigabytesForBytes:", a5);
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v30, v24);

  objc_msgSend((id)objc_opt_class(), "bucketedGigabytesStringForBytes:", a5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v31, v23);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "gigabytesForBytes:", a6);
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v33, v22);

  objc_msgSend((id)objc_opt_class(), "bucketedGigabytesStringForBytes:", a6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v34, v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v35, v20);

  objc_msgSend((id)objc_opt_class(), "durationRangeStringForDuration:", a7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v36, v39);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a7 > 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v37, v42);

}

- (void)updateForSkippedPurgeOperationWithFreeBytes:(int64_t)a3 fastPurgeableBytes:(int64_t)a4 slowPurgeableBytes:(int64_t)a5 maxRecordingTimeSeconds:(double)a6
{
  if (-[CAMAnalyticsProResPurgeEvent _didUpdateForFirstPurgeOperation](self, "_didUpdateForFirstPurgeOperation"))
  {
    -[CAMAnalyticsProResPurgeEvent _updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:](self, "_updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:", 1, a3, a4, a5, a6);
    -[CAMAnalyticsProResPurgeEvent _updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:](self, "_updateForIsBeforePurge:withFreeBytes:fastPurgeableBytes:slowPurgeableBytes:maxRecordingTimeSeconds:", 0, a3, a4, a5, a6);
    -[CAMAnalyticsProResPurgeEvent _setDidUpdateForFirstPurgeOperation:](self, "_setDidUpdateForFirstPurgeOperation:", 1);
  }
}

- (void)updateForCancelRequest
{
  id v2;

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("didCancel"));

}

- (int64_t)_bucketedCount:(int64_t)a3
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", 1, (double)a3, 1.0, 128.0);
  return (uint64_t)v3;
}

- (double)_startTime
{
  return self->__startTime;
}

- (CAMCaptureGraphConfiguration)_graphConfiguration
{
  return self->__graphConfiguration;
}

- (BOOL)_didUpdateForFirstPurgeOperation
{
  return self->__didUpdateForFirstPurgeOperation;
}

- (void)_setDidUpdateForFirstPurgeOperation:(BOOL)a3
{
  self->__didUpdateForFirstPurgeOperation = a3;
}

- (int64_t)_totalBytesPurged
{
  return self->__totalBytesPurged;
}

- (void)_setTotalBytesPurged:(int64_t)a3
{
  self->__totalBytesPurged = a3;
}

- (int64_t)_purgeOperationCount
{
  return self->__purgeOperationCount;
}

- (void)_setPurgeOperationCount:(int64_t)a3
{
  self->__purgeOperationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__graphConfiguration, 0);
}

@end
