@implementation GPU

CFDictionaryRef __get_disable_GPU_provider_options_block_invoke()
{
  CFDictionaryRef result;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  keys[0] = CFSTR("kCGImagePreferGPUForColorConversion");
  values = (void *)*MEMORY[0x1E0C9AE40];
  result = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  get_disable_GPU_provider_options_options_singleton = (uint64_t)result;
  return result;
}

@end
