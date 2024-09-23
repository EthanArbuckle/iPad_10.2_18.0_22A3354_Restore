@implementation LIGetBGRA8888DataForImage

CFDictionaryRef __LIGetBGRA8888DataForImage_block_invoke()
{
  const __CFAllocator *v0;
  CFNumberRef v1;
  CFNumberRef v2;
  void *v3;
  void *v4;
  void *v5;
  CFDictionaryRef result;
  int v7;
  int valuePtr;
  void *values[5];
  void *keys[6];

  keys[5] = *(void **)MEMORY[0x24BDAC8D0];
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  valuePtr = 4;
  v1 = CFNumberCreate(v0, kCFNumberIntType, &valuePtr);
  v7 = 8;
  v2 = CFNumberCreate(v0, kCFNumberIntType, &v7);
  v3 = (void *)*MEMORY[0x24BDBF380];
  keys[0] = *(void **)MEMORY[0x24BDBF388];
  keys[1] = v3;
  v4 = (void *)*MEMORY[0x24BDBF360];
  keys[2] = *(void **)MEMORY[0x24BDBF390];
  keys[3] = v4;
  keys[4] = *(void **)MEMORY[0x24BDBF368];
  v5 = (void *)*MEMORY[0x24BDBF378];
  values[0] = *(void **)MEMORY[0x24BDBD270];
  values[1] = v5;
  values[2] = values[0];
  values[3] = v1;
  values[4] = v2;
  result = CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  LIGetBGRA8888DataForImage___options = (uint64_t)result;
  return result;
}

uint64_t __LIGetBGRA8888DataForImage_block_invoke_2()
{
  return CGImageBlockSetRelease();
}

uint64_t __LIGetBGRA8888DataForImage_block_invoke_3()
{
  return CGDataProviderUngetBytePtr();
}

void __LIGetBGRA8888DataForImage_block_invoke_4(uint64_t a1)
{
  CGContextRelease(*(CGContextRef *)(a1 + 32));
}

@end
