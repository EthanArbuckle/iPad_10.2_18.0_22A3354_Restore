@implementation CIHueAdjust

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[7];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryInterlaced");
  v5[4] = CFSTR("CICategoryNonSquarePixels");
  v5[5] = CFSTR("CICategoryHighDynamicRange");
  v5[6] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v7[1] = CFSTR("5");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputAngle");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F19050;
  v4[1] = &unk_1E2F19060;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F18FF0;
  v4[3] = &unk_1E2F18FF0;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeAngle");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)outputImage
{
  float v3;
  __float2 v5;
  double v6;
  float v7;
  double v8;

  -[NSNumber floatValue](self->inputAngle, "floatValue");
  if (fabsf(v3) < 0.001)
    return self->inputImage;
  v5 = __sincosf_stret(v3);
  *(float *)&v6 = (float)((float)(v5.__cosval * 0.7875) + 0.2125) + (float)(v5.__sinval * -0.2125);
  v7 = (float)(v5.__cosval * -0.7154) + 0.7154;
  *(float *)&v8 = v7 + (float)(v5.__sinval * -0.7154);
  return _imageByApplyingColorMatrix(self->inputImage, *(float *)&v6, *(float *)&v8, (float)((float)(v5.__cosval * -0.0721) + 0.0721) + (float)(v5.__sinval * 0.9279), (float)((float)(v5.__cosval * -0.2125) + 0.2125) + (float)(v5.__sinval * 0.1404), (float)((float)(v5.__cosval * 0.2846) + 0.7154) + (float)(v5.__sinval * 0.1404), (float)((float)(v5.__cosval * -0.0721) + 0.0721) + (float)(v5.__sinval * -0.2846), v6, v8, (float)((float)(v5.__cosval * -0.2125) + 0.2125) + (float)(v5.__sinval * -0.7875), v7 + (float)(v5.__sinval * 0.7154), (float)((float)(v5.__cosval * 0.9279) + 0.0721) + (float)(v5.__sinval * 0.0721), 0.0, 0.0, 0.0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
