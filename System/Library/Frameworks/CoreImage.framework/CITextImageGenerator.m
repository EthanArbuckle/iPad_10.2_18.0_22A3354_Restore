@implementation CITextImageGenerator

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryGenerator");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("11");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.13");
  v12[3] = CFSTR("inputFontName");
  v9 = CFSTR("CIAttributeDefault");
  v10 = CFSTR("HelveticaNeue");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v12[4] = CFSTR("inputFontSize");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1AF90;
  v8[1] = &unk_1E2F1AFA0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1AFB0;
  v8[3] = &unk_1E2F1BF20;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputScaleFactor");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1AF90;
  v6[1] = &unk_1E2F1AFC0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1AFD0;
  v6[3] = &unk_1E2F1BF38;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v12[6] = CFSTR("inputPadding");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1BF50;
  v4[1] = &unk_1E2F1BF50;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1BF68;
  v4[3] = &unk_1E2F1BF80;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1BF50;
  v4[5] = CFSTR("CIAttributeTypeInteger");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  NSString *inputText;
  float v4;
  float v5;
  int v6;
  int v7;
  const __CFString *inputFontName;
  float v9;
  CTFontRef v10;
  CFAttributedStringRef v11;
  double v12;
  double v13;
  CIImage *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (self->inputText)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = ci_logger_api();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CITextImageGenerator outputImage].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
      return 0;
    }
    inputText = self->inputText;
  }
  else
  {
    inputText = 0;
  }
  if (!-[NSString length](inputText, "length"))
    return 0;
  -[NSNumber floatValue](self->inputScaleFactor, "floatValue");
  if (v4 <= 0.0)
    return 0;
  v5 = v4;
  -[NSNumber floatValue](self->inputPadding, "floatValue");
  v7 = v6;
  inputFontName = (const __CFString *)self->inputFontName;
  -[NSNumber floatValue](self->inputFontSize, "floatValue");
  v10 = CTFontCreateWithName(inputFontName, v9, 0);
  v26 = *MEMORY[0x1E0CA8188];
  v27[0] = v10;
  v11 = CFAttributedStringCreate(0, (CFStringRef)self->inputText, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
  v24[0] = CFSTR("kCIImageTextScaleFactor");
  *(float *)&v12 = v5;
  v24[1] = CFSTR("kCIImageTextPadding");
  v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  LODWORD(v13) = v7;
  v25[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = +[CIImage imageWithAttributedString:format:options:](CIImage, "imageWithAttributedString:format:options:", v11, 260, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  CFRelease(v11);
  CFRelease(v10);
  return v14;
}

- (NSString)inputText
{
  return self->inputText;
}

- (void)setInputText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)inputFontName
{
  return self->inputFontName;
}

- (void)setInputFontName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputFontSize
{
  return self->inputFontSize;
}

- (void)setInputFontSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputPadding
{
  return self->inputPadding;
}

- (void)setInputPadding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)outputImage
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s inputText must be a NSString.", a5, a6, a7, a8, 2u);
}

@end
