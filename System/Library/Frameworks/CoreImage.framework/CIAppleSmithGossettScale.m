@implementation CIAppleSmithGossettScale

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryGeometryAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v5[4] = CFSTR("CICategoryApplePrivate");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("12");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.14");
  v6[3] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18B30;
  v4[1] = &unk_1E2F18B40;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F18B50;
  v4[3] = &unk_1E2F18B50;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F18B50;
  v4[5] = &unk_1E2F18B50;
  v3[6] = CFSTR("CIAttributeType");
  v4[6] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)outputImage
{
  float v3;
  CIImage *inputImage;
  NSNumber *inputScale;
  double v8;
  CIImage *v9;
  double v10;
  CIVector *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CIKernel *v26;
  uint64_t v27;
  CIImage *v28;
  CIVector *v29;
  double x;
  double y;
  double width;
  double height;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CIKernel *v40;
  CIImage *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v47;
  double v48;
  double v49;
  double v50;
  Rectangle v51;
  _QWORD v52[2];
  _QWORD v53[2];
  Rectangle v54;
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v55 = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputScale, "floatValue");
  inputImage = self->inputImage;
  if (v3 >= 1.0 || v3 < 0.5)
  {
    inputScale = self->inputScale;
    v52[0] = CFSTR("inputScale");
    v52[1] = CFSTR("inputAspectRatio");
    v53[0] = inputScale;
    v53[1] = &unk_1E2F18B50;
    return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CILanczosScaleTransform"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
  }
  v8 = v3;
  v9 = -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent");
  v10 = 0.0;
  v11 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0 / v8, 1.0, 1.0, 0.0);
  -[CIImage extent](v9, "extent");
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  if (CGRectIsInfinite(*(CGRect *)&v12))
  {
    v10 = 1.79769313e308;
    v17 = -8.98846567e307;
    v19 = 1.79769313e308;
  }
  else
  {
    v56.origin.x = v16;
    v56.origin.y = v17;
    v56.size.width = v18;
    v56.size.height = v19;
    if (!CGRectIsNull(v56))
    {
      v10 = v18;
      goto LABEL_13;
    }
    v17 = INFINITY;
    v19 = 0.0;
  }
  v16 = v17;
LABEL_13:
  if (fabs(v16) == INFINITY || fabs(v17) == INFINITY)
  {
    *(int64x2_t *)&v51.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v51.var2 = 0.0;
    v51.var3 = 0.0;
  }
  else if (v16 == -8.98846567e307 && v17 == -8.98846567e307 && v10 == 1.79769313e308 && v19 == 1.79769313e308)
  {
    *(int64x2_t *)&v51.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v51.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v51.var0 = v16 * v8;
    v51.var1 = v17;
    v51.var2 = v10 * v8;
    v51.var3 = v19;
  }
  Rectangle::inset(&v51, -3.0, -0.0, (uint64_t)&v54);
  *(_QWORD *)&v20 = *(_OWORD *)&Rectangle::integralize(&v54, 0.0001, (uint64_t)&v47);
  v21 = v47;
  v22 = v48;
  v24 = v49;
  v23 = v50;
  v25 = COERCE_DOUBLE((uint64_t)-[CIImage imageBySamplingNearest](v9, "imageBySamplingNearest", v20));
  v26 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_asgDownH);
  if (v21 == -8.98846567e307 && v22 == -8.98846567e307 && v24 == 1.79769313e308 && v23 == 1.79769313e308)
  {
    v21 = *MEMORY[0x1E0C9D5E0];
    v22 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  v27 = MEMORY[0x1E0C809B0];
  v54.var0 = v25;
  *(_QWORD *)&v54.var1 = v11;
  *(_QWORD *)&v54.var2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0, MEMORY[0x1E0C809B0], 3221225472, ___ZL5downHP7CIImagedd_block_invoke, &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, 0x4012C985F06F6944, *(_QWORD *)&v8, *(_QWORD *)&v51.var0, *(_QWORD *)&v51.var1, *(_QWORD *)&v51.var2, *(_QWORD *)&v51.var3);
  v28 = -[CIKernel applyWithExtent:roiCallback:arguments:](v26, "applyWithExtent:roiCallback:arguments:", &v47, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 3), v21, v22, v24, v23);
  v29 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 1.0 / v8, 0.0, 1.0);
  -[CIImage extent](v28, "extent");
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  if (CGRectIsInfinite(v57))
  {
    width = 1.79769313e308;
    y = -8.98846567e307;
    height = 1.79769313e308;
LABEL_25:
    x = y;
    goto LABEL_26;
  }
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  if (CGRectIsNull(v58))
  {
    width = 0.0;
    y = INFINITY;
    height = 0.0;
    goto LABEL_25;
  }
LABEL_26:
  if (fabs(x) == INFINITY || fabs(y) == INFINITY)
  {
    *(int64x2_t *)&v51.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v51.var2 = 0.0;
    v51.var3 = 0.0;
  }
  else if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
  {
    *(int64x2_t *)&v51.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v51.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v51.var0 = x;
    v51.var1 = y * v8;
    v51.var2 = width;
    v51.var3 = height * v8;
  }
  Rectangle::inset(&v51, -0.0, -3.0, (uint64_t)&v54);
  *(_QWORD *)&v34 = *(_OWORD *)&Rectangle::integralize(&v54, 0.0001, (uint64_t)&v47);
  v35 = v47;
  v36 = v48;
  v38 = v49;
  v37 = v50;
  v39 = COERCE_DOUBLE((uint64_t)-[CIImage imageBySamplingNearest](v28, "imageBySamplingNearest", v34));
  v40 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_asgDownV);
  if (v35 == -8.98846567e307 && v36 == -8.98846567e307 && v38 == 1.79769313e308 && v37 == 1.79769313e308)
  {
    v35 = *MEMORY[0x1E0C9D5E0];
    v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v38 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v37 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  v54.var0 = v39;
  *(_QWORD *)&v54.var1 = v29;
  *(_QWORD *)&v54.var2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0, v27, 3221225472, ___ZL5downVP7CIImagedd_block_invoke, &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, 0x4012C985F06F6944, *(_QWORD *)&v8, *(_QWORD *)&v51.var0, *(_QWORD *)&v51.var1, *(_QWORD *)&v51.var2, *(_QWORD *)&v51.var3);
  v41 = -[CIKernel applyWithExtent:roiCallback:arguments:](v40, "applyWithExtent:roiCallback:arguments:", &v47, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 3), v35, v36, v38, v37);
  -[CIImage extent](self->inputImage, "extent");
  if (!CGRectIsInfinite(v59))
  {
    -[CIImage extent](self->inputImage, "extent");
    v60.origin.x = v42 * v8;
    v60.origin.y = v43 * v8;
    v60.size.width = v44 * v8;
    v60.size.height = v45 * v8;
    v61 = CGRectIntegral(v60);
    return -[CIImage imageByCroppingToRect:](v41, "imageByCroppingToRect:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
  }
  return v41;
}

@end
