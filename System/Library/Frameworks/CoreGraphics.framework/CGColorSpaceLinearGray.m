@implementation CGColorSpaceLinearGray

uint64_t __CGColorSpaceLinearGray_block_invoke()
{
  _QWORD *LinearGrayProfile;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  const void *v9;
  unsigned int v10;
  unsigned int v11;

  LinearGrayProfile = CGCMSUtilsCreateLinearGrayProfile();
  v8 = create_from_profile(LinearGrayProfile, 0);
  if (LinearGrayProfile)
    CFRelease(LinearGrayProfile);
  if (v8)
  {
    v8[9] = CFSTR("kCGColorSpaceLinearGray");
    *(_QWORD *)(v8[11] + 48) = CFSTR("Linear Gray");
    *((_BYTE *)v8 + 8) = 1;
    v9 = (const void *)CGColorSpaceCreateWithState((unsigned int *)v8, v1, v2, v3, v4, v5, v6, v7);
    do
    {
      v10 = __ldxr((unsigned int *)v8);
      v11 = v10 - 1;
    }
    while (__stxr(v11, (unsigned int *)v8));
    if (!v11)
      color_space_state_dealloc((uint64_t)v8);
  }
  else
  {
    v9 = 0;
  }
  CGColorSpaceLinearGray_space = (uint64_t)v9;
  CGColorSpaceSetProperty((uint64_t)v9, CFSTR("kCGColorSpaceStandardRangeOriginal"), v9);
  CGColorSpaceSetProperty(CGColorSpaceLinearGray_space, CFSTR("kCGColorSpaceLinearDerivative"), (const void *)CGColorSpaceLinearGray_space);
  CGColorSpaceSetProperty(CGColorSpaceLinearGray_space, CFSTR("kCGColorSpaceExtendedDerivative"), CFSTR("kCGColorSpaceExtendedLinearGray"));
  return CGColorSpaceSetProperty(CGColorSpaceLinearGray_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearGray"));
}

@end
