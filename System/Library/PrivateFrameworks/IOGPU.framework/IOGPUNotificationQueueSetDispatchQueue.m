@implementation IOGPUNotificationQueueSetDispatchQueue

void __IOGPUNotificationQueueSetDispatchQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 72));
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = 0;
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 48));
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 56));
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  else if (a2 == 2)
  {
    dispatch_mach_msg_get_msg();
    (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
  }
}

@end
