@implementation IOHIDDeviceSetDispatchQueue

void __IOHIDDeviceSetDispatchQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t msg;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  if (a2 == 8)
  {
    os_unfair_recursive_lock_lock_with_options();
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 216));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = 0;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
    os_unfair_recursive_lock_unlock();
    os_unfair_recursive_lock_lock_with_options();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
    if (v5)
      v6 = v4 == 0;
    else
      v6 = 0;
    if (v6)
    {
      (*(void (**)(void))(v5 + 16))();
      _Block_release(*(const void **)(*(_QWORD *)(a1 + 32) + 232));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0;
    }
    os_unfair_recursive_lock_unlock();
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 208));
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else if (a2 == 2)
  {
    msg = dispatch_mach_msg_get_msg();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 176))(msg, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  }
}

void __IOHIDDeviceSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  os_unfair_recursive_lock_lock_with_options();
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 240));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
  os_unfair_recursive_lock_unlock();
  os_unfair_recursive_lock_lock_with_options();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  if (v3)
    v4 = v2 == 0;
  else
    v4 = 0;
  if (v4)
  {
    (*(void (**)(void))(v3 + 16))();
    _Block_release(*(const void **)(*(_QWORD *)(a1 + 32) + 232));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0;
  }
  os_unfair_recursive_lock_unlock();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
