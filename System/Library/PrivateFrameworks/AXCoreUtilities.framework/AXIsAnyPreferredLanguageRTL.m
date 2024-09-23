@implementation AXIsAnyPreferredLanguageRTL

uint64_t __AXIsAnyPreferredLanguageRTL_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", a2);
  if (result == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
