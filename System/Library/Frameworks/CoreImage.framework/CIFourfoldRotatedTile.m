@implementation CIFourfoldRotatedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_fourfoldRotatedTile);
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
  float32x2_t v18;
  float32_t v19;
  float32x2_t v20;
  float32_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CIVector *v30;
  CIVector *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CIImage *inputImage;
  float v38;
  double v39;
  float v40;
  _QWORD v41[8];
  double v42[4];
  float64x2_t v43;
  double v44;
  double v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  if (!self->super.inputImage || !self->super.inputCenter)
    return 0;
  -[NSNumber doubleValue](self->super.inputWidth, "doubleValue");
  v39 = v3;
  -[NSNumber doubleValue](self->super.inputAngle, "doubleValue");
  v5 = v4;
  -[CIVector X](self->super.inputCenter, "X");
  v7 = v6;
  -[CIVector Y](self->super.inputCenter, "Y");
  v9 = v8;
  v11 = __sincos_stret(v5);
  v10.f64[0] = v11.__cosval;
  v10.f64[1] = v11.__sinval;
  v12 = vmulq_n_f64(v10, v39);
  v13 = -(v11.__sinval * v39);
  v43 = v12;
  v44 = v13;
  v45 = v12.f64[0];
  if (fabs(vmlad_n_f64(-(v12.f64[1] * v13), v12.f64[0], v12.f64[0])) < 0.01)
    return -[CITileFilter _croppedCenterPixelImage](self, "_croppedCenterPixelImage");
  *(float *)&v15 = v7;
  v16 = v9;
  v38 = *(float *)&v15;
  v40 = v16;
  *((float32_t *)&v15 + 1) = v16;
  v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v12.f64[0], 0);
  v17.f64[0] = v13;
  *(float32x2_t *)&v17.f64[0] = vadd_f32(*(float32x2_t *)&v15, vcvt_f32_f64(vaddq_f64(v12, vmulq_f64(v17, (float64x2_t)0))));
  v18.f32[0] = v13 + v12.f64[0] * 0.0;
  v19 = v12.f64[0] + v12.f64[1] * 0.0;
  v18.f32[1] = v19;
  v20.f32[0] = v12.f64[0] + v13;
  v21 = v12.f64[1] + v12.f64[0];
  v20.f32[1] = v21;
  roiForPoints(v15, v17.f64[0], COERCE_DOUBLE(vadd_f32(v18, *(float32x2_t *)&v15)), COERCE_DOUBLE(vadd_f32(v20, *(float32x2_t *)&v15)));
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  affine::inverse((affine *)&v43, v42);
  v30 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v42[0], v42[2], v42[1], v42[3]);
  v31 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v43.f64[0], v44, v43.f64[1], v45);
  v32 = -[CIFourfoldRotatedTile _kernel](self, "_kernel");
  v33 = *MEMORY[0x1E0C9D5E0];
  v34 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v35 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __36__CIFourfoldRotatedTile_outputImage__block_invoke;
  v41[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v41[4] = v23;
  v41[5] = v25;
  v41[6] = v27;
  v41[7] = v29;
  inputImage = self->super.inputImage;
  v46[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v38, v40);
  v46[1] = v30;
  v46[2] = v31;
  return (id)objc_msgSend(v32, "applyWithExtent:roiCallback:inputImage:arguments:", v41, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3), v33, v34, v35, v36);
}

double __36__CIFourfoldRotatedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
