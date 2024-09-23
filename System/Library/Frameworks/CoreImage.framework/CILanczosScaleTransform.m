@implementation CILanczosScaleTransform

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
  v7[0] = CFSTR("CICategoryGeometryAdjustment");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputScale");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F19F80;
  v6[1] = &unk_1E2F19F90;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F19FA0;
  v6[3] = &unk_1E2F19FB0;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F19FB0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputAspectRatio");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F19F80;
  v4[1] = &unk_1E2F19FC0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19FD0;
  v4[3] = &unk_1E2F19FB0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19FB0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setInputAspectRatio:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (id)outputImage
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CIImage *inputImage;
  double x;
  double y;
  double width;
  double height;
  CIImage *v15;
  CIVector *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL IsNull;
  double v26;
  double var0;
  double var1;
  double var3;
  double var2;
  CIKernel *v31;
  CIVector *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CIKernel *v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CIKernel *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  float64x2_t v61;
  float64x2_t v62;
  CIKernel *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  float64x2_t v75;
  float64x2_t v76;
  uint64_t v77;
  _QWORD v78[5];
  float64x2_t v79;
  float64x2_t v80;
  Rectangle v81;
  CGAffineTransform v82;
  Rectangle v83;
  uint64_t v84;
  double v85;
  Rectangle v86;
  _QWORD v87[2];
  _QWORD v88[2];
  Rectangle v89;
  uint64_t v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v90 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CILanczosScaleTransform _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber doubleValue](self->inputScale, "doubleValue");
  v5 = v4;
  -[NSNumber doubleValue](self->inputAspectRatio, "doubleValue");
  v7 = v5 * v6;
  -[NSNumber doubleValue](self->inputScale, "doubleValue");
  v9 = v8;
  inputImage = self->inputImage;
  if (v7 < 0.000000999999997 || v8 < 0.000000999999997)
  {
    CGAffineTransformMakeScale(&v82, v7, v8);
    return -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v82);
  }
  -[CIImage extent](inputImage, "extent");
  x = v91.origin.x;
  y = v91.origin.y;
  width = v91.size.width;
  height = v91.size.height;
  if (CGRectIsInfinite(v91))
  {
    y = -8.98846567e307;
    width = 1.79769313e308;
    height = 1.79769313e308;
  }
  else
  {
    v92.origin.x = x;
    v92.origin.y = y;
    v92.size.width = width;
    v92.size.height = height;
    if (!CGRectIsNull(v92))
      goto LABEL_13;
    width = 0.0;
    y = INFINITY;
    height = 0.0;
  }
  x = y;
