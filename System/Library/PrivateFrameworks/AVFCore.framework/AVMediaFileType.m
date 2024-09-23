@implementation AVMediaFileType

+ (id)allFileTypeIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend((id)sFigFileFormatsForUTIs, "allKeys"));
}

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99D80]);
    sFigFileFormatsForUTIs = objc_msgSend(v2, "initWithObjectsAndKeys:", *MEMORY[0x1E0CC43E0], CFSTR("com.apple.quicktime-movie"), *MEMORY[0x1E0CC43D8], CFSTR("public.mpeg-4"), *MEMORY[0x1E0CC43A8], CFSTR("public.3gpp"), *MEMORY[0x1E0CC4410], CFSTR("com.apple.m4v-video"), *MEMORY[0x1E0CC4408], CFSTR("com.apple.m4a-audio"), *MEMORY[0x1E0CC43C0], CFSTR("com.apple.immersive-video"), *MEMORY[0x1E0CC43C8], CFSTR("com.apple.coreaudio-format"), *MEMORY[0x1E0CC43F0], CFSTR("com.microsoft.waveform-audio"), *MEMORY[0x1E0CC43B0],
                               CFSTR("public.aiff-audio"),
                               *MEMORY[0x1E0CC43B0],
                               CFSTR("public.aifc-audio"),
                               *MEMORY[0x1E0CC43B8],
                               CFSTR("org.3gpp.adaptive-multi-rate-audio"),
                               *MEMORY[0x1E0CC4400],
                               CFSTR("com.apple.itunes-timed-text"),
                               *MEMORY[0x1E0CC43E8],
                               CFSTR("com.scenarist.closed-caption"),
                               *MEMORY[0x1E0CC43F8],
                               CFSTR("org.w3.webvtt"),
                               0);
  }
}

+ (AVMediaFileType)mediaFileTypeWithFileTypeIdentifier:(id)a3
{
  return (AVMediaFileType *)objc_msgSend(a1, "_mediaFileTypeWithFileTypeIdentifier:exceptionReason:", a3, 0);
}

+ (id)_mediaFileTypeWithFileTypeIdentifier:(id)a3 exceptionReason:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFileTypeIdentifier:exceptionReason:", a3, a4);
}

- (AVMediaFileType)initWithFileTypeIdentifier:(id)a3 exceptionReason:(id *)a4
{
  AVMediaFileType *v7;
  AVMediaFileType *v8;
  void *v9;
  AVDispatchOnce *v10;
  void *v11;
  AVMediaFileType *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AVMediaFileType;
  v7 = -[AVMediaFileType init](&v20, sel_init);
  v8 = v7;
  if (!a3)
  {
    v13 = v7;
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)"UTI != nil"), 0);
    objc_exception_throw(v19);
  }
  if (v7)
  {
    v7->_uti = (NSString *)objc_msgSend(a3, "copyWithZone:", -[AVMediaFileType zone](v7, "zone"));
    v9 = (void *)objc_msgSend((id)objc_opt_class(), "allFileTypeIdentifiers");
    if ((objc_msgSend(v9, "containsObject:", v8->_uti) & 1) != 0)
    {
      v10 = objc_alloc_init(AVDispatchOnce);
      v11 = 0;
      v8->_supportsSampleReferencesOnce = v10;
      if (!a4)
        return v8;
    }
    else
    {

      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid file type UTI.  Available file types are: %@"), objc_msgSend((id)objc_msgSend(v9, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
      v8 = 0;
      if (!a4)
        return v8;
    }
    goto LABEL_7;
  }
  v11 = 0;
  if (a4)
LABEL_7:
    *a4 = v11;
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMediaFileType;
  -[AVMediaFileType dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, UTI = %@>"), NSStringFromClass(v4), self, -[AVMediaFileType UTI](self, "UTI"));
}

