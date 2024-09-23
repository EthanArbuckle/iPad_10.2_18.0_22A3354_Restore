@implementation CIStretchCrop

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_stretchcrop);
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
  CIImage *inputImage;
  double v11;
  CIImage *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CIImage *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  BOOL v39;
  double v40;
  double v41;
  float v42;
  float v43;
  double v44;
  double v45;
  double v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsInfinite;
  _BOOL4 v57;
  float32x2_t v58;
  float v59;
  float32x2_t v60;
  float v61;
  int8x16_t v62;
  double v63;
  double v64;
  BOOL IsNull;
  double v66;
  float32x2_t v67;
  double v68;
  float32_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x2_t v77;
  float32_t v78;
  float32x2_t v79;
  double *p_var3;
  double *p_var1;
  double *p_var2;
  double v83;
  double v84;
  double v85;
  id v86;
  int8x16_t v88;
  float v89;
  float v90;
  float v91;
  float v92;
  int8x16_t v93;
  float32x2_t v94;
  float32x2_t v95;
  float v96;
  float v97;
  float v98;
  float v99;
  double v100;
  double v101;
  _QWORD v102[4];
  int8x16_t v103;
  float32x2_t v104;
  float32x2_t v105;
  Rectangle v106;
  CGAffineTransform v107;
  CGAffineTransform v108;
  CGAffineTransform v109;
  CGAffineTransform v110;
  float32x2_t v111;
  Rectangle v112;
  _QWORD v113[4];
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v113[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputCropAmount, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputCenterStretchAmount, "doubleValue");
  v6 = v5;
  -[CIVector X](self->inputSize, "X");
  v8 = v7;
  -[CIVector Y](self->inputSize, "Y");
  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  v11 = v9;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsInfinite(v114))
    return 0;
  v12 = self->inputImage;
  -[CIImage extent](self->inputImage, "extent");
  v16 = v15;
  v18 = v17;
  if (fabs(v13) >= 1.0e-10 || fabs(v14) >= 1.0e-10)
  {
    CGAffineTransformMakeTranslation(&v110, -v13, -v14);
    v12 = -[CIImage imageByApplyingTransform:](v12, "imageByApplyingTransform:", &v110);
  }
  v19 = fmax(v11, 0.0);
  v101 = fmax(v8, 0.0);
  if (vabdd_f64(v16, v101) >= 1.0e-10 || vabdd_f64(v18, v19) >= 1.0e-10)
  {
    v20 = fmin(fmax(v4, 0.0), 1.0);
    v100 = v19;
    if (v20 <= 0.0)
    {
      v21 = v101 / v19;
    }
    else
    {
      v21 = v101 / v19;
      v22 = v16 / v18 <= v101 / v19;
      v23 = v20 * (v19 * v16 / v101) + v18 * (1.0 - v20);
      v24 = (v18 - v23) * 0.5;
      v25 = v20 * (v101 * v18 / v19) + v16 * (1.0 - v20);
      v26 = (v16 - v25) * 0.5;
      if (v16 / v18 <= v21)
        v18 = v23;
      if (v22)
      {
        v27 = v24;
      }
      else
      {
        v16 = v25;
        v27 = 0.0;
      }
      if (v22)
        v28 = 0.0;
      else
        v28 = v26;
      CGAffineTransformMakeTranslation(&v109, -v28, -v27);
      v12 = -[CIImage imageByApplyingTransform:](v12, "imageByApplyingTransform:", &v109);
    }
    if (v16 / v18 <= v21)
      v29 = v100 / v18;
    else
      v29 = v101 / v16;
    CGAffineTransformMakeScale(&v108, v29, v29);
    v30 = -[CIImage imageByApplyingTransform:](v12, "imageByApplyingTransform:", &v108);
    v31 = v30;
    v32 = v16 * v29;
    v33 = v18 * v29;
    if (vabdd_f64(v32, v101) < 1.0e-10 && vabdd_f64(v33, v100) < 1.0e-10)
      return (id)objc_msgSend(v31, "imageByCroppingToRect:", 0.0, 0.0, v101, v100);
    v34 = fmin(fmax(v6, 0.0), 1.0);
    v35 = v32 / v33;
    if (v34 == 1.0)
    {
      v22 = v35 <= v21;
      v36 = v21 / v35;
      v37 = v35 / v21;
      if (v22)
        v37 = 1.0;
      else
        v36 = 1.0;
      CGAffineTransformMakeScale(&v107, v36, v37);
      v38 = objc_msgSend(v31, "imageByApplyingTransform:", &v107);
      goto LABEL_63;
    }
    v39 = v35 <= v21;
    v40 = 1.0 - v34 + v34 * (v21 / v35);
    v41 = (v21 / v35 - v40 + v21 / v35 - v40) / (v21 / v35);
    v42 = v40;
    v43 = v41;
    v44 = v35 / v21;
    v45 = 1.0 - v34 + v34 * v44;
    v46 = v44 - v45 + v44 - v45;
    v47 = v45;
    v48 = v46 / v44;
    if (v39)
      v49 = v42;
    else
      v49 = 1.0;
    if (v39)
      v47 = 1.0;
    v98 = v49;
    v99 = v47;
    if (v39)
      v50 = v43;
    else
      v50 = 0.0;
    v97 = v50;
    if (v39)
      v51 = 0.0;
    else
      v51 = v48;
    v96 = v51;
    -[CIImage extent](v30, "extent");
    x = v115.origin.x;
    y = v115.origin.y;
    width = v115.size.width;
    height = v115.size.height;
    IsInfinite = CGRectIsInfinite(v115);
    v116.origin.x = x;
    v116.origin.y = y;
    v116.size.width = width;
    v116.size.height = height;
    v57 = CGRectIsInfinite(v116);
    v58.f32[0] = v32;
    v59 = v33;
    v89 = v58.f32[0];
    v90 = v59;
    v58.f32[1] = v59;
    v95 = v58;
    v60.f32[0] = v101 * 0.5;
    v61 = v100 * 0.5;
    v91 = v61;
    v92 = v60.f32[0];
    v60.f32[1] = v61;
    v62.i64[0] = __PAIR64__(LODWORD(v99), LODWORD(v98));
    v62.i64[1] = __PAIR64__(LODWORD(v96), LODWORD(v97));
    v93 = v62;
    v94 = v60;
    if (IsInfinite)
    {
      if (v57)
      {
        *(int64x2_t *)&v106.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
        *(int64x2_t *)&v106.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        y = -8.98846567e307;
        height = 1.79769313e308;
        width = 1.79769313e308;
LABEL_57:
        x = -8.98846567e307;
        if (y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
        {
          p_var3 = (double *)(MEMORY[0x1E0C9D5E0] + 24);
          p_var1 = (double *)(MEMORY[0x1E0C9D5E0] + 8);
          p_var2 = (double *)(MEMORY[0x1E0C9D5E0] + 16);
          x = *MEMORY[0x1E0C9D5E0];
LABEL_62:
          v83 = *p_var3;
          v84 = *p_var1;
          v85 = *p_var2;
          v86 = -[CIStretchCrop _kernel](self, "_kernel", *(_OWORD *)&v88);
          v102[0] = MEMORY[0x1E0C809B0];
          v102[1] = 3221225472;
          v102[2] = __28__CIStretchCrop_outputImage__block_invoke;
          v102[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          v104 = v95;
          v105 = v94;
          v103 = v93;
          v113[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v89, v90);
          v113[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v92, v91);
          v113[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v98, v99, v97, v96);
          v38 = objc_msgSend(v86, "applyWithExtent:roiCallback:inputImage:arguments:", v102, v31, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 3), x, v84, v85, v83);
LABEL_63:
          v31 = (void *)v38;
          return (id)objc_msgSend(v31, "imageByCroppingToRect:", 0.0, 0.0, v101, v100);
        }
LABEL_61:
        p_var1 = &v106.var1;
        p_var2 = &v106.var2;
        p_var3 = &v106.var3;
        goto LABEL_62;
      }
      v117.origin.x = x;
      v117.origin.y = y;
      v117.size.width = width;
      v117.size.height = height;
      if (CGRectIsNull(v117))
      {
        *(int64x2_t *)&v106.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v106.var2 = 0.0;
        v106.var3 = 0.0;
        x = INFINITY;
        goto LABEL_61;
      }
      v106.var0 = x;
      v106.var1 = y;
      v106.var2 = width;
      v106.var3 = height;
    }
    else
    {
      if (v57)
      {
        y = -8.98846567e307;
        v63 = 1.79769313e308;
        v64 = 1.79769313e308;
        x = -8.98846567e307;
      }
      else
      {
        v118.origin.x = x;
        v118.origin.y = y;
        v118.size.width = width;
        v118.size.height = height;
        IsNull = CGRectIsNull(v118);
        v64 = 0.0;
        if (IsNull)
          v63 = 0.0;
        else
          v63 = width;
        if (IsNull)
        {
          y = INFINITY;
          x = INFINITY;
        }
        else
        {
          v64 = height;
        }
      }
      *(int64x2_t *)&v106.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v66 = v63 + x;
      v67.f32[0] = fmin(x, v63 + x);
      v68 = v64 + y;
      v69 = fmin(y, v64 + y);
      v67.f32[1] = v69;
      v106.var2 = 0.0;
      v106.var3 = 0.0;
      v70 = vadd_f32(vdiv_f32(v67, v95), (float32x2_t)0xBF000000BF000000);
      v88 = vextq_s8(v93, v93, 8uLL);
      v71 = (float32x2_t)vdup_n_s32(0x3F7FF972u);
      __asm { FMOV            V15.2S, #1.0 }
      v111 = vadd_f32(v94, vmul_f32(v95, vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v99), LODWORD(v98)), v70), vsub_f32(_D15, vminnm_f32(vmul_f32(*(float32x2_t *)v88.i8, vabs_f32(v70)), v71)))));
      Rectangle::Union(&v106, (const vec2 *)&v111, (uint64_t)&v112);
      v106 = v112;
      v77.f32[0] = fmax(x, v66);
      v78 = fmax(y, v68);
      v77.f32[1] = v78;
      v79 = vadd_f32(vdiv_f32(v77, v95), (float32x2_t)0xBF000000BF000000);
      v111 = vadd_f32(v94, vmul_f32(v95, vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v99), LODWORD(v98)), v79), vsub_f32(_D15, vminnm_f32(vmul_f32(*(float32x2_t *)v88.i8, vabs_f32(v79)), v71)))));
      Rectangle::Union(&v106, (const vec2 *)&v111, (uint64_t)&v112);
      y = v112.var1;
      x = v112.var0;
      v106 = v112;
      height = v112.var3;
      width = v112.var2;
    }
    if (x != -8.98846567e307)
      goto LABEL_61;
    goto LABEL_57;
  }
  return v12;
}

