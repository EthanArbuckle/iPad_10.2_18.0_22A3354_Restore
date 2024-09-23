@implementation CISixfoldReflectedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_sixfoldReflectedTile);
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
  __double2 v11;
  __double2 v12;
  float32x2_t v14;
  float v15;
  float v16;
  __float2 v17;
  float v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32_t v22;
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
  float v40;
  float32x2_t v41;
  _QWORD v42[8];
  double v43[4];
  double v44;
  double v45;
  double v46;
  double v47;
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  if (!self->super.inputImage || !self->super.inputCenter)
    return 0;
  -[NSNumber doubleValue](self->super.inputWidth, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->super.inputAngle, "doubleValue");
  v6 = v5;
  -[CIVector X](self->super.inputCenter, "X");
  v8 = v7;
  -[CIVector Y](self->super.inputCenter, "Y");
  v10 = v9;
  v11 = __sincos_stret(v6 + -0.523598776);
  v12 = __sincos_stret(v6 + 0.523598776);
  v44 = v4 * v11.__cosval;
  v45 = v4 * v11.__sinval;
  v46 = v4 * v12.__cosval;
  v47 = v4 * v12.__sinval;
  if (fabs(v4 * v11.__cosval * (v4 * v12.__sinval) - v4 * v11.__sinval * (v4 * v12.__cosval)) < 0.01)
    return -[CITileFilter _croppedCenterPixelImage](self, "_croppedCenterPixelImage");
  v14.f32[0] = v8;
  v15 = v10;
  v39 = v14.f32[0];
  v40 = v15;
  v14.f32[1] = v15;
  v41 = v14;
  v16 = v6;
  v17 = __sincosf_stret(v16);
  v18 = v4;
  v19 = vdiv_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v17.__sinval), LODWORD(v17.__cosval)), v18), (float32x2_t)vdup_n_s32(0x3FDDB3D7u));
  v20 = vadd_f32(v19, v41);
  v21.f32[0] = v4 * v12.__cosval + v4 * v11.__cosval * 0.0;
  v22 = v4 * v12.__sinval + v4 * v11.__sinval * 0.0;
  v21.f32[1] = v22;
  roiForPoints(*(double *)&v20, COERCE_DOUBLE(vadd_f32(v19, v20)), COERCE_DOUBLE(vadd_f32(v41, v21)));
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  affine::inverse((affine *)&v44, v43);
  v31 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v43[0], v43[2], v43[1], v43[3]);
  v32 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v44, v46, v45, v47);
  v33 = -[CISixfoldReflectedTile _kernel](self, "_kernel");
  v34 = *MEMORY[0x1E0C9D5E0];
  v35 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v37 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __37__CISixfoldReflectedTile_outputImage__block_invoke;
  v42[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v42[4] = v24;
  v42[5] = v26;
  v42[6] = v28;
  v42[7] = v30;
  inputImage = self->super.inputImage;
  v48[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v39, v40);
  v48[1] = v31;
  v48[2] = v32;
  return (id)objc_msgSend(v33, "applyWithExtent:roiCallback:inputImage:arguments:", v42, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3), v34, v35, v36, v37);
}

double __37__CISixfoldReflectedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
