@implementation AVISOOutputSettingsValidator

- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVISOOutputSettingsValidator;
  v5 = -[AVMediaFileOutputSettingsValidator validateAudioOutputSettings:reason:](&v7, sel_validateAudioOutputSettings_reason_, a3);
  if (a4 && v5)
    *a4 = 0;
  return v5;
}

- (BOOL)validateVideoOutputSettings:(id)a3 reason:(id *)a4
{
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVISOOutputSettingsValidator;
  if (!-[AVMediaFileOutputSettingsValidator validateVideoOutputSettings:reason:](&v12, sel_validateVideoOutputSettings_reason_))return 0;
  if (objc_msgSend(a3, "willYieldCompressedSamples"))
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoCodecKey"));
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("avc1")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("jpeg")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("hvc1")) & 1) != 0)
    {
      v8 = 0;
      v9 = 1;
      if (!a4)
        return v9;
      goto LABEL_11;
    }
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The video codec %@ is not compatible with file type %@"), v7, -[AVMediaFileType UTI](-[AVMediaFileOutputSettingsValidator fileType](self, "fileType"), "UTI"));
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Uncompressed video is not allowed for file type %@"), -[AVMediaFileType UTI](-[AVMediaFileOutputSettingsValidator fileType](self, "fileType"), "UTI"), v11);
  }
  v9 = 0;
  if (a4)
LABEL_11:
    *a4 = v8;
  return v9;
}

@end
