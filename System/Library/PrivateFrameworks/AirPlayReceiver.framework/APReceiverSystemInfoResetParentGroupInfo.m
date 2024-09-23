@implementation APReceiverSystemInfoResetParentGroupInfo

void __APReceiverSystemInfoResetParentGroupInfo_block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (gLogCategory_APReceiverSystemInfo <= 50
    && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 160))
  {
    CFRelease(*(CFTypeRef *)(v2 + 160));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_WORD *)(v2 + 168) = 0;
  sysInfo_updateAPGroupInfo(v2);
  sysInfo_updateAdvertiserInfoAndNotify(*(_QWORD *)(a1 + 32), (uint64_t)CFSTR("AdvertisingParameterChanged"));
}

@end
