@implementation AirPlayReceiverUI

void __AirPlayReceiverUI_GetShared_block_invoke()
{
  dispatch_queue_t *v0;
  NSObject *v1;
  int v2;
  _xpc_connection_s *mach_service;
  uint64_t v4;
  _QWORD handler[5];

  v0 = (dispatch_queue_t *)malloc_type_calloc(1uLL, 0xC8uLL, 0x10E00403FEE3558uLL);
  v1 = dispatch_queue_create("AirPlayReceiverUI", 0);
  *v0 = v1;
  dispatch_set_context(v1, v0);
  IsAppleTV();
  v2 = APSSettingsGetIntWithDefault() != 0;
  *((_BYTE *)v0 + 40) = v2;
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize())
      LogPrintF();
    v2 = *((unsigned __int8 *)v0 + 40);
  }
  if (v2)
  {
    if (!v0[2])
    {
      mach_service = xpc_connection_create_mach_service("com.apple.airplay.receiver", *v0, 1uLL);
      v4 = MEMORY[0x24BDAC760];
      v0[2] = (dispatch_queue_t)mach_service;
      handler[0] = v4;
      handler[1] = 3221225472;
      handler[2] = ___AirPlayReceiverUI_StartServer_block_invoke;
      handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
      handler[4] = v0;
      xpc_connection_set_event_handler(mach_service, handler);
      xpc_connection_resume((xpc_connection_t)v0[2]);
      if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 30
        && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 30
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverUI_GetShared_ui = (uint64_t)v0;
}

void ___AirPlayReceiverUI_StartServer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _xpc_connection_s *v5;
  _QWORD handler[5];

  v3 = *(_QWORD *)(a1 + 32);
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 10
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(_QWORD *)(v3 + 16))
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverUIXPCServerCore > 90
      || gLogCategory_AirPlayReceiverUIXPCServerCore == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_25;
  }
  v4 = MEMORY[0x2207ABF54](a2);
  if (v4 != MEMORY[0x24BDACF88])
  {
    if (v4 != MEMORY[0x24BDACFB8])
    {
      if (a2 == (void *)MEMORY[0x24BDACF30] || a2 == (void *)MEMORY[0x24BDACF38])
      {
        if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60
          && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        xpc_connection_cancel(*(xpc_connection_t *)(v3 + 32));
        xpc_release(*(xpc_object_t *)(v3 + 32));
        *(_QWORD *)(v3 + 32) = 0;
        _AirPlayReceiverUI_HandleServerReset(v3);
      }
      return;
    }
    if (gLogCategory_AirPlayReceiverUIXPCServerCore > 60
      || gLogCategory_AirPlayReceiverUIXPCServerCore == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
LABEL_25:
    LogPrintF();
    return;
  }
  v5 = *(_xpc_connection_s **)(v3 + 32);
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore > 90)
      goto LABEL_22;
    if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize())
      LogPrintF();
    v5 = *(_xpc_connection_s **)(v3 + 32);
    if (v5)
    {
LABEL_22:
      xpc_connection_cancel(v5);
      xpc_release(v5);
      *(_QWORD *)(v3 + 32) = 0;
    }
  }
  xpc_retain(a2);
  *(_QWORD *)(v3 + 32) = a2;
  xpc_connection_set_target_queue((xpc_connection_t)a2, *(dispatch_queue_t *)v3);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = ___AirPlayReceiverUI_XPCListenerEventHandler_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = v3;
  xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
  xpc_connection_resume((xpc_connection_t)a2);
  *(_BYTE *)(v3 + 24) = 1;
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 40
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_25;
  }
}

