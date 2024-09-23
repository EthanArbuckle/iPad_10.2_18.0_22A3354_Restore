@implementation CNWebSheetRegister

void __CNWebSheetRegister_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  CFTypeID v9;
  void *Value;
  CFTypeID v11;
  const __CFNumber *v12;
  CFTypeID v13;
  NSObject *logger;
  os_log_type_t v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  const char *v21;
  uint32_t v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint32_t v32;
  const void *v33;
  CFTypeID v34;
  __CFRunLoop *v35;
  const __CFDictionary *v36;
  const void *v37;
  const void *v38;
  const __CFNumber *v39;
  CFTypeID v40;
  NSObject *v41;
  os_log_type_t v42;
  __CFRunLoop *v43;
  NSObject *v44;
  os_log_type_t v45;
  NSObject *v46;
  os_log_type_t v47;
  NSObject *v48;
  os_log_type_t v49;
  CFTypeRef mode;
  unsigned int valuePtr;
  int v52;
  _BYTE buf[24];
  void *v54;
  const void *v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  TypeID = CFArrayGetTypeID();
  if (a3 && CFGetTypeID(a3) == TypeID && (Count = CFArrayGetCount(a3)) != 0)
  {
    v6 = Count;
    if (Count >= 1)
    {
      v7 = 0;
      mode = (CFTypeRef)*MEMORY[0x24BDBD598];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        v9 = CFDictionaryGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v9)
        {
          Value = (void *)CFDictionaryGetValue(ValueAtIndex, CFSTR("UniqueID"));
          v11 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == v11)
          {
            v12 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Type"));
            v13 = CFNumberGetTypeID();
            if (v12 && CFGetTypeID(v12) == v13)
            {
              valuePtr = 0;
              CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
              logger = mysyslog_get_logger();
              v15 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(logger, v15))
              {
                v16 = "<unknown>";
                if (valuePtr <= 3)
                  v16 = WebSheetCommandTypeGetString_strings[valuePtr];
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v16;
                _os_log_impl(&dword_2064D4000, logger, v15, "Command %s", buf, 0xCu);
              }
              if (valuePtr != 1)
              {
                if (valuePtr == 2)
                {
                  v52 = 7;
                  v36 = *(const __CFDictionary **)(G_websheet + 48);
                  if (v36)
                  {
                    v37 = CFDictionaryGetValue(v36, Value);
                    if (v37)
                    {
                      v38 = v37;
                      v39 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("ProbeResult"));
                      v40 = CFNumberGetTypeID();
                      if (v39 && CFGetTypeID(v39) == v40)
                        CFNumberGetValue(v39, kCFNumberIntType, &v52);
                      v41 = mysyslog_get_logger();
                      v42 = _SC_syslog_os_log_mapping();
                      if (os_log_type_enabled(v41, v42))
                      {
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)&buf[4] = Value;
                        *(_WORD *)&buf[12] = 2048;
                        *(_QWORD *)&buf[14] = v38;
                        *(_WORD *)&buf[22] = 1024;
                        LODWORD(v54) = v52;
                        _os_log_impl(&dword_2064D4000, v41, v42, "%@ prober %p COMPLETE result %d", buf, 0x1Cu);
                      }
                      CFRetain(v38);
                      v43 = *(__CFRunLoop **)(G_websheet + 40);
                      *(_QWORD *)buf = MEMORY[0x24BDAC760];
                      *(_QWORD *)&buf[8] = 0x40000000;
                      *(_QWORD *)&buf[16] = __CNWebSheetHandleProbeResult_block_invoke;
                      v54 = &__block_descriptor_tmp_35;
                      v55 = v38;
                      v56 = v52;
                      CFRunLoopPerformBlock(v43, mode, buf);
                      CFRunLoopWakeUp(*(CFRunLoopRef *)(G_websheet + 40));
                      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(G_websheet + 48), Value);
                    }
                    else
                    {
                      v46 = mysyslog_get_logger();
                      v47 = _SC_syslog_os_log_mapping();
                      if (os_log_type_enabled(v46, v47))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = Value;
                        v19 = v46;
                        v20 = v47;
                        v21 = "can't find prober with ID %@";
                        v22 = 12;
LABEL_21:
                        _os_log_impl(&dword_2064D4000, v19, v20, v21, buf, v22);
                      }
                    }
                  }
                }
                else
                {
                  if (valuePtr == 3)
                    exit(0);
                  v17 = mysyslog_get_logger();
                  v18 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(v17, v18))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&buf[4] = valuePtr;
                    v19 = v17;
                    v20 = v18;
                    v21 = "Unrecognized command %d";
                    v22 = 8;
                    goto LABEL_21;
                  }
                }
                provideResponse(Value);
                goto LABEL_30;
              }
              v33 = CFDictionaryGetValue(ValueAtIndex, CFSTR("Info"));
              v34 = CFDictionaryGetTypeID();
              if (v33 && CFGetTypeID(v33) == v34)
              {
                if (!*(_QWORD *)(G_websheet + 8))
                {
                  my_FieldSetRetainedCFType((const void **)(G_websheet + 8), Value);
                  CFRetain(v33);
                  v35 = *(__CFRunLoop **)(G_websheet + 40);
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  *(_QWORD *)&buf[8] = 0x40000000;
                  *(_QWORD *)&buf[16] = __CNWebSheetPresentUI_block_invoke;
                  v54 = &__block_descriptor_tmp_32;
                  v55 = v33;
                  CFRunLoopPerformBlock(v35, mode, buf);
                  CFRunLoopWakeUp(*(CFRunLoopRef *)(G_websheet + 40));
                }
                goto LABEL_30;
              }
              v44 = mysyslog_get_logger();
              v45 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v44, v45))
              {
                *(_WORD *)buf = 0;
                v25 = v44;
                v26 = v45;
                v27 = "websheet info is missing/invalid";
                v32 = 2;
                goto LABEL_29;
              }
            }
            else
            {
              v30 = mysyslog_get_logger();
              v31 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = ValueAtIndex;
                v25 = v30;
                v26 = v31;
                v27 = "command type missing or invalid in %@";
                goto LABEL_28;
              }
            }
          }
          else
          {
            v28 = mysyslog_get_logger();
            v29 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v28, v29))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = ValueAtIndex;
              v25 = v28;
              v26 = v29;
              v27 = "command contains no uniqueID %@";
              goto LABEL_28;
            }
          }
        }
        else
        {
          v23 = mysyslog_get_logger();
          v24 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v23, v24))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = ValueAtIndex;
            v25 = v23;
            v26 = v24;
            v27 = "command is not a dictionary %@";
LABEL_28:
            v32 = 12;
LABEL_29:
            _os_log_impl(&dword_2064D4000, v25, v26, v27, buf, v32);
          }
        }
LABEL_30:
        ++v7;
      }
      while (v6 != v7);
    }
  }
  else
  {
    v48 = mysyslog_get_logger();
    v49 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v48, v49))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2064D4000, v48, v49, "No more commands to process", buf, 2u);
    }
  }
}

void __CNWebSheetRegister_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *logger;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;

  if (!a3)
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v4))
      goto LABEL_9;
    v8 = 0;
    v5 = "Reconnect failed, exiting";
    v6 = (uint8_t *)&v8;
    goto LABEL_8;
  }
  if (*(_BYTE *)(G_websheet + 32))
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v4))
      goto LABEL_9;
    v7 = 0;
    v5 = "Server died, exiting";
    v6 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl(&dword_2064D4000, logger, v4, v5, v6, 2u);
LABEL_9:
    exit(0);
  }
  *(_BYTE *)(G_websheet + 32) = 1;
}

@end
