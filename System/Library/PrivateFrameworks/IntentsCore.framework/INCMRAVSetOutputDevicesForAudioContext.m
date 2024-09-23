@implementation INCMRAVSetOutputDevicesForAudioContext

void __INCMRAVSetOutputDevicesForAudioContext_block_invoke(_QWORD *a1, void *a2)
{
  os_log_t *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  id v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  _BYTE v23[10];
  _WORD v24[9];

  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  v4 = (os_log_t *)MEMORY[0x1E0CBD670];
  v5 = (id)*MEMORY[0x1E0CBD670];
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = a1[6];
    v22 = 67240192;
    *(_DWORD *)v23 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v6, OS_SIGNPOST_INTERVAL_END, v7, "INSignpostSiriAirPlaySetOutputDevices", " deviceCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", (uint8_t *)&v22, 8u);
  }

  if (a2)
  {
    v9 = a2;
    v10 = os_signpost_id_generate(*v4);
    v11 = *v4;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = a1[6];
      v14 = objc_msgSend(v9, "code");
      objc_msgSend(v9, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 67240706;
      *(_DWORD *)v23 = v13;
      *(_WORD *)&v23[4] = 1026;
      *(_DWORD *)&v23[6] = v14;
      v24[0] = 2114;
      *(_QWORD *)&v24[1] = v15;
      _os_signpost_emit_with_name_impl(&dword_1B727D000, v12, OS_SIGNPOST_EVENT, v10, "INSignpostSiriAirPlaySetOutputDeviceError", " deviceCount=%{public,signpost.telemetry:number1}d  errorCode=%{public,signpost.telemetry:number2}d  errorDomain=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", (uint8_t *)&v22, 0x18u);

    }
    v16 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      *(_QWORD *)v23 = "INCMRAVSetOutputDevicesForAudioContext_block_invoke";
      *(_WORD *)&v23[8] = 2114;
      *(_QWORD *)v24 = v9;
      _os_log_error_impl(&dword_1B727D000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set output devices on the shared audio presentation context: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    (*(void (**)(void))(a1[4] + 16))();

  }
  else
  {
    v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      v22 = 136315138;
      *(_QWORD *)v23 = "INCMRAVSetOutputDevicesForAudioContext_block_invoke";
      _os_log_debug_impl(&dword_1B727D000, v17, OS_LOG_TYPE_DEBUG, "%s Set output devices on the shared audio presentation context", (uint8_t *)&v22, 0xCu);
      v17 = *v4;
    }
    v18 = os_signpost_id_generate(v17);
    v19 = *v4;
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v21 = a1[6];
      v22 = 67240192;
      *(_DWORD *)v23 = v21;
      _os_signpost_emit_with_name_impl(&dword_1B727D000, v20, OS_SIGNPOST_EVENT, v18, "INSignpostSiriAirPlaySetOutputDeviceSuccess", " deviceCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", (uint8_t *)&v22, 8u);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
}

@end
