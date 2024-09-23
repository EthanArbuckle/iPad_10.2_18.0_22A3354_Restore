@implementation CIColorPolynomial

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorPolynomial);
}

- (id)_kernelRGB
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorPolynomialRGB);
}

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
  _QWORD v11[7];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryInterlaced");
  v11[3] = CFSTR("CICategoryNonSquarePixels");
  v11[4] = CFSTR("CICategoryStillImage");
  v11[5] = CFSTR("CICategoryHighDynamicRange");
  v11[6] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v13[1] = CFSTR("7");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.9");
  v12[3] = CFSTR("inputRedCoefficients");
  v9[0] = CFSTR("CIAttributeDefault");
  v10[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v9[1] = CFSTR("CIAttributeIdentity");
  v10[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputGreenCoefficients");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeIdentity");
  v8[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v8[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v12[5] = CFSTR("inputBlueCoefficients");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeIdentity");
  v6[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v6[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputAlphaCoefficients");
  v3[1] = CFSTR("CIAttributeIdentity");
  v4[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v4[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (BOOL)_isIdentity
{
  CIVector *inputRedCoefficients;
  CIVector *inputGreenCoefficients;
  CIVector *inputBlueCoefficients;
  CIVector *inputAlphaCoefficients;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  inputRedCoefficients = self->inputRedCoefficients;
  inputGreenCoefficients = self->inputGreenCoefficients;
  inputBlueCoefficients = self->inputBlueCoefficients;
  inputAlphaCoefficients = self->inputAlphaCoefficients;
  -[CIVector X](inputRedCoefficients, "X");
  if (fabs(v6) >= 0.00001)
    return 0;
  -[CIVector X](inputGreenCoefficients, "X");
  if (fabs(v7) >= 0.00001)
    return 0;
  -[CIVector X](inputBlueCoefficients, "X");
  if (fabs(v8) >= 0.00001)
    return 0;
  -[CIVector X](inputAlphaCoefficients, "X");
  if (fabs(v9) >= 0.00001)
    return 0;
  -[CIVector Y](inputRedCoefficients, "Y");
  if (vabdd_f64(1.0, v10) >= 0.00001)
    return 0;
  -[CIVector Y](inputGreenCoefficients, "Y");
  if (vabdd_f64(1.0, v11) >= 0.00001)
    return 0;
  -[CIVector Y](inputBlueCoefficients, "Y");
  if (vabdd_f64(1.0, v12) >= 0.00001)
    return 0;
  -[CIVector Y](inputAlphaCoefficients, "Y");
  if (vabdd_f64(1.0, v13) >= 0.00001)
    return 0;
  -[CIVector Z](inputRedCoefficients, "Z");
  if (fabs(v14) >= 0.00001)
    return 0;
  -[CIVector Z](inputGreenCoefficients, "Z");
  if (fabs(v15) >= 0.00001)
    return 0;
  -[CIVector Z](inputBlueCoefficients, "Z");
  if (fabs(v16) >= 0.00001)
    return 0;
  -[CIVector Z](inputAlphaCoefficients, "Z");
  if (fabs(v17) >= 0.00001)
    return 0;
  -[CIVector W](inputRedCoefficients, "W");
  if (fabs(v18) >= 0.00001)
    return 0;
  -[CIVector W](inputGreenCoefficients, "W");
  if (fabs(v19) >= 0.00001)
    return 0;
  -[CIVector W](inputBlueCoefficients, "W");
  if (fabs(v20) >= 0.00001)
    return 0;
  -[CIVector W](inputAlphaCoefficients, "W");
  return fabs(v21) < 0.00001;
}

- (BOOL)_isIdentityAlpha
{
  CIVector *inputAlphaCoefficients;
  double v3;
  double v4;
  double v5;
  double v6;

  inputAlphaCoefficients = self->inputAlphaCoefficients;
  -[CIVector X](inputAlphaCoefficients, "X");
  if (fabs(v3) >= 0.00001)
    return 0;
  -[CIVector Y](inputAlphaCoefficients, "Y");
  if (vabdd_f64(1.0, v4) >= 0.00001)
    return 0;
  -[CIVector Z](inputAlphaCoefficients, "Z");
  if (fabs(v5) >= 0.00001)
    return 0;
  -[CIVector W](inputAlphaCoefficients, "W");
  return fabs(v6) < 0.00001;
}

- (id)outputImage
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIVector *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CIVector *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CIVector *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CIVector *v35;
  CIImage *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  _QWORD v47[6];

  v47[5] = *MEMORY[0x1E0C80C00];
  if (-[CIColorPolynomial _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[CIVector X](self->inputRedCoefficients, "X");
  v5 = v4;
  -[CIVector X](self->inputGreenCoefficients, "X");
  v7 = v6;
  -[CIVector X](self->inputBlueCoefficients, "X");
  v9 = v8;
  -[CIVector X](self->inputAlphaCoefficients, "X");
  v11 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v5, v7, v9, v10);
  -[CIVector Y](self->inputRedCoefficients, "Y");
  v13 = v12;
  -[CIVector Y](self->inputGreenCoefficients, "Y");
  v15 = v14;
  -[CIVector Y](self->inputBlueCoefficients, "Y");
  v17 = v16;
  -[CIVector Y](self->inputAlphaCoefficients, "Y");
  v19 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v13, v15, v17, v18);
  -[CIVector Z](self->inputRedCoefficients, "Z");
  v21 = v20;
  -[CIVector Z](self->inputGreenCoefficients, "Z");
  v23 = v22;
  -[CIVector Z](self->inputBlueCoefficients, "Z");
  v25 = v24;
  -[CIVector Z](self->inputAlphaCoefficients, "Z");
  v27 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v21, v23, v25, v26);
  -[CIVector W](self->inputRedCoefficients, "W");
  v29 = v28;
  -[CIVector W](self->inputGreenCoefficients, "W");
  v31 = v30;
  -[CIVector W](self->inputBlueCoefficients, "W");
  v33 = v32;
  -[CIVector W](self->inputAlphaCoefficients, "W");
  v35 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v29, v31, v33, v34);
  v36 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  -[CIVector X](self->inputAlphaCoefficients, "X");
  if (v37 == 0.0)
  {
    -[CIImage extent](self->inputImage, "extent");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
  }
  else
  {
    v39 = *MEMORY[0x1E0C9D5E0];
    v41 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v43 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v45 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  if (-[CIColorPolynomial _isIdentityAlpha](self, "_isIdentityAlpha"))
    v46 = -[CIColorPolynomial _kernelRGB](self, "_kernelRGB");
  else
    v46 = -[CIColorPolynomial _kernel](self, "_kernel");
  v47[0] = v36;
  v47[1] = v11;
  v47[2] = v19;
  v47[3] = v27;
  v47[4] = v35;
  return (id)objc_msgSend((id)objc_msgSend(v46, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 5), v39, v41, v43, v45), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputRedCoefficients
{
  return self->inputRedCoefficients;
}

- (void)setInputRedCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputGreenCoefficients
{
  return self->inputGreenCoefficients;
}

- (void)setInputGreenCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputBlueCoefficients
{
  return self->inputBlueCoefficients;
}

- (void)setInputBlueCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputAlphaCoefficients
{
  return self->inputAlphaCoefficients;
}

- (void)setInputAlphaCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