void ___AirPlayReceiverUI_XPCListenerEventHandler_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const char *string;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  CFTypeID v13;
  const void *v14;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v16;
  uint64_t v17;
  void *v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  CFTypeID v21;
  const void *Value;
  uint64_t (*v23)(uint64_t);
  const __CFDictionary *v24;
  CFTypeID v25;
  const void *v26;
  const __CFDictionary *v27;
  CFTypeID v28;
  const void *v29;
  const __CFDictionary *v30;
  CFTypeID v31;
  int Int64;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  const __CFDictionary *v37;
  CFTypeID v38;
  const void *v39;
  const void *v40;
  const void *v41;
  char v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFDictionary *v45;
  CFTypeID v46;
  const __CFString *v47;
  const __CFDictionary *v48;
  CFTypeID v49;
  const void *v50;
  const void *v51;
  void *v52;
  const char *v53;
  uint64_t block;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;

  v3 = *(_QWORD *)(a1 + 32);
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 10
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    v52 = a2;
    LogPrintF();
  }
  if (!*(_QWORD *)(v3 + 32))
    return;
  if (a2 == (void *)MEMORY[0x24BDACF30])
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_59;
  }
  if (a2 == (void *)MEMORY[0x24BDACF38])
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpc_connection_cancel(*(xpc_connection_t *)(v3 + 32));
    xpc_release(*(xpc_object_t *)(v3 + 32));
    *(_QWORD *)(v3 + 32) = 0;
