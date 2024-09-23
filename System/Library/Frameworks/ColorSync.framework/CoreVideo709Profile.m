@implementation CoreVideo709Profile

void __create_CoreVideo709Profile_block_invoke()
{
  CFDataRef v0;
  uint64_t v1;

  v0 = CFDataCreateWithBytesNoCopy(0, CoreVideo709_data, 660, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v1 = create(v0, 2, 1);
  if (v1)
    *(_OWORD *)(v1 + 128) = xmmword_18B3EAAC0;
  create_CoreVideo709Profile_profile = v1;
  CFRelease(v0);
}

@end
