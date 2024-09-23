@implementation CGColorSpaceCreateGenericRGB

void __CGColorSpaceCreateGenericRGB_block_invoke()
{
  uint64_t (*v0)(uint64_t);
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;

  if (color_space_state_create_generic_rgb_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_generic_rgb_cglibrarypredicate, &__block_literal_global_8);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_generic_rgb_f;
  if (color_space_state_create_generic_rgb_cglibrarypredicate_9 != -1)
    dispatch_once(&color_space_state_create_generic_rgb_cglibrarypredicate_9, &__block_literal_global_11_1627);
  v1 = (_QWORD *)v0(color_space_state_create_generic_rgb_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceGenericRGB");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Generic RGB Profile");
    *((_BYTE *)v9 + 8) = 1;
    v10 = CGColorSpaceCreateWithState((unsigned int *)v9, v2, v3, v4, v5, v6, v7, v8);
    do
    {
      v11 = __ldxr((unsigned int *)v9);
      v12 = v11 - 1;
    }
    while (__stxr(v12, (unsigned int *)v9));
    if (!v12)
      color_space_state_dealloc((uint64_t)v9);
  }
  else
  {
    v10 = 0;
  }
  CGColorSpaceCreateGenericRGB_space = v10;
}

@end
