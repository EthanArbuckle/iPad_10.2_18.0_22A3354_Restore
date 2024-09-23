@implementation AppleIDAuthenticationCopyAppleIDs

intptr_t ___AppleIDAuthenticationCopyAppleIDs_block_invoke(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  _QWORD *v6;

  if (cf)
    CFRetain(cf);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = cf;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v6 = *(_QWORD **)(a1 + 40);
    if (v6)
    {
      if (a3)
      {
        CFRetain(a3);
        v6 = *(_QWORD **)(a1 + 40);
      }
      *v6 = a3;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
