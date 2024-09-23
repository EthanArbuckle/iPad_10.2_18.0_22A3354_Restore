@implementation IOHIDQueueSetDispatchQueue

uint64_t __IOHIDQueueSetDispatchQueue_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t msg;
  uint64_t v4;
  uint64_t v5;

  v2 = result;
  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(result + 32) + 152));
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 152) = 0;
    v4 = *(_QWORD *)(v2 + 32);
    v5 = *(_QWORD *)(v4 + 160);
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
      _Block_release(*(const void **)(*(_QWORD *)(v2 + 32) + 160));
      v4 = *(_QWORD *)(v2 + 32);
      *(_QWORD *)(v4 + 160) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(v4 + 144));
    return _IOHIDObjectInternalRelease(*(const void **)(v2 + 32));
  }
  else if (a2 == 2)
  {
    msg = dispatch_mach_msg_get_msg();
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v2 + 32) + 112))(msg, 0, 0, *(_QWORD *)(*(_QWORD *)(v2 + 32) + 120));
  }
  return result;
}

@end
