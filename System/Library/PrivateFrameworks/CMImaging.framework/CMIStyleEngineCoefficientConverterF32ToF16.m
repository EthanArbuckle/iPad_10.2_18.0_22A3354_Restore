@implementation CMIStyleEngineCoefficientConverterF32ToF16

- (id)shaderName
{
  return CFSTR("StyleEngineCoefficientConverter::F32ToF16");
}

- (unint64_t)numberOfCoefficients
{
  void *v2;
  unint64_t v3;

  -[CMIStyleEngineCoefficientConverter inputBuffer](self, "inputBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "length") >> 2;

  return v3;
}

@end
