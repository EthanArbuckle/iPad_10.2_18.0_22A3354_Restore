@implementation CFMessagePortSetDispatchQueue

dispatch_queue_t __CFMessagePortSetDispatchQueue_block_invoke()
{
  qos_class_t v0;
  NSObject *v1;
  dispatch_queue_t result;

  v0 = qos_class_main();
  v1 = dispatch_queue_attr_make_with_qos_class(0, v0, 0);
  result = dispatch_queue_create("com.apple.CFMessagePort", v1);
  CFMessagePortSetDispatchQueue_mportQueue = (uint64_t)result;
  return result;
}

void __CFMessagePortSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  _cfmp_source_invalidated(1, *(_DWORD *)(a1 + 56));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void __CFMessagePortSetDispatchQueue_block_invoke_3(uint64_t a1)
{
  mach_msg_size_t v2;
  mach_msg_header_t *Typed;
  mach_port_t v4;
  mach_msg_return_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = 2048;
  Typed = (mach_msg_header_t *)CFAllocatorAllocateTyped(&__kCFAllocatorSystemDefault, 2048, 848243402, 0);
  for (Typed->msgh_size = 2048; ; Typed->msgh_size = v2)
  {
    Typed->msgh_bits = 0;
    v4 = *(_DWORD *)(a1 + 48);
    Typed->msgh_remote_port = 0;
    Typed->msgh_local_port = v4;
    Typed->msgh_id = 0;
    v5 = mach_msg(Typed, 117440518, 0, v2, *(_DWORD *)(a1 + 48), 0, 0);
    if (v5 != 268451844)
      break;
    v2 = (Typed->msgh_size + 71) & 0xFFFFFFFC;
    Typed = (mach_msg_header_t *)__CFSafelyReallocateWithAllocatorTyped(&__kCFAllocatorSystemDefault, Typed, v2, 4290513023, 0, 0);
  }
  if (v5)
    __break(1u);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __CFMessagePortSetDispatchQueue_block_invoke_4;
  block[3] = &__block_descriptor_tmp_17;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(a1 + 40);
  block[4] = Typed;
  block[5] = v7;
  dispatch_async(v6, block);
}

void __CFMessagePortSetDispatchQueue_block_invoke_4(uint64_t a1)
{
  mach_msg_header_t *v2;
  mach_msg_header_t *v3;
  mach_msg_return_t v4;

  v2 = (mach_msg_header_t *)__CFMessagePortPerform(*(int **)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4), (const __CFAllocator *)&__kCFAllocatorSystemDefault, *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = mach_msg(v2, 1, v2->msgh_size, 0, 0, 0, 0);
    __CFMachMessageCheckForAndDestroyUnsentMessage(v4, v3);
    CFAllocatorDeallocate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v3);
  }
  CFAllocatorDeallocate((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
