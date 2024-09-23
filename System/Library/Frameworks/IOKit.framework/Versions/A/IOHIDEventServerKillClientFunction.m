@implementation IOHIDEventServerKillClientFunction

void ____IOHIDEventServerKillClientFunction_block_invoke(uint64_t a1)
{
  __IOHIDEventServerKillClient(*(_QWORD *)(a1 + 32), *(uint64_t **)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 16));
}

@end
