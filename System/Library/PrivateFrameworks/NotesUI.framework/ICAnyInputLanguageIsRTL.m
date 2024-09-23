@implementation ICAnyInputLanguageIsRTL

BOOL __ICAnyInputLanguageIsRTL_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", a2) == 2;
}

@end
