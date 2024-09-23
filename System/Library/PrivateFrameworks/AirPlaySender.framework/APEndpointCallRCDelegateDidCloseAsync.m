@implementation APEndpointCallRCDelegateDidCloseAsync

void __APEndpointCallRCDelegateDidCloseAsync_block_invoke(uint64_t a1)
{
  const void *v2;

  if (gLogCategory_APEndpointUtilities <= 50
    && (gLogCategory_APEndpointUtilities != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 48))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v2 = *(const void **)(a1 + 64);
  if (v2)
    CFRelease(v2);
}

@end
