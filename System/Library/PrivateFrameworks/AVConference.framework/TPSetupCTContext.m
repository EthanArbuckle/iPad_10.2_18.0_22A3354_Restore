@implementation TPSetupCTContext

uint64_t __TPSetupCTContext_block_invoke(uint64_t a1, const void *a2, const __CFDictionary *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  const void *Value;
  const __CFNumber *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  int ErrorLogLevelForModule;
  os_log_t *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  NSObject *global_queue;
  int valuePtr;
  _BYTE buf[24];
  _BYTE v25[20];
  char buffer[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[2];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  result = CheckInHandleDebug();
  if (result)
  {
    v7 = result;
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E0CA7688]))
    {
      valuePtr = -1;
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)((char *)v40 + 15) = v8;
      v39 = v8;
      v40[0] = v8;
      v37 = v8;
      v38 = v8;
      v35 = v8;
      v36 = v8;
      v33 = v8;
      v34 = v8;
      v31 = v8;
      v32 = v8;
      v29 = v8;
      v30 = v8;
      v27 = v8;
      v28 = v8;
      *(_OWORD *)buffer = v8;
      Value = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CA75F8]);
      v10 = (const __CFNumber *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CA7610]);
      if (v10)
        CFNumberGetValue(v10, kCFNumberSInt32Type, &valuePtr);
      v11 = (const __CFString *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E0CA7620]);
      v12 = v11;
      if (v11)
        CFStringGetCString(v11, buffer, 255, 0);
      if (Value)
      {
        v13 = CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
        if (v12)
        {
          if (v13 && valuePtr != -1)
          {
            v14 = v7 + 34456;
            ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            v16 = (os_log_t *)MEMORY[0x1E0CF2758];
            if (ErrorLogLevelForModule >= 7)
            {
              v17 = VRTraceErrorLogLevelToCSTR();
              v18 = *v16;
              if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v17;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "TPCTServerConnectionCallback";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)v25 = 460;
                *(_WORD *)&v25[4] = 1024;
                *(_DWORD *)&v25[6] = valuePtr;
                *(_WORD *)&v25[10] = 2080;
                *(_QWORD *)&v25[12] = buffer;
                _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d Received cellular data status change notification [Context: %d Indicator:%s].", buf, 0x2Cu);
              }
            }
            *(_DWORD *)(v14 + 16) = TPGetLocalCellTech(*(_QWORD *)v14);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *v16;
              if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
              {
                v21 = *(_DWORD *)(v14 + 16);
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = v19;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "TPCTServerConnectionCallback";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)v25 = 462;
                *(_WORD *)&v25[4] = 1024;
                *(_DWORD *)&v25[6] = v21;
                _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d CellTech Changed to %d ", buf, 0x22u);
              }
            }
            global_queue = dispatch_get_global_queue(0, 0);
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 0x40000000;
            *(_QWORD *)&buf[16] = __TPCellularConditionChangeCallback_block_invoke;
            *(_QWORD *)v25 = &__block_descriptor_tmp_36;
            *(_QWORD *)&v25[8] = v5;
            dispatch_async(global_queue, buf);
          }
        }
      }
    }
    return CheckOutHandleDebug();
  }
  return result;
}

@end
