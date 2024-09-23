@implementation C3DGetFramebufferPropertiesToDefines

CFDictionaryRef __C3DGetFramebufferPropertiesToDefines_block_invoke()
{
  CFDictionaryRef result;
  __int128 v1;
  void *keys[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = xmmword_1EA5A4988;
  *(_OWORD *)keys = xmmword_1EA5A4978;
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&v1, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  C3DGetFramebufferPropertiesToDefines_s_dic = (uint64_t)result;
  return result;
}

@end