LABEL_13:
  if (fabs(x) == INFINITY || fabs(y) == INFINITY)
  {
    *(int64x2_t *)&v81.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v81.var2 = 0.0;
    v81.var3 = 0.0;
  }
  else if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
  {
    *(int64x2_t *)&v81.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v81.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v81.var0 = v7 * x;
    v81.var1 = v9 * y;
    v81.var2 = v7 * width;
    v81.var3 = v9 * height;
  }
  Rectangle::integralize(&v81, 0.0001, (uint64_t)&v83);
  v81 = v83;
  while (v7 < 0.50001 && v9 < 0.50001)
  {
    v15 = downBy2H(inputImage);
    inputImage = downBy2V(v15);
    v7 = v7 + v7;
    v9 = v9 + v9;
  }
  while (v7 < 0.50001)
  {
    inputImage = downBy2H(inputImage);
    v7 = v7 + v7;
  }
  while (v9 < 0.50001)
  {
    inputImage = downBy2V(inputImage);
    v9 = v9 + v9;
  }
  if (v7 < 0.99999)
  {
    v16 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0 / v7, 1.0, 1.0, 0.0);
    -[CIImage extent](inputImage, "extent");
    v17 = v93.origin.x;
    v18 = v93.origin.y;
    v19 = v93.size.width;
    v20 = v93.size.height;
    if (CGRectIsInfinite(v93))
    {
      v21 = 1.79769313e308;
      v22 = -8.98846567e307;
      v23 = 1.79769313e308;
      v24 = -8.98846567e307;
    }
    else
    {
      v94.origin.x = v17;
      v94.origin.y = v18;
      v94.size.width = v19;
      v94.size.height = v20;
      IsNull = CGRectIsNull(v94);
      v23 = 0.0;
      v24 = INFINITY;
      if (IsNull)
        v22 = INFINITY;
      else
        v22 = v18;
      if (IsNull)
        v21 = 0.0;
      else
        v21 = v19;
      if (!IsNull)
      {
        v23 = v20;
        v24 = v17;
      }
    }
    if (fabs(v24) == INFINITY || fabs(v22) == INFINITY)
    {
      *(int64x2_t *)&v86.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v86.var2 = 0.0;
      v86.var3 = 0.0;
    }
    else if (v24 == -8.98846567e307 && v22 == -8.98846567e307 && v21 == 1.79769313e308 && v23 == 1.79769313e308)
    {
      *(int64x2_t *)&v86.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v86.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v86.var0 = v7 * v24;
      v86.var1 = v22;
      v86.var2 = v7 * v21;
      v86.var3 = v23;
    }
    Rectangle::inset(&v86, -3.0, -0.0, (uint64_t)&v89);
    *(_QWORD *)&v26 = *(_OWORD *)&Rectangle::integralize(&v89, 0.0001, (uint64_t)&v83);
    var0 = v83.var0;
    var1 = v83.var1;
    var2 = v83.var2;
    var3 = v83.var3;
    v31 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lanczosDownH, v26);
    if (var0 == -8.98846567e307 && var1 == -8.98846567e307 && var2 == 1.79769313e308 && var3 == 1.79769313e308)
    {
      var0 = *MEMORY[0x1E0C9D5E0];
      var1 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      var2 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      var3 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    *(_QWORD *)&v83.var0 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v83.var1 = 3221225472;
    *(_QWORD *)&v83.var2 = ___ZL5downHP7CIImaged_block_invoke;
    *(_QWORD *)&v83.var3 = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v84 = 0x4012C985F06F6944;
    v85 = v7;
    *(_QWORD *)&v89.var0 = inputImage;
    *(_QWORD *)&v89.var1 = v16;
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v31, "applyWithExtent:roiCallback:arguments:", &v83, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 2), var0, var1, var2, var3);
    v7 = 1.0;
  }
  if (v9 < 0.99999)
  {
    v32 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 1.0 / v9, 0.0, 1.0);
    -[CIImage extent](inputImage, "extent");
    v33 = v95.origin.x;
    v34 = v95.origin.y;
    v35 = v95.size.width;
    v36 = v95.size.height;
    if (CGRectIsInfinite(v95))
    {
      v37 = 1.79769313e308;
      v38 = -8.98846567e307;
      v39 = 1.79769313e308;
      v40 = -8.98846567e307;
    }
    else
    {
      v96.origin.x = v33;
      v96.origin.y = v34;
      v96.size.width = v35;
      v96.size.height = v36;
      v41 = CGRectIsNull(v96);
      v39 = 0.0;
      v40 = INFINITY;
      if (v41)
        v38 = INFINITY;
      else
        v38 = v34;
      if (v41)
        v37 = 0.0;
      else
        v37 = v35;
      if (!v41)
      {
        v39 = v36;
        v40 = v33;
      }
    }
    if (fabs(v40) == INFINITY || fabs(v38) == INFINITY)
    {
      *(int64x2_t *)&v86.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v86.var2 = 0.0;
      v86.var3 = 0.0;
    }
    else if (v40 == -8.98846567e307 && v38 == -8.98846567e307 && v37 == 1.79769313e308 && v39 == 1.79769313e308)
    {
      *(int64x2_t *)&v86.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v86.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v86.var0 = v40;
      v86.var1 = v9 * v38;
      v86.var2 = v37;
      v86.var3 = v9 * v39;
    }
    Rectangle::inset(&v86, -0.0, -3.0, (uint64_t)&v89);
    *(_QWORD *)&v42 = *(_OWORD *)&Rectangle::integralize(&v89, 0.0001, (uint64_t)&v83);
    v43 = v83.var0;
    v44 = v83.var1;
    v46 = v83.var2;
    v45 = v83.var3;
    v47 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lanczosDownV, v42);
    if (v43 == -8.98846567e307 && v44 == -8.98846567e307 && v46 == 1.79769313e308 && v45 == 1.79769313e308)
    {
      v43 = *MEMORY[0x1E0C9D5E0];
      v44 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v46 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v45 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    *(_QWORD *)&v83.var0 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v83.var1 = 3221225472;
    *(_QWORD *)&v83.var2 = ___ZL5downVP7CIImaged_block_invoke;
    *(_QWORD *)&v83.var3 = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v84 = 0x4012C985F06F6944;
    v85 = v9;
    *(_QWORD *)&v89.var0 = inputImage;
    *(_QWORD *)&v89.var1 = v32;
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v47, "applyWithExtent:roiCallback:arguments:", &v83, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 2), v43, v44, v46, v45);
    v9 = 1.0;
  }
  if (v7 > 1.00001)
  {
    -[CIImage extent](inputImage, "extent");
    v48 = v97.origin.x;
    v49 = v97.origin.y;
    v50 = v97.size.width;
    v51 = v97.size.height;
    if (CGRectIsInfinite(v97))
    {
      *(int64x2_t *)&v83.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v83.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v98.origin.x = v48;
      v98.origin.y = v49;
      v98.size.width = v50;
      v98.size.height = v51;
      if (CGRectIsNull(v98))
      {
        *(int64x2_t *)&v83.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v83.var2 = 0.0;
        v83.var3 = 0.0;
      }
      else
      {
        v83.var0 = v48;
        v83.var1 = v49;
        v83.var2 = v50;
        v83.var3 = v51;
      }
    }
    Rectangle::inset(&v83, -2.0, -0.0, (uint64_t)&v79);
    if (fabs(v79.f64[0]) == INFINITY || fabs(v79.f64[1]) == INFINITY)
    {
      *(int64x2_t *)&v86.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v86.var2 = 0.0;
      v86.var3 = 0.0;
    }
    else
    {
      v61 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      v62 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v79, v62), (int32x4_t)vceqq_f64(v80, v61))))) & 1) != 0)
      {
        v86.var0 = v7 * v79.f64[0];
        v86.var1 = v79.f64[1];
        v86.var2 = v7 * v80.f64[0];
        v86.var3 = v80.f64[1];
      }
      else
      {
        *(float64x2_t *)&v86.var0 = v62;
        *(float64x2_t *)&v86.var2 = v61;
      }
    }
    Rectangle::integralize(&v86, 0.0001, (uint64_t)&v89);
    v83 = v89;
    v52 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lanczosUpH);
    v54 = v83.var1;
    v53 = v83.var0;
    v55 = v83.var3;
    v56 = v83.var2;
    if (v83.var0 == -8.98846567e307
      && v83.var1 == -8.98846567e307
      && v83.var2 == 1.79769313e308
      && v83.var3 == 1.79769313e308)
    {
      v53 = *MEMORY[0x1E0C9D5E0];
      v54 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v56 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v55 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __38__CILanczosScaleTransform_outputImage__block_invoke;
    v78[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v78[4] = v7;
    v88[0] = inputImage;
    v88[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / v7);
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v52, "applyWithExtent:roiCallback:arguments:", v78, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2), v53, v54, v56, v55);
  }
  if (v9 > 1.00001)
  {
    -[CIImage extent](inputImage, "extent");
    v57 = v99.origin.x;
    v58 = v99.origin.y;
    v59 = v99.size.width;
    v60 = v99.size.height;
    if (CGRectIsInfinite(v99))
    {
      *(int64x2_t *)&v83.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v83.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v100.origin.x = v57;
      v100.origin.y = v58;
      v100.size.width = v59;
      v100.size.height = v60;
      if (CGRectIsNull(v100))
      {
        *(int64x2_t *)&v83.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v83.var2 = 0.0;
        v83.var3 = 0.0;
      }
      else
      {
        v83.var0 = v57;
        v83.var1 = v58;
        v83.var2 = v59;
        v83.var3 = v60;
      }
    }
    Rectangle::inset(&v83, -0.0, -2.0, (uint64_t)&v79);
    if (fabs(v79.f64[0]) == INFINITY || fabs(v79.f64[1]) == INFINITY)
    {
      *(int64x2_t *)&v86.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v86.var2 = 0.0;
      v86.var3 = 0.0;
    }
    else
    {
      v75 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      v76 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v79, v76), (int32x4_t)vceqq_f64(v80, v75))))) & 1) != 0)
      {
        v86.var0 = v79.f64[0];
        v86.var1 = v9 * v79.f64[1];
        v86.var2 = v80.f64[0];
        v86.var3 = vmuld_lane_f64(v9, v80, 1);
      }
      else
      {
        *(float64x2_t *)&v86.var0 = v76;
        *(float64x2_t *)&v86.var2 = v75;
      }
    }
    Rectangle::integralize(&v86, 0.0001, (uint64_t)&v89);
    v83 = v89;
    v63 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lanczosUpV);
    v65 = v83.var1;
    v64 = v83.var0;
    v66 = v83.var3;
    v67 = v83.var2;
    if (v83.var0 == -8.98846567e307
      && v83.var1 == -8.98846567e307
      && v83.var2 == 1.79769313e308
      && v83.var3 == 1.79769313e308)
    {
      v64 = *MEMORY[0x1E0C9D5E0];
      v65 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v67 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v66 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v87[0] = inputImage;
    v87[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / v9, MEMORY[0x1E0C809B0], 3221225472, __38__CILanczosScaleTransform_outputImage__block_invoke_2, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, *(_QWORD *)&v9);
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v63, "applyWithExtent:roiCallback:arguments:", &v77, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2), v64, v65, v67, v66);
  }
  v68 = v81.var0;
  v69 = v81.var1;
  v70 = v81.var2;
  v71 = v81.var3;
  if (v81.var0 == -8.98846567e307
    && v81.var1 == -8.98846567e307
    && v81.var2 == 1.79769313e308
    && v81.var3 == 1.79769313e308)
  {
    v68 = *MEMORY[0x1E0C9D5E0];
    v69 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v70 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v71 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  return -[CIImage imageByCroppingToRect:](inputImage, "imageByCroppingToRect:", v68, v69, v70, v71);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;

  -[NSNumber doubleValue](self->inputScale, "doubleValue");
  if (v3 != 1.0)
    return 0;
  -[NSNumber doubleValue](self->inputAspectRatio, "doubleValue");
  return v4 == 1.0;
}

