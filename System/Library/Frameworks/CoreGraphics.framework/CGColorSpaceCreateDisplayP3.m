@implementation CGColorSpaceCreateDisplayP3

uint64_t __CGColorSpaceCreateDisplayP3_PQ_block_invoke()
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

  if (color_space_state_create_p3_PQ_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_p3_PQ_cglibrarypredicate, &__block_literal_global_43);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_p3_PQ_f;
  if (color_space_state_create_p3_PQ_cglibrarypredicate_44 != -1)
    dispatch_once(&color_space_state_create_p3_PQ_cglibrarypredicate_44, &__block_literal_global_46);
  v1 = (_QWORD *)v0(color_space_state_create_p3_PQ_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceDisplayP3_PQ");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Display P3; SMPTE ST 2084 PQ EOTF");
    *((_BYTE *)v9 + 16) = 1;
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
  CGColorSpaceCreateDisplayP3_PQ_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearDisplayP3"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_PQ_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearDisplayP3"));
}

uint64_t __CGColorSpaceCreateDisplayP3_HLG_block_invoke()
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

  if (color_space_state_create_p3_HLG_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_p3_HLG_cglibrarypredicate, &__block_literal_global_51);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_p3_HLG_f;
  if (color_space_state_create_p3_HLG_cglibrarypredicate_52 != -1)
    dispatch_once(&color_space_state_create_p3_HLG_cglibrarypredicate_52, &__block_literal_global_54_1648);
  v1 = (_QWORD *)v0(color_space_state_create_p3_HLG_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceDisplayP3_HLG");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Display P3; ARIB STD-B67 HLG");
    *((_BYTE *)v9 + 17) = 1;
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
  CGColorSpaceCreateDisplayP3_HLG_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearDisplayP3"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_HLG_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearDisplayP3"));
}

uint64_t __CGColorSpaceCreateDisplayP3_block_invoke()
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

  if (color_space_state_create_display_p3_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_display_p3_cglibrarypredicate, &__block_literal_global_24);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_display_p3_f;
  if (color_space_state_create_display_p3_cglibrarypredicate_25 != -1)
    dispatch_once(&color_space_state_create_display_p3_cglibrarypredicate_25, &__block_literal_global_27);
  v1 = (_QWORD *)v0(color_space_state_create_display_p3_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceDisplayP3");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Display P3");
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
  CGColorSpaceCreateDisplayP3_space = (uint64_t)v10;
  CGColorSpaceSetProperty((uint64_t)v10, CFSTR("kCGColorSpaceStandardRangeOriginal"), v10);
  CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_space, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearDisplayP3"));
  CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_space, CFSTR("kCGColorSpaceExtendedDerivative"), CFSTR("kCGColorSpaceExtendedDisplayP3"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearDisplayP3"));
}

uint64_t __CGColorSpaceCreateDisplayP3_709OETF_block_invoke()
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

  if (color_space_state_create_p3_709_cglibrarypredicate != -1)
    dispatch_once(&color_space_state_create_p3_709_cglibrarypredicate, &__block_literal_global_59);
  v0 = (uint64_t (*)(uint64_t))color_space_state_create_p3_709_f;
  if (color_space_state_create_p3_709_cglibrarypredicate_60 != -1)
    dispatch_once(&color_space_state_create_p3_709_cglibrarypredicate_60, &__block_literal_global_62_1652);
  v1 = (_QWORD *)v0(color_space_state_create_p3_709_s);
  v9 = create_from_profile(v1, 0);
  if (v1)
    CFRelease(v1);
  if (v9)
  {
    v9[9] = CFSTR("kCGColorSpaceDisplayP3_709OETF");
    *(_QWORD *)(v9[11] + 48) = CFSTR("Display P3; ITU-R 709 OETF");
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
  CGColorSpaceCreateDisplayP3_709OETF_space = v10;
  CGColorSpaceSetProperty(v10, CFSTR("kCGColorSpaceLinearDerivative"), CFSTR("kCGColorSpaceLinearDisplayP3"));
  return CGColorSpaceSetProperty(CGColorSpaceCreateDisplayP3_709OETF_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearDisplayP3"));
}

@end
