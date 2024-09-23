@implementation CIMaximumScaleTransform

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

- (id)outputImage
{
  CIImage *inputImage;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  double width;
  double height;
  double v15;
  double *v16;
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
  CIKernel *v28;
  double var0;
  double var1;
  double var3;
  double var2;
  double *v33;
  CIVector *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  CIKernel *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double *v51;
  CIVector *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  BOOL v61;
  double v62;
  CIKernel *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  int64x2_t v69;
  int64x2_t v70;
  int64x2_t v71;
  int64x2_t v72;
  int64x2_t v73;
  Rectangle v74;
  Rectangle v75;
  Rectangle v76;
  uint64_t v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v77 = *MEMORY[0x1E0C80C00];
  if (self->inputImage)
  {
    if (-[CIMaximumScaleTransform _isIdentity](self, "_isIdentity"))
      return self->inputImage;
    -[NSNumber doubleValue](self->inputScale, "doubleValue");
    v6 = v5;
    -[NSNumber doubleValue](self->inputAspectRatio, "doubleValue");
    v8 = v7;
    -[NSNumber doubleValue](self->inputScale, "doubleValue");
    v10 = v9;
    inputImage = self->inputImage;
    -[CIImage extent](inputImage, "extent");
    x = v78.origin.x;
    y = v78.origin.y;
    width = v78.size.width;
    height = v78.size.height;
    if (CGRectIsInfinite(v78))
    {
      y = -8.98846567e307;
      width = 1.79769313e308;
      height = 1.79769313e308;
    }
    else
    {
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      if (!CGRectIsNull(v79))
        goto LABEL_10;
      width = 0.0;
      y = INFINITY;
      height = 0.0;
    }
    x = y;
LABEL_10:
    v15 = v6 * v8;
    if (fabs(x) == INFINITY || fabs(y) == INFINITY)
    {
      *(int64x2_t *)&v74.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v74.var2 = 0.0;
      v74.var3 = 0.0;
    }
    else if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
    {
      *(int64x2_t *)&v74.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v74.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v74.var0 = v15 * x;
      v74.var1 = v10 * y;
      v74.var2 = v15 * width;
      v74.var3 = v10 * height;
    }
    Rectangle::integralize(&v74, 0.0001, (uint64_t)&v75);
    v74 = v75;
    if (v15 < 0.50001 && v10 < 0.50001)
    {
      v71 = vdupq_n_s64(0x7FF0000000000000uLL);
      v16 = (double *)MEMORY[0x1E0C9D5E0];
      do
      {
        -[CIImage extent](inputImage, "extent");
        v17 = v80.origin.x;
        v18 = v80.origin.y;
        v19 = v80.size.width;
        v20 = v80.size.height;
        if (CGRectIsInfinite(v80))
        {
          v21 = -8.98846567e307;
          v22 = 1.79769313e308;
          v23 = 1.79769313e308;
          v24 = -8.98846567e307;
        }
        else
        {
          v81.origin.x = v17;
          v81.origin.y = v18;
          v81.size.width = v19;
          v81.size.height = v20;
          IsNull = CGRectIsNull(v81);
          v24 = INFINITY;
          if (IsNull)
            v22 = 0.0;
          else
            v22 = v19;
          if (IsNull)
            v23 = 0.0;
          else
            v23 = v20;
          if (IsNull)
            v21 = INFINITY;
          else
            v21 = v18;
          if (!IsNull)
            v24 = v17;
        }
        v26 = fabs(v21);
        if (fabs(v24) == INFINITY || v26 == INFINITY)
        {
          *(int64x2_t *)&v76.var0 = v71;
          v76.var2 = 0.0;
          v76.var3 = 0.0;
        }
        else if (v24 == -8.98846567e307 && v21 == -8.98846567e307 && v22 == 1.79769313e308 && v23 == 1.79769313e308)
        {
          *(int64x2_t *)&v76.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v76.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v76.var0 = v24 * 0.5;
          v76.var1 = v21 * 0.5;
          v76.var2 = v22 * 0.5;
          v76.var3 = v23 * 0.5;
        }
        v28 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maxScaleDown2x2, Rectangle::integralize(&v76, 0.0001, (uint64_t)&v75).f64[0]);
        var1 = v75.var1;
        var0 = v75.var0;
        var3 = v75.var3;
        var2 = v75.var2;
        if (v75.var0 == -8.98846567e307
          && v75.var1 == -8.98846567e307
          && v75.var2 == 1.79769313e308
          && v75.var3 == 1.79769313e308)
        {
          var0 = *v16;
          var1 = v16[1];
          var2 = v16[2];
          var3 = v16[3];
        }
        *(_QWORD *)&v76.var0 = inputImage;
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v28, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_47, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1), var0, var1, var2, var3);
        v15 = v15 + v15;
        v10 = v10 + v10;
      }
      while (v15 < 0.50001 && v10 < 0.50001);
    }
    if (v15 < 0.50001)
    {
      v72 = vdupq_n_s64(0x7FF0000000000000uLL);
      v33 = (double *)MEMORY[0x1E0C9D5E0];
      v69 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      do
      {
        v34 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0, 0.0, *(_OWORD *)&v69);
        -[CIImage extent](inputImage, "extent");
        v35 = v82.origin.x;
        v36 = v82.origin.y;
        v37 = v82.size.width;
        v38 = v82.size.height;
        if (CGRectIsInfinite(v82))
        {
          v39 = -8.98846567e307;
          v40 = 1.79769313e308;
          v41 = 1.79769313e308;
          v42 = -8.98846567e307;
        }
        else
        {
          v83.origin.x = v35;
          v83.origin.y = v36;
          v83.size.width = v37;
          v83.size.height = v38;
          v43 = CGRectIsNull(v83);
          v42 = INFINITY;
          if (v43)
            v40 = 0.0;
          else
            v40 = v37;
          if (v43)
            v41 = 0.0;
          else
            v41 = v38;
          if (v43)
            v39 = INFINITY;
          else
            v39 = v36;
          if (!v43)
            v42 = v35;
        }
        v44 = fabs(v39);
        if (fabs(v42) == INFINITY || v44 == INFINITY)
        {
          *(int64x2_t *)&v76.var0 = v72;
          v76.var2 = 0.0;
          v76.var3 = 0.0;
        }
        else if (v42 == -8.98846567e307 && v39 == -8.98846567e307 && v40 == 1.79769313e308 && v41 == 1.79769313e308)
        {
          *(int64x2_t *)&v76.var0 = v69;
          *(int64x2_t *)&v76.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v76.var0 = v42 * 0.5;
          v76.var1 = v39;
          v76.var2 = v40 * 0.5;
          v76.var3 = v41;
        }
        v46 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maxScaleDown2, Rectangle::integralize(&v76, 0.0001, (uint64_t)&v75).f64[0]);
        v48 = v75.var1;
        v47 = v75.var0;
        v49 = v75.var3;
        v50 = v75.var2;
        if (v75.var0 == -8.98846567e307
          && v75.var1 == -8.98846567e307
          && v75.var2 == 1.79769313e308
          && v75.var3 == 1.79769313e308)
        {
          v47 = *v33;
          v48 = v33[1];
          v50 = v33[2];
          v49 = v33[3];
        }
        *(_QWORD *)&v76.var0 = inputImage;
        *(_QWORD *)&v76.var1 = v34;
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v46, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_33, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 2), v47, v48, v50, v49);
        v15 = v15 + v15;
      }
      while (v15 < 0.50001);
    }
    if (v10 < 0.50001)
    {
      v73 = vdupq_n_s64(0x7FF0000000000000uLL);
      v51 = (double *)MEMORY[0x1E0C9D5E0];
      v70 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      do
      {
        v52 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 1.0, *(_OWORD *)&v70);
        -[CIImage extent](inputImage, "extent");
        v53 = v84.origin.x;
        v54 = v84.origin.y;
        v55 = v84.size.width;
        v56 = v84.size.height;
        if (CGRectIsInfinite(v84))
        {
          v57 = -8.98846567e307;
          v58 = 1.79769313e308;
          v59 = 1.79769313e308;
          v60 = -8.98846567e307;
        }
        else
        {
          v85.origin.x = v53;
          v85.origin.y = v54;
          v85.size.width = v55;
          v85.size.height = v56;
          v61 = CGRectIsNull(v85);
          v60 = INFINITY;
          if (v61)
            v58 = 0.0;
          else
            v58 = v55;
          if (v61)
            v59 = 0.0;
          else
            v59 = v56;
          if (v61)
            v57 = INFINITY;
          else
            v57 = v54;
          if (!v61)
            v60 = v53;
        }
        v62 = fabs(v57);
        if (fabs(v60) == INFINITY || v62 == INFINITY)
        {
          *(int64x2_t *)&v76.var0 = v73;
          v76.var2 = 0.0;
          v76.var3 = 0.0;
        }
        else if (v60 == -8.98846567e307 && v57 == -8.98846567e307 && v58 == 1.79769313e308 && v59 == 1.79769313e308)
        {
          *(int64x2_t *)&v76.var0 = v70;
          *(int64x2_t *)&v76.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v76.var0 = v60;
          v76.var1 = v57 * 0.5;
          v76.var2 = v58;
          v76.var3 = v59 * 0.5;
        }
        v64 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maxScaleDown2, Rectangle::integralize(&v76, 0.0001, (uint64_t)&v75).f64[0]);
        v66 = v75.var1;
        v65 = v75.var0;
        v67 = v75.var3;
        v68 = v75.var2;
        if (v75.var0 == -8.98846567e307
          && v75.var1 == -8.98846567e307
          && v75.var2 == 1.79769313e308
          && v75.var3 == 1.79769313e308)
        {
          v65 = *v51;
          v66 = v51[1];
          v68 = v51[2];
          v67 = v51[3];
        }
        *(_QWORD *)&v76.var0 = inputImage;
        *(_QWORD *)&v76.var1 = v52;
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v64, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_36_1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 2), v65, v66, v68, v67);
        v10 = v10 + v10;
      }
      while (v10 < 0.50001);
    }
    if (v15 < 0.99999)
    {
      inputImage = scaleH(inputImage, v15);
      v15 = 1.0;
    }
    if (v10 < 0.99999)
    {
      inputImage = scaleV(inputImage, v10);
      v10 = 1.0;
    }
    if (v15 > 1.00001)
      inputImage = scaleH(inputImage, v15);
    if (v10 > 1.00001)
      return scaleV(inputImage, v10);
    return inputImage;
  }
  return 0;
}

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
  v9[1] = CFSTR("18");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("15.0");
  v8[3] = CFSTR("inputScale");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A220;
  v6[1] = &unk_1E2F1A230;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A240;
  v6[3] = &unk_1E2F1A250;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1A250;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputAspectRatio");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A220;
  v4[1] = &unk_1E2F1A260;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A270;
  v4[3] = &unk_1E2F1A250;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A250;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputAspectRatio
{
  return self->inputAspectRatio;
}

- (void)setInputAspectRatio:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
