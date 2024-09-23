@implementation CIDisparityPreprocV3

- (id)preprocKernel
{
  if (-[CIDisparityPreprocV3 preprocKernel]::onceToken != -1)
    dispatch_once(&-[CIDisparityPreprocV3 preprocKernel]::onceToken, &__block_literal_global_146);
  return (id)-[CIDisparityPreprocV3 preprocKernel]::k;
}

id __37__CIDisparityPreprocV3_preprocKernel__block_invoke()
{
  id result;

  result = +[CIColorKernel SDOFV3MetalKernelNamed:](CIColorKernel, "SDOFV3MetalKernelNamed:", CFSTR("disparity_refinement_preproc"));
  -[CIDisparityPreprocV3 preprocKernel]::k = (uint64_t)result;
  return result;
}

- (id)preprocKernelNoAlpha
{
  if (-[CIDisparityPreprocV3 preprocKernelNoAlpha]::onceToken != -1)
    dispatch_once(&-[CIDisparityPreprocV3 preprocKernelNoAlpha]::onceToken, &__block_literal_global_149);
  return (id)-[CIDisparityPreprocV3 preprocKernelNoAlpha]::k;
}

id __44__CIDisparityPreprocV3_preprocKernelNoAlpha__block_invoke()
{
  id result;

  result = +[CIColorKernel SDOFV3MetalKernelNamed:](CIColorKernel, "SDOFV3MetalKernelNamed:", CFSTR("disparity_refinement_preproc_no_alpha"));
  -[CIDisparityPreprocV3 preprocKernelNoAlpha]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *inputAlphaImage;
  CGColorSpaceRef v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  CGAffineTransform v28;
  CGAffineTransform v29;
  const __CFString *v30;
  CIVector *v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  inputAlphaImage = self->inputAlphaImage;
  v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  CFAutorelease(v5);
  v6 = +[CIImage imageYCC444:matrix:fullRange:colorSpace:](CIImage, "imageYCC444:matrix:fullRange:colorSpace:", inputImage, 709, 1, v5);
  v7 = v6;
  if (inputAlphaImage)
  {
    objc_msgSend(v6, "extent");
    v9 = v8;
    -[CIImage extent](inputAlphaImage, "extent");
    v11 = v9 / v10;
    objc_msgSend(v7, "extent");
    v13 = v12;
    -[CIImage extent](inputAlphaImage, "extent");
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeScale(&v29, v11, v13 / v14);
    v28 = v29;
    v15 = -[CIImage imageByApplyingTransform:](inputAlphaImage, "imageByApplyingTransform:", &v28);
    v16 = -[CIDisparityPreprocV3 preprocKernel](self, "preprocKernel");
    objc_msgSend(v7, "extent");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v34[0] = v7;
    v34[1] = v15;
    v25 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v32 = CFSTR("kCIKernelOutputFormat");
    v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 264);
    v26 = (void *)objc_msgSend(v16, "applyWithExtent:arguments:options:", v25, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v18, v20, v22, v24);
  }
  else
  {
    v30 = CFSTR("inputAVector");
    v31 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v26 = (void *)objc_msgSend(v7, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
  }
  return (id)objc_msgSend(v26, "_imageByRenderingToIntermediate");
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputAlphaImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputAlphaImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

@end
