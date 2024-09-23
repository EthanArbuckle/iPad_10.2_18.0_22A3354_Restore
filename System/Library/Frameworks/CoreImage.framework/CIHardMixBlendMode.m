@implementation CIHardMixBlendMode

- (id)_kernel
{
  return +[CIBlendKernel hardMix](CIBlendKernel, "hardMix");
}

+ (id)customAttributes
{
  _QWORD v3[7];
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryCompositeOperation");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryInterlaced");
  v3[4] = CFSTR("CICategoryNonSquarePixels");
  v3[5] = CFSTR("CICategoryBuiltIn");
  v3[6] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
}

@end
