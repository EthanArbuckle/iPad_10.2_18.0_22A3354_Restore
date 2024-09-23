@implementation CGColorSpaceCreateExtendedLinearITUR

uint64_t __CGColorSpaceCreateExtendedLinearITUR_2020_block_invoke()
{
  _QWORD *LinearITUR2020Profile;
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

  LinearITUR2020Profile = CGCMSUtilsCreateLinearITUR2020Profile();
  v8 = create_from_profile(LinearITUR2020Profile, 1);
  if (LinearITUR2020Profile)
    CFRelease(LinearITUR2020Profile);
  if (v8)
  {
    v8[9] = CFSTR("kCGColorSpaceExtendedLinearITUR_2020");
    *(_QWORD *)(v8[11] + 48) = CFSTR("Rec. ITU-R BT.2020-1 Extended Linear");
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
  CGColorSpaceCreateExtendedLinearITUR_2020_space = v9;
  CGColorSpaceSetProperty(v9, CFSTR("kCGColorSpaceStandardRangeOriginal"), CFSTR("kCGColorSpaceLinearITUR_2020"));
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearITUR_2020_space, CFSTR("kCGColorSpaceLinearDerivative"), (const void *)CGColorSpaceCreateExtendedLinearITUR_2020_space);
  CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearITUR_2020_space, CFSTR("kCGColorSpaceExtendedDerivative"), (const void *)CGColorSpaceCreateExtendedLinearITUR_2020_space);
  return CGColorSpaceSetProperty(CGColorSpaceCreateExtendedLinearITUR_2020_space, CFSTR("kCGColorSpaceExtendedLinearDerivative"), (const void *)CGColorSpaceCreateExtendedLinearITUR_2020_space);
}

@end