LABEL_59:
    _AirPlayReceiverUI_HandleServerReset(v3);
    return;
  }
  if (MEMORY[0x2207ABF54](a2) != MEMORY[0x24BDACFA0])
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 90
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_53;
    }
    return;
  }
  string = xpc_dictionary_get_string(a2, "function");
  if (!string)
    goto LABEL_153;
  v5 = string;
  if (!strcmp(string, "postEvent"))
  {
    v6 = xpc_dictionary_get_string(a2, "eventType");
    if (!strcmp(v6, "ended"))
      goto LABEL_54;
    if (!strcmp(v6, "error"))
    {
      if (AirPlayReceiverUI_GetShared_once != -1)
        dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
      v17 = AirPlayReceiverUI_GetShared_ui;
      v18 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v52);
      objc_msgSend(v18, "setObject:forKey:", CFSTR("video"), CFSTR("category"));
      v19 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
      if (!v19)
        goto LABEL_153;
      v20 = v19;
      v21 = CFGetTypeID(v19);
      if (v21 != CFDictionaryGetTypeID())
        goto LABEL_154;
      objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("error"));
      Value = CFDictionaryGetValue(v20, CFSTR("sessionID"));
      if (Value)
        objc_msgSend(v18, "setObject:forKey:", Value, CFSTR("sessionID"));
      block = MEMORY[0x24BDAC760];
      v55 = 3221225472;
      v23 = ___AirPlayReceiverUI_HandleErrorEvent_block_invoke;
    }
    else if (!strcmp(v6, "failedURLRequest"))
    {
      if (AirPlayReceiverUI_GetShared_once != -1)
        dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
      v17 = AirPlayReceiverUI_GetShared_ui;
      v18 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v52);
      objc_msgSend(v18, "setObject:forKey:", CFSTR("unhandledURLRequest"), CFSTR("type"));
      v24 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
      if (!v24)
        goto LABEL_153;
      v20 = v24;
      v25 = CFGetTypeID(v24);
      if (v25 != CFDictionaryGetTypeID())
        goto LABEL_154;
      objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("request"));
      v26 = CFDictionaryGetValue(v20, CFSTR("sessionID"));
      if (v26)
        objc_msgSend(v18, "setObject:forKey:", v26, CFSTR("sessionID"));
      block = MEMORY[0x24BDAC760];
      v55 = 3221225472;
      v23 = ___AirPlayReceiverUI_HandleFailedURLRequest_block_invoke;
    }
    else
    {
      if (!strcmp(v6, "loading"))
        goto LABEL_54;
      if (strcmp(v6, "metaDataChanged"))
      {
        if (strcmp(v6, "paused") && strcmp(v6, "playing"))
        {
          if (!strcmp(v6, "stopAudio"))
          {
            v30 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
            if (!v30)
              goto LABEL_153;
            v20 = v30;
            v31 = CFGetTypeID(v30);
            if (v31 != CFDictionaryGetTypeID())
              goto LABEL_154;
            Int64 = CFDictionaryGetInt64();
            dispatch_retain(*(dispatch_object_t *)v3);
            block = MEMORY[0x24BDAC760];
            v55 = 3221225472;
            v56 = ___AirPlayReceiverUI_HandleAudioStop_block_invoke;
            v57 = &__block_descriptor_44_e5_v8__0l;
            v58 = v3;
            LODWORD(v59) = Int64;
LABEL_86:
            dispatch_async(MEMORY[0x24BDAC9B8], &block);
LABEL_87:
            CFRelease(v20);
            return;
          }
          if (strcmp(v6, "stopped"))
          {
            if (strcmp_prefix())
            {
              if (!strcmp(v6, "currentItemChanged"))
                goto LABEL_92;
              if (strcmp(v6, "dateRange"))
              {
                if (strcmp(v6, "itemPlayedToEnd") && strcmp(v6, "itemRemoved"))
                {
                  if (strcmp(v6, "fpsSecureStopGenerated"))
                  {
                    if (AirPlayReceiverUI_GetShared_once != -1)
                      dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
                    v7 = AirPlayReceiverUI_GetShared_ui;
                    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v52);
                    v9 = xpc_dictionary_get_string(a2, "eventType");
                    if (v9)
                    {
                      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
                      if (v10)
                        objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("type"));
                    }
                    v11 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
                    if (v11 && (v12 = v11, v13 = CFGetTypeID(v11), v13 == CFDictionaryGetTypeID()))
                    {
                      v14 = CFDictionaryGetValue(v12, CFSTR("sessionID"));
                      if (v14)
                        objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("sessionID"));
                      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v12);
                      if (MutableCopy)
                      {
                        v16 = MutableCopy;
                        CFDictionaryRemoveValue(MutableCopy, CFSTR("sessionID"));
                        if (CFDictionaryGetCount(v16) >= 1)
                          objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("params"));
                        CFRelease(v16);
                      }
                      CFRelease(v12);
                    }
                    else
                    {
                      APSLogErrorAt();
                    }
                    block = MEMORY[0x24BDAC760];
                    v55 = 3221225472;
                    v56 = ___AirPlayReceiverUI_HandleOtherEvent_block_invoke;
                    v57 = &unk_24E21FD90;
                    v58 = (uint64_t)v8;
                    v59 = v7;
                    dispatch_async(MEMORY[0x24BDAC9B8], &block);
                    return;
                  }
                  v45 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
                  if (v45)
                  {
                    v20 = v45;
                    v46 = CFGetTypeID(v45);
                    if (v46 == CFDictionaryGetTypeID())
                    {
                      CFRetain(v20);
                      block = MEMORY[0x24BDAC760];
                      v55 = 3221225472;
                      v56 = ___AirPlayReceiverUI_HandleFPSSecureStopGenerated_block_invoke;
                      v57 = &__block_descriptor_40_e5_v8__0l;
                      v58 = (uint64_t)v20;
                      goto LABEL_86;
                    }
LABEL_154:
                    APSLogErrorAt();
                    goto LABEL_87;
                  }
                  goto LABEL_153;
                }
LABEL_92:
                _AirPlayReceiverUI_HandlePlaylistEvent(a2);
                return;
              }
              if (AirPlayReceiverUI_GetShared_once != -1)
                dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
              v17 = AirPlayReceiverUI_GetShared_ui;
              v18 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v52);
              objc_msgSend(v18, "setObject:forKey:", CFSTR("video"), CFSTR("category"));
              objc_msgSend(v18, "setObject:forKey:", CFSTR("dateRange"), CFSTR("type"));
              v37 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
              if (!v37)
                goto LABEL_153;
              v20 = v37;
              v38 = CFGetTypeID(v37);
              if (v38 != CFDictionaryGetTypeID())
                goto LABEL_154;
              v39 = CFDictionaryGetValue(v20, CFSTR("dateRangeArray"));
              if (v39)
                objc_msgSend(v18, "setObject:forKey:", v39, CFSTR("dateRangeArray"));
              v40 = CFDictionaryGetValue(v20, CFSTR("uuid"));
              if (v40)
                objc_msgSend(v18, "setObject:forKey:", v40, CFSTR("uuid"));
              v41 = CFDictionaryGetValue(v20, CFSTR("sessionID"));
              if (v41)
                objc_msgSend(v18, "setObject:forKey:", v41, CFSTR("sessionID"));
              block = MEMORY[0x24BDAC760];
              v55 = 3221225472;
              v23 = ___AirPlayReceiverUI_HandleDateRangeEvent_block_invoke;
              goto LABEL_85;
            }
            if (AirPlayReceiverUI_GetShared_once != -1)
              dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
            v33 = AirPlayReceiverUI_GetShared_ui;
            v34 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v52);
            v35 = xpc_dictionary_get_string(a2, "eventType");
            if (!v35)
              goto LABEL_153;
            v36 = v35;
            if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 40
              && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
            {
              v53 = v36;
              LogPrintF();
            }
            if (!strcmp(v36, "userNext"))
            {
              objc_msgSend(v34, "setObject:forKey:", CFSTR("next"), CFSTR("action"));
              v42 = 0;
              v43 = CFSTR("kAirPlaySlideshowNotification_UserNext");
              goto LABEL_139;
            }
            if (!strcmp(v36, "userPrevious"))
            {
              objc_msgSend(v34, "setObject:forKey:", CFSTR("previous"), CFSTR("action"));
              v42 = 0;
              v43 = CFSTR("kAirPlaySlideshowNotification_UserPrevious");
              goto LABEL_139;
            }
            if (!strcmp(v36, "userUp"))
            {
              v44 = CFSTR("up");
            }
            else
            {
              if (strcmp(v36, "userDown"))
              {
                if (!strcmp(v36, "userSelect"))
                {
                  v47 = CFSTR("select");
                }
                else
                {
                  if (strcmp(v36, "userPlayPause"))
                  {
                    if (strcmp(v36, "userStop"))
                    {
                      if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50
                        && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
                      {
                        LogPrintF();
                      }
                      goto LABEL_133;
                    }
                    objc_msgSend(v34, "setObject:forKey:", CFSTR("stopped"), CFSTR("state"));
                    objc_msgSend(v34, "setObject:forKey:", CFSTR("photo"), CFSTR("category"));
                    v42 = 1;
                    v43 = CFSTR("kAirPlaySlideshowNotification_UserStop");
LABEL_139:
                    v48 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
                    if (v48)
                    {
                      v20 = v48;
                      v49 = CFGetTypeID(v48);
                      if (v49 == CFDictionaryGetTypeID())
                      {
                        v50 = CFDictionaryGetValue(v20, CFSTR("sessionID"));
                        if (v50)
                          objc_msgSend(v34, "setObject:forKey:", v50, CFSTR("sessionID"));
                        v51 = CFDictionaryGetValue(v20, CFSTR("userExit"));
                        if (v51)
                          objc_msgSend(v34, "setObject:forKey:", v51, CFSTR("userExit"));
                        block = MEMORY[0x24BDAC760];
                        v55 = 3221225472;
                        v56 = ___AirPlayReceiverUI_HandleUserEvent_block_invoke;
                        v57 = &unk_24E21ED78;
                        v58 = (uint64_t)v43;
                        v59 = (uint64_t)v34;
                        v60 = v33;
                        v61 = v42;
                        goto LABEL_86;
                      }
                      goto LABEL_154;
                    }
LABEL_153:
                    APSLogErrorAt();
                    return;
                  }
                  v47 = CFSTR("play");
                }
                objc_msgSend(v34, "setObject:forKey:", v47, CFSTR("action"), v53);
                v42 = 0;
                v43 = CFSTR("kAirPlaySlideshowNotification_UserPlayPause");
                goto LABEL_139;
              }
              v44 = CFSTR("down");
            }
            objc_msgSend(v34, "setObject:forKey:", v44, CFSTR("action"), v53);