void __28__CIStretchCrop_outputImage__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8;
  float32x2_t v9;
  float32x2_t v10;
  double v11;
  double v12;
  double v13;
  BOOL IsNull;
  double v15;
  float32x2_t v16;
  double v17;
  float32_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32_t v21;
  float32x2_t v22;
  float32x2_t v23;
  int8x16_t v24;
  float32x2_t v25;
  Rectangle v26;
  Rectangle v27;
  CGRect v28;

  v8 = a2;
  v9 = *(float32x2_t *)(a1 + 48);
  v10 = *(float32x2_t *)(a1 + 56);
  v24 = *(int8x16_t *)(a1 + 32);
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    v11 = -8.98846567e307;
    v12 = 1.79769313e308;
    v13 = 1.79769313e308;
    v8 = -8.98846567e307;
  }
  else
  {
    v28.origin.x = v8;
    v28.origin.y = a3;
    v28.size.width = a4;
    v28.size.height = a5;
    IsNull = CGRectIsNull(v28);
    v13 = 0.0;
    if (IsNull)
      v12 = 0.0;
    else
      v12 = a4;
    if (IsNull)
    {
      v11 = INFINITY;
    }
    else
    {
      v13 = a5;
      v11 = a3;
    }
    if (IsNull)
      v8 = INFINITY;
  }
  *(int64x2_t *)&v27.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  v15 = v12 + v8;
  v16.f32[0] = fmin(v8, v12 + v8);
  v17 = v13 + v11;
  v18 = fmin(v11, v13 + v11);
  v16.f32[1] = v18;
  v27.var2 = 0.0;
  v27.var3 = 0.0;
  v23 = (float32x2_t)vextq_s8(v24, v24, 8uLL).u64[0];
  v19 = vdiv_f32(vsub_f32(v16, v10), v9);
  v25 = vmul_f32(v9, vadd_f32(vdiv_f32(v19, vadd_f32(*(float32x2_t *)v24.i8, vmul_f32(v23, vabs_f32(v19)))), (float32x2_t)0x3F0000003F000000));
  Rectangle::Union(&v27, (const vec2 *)&v25, (uint64_t)&v26);
  v27 = v26;
  v20.f32[0] = fmax(v8, v15);
  v21 = fmax(v11, v17);
  v20.f32[1] = v21;
  v22 = vdiv_f32(vsub_f32(v20, v10), v9);
  v25 = vmul_f32(v9, vadd_f32(vdiv_f32(v22, vadd_f32(*(float32x2_t *)v24.i8, vmul_f32(v23, vabs_f32(v22)))), (float32x2_t)0x3F0000003F000000));
  Rectangle::Union(&v27, (const vec2 *)&v25, (uint64_t)&v26);
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[8];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryDistortionEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("9");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.6");
  v10[3] = CFSTR("inputSize");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypePosition");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1280.0, 720.0);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputCropAmount");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeScalar");
  v6[1] = &unk_1E2F1AE10;
  v5[2] = CFSTR("CIAttributeMax");
  v5[3] = CFSTR("CIAttributeSliderMin");
  v6[2] = &unk_1E2F1AE20;
  v6[3] = &unk_1E2F1AE10;
  v5[4] = CFSTR("CIAttributeSliderMax");
  v5[5] = CFSTR("CIAttributeDefault");
  v6[4] = &unk_1E2F1AE20;
  v6[5] = &unk_1E2F1AE30;
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[5] = CFSTR("inputCenterStretchAmount");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeScalar");
  v4[1] = &unk_1E2F1AE10;
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeSliderMin");
  v4[2] = &unk_1E2F1AE20;
  v4[3] = &unk_1E2F1AE10;
  v3[4] = CFSTR("CIAttributeSliderMax");
  v3[5] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F1AE20;
  v4[5] = &unk_1E2F1AE30;
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
