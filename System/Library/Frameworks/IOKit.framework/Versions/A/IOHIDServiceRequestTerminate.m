@implementation IOHIDServiceRequestTerminate

void __IOHIDServiceRequestTerminate_block_invoke(uint64_t a1)
{
  _IOHIDServiceSetPropertyForClient(*(_QWORD *)(a1 + 32), CFSTR("RequestTerminate"), (const void *)*MEMORY[0x1E0C9AE50], (CFTypeRef)*MEMORY[0x1E0C9B0D0]);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
