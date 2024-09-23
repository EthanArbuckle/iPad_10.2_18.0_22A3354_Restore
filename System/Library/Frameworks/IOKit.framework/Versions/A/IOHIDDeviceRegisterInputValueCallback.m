@implementation IOHIDDeviceRegisterInputValueCallback

void __IOHIDDeviceRegisterInputValueCallback_block_invoke(uint64_t a1)
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
