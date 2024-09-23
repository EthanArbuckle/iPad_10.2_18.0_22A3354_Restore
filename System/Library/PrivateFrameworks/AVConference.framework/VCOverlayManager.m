@implementation VCOverlayManager

void *___VCOverlayManager_sharedOverlay_block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  void *result;
  NSObject *CustomRootQueue;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v0;
      v6 = 2080;
      v7 = "_VCOverlayManager_sharedOverlay_block_invoke";
      v8 = 1024;
      v9 = 33;
      _os_log_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] creating shared VCOverlayManager", (uint8_t *)&v4, 0x1Cu);
    }
  }
  result = malloc_type_calloc(1uLL, 0x18uLL, 0x10A00403F27F3CFuLL);
  _VCOverlayManager_sharedOverlay__overlayManager = (uint64_t)result;
  if (result)
  {
    *(_QWORD *)_VCOverlayManager_sharedOverlay__overlayManager = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    result = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCOverlayManager.stateQueue", 0, CustomRootQueue);
    *(_QWORD *)(_VCOverlayManager_sharedOverlay__overlayManager + 8) = result;
  }
  return result;
}

void __VCOverlayManager_registerOverlayForToken_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (CFDictionaryContainsKey(**(CFDictionaryRef **)(a1 + 48), *(const void **)(a1 + 56)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 64);
        v10 = 136315906;
        v11 = v2;
        v12 = 2080;
        v13 = "VCOverlayManager_registerOverlayForToken_block_invoke";
        v14 = 1024;
        v15 = 137;
        v16 = 2048;
        v17 = v4;
        v5 = " [%s] %s:%d [VCOverlayManager] overlay already exists for token=%ld";
LABEL_12:
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(VCPixelBufferOverlay);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      CFDictionaryAddValue(**(CFMutableDictionaryRef **)(a1 + 48), *(const void **)(a1 + 56), *(const void **)(a1 + 72));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFDictionaryContainsKey(**(CFDictionaryRef **)(a1 + 48), *(const void **)(a1 + 56)) != 0;
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 72), CFSTR("vcpixelbufferoverlay"), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v3 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(_QWORD *)(a1 + 64);
          v10 = 136315906;
          v11 = v6;
          v12 = 2080;
          v13 = "VCOverlayManager_registerOverlayForToken_block_invoke";
          v14 = 1024;
          v15 = 135;
          v16 = 2048;
          v17 = v7;
          v5 = " [%s] %s:%d [VCOverlayManager] overlay created with token=%ld";
          goto LABEL_12;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 64);
        v10 = 136315906;
        v11 = v8;
        v12 = 2080;
        v13 = "VCOverlayManager_registerOverlayForToken_block_invoke";
        v14 = 1024;
        v15 = 129;
        v16 = 2048;
        v17 = v9;
        v5 = " [%s] %s:%d [VCOverlayManager] unable to create VCPixelBufferOverlay for token=%ld";
        goto LABEL_12;
      }
    }
  }
}

void __VCOverlayManager_unregisterOverlayForToken_block_invoke(uint64_t a1)
{
  CFNumberRef v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberLongType, (const void *)(a1 + 40));
  if (CFDictionaryContainsKey(**(CFDictionaryRef **)(a1 + 48), v2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "VCOverlayManager_unregisterOverlayForToken_block_invoke";
        v10 = 1024;
        v11 = 155;
        v12 = 2048;
        v13 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] releasing overlay with token=%ld", (uint8_t *)&v6, 0x26u);
      }
    }
    CFDictionaryRemoveValue(**(CFMutableDictionaryRef **)(a1 + 48), v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  if (v2)
    CFRelease(v2);
}

void __VCOverlayManager_createOverlaySourceForToken_block_invoke(uint64_t a1)
{
  BOOL v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const void *Value;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = _VCOverlayManager_AddSourceToDictionary(*(__CFDictionary **)(a1 + 40), *(const __CFString **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 56);
        v7 = *(unsigned __int8 *)(a1 + 64);
        v23 = 136316162;
        v24 = v4;
        v25 = 2080;
        v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
        v27 = 1024;
        v28 = 182;
        v29 = 2048;
        v30 = v6;
        v31 = 1024;
        v32 = v7;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] source successfully added with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("vcpixelbufferoverlay"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v23 = 136315650;
          v24 = v9;
          v25 = 2080;
          v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
          v27 = 1024;
          v28 = 190;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] Adding source to overlay", (uint8_t *)&v23, 0x1Cu);
        }
      }
      if (Value
        && VCPixelBufferOverlay_updateSourceForType((uint64_t)Value, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)))
      {
        CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_QWORD *)(a1 + 56);
            v14 = *(unsigned __int8 *)(a1 + 64);
            v23 = 136316162;
            v24 = v11;
            v25 = 2080;
            v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
            v27 = 1024;
            v28 = 193;
            v29 = 2048;
            v30 = v13;
            v31 = 1024;
            v32 = v14;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [VCOverlayManager] overlay successfully updated with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v21 = *(_QWORD *)(a1 + 56);
            v22 = *(unsigned __int8 *)(a1 + 64);
            v23 = 136316162;
            v24 = v19;
            v25 = 2080;
            v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
            v27 = 1024;
            v28 = 195;
            v29 = 2048;
            v30 = v21;
            v31 = 1024;
            v32 = v22;
            _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d [VCOverlayManager] failed to add source with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
          }
        }
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      }
    }
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(unsigned __int8 *)(a1 + 64);
      v23 = 136316162;
      v24 = v15;
      v25 = 2080;
      v26 = "VCOverlayManager_createOverlaySourceForToken_block_invoke";
      v27 = 1024;
      v28 = 179;
      v29 = 2048;
      v30 = v17;
      v31 = 1024;
      v32 = v18;
      _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d [VCOverlayManager] adding source to dictionary failed with token=%ld and type=%d", (uint8_t *)&v23, 0x2Cu);
    }
  }
}

void __VCOverlayManager_releaseOverlaySourceWithToken_block_invoke(uint64_t a1)
{
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48)))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

uint64_t __VCOverlayManager_isOverlayEnabled_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 40) + 16);
  return result;
}

BOOL __VCOverlayManager_updateOverlayEnabledState_block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = VCDefaults_GetBoolValueForKey(CFSTR("enableInfoOverlay"), 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = result;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