double __38__CILanczosScaleTransform_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double result;
  unsigned int v36;
  float v37;
  unsigned int v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v8 = 1.0 / *(double *)(a1 + 32);
  *(float *)&v9 = a2;
  v10 = a3;
  v36 = LODWORD(v9);
  v37 = v10;
  *((float *)&v9 + 1) = v10;
  v11 = upsampleHRect(v9, v8);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  *(float *)&v12 = a3 + a5;
  v39 = LODWORD(v12);
  v45.origin.x = upsampleHRect(COERCE_DOUBLE(__PAIR64__(LODWORD(v12), v36)), v8);
  v45.origin.y = v18;
  v45.size.width = v19;
  v45.size.height = v20;
  v40.origin.x = v11;
  v40.origin.y = v13;
  v40.size.width = v15;
  v40.size.height = v17;
  v41 = CGRectUnion(v40, v45);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  *(float *)&v41.origin.x = a2 + a4;
  LODWORD(a4) = LODWORD(v41.origin.x);
  *((float *)&v41.origin.x + 1) = v37;
  v46.origin.x = upsampleHRect(v41.origin.x, v8);
  v46.origin.y = v25;
  v46.size.width = v26;
  v46.size.height = v27;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v43 = CGRectUnion(v42, v46);
  v28 = v43.origin.x;
  v29 = v43.origin.y;
  v30 = v43.size.width;
  v31 = v43.size.height;
  v47.origin.x = upsampleHRect(COERCE_DOUBLE(__PAIR64__(v39, LODWORD(a4))), v8);
  v47.origin.y = v32;
  v47.size.width = v33;
  v47.size.height = v34;
  v44.origin.x = v28;
  v44.origin.y = v29;
  v44.size.width = v30;
  v44.size.height = v31;
  *(_QWORD *)&result = (unint64_t)CGRectUnion(v44, v47);
  return result;
}

