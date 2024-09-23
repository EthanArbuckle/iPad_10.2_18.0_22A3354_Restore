@implementation FSFontProviderRequestFonts

uint64_t __FSFontProviderRequestFonts_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, MEMORY[0x1E0C9AA60]);
  return result;
}

@end
