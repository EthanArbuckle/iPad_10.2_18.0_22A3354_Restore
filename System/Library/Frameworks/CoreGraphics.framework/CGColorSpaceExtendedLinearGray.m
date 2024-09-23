@implementation CGColorSpaceExtendedLinearGray

uint64_t __CGColorSpaceExtendedLinearGray_block_invoke()
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
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  LinearGrayProfile = CGCMSUtilsCreateLinearGrayProfile();
  v8 = create_from_profile(LinearGrayProfile, 1);
  if (LinearGrayProfile)
    CFRelease(LinearGrayProfile);
  if (v8)
  {
    v8[9] = CFSTR("kCGColorSpaceExtendedLinearGray");
    *(_QWORD *)(v8[11] + 48) = CFSTR("Linear Gray");
    *((_BYTE *)v8 + 8) = 1;
    v9 = CGColorSpaceCreateWithState((unsigned int *)v8, v1, v2, v3, v4, v5, v6, v7);
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
  CGColorSpaceExtendedLinearGray_space = v9;
  CGColorSpaceSetProperty(v9, CFSTR("kCGColorSpaceStandardRangeOriginal"), CFSTR("kCGColorSpaceLinearGray"));
  CGColorSpaceSetProperty(CGColorSpaceExtendedLinearGray_space, CFSTR("kCGColorSpaceLinearDerivative"), (const void *)CGColorSpaceExtendedLinearGray_space);
  CGColorSpaceSetProperty(CGColorSpaceExtendedLinearGray_space, CFSTR("kCGColorSpaceExtendedDerivative"), (const void *)CGColorSpaceExtendedLinearGray_space);
  return CGColorSpaceSetProperty(CGColorSpaceExtendedLinearGray_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), CFSTR("kCGColorSpaceExtendedLinearGray"));
}

@end
