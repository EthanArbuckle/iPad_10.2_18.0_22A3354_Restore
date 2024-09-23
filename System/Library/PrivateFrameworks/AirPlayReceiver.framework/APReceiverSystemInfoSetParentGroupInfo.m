@implementation APReceiverSystemInfoSetParentGroupInfo

void __APReceiverSystemInfoSetParentGroupInfo_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;

  if (gLogCategory_APReceiverSystemInfo <= 50
    && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(const void **)(v3 + 160);
  if (v2)
    CFRetain(*(CFTypeRef *)(a1 + 40));
  *(_QWORD *)(v3 + 160) = v2;
  if (v4)
    CFRelease(v4);
  v5 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v5 + 168) = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(v5 + 169) = *(_BYTE *)(a1 + 49);
  sysInfo_updateAPGroupInfo(v5);
  sysInfo_updateAdvertiserInfoAndNotify(*(_QWORD *)(a1 + 32), (uint64_t)CFSTR("AdvertisingParameterChanged"));
}

@end
