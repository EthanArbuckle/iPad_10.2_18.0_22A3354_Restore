@implementation CIConvolution3X3

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
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution3X3 customAttributes]::default_values, 9);
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
  double x;
  double y;
  double width;
  double height;
  double *v13;
  int8x16_t v14;
  int8x16_t v15;
  double *v16;
  double v17;
  double v18;
  int8x16_t v19;
  int8x16_t v20;
  float v21;
  int8x16_t v22;
  float v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  void (***v29)(CI::GeneralKernel *__hidden);
  CIKernel *v30;
  int v31;
  double *v32;
  float *v33;
  uint64_t i;
  float v35;
  CIVector *v36;
  CIVector *v37;
  CIVector *v38;
  char v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void (***v46)(CI::GeneralKernel *__hidden);
  CIKernel *v47;
  CIVector *v48;
  float v49[9];
  _QWORD v50[4];
  _QWORD v51[3];
  CGRect v52;
  CGRect v53;

  v51[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputWeights = self->inputWeights;
  if (!inputWeights)
    return 0;
  if (-[CIVector count](inputWeights, "count") != 9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CIConvolutionWeights"), CFSTR("CIConvolution3X3 expects inputWeights to be a length-9 CIVector"));
  if (-[CIConvolution3X3 _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber doubleValue](self->inputBias, "doubleValue");
  v7 = v6;
  v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", CFSTR("RGB"));
  if (fabs(v7) >= 1.0e-10)
  {
    x = *MEMORY[0x1E0C9D5E0];
    y = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    width = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    height = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  else
  {
    -[CIImage extent](self->inputImage, "extent");
    v53 = CGRectInset(v52, -1.0, -1.0);
    x = v53.origin.x;
    y = v53.origin.y;
    width = v53.size.width;
    height = v53.size.height;
  }
  v13 = -[CIVector _values](self->inputWeights, "_values");
  v16 = v13;
  v17 = *v13;
  if (*v13 != v13[2])
    goto LABEL_32;
  if (v17 != v13[6])
    goto LABEL_32;
  if (v17 != v13[8])
    goto LABEL_32;
  v18 = v13[1];
  if (v18 != v13[3])
    goto LABEL_32;
  if (v18 != v13[5])
    goto LABEL_32;
  v14.i64[0] = (uint64_t)v13[7];
  if (v18 != *(double *)v14.i64)
    goto LABEL_32;
  *(float *)v15.i32 = v17;
  v14.i32[0] = 1.0;
  v19.i64[0] = 0x8000000080000000;
  v19.i64[1] = 0x8000000080000000;
  v20 = vbslq_s8(v19, v14, v15);
  v21 = *(float *)v15.i32 == 0.0 ? 0.0 : *(float *)v20.i32;
  *(float *)v20.i32 = v18;
  v22 = vbslq_s8(v19, v14, v20);
  v23 = *(float *)v20.i32 == 0.0 ? 0.0 : *(float *)v22.i32;
  if (v21 != v23)
    goto LABEL_32;
  v24 = v13[4];
  *(float *)v22.i32 = v24;
  LODWORD(v25) = vbslq_s8(v19, v14, v22).u32[0];
  if (*(float *)v22.i32 == 0.0)
    v25 = 0.0;
  if (v23 == v25
    && (v26 = v24 + v17 * 4.0 + v18 * 4.0, fabs(v26) > 0.00001)
    && ((v27 = v18 * v18 - v24 * v17, v27 < 0.0) && (v28 = 0.0, v26 * (v26 * 0.000001) > -v27) || (v28 = v27, v27 >= 0.0)))
  {
    v41 = v26 * 0.25;
    v42 = v18 + v17 * 2.0;
    v43 = sqrt(v28);
    v44 = (v42 + v43 + v42 + v43) / v26;
    v45 = (v42 - v43 + v42 - v43) / v26;
    if (v8)
      v46 = &CI::_convrgb3x3sym;
    else
      v46 = &CI::_conv3x3sym;
    v47 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v46);
    v48 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v44, v45, v41, v7);
    v51[0] = self->inputImage;
    v51[1] = v48;
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v47, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_13, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2), x, y, width, height);
  }
  else
  {
LABEL_32:
    if (v8)
      v29 = &CI::_convrgb3x3;
    else
      v29 = &CI::_conv3x3;
    v30 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v29, v17);
    v31 = 0;
    v32 = v16 + 6;
    v33 = v49;
    do
    {
      for (i = 0; i != 3; ++i)
      {
        v35 = v32[i];
        v33[i] = v35;
      }
      ++v31;
      v33 += 3;
      v32 -= 3;
    }
    while (v31 != 3);
    v36 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v49[0], v49[1], v49[2], v49[3]);
    v37 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v49[4], v49[5], v49[6], v49[7]);
    v38 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v49[8], v7, 1.0, 1.0);
    v50[0] = self->inputImage;
    v50[1] = v36;
    v50[2] = v37;
    v50[3] = v38;
    v5 = -[CIKernel applyWithExtent:roiCallback:arguments:](v30, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_62, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4), x, y, width, height);
    if (CI_ENABLE_MPS())
      v39 = v8;
    else
      v39 = 1;
    if ((v39 & 1) != 0)
      return v5;
    return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyConToImage:width:height:bias:weights:](CIConvolutionProcessor, "applyConToImage:width:height:bias:weights:", self->inputImage, 3, 3, self->inputWeights, v7), v5);
  }
}

double __31__CIConvolution3X3_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __31__CIConvolution3X3_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
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
