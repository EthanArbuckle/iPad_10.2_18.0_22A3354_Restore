@implementation CISimpleTile

+ (id)customAttributes
{
  _QWORD v3[5];
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryTileEffect");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v3[4] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_tile);
}

- (id)outputImage
{
  id result;
  double width;
  double height;
  _BOOL4 IsInfinite;
  CIImage *inputImage;
  uint64_t v8;
  CIVector *v9;
  CIVector *v10;
  float64x2_t v11;
  float32x2_t v12;
  double v13;
  float64x2_t v14;
  float64_t v15;
  double v16;
  float64x2_t v17;
  float64_t v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float64_t v24;
  float64_t v25;
  int32x2_t v26;
  float32x4_t v27;
  double x;
  double y;
  _QWORD v30[4];
  float32x4_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float32x2_t v36;
  _QWORD v37[3];
  CGRect v38;

  v37[2] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    objc_msgSend(result, "extent");
    width = v38.size.width;
    height = v38.size.height;
    x = v38.origin.x;
    y = v38.origin.y;
    IsInfinite = CGRectIsInfinite(v38);
    inputImage = self->inputImage;
    if (IsInfinite)
    {
      return inputImage;
    }
    else
    {
      v8 = -[CIImage imageByClampingToExtent](inputImage, "imageByClampingToExtent");
      v9 = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", x, y);
      v10 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", width, height, 1.0 / width, 1.0 / height);
      v11.f64[0] = x;
      v11.f64[1] = y;
      v12 = vcvt_f32_f64(v11);
      -[CIVector X](v10, "X");
      v25 = v13;
      -[CIVector Y](v10, "Y");
      v14.f64[0] = v25;
      v14.f64[1] = v15;
      v26 = (int32x2_t)vcvt_f32_f64(v14);
      -[CIVector Z](v10, "Z");
      v24 = v16;
      -[CIVector W](v10, "W");
      v17.f64[0] = v24;
      v17.f64[1] = v18;
      v27 = vcvt_hight_f32_f64(v26, v17);
      v19 = -[CISimpleTile _kernel](self, "_kernel");
      v20 = *MEMORY[0x1E0C9D5E0];
      v21 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v22 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v23 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __27__CISimpleTile_outputImage__block_invoke;
      v30[3] = &__block_descriptor_88_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v32 = x;
      v33 = y;
      v34 = width;
      v35 = height;
      v36 = v12;
      v31 = v27;
      v37[0] = v9;
      v37[1] = v10;
      return (id)objc_msgSend(v19, "applyWithExtent:roiCallback:inputImage:arguments:", v30, v8, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2), v20, v21, v22, v23);
    }
  }
  return result;
}

double __27__CISimpleTile_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  float32x2_t v7;
  CGFloat y;
  float32x2_t v9;
  float32_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float v13;
  float v14;
  int8x16_t v16;
  CGRect v17;

  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(float32x2_t *)(a1 + 80);
  v16 = *(int8x16_t *)(a1 + 32);
  v17 = CGRectStandardize(*(CGRect *)&a2);
  v17.size.width = v17.origin.x + v17.size.width;
  y = v17.origin.y;
  *(float32x2_t *)&v17.origin.x = vcvt_f32_f64((float64x2_t)v17.origin);
  v9.f32[0] = v5;
  v10 = v6;
  v9.f32[1] = v10;
  v11 = (float32x2_t)vextq_s8(v16, v16, 8uLL).u64[0];
  v12 = vrndm_f32(vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.origin.x, v9)));
  *(float *)&v17.size.width = v17.size.width;
  *(float *)&v17.origin.y = v17.origin.y + v17.size.height;
  HIDWORD(v17.size.width) = LODWORD(v17.origin.y);
  *(float32x2_t *)&v17.size.height = vrndm_f32(vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.size.width, v9)));
  *(float32x2_t *)&v17.origin.x = vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.origin.x, v7));
  *(int32x2_t *)&v17.origin.y = vdup_n_s32(0x3F7FFFFFu);
  LODWORD(v13) = vadd_f32(vadd_f32(v7, vmul_f32(*(float32x2_t *)v16.i8, vminnm_f32(vsub_f32(*(float32x2_t *)&v17.origin.x, vrndm_f32(*(float32x2_t *)&v17.origin.x)), *(float32x2_t *)&v17.origin.y))), (float32x2_t)0x3F0000003F000000).u32[0];
  *(float32x2_t *)&v17.size.width = vmul_f32(v11, vsub_f32(*(float32x2_t *)&v17.size.width, v7));
  LODWORD(v14) = vadd_f32(vadd_f32(v7, vmul_f32(*(float32x2_t *)v16.i8, vminnm_f32(vsub_f32(*(float32x2_t *)&v17.size.width, vrndm_f32(*(float32x2_t *)&v17.size.width)), *(float32x2_t *)&v17.origin.y))), (float32x2_t)0x3F0000003F000000).u32[0];
  if ((vceq_f32(v12, *(float32x2_t *)&v17.size.height).u8[0] & 1) != 0)
    return fminf(v13, v14);
  return v5;
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