double __38__CILanczosScaleTransform_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v8;
  float32x2_t v9;
  float32_t v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double result;
  __int32 v36;
  float32_t v37;
  unsigned int v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v8 = 1.0 / *(double *)(a1 + 32);
  v9.f32[0] = a2;
  v10 = a3;
  v36 = v9.i32[0];
  v37 = v10;
  v9.f32[1] = v10;
  v11 = upsampleVRect(v9, v8);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  *(float *)&v12 = a3 + a5;
  v39 = LODWORD(v12);
  v45.origin.x = upsampleVRect((float32x2_t)__PAIR64__(LODWORD(v12), v36), v8);
  v45.origin.y = v18;
  v45.size.width = v19;
  v45.size.height = v20;
  v40.origin.x = v11;
  v40.origin.y = v13;
  v40.size.width = v15;
  v40.size.height = v17;
  v41 = CGRectUnion(v40, v45);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  *(float *)&v41.origin.x = a2 + a4;
  LODWORD(a4) = LODWORD(v41.origin.x);
  *((float32_t *)&v41.origin.x + 1) = v37;
  v46.origin.x = upsampleVRect(*(float32x2_t *)&v41.origin.x, v8);
  v46.origin.y = v25;
  v46.size.width = v26;
  v46.size.height = v27;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v43 = CGRectUnion(v42, v46);
  v28 = v43.origin.x;
  v29 = v43.origin.y;
  v30 = v43.size.width;
  v31 = v43.size.height;
  v47.origin.x = upsampleVRect((float32x2_t)__PAIR64__(v39, LODWORD(a4)), v8);
  v47.origin.y = v32;
  v47.size.width = v33;
  v47.size.height = v34;
  v44.origin.x = v28;
  v44.origin.y = v29;
  v44.size.width = v30;
  v44.size.height = v31;
  *(_QWORD *)&result = (unint64_t)CGRectUnion(v44, v47);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (NSNumber)inputAspectRatio
{
  return self->inputAspectRatio;
}

@end
