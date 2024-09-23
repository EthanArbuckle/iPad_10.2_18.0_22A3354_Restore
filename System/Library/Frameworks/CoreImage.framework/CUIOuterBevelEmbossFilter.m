@implementation CUIOuterBevelEmbossFilter

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[7];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("inputSize");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1B2D0;
  v12[1] = &unk_1E2F1B2D0;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeMax");
  v12[2] = &unk_1E2F1B2E0;
  v12[3] = &unk_1E2F1B310;
  v11[4] = CFSTR("CIAttributeDefault");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1B330;
  v12[5] = CFSTR("CIAttributeTypeScalar");
  v14[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v13[1] = CFSTR("inputSoften");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1B2D0;
  v10[1] = &unk_1E2F1B2D0;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F1B2E0;
  v10[3] = &unk_1E2F1B310;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1B2D0;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v14[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v13[2] = CFSTR("inputAngle");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F1B2D0;
  v8[1] = &unk_1E2F1B340;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeType");
  v8[2] = &unk_1E2F1B350;
  v8[3] = CFSTR("CIAttributeTypeAngle");
  v14[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v13[3] = CFSTR("inputHighlightColor");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v6[1] = CFSTR("CIAttributeTypeColor");
  v14[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v13[4] = CFSTR("inputShadowColor");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypeColor");
  v14[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_outerBevelEmboss);
}

- (id)_kernelC
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_outerBevelEmbossC);
}

- (id)outputImage
{
  unsigned int v3;
  double v4;
  CIImage *inputImage;
  double v6;
  double v7;
  float v8;
  CIImage *v10;
  CIImage *v11;
  uint64_t v12;
  double x;
  double y;
  double width;
  double height;
  uint64_t v20;
  int v22;
  double v23;
  void *v24;
  id v25;
  CIColor *inputHighlightColor;
  double v27;
  double v28;
  double v29;
  double v30;
  CIVector *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[4];
  float v38;
  _QWORD v39[3];
  _QWORD v40[2];
  _OWORD v41[4];
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48 = *MEMORY[0x1E0C80C00];
  if (-[NSNumber unsignedIntValue](self->inputSize, "unsignedIntValue") > 0x31)
    v3 = 50;
  else
    v3 = -[NSNumber unsignedIntValue](self->inputSize, "unsignedIntValue");
  -[NSNumber doubleValue](self->inputSoften, "doubleValue");
  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  v6 = fmax(v4, 0.0);
  v7 = fmin(v6, 50.0);
  v8 = fmax((double)v3 * 0.21, 0.5);
  -[CIImage extent](self->inputImage, "extent");
  if (v8 != 0.5 || v7 > 4.0)
  {
    v10 = _CUIMappedBlurImageWithSize(inputImage, fmin(v6, 2.0), 0);
    v11 = _CUIMappedBlurImageWithSize(v10, v3, 0);
    -[CIImage extent](v11, "extent");
    if (v8 == 0.5)
    {
      v49 = CGRectInset(*(CGRect *)&v12, -1.0, -1.0);
      x = v49.origin.x;
      y = v49.origin.y;
      width = v49.size.width;
      height = v49.size.height;
      v43 = xmmword_192498E78;
      v44 = unk_192498E88;
      v45 = xmmword_192498E98;
      v46 = unk_192498EA8;
      v47 = 0x3FC0000000000000;
      v20 = -[CIImage filteredImage:keysAndValues:](v11, "filteredImage:keysAndValues:", CFSTR("CIConvolution3X3"), CFSTR("inputWeights"), +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v43, 9), CFSTR("inputBias"), &unk_1E2F1B360, 0);
    }
    else
    {
      v52 = CGRectInset(*(CGRect *)&v12, (float)-v8, (float)-v8);
      x = v52.origin.x;
      y = v52.origin.y;
      width = v52.size.width;
      height = v52.size.height;
      v31 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v8, (float)-v8);
      v32 = -[CUIOuterBevelEmbossFilter _kernel](self, "_kernel");
      -[CIImage extent](v11, "extent");
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __40__CUIOuterBevelEmbossFilter_outputImage__block_invoke;
      v37[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v38 = v8;
      v40[0] = v11;
      v40[1] = v31;
      v20 = objc_msgSend(v32, "applyWithExtent:roiCallback:arguments:", v37, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2), v33, v34, v35, v36);
    }
  }
  else
  {
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v47 = 0;
    v45 = 0x3FF0000000000000uLL;
    v41[3] = 0u;
    memset(v41, 0, 32);
    v42 = 0;
    v41[2] = 0x3FF0000000000000uLL;
    if (v7 > 0.0)
    {
      v22 = 1;
      do
      {
        convolve((double *)&v43, dbl_192498ED8);
        convolve((double *)v41, dbl_192498ED8);
        v23 = (double)v22++;
      }
      while (v7 > v23);
    }
    convolve((double *)&v43, dbl_192498ED8);
    convolve((double *)v41, dbl_192498ED8);
    convolve((double *)&v43, dbl_192498ED8);
    -[CIImage extent](inputImage, "extent", convolve((double *)v41, dbl_192498E60).n128_f64[0]);
    v51 = CGRectInset(v50, -4.0, -4.0);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
    v20 = objc_msgSend(-[CIImage filteredImage:keysAndValues:](inputImage, "filteredImage:keysAndValues:", CFSTR("CIConvolution9Horizontal"), CFSTR("inputWeights"), +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v43, 9), CFSTR("inputBias"), &unk_1E2F1B2D0, 0), "filteredImage:keysAndValues:", CFSTR("CIConvolution9Vertical"), CFSTR("inputWeights"), +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v41, 9), CFSTR("inputBias"), &unk_1E2F1B360, 0);
  }
  v24 = (void *)v20;
  v25 = -[CUIOuterBevelEmbossFilter _kernelC](self, "_kernelC");
  objc_msgSend(v24, "extent");
  inputHighlightColor = self->inputHighlightColor;
  v39[0] = v24;
  v39[1] = inputHighlightColor;
  v39[2] = self->inputShadowColor;
  return (id)objc_msgSend((id)objc_msgSend(v25, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3), v27, v28, v29, v30), "imageByCroppingToRect:", x, y, width, height);
}

double __40__CUIOuterBevelEmbossFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5;
  double result;

  v5 = (float)-ceilf(fabsf(*(float *)(a1 + 32)) + 0.5);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
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

- (NSNumber)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputSoften
{
  return self->inputSoften;
}

- (void)setInputSoften:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIColor)inputHighlightColor
{
  return self->inputHighlightColor;
}

- (void)setInputHighlightColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CIColor)inputShadowColor
{
  return self->inputShadowColor;
}

- (void)setInputShadowColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
