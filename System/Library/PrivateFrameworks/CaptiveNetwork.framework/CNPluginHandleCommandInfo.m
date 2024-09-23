@implementation CNPluginHandleCommandInfo

void __CNPluginHandleCommandInfo_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *Value;
  CFTypeID TypeID;
  _DWORD *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  NSObject *HandlerQueue;
  NSObject *logger;
  os_log_type_t v12;
  const char *String;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v16;
  void *values[2];
  void *keys[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 16), CFSTR("UniqueID"));
  TypeID = CFStringGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      v5 = (_DWORD *)(v2 + 24);
      v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, v5);
      if (v6)
      {
        v7 = v6;
        *(_OWORD *)keys = xmmword_24BF21528;
        values[0] = Value;
        values[1] = v6;
        v8 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (v8)
        {
          v9 = v8;
          HandlerQueue = ServerConnectionGetHandlerQueue(*(_QWORD *)G_plugin);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __SendEvaluateAck_block_invoke;
          block[3] = &__block_descriptor_tmp_12;
          block[4] = v9;
          dispatch_sync(HandlerQueue, block);
          logger = mysyslog_get_logger();
          v12 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v12))
          {
            String = CNPCommandTypeGetString(*v5);
            *(_DWORD *)buf = 136315138;
            v16 = String;
            _os_log_impl(&dword_2064D4000, logger, v12, "Delivery of %s command acknowledged", buf, 0xCu);
          }
          CFRelease(v7);
        }
        else
        {
          v9 = v7;
        }
        CFRelease(v9);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(G_plugin + 16) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
