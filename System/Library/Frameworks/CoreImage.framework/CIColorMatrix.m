@implementation CIColorMatrix

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
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[7];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryColorAdjustment");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryInterlaced");
  v13[4] = CFSTR("CICategoryNonSquarePixels");
  v13[5] = CFSTR("CICategoryHighDynamicRange");
  v13[6] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v15[1] = CFSTR("5");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.4");
  v14[3] = CFSTR("inputRVector");
  v11[0] = CFSTR("CIAttributeDefault");
  v12[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
  v11[1] = CFSTR("CIAttributeIdentity");
  v12[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v14[4] = CFSTR("inputGVector");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeIdentity");
  v10[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v10[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 1.0, 0.0, 0.0);
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v14[5] = CFSTR("inputBVector");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeIdentity");
  v8[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0);
  v8[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 1.0, 0.0);
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v14[6] = CFSTR("inputAVector");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeIdentity");
  v6[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v6[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v14[7] = CFSTR("inputBiasVector");
  v3[1] = CFSTR("CIAttributeIdentity");
  v4[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v4[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  double v5;
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
  double v22;
  double v23;
  double v24;
  const double (*v25)[4];
  int is_identity;
  CIImage *v27;
  CI::Image *v28;
  CI::ColorMatrixImage *v29;
  double v31[21];
  CGRect v32;

  v31[20] = *(double *)MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsEmpty(v32))
    return self->inputImage;
  -[CIVector X](self->inputRVector, "X");
  v31[0] = v5;
  -[CIVector Y](self->inputRVector, "Y");
  v31[1] = v6;
  -[CIVector Z](self->inputRVector, "Z");
  v31[2] = v7;
  -[CIVector W](self->inputRVector, "W");
  v31[3] = v8;
  -[CIVector X](self->inputGVector, "X");
  v31[4] = v9;
  -[CIVector Y](self->inputGVector, "Y");
  v31[5] = v10;
  -[CIVector Z](self->inputGVector, "Z");
  v31[6] = v11;
  -[CIVector W](self->inputGVector, "W");
  v31[7] = v12;
  -[CIVector X](self->inputBVector, "X");
  v31[8] = v13;
  -[CIVector Y](self->inputBVector, "Y");
  v31[9] = v14;
  -[CIVector Z](self->inputBVector, "Z");
  v31[10] = v15;
  -[CIVector W](self->inputBVector, "W");
  v31[11] = v16;
  -[CIVector X](self->inputAVector, "X");
  v31[12] = v17;
  -[CIVector Y](self->inputAVector, "Y");
  v31[13] = v18;
  -[CIVector Z](self->inputAVector, "Z");
  v31[14] = v19;
  -[CIVector W](self->inputAVector, "W");
  v31[15] = v20;
  -[CIVector X](self->inputBiasVector, "X");
  v31[16] = v21;
  -[CIVector Y](self->inputBiasVector, "Y");
  v31[17] = v22;
  -[CIVector Z](self->inputBiasVector, "Z");
  v31[18] = v23;
  -[CIVector W](self->inputBiasVector, "W");
  v31[19] = v24;
  is_identity = CI::ColorMatrixImage::is_identity((CI::ColorMatrixImage *)v31, v25);
  v27 = self->inputImage;
  if (is_identity)
    return v27;
  v28 = -[CIImage _internalRepresentation](v27, "_internalRepresentation");
  v29 = (CI::ColorMatrixImage *)operator new();
  CI::ColorMatrixImage::ColorMatrixImage(v29, v28, (const double (*)[4])v31);
  v4 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v29);
  CI::Object::unref(v29);
  return v4;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputRVector
{
  return self->inputRVector;
}

- (void)setInputRVector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputGVector
{
  return self->inputGVector;
}

- (void)setInputGVector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputBVector
{
  return self->inputBVector;
}

- (void)setInputBVector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputAVector
{
  return self->inputAVector;
}

- (void)setInputAVector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CIVector)inputBiasVector
{
  return self->inputBiasVector;
}

- (void)setInputBiasVector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
