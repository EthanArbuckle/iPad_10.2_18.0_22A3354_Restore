@implementation CGColorSpaceCreateDeviceRGB

void __CGColorSpaceCreateDeviceRGB_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  color_space_state_create_device_rgb();
  if (v0)
  {
    v8 = (unsigned int *)v0;
    *(_BYTE *)(v0 + 8) = 1;
    v9 = CGColorSpaceCreateWithState((unsigned int *)v0, v1, v2, v3, v4, v5, v6, v7);
    do
    {
      v10 = __ldxr(v8);
      v11 = v10 - 1;
    }
    while (__stxr(v11, v8));
    if (!v11)
      color_space_state_dealloc((uint64_t)v8);
  }
  else
  {
    v9 = 0;
  }
  CGColorSpaceCreateDeviceRGB_space = v9;
}

@end
