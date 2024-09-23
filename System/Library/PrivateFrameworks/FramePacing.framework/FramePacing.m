void FPDrawableLifetimeMarkStarted(uint64_t a1, int a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10;
  _QWORD v11[7];
  int v12;

  v10 = objc_opt_self();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __100__FPCAMetalLayerState_drawableLifetimeStart_drawableID_surfaceID_acquisitionWaitStart_acquiredTime___block_invoke;
  v11[3] = &__block_descriptor_60_e29_v16__0__FPCAMetalLayerState_8l;
  v11[4] = a3;
  v12 = a2;
  *(double *)&v11[5] = a4;
  *(double *)&v11[6] = a5;
  +[FPCAMetalLayerState _updateLayerState:block:](v10, a1, v11);
}

void FPDrawableLifetimeMarkClientDidPresent(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  _QWORD v7[6];

  v6 = objc_opt_self();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__FPCAMetalLayerState_metalLayer_drawableID_clientPresentedTime___block_invoke;
  v7[3] = &__block_descriptor_48_e29_v16__0__FPCAMetalLayerState_8l;
  v7[4] = a2;
  *(double *)&v7[5] = a3;
  +[FPCAMetalLayerState _updateLayerState:block:](v6, a1, v7);
}

void FPDrawableLifetimeMarkFinished(uint64_t a1, int a2, uint64_t a3, char a4, double a5, uint64_t a6, void *a7, uint64_t a8, void *a9)
{
  +[FPCAMetalLayerState drawableLifetimeEnd:imageQueueID:drawableID:drawableFinishedTime:wasPresented:targetCPUDeadline:targetPresentationTime:](a5, (uint64_t)FPCAMetalLayerState, a1, a2, a3, a4, a7, a9);
}

void FPCAMetalLayerAllocated(uint64_t a1)
{
  +[FPCAMetalLayerState metalLayerAlloc:]((uint64_t)FPCAMetalLayerState, a1);
}

void FPMetalLayerMarkDealloc(uint64_t a1)
{
  +[FPCAMetalLayerState metalLayerDealloc:]((uint64_t)FPCAMetalLayerState, a1);
}

void FPMetalLayerMarkSetSize(uint64_t a1, double a2, double a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v4 = (unint64_t)a3;
  v5 = (unint64_t)a2;
  v6 = objc_opt_self();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__FPCAMetalLayerState_metalLayerSetSize_height_width___block_invoke;
  v7[3] = &__block_descriptor_48_e29_v16__0__FPCAMetalLayerState_8l;
  v7[4] = v4;
  v7[5] = v5;
  +[FPCAMetalLayerState _updateLayerState:block:](v6, a1, v7);
}

void FPMetalLayerMarkSetPixelFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v5[5];

  v4 = objc_opt_self();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__FPCAMetalLayerState_metalLayerSetPixelFormat_pixelFormat___block_invoke;
  v5[3] = &__block_descriptor_40_e29_v16__0__FPCAMetalLayerState_8l;
  v5[4] = a2;
  +[FPCAMetalLayerState _updateLayerState:block:](v4, a1, v5);
}

void FPMetalLayerMarkSetName(uint64_t a1, void *a2)
{
  +[FPCAMetalLayerState metalLayerSetNameOfLayer:name:]((uint64_t)FPCAMetalLayerState, a1, a2);
}

id _fpErrorHandle()
{
  if (_fpErrorHandle_onceToken != -1)
    dispatch_once(&_fpErrorHandle_onceToken, &__block_literal_global);
  return (id)_fpErrorHandle_handle;
}

void ___fpErrorHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "ClientErrors");
  v1 = (void *)_fpErrorHandle_handle;
  _fpErrorHandle_handle = (uint64_t)v0;

}

id _fpStateHandle()
{
  if (_fpStateHandle_onceToken != -1)
    dispatch_once(&_fpStateHandle_onceToken, &__block_literal_global_3);
  return (id)_fpStateHandle_handle;
}

void ___fpStateHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "FrameStats");
  v1 = (void *)_fpStateHandle_handle;
  _fpStateHandle_handle = (uint64_t)v0;

}