LABEL_133:
            v43 = 0;
            v42 = 0;
            goto LABEL_139;
          }
        }
LABEL_54:
        _AirPlayReceiverUI_HandleStateEvent(a2);
        return;
      }
      if (AirPlayReceiverUI_GetShared_once != -1)
        dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
      v17 = AirPlayReceiverUI_GetShared_ui;
      v18 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v52);
      objc_msgSend(v18, "setObject:forKey:", CFSTR("video"), CFSTR("category"));
      objc_msgSend(v18, "setObject:forKey:", CFSTR("timedMetadata"), CFSTR("type"));
      v27 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
      if (!v27)
        goto LABEL_153;
      v20 = v27;
      v28 = CFGetTypeID(v27);
      if (v28 != CFDictionaryGetTypeID())
        goto LABEL_154;
      v29 = CFDictionaryGetValue(v20, CFSTR("sessionID"));
      if (v29)
        objc_msgSend(v18, "setObject:forKey:", v29, CFSTR("sessionID"));
      block = MEMORY[0x24BDAC760];
      v55 = 3221225472;
      v23 = ___AirPlayReceiverUI_HandleMetaDataEvent_block_invoke;
    }
LABEL_85:
    v56 = v23;
    v57 = &unk_24E21FD90;
    v58 = (uint64_t)v18;
    v59 = v17;
    goto LABEL_86;
  }
  if (!strcmp(v5, "ping"))
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 10
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_53;
    }
  }
  else if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60
         && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
