@implementation CIFusionDelta

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_fusionDelta);
}

+ (id)customAttributes
{
  _QWORD v3[3];
  _QWORD v4[3];
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("inputApertureScaling");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = CFSTR("CIAttributeTypeScalar");
  v4[1] = &unk_1E2F19C50;
  v3[2] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F19C50;
  v6[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  BOOL result;

  -[CIVector Z](self->inputAddBlur, "Z");
  result = 0;
  if (v3 == 0.0)
  {
    -[CIVector Z](self->inputRemoveBlur, "Z");
    if (v4 == 0.0)
      return 1;
  }
  return result;
}

- (id)outputImage
{
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  double v22;
  float v23;
  CIVector *v24;
  CIVector *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSNumber *inputApertureScaling;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CIFusionDelta _isIdentity](self, "_isIdentity"))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIVector Z](self->inputRemoveBlur, "Z");
  v5 = v4;
  -[CIVector X](self->inputRemoveBlur, "X");
  v7 = v6;
  -[CIVector Y](self->inputRemoveBlur, "Y");
  *(float *)&v8 = v8;
  v9 = 1.0 / (float)(*(float *)&v8 - v7);
  -[CIVector X](self->inputRemoveBlur, "X");
  v11 = v10;
  -[CIVector Y](self->inputRemoveBlur, "Y");
  *(float *)&v12 = v12;
  v13 = (float)((float)(-1.0 / (float)(*(float *)&v12 - v11)) * v11) + 0.0;
  -[CIVector Z](self->inputAddBlur, "Z");
  v15 = v14;
  -[CIVector X](self->inputAddBlur, "X");
  v17 = v16;
  -[CIVector Y](self->inputAddBlur, "Y");
  *(float *)&v18 = v18;
  v19 = -1.0 / (float)(*(float *)&v18 - v17);
  -[CIVector X](self->inputAddBlur, "X");
  v21 = v20;
  -[CIVector Y](self->inputAddBlur, "Y");
  *(float *)&v22 = v22;
  v23 = (float)((float)(1.0 / (float)(*(float *)&v22 - v21)) * v21) + 1.0;
  v24 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v9, v13, v5);
  v25 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v19, v23, v15);
  v26 = -[CIFusionDelta kernel](self, "kernel");
  -[CIImage extent](self->inputImage, "extent");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v39[0] = self->inputImage;
  v39[1] = v25;
  inputApertureScaling = self->inputApertureScaling;
  v39[2] = v24;
  v39[3] = inputApertureScaling;
  v36 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v37[0] = CFSTR("kCIKernelOutputFormat");
  v37[1] = CFSTR("kCIImageAlphaOne");
  v38[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v38[1] = MEMORY[0x1E0C9AAB0];
  return (id)objc_msgSend(v26, "applyWithExtent:arguments:options:", v36, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2), v28, v30, v32, v34);
}

@end