id _fpConfigurationHandle()
{
  if (_fpConfigurationHandle_onceToken != -1)
    dispatch_once(&_fpConfigurationHandle_onceToken, &__block_literal_global_5);
  return (id)_fpConfigurationHandle_handle;
}

void ___fpConfigurationHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "Configuration");
  v1 = (void *)_fpConfigurationHandle_handle;
  _fpConfigurationHandle_handle = (uint64_t)v0;

}

id _fpMetalLayerDebugHandle()
{
  if (qword_25430ADB0 != -1)
    dispatch_once(&qword_25430ADB0, &__block_literal_global_7);
  return (id)_MergedGlobals;
}

void ___fpMetalLayerDebugHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "MetalLayerDebug");
  v1 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)v0;

}

id _fpDrawableLifetimeDebugHandle()
{
  if (qword_25430ADC0 != -1)
    dispatch_once(&qword_25430ADC0, &__block_literal_global_9);
  return (id)qword_25430ADB8;
}

void ___fpDrawableLifetimeDebugHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "DrawableLifetimeDebug");
  v1 = (void *)qword_25430ADB8;
  qword_25430ADB8 = (uint64_t)v0;

}

id _fpCommandBufferDebugHandle()
{
  if (qword_25430ADD0 != -1)
    dispatch_once(&qword_25430ADD0, &__block_literal_global_11);
  return (id)qword_25430ADC8;
}

void ___fpCommandBufferDebugHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "CommandBufferDebug");
  v1 = (void *)qword_25430ADC8;
  qword_25430ADC8 = (uint64_t)v0;

}

id _fpTimeDebugHandle()
{
  if (qword_25430ADE0 != -1)
    dispatch_once(&qword_25430ADE0, &__block_literal_global_13);
  return (id)qword_25430ADD8;
}

void ___fpTimeDebugHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "TimeDebug");
  v1 = (void *)qword_25430ADD8;
  qword_25430ADD8 = (uint64_t)v0;

}

id _fpRusageDebugHandle()
{
  if (_fpRusageDebugHandle_onceToken != -1)
    dispatch_once(&_fpRusageDebugHandle_onceToken, &__block_literal_global_15);
  return (id)_fpRusageDebugHandle_handle;
}

void ___fpRusageDebugHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "RusageDebug");
  v1 = (void *)_fpRusageDebugHandle_handle;
  _fpRusageDebugHandle_handle = (uint64_t)v0;

}

id _fpIdleDebugHandle()
{
  if (qword_25430ADF0 != -1)
    dispatch_once(&qword_25430ADF0, &__block_literal_global_17);
  return (id)qword_25430ADE8;
}

void ___fpIdleDebugHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.FramePacing", "IdleDebug");
  v1 = (void *)qword_25430ADE8;
  qword_25430ADE8 = (uint64_t)v0;

}

BOOL _shouldEmitErrorSignpost()
{
  double Current;
  double v1;
  NSObject *v2;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  v1 = Current - *(double *)&qword_25430ADF8;
  if (Current - *(double *)&qword_25430ADF8 < 1.0)
  {
    ++qword_25430AE00;
  }
  else
  {
    if (qword_25430AE00)
    {
      _fpErrorHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v2))
      {
        v4 = 134218240;
        v5 = qword_25430AE00;
        v6 = 2048;
        v7 = qword_25430ADF8;
        _os_signpost_emit_with_name_impl(&dword_23C4DA000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampenedErrorCount", "Dampened %llu errors over the last %f seconds due to hysteresis", (uint8_t *)&v4, 0x16u);
      }

      qword_25430AE00 = 0;
    }
    qword_25430ADF8 = *(_QWORD *)&Current;
  }
  return v1 >= 1.0;
}

double FPScaleMachTimestamp(unint64_t a1)
{
  if (FPScaleMachTimestamp_onceToken != -1)
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
  return *(double *)&gTimebaseRatio * (double)a1;
}

uint64_t FPMachAbsoluteToRescaledMachContinuous(uint64_t a1)
{
  mach_get_times();
  return a1;
}

