@implementation CGColorSpaceCreateExtendedITUR

uint64_t __CGColorSpaceCreateExtendedITUR_2020_block_invoke()
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

  if (color_space_state_create_extended_itur_2020_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_extended_itur_2020_cglibrarypredicate, &__block_literal_global_149);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_extended_itur_2020_f;
  if (color_space_state_create_extended_itur_2020_cglibrarypredicate_150 != -1)
    dispatch_once(&color_space_state_create_extended_itur_2020_cglibrarypredicate_150, &__block_literal_global_152);
  v1 = (_QWORD *)v0(color_space_state_create_extended_itur_2020_s);
  v9 = create_from_profile(v1, 1);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceExtendedITUR_2020");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.2020-1 Extended");
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
  CGColorSpaceCreateExtendedITUR_2020_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceStandardRangeOriginal"), CFSTR("kCGColorSpaceITUR_2020"));
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedITUR_2020_space, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearITUR_2020"));
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedITUR_2020_space, CFSTR("kCGColorSpaceExtendedDerivative"), (const void *)CGColorSpaceCreateExtendedITUR_2020_space);
  return CGColorSpaceSetProperty(CGColorSpaceCreateExtendedITUR_2020_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearITUR_2020"));
}

@end
