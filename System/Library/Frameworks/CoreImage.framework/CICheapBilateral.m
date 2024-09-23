@implementation CICheapBilateral

+ (id)customAttributes
{
  const __CFString *v3;
  const __CFString *v4;
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryBlur");
  v9[1] = CFSTR("CICategoryNonSquarePixels");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v9[4] = CFSTR("CICategoryApplePrivate");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v11[1] = CFSTR("12");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.14");
  v10[3] = CFSTR("inputSigmaRange");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F18C60;
  v8[1] = &unk_1E2F18C70;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F18C60;
  v8[3] = &unk_1E2F18C70;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F18C80;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v10[4] = CFSTR("inputSigmaSpace");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F18C60;
  v6[1] = &unk_1E2F18C90;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F18C60;
  v6[3] = &unk_1E2F18CA0;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18CB0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[5] = CFSTR("inputSource");
  v3 = CFSTR("CIAttributeType");
  v4 = CFSTR("CIAttributeTypeImage");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)outputImage
{
  uint64_t v2;
  id result;
  double x;
  double y;
  double width;
  double height;
  CIImage *inputImage;
  CIImage *inputSource;
  BOOL v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  CIKernel *v26;
  uint64_t v27;
  CIKernel *v28;
  uint64_t v29;
  CIKernel *v30;
  CIKernel *v31;
  uint64_t v32;
  CIKernel *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _QWORD v38[4];
  int v39;
  _QWORD v40[4];
  int v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[5];
  _QWORD v45[6];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v45[5] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    objc_msgSend(result, "extent");
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    if (CGRectIsInfinite(v46))
      return 0;
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    if (CGRectIsNull(v47))
    {
      return 0;
    }
    else
    {
      inputImage = self->inputImage;
      inputSource = self->inputSource;
      if (inputSource)
        v11 = inputSource == inputImage;
      else
        v11 = 1;
      v12 = !v11;
      -[NSNumber doubleValue](self->inputSigmaSpace, "doubleValue");
      v14 = v13;
      -[NSNumber doubleValue](self->inputSigmaRange, "doubleValue");
      v16 = v15;
      *(float *)&v15 = v14 * 3.0;
      LODWORD(v2) = llroundf(*(float *)&v15);
      if ((_DWORD)v2 && v16 >= 0.00001)
      {
        v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
        v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / (v14 * v14));
        v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / (v16 * v16));
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __31__CICheapBilateral_outputImage__block_invoke;
        v40[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v41 = v2;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __31__CICheapBilateral_outputImage__block_invoke_2;
        v38[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        v39 = v2;
        v48.origin.x = x;
        v48.origin.y = y;
        v48.size.width = width;
        v48.size.height = height;
        v49 = CGRectInset(v48, (double)-(int)v2, 0.0);
        v20 = v49.origin.x;
        v21 = v49.origin.y;
        v22 = v49.size.width;
        v34 = v49.size.height;
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        v50 = CGRectInset(v49, 0.0, (double)-(int)v2);
        v36 = v50.origin.y;
        v37 = v50.origin.x;
        v35 = v50.size.width;
        v23 = v50.size.height;
        v24 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](inputImage, "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
        if (v12)
        {
          v25 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](inputSource, "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
          v26 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CBHorzGuided);
          v45[0] = v25;
          v45[1] = v24;
          v45[2] = v17;
          v45[3] = v19;
          v45[4] = v18;
          v27 = -[CIKernel applyWithExtent:roiCallback:arguments:](v26, "applyWithExtent:roiCallback:arguments:", v40, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5), v20, v21, v22, v34);
          v28 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CBVertGuided);
          v44[0] = v25;
          v44[1] = v27;
          v44[2] = v17;
          v44[3] = v19;
          v44[4] = v18;
          v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
          v30 = v28;
        }
        else
        {
          v31 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CBHorz);
          v43[0] = v24;
          v43[1] = v17;
          v43[2] = v19;
          v43[3] = v18;
          v32 = -[CIKernel applyWithExtent:roiCallback:arguments:](v31, "applyWithExtent:roiCallback:arguments:", v40, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4), v20, v21, v22, v34);
          v33 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CBVert);
          v42[0] = v32;
          v42[1] = v17;
          v42[2] = v19;
          v42[3] = v18;
          v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
          v30 = v33;
        }
        return -[CIImage imageByCroppingToRect:](-[CIImage imageByPremultiplyingAlpha](-[CIKernel applyWithExtent:roiCallback:arguments:](v30, "applyWithExtent:roiCallback:arguments:", v38, v29, v37, v36, v35, v23), "imageByPremultiplyingAlpha"), "imageByCroppingToRect:", x, y, width, height);
      }
      else
      {
        return inputImage;
      }
    }
  }
  return result;
}

double __31__CICheapBilateral_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (double)-*(_DWORD *)(a1 + 32), 0.0);
  return result;
}

double __31__CICheapBilateral_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (double)-*(_DWORD *)(a1 + 32));
  return result;
}

- (CIImage)inputSource
{
  return self->inputSource;
}

- (void)setInputSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputSigmaSpace
{
  return self->inputSigmaSpace;
}

- (void)setInputSigmaSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputSigmaRange
{
  return self->inputSigmaRange;
}

- (void)setInputSigmaRange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
