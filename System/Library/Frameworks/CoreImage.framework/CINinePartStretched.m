@implementation CINinePartStretched

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_ninePartStretched);
}

- (id)outputImage
{
  CIVector *inputGrowAmount;
  double v4;
  float64x2_t v5;
  float64_t v6;
  float32x2_t v7;
  double v8;
  double v9;
  CIVector *inputBreakpoint0;
  double v12;
  float64x2_t v13;
  float64_t v14;
  float32x2_t v15;
  CIVector *inputBreakpoint1;
  double v17;
  float64x2_t v18;
  float64_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  double v25;
  id v26;
  CIImage *inputImage;
  float32x2_t v28;
  double height;
  double y;
  double width;
  double x;
  float64_t v33;
  float64_t v34;
  float32x2_t v35;
  float64_t v36;
  float32x2_t v37;
  _QWORD v38[7];
  _QWORD v39[4];
  CGRect v40;

  v39[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputGrowAmount = self->inputGrowAmount;
  -[CIVector X](inputGrowAmount, "X");
  v36 = v4;
  -[CIVector Y](inputGrowAmount, "Y");
  v5.f64[0] = v36;
  v5.f64[1] = v6;
  v7 = vmaxnm_f32(vcvt_f32_f64(v5), 0);
  v8 = v7.f32[0];
  v9 = v7.f32[1];
  if (v7.f32[0] < 0.001 && v9 < 0.001)
    return self->inputImage;
  inputBreakpoint0 = self->inputBreakpoint0;
  v37 = v7;
  -[CIVector X](inputBreakpoint0, "X");
  v33 = v12;
  -[CIVector Y](inputBreakpoint0, "Y");
  v13.f64[0] = v33;
  v13.f64[1] = v14;
  v15 = vcvt_f32_f64(v13);
  inputBreakpoint1 = self->inputBreakpoint1;
  -[CIVector X](inputBreakpoint1, "X");
  v34 = v17;
  -[CIVector Y](inputBreakpoint1, "Y");
  v18.f64[0] = v34;
  v18.f64[1] = v19;
  v20 = vcvt_f32_f64(v18);
  v21 = vminnm_f32(v15, v20);
  v22 = vmaxnm_f32(v15, v20);
  v28 = v21;
  v35 = vdiv_f32(vsub_f32(v22, v21), vsub_f32(vadd_f32(v37, v22), v21));
  -[CIImage extent](self->inputImage, "extent");
  width = v40.size.width;
  x = v40.origin.x;
  height = v40.size.height;
  y = v40.origin.y;
  if (!CGRectIsInfinite(v40))
  {
    v23.f64[0] = x;
    v23.f64[1] = y;
    *(float32x2_t *)&v23.f64[0] = vcvt_f32_f64(v23);
    v24.f64[0] = width;
    v24.f64[1] = height;
    *(float32x2_t *)&v24.f64[0] = vadd_f32(vcvt_f32_f64(v24), *(float32x2_t *)&v23.f64[0]);
    *(float32x2_t *)&v23.f64[0] = vmaxnm_f32(vminnm_f32(vadd_f32(v28, vdiv_f32(vsub_f32(*(float32x2_t *)&v23.f64[0], v28), v35)), vadd_f32(v37, *(float32x2_t *)&v23.f64[0])), *(float32x2_t *)&v23.f64[0]);
    x = *(float *)v23.f64;
    v25 = *((float *)v23.f64 + 1);
    *(float32x2_t *)&v23.f64[0] = vsub_f32(vmaxnm_f32(vminnm_f32(vadd_f32(v28, vdiv_f32(vsub_f32(*(float32x2_t *)&v24.f64[0], v28), v35)), vadd_f32(v37, *(float32x2_t *)&v24.f64[0])), *(float32x2_t *)&v24.f64[0]), *(float32x2_t *)&v23.f64[0]);
    y = v25;
    width = *(float *)v23.f64;
    height = *((float *)v23.f64 + 1);
  }
  v26 = -[CINinePartStretched _kernel](self, "_kernel");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __34__CINinePartStretched_outputImage__block_invoke;
  v38[3] = &__block_descriptor_56_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v38[4] = v28;
  v38[5] = v37;
  inputImage = self->inputImage;
  v38[6] = v35;
  v39[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v28.f32[0], v28.f32[1]);
  v39[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v8, v9);
  v39[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v35.f32[0], v35.f32[1]);
  return (id)objc_msgSend(v26, "applyWithExtent:roiCallback:inputImage:arguments:", v38, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3), x, y, width, height);
}

BOOL __34__CINinePartStretched_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  return CGRectIsInfinite(*(CGRect *)&a1);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryDistortionEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("10");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.12");
  v10[3] = CFSTR("inputBreakpoint0");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypePosition");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 50.0, 50.0);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputBreakpoint1");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypePosition");
  v5[0] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v10[5] = CFSTR("inputGrowAmount");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = CFSTR("CIAttributeTypeOffset");
  v3[0] = CFSTR("CIAttributeType");
  v4[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 100.0, 100.0);
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
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

- (CIVector)inputBreakpoint0
{
  return self->inputBreakpoint0;
}

- (void)setInputBreakpoint0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputBreakpoint1
{
  return self->inputBreakpoint1;
}

- (void)setInputBreakpoint1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputGrowAmount
{
  return self->inputGrowAmount;
}

- (void)setInputGrowAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
