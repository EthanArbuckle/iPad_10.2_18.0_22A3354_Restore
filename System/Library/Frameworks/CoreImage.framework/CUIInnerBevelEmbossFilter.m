@implementation CUIInnerBevelEmbossFilter

- (id)_kernelInvertMask
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_invertedMask);
}

- (id)_kernelMultiplyByMask
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_multiplyByMask);
}

- (id)outputImage
{
  unsigned int v3;
  double v4;
  CIImage *inputImage;
  double v6;
  double v7;
  float v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CIImage *v14;
  CIImage *v15;
  CIImage *v17;
  CIImage *v18;
  uint64_t v19;
  int v21;
  double v22;
  void *v23;
  id v24;
  CIColor *inputHighlightColor;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  id v31;
  CIImage *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CIVector *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _QWORD v43[4];
  float v44;
  _QWORD v45[2];
  _QWORD v46[3];
  _QWORD v47[2];
  _OWORD v48[4];
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  unint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  if (-[NSNumber unsignedIntValue](self->super.inputSize, "unsignedIntValue") > 0x31)
    v3 = 50;
  else
    v3 = -[NSNumber unsignedIntValue](self->super.inputSize, "unsignedIntValue");
  -[NSNumber doubleValue](self->super.inputSoften, "doubleValue");
  inputImage = self->super.inputImage;
  if (!inputImage)
    return 0;
  v6 = fmax(v4, 0.0);
  v7 = fmin(v6, 50.0);
  v8 = fmax((double)v3 * 0.21, 0.5);
  v9 = -[CUIInnerBevelEmbossFilter _kernelInvertMask](self, "_kernelInvertMask");
  v10 = *MEMORY[0x1E0C9D5E0];
  v11 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v55[0] = inputImage;
  v14 = (CIImage *)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1), v10, v11, v12, v13);
  v15 = v14;
  if (v8 != 0.5 || v7 > 4.0)
  {
    v17 = _CUIMappedBlurImageWithSize(v14, fmin(v6, 2.0), 0);
    v18 = _CUIMappedBlurImageWithSize(v17, v3, 0);
    if (v8 == 0.5)
    {
      v52 = xmmword_192498F10;
      v53 = unk_192498F20;
      v54 = 0xBFC4CCCCCCCCCCCDLL;
      v50 = xmmword_192498EF0;
      v51 = unk_192498F00;
      v19 = -[CIImage filteredImage:keysAndValues:](v18, "filteredImage:keysAndValues:", CFSTR("CIConvolution3X3"), CFSTR("inputWeights"), +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v50, 9), CFSTR("inputBias"), &unk_1E2F1B360, 0);
    }
    else
    {
      v37 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)-v8, v8);
      v38 = -[CUIOuterBevelEmbossFilter _kernel](self, "_kernel");
      -[CIImage extent](v18, "extent");
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __40__CUIInnerBevelEmbossFilter_outputImage__block_invoke;
      v43[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v44 = v8;
      v47[0] = v18;
      v47[1] = v37;
      v19 = objc_msgSend(v38, "applyWithExtent:roiCallback:arguments:", v43, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2), v39, v40, v41, v42);
    }
  }
  else
  {
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v54 = 0;
    v52 = 0x3FF0000000000000uLL;
    v48[3] = 0u;
    memset(v48, 0, 32);
    v49 = 0;
    v48[2] = 0x3FF0000000000000uLL;
    if (v7 > 0.0)
    {
      v21 = 1;
      do
      {
        convolve((double *)&v50, dbl_192498ED8);
        convolve((double *)v48, dbl_192498ED8);
        v22 = (double)v21++;
      }
      while (v7 > v22);
    }
    convolve((double *)&v50, dbl_192498ED8);
    convolve((double *)v48, dbl_192498ED8);
    convolve((double *)&v50, dbl_192498ED8);
    v19 = objc_msgSend(-[CIImage filteredImage:keysAndValues:](v15, "filteredImage:keysAndValues:", CFSTR("CIConvolution9Horizontal"), CFSTR("inputWeights"), +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v50, 9, convolve((double *)v48, dbl_192498EC0).n128_f64[0]), CFSTR("inputBias"), &unk_1E2F1B2D0, 0), "filteredImage:keysAndValues:", CFSTR("CIConvolution9Vertical"), CFSTR("inputWeights"), +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v48, 9), CFSTR("inputBias"),
            &unk_1E2F1B360,
            0);
  }
  v23 = (void *)v19;
  v24 = -[CUIOuterBevelEmbossFilter _kernelC](self, "_kernelC");
  objc_msgSend(v23, "extent");
  inputHighlightColor = self->super.inputHighlightColor;
  v46[0] = v23;
  v46[1] = inputHighlightColor;
  v46[2] = self->super.inputShadowColor;
  v30 = objc_msgSend(v24, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3), v26, v27, v28, v29);
  v31 = -[CUIInnerBevelEmbossFilter _kernelMultiplyByMask](self, "_kernelMultiplyByMask");
  -[CIImage extent](self->super.inputImage, "extent");
  v32 = self->super.inputImage;
  v45[0] = v30;
  v45[1] = v32;
  return (id)objc_msgSend(v31, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2), v33, v34, v35, v36);
}

double __40__CUIInnerBevelEmbossFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5;
  double result;

  v5 = (float)-ceilf(fabsf(*(float *)(a1 + 32)) + 0.5);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
  return result;
}

@end
