@implementation APReceiverSystemInfoHandleAPServicesReset

void __APReceiverSystemInfoHandleAPServicesReset_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  char buffer[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = sysInfo_copyPasscodeString(*(_QWORD *)(a1 + 32), 1, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v3 = v2;
  if (v2)
  {
    if (CFStringGetCString(v2, buffer, 64, 0x8000100u))
    {
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      sysInfo_handleAuthStringUpdate(buffer);
    }
    else if (gLogCategory_APReceiverSystemInfo <= 90
           && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  sysInfo_handleInfoDictUpdate(*(_QWORD *)(a1 + 32));
  sysInfo_handleLocalSenderStateChanged(*(_QWORD *)(a1 + 32), 0);
  if (gLogCategory_APReceiverSystemInfo <= 50
    && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (APSXPCClientSendCommandCreatingReply()
    && gLogCategory_APReceiverSystemInfo <= 90
    && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v3)
    CFRelease(v3);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
