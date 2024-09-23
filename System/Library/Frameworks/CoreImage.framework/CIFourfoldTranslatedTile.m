@implementation CIFourfoldTranslatedTile

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_fourfoldTranslatedTile);
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
  double v11;
  double v12;
  __double2 v13;
  __double2 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  float v21;
  float32x2_t v22;
  float32_t v23;
  float32x2_t v24;
  float32_t v25;
  float32x2_t v26;
  float32_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CIVector *v36;
  CIVector *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CIImage *inputImage;
  float v44;
  float v45;
  _QWORD v46[8];
  double v47[4];
  double v48;
  double v49;
  double v50;
  double v51;
  _QWORD v52[4];

  v52[3] = *MEMORY[0x1E0C80C00];
  if (!self->super.super.inputImage || !self->super.super.inputCenter)
    return 0;
  -[NSNumber doubleValue](self->super.super.inputWidth, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->super.super.inputAngle, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->super.inputAcuteAngle, "doubleValue");
  v8 = v7;
  -[CIVector X](self->super.super.inputCenter, "X");
  v10 = v9;
  -[CIVector Y](self->super.super.inputCenter, "Y");
  v12 = v11;
  v13 = __sincos_stret(v6);
  v14 = __sincos_stret(v6 + v8);
  v15 = v4 * v13.__cosval;
  v16 = v4 * v13.__sinval;
  v17 = v4 * v14.__cosval;
  v18 = v4 * v14.__sinval;
  v48 = v4 * v13.__cosval;
  v49 = v4 * v13.__sinval;
  v50 = v4 * v14.__cosval;
  v51 = v4 * v14.__sinval;
  if (fabs(v4 * v13.__cosval * (v4 * v14.__sinval) - v4 * v13.__sinval * (v4 * v14.__cosval)) < 0.01)
    return -[CITileFilter _croppedCenterPixelImage](self, "_croppedCenterPixelImage");
  *(float *)&v20 = v10;
  v21 = v12;
  v44 = *(float *)&v20;
  v45 = v21;
  *((float *)&v20 + 1) = v21;
  v22.f32[0] = v15 + v17 * 0.0;
  v23 = v16 + v18 * 0.0;
  v22.f32[1] = v23;
  v24.f32[0] = v17 + v15 * 0.0;
  v25 = v18 + v16 * 0.0;
  v24.f32[1] = v25;
  v26.f32[0] = v15 + v17;
  v27 = v16 + v18;
  v26.f32[1] = v27;
  roiForPoints(v20, COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v20, v22)), COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v20, v24)), COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v20, v26)));
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  affine::inverse((affine *)&v48, v47);
  v36 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v47[0], v47[2], v47[1], v47[3]);
  v37 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v48, v50, v49, v51);
  v38 = -[CIFourfoldTranslatedTile _kernel](self, "_kernel");
  v39 = *MEMORY[0x1E0C9D5E0];
  v40 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v41 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v42 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __39__CIFourfoldTranslatedTile_outputImage__block_invoke;
  v46[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v46[4] = v29;
  v46[5] = v31;
  v46[6] = v33;
  v46[7] = v35;
  inputImage = self->super.super.inputImage;
  v52[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v44, v45);
  v52[1] = v36;
  v52[2] = v37;
  return (id)objc_msgSend(v38, "applyWithExtent:roiCallback:inputImage:arguments:", v46, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3), v39, v40, v41, v42);
}

double __39__CIFourfoldTranslatedTile_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
