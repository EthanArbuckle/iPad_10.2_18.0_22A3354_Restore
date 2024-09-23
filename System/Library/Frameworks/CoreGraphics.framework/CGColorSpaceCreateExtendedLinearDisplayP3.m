@implementation CGColorSpaceCreateExtendedLinearDisplayP3

uint64_t __CGColorSpaceCreateExtendedLinearDisplayP3_block_invoke()
{
  _QWORD *LinearDisplayP3Profile;
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

  LinearDisplayP3Profile = CGCMSUtilsCreateLinearDisplayP3Profile();
  v8 = create_from_profile(LinearDisplayP3Profile, 1);
  if (LinearDisplayP3Profile)
    CFRelease(LinearDisplayP3Profile);
  if (v8)
  {
    v8[9] = CFSTR("kCGColorSpaceExtendedLinearDisplayP3");
    *(_QWORD *)(v8[11] + 48) = CFSTR("Display P3 Extended Linear");
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
  CGColorSpaceCreateExtendedLinearDisplayP3_space = v9;
  CGColorSpaceSetProperty(v9, CFSTR("kCGColorSpaceStandardRangeOriginal"), CFSTR("kCGColorSpaceLinearDisplayP3"));
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearDisplayP3_space, CFSTR("kCGColorSpaceLinearDerivative"), (const void *)CGColorSpaceCreateExtendedLinearDisplayP3_space);
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearDisplayP3_space, CFSTR("kCGColorSpaceExtendedDerivative"), (const void *)CGColorSpaceCreateExtendedLinearDisplayP3_space);
  return CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearDisplayP3_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), (const void *)CGColorSpaceCreateExtendedLinearDisplayP3_space);
}

@end
