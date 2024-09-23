@implementation CGColorSpaceExtendedLinearSRGB

uint64_t __CGColorSpaceExtendedLinearSRGB_block_invoke()
{
  _QWORD *LinearSRGBProfile;
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

  LinearSRGBProfile = CGCMSUtilsCreateLinearSRGBProfile();
  v8 = create_from_profile(LinearSRGBProfile, 1);
  if (LinearSRGBProfile)
    CFRelease(LinearSRGBProfile);
  if (v8)
  {
    v8[9] = CFSTR("kCGColorSpaceExtendedLinearSRGB");
    *(_QWORD *)(v8[11] + 48) = CFSTR("sRGB IEC61966-2.1 Linear");
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
  CGColorSpaceExtendedLinearSRGB_space = v9;
  CGColorSpaceSetProperty(v9, CFSTR("kCGColorSpaceStandardRangeOriginal"), CFSTR("kCGColorSpaceLinearSRGB"));
  CGColorSpaceSetProperty(CGColorSpaceExtendedLinearSRGB_space, CFSTR("kCGColorSpaceLinearDerivative"), (const void *)CGColorSpaceExtendedLinearSRGB_space);
  CGColorSpaceSetProperty(CGColorSpaceExtendedLinearSRGB_space, CFSTR("kCGColorSpaceExtendedDerivative"), (const void *)CGColorSpaceExtendedLinearSRGB_space);
  return CGColorSpaceSetProperty(CGColorSpaceExtendedLinearSRGB_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), (const void *)CGColorSpaceExtendedLinearSRGB_space);
}

@end
