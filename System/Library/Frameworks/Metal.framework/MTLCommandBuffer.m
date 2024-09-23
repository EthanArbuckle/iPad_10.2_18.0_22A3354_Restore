@implementation MTLCommandBuffer

void __45___MTLCommandBuffer_presentDrawable_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (objc_msgSend(a2, "error"))
  {
    if (!*(_BYTE *)(a1 + 56))
    {
      v3 = *(_QWORD *)(a1 + 48);
      if (*(_BYTE *)(v3 + 504))
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v3 + 32) + 352));
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentWithOptions:", *(_QWORD *)(a1 + 40));
  }

}

intptr_t __45___MTLCommandBuffer_presentDrawable_options___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 352));
}

intptr_t __37___MTLCommandBuffer_presentDrawable___block_invoke(uint64_t a1, void *a2)
{
  intptr_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "error");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "present");
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 504))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v4 + 32) + 352));
  return result;
}

intptr_t __37___MTLCommandBuffer_presentDrawable___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 352));
}

intptr_t __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke(uint64_t a1, void *a2)
{
  intptr_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "error");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "presentAtTime:", *(double *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 504))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v4 + 32) + 352));
  return result;
}

intptr_t __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 352));
}

intptr_t __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke(uint64_t a1, void *a2)
{
  intptr_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "error");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "presentAfterMinimumDuration:", *(double *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 504))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(v4 + 32) + 352));
  return result;
}

intptr_t __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 352));
}

@end
