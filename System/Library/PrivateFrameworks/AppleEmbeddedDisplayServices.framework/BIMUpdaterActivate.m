@implementation BIMUpdaterActivate

void __BIMUpdaterActivate_block_invoke(uint64_t a1)
{
  __eepromServiceCB(*(_QWORD *)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __BIMUpdaterActivate_block_invoke_2(uint64_t a1)
{
  __afkServiceCB(*(_QWORD *)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
