@implementation GTBaseStreamTransport

void __43__GTBaseStreamTransport__relayBuffer_size___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_relayBufferInner:size:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
  if (*(_BYTE *)(a1 + 64))
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
}

size_t __48__GTBaseStreamTransport__relayBufferInner_size___block_invoke(uint64_t a1)
{
  uint64_t v2;
  size_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  if (*(_QWORD *)(v2 + 32) >= *(_QWORD *)(a1 + 40))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = *(_QWORD *)(v2 + 32);
  memcpy((void *)(*(_QWORD *)(v2 + 40) + v2), *(const void **)(a1 + 48), v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + 40) += v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) + 32) -= v3;
  return v3;
}

id __43__GTBaseStreamTransport__readAndAccumulate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRead:size:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 40) + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 32));
}

@end
