@implementation AppleIDAuthenticationAddAppleID

intptr_t ___AppleIDAuthenticationAddAppleID_block_invoke(uint64_t a1, int a2, int a3, int a4, CFTypeRef cf)
{
  _QWORD *v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
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
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
