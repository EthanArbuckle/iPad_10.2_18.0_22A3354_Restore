@implementation CIConvolution5X5

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
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution5X5 customAttributes]::default_values, 25);
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
  for (i = 0; i != 25; ++i)
  {
    if (i == 12)
    {
      if (v5[12] != 1.0)
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
  double *v6;
  CIVector *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double *v11;
  int v12;
  uint64_t i;
  double v14;
  uint64_t v15;
  double *v16;
  __int128 v17;
  double *v18;
  double v19;
  uint64_t j;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  double v24;
  double v25;
  double x;
  double y;
  double width;
  double height;
  CIImage *inputImage;
  uint64_t v31;
  double v32;
  CIVector *v33;
  uint64_t k;
  CIVector *v35;
  CIImage *v36;
  CIImage *v37;
  void (***v38)(CI::GeneralKernel *__hidden);
  CIVector *v39;
  CIVector *v40;
  CIVector *v41;
  CIVector *v42;
  char v43;
  CIVector *v44;
  CIVector *v45;
  CIKernel *v46;
  char v47;
  float v48[25];
  _QWORD v49[8];
  _BYTE v50[64];
  uint64_t v51;
  double v52[5];
  _OWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  CGRect v56;
  CGRect v57;

  v55 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputWeights = self->inputWeights;
  if (!inputWeights)
    return 0;
  if (-[CIVector count](inputWeights, "count") != 25)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CIConvolutionWeights"), CFSTR("CIConvolution5X5 expects inputWeights to be a length-25 CIVector"));
  if (-[CIConvolution5X5 _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  v6 = -[CIVector _values](self->inputWeights, "_values");
  LODWORD(v7) = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", CFSTR("RGB"));
  v8 = 0;
  v9 = 0.0;
  LODWORD(v10) = -1;
  v11 = v6;
  v12 = -1;
  do
  {
    for (i = 0; i != 5; ++i)
    {
      v14 = fabs(v11[i]);
      if (v14 <= v9)
      {
        v10 = v10;
      }
      else
      {
        v9 = v14;
        v12 = i;
        v10 = v8;
      }
    }
    ++v8;
    v11 += 5;
  }
  while (v8 != 5);
  v15 = 0;
  v16 = &v6[5 * (int)v10];
  v17 = *((_OWORD *)v16 + 1);
  v53[0] = *(_OWORD *)v16;
  v53[1] = v17;
  v54 = *((_QWORD *)v16 + 4);
  v18 = &v6[v12];
  do
  {
    v19 = *v18;
    v18 += 5;
    v52[v15++] = v19;
  }
  while (v15 != 5);
  for (j = 0; j != 40; j += 8)
    *(double *)((char *)v53 + j) = *(double *)((char *)v53 + j) / v9;
  v21 = 0;
  v22 = 0;
  while (v21 == v10)
  {
LABEL_25:
    v22 = v21 > 3;
    v6 += 5;
    if (++v21 == 5)
    {
      v22 = 1;
      goto LABEL_27;
    }
  }
  v23 = 0;
  while (fabs(v6[v23] - *(double *)((char *)v53 + v23 * 8) * v52[v21]) <= 0.000001)
  {
    if (++v23 == 5)
      goto LABEL_25;
  }
LABEL_27:
  convert_weights(-[CIVector _values](self->inputWeights, "_values", 0.000001), v48, 5u, 5u);
  -[NSNumber doubleValue](self->inputBias, "doubleValue");
  v25 = v24;
  if (fabs(v24) >= 1.0e-10)
  {
    x = *MEMORY[0x1E0C9D5E0];
    y = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    width = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    height = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  else
  {
    -[CIImage extent](self->inputImage, "extent");
    v57 = CGRectInset(v56, -2.0, -2.0);
    x = v57.origin.x;
    y = v57.origin.y;
    width = v57.size.width;
    height = v57.size.height;
  }
  inputImage = self->inputImage;
  if (v22)
  {
    v31 = 0;
    v51 = 0;
    memset(v50, 0, sizeof(v50));
    v32 = sqrt(v9);
    do
    {
      *(double *)&v50[v31 + 16] = v32 * *(double *)((char *)v53 + v31);
      v31 += 8;
    }
    while (v31 != 40);
    v33 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v50, 9);
    for (k = 0; k != 5; ++k)
      *(double *)&v50[k * 8 + 16] = v52[k] / v32;
    v35 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v50, 9);
    v36 = apply1DConvolution(inputImage, v33, 0.0, 1u, 0);
    v37 = apply1DConvolution(v36, v35, v25, 0, 0);
  }
  else
  {
    if ((_DWORD)v7)
      v38 = &CI::_convolutionrgb5x5;
    else
      v38 = &CI::_convolution5x5;
    v46 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v38);
    v45 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48[0], v48[1], v48[2], v48[3]);
    v44 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48[4], v48[5], v48[6], v48[7]);
    v47 = (char)v7;
    v7 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48[8], v48[9], v48[10], v48[11]);
    v39 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48[12], v48[13], v48[14], v48[15]);
    v40 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48[16], v48[17], v48[18], v48[19]);
    v41 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48[20], v48[21], v48[22], v48[23]);
    v42 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48[24], v25, 1.0, 1.0);
    v49[0] = inputImage;
    v49[1] = v45;
    v49[2] = v44;
    v49[3] = v7;
    LOBYTE(v7) = v47;
    v49[4] = v39;
    v49[5] = v40;
    v49[6] = v41;
    v49[7] = v42;
    v37 = -[CIKernel applyWithExtent:roiCallback:arguments:](v46, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_88, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8), x, y, width, height);
  }
  v5 = v37;
  if (CI_ENABLE_MPS())
    v43 = (char)v7;
  else
    v43 = 1;
  if ((v43 & 1) == 0)
    return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyConToImage:width:height:bias:weights:](CIConvolutionProcessor, "applyConToImage:width:height:bias:weights:", self->inputImage, 5, 5, self->inputWeights, v25), v5);
  return v5;
}

double __31__CIConvolution5X5_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
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
