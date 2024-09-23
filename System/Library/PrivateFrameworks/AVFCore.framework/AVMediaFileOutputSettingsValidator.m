@implementation AVMediaFileOutputSettingsValidator

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if ((id)objc_opt_class() == a1)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    v7 = objc_opt_class();
    v6 = objc_opt_class();
    v2 = objc_opt_class();
    v3 = objc_opt_class();
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    sAVMediaFileOutputSettingsValidatorClassesForFileType = objc_msgSend(v8, "initWithObjectsAndKeys:", v7, CFSTR("com.microsoft.waveform-audio"), v6, CFSTR("public.aiff-audio"), v2, CFSTR("public.aifc-audio"), v3, CFSTR("public.mpeg-4"), v4, CFSTR("com.apple.m4v-video"), v5, CFSTR("com.apple.m4a-audio"), objc_opt_class(), CFSTR("public.3gpp"), 0);
  }
}

+ (id)mediaFileOutputSettingsValidatorForFileType:(id)a3
{
  objc_class *v4;

  v4 = (objc_class *)objc_msgSend((id)sAVMediaFileOutputSettingsValidatorClassesForFileType, "objectForKey:", objc_msgSend(a3, "UTI"));
  if (!v4)
    v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend([v4 alloc], "initWithFileType:", a3);
}

- (AVMediaFileOutputSettingsValidator)init
{
  return -[AVMediaFileOutputSettingsValidator initWithFileType:](self, "initWithFileType:", 0);
}

- (AVMediaFileOutputSettingsValidator)initWithFileType:(id)a3
{
  AVMediaFileOutputSettingsValidator *v5;
  uint64_t v6;
  AVMediaFileOutputSettingsValidator *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVMediaFileOutputSettingsValidator;
  v5 = -[AVMediaFileOutputSettingsValidator init](&v15, sel_init);
  v6 = objc_opt_class();
  AVRequireConcreteObject(v5, a2, v6);
  if (!a3)
  {
    v8 = v5;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"fileType != nil"), 0);
    objc_exception_throw(v14);
  }
  if (v5)
    v5->_fileType = (AVMediaFileType *)objc_msgSend(a3, "copyWithZone:", -[AVMediaFileOutputSettingsValidator zone](v5, "zone"));
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMediaFileOutputSettingsValidator;
  -[AVMediaFileOutputSettingsValidator dealloc](&v3, sel_dealloc);
}

- (AVMediaFileType)fileType
{
  return self->_fileType;
}

- (BOOL)validateAudioOutputSettings:(id)a3 reason:(id *)a4
{
  void *v6;
  AVMediaFileType *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  char *v11;
  uint64_t v12;
  __CFString *v13;
  int v14;
  void *v15;
  int v16;
  UInt32 outDataSize;
  unsigned int inSpecifier;

  v6 = (void *)objc_msgSend(a3, "audioSettingsDictionary");
  v7 = -[AVMediaFileOutputSettingsValidator fileType](self, "fileType");
  v8 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C898E0]);
  if (!v8
    || (v9 = objc_msgSend(v8, "unsignedIntValue"), (v10 = -[AVMediaFileType audioFileTypeID](v7, "audioFileTypeID")) == 0))
  {
LABEL_12:
    v13 = 0;
    v14 = 1;
    goto LABEL_13;
  }
  outDataSize = 0;
  inSpecifier = v10;
  if (AudioFileGetGlobalInfoSize(0x666D6964u, 4u, &inSpecifier, &outDataSize))
  {
    v11 = 0;
  }
  else
  {
    v11 = (char *)malloc_type_malloc(outDataSize, 0x3C438C3uLL);
    if (v11 && !AudioFileGetGlobalInfo(0x666D6964u, 4u, &inSpecifier, &outDataSize, v11) && outDataSize >= 4)
    {
      v12 = 0;
      while (*(_DWORD *)&v11[v12] != v9)
      {
        v12 += 4;
        if ((outDataSize & 0xFFFFFFFC) == v12)
          goto LABEL_10;
      }
      free(v11);
      goto LABEL_12;
    }
  }
LABEL_10:
  free(v11);
  v13 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Format ID '%@' is not compatible with file type %@"), AVStringForOSType(v9), -[AVMediaFileType UTI](v7, "UTI"));
  v14 = 0;
LABEL_13:
  v15 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C89928]);
  if (v14)
  {
    if (v15)
    {
      v16 = objc_msgSend(v15, "BOOLValue");
      LOBYTE(v14) = v16 ^ 1;
      if (v16)
        v13 = CFSTR("Cannot write non-interleaved audio to a file");
    }
  }
  if (a4)
    *a4 = v13;
  return v14;
}

- (BOOL)validateVideoOutputSettings:(id)a3 reason:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 1;
}

@end
