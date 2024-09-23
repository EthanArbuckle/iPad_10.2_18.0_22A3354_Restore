@implementation CGColorSpaceCreateSRGB

uint64_t __CGColorSpaceCreateSRGB_block_invoke()
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
  const void *v10;
  unsigned int v11;
  unsigned int v12;

  if (color_space_state_create_sRGB_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_sRGB_cglibrarypredicate, &__block_literal_global_83_1664);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_sRGB_f;
  if (color_space_state_create_sRGB_cglibrarypredicate_84 != -1)
    dispatch_once(&color_space_state_create_sRGB_cglibrarypredicate_84, &__block_literal_global_86);
  v1 = (_QWORD *)v0(color_space_state_create_sRGB_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceSRGB");
    *(_QWORD *)(v9[11] + 48) = CFSTR("sRGB IEC61966-2.1");
    *((_BYTE *)v9 + 8) = 1;
    v10 = (const void *)CGColorSpaceCreateWithState((unsigned int *)v9, v2, v3, v4, v5, v6, v7, v8);
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
  CGColorSpaceCreateSRGB_space = (uint64_t)v10;
  CGColorSpaceSetProperty((uint64_t)v10, CFSTR("kCGColorSpaceStandardRangeOriginal"), v10);
  CGColorSpaceSetProperty(CGColorSpaceCreateSRGB_space, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearSRGB"));
  CGColorSpaceSetProperty(CGColorSpaceCreateSRGB_space, CFSTR("kCGColorSpaceExtendedDerivative"), CFSTR("kCGColorSpaceExtendedSRGB"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateSRGB_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearSRGB"));
}

@end
