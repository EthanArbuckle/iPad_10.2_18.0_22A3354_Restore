@implementation CMPhotoDecompressionSessionEnqueueAsynchronousRequest

void __CMPhotoDecompressionSessionEnqueueAsynchronousRequest_block_invoke(int8x16_t *a1)
{
  const void *ValueAtIndex;
  int8x16_t v3;
  NSObject *v4;
  _QWORD block[5];
  int8x16_t v6;

  if (a1[3].i8[0])
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[2].i64[0] + 24), 0xFFFFFFFFFFFFFFFFLL);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 16));
  if (CFArrayGetCount(*(CFArrayRef *)(a1[2].i64[0] + 32)) < 1)
  {
    ValueAtIndex = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[2].i64[0] + 32), 0);
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1[2].i64[0] + 32), 0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 16));
  block[0] = MEMORY[0x1E0C809B0];
  v3 = vextq_s8(a1[2], a1[2], 8uLL);
  v4 = *(NSObject **)(a1[2].i64[0] + 8);
  block[1] = 0x40000000;
  block[2] = __CMPhotoDecompressionSessionEnqueueAsynchronousRequest_block_invoke_2;
  block[3] = &__block_descriptor_tmp_22;
  block[4] = ValueAtIndex;
  v6 = v3;
  dispatch_async(v4, block);
}

void __CMPhotoDecompressionSessionEnqueueAsynchronousRequest_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  const void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(v2 + 16);
    v5 = *(const void **)v2;
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 16));
    v6 = *(_QWORD *)(v3 + 304);
    if (v6
      && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const void *, _QWORD))(v6 + 16))(v6, v3, v4, v5, *(_QWORD *)(v3 + 312)))
    {
      CFSetRemoveValue(*(CFMutableSetRef *)(v3 + 32), v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 16));
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32) + 128);
    if (v7)
      v8 = v7();
    else
      v8 = FigSignalErrorAt();
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 24))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), **(_QWORD **)(a1 + 32), v8, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 40), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 40) + 32), **(const void ***)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 24));
    CMPhotoDecompressionSessionFreeAsyncRequest(*(_QWORD **)(a1 + 32));
  }
  else
  {
    FigSignalErrorAt();
  }
  v9 = *(const void **)(a1 + 40);
  if (v9)
    CFRelease(v9);
}

@end
