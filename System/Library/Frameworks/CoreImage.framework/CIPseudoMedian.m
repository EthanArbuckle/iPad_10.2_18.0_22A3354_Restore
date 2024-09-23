@implementation CIPseudoMedian

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  float v6;
  float v7;
  float v8;
  float v9;
  CIFilter *v10;
  double v11;
  uint64_t v12;
  double v13;
  CIImage *v14;
  double v15;
  CIColorKernel *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CIImage *v29;
  _QWORD v30[4];
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v30[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsEmpty(v31))
    return 0;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v7 = v6;
  -[NSNumber floatValue](self->inputWeights, "floatValue");
  if (v7 > 0.0)
  {
    v9 = v8;
    v10 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICheapMorphology"));
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", self->inputImage, CFSTR("inputImage"));
    *(float *)&v11 = v7 + -1.0;
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11), CFSTR("inputRadius"));
    v12 = -[CIFilter outputImage](v10, "outputImage");
    *(float *)&v13 = -(float)(v7 + -1.0);
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13), CFSTR("inputRadius"));
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", -[CIFilter outputImage](v10, "outputImage"), CFSTR("inputImage"));
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", self->inputRadius, CFSTR("inputRadius"));
    v14 = -[CIFilter outputImage](v10, "outputImage");
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", v12, CFSTR("inputImage"));
    *(float *)&v15 = -v7;
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15), CFSTR("inputRadius"));
    v4 = -[CIFilter outputImage](v10, "outputImage");
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", 0, CFSTR("inputImage"));
    if (v9 != 0.0)
    {
      if (v9 == 1.0)
      {
        return v14;
      }
      else
      {
        v16 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_average);
        -[CIImage extent](v4, "extent");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[CIImage extent](v14, "extent");
        v34.origin.x = v25;
        v34.origin.y = v26;
        v34.size.width = v27;
        v34.size.height = v28;
        v32.origin.x = v18;
        v32.origin.y = v20;
        v32.size.width = v22;
        v32.size.height = v24;
        v33 = CGRectUnion(v32, v34);
        v30[0] = v4;
        v30[1] = v14;
        v30[2] = self->inputWeights;
        v29 = -[CIColorKernel applyWithExtent:arguments:](v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3), v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
        -[CIImage extent](self->inputImage, "extent");
        return -[CIImage imageByCroppingToRect:](v29, "imageByCroppingToRect:");
      }
    }
    return v4;
  }
  return self->inputImage;
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryBlur");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v7[4] = CFSTR("CICategoryApplePrivate");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v9[1] = CFSTR("10");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.11");
  v8[3] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeDistance");
  v6[1] = &unk_1E2F1A440;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F1A440;
  v6[3] = &unk_1E2F1A420;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F1A430;
  v6[5] = &unk_1E2F1A440;
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputWeights");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F1A440;
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A450;
  v4[3] = &unk_1E2F1A460;
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputWeights
{
  return self->inputWeights;
}

- (void)setInputWeights:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
