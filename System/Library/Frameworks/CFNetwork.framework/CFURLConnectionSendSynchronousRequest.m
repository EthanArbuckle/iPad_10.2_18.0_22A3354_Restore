@implementation CFURLConnectionSendSynchronousRequest

intptr_t __CFURLConnectionSendSynchronousRequest_block_invoke(uint64_t a1, CFTypeRef cf, void *a3, const void *a4)
{
  CFTypeRef v7;
  CFTypeRef v8;

  if (cf)
    v7 = CFRetain(cf);
  else
    v7 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  if (a4)
    v8 = CFRetain(a4);
  else
    v8 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
