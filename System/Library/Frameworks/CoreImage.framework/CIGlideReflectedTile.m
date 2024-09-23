@implementation CIGlideReflectedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_glideReflectedTile);
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
  float64x2_t v10;
  __double2 v11;
  float64x2_t v12;
  double v13;
  double v15;
  float32_t v16;
  float64x2_t v17;
  double v18;
  float32x2_t v19;
  float64_t v20;
  float32_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CIVector *v31;
  CIVector *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CIImage *inputImage;
  float v39;
  double v40;
  float v41;
  _QWORD v42[8];
  double v43[4];
  float64x2_t v44;
  double v45;
  double v46;
  _QWORD v47[4];

  v47[3] = *MEMORY[0x1E0C80C00];
  if (!self->super.inputImage || !self->super.inputCenter)
    return 0;
  -[NSNumber doubleValue](self->super.inputWidth, "doubleValue");
  v40 = v3;
  -[NSNumber doubleValue](self->super.inputAngle, "doubleValue");
  v5 = v4;
  -[CIVector X](self->super.inputCenter, "X");
  v7 = v6;
  -[CIVector Y](self->super.inputCenter, "Y");
  v9 = v8;
  v11 = __sincos_stret(v5);
  v10.f64[0] = v11.__cosval;
  v10.f64[1] = v11.__sinval;
  v12 = vmulq_n_f64(v10, v40);
  v13 = -(v11.__sinval * v40);
  v44 = v12;
  v45 = v13;
  v46 = v12.f64[0];
  if (fabs(vmlad_n_f64(-(v12.f64[1] * v13), v12.f64[0], v12.f64[0])) < 0.01)
    return -[CITileFilter _croppedCenterPixelImage](self, "_croppedCenterPixelImage");
  *(float *)&v15 = v7;
  v16 = v9;
  v39 = *(float *)&v15;
  v41 = v16;
  *((float32_t *)&v15 + 1) = v16;
  v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v12.f64[0], 0);
  v17.f64[0] = v13;
  *(float32x2_t *)&v17.f64[0] = vadd_f32(*(float32x2_t *)&v15, vcvt_f32_f64(vaddq_f64(v12, vmulq_f64(v17, (float64x2_t)0))));
  v18 = v13 + v13;
  v19.f32[0] = v13 + v13 + v12.f64[0] * 0.0;
  v20 = v12.f64[0] + v12.f64[0];
  v21 = v12.f64[0] + v12.f64[0] + v12.f64[1] * 0.0;
  v19.f32[1] = v21;
  *(float *)v12.f64 = v12.f64[0] + v18;
  v22 = v12.f64[1] + v20;
  *((float *)v12.f64 + 1) = v22;
  roiForPoints(v15, v17.f64[0], COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v15, v19)), COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v15, *(float32x2_t *)&v12.f64[0])));
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  affine::inverse((affine *)&v44, v43);
  v31 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v43[0], v43[2], v43[1], v43[3]);
  v32 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v44.f64[0], v45, v44.f64[1], v46);
  v33 = -[CIGlideReflectedTile _kernel](self, "_kernel");
  v34 = *MEMORY[0x1E0C9D5E0];
  v35 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v37 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __35__CIGlideReflectedTile_outputImage__block_invoke;
  v42[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v42[4] = v24;
  v42[5] = v26;
  v42[6] = v28;
  v42[7] = v30;
  inputImage = self->super.inputImage;
  v47[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v39, v41);
  v47[1] = v31;
  v47[2] = v32;
  return (id)objc_msgSend(v33, "applyWithExtent:roiCallback:inputImage:arguments:", v42, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3), v34, v35, v36, v37);
}

double __35__CIGlideReflectedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
