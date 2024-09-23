@implementation CIConvolution7X7

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
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution7X7 customAttributes]::default_values, 49);
  v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", CFSTR("RGB"));
  v13[0] = CFSTR("CIAttributeFilterCategories");
  v12[0] = CFSTR("CICategoryStylize");
  v12[1] = CFSTR("CICategoryVideo");
  v12[2] = CFSTR("CICategoryStillImage");
  v12[3] = CFSTR("CICategoryHighDynamicRange");
  v12[4] = CFSTR("CICategoryBuiltIn");
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v5 = CFSTR("9");
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
  for (i = 0; i != 49; ++i)
  {
    if (i == 24)
    {
      if (v5[24] != 1.0)
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
  CIVector *v6;
  double *v7;
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
  char v39;
  CIVector *v40;
  CIVector *v41;
  CIVector *v42;
  char v43;
  CIVector *v44;
  CIVector *v45;
  CIVector *v46;
  CIVector *v47;
  CIVector *v48;
  CIVector *v49;
  CIVector *v50;
  CIVector *v51;
  CIVector *v52;
  CIKernel *v53;
  float v54[49];
  _QWORD v55[14];
  _BYTE v56[64];
  uint64_t v57;
  double v58[7];
  _OWORD v59[3];
  uint64_t v60;
  uint64_t v61;
  CGRect v62;
  CGRect v63;

  v61 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputWeights = self->inputWeights;
  if (!inputWeights)
    return 0;
  if (-[CIVector count](inputWeights, "count") != 49)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CIConvolutionWeights"), CFSTR("CIConvolution7X7 expects inputWeights to be a length-49 CIVector"));
  if (-[CIConvolution7X7 _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  LODWORD(v6) = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", CFSTR("RGB"));
  v7 = -[CIVector _values](self->inputWeights, "_values");
  v8 = 0;
  v9 = 0.0;
  LODWORD(v10) = -1;
  v11 = v7;
  v12 = -1;
  do
  {
    for (i = 0; i != 7; ++i)
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
    v11 += 7;
  }
  while (v8 != 7);
  v15 = 0;
  v16 = &v7[7 * (int)v10];
  v17 = *((_OWORD *)v16 + 1);
  v59[0] = *(_OWORD *)v16;
  v59[1] = v17;
  v59[2] = *((_OWORD *)v16 + 2);
  v60 = *((_QWORD *)v16 + 6);
  v18 = &v7[v12];
  do
  {
    v19 = *v18;
    v18 += 7;
    v58[v15++] = v19;
  }
  while (v15 != 7);
  for (j = 0; j != 56; j += 8)
    *(double *)((char *)v59 + j) = *(double *)((char *)v59 + j) / v9;
  v21 = 0;
  v22 = 0;
  while (v21 == v10)
  {
LABEL_25:
    v22 = v21 > 5;
    v7 += 7;
    if (++v21 == 7)
    {
      v22 = 1;
      goto LABEL_27;
    }
  }
  v23 = 0;
  while (fabs(v7[v23] - *(double *)((char *)v59 + v23 * 8) * v58[v21]) <= 0.000001)
  {
    if (++v23 == 7)
      goto LABEL_25;
  }
LABEL_27:
  convert_weights(-[CIVector _values](self->inputWeights, "_values", 0.000001), v54, 7u, 7u);
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
    v63 = CGRectInset(v62, -3.0, -3.0);
    x = v63.origin.x;
    y = v63.origin.y;
    width = v63.size.width;
    height = v63.size.height;
  }
  inputImage = self->inputImage;
  if (v22)
  {
    v31 = 0;
    v57 = 0;
    memset(v56, 0, sizeof(v56));
    v32 = sqrt(v9);
    do
    {
      *(double *)&v56[v31 + 8] = v32 * *(double *)((char *)v59 + v31);
      v31 += 8;
    }
    while (v31 != 56);
    v33 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v56, 9);
    for (k = 0; k != 7; ++k)
      *(double *)&v56[k * 8 + 8] = v58[k] / v32;
    v35 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v56, 9);
    v36 = apply1DConvolution(inputImage, v33, 0.0, 1u, 0);
    v37 = apply1DConvolution(v36, v35, v25, 0, 0);
  }
  else
  {
    if ((_DWORD)v6)
      v38 = &CI::_convolutionrgb7x7;
    else
      v38 = &CI::_convolution7x7;
    v53 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v38);
    v52 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[0], v54[1], v54[2], v54[3]);
    v51 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[4], v54[5], v54[6], v54[7]);
    v50 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[8], v54[9], v54[10], v54[11]);
    v49 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[12], v54[13], v54[14], v54[15]);
    v48 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[16], v54[17], v54[18], v54[19]);
    v47 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[20], v54[21], v54[22], v54[23]);
    v46 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[24], v54[25], v54[26], v54[27]);
    v45 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[28], v54[29], v54[30], v54[31]);
    v44 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[32], v54[33], v54[34], v54[35]);
    v39 = (char)v6;
    v6 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[36], v54[37], v54[38], v54[39]);
    v40 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[40], v54[41], v54[42], v54[43]);
    v41 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[44], v54[45], v54[46], v54[47]);
    v42 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v54[48], v25, 1.0, 1.0);
    v55[0] = inputImage;
    v55[1] = v52;
    v55[2] = v51;
    v55[3] = v50;
    v55[4] = v49;
    v55[5] = v48;
    v55[6] = v47;
    v55[7] = v46;
    v55[8] = v45;
    v55[9] = v44;
    v55[10] = v6;
    v55[11] = v40;
    LOBYTE(v6) = v39;
    v55[12] = v41;
    v55[13] = v42;
    v37 = -[CIKernel applyWithExtent:roiCallback:arguments:](v53, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_96, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 14), x, y, width, height);
  }
  v5 = v37;
  if (CI_ENABLE_MPS())
    v43 = (char)v6;
  else
    v43 = 1;
  if ((v43 & 1) == 0)
    return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyConToImage:width:height:bias:weights:](CIConvolutionProcessor, "applyConToImage:width:height:bias:weights:", self->inputImage, 7, 7, self->inputWeights, v25), v5);
  return v5;
}

double __31__CIConvolution7X7_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -3.0, -3.0);
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
