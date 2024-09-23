@implementation AppleIDAuthenticationCopyStatus

intptr_t ___AppleIDAuthenticationCopyStatus_block_invoke(uint64_t a1, char a2, CFTypeRef cf, CFTypeRef a4)
{
  _QWORD *v6;
  _QWORD *v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v6 = *(_QWORD **)(a1 + 40);
  if (v6)
  {
    if (cf)
    {
      CFRetain(cf);
      v6 = *(_QWORD **)(a1 + 40);
    }
    *v6 = cf;
  }
  v8 = *(_QWORD **)(a1 + 48);
  if (v8)
  {
    if (a4)
    {
      CFRetain(a4);
      v8 = *(_QWORD **)(a1 + 48);
    }
    *v8 = a4;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

@end