unint64_t FPTimeIntervalToMachContinuousRescaled(double a1)
{
  unint64_t v2;

  if (_FPUnscaleTimeIntervalTimestamp_onceToken != -1)
    dispatch_once(&_FPUnscaleTimeIntervalTimestamp_onceToken, &__block_literal_global_2);
  v2 = (unint64_t)(a1 / *(double *)&gTimebaseRatio);
  mach_get_times();
  return v2;
}

double FPRescaledMachTimestampDeltaToTimeInterval(unint64_t a1)
{
  if (FPScaleMachTimestamp_onceToken != -1)
    dispatch_once(&FPScaleMachTimestamp_onceToken, &__block_literal_global_0);
  return *(double *)&gTimebaseRatio * (double)a1;
}

double ___initTimebase_block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 * 0.000000001;
    gTimebaseRatio = *(_QWORD *)&result;
  }
  return result;
}

void FPCommandBufferCreated(uint64_t a1, uint64_t a2)
{
  +[FPCAMetalLayerState commandBufferCreate:creationTime:]((uint64_t)FPCAMetalLayerState, a1, a2);
}

void FPCommandBufferCommitted(uint64_t a1)
{
  uint64_t v2;

  v2 = mach_absolute_time();
  +[FPCAMetalLayerState commandBufferCommit:commitTime:]((uint64_t)FPCAMetalLayerState, a1, v2);
}

void FPCommandBufferScheduled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[FPCAMetalLayerState commandBufferScheduled:kernelStartTime:kernelEndTime:]((uint64_t)FPCAMetalLayerState, a1, a2, a3);
}

void FPCommandBufferCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[FPCAMetalLayerState commandBufferCompleted:gpuStartTime:gpuEndTime:]((uint64_t)FPCAMetalLayerState, a1, a2, a3);
}

id _FPLayerStateSyncQueue()
{
  if (qword_25430AE18 != -1)
    dispatch_once(&qword_25430AE18, &__block_literal_global_1);
  return (id)qword_25430AE10;
}

id _FPGlobalLayerStateDictionary()
{
  if (qword_25430AE28 != -1)
    dispatch_once(&qword_25430AE28, &__block_literal_global_11_0);
  return (id)qword_25430AE20;
}

id _FPConfigurationSettingQueue()
{
  if (qword_25430AE38 != -1)
    dispatch_once(&qword_25430AE38, &__block_literal_global_12);
  return (id)qword_25430AE30;
}

