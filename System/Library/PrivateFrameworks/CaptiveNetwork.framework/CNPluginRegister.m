@implementation CNPluginRegister

void __CNPluginRegister_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  CFTypeID TypeID;
  CFIndex v5;
  CFIndex v6;
  const __CFArray *v7;
  CFIndex Count;
  uint64_t v9;
  const void *v10;
  NSObject *v11;
  os_log_type_t v12;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  CFTypeID v15;
  const void *Value;
  CFTypeID v17;
  _QWORD *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *logger;
  os_log_type_t v28;
  uint64_t v29;
  const void *v30;
  __CFArray *range_8;
  uint8_t buf[8];
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  _QWORD *v36;
  uint8_t v37[4];
  const __CFDictionary *v38;
  uint64_t v39;
  CFRange v40;

  v39 = *MEMORY[0x24BDAC8D0];
  TypeID = CFArrayGetTypeID();
  if (a3 && CFGetTypeID(a3) == TypeID && (v5 = CFArrayGetCount(a3)) != 0)
  {
    v6 = v5;
    v7 = *(const __CFArray **)(G_plugin + 24);
    if (v7)
      Count = CFArrayGetCount(v7);
    else
      Count = 0;
    range_8 = CFArrayCreateMutable(0, v6, MEMORY[0x24BDBD690]);
    if (v6 >= 1)
    {
      for (i = 0; v6 != i; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, i);
        v15 = CFDictionaryGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v15)
        {
          Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("UniqueID"));
          v17 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == v17)
          {
            if (!Count
              || (v40.location = 0,
                  v40.length = Count,
                  !CFArrayContainsValue(*(CFArrayRef *)(G_plugin + 24), v40, Value)))
            {
              v18 = CNPluginCommandCreate(ValueAtIndex);
              if (!v18)
              {
                logger = mysyslog_get_logger();
                v28 = _SC_syslog_os_log_mapping();
                if (!os_log_type_enabled(logger, v28))
                  continue;
                *(_DWORD *)v37 = 138412290;
                v38 = ValueAtIndex;
                v22 = logger;
                v23 = v28;
                v24 = "CNPluginCommandCreate(%@) failed";
                goto LABEL_27;
              }
              v19 = *(NSObject **)(G_plugin + 8);
              *(_QWORD *)buf = MEMORY[0x24BDAC760];
              v33 = 0x40000000;
              v34 = __CNPluginHandleCommandInfo_block_invoke;
              v35 = &__block_descriptor_tmp_9;
              v36 = v18;
              dispatch_async(v19, buf);
            }
            CFArrayAppendValue(range_8, Value);
          }
          else
          {
            v25 = mysyslog_get_logger();
            v26 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v25, v26))
            {
              *(_DWORD *)v37 = 138412290;
              v38 = ValueAtIndex;
              v22 = v25;
              v23 = v26;
              v24 = "command contains no uniqueID %@";
              goto LABEL_27;
            }
          }
        }
        else
        {
          v20 = mysyslog_get_logger();
          v21 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v20, v21))
          {
            *(_DWORD *)v37 = 138412290;
            v38 = ValueAtIndex;
            v22 = v20;
            v23 = v21;
            v24 = "command is not a dictionary %@";
LABEL_27:
            _os_log_impl(&dword_2064D4000, v22, v23, v24, v37, 0xCu);
          }
        }
      }
    }
    v29 = G_plugin;
    v30 = *(const void **)(G_plugin + 24);
    if (v30)
    {
      CFRelease(v30);
      *(_QWORD *)(v29 + 24) = 0;
      v29 = G_plugin;
    }
    *(_QWORD *)(v29 + 24) = range_8;
  }
  else
  {
    v9 = G_plugin;
    v10 = *(const void **)(G_plugin + 24);
    if (v10)
    {
      CFRelease(v10);
      *(_QWORD *)(v9 + 24) = 0;
    }
    if (a3)
    {
      v11 = mysyslog_get_logger();
      v12 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2064D4000, v11, v12, "given invalid command list", buf, 2u);
      }
    }
  }
}

@end
