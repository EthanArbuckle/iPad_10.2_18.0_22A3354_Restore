@implementation APSRTCReportingCreate

uint64_t __APSRTCReportingCreate_block_invoke_2()
{
  uint64_t result;

  if (gLogCategory_APSRTCReporting <= 40)
  {
    if (gLogCategory_APSRTCReporting != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

void __APSRTCReportingCreate_block_invoke_3()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v2;
  _QWORD block[5];

  if (apsrr_getWeakRefTable_once != -1)
    dispatch_once(&apsrr_getWeakRefTable_once, &__block_literal_global_221);
  v0 = FigCFWeakReferenceTableCopyValue();
  if (v0)
  {
    v1 = (_QWORD *)v0;
    if (gLogCategory_APSRTCReporting <= 50
      && (gLogCategory_APSRTCReporting != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = v1[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __apsrr_setIsSetupToSendMsg_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v1;
    dispatch_sync(v2, block);
    CFRelease(v1);
  }
  else if (gLogCategory_APSRTCReporting <= 50
         && (gLogCategory_APSRTCReporting != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __APSRTCReportingCreate_block_invoke_4(uint64_t a1)
{
  apsrr_setReportingToDead(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
