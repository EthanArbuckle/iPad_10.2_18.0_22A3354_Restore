@implementation CIFusionTwoImagesDelta

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_fusionTwoImages);
}

- (id)outputImage
{
  CIImage *v3;
  id v4;
  float v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  CIVector *v27;
  CIVector *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CIImage *inputSecondaryImage;
  NSNumber *inputApertureScaling;
  uint64_t v39;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[7];

  v43[6] = *MEMORY[0x1E0C80C00];
  v3 = +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputImage && self->inputSecondaryImage)
  {
    v4 = -[CIFusionTwoImagesDelta kernel](self, "kernel");
    -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
    v6 = v5;
    -[CIVector Z](self->inputSubtractive, "Z");
    *(float *)&v6 = v7 * v6;
    -[CIVector X](self->inputSubtractive, "X");
    v9 = v8;
    -[CIVector Y](self->inputSubtractive, "Y");
    *(float *)&v10 = v10;
    v11 = *(float *)&v6 / (float)(*(float *)&v10 - v9);
    -[CIVector X](self->inputSubtractive, "X");
    v13 = v12;
    -[CIVector Y](self->inputSubtractive, "Y");
    *(float *)&v14 = v14;
    v15 = (float)((float)((float)-*(float *)&v6 / (float)(*(float *)&v14 - v13)) * v13) + 0.0;
    -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
    v17 = v16;
    -[CIVector Z](self->inputAdditive, "Z");
    *(float *)&v17 = v18 * v17;
    -[CIVector X](self->inputAdditive, "X");
    v20 = v19;
    -[CIVector Y](self->inputAdditive, "Y");
    *(float *)&v21 = v21;
    v22 = (float)(0.0 - *(float *)&v17) / (float)(*(float *)&v21 - v20);
    -[CIVector X](self->inputAdditive, "X");
    v24 = v23;
    -[CIVector Y](self->inputAdditive, "Y");
    *(float *)&v25 = v25;
    v26 = *(float *)&v17 + (float)((float)((float)-(float)(0.0 - *(float *)&v17) / (float)(*(float *)&v25 - v24)) * v24);
    v27 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v11, v15, *(float *)&v6);
    v28 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v22, v26, *(float *)&v17);
    -[CIImage extent](v3, "extent");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    inputSecondaryImage = self->inputSecondaryImage;
    v43[0] = self->inputImage;
    v43[1] = inputSecondaryImage;
    v43[2] = v28;
    v43[3] = v27;
    inputApertureScaling = self->inputApertureScaling;
    v43[4] = self->inputProtectStrength;
    v43[5] = inputApertureScaling;
    v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 6);
    v41[0] = CFSTR("kCIKernelOutputFormat");
    v41[1] = CFSTR("kCIImageAlphaOne");
    v42[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
    v42[1] = MEMORY[0x1E0C9AAB0];
    return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", v39, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2), v30, v32, v34, v36);
  }
  return v3;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputSecondaryImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputSecondaryImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputProtectStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputProtectStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CIVector)inputAdditive
{
  return (CIVector *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputAdditive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CIVector)inputSubtractive
{
  return (CIVector *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputSubtractive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)inputMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputMaxBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

@end
