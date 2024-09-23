@implementation CIAreaBoundsRed

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryReduction");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryHighDynamicRange");
  v3[4] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("18");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("15.0");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  id v2;
  void *v3;
  CIColorKernel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CIImage *v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  float v16;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CIColorKernel *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CIImage *v33;
  CIColorKernel *v34;
  CIColorKernel *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double *v40;
  double x;
  double y;
  double width;
  double height;
  double v45;
  double v46;
  double v47;
  double v48;
  BOOL IsNull;
  double v50;
  double v52;
  double v53;
  double v54;
  double v55;
  double v59;
  double v60;
  int64x2_t v61;
  int64x2_t v62;
  int64x2_t v63;
  Rectangle v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CIImage *v69;
  CIImage *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[3];
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v74[1] = *MEMORY[0x1E0C80C00];
  v2 = -[CIReductionFilter offsetAndCrop](self, "offsetAndCrop");
  if (!v2)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v3 = v2;
  objc_msgSend(v2, "extent");
  if (CGRectIsEmpty(v75))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v5 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_redThreshold);
  objc_msgSend(v3, "extent");
  v74[0] = v3;
  v10 = -[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1), v6, v7, v8, v9);
  -[CIImage extent](v10, "extent");
  v12 = v11;
  -[CIImage extent](v10, "extent");
  v14 = v12;
  v16 = v15;
  if (v14 > 1024.0 || v16 > 1024.0)
  {
    v18 = fminf(1024.0 / v16, 1.0);
    v72[0] = CFSTR("inputScale");
    *(float *)&v13 = v18;
    v72[1] = CFSTR("inputAspectRatio");
    v73[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    *(float *)&v19 = fminf(1024.0 / v14, 1.0) / v18;
    v73[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v10 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMaximumScaleTransform"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2)), "imageByCroppingToRect:", 0.0, 0.0, fminf(v14, 1024.0), fminf(v16, 1024.0));
  }
  -[CIImage extent](v10, "extent");
  v21 = v20;
  v23 = v22;
  v24 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_maskBoundsInit);
  -[CIImage extent](v10, "extent");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v71[0] = v10;
  v71[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0 / v21, 1.0 / v23);
  v33 = -[CIColorKernel applyWithExtent:arguments:](v24, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2), v26, v28, v30, v32);
  v34 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_maskBoundsReduce);
  if (v21 > 1.001 || v23 > 1.001)
  {
    v63 = vdupq_n_s64(0x7FF0000000000000uLL);
    v40 = (double *)MEMORY[0x1E0C9D5E0];
    v61 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v62 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    do
    {
      -[CIImage extent](v33, "extent", *(_OWORD *)&v61, *(_OWORD *)&v62);
      x = v76.origin.x;
      y = v76.origin.y;
      width = v76.size.width;
      height = v76.size.height;
      if (CGRectIsInfinite(v76))
      {
        v45 = -8.98846567e307;
        v46 = 1.79769313e308;
        v47 = 1.79769313e308;
        v48 = -8.98846567e307;
      }
      else
      {
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = width;
        v77.size.height = height;
        IsNull = CGRectIsNull(v77);
        v48 = INFINITY;
        if (IsNull)
          v46 = 0.0;
        else
          v46 = width;
        if (IsNull)
          v47 = 0.0;
        else
          v47 = height;
        if (IsNull)
          v45 = INFINITY;
        else
          v45 = y;
        if (!IsNull)
          v48 = x;
      }
      v50 = fabs(v45);
      if (fabs(v48) == INFINITY || v50 == INFINITY)
      {
        *(int64x2_t *)&v64.var0 = v63;
        v64.var2 = 0.0;
        v64.var3 = 0.0;
      }
      else if (v48 == -8.98846567e307 && v45 == -8.98846567e307 && v46 == 1.79769313e308 && v47 == 1.79769313e308)
      {
        *(int64x2_t *)&v64.var0 = v62;
        *(int64x2_t *)&v64.var2 = v61;
      }
      else
      {
        v64.var0 = v48 * 0.5;
        v64.var1 = v45 * 0.5;
        v64.var2 = v46 * 0.5;
        v64.var3 = v47 * 0.5;
      }
      Rectangle::integralize(&v64, 0.0001, (uint64_t)&v65);
      v52 = v65;
      v53 = v66;
      v55 = v67;
      v54 = v68;
      if (v65 == -8.98846567e307 && v66 == -8.98846567e307 && v67 == 1.79769313e308 && v68 == 1.79769313e308)
      {
        v52 = *v40;
        v53 = v40[1];
        v55 = v40[2];
        v54 = v40[3];
      }
      v70 = v33;
      v33 = -[CIColorKernel applyWithExtent:roiCallback:arguments:](v34, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_145, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1), v52, v53, v55, v54);
      -[CIImage extent](v33, "extent");
    }
    while (v60 > 1.001 || v59 > 1.001);
  }
  v35 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_maskBoundsPost);
  -[CIImage extent](v33, "extent");
  v69 = v33;
  return -[CIColorKernel applyWithExtent:arguments:](v35, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1), v36, v37, v38, v39);
}

void __30__CIAreaBoundsRed_outputImage__block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL IsNull;
  double v13;
  Rectangle v18;
  __int128 v19;
  CGRect v20;

  if (CGRectIsInfinite(*(CGRect *)&a1))
  {
    v8 = -8.98846567e307;
    v9 = 1.79769313e308;
    v10 = 1.79769313e308;
    v11 = -8.98846567e307;
  }
  else
  {
    v20.origin.x = a1;
    v20.origin.y = a2;
    v20.size.width = a3;
    v20.size.height = a4;
    IsNull = CGRectIsNull(v20);
    v11 = INFINITY;
    if (IsNull)
      v9 = 0.0;
    else
      v9 = a3;
    if (IsNull)
      v10 = 0.0;
    else
      v10 = a4;
    if (IsNull)
      v8 = INFINITY;
    else
      v8 = a2;
    if (!IsNull)
      v11 = a1;
  }
  v13 = fabs(v8);
  if (fabs(v11) == INFINITY || v13 == INFINITY)
  {
    *(int64x2_t *)&v18.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(_OWORD *)&v18.var2 = 0uLL;
  }
  else if (v11 == -8.98846567e307 && v8 == -8.98846567e307 && v9 == 1.79769313e308 && v10 == 1.79769313e308)
  {
    *(int64x2_t *)&v18.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v18.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v18.var0 = v11 + v11;
    v18.var1 = v8 + v8;
    v18.var2 = v9 + v9;
    v18.var3 = v10 + v10;
  }
  Rectangle::integralize(&v18, 0.0001, (uint64_t)&v19);
}

@end
