@implementation AVAIFCOutputSettingsValidator

- (AVAIFCOutputSettingsValidator)initWithFileType:(id)a3
{
  AVAIFCOutputSettingsValidator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVAIFCOutputSettingsValidator;
  v5 = -[AVMediaFileOutputSettingsValidator initWithFileType:](&v13, sel_initWithFileType_);
  if ((objc_msgSend((id)objc_msgSend(a3, "UTI"), "isEqualToString:", CFSTR("public.aifc-audio")) & 1) == 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"[[fileType UTI] isEqualToString:AVFileTypeAIFC]"), 0);
    objc_exception_throw(v12);
  }
  return v5;
}

- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4
{
  unsigned int v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVAIFCOutputSettingsValidator;
  v6 = -[AVMediaFileOutputSettingsValidator validateAudioOutputSettings:reason:](&v11, sel_validateAudioOutputSettings_reason_);
  if (v6)
  {
    v7 = (void *)objc_msgSend(a3, "audioSettingsDictionary");
    v8 = *MEMORY[0x1E0C89900];
    if (objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C89900]))
    {
      v6 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v8), "BOOLValue");
      v9 = CFSTR("AIFC files cannot contain little-endian LPCM");
      if (v6)
        v9 = 0;
      if (a4)
        goto LABEL_6;
    }
    else
    {
      v9 = 0;
      LOBYTE(v6) = 1;
      if (a4)
LABEL_6:
        *a4 = v9;
    }
  }
  return v6;
}

@end
