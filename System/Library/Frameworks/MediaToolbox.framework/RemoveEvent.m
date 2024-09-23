@implementation RemoveEvent

void __fpic_RemoveEvent_block_invoke(uint64_t a1)
{
  fpic_ServiceCurrentEvent(*(_QWORD *)(a1 + 32), MEMORY[0x1E0CA2E18]);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
