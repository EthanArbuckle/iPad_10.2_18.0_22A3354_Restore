@implementation CIMorphologyGradient

- (id)outputImage
{
  id result;
  float v4;
  float v5;
  CIFilter *v6;
  double v7;
  CIImage *v8;
  double v9;
  CIImage *v10;
  CIColorKernel *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CIImage *v24;
  _QWORD v25[3];
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v25[2] = *MEMORY[0x1E0C80C00];
  result = self->super.inputImage;
  if (result)
  {
    objc_msgSend(result, "extent");
    if (CGRectIsEmpty(v26))
    {
      return 0;
    }
    else
    {
      -[NSNumber floatValue](self->super.inputRadius, "floatValue");
      v5 = fmaxf(v4, 0.0);
      v6 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICheapMorphology"));
      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", self->super.inputImage, CFSTR("inputImage"));
      *(float *)&v7 = v5;
      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("inputRadius"));
      v8 = -[CIFilter outputImage](v6, "outputImage");
      *(float *)&v9 = -v5;
      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9), CFSTR("inputRadius"));
      v10 = -[CIFilter outputImage](v6, "outputImage");
      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", 0, CFSTR("inputImage"));
      v11 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gradient);
      -[CIImage extent](v10, "extent");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[CIImage extent](v8, "extent");
      v29.origin.x = v20;
      v29.origin.y = v21;
      v29.size.width = v22;
      v29.size.height = v23;
      v27.origin.x = v13;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      v28 = CGRectUnion(v27, v29);
      v25[0] = v10;
      v25[1] = v8;
      v24 = -[CIColorKernel applyWithExtent:arguments:](v11, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2), v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
      -[CIImage extent](self->super.inputImage, "extent");
      return -[CIImage imageByCroppingToRect:](v24, "imageByCroppingToRect:");
    }
  }
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("11");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.13");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F1A440;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F1A440;
  v4[3] = &unk_1E2F1A420;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1A430;
  v4[5] = &unk_1E2F1A440;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

@end
