@implementation LPMIMETypeRegistry

+ (BOOL)isWebPageType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("text/html")) & 1) != 0
    || (objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("application/xhtml+xml")) & 1) != 0
    || (objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("text/xml")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("application/xml"));
  }

  return v4;
}

+ (BOOL)isImageType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (isImageType__onceToken != -1)
  {
    dispatch_once(&isImageType__onceToken, &__block_literal_global_12);
    if (v4)
      goto LABEL_3;
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  if (!v3)
    goto LABEL_8;
LABEL_3:
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("image/x-icon")) & 1) != 0
    || (objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("image/jpg")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", isImageType__validImageMIMETypes);
  }
LABEL_9:

  return v5;
}

void __34__LPMIMETypeRegistry_isImageType___block_invoke()
{
  id v0;
  void *v1;
  const __CFArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)isImageType__validImageMIMETypes;
  isImageType__validImageMIMETypes = (uint64_t)v0;

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = CGImageSourceCopyTypeIdentifiers();
  v3 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        +[LPMIMETypeRegistry MIMETypeForUTI:](LPMIMETypeRegistry, "MIMETypeForUTI:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend((id)isImageType__validImageMIMETypes, "addObject:", v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

+ (BOOL)isVideoType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4
    && ((objc_msgSend(v4, "_lp_hasCaseInsensitivePrefix:", CFSTR("video/")) & 1) != 0
     || (objc_msgSend(v5, "_lp_hasCaseInsensitivePrefix:", CFSTR("application/")) & 1) != 0))
  {
    v6 = objc_msgSend(a1, "isMediaType:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isMediaType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (!v3
    || (objc_msgSend(v3, "_lp_hasCaseInsensitivePrefix:", CFSTR("video/")) & 1) == 0
    && (objc_msgSend(v4, "_lp_hasCaseInsensitivePrefix:", CFSTR("audio/")) & 1) == 0
    && (objc_msgSend(v4, "_lp_hasCaseInsensitivePrefix:", CFSTR("application/")) & 1) == 0)
  {
    goto LABEL_8;
  }
  if (knownUnavailableMediaMIMETypes_onceToken != -1)
    dispatch_once(&knownUnavailableMediaMIMETypes_onceToken, &__block_literal_global_70);
  if ((objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", knownUnavailableMediaMIMETypes_types) & 1) == 0)
  {
    if (knownAvailableMediaMIMETypes_onceToken != -1)
      dispatch_once(&knownAvailableMediaMIMETypes_onceToken, &__block_literal_global_87);
    if ((objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", knownAvailableMediaMIMETypes_types) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      if (avFoundationMIMETypes_onceToken != -1)
        dispatch_once(&avFoundationMIMETypes_onceToken, &__block_literal_global_142);
      v5 = objc_msgSend(v4, "_lp_isEqualToAnyIgnoringCase:", avFoundationMIMETypes_types);
    }
  }
  else
  {
LABEL_8:
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isAudioType:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "_lp_hasCaseInsensitivePrefix:", CFSTR("audio/"));
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isJSONType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualIgnoringCase:", CFSTR("application/json"));
}

+ (BOOL)isLosslessImageType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualIgnoringCase:", CFSTR("image/png"));
}

+ (BOOL)isHLSType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0228);
}

+ (BOOL)isARAssetType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0240);
}

+ (BOOL)isNonAnimatedMultiframeImageType:(id)a3
{
  return objc_msgSend(a3, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F0258);
}

+ (id)MIMETypeForUTI:(id)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = (__CFString *)a3;
  if ((-[__CFString _lp_isEqualIgnoringCase:](v3, "_lp_isEqualIgnoringCase:", CFSTR("com.pixar.universal-scene-description-mobile")) & 1) != 0)
  {
    v4 = CFSTR("model/vnd.usdz+zip");
  }
  else if ((-[__CFString _lp_isEqualIgnoringCase:](v3, "_lp_isEqualIgnoringCase:", CFSTR("com.apple.watchface")) & 1) != 0)
  {
    v4 = CFSTR("application/vnd.apple.watchface");
  }
  else if ((-[__CFString _lp_isEqualIgnoringCase:](v3, "_lp_isEqualIgnoringCase:", CFSTR("com.apple.coreaudio-format")) & 1) != 0)
  {
    v4 = CFSTR("audio/x-caf");
  }
  else
  {
    v4 = (__CFString *)UTTypeCopyPreferredTagWithClass(v3, (CFStringRef)*MEMORY[0x1E0CA5A90]);
  }

  return v4;
}

+ (id)UTIForMIMEType:(id)a3
{
  __CFString *v3;
  __CFString *PreferredIdentifierForTag;

  v3 = (__CFString *)a3;
  if ((-[__CFString _lp_isEqualIgnoringCase:](v3, "_lp_isEqualIgnoringCase:", CFSTR("application/vnd.apple.watchface")) & 1) != 0)
    PreferredIdentifierForTag = CFSTR("com.apple.watchface");
  else
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A90], v3, 0);

  return PreferredIdentifierForTag;
}

+ (id)UTIForFileExtension:(id)a3
{
  return (id)(id)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A88], (CFStringRef)a3, 0);
}

+ (id)fileExtensionForUTI:(id)a3
{
  return (id)(id)UTTypeCopyPreferredTagWithClass((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E0CA5A88]);
}

+ (id)fileExtensionForMIMEType:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "_lp_isEqualIgnoringCase:", CFSTR("application/vnd.apple.watchface")) & 1) != 0)
  {
    v5 = CFSTR("watchface");
  }
  else
  {
    objc_msgSend(a1, "UTIForMIMEType:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fileExtensionForUTI:", v6);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
