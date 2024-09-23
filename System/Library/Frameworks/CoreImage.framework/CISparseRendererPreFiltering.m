@implementation CISparseRendererPreFiltering

- (id)_kernel:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (-[CISparseRendererPreFiltering _kernel:]::onceToken != -1)
    dispatch_once(&-[CISparseRendererPreFiltering _kernel:]::onceToken, &__block_literal_global_199);
  v4 = &-[CISparseRendererPreFiltering _kernel:]::kH;
  if (!v3)
    v4 = &-[CISparseRendererPreFiltering _kernel:]::kV;
  return (id)*v4;
}

CIKernel *__40__CISparseRendererPreFiltering__kernel___block_invoke()
{
  CIKernel *result;
  CIKernel *v1;

  result = (CIKernel *)SDOFV2MetalLib();
  if (result)
  {
    v1 = result;
    -[CISparseRendererPreFiltering _kernel:]::kH = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_prefilter_x"), result, 0);
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_prefilter_y"), v1, 0);
    -[CISparseRendererPreFiltering _kernel:]::kV = (uint64_t)result;
  }
  return result;
}

- (id)outputImage:(id)a3 horizontal:(BOOL)a4 width:(double)a5
{
  id v9;
  void *v10;
  int v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  CIVector *v25;
  float v26;
  CIVector *v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[6];
  BOOL v37;
  _QWORD v38[3];
  int v39;
  _QWORD v40[3];
  int v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return +[CIImage emptyImage](CIImage, "emptyImage", a5);
  v9 = -[CISparseRendererPreFiltering _kernel:](self, "_kernel:", a4);
  if (!v9)
    return +[CIImage emptyImage](CIImage, "emptyImage", a5);
  v10 = v9;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  SDOFRenderingValue(CFSTR("preFilterRadius"), self->inputTuningParameters);
  v41 = v11;
  -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
  v13 = v12;
  SDOFHighlightRecoveryValue(CFSTR("blurRadiusT1"), self->inputTuningParameters);
  v15 = v14;
  SDOFHighlightRecoveryValue(CFSTR("blurRadiusT0"), self->inputTuningParameters);
  v17 = v16;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v19 = v18;
  SDOFRenderingValue(CFSTR("preFilterRadius"), self->inputTuningParameters);
  v21 = v20;
  SDOFRenderingValue(CFSTR("preFilterBlurStrength"), self->inputTuningParameters);
  v23 = v22;
  SDOFHighlightRecoveryValue(CFSTR("preFilterGain"), self->inputTuningParameters);
  v25 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v19, v21, v23, v24);
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v27 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(1.0 / (float)((float)(v13 * v15) - (float)(v13 * v17))), (float)-(float)((float)(1.0 / (float)((float)(v13 * v15) - (float)(v13 * v17))) * (float)(v13 * v17)), a5, v26);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v39 = v28;
  v29 = *MEMORY[0x1E0C9D5E0];
  v30 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v31 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v32 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __61__CISparseRendererPreFiltering_outputImage_horizontal_width___block_invoke;
  v36[3] = &unk_1E2EC4CE8;
  v37 = a4;
  v36[4] = v40;
  v36[5] = v38;
  v44[0] = a3;
  v44[1] = v25;
  v44[2] = v27;
  v33 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v42 = CFSTR("kCIKernelOutputFormat");
  v43 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v34 = (void *)objc_msgSend(v10, "applyWithExtent:roiCallback:arguments:options:", v36, v33, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1), v29, v30, v31, v32);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  return v34;
}

double __61__CISparseRendererPreFiltering_outputImage_horizontal_width___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;
  double v6;
  double v7;
  double result;

  v5 = -(float)(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
              * *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v6 = v5;
  if (*(_BYTE *)(a1 + 48))
    v7 = v5;
  else
    v7 = 0.0;
  if (*(_BYTE *)(a1 + 48))
    v6 = 0.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, v7, v6);
  return result;
}

- (void)dumpImage:(id)a3 extent:(CGRect)a4 prefixFilename:(id)a5
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  CIContext *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[3];

  height = a4.size.height;
  width = a4.size.width;
  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "imageByCroppingToRect:", a4.origin.x, a4.origin.y);
  v9 = malloc_type_malloc((unint64_t)(height * (width * 8.0)), 0x4F7646CDuLL);
  if (v9)
  {
    v10 = v9;
    v14[0] = CFSTR("working_format");
    v14[1] = CFSTR("kCIContextName");
    v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
    v15[1] = CFSTR("CIPortraitBlurVr-dumpImage");
    v11 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    objc_msgSend(v8, "extent");
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v8, v10, (uint64_t)(width * 8.0), 2056, 0);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, (unint64_t)(height * (width * 8.0)));
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@%gx%g.f16"), NSTemporaryDirectory(), a5, *(_QWORD *)&width, *(_QWORD *)&height);
    objc_msgSend(v12, "writeToFile:atomically:", v13, 1);
    NSLog(CFSTR("filename = %@"), v13);
    free(v10);
  }
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGRect v13;

  -[CIImage extent](self->inputImage, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CISparseRendererPreFiltering outputImage:horizontal:width:](self, "outputImage:horizontal:width:", -[CISparseRendererPreFiltering outputImage:horizontal:width:](self, "outputImage:horizontal:width:", -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent"), 1, v7), 0, v7);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  if (CGRectEqualToRect(*MEMORY[0x1E0C9D5E0], v13))
    return v11;
  else
    return (id)objc_msgSend(v11, "imageByCroppingToRect:", v4, v6, v8, v10);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

@end
