@implementation CIMorphologyRectangle

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[7];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryBlur");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("13");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.15");
  v8[3] = CFSTR("inputWidth");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeInteger");
  v6[1] = &unk_1E2F1A450;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F1A450;
  v6[3] = &unk_1E2F1A470;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F1A430;
  v6[5] = &unk_1E2F1A450;
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputHeight");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1A450;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F1A450;
  v4[3] = &unk_1E2F1A470;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1A430;
  v4[5] = &unk_1E2F1A450;
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (BOOL)_isIdentity
{
  return -[NSNumber intValue](self->inputWidth, "intValue") <= 2
      && -[NSNumber intValue](self->inputHeight, "intValue") < 3;
}

- (BOOL)_doMinimum
{
  return 0;
}

- (id)outputImage
{
  CIImage *inputImage;
  float v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  _BOOL8 v9;
  double v10;
  double v11;
  int v12;
  void (***v13)(CI::GeneralKernel *__hidden);
  CIKernel *v14;
  int v15;
  int v16;
  double x;
  double y;
  double width;
  double height;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CIImage *v27;
  uint64_t v28;
  int v29;
  _QWORD v30[4];
  int v31;
  _QWORD v32[4];
  unsigned int v33;
  _QWORD v34[3];
  _QWORD v35[5];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CIMorphologyRectangle _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v6 = 1;
  if (v5 > 2.0)
    v6 = (2 * vcvtms_s32_f32(v5 * 0.5)) | 1;
  -[NSNumber floatValue](self->inputHeight, "floatValue");
  v8 = 1;
  if (v7 > 2.0)
    v8 = (2 * vcvtms_s32_f32(v7 * 0.5)) | 1;
  v9 = -[CIMorphologyRectangle _doMinimum](self, "_doMinimum");
  if (v9)
  {
    -[CIImage extent](self->inputImage, "extent");
    if (v10 <= (double)((int)v6 - 1))
      return +[CIImage emptyImage](CIImage, "emptyImage");
    -[CIImage extent](self->inputImage, "extent");
    if (v11 <= (double)((int)v8 - 1))
      return +[CIImage emptyImage](CIImage, "emptyImage");
    v12 = 1;
    v13 = &CI::_morphmin;
  }
  else
  {
    v12 = -1;
    v13 = &CI::_morphmax;
  }
  inputImage = self->inputImage;
  v14 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v13);
  if ((int)v8 >= 0)
    v15 = v8;
  else
    v15 = v8 + 1;
  if (v12 * (int)v8 >= 0)
    v16 = v12 * v8;
  else
    v16 = v12 * v8 + 1;
  if ((int)v6 >= 3)
  {
    v29 = v15;
    -[CIImage extent](inputImage, "extent");
    v37 = CGRectInset(v36, (double)(v12 * (int)v6 / 2), 0.0);
    x = v37.origin.x;
    y = v37.origin.y;
    width = v37.size.width;
    height = v37.size.height;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __36__CIMorphologyRectangle_outputImage__block_invoke;
    v32[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v33 = v6 >> 1;
    v35[0] = inputImage;
    v35[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 >> 1);
    v35[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0, 0.0);
    v21 = -[CIKernel applyWithExtent:roiCallback:arguments:](v14, "applyWithExtent:roiCallback:arguments:", v32, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3), x, y, width, height);
    v15 = v29;
    inputImage = (CIImage *)v21;
  }
  if ((int)v8 >= 3)
  {
    v22 = (v15 >> 1);
    -[CIImage extent](inputImage, "extent");
    v39 = CGRectInset(v38, 0.0, (double)(v16 >> 1));
    v23 = v39.origin.x;
    v24 = v39.origin.y;
    v25 = v39.size.width;
    v26 = v39.size.height;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __36__CIMorphologyRectangle_outputImage__block_invoke_2;
    v30[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v31 = v22;
    v34[0] = inputImage;
    v34[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
    v34[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 1.0);
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v14, "applyWithExtent:roiCallback:arguments:", v30, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3), v23, v24, v25, v26);
  }
  if (CI_ENABLE_MPS())
  {
    v27 = self->inputImage;
    if ((int)v6 > 9 || (int)v8 > 9)
    {
      v27 = +[CIMorphologyProcessor applyBoxToImage:width:height:doMin:](CIMorphologyProcessor, "applyBoxToImage:width:height:doMin:", v27, v6, 1, v9);
      v28 = 1;
    }
    else
    {
      v28 = v6;
    }
    return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIMorphologyProcessor applyBoxToImage:width:height:doMin:](CIMorphologyProcessor, "applyBoxToImage:width:height:doMin:", v27, v28, v8, v9), inputImage);
  }
  return inputImage;
}

double __36__CIMorphologyRectangle_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (double)-*(_DWORD *)(a1 + 32), 0.0);
  return result;
}

double __36__CIMorphologyRectangle_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (double)-*(_DWORD *)(a1 + 32));
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

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
