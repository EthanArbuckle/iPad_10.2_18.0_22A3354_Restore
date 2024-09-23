@implementation CIFastBilateralSolver

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[4];
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryColorAdjustment");
  v15[1] = CFSTR("CICategoryStillImage");
  v15[2] = CFSTR("CICategoryBuiltIn");
  v15[3] = CFSTR("CICategoryApplePrivate");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v17[1] = CFSTR("11");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.13");
  v16[3] = CFSTR("inputMaxNumVertices");
  v13[0] = CFSTR("CIAttributeDefault");
  v13[1] = CFSTR("CIAttributeType");
  v14[0] = &unk_1E2F1B908;
  v14[1] = CFSTR("CIAttributeTypeInteger");
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v16[4] = CFSTR("inputSigmaS");
  v11[0] = CFSTR("CIAttributeDefault");
  v11[1] = CFSTR("CIAttributeType");
  v12[0] = &unk_1E2F1B920;
  v12[1] = CFSTR("CIAttributeTypeInteger");
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v16[5] = CFSTR("inputSigmaRLuma");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = &unk_1E2F1B920;
  v10[1] = CFSTR("CIAttributeTypeInteger");
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v16[6] = CFSTR("inputSigmaRChroma");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = &unk_1E2F1B920;
  v8[1] = CFSTR("CIAttributeTypeInteger");
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v16[7] = CFSTR("inputLambda");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = &unk_1E2F1DA38;
  v6[1] = CFSTR("CIAttributeTypeScalar");
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v16[8] = CFSTR("inputMaxNumIterations");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = &unk_1E2F1B938;
  v4[1] = CFSTR("CIAttributeTypeInteger");
  v17[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
}

- (id)outputImage
{
  id result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  NSNumber *inputMaxNumVertices;
  NSNumber *inputSigmaS;
  NSNumber *inputSigmaRLuma;
  NSNumber *inputSigmaRChroma;
  NSNumber *inputLambda;
  NSNumber *inputMaxNumIterations;
  uint64_t v26;
  id v27;
  CIImage *inputConfidenceMapImage;
  CIImage *inputDisparityImage;
  uint64_t v30;
  CIImage *v31;
  CIImage *v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[7];
  _QWORD v37[8];
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37[7] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (!result)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputDisparityImage && self->inputConfidenceMapImage)
  {
    objc_msgSend(result, "extent");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CIImage extent](self->inputDisparityImage, "extent");
    v40.origin.x = v12;
    v40.origin.y = v13;
    v40.size.width = v14;
    v40.size.height = v15;
    v38.origin.x = v5;
    v38.origin.y = v7;
    v38.size.width = v9;
    v38.size.height = v11;
    if (!CGRectEqualToRect(v38, v40))
      goto LABEL_8;
    -[CIImage extent](self->inputConfidenceMapImage, "extent");
    v41.origin.x = v16;
    v41.origin.y = v17;
    v41.size.width = v18;
    v41.size.height = v19;
    v39.origin.x = v5;
    v39.origin.y = v7;
    v39.size.width = v9;
    v39.size.height = v11;
    if (CGRectEqualToRect(v39, v41))
    {
      inputMaxNumVertices = self->inputMaxNumVertices;
      v36[0] = CFSTR("inputMaxNumVertices");
      v36[1] = CFSTR("inputSigmaS");
      inputSigmaS = self->inputSigmaS;
      inputSigmaRLuma = self->inputSigmaRLuma;
      v37[0] = inputMaxNumVertices;
      v37[1] = inputSigmaS;
      inputSigmaRChroma = self->inputSigmaRChroma;
      v36[2] = CFSTR("inputSigmaRLuma");
      v36[3] = CFSTR("inputSigmaRChroma");
      v37[2] = inputSigmaRLuma;
      v37[3] = inputSigmaRChroma;
      inputLambda = self->inputLambda;
      v36[4] = CFSTR("inputLambda");
      v36[5] = CFSTR("inputMaxNumIterations");
      inputMaxNumIterations = self->inputMaxNumIterations;
      v37[4] = inputLambda;
      v37[5] = inputMaxNumIterations;
      v36[6] = CFSTR("fullROI");
      v37[6] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v5, v7, v9, v11);
      v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
      v27 = +[CIImage imageYCC444:matrix:fullRange:colorSpace:](CIImage, "imageYCC444:matrix:fullRange:colorSpace:", self->inputImage, 709, 1, 0);
      inputConfidenceMapImage = self->inputConfidenceMapImage;
      inputDisparityImage = self->inputDisparityImage;
      v35[0] = v27;
      v35[1] = inputConfidenceMapImage;
      v35[2] = inputDisparityImage;
      v30 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
      v33 = 0;
      v31 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](FBSProcessorCPU, "applyWithExtent:inputs:arguments:error:", v30, v26, &v33, v5, v7, v9, v11);
      v32 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](FBSProcessorGPU, "applyWithExtent:inputs:arguments:error:", v30, v26, &v33, v5, v7, v9, v11);
      v34[0] = v31;
      v34[1] = v32;
      return +[CIImage imageWithArrayOfImages:selector:](CIImage, "imageWithArrayOfImages:selector:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2), &__block_literal_global_27);
    }
    else
    {
LABEL_8:
      NSLog(CFSTR("Cannot use CIFastBilateralSolver unless all input images are of the same size."));
      return self->inputDisparityImage;
    }
  }
  return result;
}

uint64_t __36__CIFastBilateralSolver_outputImage__block_invoke(uint64_t a1, void *a2)
{
  int v3;

  if (_block_invoke_onceToken != -1)
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_52_0);
  v3 = objc_msgSend((id)objc_msgSend(a2, "valueForKey:", CFSTR("kContextInfoIsSoftware")), "BOOLValue");
  return (v3 ^ 1) & _block_invoke_deviceSupportsMetal;
}

void __36__CIFastBilateralSolver_outputImage__block_invoke_2()
{
  id v0;

  v0 = MTLCreateSystemDefaultDevice();
  if (v0)
  {
    _block_invoke_deviceSupportsMetal = 1;
    CFRelease(v0);
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputDisparityImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputConfidenceMapImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputConfidenceMapImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputMaxNumVertices
{
  return self->inputMaxNumVertices;
}

- (void)setInputMaxNumVertices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputSigmaS
{
  return self->inputSigmaS;
}

- (void)setInputSigmaS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputSigmaRLuma
{
  return self->inputSigmaRLuma;
}

- (void)setInputSigmaRLuma:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)inputSigmaRChroma
{
  return self->inputSigmaRChroma;
}

- (void)setInputSigmaRChroma:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)inputLambda
{
  return self->inputLambda;
}

- (void)setInputLambda:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)inputMaxNumIterations
{
  return self->inputMaxNumIterations;
}

- (void)setInputMaxNumIterations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

@end
