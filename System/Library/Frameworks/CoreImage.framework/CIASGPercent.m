@implementation CIASGPercent

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryGeometryAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v3[4] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("12");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.14");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImageScale:(double)a3 outset:(int)a4 hKernel:(id)a5 vKernel:(id)a6
{
  CIImage *v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v29[5];
  int v30;
  _QWORD v31[5];
  int v32;
  uint64_t v33;
  _QWORD v34[2];
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34[1] = *MEMORY[0x1E0C80C00];
  v11 = -[CIImage imageBySamplingNearest](-[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent"), "imageBySamplingNearest");
  v12 = (double *)MEMORY[0x1E0C9D5E0];
  v13 = *MEMORY[0x1E0C9D5E0];
  v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v17 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke;
  v31[3] = &__block_descriptor_44_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v31[4] = a3;
  v32 = a4;
  v34[0] = v11;
  v18 = objc_msgSend((id)objc_msgSend(a5, "applyWithExtent:roiCallback:arguments:", v31, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1), v13, v14, v15, v16), "imageBySamplingNearest");
  v19 = *v12;
  v20 = v12[1];
  v21 = v12[2];
  v22 = v12[3];
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke_2;
  v29[3] = &__block_descriptor_44_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v29[4] = a3;
  v30 = a4;
  v33 = v18;
  v23 = (void *)objc_msgSend(a6, "applyWithExtent:roiCallback:arguments:", v29, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1), v19, v20, v21, v22);
  -[CIImage extent](self->inputImage, "extent");
  if (!CGRectIsInfinite(v35))
  {
    -[CIImage extent](self->inputImage, "extent");
    v36.origin.x = v24 * a3;
    v36.origin.y = v25 * a3;
    v36.size.width = v26 * a3;
    v36.size.height = v27 * a3;
    v37 = CGRectIntegral(v36);
    return (id)objc_msgSend(v23, "imageByCroppingToRect:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  }
  return v23;
}

double __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double result;

  v5 = *(double *)(a1 + 32);
  v6 = a2;
  v7 = a4 + v6;
  v8 = floor((float)(floorf(v6) / v5) + 0.499);
  v9 = floor((float)(floorf(v7) / v5) + 0.499);
  v10 = v8;
  v11 = (float)(v9 - v8);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)(&a3 - 1), (double)-*(_DWORD *)(a1 + 40), 0.0);
  return result;
}

double __56__CIASGPercent_outputImageScale_outset_hKernel_vKernel___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double result;

  v5 = *(double *)(a1 + 32);
  v6 = a3;
  v7 = a5 + v6;
  v8 = floor((float)(floorf(v6) / v5) + 0.499);
  v9 = floor((float)(floorf(v7) / v5) + 0.499);
  v10 = v8;
  v11 = (float)(v9 - v8);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (double)-*(_DWORD *)(a1 + 40));
  return result;
}

- (id)outputImage
{
  return 0;
}

@end
