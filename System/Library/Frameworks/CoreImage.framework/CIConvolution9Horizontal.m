@implementation CIConvolution9Horizontal

+ (id)customAttributes
{
  CIVector *v2;
  int v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution9Horizontal customAttributes]::default_values, 9);
  v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", CFSTR("RGB"));
  v13[0] = CFSTR("CIAttributeFilterCategories");
  v12[0] = CFSTR("CICategoryStylize");
  v12[1] = CFSTR("CICategoryVideo");
  v12[2] = CFSTR("CICategoryStillImage");
  v12[3] = CFSTR("CICategoryHighDynamicRange");
  v12[4] = CFSTR("CICategoryBuiltIn");
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v5 = CFSTR("7");
  if (v3)
    v5 = CFSTR("15");
  v14[0] = v4;
  v14[1] = v5;
  v13[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v13[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  if (v3)
    v6 = CFSTR("12.0");
  else
    v6 = CFSTR("10.9");
  v14[2] = v6;
  v13[3] = CFSTR("inputWeights");
  v10[0] = CFSTR("CIAttributeIdentity");
  v10[1] = CFSTR("CIAttributeDefault");
  v11[0] = v2;
  v11[1] = v2;
  v14[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v13[4] = CFSTR("inputBias");
  v8[0] = CFSTR("CIAttributeType");
  v8[1] = CFSTR("CIAttributeIdentity");
  v9[0] = CFSTR("CIAttributeTypeScalar");
  v9[1] = &unk_1E2F19290;
  v8[2] = CFSTR("CIAttributeDefault");
  v9[2] = &unk_1E2F19290;
  v14[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
}

- (BOOL)_isIdentity
{
  float v3;
  double *v5;
  uint64_t i;

  -[NSNumber floatValue](self->inputBias, "floatValue");
  if (v3 != 0.0)
    return 0;
  v5 = -[CIVector _values](self->inputWeights, "_values");
  for (i = 0; i != 9; ++i)
  {
    if (i == 4)
    {
      if (v5[4] != 1.0)
        return 0;
    }
    else if (v5[i] != 0.0)
    {
      return 0;
    }
  }
  return 1;
}

- (id)outputImage
{
  CIVector *inputWeights;
  CIImage *v5;
  double v6;
  double v7;
  int v8;
  char v9;
  int v10;

  if (!self->inputImage)
    return 0;
  inputWeights = self->inputWeights;
  if (!inputWeights || -[CIVector count](inputWeights, "count") != 9)
    return 0;
  if (-[CIConvolution9Horizontal _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber doubleValue](self->inputBias, "doubleValue");
  v7 = v6;
  v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", CFSTR("RGB"));
  v9 = v8;
  v5 = apply1DConvolution(self->inputImage, self->inputWeights, v7, 1u, v8);
  v10 = CI_ENABLE_MPS();
  if ((v9 & 1) != 0 || !v10)
    return v5;
  return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyConToImage:width:height:bias:weights:](CIConvolutionProcessor, "applyConToImage:width:height:bias:weights:", self->inputImage, 9, 1, self->inputWeights, v7), v5);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputWeights
{
  return self->inputWeights;
}

- (void)setInputWeights:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputBias
{
  return self->inputBias;
}

- (void)setInputBias:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
