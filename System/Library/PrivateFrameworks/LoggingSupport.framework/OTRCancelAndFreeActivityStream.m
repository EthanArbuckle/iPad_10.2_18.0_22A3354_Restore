@implementation OTRCancelAndFreeActivityStream

void __OTRCancelAndFreeActivityStream_block_invoke(uint64_t a1)
{
  CFTypeRef *v2;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(_QWORD))(mobdevtab + 88))(**(_QWORD **)(a1 + 32));
  v2 = *(CFTypeRef **)(a1 + 32);
  if (*v2)
  {
    CFRelease(*v2);
    v2 = *(CFTypeRef **)(a1 + 32);
  }
  *v2 = 0;
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  free(*(void **)(a1 + 32));
}

@end
