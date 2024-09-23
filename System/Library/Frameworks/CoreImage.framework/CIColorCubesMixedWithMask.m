@implementation CIColorCubesMixedWithMask

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("CIAttributeFilterCategories");
  v12[0] = CFSTR("CICategoryColorEffect");
  v12[1] = CFSTR("CICategoryVideo");
  v12[2] = CFSTR("CICategoryInterlaced");
  v12[3] = CFSTR("CICategoryNonSquarePixels");
  v12[4] = CFSTR("CICategoryStillImage");
  v12[5] = CFSTR("CICategoryHighDynamicRange");
  v12[6] = CFSTR("CICategoryBuiltIn");
  v14[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 7);
  v14[1] = CFSTR("11");
  v13[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v13[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v14[2] = CFSTR("10.13");
  v13[3] = CFSTR("inputCubeDimension");
  v10[0] = CFSTR("CIAttributeMin");
  v10[1] = CFSTR("CIAttributeMax");
  v11[0] = &unk_1E2F1B4E8;
  v11[1] = &unk_1E2F1B500;
  v10[2] = CFSTR("CIAttributeDefault");
  v10[3] = CFSTR("CIAttributeIdentity");
  v11[2] = &unk_1E2F1B4E8;
  v11[3] = &unk_1E2F1B4E8;
  v10[4] = CFSTR("CIAttributeType");
  v11[4] = CFSTR("CIAttributeTypeCount");
  v14[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v13[4] = CFSTR("inputCube0Data");
  v8[0] = CFSTR("CIAttributeDefault");
  if (defaultCube(void)::onceToken != -1)
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  v8[1] = CFSTR("CIAttributeIdentity");
  v9[0] = defaultCube(void)::data;
  v9[1] = defaultCube(void)::data;
  v14[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v13[5] = CFSTR("inputCube1Data");
  v6[0] = CFSTR("CIAttributeDefault");
  if (defaultCube(void)::onceToken != -1)
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  v6[1] = CFSTR("CIAttributeIdentity");
  v7[0] = defaultCube(void)::data;
  v7[1] = defaultCube(void)::data;
  v14[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v13[6] = CFSTR("inputExtrapolate");
  v4[0] = CFSTR("CIAttributeDefault");
  v4[1] = CFSTR("CIAttributeMin");
  v5[0] = MEMORY[0x1E0C9AAA0];
  v5[1] = MEMORY[0x1E0C9AAA0];
  v4[2] = CFSTR("CIAttributeMax");
  v4[3] = CFSTR("CIAttributeType");
  v5[2] = MEMORY[0x1E0C9AAB0];
  v5[3] = CFSTR("CIAttributeTypeBoolean");
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v13[7] = CFSTR("inputColorSpace");
  v14[6] = v2;
  v14[7] = MEMORY[0x1E0C9AA70];
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
}

- (BOOL)_checkInputs
{
  int v3;
  int v4;
  uint64_t v5;

  v3 = -[NSNumber intValue](self->inputCubeDimension, "intValue");
  if ((v3 - 65) > 0xFFFFFFC0)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (4 * v4 * v4 * v4);
        if (-[NSData length](self->inputCube0Data, "length") == 4 * v5
          || -[NSData length](self->inputCube0Data, "length") == v5)
        {
          if (-[NSData length](self->inputCube1Data, "length") == 4 * v5
            || -[NSData length](self->inputCube1Data, "length") == v5)
          {
            return 1;
          }
          NSLog(CFSTR("CIColorCube inputCube1Data is not of the expected length."));
        }
        else
        {
          NSLog(CFSTR("CIColorCube inputCube0Data is not of the expected length."));
        }
      }
      else
      {
        NSLog(CFSTR("CIColorCube inputCube1Data must be of type NSData."));
      }
    }
    else
    {
      NSLog(CFSTR("CIColorCube inputCube0Data must be of type NSData."));
    }
  }
  else
  {
    NSLog(CFSTR("CIColorCube inputCubeDimension must be from 2 through %d."), 64);
  }
  return 0;
}

- (id)outputImage
{
  const __CFString *v3;
  CIFilter *v4;
  id inputColorSpace;
  uint64_t v6;
  CIImage *v7;
  CIImage *inputMaskImage;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !-[CIColorCubesMixedWithMask _checkInputs](self, "_checkInputs"))
    return 0;
  if (self->inputColorSpace)
    v3 = CFSTR("CIColorCubeWithColorSpace");
  else
    v3 = CFSTR("CIColorCube");
  v4 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", v3);
  -[CIFilter setValue:forKey:](v4, "setValue:forKey:", self->inputImage, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v4, "setValue:forKey:", self->inputCubeDimension, CFSTR("inputCubeDimension"));
  -[CIFilter setValue:forKey:](v4, "setValue:forKey:", self->inputExtrapolate, CFSTR("inputExtrapolate"));
  inputColorSpace = self->inputColorSpace;
  if (inputColorSpace)
    -[CIFilter setValue:forKey:](v4, "setValue:forKey:", inputColorSpace, CFSTR("inputColorSpace"));
  -[CIFilter setValue:forKey:](v4, "setValue:forKey:", self->inputCube0Data, CFSTR("inputCubeData"));
  v6 = -[CIFilter outputImage](v4, "outputImage");
  -[CIFilter setValue:forKey:](v4, "setValue:forKey:", self->inputCube1Data, CFSTR("inputCubeData"));
  v7 = -[CIFilter outputImage](v4, "outputImage");
  v10[0] = CFSTR("inputBackgroundImage");
  v10[1] = CFSTR("inputMaskImage");
  v11[0] = v6;
  inputMaskImage = self->inputMaskImage;
  if (!inputMaskImage)
    inputMaskImage = +[CIImage emptyImage](CIImage, "emptyImage");
  v11[1] = inputMaskImage;
  return -[CIImage imageByApplyingFilter:withInputParameters:](v7, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlendWithMask"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputMaskImage
{
  return self->inputMaskImage;
}

- (void)setInputMaskImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputCubeDimension
{
  return self->inputCubeDimension;
}

- (void)setInputCubeDimension:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSData)inputCube0Data
{
  return self->inputCube0Data;
}

- (void)setInputCube0Data:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)inputCube1Data
{
  return self->inputCube1Data;
}

- (void)setInputCube1Data:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)inputColorSpace
{
  return self->inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (void)setInputExtrapolate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

@end
