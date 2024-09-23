@implementation AppleIDAuthenticationCopyMyInfo

intptr_t ___AppleIDAuthenticationCopyMyInfo_block_invoke(uint64_t a1, CFTypeRef cf, CFTypeRef a3)
{
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = cf;
  if (a3 && *(_QWORD *)(a1 + 40))
  {
    CFRetain(a3);
    **(_QWORD **)(a1 + 40) = a3;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
