@implementation TriggerWiFiDECaptureIfNeeded

void ___TriggerWiFiDECaptureIfNeeded_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v1 = a1;
  v19[3] = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform != -1 || (a1 = _LogCategory_Initialize(), (_DWORD)a1))
    {
      v15 = *(unsigned int *)(v1 + 40);
      a1 = LogPrintF();
    }
  }
  v2 = (void *)MEMORY[0x2207ABB4C](a1);
  v3 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16);
  v4 = *(_DWORD *)(v1 + 40);
  switch(v4)
  {
    case 0:
      v11 = *(_QWORD *)(v3 + 72) - 1;
      *(_QWORD *)(v3 + 72) = v11;
      if (v11)
        break;
      v10 = CFSTR("abort");
LABEL_26:
      v18[0] = CFSTR("DEExtensionHostAppKey");
      v18[1] = CFSTR("uuid");
      v13 = *(_QWORD *)(v3 + 64);
      v19[0] = CFSTR("AirPlay Transport");
      v19[1] = v13;
      v18[2] = CFSTR("trigger");
      v19[2] = v10;
      v14 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3, v15);
      if (gLogCategory_AirPlayReceiverPlatform <= 50
        && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
      {
        v17 = *(unsigned int *)(v1 + 40);
        LogPrintF();
        objc_msgSend(*(id *)(v3 + 56), "attachmentsForParameters:andHandler:", v14, 0, v17);
      }
      else
      {
        objc_msgSend(*(id *)(v3 + 56), "attachmentsForParameters:andHandler:", v14, 0, v16);
      }
      break;
    case 2:
      if (!*(_QWORD *)(v3 + 72))
      {
        APSLogErrorAt();
        break;
      }
      *(_QWORD *)(v3 + 72) = 0;
      v10 = CFSTR("post");
      goto LABEL_26;
    case 1:
      v5 = *(_QWORD *)(v3 + 72);
      *(_QWORD *)(v3 + 72) = v5 + 1;
      if (!v5)
      {
        v6 = *(void **)(v3 + 64);
        v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1880], "UUID"), "UUIDString");
        v8 = v7;
        *(_QWORD *)(v3 + 64) = v7;

        IsAppleInternalBuild();
        if (IsAppleInternalBuild())
          v9 = 50;
        else
          v9 = 30;
        if (v9 >= gLogCategory_AirPlayReceiverPlatform)
        {
          if (gLogCategory_AirPlayReceiverPlatform != -1
            || (IsAppleInternalBuild(), _LogCategory_Initialize()))
          {
            IsAppleInternalBuild();
            v15 = *(_QWORD *)(v1 + 32);
            LogPrintF();
          }
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.airplay.connection.stalled"), 0, 0, 1u);
        v10 = CFSTR("pre");
        goto LABEL_26;
      }
      break;
    default:
      if (gLogCategory_AirPlayReceiverPlatform <= 60
        && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
  CFRelease(*(CFTypeRef *)(v1 + 32));
  objc_autoreleasePoolPop(v2);
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end