LABEL_53:
    LogPrintF();
  }
}

void ___AirPlayReceiverUI_HandleServerReset_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 128);
  if (!*(_DWORD *)(v2 + 112))
  {
    if (!v3)
    {
      if (!*(_DWORD *)(v2 + 160))
        goto LABEL_29;
      goto LABEL_17;
    }
LABEL_5:
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
    {
      if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1
        || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    _AirPlayReceiverUI_CleanupPresentation(v2, 0, 0);
    v2 = *(_QWORD *)(a1 + 32);
    if (!*(_DWORD *)(v2 + 112))
      goto LABEL_17;
    goto LABEL_12;
  }
  if (v3)
    goto LABEL_5;
LABEL_12:
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1
      || (v5 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v5))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_QWORD *)(v2 + 104) = 0;
  *(_DWORD *)(v2 + 112) = 0;
LABEL_17:
  if (*(_DWORD *)(v2 + 160))
  {
    if (*(_BYTE *)(v2 + 176))
    {
      v6 = *(uint64_t ***)(v2 + 48);
      if (v6)
      {
        do
        {
          ((void (*)(const char *, _QWORD, uint64_t *))v6[2])("stopPlayingOverP2P", 0, v6[3]);
          v6 = (uint64_t **)*v6;
        }
        while (v6);
        v2 = *(_QWORD *)(a1 + 32);
      }
      *(_BYTE *)(v2 + 176) = 0;
    }
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
    {
      if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1
        || (v7 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v7))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_QWORD *)(v2 + 152) = 0;
    *(_DWORD *)(v2 + 160) = 0;
    *(_BYTE *)(v2 + 164) = 0;
    *(_QWORD *)(v2 + 168) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  _AirPlayReceiverUI_ActiveSessionsStopped(v2);
  v2 = *(_QWORD *)(a1 + 32);
LABEL_29:
  v8 = *(uint64_t ***)(v2 + 48);
  if (v8)
  {
    do
    {
      ((void (*)(const char *, _QWORD, uint64_t *))v8[2])("serverDied", 0, v8[3]);
      v8 = (uint64_t **)*v8;
    }
    while (v8);
    v2 = *(_QWORD *)(a1 + 32);
  }
  dispatch_release(*(dispatch_object_t *)v2);
}

