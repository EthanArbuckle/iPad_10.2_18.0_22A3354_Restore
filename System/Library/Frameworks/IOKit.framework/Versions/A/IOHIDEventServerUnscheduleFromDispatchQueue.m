@implementation IOHIDEventServerUnscheduleFromDispatchQueue

void __IOHIDEventServerUnscheduleFromDispatchQueue_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 24);
  if (v2)
    IOMIGMachPortUnscheduleFromDispatchQueue(v2, *(_QWORD *)(v1 + 32));
}

@end
