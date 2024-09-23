@implementation CreateReceivedMemoryAllocator

void __CreateReceivedMemoryAllocator_block_invoke(uint64_t a1)
{
  id *v1;
  id *v2;
  CFAllocatorContext v3;

  v1 = FigCFWeakReferenceHolderCopyReferencedObject(*(id **)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    memset(&v3, 0, sizeof(v3));
    CFAllocatorGetContext((CFAllocatorRef)v1, &v3);
    if (v3.info)
      receivedMemoryAllocator_sendPendingBatchOfBlockSNtoDecrementUseCount((pthread_mutex_t **)v3.info);
    CFRelease(v2);
  }
}

@end