- (NSString)defaultFileExtension
{
  NSString *v2;

  v2 = -[AVMediaFileType UTI](self, "UTI");
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.itunes-timed-text")))
    return (NSString *)CFSTR("itt");
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("com.scenarist.closed-caption")))
    return (NSString *)CFSTR("scc");
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("org.w3.webvtt")))
    return (NSString *)CFSTR("vtt");
  if (-[NSString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.immersive-video")))
    return (NSString *)CFSTR("aivu");
  return (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v2), "preferredFilenameExtension");
}

- (NSSet)supportedMediaTypes
{
  NSString *v2;
  void *v3;
  const AVMediaType *v4;
  int v6;

  v2 = -[AVMediaFileType UTI](self, "UTI");
  if ((-[NSString isEqual:](v2, "isEqual:", CFSTR("com.apple.coreaudio-format")) & 1) != 0
    || (-[NSString isEqual:](v2, "isEqual:", CFSTR("com.microsoft.waveform-audio")) & 1) != 0
    || (-[NSString isEqual:](v2, "isEqual:", CFSTR("public.aiff-audio")) & 1) != 0
    || (-[NSString isEqual:](v2, "isEqual:", CFSTR("public.aifc-audio")) & 1) != 0
    || -[NSString isEqual:](v2, "isEqual:", CFSTR("org.3gpp.adaptive-multi-rate-audio")))
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = &AVMediaTypeAudio;
    return (NSSet *)objc_msgSend(v3, "setWithObject:", *v4);
  }
  if (-[NSString isEqual:](v2, "isEqual:", CFSTR("com.apple.itunes-timed-text")))
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_13;
  }
  if (-[NSString isEqual:](v2, "isEqual:", CFSTR("com.scenarist.closed-caption")))
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = &AVMediaTypeClosedCaption;
    return (NSSet *)objc_msgSend(v3, "setWithObject:", *v4);
  }
  v6 = -[NSString isEqual:](v2, "isEqual:", CFSTR("org.w3.webvtt"));
  v3 = (void *)MEMORY[0x1E0C99E60];
  if (v6)
  {
LABEL_13:
    v4 = &AVMediaTypeText;
    return (NSSet *)objc_msgSend(v3, "setWithObject:", *v4);
  }
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("vide"), CFSTR("soun"), CFSTR("clcp"), CFSTR("text"), CFSTR("sbtl"), CFSTR("tmcd"), CFSTR("meta"), CFSTR("hapt"), CFSTR("auxv"), CFSTR("scen"), 0);
}

- (BOOL)supportsSampleReferences
{
  NSString *v3;
  AVDispatchOnce *supportsSampleReferencesOnce;
  _QWORD v6[6];

  v3 = -[AVMediaFileType UTI](self, "UTI");
  supportsSampleReferencesOnce = self->_supportsSampleReferencesOnce;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AVMediaFileType_supportsSampleReferences__block_invoke;
  v6[3] = &unk_1E302FE78;
  v6[4] = self;
  v6[5] = v3;
  -[AVDispatchOnce runBlockOnce:](supportsSampleReferencesOnce, "runBlockOnce:", v6);
  return self->_supportsSampleReferences;
}

uint64_t __43__AVMediaFileType_supportsSampleReferences__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigFileTypeDoesSupportExternalSampleReferences();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = (_DWORD)result != 0;
  return result;
}

- (NSString)UTI
{
  return self->_uti;
}

- (NSString)figFormatReaderFileFormat
{
  return (NSString *)objc_msgSend((id)sFigFileFormatsForUTIs, "objectForKey:", -[AVMediaFileType UTI](self, "UTI"));
}

