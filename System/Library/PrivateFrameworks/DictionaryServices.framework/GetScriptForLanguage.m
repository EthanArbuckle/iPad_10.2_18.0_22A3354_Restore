@implementation GetScriptForLanguage

CFArrayRef __GetScriptForLanguage_block_invoke()
{
  CFArrayRef result;
  const void *__dst[125];

  __dst[124] = *(const void **)MEMORY[0x1E0C80C00];
  memcpy(__dst, off_1E8B56E08, 0x3E0uLL);
  result = CFArrayCreate(0, __dst, 124, MEMORY[0x1E0C9B378]);
  GetScriptForLanguage__LatinLanguagesArray = (uint64_t)result;
  return result;
}

@end
