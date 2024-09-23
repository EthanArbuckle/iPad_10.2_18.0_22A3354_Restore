@implementation CIPerspectiveTile

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryTileEffect");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputBottomLeft");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 155.0, 153.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputBottomRight");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 548.0, 140.0);
  v8[1] = CFSTR("CIAttributeTypePosition");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v12[5] = CFSTR("inputTopRight");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 646.0, 507.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputTopLeft");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 118.0, 484.0);
  v4[1] = CFSTR("CIAttributeTypePosition");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_perspectiveMask);
}

- (id)outputImage
{
  id result;
  id v4;
  CIVector *v5;
  CIVector *inputTopLeft;
  CIVector *inputTopRight;
  CIVector *inputBottomRight;
  CIVector *inputBottomLeft;
  uint64_t v10;
  double v11;
  float64x2_t v12;
  float64_t v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64_t v17;
  float32x2_t v18;
  double v19;
  float64x2_t v20;
  float64_t v21;
  float32x2_t v22;
  double v23;
  float64x2_t v24;
  float64_t v25;
  CIVector *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float64_t v32;
  float64_t v33;
  float64_t v34;
  float64_t v35;
  _QWORD v36[2];
  double v37[9];
  double v38[11];
  CGRect v39;

  v38[9] = *(double *)MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    objc_msgSend(result, "extent");
    if (CGRectIsInfinite(v39))
    {
      return 0;
    }
    else
    {
      v4 = -[CIImage filteredImage:keysAndValues:](self->inputImage, "filteredImage:keysAndValues:", CFSTR("CISimpleTile"), 0);
      -[CIImage extent](self->inputImage, "extent");
      v5 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
      inputTopLeft = self->inputTopLeft;
      if (!inputTopLeft)
        inputTopLeft = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
      inputTopRight = self->inputTopRight;
      if (!inputTopRight)
        inputTopRight = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
      inputBottomRight = self->inputBottomRight;
      if (!inputBottomRight)
        inputBottomRight = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
      inputBottomLeft = self->inputBottomLeft;
      if (!inputBottomLeft)
        inputBottomLeft = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
      v10 = objc_msgSend(v4, "filteredImage:keysAndValues:", CFSTR("CIPerspectiveTransformWithExtent"), CFSTR("inputExtent"), v5, CFSTR("inputTopLeft"), inputTopLeft, CFSTR("inputTopRight"), inputTopRight, CFSTR("inputBottomRight"), inputBottomRight, CFSTR("inputBottomLeft"), inputBottomLeft, 0);
      -[CIVector X](self->inputBottomLeft, "X");
      v32 = v11;
      -[CIVector Y](self->inputBottomLeft, "Y");
      v12.f64[0] = v32;
      v12.f64[1] = v13;
      v14 = COERCE_DOUBLE(vcvt_f32_f64(v12));
      -[CIVector X](self->inputBottomRight, "X");
      v33 = v15;
      -[CIVector Y](self->inputBottomRight, "Y");
      v16.f64[0] = v33;
      v16.f64[1] = v17;
      v18 = vcvt_f32_f64(v16);
      -[CIVector X](self->inputTopLeft, "X");
      v34 = v19;
      -[CIVector Y](self->inputTopLeft, "Y");
      v20.f64[0] = v34;
      v20.f64[1] = v21;
      v22 = vcvt_f32_f64(v20);
      -[CIVector X](self->inputTopRight, "X");
      v35 = v23;
      -[CIVector Y](self->inputTopRight, "Y");
      v24.f64[0] = v35;
      v24.f64[1] = v25;
      computeHomogeneousPerspectiveTransformAndInverse(v37, (uint64_t)v38, v14, v18, vcvt_f32_f64(v24), v22);
      v26 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v37[2], v37[5], v37[8]);
      v27 = -[CIPerspectiveTile _kernel](self, "_kernel");
      v28 = *MEMORY[0x1E0C9D5E0];
      v29 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v30 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v31 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
      v36[0] = v10;
      v36[1] = v26;
      return (id)objc_msgSend(v27, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2), v28, v29, v30, v31);
    }
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputTopLeft
{
  return self->inputTopLeft;
}

- (void)setInputTopLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputTopRight
{
  return self->inputTopRight;
}

- (void)setInputTopRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputBottomRight
{
  return self->inputBottomRight;
}

- (void)setInputBottomRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputBottomLeft
{
  return self->inputBottomLeft;
}

- (void)setInputBottomLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