- (unsigned)audioFileTypeID
{
  unsigned int *v2;
  unsigned int v3;
  UInt32 outDataSize;
  NSString *inSpecifier;

  inSpecifier = -[AVMediaFileType UTI](self, "UTI");
  outDataSize = 0;
  if (AudioFileGetGlobalInfoSize(0x74757469u, 8u, &inSpecifier, &outDataSize) || outDataSize < 4)
  {
    v3 = 0;
    v2 = 0;
  }
  else
  {
    v2 = (unsigned int *)malloc_type_malloc(outDataSize, 0xF6E8CF9uLL);
    if (!v2 || AudioFileGetGlobalInfo(0x74757469u, 8u, &inSpecifier, &outDataSize, v2))
      v3 = 0;
    else
      v3 = *v2;
  }
  free(v2);
  return v3;
}

- (BOOL)supportsOutputSettings:(id)a3 reason:(id *)a4
{
  return objc_msgSend(a3, "validateUsingOutputSettingsValidator:reason:", +[AVMediaFileOutputSettingsValidator mediaFileOutputSettingsValidatorForFileType:](AVMediaFileOutputSettingsValidator, "mediaFileOutputSettingsValidatorForFileType:", self), a4);
}

- (BOOL)supportsFormat:(opaqueCMFormatDescription *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v10;
  NSString *v11;
  signed int MediaType;
  signed int MediaSubType;
  int v14;
  int v15;
  int v16;
  void *v17;

  if (!a3)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"formatDesc != NULL"), 0);
    objc_exception_throw(v17);
  }
  v10 = -[AVMediaFileType UTI](self, "UTI");
  if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.quicktime-movie")))
    goto LABEL_3;
  if (!-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("public.mpeg-4")))
  {
    if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.m4v-video")))
    {
      MediaType = CMFormatDescriptionGetMediaType(a3);
      LOBYTE(v11) = 1;
      if (MediaType <= 1936684397)
      {
LABEL_24:
        if (MediaType == 1668047728)
          return (char)v11;
        goto LABEL_25;
      }
      if (MediaType != 1986618469)
      {
        if (MediaType == 1952807028)
          return (char)v11;
        if (MediaType != 1936684398)
          goto LABEL_81;
        MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
        LOBYTE(v11) = 1;
        if (MediaSubType > 1700998450)
        {
          if (MediaSubType == 1700998451)
            return (char)v11;
          v14 = 1970495843;
        }
        else
        {
          if (MediaSubType == 1633772320)
            return (char)v11;
          v14 = 1633889587;
        }
        goto LABEL_80;
      }
      MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
      LOBYTE(v11) = 1;
      if (MediaSubType <= 1752589104)
      {
        if (MediaSubType == 1635148593)
          return (char)v11;
        v14 = 1685481521;
        goto LABEL_80;
      }
LABEL_66:
      if (MediaSubType == 1752589105)
        return (char)v11;
      v14 = 1785750887;
      goto LABEL_80;
    }
    if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.m4a-audio")))
    {
      MediaType = CMFormatDescriptionGetMediaType(a3);
      LOBYTE(v11) = 1;
      if (MediaType <= 1936684397)
      {
        if (MediaType == 1668047728)
          return (char)v11;
        if (MediaType == 1751216244)
        {
          MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
          LOBYTE(v11) = 1;
          if (MediaSubType == 1634230640 || MediaSubType == 1634230642)
            return (char)v11;
          v14 = 1651866234;
          goto LABEL_80;
        }
LABEL_25:
        if (MediaType != 1935832172 || CMFormatDescriptionGetMediaSubType(a3) != 1954034535)
        {
LABEL_81:
          v11 = -[AVMediaFileType figFormatReaderFileFormat](self, "figFormatReaderFileFormat");
          if (v11)
            LOBYTE(v11) = FigRemakerCanFileTypeSupportFormatDescription() != 0;
          return (char)v11;
        }
LABEL_3:
        LOBYTE(v11) = 1;
        return (char)v11;
      }
      if (MediaType != 1986618469)
      {
        if (MediaType == 1952807028)
          return (char)v11;
        if (MediaType != 1936684398)
          goto LABEL_81;
        MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
        LOBYTE(v11) = 1;
        if (MediaSubType == 1633772320)
          return (char)v11;
        v15 = 1633889587;
LABEL_76:
        if (MediaSubType == v15)
          return (char)v11;
        v14 = 1700998451;
        goto LABEL_80;
      }
      MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
      LOBYTE(v11) = 1;
      if (MediaSubType == 1635148593)
        return (char)v11;
      goto LABEL_66;
    }
    if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.immersive-video")))
      goto LABEL_3;
    if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.apple.itunes-timed-text")))
    {
LABEL_37:
      LOBYTE(v11) = 0;
      return (char)v11;
    }
    if (-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("com.scenarist.closed-caption")))
    {
      if (CMFormatDescriptionGetMediaType(a3) != 1668047728)
        goto LABEL_37;
      LODWORD(v11) = CMFormatDescriptionGetMediaSubType(a3);
      v16 = 1664495672;
    }
    else
    {
      if (!-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("org.w3.webvtt")))
        goto LABEL_81;
      if (CMFormatDescriptionGetMediaType(a3) != 1952807028)
        goto LABEL_37;
      LODWORD(v11) = CMFormatDescriptionGetMediaSubType(a3);
      v16 = 2004251764;
    }
    LOBYTE(v11) = (_DWORD)v11 == v16;
    return (char)v11;
  }
  MediaType = CMFormatDescriptionGetMediaType(a3);
  LOBYTE(v11) = 1;
  if (MediaType <= 1936684397)
    goto LABEL_24;
  if (MediaType == 1986618469)
  {
    MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
    LOBYTE(v11) = 1;
    if (MediaSubType > 1785750886)
    {
      if (MediaSubType == 1785750887)
        return (char)v11;
      v14 = 1836070006;
    }
    else
    {
      if (MediaSubType == 1635148593)
        return (char)v11;
      v14 = 1752589105;
    }
    goto LABEL_80;
  }
  if (MediaType == 1952807028)
    return (char)v11;
  if (MediaType != 1936684398)
    goto LABEL_81;
  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  LOBYTE(v11) = 1;
  if (MediaSubType > 1667326831)
  {
    if (MediaSubType > 1902207847)
    {
      if (MediaSubType <= 1970495842)
      {
        if (MediaSubType == 1902207848)
          return (char)v11;
        v14 = 1902207856;
      }
      else
      {
        if (MediaSubType == 1970495843 || MediaSubType == 2053202792)
          return (char)v11;
        v14 = 2053202800;
      }
      goto LABEL_80;
    }
    if (MediaSubType > 1885430114)
    {
      if (MediaSubType == 1885430115 || MediaSubType == 1885430632)
        return (char)v11;
      v14 = 1885430640;
      goto LABEL_80;
    }
    v15 = 1667326832;
    goto LABEL_76;
  }
  if (MediaSubType > 1633889586)
  {
    if (MediaSubType == 1633889587 || MediaSubType == 1634492771)
      return (char)v11;
    v14 = 1667326824;
    goto LABEL_80;
  }
  if (((MediaSubType - 1633772389) > 0xB || ((1 << (MediaSubType - 101)) & 0x80F) == 0)
    && MediaSubType != 1633771875)
  {
    v14 = 1633772320;
LABEL_80:
    if (MediaSubType == v14)
      return (char)v11;
    goto LABEL_81;
  }
  return (char)v11;
}

+ (id)isoFileTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("public.mpeg-4"), CFSTR("com.apple.m4a-audio"), CFSTR("com.apple.m4v-video"), CFSTR("public.3gpp"), CFSTR("public.3gpp2"), 0);
}

+ (__CFString)figFileTypeProfileFromAVFileTypeProfile:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", CFSTR("MPEG4AppleHLS")))
    return (__CFString *)*MEMORY[0x1E0CC4270];
  if (objc_msgSend(a3, "isEqual:", CFSTR("MPEG4CMAFCompliant")))
    return (__CFString *)*MEMORY[0x1E0CC4278];
  return 0;
}

@end
