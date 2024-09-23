@implementation HandleVideoTargetNoReplyMessage

void __HandleVideoTargetNoReplyMessage_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v1)
    CFRelease(v1);
}

@end
