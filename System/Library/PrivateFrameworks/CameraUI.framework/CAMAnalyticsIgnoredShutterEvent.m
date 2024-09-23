@implementation CAMAnalyticsIgnoredShutterEvent

- (CAMAnalyticsIgnoredShutterEvent)initWithReasons:(unint64_t)a3 timeSinceLastPress:(double)a4 dynamicShutterEnabled:(BOOL)a5 responsiveShutterEnabled:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  CAMAnalyticsIgnoredShutterEvent *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CAMAnalyticsIgnoredShutterEvent *v27;
  objc_super v29;

  v6 = a6;
  v7 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CAMAnalyticsIgnoredShutterEvent;
  v10 = -[CAMAnalyticsEvent init](&v29, sel_init);
  if (v10)
  {
    if (a3)
    {
      v11 = 1;
      v12 = MEMORY[0x1E0C9AAB0];
      do
      {
        if ((a3 & 1) != 0)
        {
          -[CAMAnalyticsEvent _eventMap](v10, "_eventMap");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v11 > 15)
          {
            if (v11 == 128)
              v16 = CFSTR("disabledReasonPurgingDiskSpace");
            else
              v16 = 0;
            if (v11 == 64)
              v16 = CFSTR("disabledReasonViewfinderOpening");
            if (v11 == 32)
              v17 = CFSTR("disabledReasonPhysicalButtonDown");
            else
              v17 = 0;
            if (v11 == 16)
              v17 = CFSTR("disabledReasonModeDisabled");
            if (v11 <= 63)
              v15 = v17;
            else
              v15 = v16;
          }
          else
          {
            v15 = 0;
            switch(v11)
            {
              case 0:
                v15 = CFSTR("disabledReasonNone");
                break;
              case 1:
                v15 = CFSTR("disabledReasonCaptureUnavailable");
                break;
              case 2:
                v15 = CFSTR("disabledReasonOutOfDiskSpace");
                break;
              case 4:
                v15 = CFSTR("disabledReasonViewfinderClosed");
                break;
              case 8:
                v15 = CFSTR("disabledReasonPreventingAdditionalCaptures");
                break;
              default:
                break;
            }
          }
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v15);

        }
        v11 *= 2;
        v18 = a3 > 1;
        a3 >>= 1;
      }
      while (v18);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(a4 * 1000.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](v10, "_eventMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("timeSinceLastPress"));

    -[CAMAnalyticsIgnoredShutterEvent _timeSinceLastPressRangeStringForMilliseconds:](v10, "_timeSinceLastPressRangeStringForMilliseconds:", (uint64_t)(a4 * 1000.0));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](v10, "_eventMap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("timeSinceLastPressRange"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](v10, "_eventMap");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("dynamicShutter"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsEvent _eventMap](v10, "_eventMap");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("responsiveShutter"));

    v27 = v10;
  }

  return v10;
}

- (id)eventName
{
  return CFSTR("shutter.ignored");
}

- (id)_timeSinceLastPressRangeStringForMilliseconds:(int64_t)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  __CFString *v12;

  if (_timeSinceLastPressRangeStringForMilliseconds__onceToken[0] != -1)
    dispatch_once(_timeSinceLastPressRangeStringForMilliseconds__onceToken, &__block_literal_global_59);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = CFSTR("5000+");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__CAMAnalyticsIgnoredShutterEvent__timeSinceLastPressRangeStringForMilliseconds___block_invoke_31;
  v6[3] = &unk_1EA330248;
  v6[4] = &v7;
  v6[5] = a3;
  objc_msgSend((id)_timeSinceLastPressRangeStringForMilliseconds__bucketValues, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __81__CAMAnalyticsIgnoredShutterEvent__timeSinceLastPressRangeStringForMilliseconds___block_invoke()
{
  void *v0;

  v0 = (void *)_timeSinceLastPressRangeStringForMilliseconds__bucketValues;
  _timeSinceLastPressRangeStringForMilliseconds__bucketValues = (uint64_t)&unk_1EA3B3B48;

}

void __81__CAMAnalyticsIgnoredShutterEvent__timeSinceLastPressRangeStringForMilliseconds___block_invoke_31(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (*(_QWORD *)(a1 + 40) < (int)objc_msgSend(v9, "intValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%d"), objc_msgSend(v9, "intValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

@end