void ___AirPlayReceiverUI_SendMessageWithReplySync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  NSObject *v5;
  void *v6;
  _QWORD handler[6];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 64) + 24))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 30
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 56);
    v2 = *(_QWORD *)(a1 + 64);
    v4 = *(_xpc_connection_s **)(v2 + 32);
    v5 = *(NSObject **)v2;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = ___AirPlayReceiverUI_SendMessageWithReplySync_block_invoke_2;
    handler[3] = &unk_24E21EDA0;
    v6 = *(void **)(a1 + 32);
    handler[4] = *(_QWORD *)(a1 + 40);
    handler[5] = v3;
    xpc_connection_send_message_with_reply(v4, v6, v5, handler);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

intptr_t ___AirPlayReceiverUI_SendMessageWithReplySync_block_invoke_2(uint64_t a1, xpc_object_t object)
{
  xpc_retain(object);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = object;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t ___AirPlayReceiverUI_HandleErrorEvent_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 40);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 184);
  if (v2)
    return v2(*(_QWORD *)(v1 + 192), *(_QWORD *)(result + 32));
  return result;
}

uint64_t ___AirPlayReceiverUI_HandleFailedURLRequest_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 40);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 184);
  if (v2)
    return v2(*(_QWORD *)(v1 + 192), *(_QWORD *)(result + 32));
  return result;
}

uint64_t ___AirPlayReceiverUI_HandleMetaDataEvent_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 40);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 184);
  if (v2)
    return v2(*(_QWORD *)(v1 + 192), *(_QWORD *)(result + 32));
  return result;
}

void ___AirPlayReceiverUI_HandleAudioStop_block_invoke(uint64_t a1)
{
  _AirPlayReceiverUI_NotifyObserversF(*(_QWORD *)(a1 + 32), (uint64_t)"stopAudio", (uint64_t)"{%kO=%i}");
  dispatch_release(**(dispatch_object_t **)(a1 + 32));
}

void ___AirPlayReceiverUI_HandleUserEvent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD);
  uint64_t **i;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", *(_QWORD *)(a1 + 32), 0);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(void (**)(_QWORD, _QWORD))(v2 + 184);
    if (v3)
      v3(*(_QWORD *)(v2 + 192), *(_QWORD *)(a1 + 40));
  }
  if (*(_BYTE *)(a1 + 56))
  {
    if (AirPlayReceiverUI_GetShared_once != -1)
      dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
    for (i = *(uint64_t ***)(AirPlayReceiverUI_GetShared_ui + 48); i; i = (uint64_t **)*i)
      ((void (*)(const char *, _QWORD, uint64_t *))i[2])("userStop", 0, i[3]);
  }
}

uint64_t ___AirPlayReceiverUI_HandleDateRangeEvent_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 40);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 184);
  if (v2)
    return v2(*(_QWORD *)(v1 + 192), *(_QWORD *)(result + 32));
  return result;
}

void ___AirPlayReceiverUI_HandleFPSSecureStopGenerated_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t **v3;

  if (AirPlayReceiverUI_GetShared_once != -1)
    dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2473);
  v2 = *(const void **)(a1 + 32);
  v3 = *(uint64_t ***)(AirPlayReceiverUI_GetShared_ui + 48);
  if (v3)
  {
    do
    {
      ((void (*)(const char *, const void *, uint64_t *))v3[2])("FPSSecureStopGenerated", v2, v3[3]);
      v3 = (uint64_t **)*v3;
    }
    while (v3);
    v2 = *(const void **)(a1 + 32);
  }
  if (v2)
    CFRelease(v2);
}

uint64_t ___AirPlayReceiverUI_HandleOtherEvent_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 40);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 184);
  if (v2)
    return v2(*(_QWORD *)(v1 + 192), *(_QWORD *)(result + 32));
  return result;
}

uint64_t ___AirPlayReceiverUI_HandlePlaylistEvent_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 40);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 184);
  if (v2)
    return v2(*(_QWORD *)(v1 + 192), *(_QWORD *)(result + 32));
  return result;
}

uint64_t ___AirPlayReceiverUI_HandleStateEvent_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 40);
  v2 = *(uint64_t (**)(_QWORD, _QWORD))(v1 + 184);
  if (v2)
    return v2(*(_QWORD *)(v1 + 192), *(_QWORD *)(result + 32));
  return result;
}

@end
