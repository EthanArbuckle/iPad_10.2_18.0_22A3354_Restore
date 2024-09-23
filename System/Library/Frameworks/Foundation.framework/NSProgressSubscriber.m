@implementation NSProgressSubscriber

uint64_t __61___NSProgressSubscriber_addPublisher_forID_withValues_isOld___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 32))
  {
    objc_msgSend(*(id *)(v2 + 40), "unlock");
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "unlock");
    return 0;
  }
}

uint64_t __29___NSProgressSubscriber_stop__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_invokeUnpublishingHandler");
}

@end
