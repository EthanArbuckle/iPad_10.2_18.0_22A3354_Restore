@implementation INCRouteAudioToAirplayOutputDevicesForAudioSession

void __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  id *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  NSObject *v16;
  os_log_t *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  int v36;
  int v37;
  void *v38;
  NSObject *v39;
  int v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  _BYTE buf[32];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = *(id *)(a1 + 32);
  if (!a4)
  {
LABEL_10:
    v17 = (os_log_t *)MEMORY[0x1E0CBD670];
    v18 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      _os_log_debug_impl(&dword_1B727D000, v18, OS_LOG_TYPE_DEBUG, "%s Checking for audio pairs", buf, 0xCu);
    }
    objc_msgSend(a2, "if_compactMap:", &__block_literal_global_562);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "count");
    v20 = *v17;
    if (v19)
    {
      v21 = os_signpost_id_generate(*v17);
      v22 = *v17;
      v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        v24 = *(_DWORD *)(a1 + 48);
        v25 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 67240448;
        *(_DWORD *)&buf[4] = v24;
        *(_WORD *)&buf[8] = 1026;
        *(_DWORD *)&buf[10] = v25;
        _os_signpost_emit_with_name_impl(&dword_1B727D000, v23, OS_SIGNPOST_EVENT, v21, "INSignpostSiriAirPlayAudioPairPath", " deviceIdCount=%{public,signpost.telemetry:number1}d  logicalDeviceCount=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", buf, 0xEu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v26 = getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr;
      *(_QWORD *)&buf[24] = getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr;
      if (!getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr)
      {
        v27 = (void *)MediaRemoteLibrary();
        v26 = dlsym(v27, "MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v26;
        getMRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDsSymbolLoc_ptr = v26;
      }
      _Block_object_dispose(buf, 8);
      if (!v26)
        goto LABEL_33;
      v28 = ((uint64_t (*)(id))v26)(v8);
      soft_MRAVReconnaissanceSessionSetTargetAudioSessionID(v28, *(unsigned int *)(a1 + 56));
      soft_MRAVReconnaissanceSessionSetReturnPartialResults(v28, 0);
      v29 = objc_msgSend(v8, "count");
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v30 = getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr;
      *(_QWORD *)&buf[24] = getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr;
      if (!getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr)
      {
        v31 = (void *)MediaRemoteLibrary();
        v30 = dlsym(v31, "MRAVReconnaissanceSessionSetExpectedLogicalDevices");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v30;
        getMRAVReconnaissanceSessionSetExpectedLogicalDevicesSymbolLoc_ptr = v30;
      }
      _Block_object_dispose(buf, 8);
      if (!v30)
      {
LABEL_33:
        dlerror();
        abort_report_np();
        __break(1u);
      }
      ((void (*)(uint64_t, uint64_t))v30)(v28, v29);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_4;
      v41[3] = &unk_1E6BC44B0;
      v43 = a2;
      v42 = *(id *)(a1 + 40);
      soft_MRAVReconnaissanceSessionBeginSearch(v28, v41);

    }
    else
    {
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_2";
        _os_log_debug_impl(&dword_1B727D000, v20, OS_LOG_TYPE_DEBUG, "%s No audio pairs detected", buf, 0xCu);
      }
      INCMRAVSetOutputDevicesForAudioContext(a2, *(void **)(a1 + 40));
    }
    goto LABEL_32;
  }
  v8 = a4;
  v9 = objc_msgSend(a2, "count");
  if (INCMRAVDiscoveryErrorIsPartialDiscoveryError(v8) && objc_msgSend(a2, "count"))
  {
    v10 = (id *)MEMORY[0x1E0CBD670];
    v11 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CBD670]);
    v12 = *v10;
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v40 = *(_DWORD *)(a1 + 48);
      v14 = objc_msgSend(v8, "code");
      objc_msgSend(v8, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67240962;
      *(_DWORD *)&buf[4] = v40;
      *(_WORD *)&buf[8] = 1026;
      *(_DWORD *)&buf[10] = v9;
      *(_WORD *)&buf[14] = 1026;
      *(_DWORD *)&buf[16] = v14;
      *(_WORD *)&buf[20] = 2114;
      *(_QWORD *)&buf[22] = v15;
      _os_signpost_emit_with_name_impl(&dword_1B727D000, v13, OS_SIGNPOST_EVENT, v11, "INSignpostSiriAirPlayDeviceSearchPartialError", " deviceIdCount=%{public,signpost.telemetry:number1}d  deviceCount=%{public,signpost.telemetry:number2}d  errorCode=%{public,signpost.telemetry:number3}d  errorDomain=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", buf, 0x1Eu);

    }
    v16 = *v10;
    if (os_log_type_enabled((os_log_t)*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = a2;
      _os_log_error_impl(&dword_1B727D000, v16, OS_LOG_TYPE_ERROR, "%s Timed out with partial discovery. Found devices: %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  v32 = (id *)MEMORY[0x1E0CBD670];
  v33 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CBD670]);
  v34 = *v32;
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    v36 = *(_DWORD *)(a1 + 48);
    v37 = objc_msgSend(v8, "code");
    objc_msgSend(v8, "domain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67240962;
    *(_DWORD *)&buf[4] = v36;
    *(_WORD *)&buf[8] = 1026;
    *(_DWORD *)&buf[10] = v9;
    *(_WORD *)&buf[14] = 1026;
    *(_DWORD *)&buf[16] = v37;
    *(_WORD *)&buf[20] = 2114;
    *(_QWORD *)&buf[22] = v38;
    _os_signpost_emit_with_name_impl(&dword_1B727D000, v35, OS_SIGNPOST_EVENT, v33, "INSignpostSiriAirPlayDeviceSearchError", " deviceIdCount=%{public,signpost.telemetry:number1}d  deviceCount=%{public,signpost.telemetry:number2}d  errorCode=%{public,signpost.telemetry:number3}d  errorDomain=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", buf, 0x1Eu);

  }
  v39 = *v32;
  if (os_log_type_enabled((os_log_t)*v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_error_impl(&dword_1B727D000, v39, OS_LOG_TYPE_ERROR, "%s Failed to search for output devices: %{public}@", buf, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_32:

}

void __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (INCMRAVDiscoveryErrorIsPartialDiscoveryError(a4) && objc_msgSend(a2, "count"))
    {
      v7 = *MEMORY[0x1E0CBD670];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)v16 = 136315394;
      *(_QWORD *)&v16[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = a2;
      v8 = "%s Timed out with partial discovery while finding audio pairs. Found devices: %{public}@";
      v9 = v7;
    }
    else
    {
      v10 = *MEMORY[0x1E0CBD670];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)v16 = 136315394;
      *(_QWORD *)&v16[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = a4;
      v8 = "%s Failed to search for output devices while finding audio pairs: %{public}@";
      v9 = v10;
    }
    _os_log_error_impl(&dword_1B727D000, v9, OS_LOG_TYPE_ERROR, v8, v16, 0x16u);
  }
  else
  {
    v11 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v16 = 136315138;
      *(_QWORD *)&v16[4] = "INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke";
      _os_log_debug_impl(&dword_1B727D000, v11, OS_LOG_TYPE_DEBUG, "%s Audio pairs detected", v16, 0xCu);
    }
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40), *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a2)
  {
    objc_msgSend(v12, "setByAddingObjectsFromArray:", a2);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  objc_msgSend(v13, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  INCMRAVSetOutputDevicesForAudioContext(v15, *(void **)(a1 + 32));

}

uint64_t __INCRouteAudioToAirplayOutputDevicesForAudioSession_block_invoke_1(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logicalDeviceID");
}

@end
