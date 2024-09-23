@implementation CGColorSpaceCreateUncalibratedRGB

void __CGColorSpaceCreateUncalibratedRGB_block_invoke()
{
  uint64_t v0;
  unsigned int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  color_space_state_create_device_rgb();
  v1 = (unsigned int *)v0;
  *(_QWORD *)(v0 + 72) = CFSTR("kCGColorSpaceUncalibratedRGB");
  *(_WORD *)(v0 + 8) = 257;
  v9 = CGColorSpaceCreateWithState((unsigned int *)v0, v2, v3, v4, v5, v6, v7, v8);
  do
  {
    v10 = __ldxr(v1);
    v11 = v10 - 1;
  }
  while (__stxr(v11, v1));
  if (!v11)
    color_space_state_dealloc((uint64_t)v1);
  CGColorSpaceCreateUncalibratedRGB_space = v9;
}

@end
