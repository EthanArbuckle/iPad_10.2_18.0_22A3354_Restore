@implementation IOHIDUserDeviceSetDispatchQueue

uint64_t __IOHIDUserDeviceSetDispatchQueue_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t msg;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result;
  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(result + 32) + 128));
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 128) = 0;
    __IOHIDUserDeviceDestroyDevice(*(_QWORD *)(v2 + 32));
    v6 = *(_QWORD *)(v2 + 32);
    v7 = *(_QWORD *)(v6 + 136);
    if (v7)
    {
      (*(void (**)(void))(v7 + 16))();
      _Block_release(*(const void **)(*(_QWORD *)(v2 + 32) + 136));
      v6 = *(_QWORD *)(v2 + 32);
      *(_QWORD *)(v6 + 136) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(v6 + 120));
    return _IOHIDObjectInternalRelease(*(const void **)(v2 + 32));
  }
  else if (a2 == 2)
  {
    msg = dispatch_mach_msg_get_msg();
    return __IOHIDUserDeviceQueueCallback(msg, v4, v5, *(_QWORD *)(v2 + 32));
  }
  return result;
}

@end
