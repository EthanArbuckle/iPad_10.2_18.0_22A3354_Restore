@implementation IOHIDEventSystemClientSetDispatchQueue

void __IOHIDEventSystemClientSetDispatchQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t msg;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 296));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 304);
    if (v7)
    {
      (*(void (**)(void))(v7 + 16))();
      _Block_release(*(const void **)(*(_QWORD *)(a1 + 32) + 304));
      v6 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(v6 + 304) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(v6 + 400));
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 488));
    _IOHIDObjectInternalRelease(*(const void **)(a1 + 32));
  }
  else if (a2 == 2)
  {
    msg = dispatch_mach_msg_get_msg();
    __IOHIDEventSystemClientQueueCallback(msg, v4, v5, *(_QWORD *)(a1 + 32));
  }
}

uint64_t __IOHIDEventSystemClientSetDispatchQueue_block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t msg;

  v2 = result;
  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(result + 32) + 72));
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 72) = 0;
    return _IOHIDObjectInternalRelease(*(const void **)(v2 + 32));
  }
  else if (a2 == 2)
  {
    msg = dispatch_mach_msg_get_msg();
    return __IOHIDEventSystemClientTerminationCallback(msg, *(_QWORD *)(v2 + 32), 0);
  }
  return result;
}

@end
