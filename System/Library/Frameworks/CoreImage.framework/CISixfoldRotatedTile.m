@implementation CISixfoldRotatedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_sixfoldRotatedTile);
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
  double v14;
  float v15;
  float v16;
  __float2 v17;
  float v18;
  double v19;
  float v20;
  __float2 v21;
  float v22;
  __float2 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CIVector *v32;
  CIVector *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CIImage *inputImage;
  float v40;
  float v41;
  float v42;
  double v43;
  _QWORD v44[8];
  double v45[4];
  double v46;
  double v47;
  double v48;
  double v49;
  _QWORD v50[4];

  v50[3] = *MEMORY[0x1E0C80C00];
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
  v46 = v4 * v11.__cosval;
  v47 = v4 * v11.__sinval;
  v48 = v4 * v12.__cosval;
  v49 = v4 * v12.__sinval;
  if (fabs(v4 * v11.__cosval * (v4 * v12.__sinval) - v4 * v11.__sinval * (v4 * v12.__cosval)) < 0.01)
    return -[CITileFilter _croppedCenterPixelImage](self, "_croppedCenterPixelImage");
  *(float *)&v14 = v8;
  v15 = v10;
  v40 = *(float *)&v14;
  v41 = v15;
  *((float *)&v14 + 1) = v15;
  v43 = v14;
  v16 = v6 + -0.523598776;
  v17 = __sincosf_stret(v16);
  v18 = v4;
  v42 = v18;
  v19 = COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v43, vmul_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v17.__sinval), LODWORD(v17.__cosval)), v18), (float32x2_t)0x3F0000003F000000)));
  v20 = v6 + 0.523598776;
  v21 = __sincosf_stret(v20);
  v22 = v6;
  v23 = __sincosf_stret(v22);
  roiForPoints(v43, v19, COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v43, vmul_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v21.__sinval), LODWORD(v21.__cosval)), v42), (float32x2_t)0x3F0000003F000000))), COERCE_DOUBLE(vadd_f32(vdiv_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v23.__sinval), LODWORD(v23.__cosval)), v42), (float32x2_t)vdup_n_s32(0x3FDDB3D7u)), *(float32x2_t *)&v43)));
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  affine::inverse((affine *)&v46, v45);
  v32 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v45[0], v45[2], v45[1], v45[3]);
  v33 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v46, v48, v47, v49);
  v34 = -[CISixfoldRotatedTile _kernel](self, "_kernel");
  v35 = *MEMORY[0x1E0C9D5E0];
  v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v37 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v38 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __35__CISixfoldRotatedTile_outputImage__block_invoke;
  v44[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v44[4] = v25;
  v44[5] = v27;
  v44[6] = v29;
  v44[7] = v31;
  inputImage = self->super.inputImage;
  v50[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v40, v41);
  v50[1] = v32;
  v50[2] = v33;
  return (id)objc_msgSend(v34, "applyWithExtent:roiCallback:inputImage:arguments:", v44, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3), v35, v36, v37, v38);
}

double __35__CISixfoldRotatedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
