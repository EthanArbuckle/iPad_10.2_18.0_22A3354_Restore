@implementation CIVibrance

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryHighDynamicRange");
  v5[4] = CFSTR("CICategoryInterlaced");
  v5[5] = CFSTR("CICategoryNonSquarePixels");
  v5[6] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v7[1] = CFSTR("5");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.7");
  v6[3] = CFSTR("inputAmount");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1B150;
  v4[1] = &unk_1E2F1B160;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1B150;
  v4[3] = &unk_1E2F1B160;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1B170;
  v4[5] = &unk_1E2F1B170;
  v3[6] = CFSTR("CIAttributeType");
  v4[6] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputAmount, "doubleValue");
  return fabs(v2) <= 0.001;
}

- (id)_kernelNeg
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_vibrance_neg);
}

- (id)_kernelPos
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_vibrance_pos);
}

- (id)outputImage
{
  double v3;
  double v4;
  CIImage *inputImage;
  CIImage *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSNumber *inputAmount;
  _QWORD *v17;
  CIVector *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputAmount, "doubleValue");
  v4 = fmin(fmax(v3, -1.0), 1.0);
  inputImage = self->inputImage;
  if (fabs(v4) <= 0.001)
    return inputImage;
  v6 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  if (v4 >= 0.0)
  {
    v7 = -[CIVibrance _kernelPos](self, "_kernelPos");
    v19 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v4 * 3.0, v4 * -1.5 + v4 * -4.5 * v4, v4 * -0.5 + v4 * (v4 * 4.5) * v4, v4 * (v4 * 4.5) + v4 * (v4 * -4.5) * v4 - v4);
    -[CIImage extent](v6, "extent");
    v9 = v20;
    v11 = v21;
    v13 = v22;
    v15 = v23;
    v24[0] = v6;
    v24[1] = v19;
    v17 = v24;
  }
  else
  {
    v7 = -[CIVibrance _kernelNeg](self, "_kernelNeg");
    -[CIImage extent](v6, "extent");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    inputAmount = self->inputAmount;
    v25[0] = v6;
    v25[1] = inputAmount;
    v17 = v25;
  }
  return (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2), v9, v11, v13, v15), "imageByPremultiplyingAlpha");
}

- (id)_outputProperties
{
  double v2;
  double v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputAmount, "doubleValue");
  v3 = fmin(fmax(v2, -1.0), 1.0);
  if (fabs(v3) <= 0.001)
    return 0;
  v5[0] = metadataPropertyWithBool();
  v5[1] = metadataPropertyWithDouble(v3 * 50.0);
  v5[2] = metadataPropertyWithDouble(v3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
}

- (id)_initFromProperties:(id)a3
{
  double v5;

  v5 = 0.0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("Vibrance"), &v5))
  {
    -[CIVibrance setInputAmount:](self, "setInputAmount:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5));
  }
  else
  {

    return 0;
  }
  return self;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
