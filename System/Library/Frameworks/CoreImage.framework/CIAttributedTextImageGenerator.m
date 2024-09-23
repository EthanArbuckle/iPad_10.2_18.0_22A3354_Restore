@implementation CIAttributedTextImageGenerator

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryGenerator");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("11");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.13");
  v8[3] = CFSTR("inputScaleFactor");
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
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v8[4] = CFSTR("inputPadding");
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
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)outputImage
{
  NSAttributedString *inputText;
  float v4;
  float v5;
  int v6;
  int v7;
  CGColorSpace *v8;
  NSAttributedString *v9;
  double v10;
  double v11;
  CIImage *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  if (self->inputText)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CIAttributedTextImageGenerator outputImage].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      return 0;
    }
    inputText = self->inputText;
  }
  else
  {
    inputText = 0;
  }
  if (!-[NSAttributedString length](inputText, "length"))
    return 0;
  -[NSNumber floatValue](self->inputScaleFactor, "floatValue");
  if (v4 <= 0.0)
    return 0;
  v5 = v4;
  -[NSNumber floatValue](self->inputPadding, "floatValue");
  v7 = v6;
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  v9 = self->inputText;
  v22[0] = CFSTR("kCIImageTextScaleFactor");
  *(float *)&v10 = v5;
  v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v23[1] = v8;
  v22[1] = CFSTR("CIImageColorSpace");
  v22[2] = CFSTR("kCIImageTextPadding");
  LODWORD(v11) = v7;
  v23[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = +[CIImage imageWithAttributedString:format:options:](CIImage, "imageWithAttributedString:format:options:", v9, 264, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
  CGColorSpaceRelease(v8);
  return v12;
}

- (NSAttributedString)inputText
{
  return self->inputText;
}

- (void)setInputText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputPadding
{
  return self->inputPadding;
}

- (void)setInputPadding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)outputImage
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s inputText must be a NSAttributedString.", a5, a6, a7, a8, 2u);
}

@end
