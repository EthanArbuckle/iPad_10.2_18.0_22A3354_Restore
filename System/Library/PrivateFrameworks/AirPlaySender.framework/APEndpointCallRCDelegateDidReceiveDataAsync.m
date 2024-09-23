@implementation APEndpointCallRCDelegateDidReceiveDataAsync

void __APEndpointCallRCDelegateDidReceiveDataAsync_block_invoke(uint64_t a1)
{
  const void *v2;

  if (gLogCategory_APEndpointUtilities <= 30
    && (gLogCategory_APEndpointUtilities != -1 || _LogCategory_Initialize()))
  {
    CFDataGetLength(*(CFDataRef *)(a1 + 48));
    LogPrintF();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1 + 56))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v2 = *(const void **)(a1 + 72);
  if (v2)
    CFRelease(v2);
}

@end
