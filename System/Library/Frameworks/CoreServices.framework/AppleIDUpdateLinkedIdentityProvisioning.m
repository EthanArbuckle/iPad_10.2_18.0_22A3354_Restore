@implementation AppleIDUpdateLinkedIdentityProvisioning

intptr_t ___AppleIDUpdateLinkedIdentityProvisioning_block_invoke(uint64_t a1, char a2, CFTypeRef cf)
{
  _QWORD *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4 = *(_QWORD **)(a1 + 40);
    if (v4)
    {
      if (cf)
      {
        CFRetain(cf);
        v4 = *(_QWORD **)(a1 + 40);
      }
      *v4 = cf;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
