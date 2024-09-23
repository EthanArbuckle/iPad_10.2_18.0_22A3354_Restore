@implementation CIImageWriter

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[3];
  const __CFString *v6;
  const __CFString *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("inputFilename");
  v6 = CFSTR("CIAttributeDefault");
  v7 = &stru_1E2ECD1B0;
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v8[1] = CFSTR("inputShouldDumpInputValues");
  v9[0] = v2;
  v4[0] = CFSTR("CIAttributeType");
  v4[1] = CFSTR("CIAttributeDefault");
  v5[0] = CFSTR("CIAttributeTypeBoolean");
  v5[1] = &unk_1E2F1BA28;
  v4[2] = CFSTR("CIAttributeIdentity");
  v5[2] = &unk_1E2F1BA28;
  v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
}

- (id)outputImage
{
  CIImage *inputImage;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  NSString *inputFilename;
  id v14;
  uint64_t v16;
  const __CFString *v17;
  NSString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (self->inputFilename)
  {
    if (inputImage)
    {
      if (objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:"))
      {
        v16 = 0;
        -[CIImage extent](self->inputImage, "extent");
        v5 = v4;
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v19[0] = self->inputImage;
        v12 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        inputFilename = self->inputFilename;
        v17 = CFSTR("filename");
        v18 = inputFilename;
        inputImage = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIFileSaverProcessor, "applyWithExtent:inputs:arguments:error:", v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1), &v16, v5, v7, v9, v11);
        if (self->inputOriginalFilter)
        {
          if (-[NSNumber BOOLValue](-[CIImageWriter inputShouldDumpInputValues](self, "inputShouldDumpInputValues"), "BOOLValue"))
          {
            v14 = -[CIFilter description](self->inputOriginalFilter, "description");
            objc_msgSend(v14, "writeToURL:atomically:encoding:error:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", -[NSString stringByAppendingString:](self->inputFilename, "stringByAppendingString:", CFSTR(".txt"))), 1, 1, &v16);
          }
        }
      }
    }
  }
  return inputImage;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)inputFilename
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputFilename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputShouldDumpInputValues
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputShouldDumpInputValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CIFilter)inputOriginalFilter
{
  return (CIFilter *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputOriginalFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

@end
