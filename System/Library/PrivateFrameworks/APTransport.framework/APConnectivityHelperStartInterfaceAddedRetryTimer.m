@implementation APConnectivityHelperStartInterfaceAddedRetryTimer

uint64_t ___APConnectivityHelperStartInterfaceAddedRetryTimer_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v4 = 0;
  if (gLogCategory_APConnectivityHelper <= 30
    && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
    v3 = v1;
    LogPrintF();
  }
  objc_msgSend(*(id *)(v1 + 40), "stopMonitoringEventType:", 10, v3);
  result = objc_msgSend(*(id *)(v1 + 40), "startMonitoringEventType:error:", 10, &v4);
  if ((result & 1) == 0 && gLogCategory_APConnectivityHelper <= 90)
  {
    if (gLogCategory_APConnectivityHelper != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  if (*(_BYTE *)(v1 + 80))
    result = (uint64_t)_APConnectivityHelperTrySettingWiFiDevice(v1);
  if (*(_BYTE *)(v1 + 177))
    return _APConnectivityHelperTrySettingAWDLDevice(v1);
  return result;
}

void ___APConnectivityHelperStartInterfaceAddedRetryTimer_block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
