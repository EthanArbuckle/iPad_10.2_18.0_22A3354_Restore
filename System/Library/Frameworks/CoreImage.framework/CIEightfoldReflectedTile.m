@implementation CIEightfoldReflectedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_eightfoldReflectedTile);
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
  double v13;
  float v14;
  float v15;
  __float2 v16;
  float v17;
  double v18;
  float v19;
  __float2 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CIVector *v29;
  CIVector *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CIImage *inputImage;
  float v37;
  float v38;
  float v39;
  double v40;
  _QWORD v41[8];
  double v42[4];
  double v43;
  double v44;
  double v45;
  double v46;
  _QWORD v47[4];

  v47[3] = *MEMORY[0x1E0C80C00];
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
  v11 = __sincos_stret(v6);
  v43 = v4 * v11.__cosval;
  v44 = v4 * v11.__sinval;
  v45 = -(v11.__sinval * v4);
  v46 = v4 * v11.__cosval;
  if (fabs(v43 * v43 - v4 * v11.__sinval * v45) < 0.01)
    return -[CITileFilter _croppedCenterPixelImage](self, "_croppedCenterPixelImage");
  *(float *)&v13 = v8;
  v14 = v10;
  v37 = *(float *)&v13;
  v38 = v14;
  *((float *)&v13 + 1) = v14;
  v40 = v13;
  v15 = v6;
  v16 = __sincosf_stret(v15);
  v17 = v4;
  v39 = v17;
  v18 = COERCE_DOUBLE(vadd_f32(vmul_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v16.__sinval), LODWORD(v16.__cosval)), v17), (float32x2_t)0x3F0000003F000000), *(float32x2_t *)&v40));
  v19 = v6 + 0.785398163;
  v20 = __sincosf_stret(v19);
  roiForPoints(v40, v18, COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v40, vdiv_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v20.__sinval), LODWORD(v20.__cosval)), v39), (float32x2_t)vdup_n_s32(0x3FB504F3u)))));
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  affine::inverse((affine *)&v43, v42);
  v29 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v42[0], v42[2], v42[1], v42[3]);
  v30 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v43, v45, v44, v46);
  v31 = -[CIEightfoldReflectedTile _kernel](self, "_kernel");
  v32 = *MEMORY[0x1E0C9D5E0];
  v33 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v34 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v35 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __39__CIEightfoldReflectedTile_outputImage__block_invoke;
  v41[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v41[4] = v22;
  v41[5] = v24;
  v41[6] = v26;
  v41[7] = v28;
  inputImage = self->super.inputImage;
  v47[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v37, v38);
  v47[1] = v29;
  v47[2] = v30;
  return (id)objc_msgSend(v31, "applyWithExtent:roiCallback:inputImage:arguments:", v41, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3), v32, v33, v34, v35);
}

double __39__CIEightfoldReflectedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