uint64_t _FPConfigurationSetPerDrawableSignpostingEnabled(char a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[5];
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  _FPConfigurationSettingQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___FPConfigurationSetPerDrawableSignpostingEnabled_block_invoke;
  v5[3] = &unk_250D475D8;
  v6 = a1;
  v5[4] = &v7;
  dispatch_sync(v2, v5);

  v3 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

double _FPGetCurrentAggregationIntervalSeconds()
{
  NSObject *v0;
  double v1;
  _QWORD block[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  _FPConfigurationSettingQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___FPGetCurrentAggregationIntervalSeconds_block_invoke;
  block[3] = &unk_250D47600;
  block[4] = &v4;
  dispatch_sync(v0, block);

  v1 = (double)(unint64_t)v5[3] / 1000000000.0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

double _FPConfigurationSetAggregationInterval(double a1)
{
  NSObject *v2;
  const char *v3;
  double v4;
  NSObject *v5;
  _QWORD v7[6];
  _BYTE buf[24];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 0.1)
  {
    if (a1 <= 20.0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v9 = 0;
      _FPConfigurationSettingQueue();
      v5 = objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = ___FPConfigurationSetAggregationInterval_block_invoke;
      v7[3] = &unk_250D47628;
      v7[4] = buf;
      *(double *)&v7[5] = a1;
      dispatch_sync(v5, v7);

      v4 = (double)*(unint64_t *)(*(_QWORD *)&buf[8] + 24) / 1000000000.0;
      _Block_object_dispose(buf, 8);
      return v4;
    }
    _fpConfigurationHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = 0x4034000000000000;
      v3 = "Failed to set aggregation interval since requested interval (%{public, name=previous_window_sec}.3fsec) is gr"
           "eater than the max allowed value (%{public, name=min_window_sec}.3fsec)";
      goto LABEL_7;
    }
  }
  else
  {
    _fpConfigurationHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      *(_DWORD *)buf = 134349312;
      *(double *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = 0x3FB999999999999ALL;
      v3 = "Failed to set aggregation interval since requested interval (%{public, name=previous_window_sec}.3fsec) is le"
           "ss than the minimum allowed value (%{public, name=min_window_sec}.3fsec)";
LABEL_7:
      _os_signpost_emit_with_name_impl(&dword_23C4DA000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetAggregationIntervalError", v3, buf, 0x16u);
    }
  }

  return _FPGetCurrentAggregationIntervalSeconds();
}

id _aggregationTimerSource()
{
  if (qword_25430AEC8 != -1)
    dispatch_once(&qword_25430AEC8, &__block_literal_global_117);
  return (id)qword_25430AEC0;
}

uint64_t _FPGetCurrentPerDrawableSignpostingEnabled()
{
  NSObject *v0;
  uint64_t v1;
  _QWORD block[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  _FPConfigurationSettingQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___FPGetCurrentPerDrawableSignpostingEnabled_block_invoke;
  block[3] = &unk_250D47600;
  block[4] = &v4;
  dispatch_sync(v0, block);

  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

id _FPConfigurationCheckingQueue()
{
  if (qword_25430AE48 != -1)
    dispatch_once(&qword_25430AE48, &__block_literal_global_19);
  return (id)qword_25430AE40;
}

void _FPCheckEnvironmentVariablesAndDefaultsForConfiguration()
{
  NSObject *v0;

  _FPConfigurationCheckingQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_21);

}

uint64_t _FPResetConfigurationToDefault()
{
  _FPConfigurationSetAggregationInterval(1.0);
  return _FPConfigurationSetPerDrawableSignpostingEnabled(0);
}

id _FPGlobalInFlightCommandBufferDictionary()
{
  if (qword_25430AE58 != -1)
    dispatch_once(&qword_25430AE58, &__block_literal_global_36);
  return (id)qword_25430AE50;
}

uint64_t _FPLayerStateClientPresentedInFlightDrawableCount(_QWORD *a1)
{
  if (a1)
    a1 = (_QWORD *)a1[25];
  return objc_msgSend(a1, "count");
}

uint64_t _FPLayerStateAcquiredDrawableCount(_QWORD *a1)
{
  if (a1)
    a1 = (_QWORD *)a1[24];
  return objc_msgSend(a1, "count");
}

void ___aggregationTimerSource_block_invoke()
{
  NSObject *v0;
  dispatch_source_t v1;
  void *v2;

  mach_continuous_time();
  _FPLayerStateSyncQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v0);
  v2 = (void *)qword_25430AEC0;
  qword_25430AEC0 = (uint64_t)v1;

  dispatch_source_set_timer((dispatch_source_t)qword_25430AEC0, 0, gFPAggregationIntervalNs, gFPAggregationIntervalNs);
  dispatch_source_set_event_handler((dispatch_source_t)qword_25430AEC0, &__block_literal_global_118);
}

void ___aggregationTimerSource_block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int *v9;
  char *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  rusage_info_t buffer[4];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  qword_25430AE78 = mach_continuous_time();
  objc_opt_self();
  if (gFPNeedsReportCount)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    _FPGlobalLayerStateDictionary();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "allValues", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v15 != v4)
            objc_enumerationMutation(v1);
          -[FPCAMetalLayerState _reportState](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v3);
    }

    objc_opt_self();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v7 = v6;
    objc_opt_self();
    if (_MergedGlobals_0 == 1)
    {
      if (qword_25430AEB0 != -1)
        dispatch_once(&qword_25430AEB0, &__block_literal_global_67);
      if ((byte_25430AE09 & 1) == 0
        && (*(double *)&qword_25430AEB8 == 0.0 || *(double *)&v7 - *(double *)&qword_25430AEB8 >= 5.0))
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v36 = 0u;
        memset(buffer, 0, sizeof(buffer));
        if (proc_pid_rusage(dword_25430AE0C, 6, buffer))
        {
          byte_25430AE09 = 1;
          _fpRusageDebugHandle();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v8))
          {
            v9 = __error();
            v10 = strerror(*v9);
            *(_DWORD *)buf = 136315138;
            v20 = v10;
            _os_signpost_emit_with_name_impl(&dword_23C4DA000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RusageFailure", "proc_pid_rusage() failed due to error: '%s'", buf, 0xCu);
          }

        }
        else
        {
          v11 = MEMORY[0x242620A0C]();
          _fpStateHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v12))
          {
            *(_DWORD *)buf = 134350848;
            v20 = (char *)*((_QWORD *)&v49 + 1);
            v21 = 2050;
            v22 = v54;
            v23 = 2050;
            v24 = (double)*((unint64_t *)&v38 + 1) * 0.000000953674316;
            v25 = 2050;
            v26 = (double)(unint64_t)v49 * 0.000000953674316;
            v27 = 2050;
            v28 = (double)v11 * 0.000000953674316;
            v29 = 2050;
            v30 = (double)(unint64_t)v43 * 0.000000953674316;
            v31 = 2050;
            v32 = (double)*((unint64_t *)&v43 + 1) * 0.000000953674316;
            v33 = 2050;
            v34 = (double)*((unint64_t *)&v48 + 1) * 0.000000953674316;
            _os_signpost_emit_with_name_impl(&dword_23C4DA000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CAMetalLayerClientSystemResourceUsage", "\nTotal instructions: \t\t%{public, name=ri_instructions}llu instr\nTotal P-core instructions: \t%{public, name=ri_pinstructions}llu pinstr\nPhysical footprint: \t\t%{public, name=ri_phys_footprint}.2fMiB\nPeak Physical footprint: \t%{public, name=ri_lifetime_max_phys_footprint}.2fMiB\nMemory limit headroom:\t\t%{public, name=os_proc_available_memory}.2fMiB\nDiskIO - Reads: \t\t%{public, name=ri_diskio_bytesread}.2fMiB\nDiskIO - Writes: \t\t%{public, name=ri_diskio_byteswritten}.2fMiB\nDiskIO - Logical Writes: \t%{public, name=ri_logical_writes}.2fMiB\n", buf, 0x52u);
          }

          qword_25430AEB8 = v7;
        }
      }
    }
    objc_opt_self();
    if (*(double *)&qword_25430AE88 == 0.0 || *(double *)&v7 - *(double *)&qword_25430AE88 >= 30.0)
    {
      if (qword_25430AEA8 != -1)
        dispatch_once(&qword_25430AEA8, &__block_literal_global_59);
      _fpStateHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v13))
      {
        LODWORD(buffer[0]) = 138543874;
        *(rusage_info_t *)((char *)buffer + 4) = (rusage_info_t)qword_25430AE90;
        WORD2(buffer[1]) = 2114;
        *(rusage_info_t *)((char *)&buffer[1] + 6) = *(rusage_info_t *)algn_25430AE98;
        HIWORD(buffer[2]) = 2114;
        buffer[3] = (rusage_info_t)qword_25430AEA0;
        _os_signpost_emit_with_name_impl(&dword_23C4DA000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CAMetalLayerClientBundleInfo", "Bundle Info:\nBundleID: '%{public, name=BundleID}@'\nBundle Short Version: '%{public, name=BundleShortVersion}@'\nBundle Version: '%{public, name=BundleVersion}@'\n", (uint8_t *)buffer, 0x20u);
      }

      qword_25430AE88 = v7;
    }
  }
  qword_25430AE80 = qword_25430AE78;
}

uint64_t ___accumulatedGPUTime_block_invoke(uint64_t a1, void *a2, void *a3)
{
  double *v4;
  double *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;

  v4 = a2;
  v5 = a3;
  v6 = 0.0;
  v7 = 0.0;
  if (v4)
    v7 = v4[7];
  if (v5)
    v6 = v5[7];
  if (v7 >= v6)
  {
    v9 = 0.0;
    v10 = 0.0;
    if (v4)
      v10 = v4[7];
    if (v5)
      v9 = v5[7];
    v8 = v10 > v9;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x24BDACC08]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x24BDAF3E8]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x24BDAF6E8](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

