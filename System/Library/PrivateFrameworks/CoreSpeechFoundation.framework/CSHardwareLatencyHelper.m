@implementation CSHardwareLatencyHelper

- (BOOL)addHWLatencyToOption:(id)a3 withCorrection:(double)a4 streamHandle:(unint64_t)a5 voiceController:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  float v15;
  double v16;
  float v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[CSHardwareLatencyHelper _hardwareLatencyAdjustmentSecondsUsingStreamHandle:andVoiceController:](self, "_hardwareLatencyAdjustmentSecondsUsingStreamHandle:andVoiceController:", a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && (objc_msgSend(v11, "isEqualToNumber:", &unk_1E68A17B0) & 1) == 0)
  {
    objc_msgSend(v12, "floatValue");
    v16 = v15;
    v17 = v15 + a4;
    v18 = v17;
    v19 = objc_msgSend(MEMORY[0x1E0C89B08], "hostTimeForSeconds:", v17);
    v20 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136316162;
      v23 = "-[CSHardwareLatencyHelper addHWLatencyToOption:withCorrection:streamHandle:voiceController:]";
      v24 = 2050;
      v25 = v18;
      v26 = 2050;
      v27 = v19;
      v28 = 2048;
      v29 = v16;
      v30 = 2048;
      v31 = a4;
      _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s Applying adjustment for hardware latency %{public}f secs, %{public}llu ticks (AVF=%f Correction=%f)", (uint8_t *)&v22, 0x34u);
    }
    objc_msgSend(v10, "adjustStartRecordingHostTime:", v19);
    v14 = 1;
  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    v14 = 0;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315394;
      v23 = "-[CSHardwareLatencyHelper addHWLatencyToOption:withCorrection:streamHandle:voiceController:]";
      v24 = 2112;
      v25 = *(double *)&v12;
      _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s No adjustment for hardware latency to apply. avfLatencySeconds = %@", (uint8_t *)&v22, 0x16u);
      v14 = 0;
    }
  }

  return v14;
}

- (id)_hardwareLatencyAdjustmentSecondsUsingStreamHandle:(unint64_t)a3 andVoiceController:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CSHardwareLatencyHelper _hardwareLatenciesUsingStreamHandle:andVoiceController:](self, "_hardwareLatenciesUsingStreamHandle:andVoiceController:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[CSHardwareLatencyHelper _adjustmentSecondsFromLatencyInfo:error:](self, "_adjustmentSecondsFromLatencyInfo:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v7)
  {
    v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v10 = v8;
      objc_msgSend(v7, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v14 = "-[CSHardwareLatencyHelper _hardwareLatencyAdjustmentSecondsUsingStreamHandle:andVoiceController:]";
      v15 = 2114;
      v16 = v5;
      v17 = 2114;
      v18 = v11;
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Error getting adjustment for hardware latency. infoDict=%{public}@; err=%{public}@",
        buf,
        0x20u);

    }
  }

  return v6;
}

- (id)_hardwareLatenciesUsingStreamHandle:(unint64_t)a3 andVoiceController:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2790;
  v17 = __Block_byref_object_dispose__2791;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke;
  v9[3] = &unk_1E6880E38;
  v6 = v5;
  v11 = &v13;
  v12 = a3;
  v10 = v6;
  +[CSUtils withElapsedTimeLogging:execute:](CSUtils, "withElapsedTimeLogging:execute:", CFSTR("CRFetchCarPlayCapabilities"), v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)_adjustmentSecondsFromLatencyInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  float v14;
  float v15;
  float v16;
  double v17;
  id v19;
  id v20;

  v6 = a3;
  v20 = 0;
  -[CSHardwareLatencyHelper _hardwareLatencyAdjustmentSeconds:hwLatencyType:error:](self, "_hardwareLatencyAdjustmentSeconds:hwLatencyType:error:", v6, 2, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  if (v8)
  {
    v9 = v8;
    if (a4)
    {
      v9 = objc_retainAutorelease(v8);
      v10 = 0;
      *a4 = v9;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v19 = 0;
    -[CSHardwareLatencyHelper _hardwareLatencyAdjustmentSeconds:hwLatencyType:error:](self, "_hardwareLatencyAdjustmentSeconds:hwLatencyType:error:", v6, 1, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    v9 = v12;
    if (v12)
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "floatValue");
      v15 = v14;
      objc_msgSend(v11, "floatValue");
      *(float *)&v17 = v15 - v16;
      objc_msgSend(v13, "numberWithFloat:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (id)_hardwareLatencyAdjustmentSeconds:(id)a3 hwLatencyType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  if (!v8)
  {
    if (!a5)
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = &unk_1E68A1568;
LABEL_14:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 114, v11);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!-[CSHardwareLatencyHelper _valuesAreMinimalyValidForInfoDictionary:type:](self, "_valuesAreMinimalyValidForInfoDictionary:type:", v8, a4))
  {
    if (!a5)
      goto LABEL_15;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = &unk_1E68A1590;
    goto LABEL_14;
  }
  if (a4 == 1)
  {
    v9 = (id *)MEMORY[0x1E0C899C0];
    goto LABEL_11;
  }
  if (a4 != 2)
  {
    if (a5)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = &unk_1E68A15B8;
      goto LABEL_14;
    }
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  v9 = (id *)MEMORY[0x1E0C899C8];
LABEL_11:
  v12 = *v9;
  objc_msgSend(v8, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "floatValue");
  objc_msgSend(v14, "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v15;
}

- (BOOL)_valuesAreMinimalyValidForInfoDictionary:(id)a3 type:(unint64_t)a4
{
  id v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;

  v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    v7 = (_QWORD *)MEMORY[0x1E0C899C0];
  }
  else
  {
    if (a4 != 2)
    {
LABEL_7:
      isKindOfClass = 0;
      goto LABEL_8;
    }
    v7 = (_QWORD *)MEMORY[0x1E0C899C8];
  }
  objc_msgSend(v5, "objectForKey:", *v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  v9 = (void *)v8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

LABEL_8:
  return isKindOfClass & 1;
}

void __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke(_QWORD *a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke_2;
  v8[3] = &unk_1E687EA80;
  v3 = (void *)a1[4];
  v4 = a1[6];
  v10 = a1[5];
  v5 = v2;
  v9 = v5;
  objc_msgSend(v3, "getDeviceLatenciesForStream:withCompletion:", v4, v8);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSHardwareLatencyHelper _hardwareLatenciesUsingStreamHandle:andVoiceController:]_block_invoke";
      _os_log_fault_impl(&dword_1B502E000, v7, OS_LOG_TYPE_FAULT, "%s AVVC getDeviceLatenciesForStream:withCompletion timed out", buf, 0xCu);
    }
  }

}

void __82__CSHardwareLatencyHelper__hardwareLatenciesUsingStreamHandle_andVoiceController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[CSHardwareLatencyHelper _hardwareLatenciesUsingStreamHandle:andVoiceController:]_block_invoke_2";
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s getDeviceLatenciesForStream error: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2805 != -1)
    dispatch_once(&sharedInstance_onceToken_2805, &__block_literal_global_2806);
  return (id)sharedInstance_sharedInstance_2807;
}

void __41__CSHardwareLatencyHelper_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_2807;
  sharedInstance_sharedInstance_2807 = v0;

}

@end
