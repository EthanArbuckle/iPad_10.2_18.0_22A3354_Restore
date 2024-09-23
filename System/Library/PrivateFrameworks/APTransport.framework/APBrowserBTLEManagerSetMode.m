@implementation APBrowserBTLEManagerSetMode

uint64_t __APBrowserBTLEManagerSetMode_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setBTLEMode:", *(unsigned __int16 *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
