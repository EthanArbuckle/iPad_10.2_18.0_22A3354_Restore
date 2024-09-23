@implementation CGColorSpaceCreateITUR

uint64_t __CGColorSpaceCreateITUR_2100_HLG_block_invoke()
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

  if (color_space_state_create_itur_2100_HLG_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_itur_2100_HLG_cglibrarypredicate, &__block_literal_global_166);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_itur_2100_HLG_f;
  if (color_space_state_create_itur_2100_HLG_cglibrarypredicate_167 != -1)
    dispatch_once(&color_space_state_create_itur_2100_HLG_cglibrarypredicate_167, &__block_literal_global_169_1686);
  v1 = (_QWORD *)v0(color_space_state_create_itur_2100_HLG_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceITUR_2100_HLG");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.2020 HLG");
    if (should_allow_as_output_space_predicate != -1)
      dispatch_once(&should_allow_as_output_space_predicate, &__block_literal_global_223);
    if (!should_allow_as_output_space_should_allow)
      *((_BYTE *)v9 + 10) = 0;
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
  CGColorSpaceCreateITUR_2100_HLG_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearITUR_2020"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2100_HLG_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearITUR_2020"));
}

uint64_t __CGColorSpaceCreateITUR_2100_PQ_block_invoke()
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

  if (color_space_state_create_itur_2100_PQ_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_itur_2100_PQ_cglibrarypredicate, &__block_literal_global_158);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_itur_2100_PQ_f;
  if (color_space_state_create_itur_2100_PQ_cglibrarypredicate_159 != -1)
    dispatch_once(&color_space_state_create_itur_2100_PQ_cglibrarypredicate_159, &__block_literal_global_161);
  v1 = (_QWORD *)v0(color_space_state_create_itur_2100_PQ_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceITUR_2100_PQ");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.2100 PQ");
    if (should_allow_as_output_space_predicate != -1)
      dispatch_once(&should_allow_as_output_space_predicate, &__block_literal_global_223);
    if (!should_allow_as_output_space_should_allow)
      *((_BYTE *)v9 + 10) = 0;
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
  CGColorSpaceCreateITUR_2100_PQ_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearITUR_2020"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2100_PQ_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearITUR_2020"));
}

uint64_t __CGColorSpaceCreateITUR_2020_sRGBGamma_block_invoke()
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

  if (color_space_state_create_itur_2020_sRGB_gamma_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_itur_2020_sRGB_gamma_cglibrarypredicate, &__block_literal_global_139);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_itur_2020_sRGB_gamma_f;
  if (color_space_state_create_itur_2020_sRGB_gamma_cglibrarypredicate_140 != -1)
    dispatch_once(&color_space_state_create_itur_2020_sRGB_gamma_cglibrarypredicate_140, &__block_literal_global_142);
  v1 = (_QWORD *)v0(color_space_state_create_itur_2020_sRGB_gamma_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceITUR_2020_sRGBGamma");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.2020-1; sRGB Gamma");
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
  CGColorSpaceCreateITUR_2020_sRGBGamma_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearITUR_2020"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_sRGBGamma_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearITUR_2020"));
}

uint64_t __CGColorSpaceCreateITUR_709_block_invoke()
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

  if (color_space_state_create_itur_709_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_itur_709_cglibrarypredicate, &__block_literal_global_107);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_itur_709_f;
  if (color_space_state_create_itur_709_cglibrarypredicate_108 != -1)
    dispatch_once(&color_space_state_create_itur_709_cglibrarypredicate_108, &__block_literal_global_110);
  v1 = (_QWORD *)v0(color_space_state_create_itur_709_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceITUR_709");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.709-5");
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
  CGColorSpaceCreateITUR_709_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearSRGB"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateITUR_709_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearSRGB"));
}

uint64_t __CGColorSpaceCreateITUR_2020_block_invoke()
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

  if (color_space_state_create_itur_2020_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_itur_2020_cglibrarypredicate, &__block_literal_global_131);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_itur_2020_f;
  if (color_space_state_create_itur_2020_cglibrarypredicate_132 != -1)
    dispatch_once(&color_space_state_create_itur_2020_cglibrarypredicate_132, &__block_literal_global_134);
  v1 = (_QWORD *)v0(color_space_state_create_itur_2020_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceITUR_2020");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.2020-1");
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
  CGColorSpaceCreateITUR_2020_space = (uint64_t)v10;
  CGColorSpaceSetProperty((uint64_t)v10, CFSTR("kCGColorSpaceStandardRangeOriginal"), v10);
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_space, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearITUR_2020"));
  CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_space, CFSTR("kCGColorSpaceExtendedDerivative"), CFSTR("kCGColorSpaceExtendedITUR_2020"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateITUR_2020_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearITUR_2020"));
}

uint64_t __CGColorSpaceCreateITUR_709_HLG_block_invoke()
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

  if (color_space_state_create_itur_709_hlg_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_itur_709_hlg_cglibrarypredicate, &__block_literal_global_123);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_itur_709_hlg_f;
  if (color_space_state_create_itur_709_hlg_cglibrarypredicate_124 != -1)
    dispatch_once(&color_space_state_create_itur_709_hlg_cglibrarypredicate_124, &__block_literal_global_126);
  v1 = (_QWORD *)v0(color_space_state_create_itur_709_hlg_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceITUR_709_HLG");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.709-5; ARIB STD-B67 HLG");
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
  CGColorSpaceCreateITUR_709_HLG_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearSRGB"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateITUR_709_HLG_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearSRGB"));
}

uint64_t __CGColorSpaceCreateITUR_709_PQ_block_invoke()
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

  if (color_space_state_create_itur_709_pq_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_itur_709_pq_cglibrarypredicate, &__block_literal_global_115);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_itur_709_pq_f;
  if (color_space_state_create_itur_709_pq_cglibrarypredicate_116 != -1)
    dispatch_once(&color_space_state_create_itur_709_pq_cglibrarypredicate_116, &__block_literal_global_118_1674);
  v1 = (_QWORD *)v0(color_space_state_create_itur_709_pq_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceITUR_709_PQ");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Rec. ITU-R BT.709-5; SMPTE ST 2084 PQ");
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
  CGColorSpaceCreateITUR_709_PQ_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearSRGB"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateITUR_709_PQ_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearSRGB"));
}

@end
