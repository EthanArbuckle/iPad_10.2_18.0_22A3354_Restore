@implementation CKAudioMediaObject

+ (id)UTITypes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexesOfObjectsPassingTest:", &__block_literal_global_69);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __30__CKAudioMediaObject_UTITypes__block_invoke(int a1, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E0CA5AC8]) != 0;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E0D386A0];
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("AUDIO");
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

- (id)attachmentSummary:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    v6 = CFSTR("SUMMARY_AUDIO_TYPE");
  else
    v6 = CFSTR("SUMMARY_AUDIO_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)mediaType
{
  return 1;
}

- (BOOL)shouldSuppressPreview
{
  void *v3;
  int v4;
  char v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPriusEnabled");

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKAudioMediaObject;
    return -[CKMediaObject shouldSuppressPreview](&v9, sel_shouldSuppressPreview);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKAudioMediaObject;
    if (-[CKMediaObject shouldSuppressPreview](&v8, sel_shouldSuppressPreview))
    {
      return 1;
    }
    else
    {
      -[CKMediaObject messageContext](self, "messageContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isSenderUnauthenticated");

    }
  }
  return v5;
}

- (BOOL)supportsUnknownSenderPreview
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPriusEnabled");

  return v3;
}

- (id)pasteboardItemProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;

  -[CKMediaObject fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithContentsOfURL:", v3);
  -[CKMediaObject filename](self, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKAudioMediaObject isAudioMessage](self, "isAudioMessage"))
  {
    if (-[CKMediaObject isFromMe](self, "isFromMe"))
    {
      CKFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUDIO_MESSAGE_SAVE"), &stru_1E276D870, CFSTR("ChatKit"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKMediaObject senderHandle](self, "senderHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUDIO_MESSAGE_VOICE_MEMO_LABEL"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v6, "name");
      else
        objc_msgSend(v6, "displayID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceLayoutDirection");

      if (v15 == 1)
        v16 = CFSTR("\u200F");
      else
        v16 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v13);
      v7 = objc_claimAutoreleasedReturnValue();

    }
    v5 = (void *)v7;
  }
  objc_msgSend(v4, "setSuggestedName:", v5);

  return v4;
}

- (double)duration
{
  void *v3;
  char isKindOfClass;
  double result;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  if (-[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess")
    && -[CKAudioMediaObject isAudioMessage](self, "isAudioMessage"))
  {
    -[CKMediaObject previewMetadata](self, "previewMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    result = 0.0;
    if ((isKindOfClass & 1) != 0)
    {
      -[CKMediaObject previewMetadata](self, "previewMetadata", 0.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAudioMediaObject restorePreviewMetadataFromDict:](self, "restorePreviewMetadataFromDict:", v6);
      -[CKAudioMediaObject durationFromMetadata](self, "durationFromMetadata");
      v8 = v7;

      return v8;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKAudioMediaObject;
    -[CKAVMediaObject duration](&v9, sel_duration);
  }
  return result;
}

+ (void)_cachePowerLevels:(id)a3 forKey:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if (v12 && v5)
  {
    if (!sPowerLevelDictionary)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
      v7 = (void *)sPowerLevelDictionary;
      sPowerLevelDictionary = v6;

    }
    if (!sPowerLevelKeyArray)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
      v9 = (void *)sPowerLevelKeyArray;
      sPowerLevelKeyArray = v8;

    }
    objc_msgSend((id)sPowerLevelDictionary, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend((id)sPowerLevelDictionary, "removeObjectForKey:", v5);
    }
    else if ((unint64_t)objc_msgSend((id)sPowerLevelKeyArray, "count") >= 5)
    {
      objc_msgSend((id)sPowerLevelKeyArray, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)sPowerLevelDictionary, "removeObjectForKey:", v11);
      objc_msgSend((id)sPowerLevelKeyArray, "removeFirstObject");

    }
    objc_msgSend((id)sPowerLevelDictionary, "setObject:forKeyedSubscript:", v12, v5);
    objc_msgSend((id)sPowerLevelKeyArray, "addObject:", v5);
  }

}

+ (id)_cachedPowerLevelsForKey:(id)a3
{
  return (id)objc_msgSend((id)sPowerLevelDictionary, "objectForKey:", a3);
}

- (NSArray)powerLevels
{
  void *v2;
  void *v3;

  -[CKMediaObject transferGUID](self, "transferGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAudioMediaObject _cachedPowerLevelsForKey:](CKAudioMediaObject, "_cachedPowerLevelsForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setPowerLevels:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObject transferGUID](self, "transferGUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[CKAudioMediaObject _cachePowerLevels:forKey:](CKAudioMediaObject, "_cachePowerLevels:forKey:", v4, v5);

}

+ (BOOL)isPreviewable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return !-[CKAudioMediaObject shouldSuppressPreview](self, "shouldSuppressPreview")
      && -[CKAudioMediaObject isAudioMessage](self, "isAudioMessage");
}

- (BOOL)isAudioMessage
{
  void *v2;
  char v3;

  -[CKMediaObject messageContext](self, "messageContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAudioMessage");

  return v3;
}

- (Class)balloonViewClass
{
  objc_class *v3;
  void *v4;
  id v5;
  objc_super v7;

  if (-[CKAudioMediaObject shouldSuppressPreview](self, "shouldSuppressPreview"))
  {
    v3 = (objc_class *)objc_opt_class();
  }
  else
  {
    if (-[CKAudioMediaObject isAudioMessage](self, "isAudioMessage"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v4, "audioBalloonViewClass");

      return (Class)v5;
    }
    v7.receiver = self;
    v7.super_class = (Class)CKAudioMediaObject;
    v3 = -[CKMediaObject balloonViewClass](&v7, sel_balloonViewClass);
  }
  return v3;
}

- (BOOL)canExport
{
  return 1;
}

- (void)restorePreviewMetadataFromDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  CKAudioMediaObject *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("duration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKey:", CFSTR("powerLevels"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 != 0.0 && v9 != 0)
    {
      -[CKAudioMediaObject setDurationFromMetadata:](self, "setDurationFromMetadata:", v8);
      -[CKAudioMediaObject setPowerLevelsFromMetadata:](self, "setPowerLevelsFromMetadata:", v10);
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[CKMediaObject transferGUID](self, "transferGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMediaObject filename](self, "filename");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v23 = self;
          v24 = 2112;
          v25 = v13;
          v26 = 2112;
          v27 = v14;
          v28 = 2112;
          v29 = v5;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] duration and power levels restored from metadataDict %@.", buf, 0x2Au);

        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        -[CKMediaObject transferGUID](self, "transferGUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject filename](self, "filename");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _CKLog();

      }
    }

  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[CKMediaObject transferGUID](self, "transferGUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject filename](self, "filename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v23 = self;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] error restoring duration and power levels from metadataDict %@.", buf, 0x2Au);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    -[CKMediaObject transferGUID](self, "transferGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject filename](self, "filename");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _CKLog();

  }
}

- (id)temporaryWaveformWithWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  NSObject *v7;
  void *v8;
  double v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  CKAudioMediaObject *v27;
  CKAudioMediaObject *v28;
  uint64_t v29;
  uint8_t buf[4];
  CKAudioMediaObject *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v31 = self;
      v32 = 1024;
      v33 = v4;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "%@ previewForOrientation:%d", buf, 0x12u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v27 = self;
    v29 = (int)v4;
    _CKLog();
  }
  -[CKMediaObject transfer](self, "transfer", v27, v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isFileDataReady") & 1) != 0 || (objc_msgSend(v8, "isRestoring") & 1) != 0)
  {
    if (-[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
    {
      -[CKAudioMediaObject durationFromMetadata](self, "durationFromMetadata");
      if (v9 == 0.0
        || (-[CKAudioMediaObject powerLevelsFromMetadata](self, "powerLevelsFromMetadata"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = v10 == 0,
            v10,
            v11))
      {
        -[CKMediaObject previewMetadata](self, "previewMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[CKMediaObject previewMetadata](self, "previewMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKAudioMediaObject restorePreviewMetadataFromDict:](self, "restorePreviewMetadataFromDict:", v14);

        }
      }
    }
    -[CKAudioMediaObject generateThumbnailForWidth:](self, "generateThumbnailForWidth:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v15, v4, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_36;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultWaveformImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "size");
      -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v18, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_36:
        v25 = v16;
        goto LABEL_39;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_DEBUG, "Failed to load default waveform image from assets", buf, 2u);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
    }
    -[CKAudioMediaObject generatePlaceholderThumbnailForWidth:](self, "generatePlaceholderThumbnailForWidth:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v24, v4, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_36;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v28 = self;
    _CKLog();
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "defaultWaveformImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v21, v4, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v25 = v22;

LABEL_39:
  return v25;
}

- (id)waveformForOrientation:(char)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  BOOL v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  BOOL v40;
  int v41;
  NSObject *v42;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  CKAudioMediaObject *v58;
  CKAudioMediaObject *v59;
  CKAudioMediaObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[5];
  id v65;
  char v66;
  _QWORD v67[6];
  char v68;
  _QWORD v69[5];
  id v70;
  char v71;
  uint8_t buf[4];
  CKAudioMediaObject *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  int v79;
  uint64_t v80;

  v3 = a3;
  v80 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[CKMediaObject transferGUID](self, "transferGUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject filename](self, "filename");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v73 = self;
      v74 = 2112;
      v75 = v6;
      v76 = 2112;
      v77 = v7;
      v78 = 1024;
      v79 = v3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] previewForOrientation:%d", buf, 0x26u);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    -[CKMediaObject transferGUID](self, "transferGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject filename](self, "filename");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (int)v3;
    v58 = self;
    v61 = v8;
    _CKLog();

  }
  -[CKMediaObject transfer](self, "transfer", v58, v61, v62, v63);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isFileDataReady") & 1) != 0 || (objc_msgSend(v9, "isRestoring") & 1) != 0)
  {
    if (-[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
    {
      -[CKAudioMediaObject durationFromMetadata](self, "durationFromMetadata");
      if (v10 == 0.0
        || (-[CKAudioMediaObject powerLevelsFromMetadata](self, "powerLevelsFromMetadata"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = v11 == 0,
            v11,
            v12))
      {
        -[CKMediaObject previewMetadata](self, "previewMetadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[CKMediaObject previewMetadata](self, "previewMetadata");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKAudioMediaObject restorePreviewMetadataFromDict:](self, "restorePreviewMetadataFromDict:", v15);

        }
      }
    }
    -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cachedPreviewForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = v18;
LABEL_78:
      v26 = v19;
LABEL_79:

      goto LABEL_80;
    }
    -[CKMediaObject transfer](self, "transfer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isFileURLFinalized");

    if (v21)
    {
      -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v3, CFSTR("png"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAudioMediaObject savedPreviewFromURL:forOrientation:](self, "savedPreviewFromURL:forOrientation:", v22, v3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v73 = self;
            _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_DEBUG, "%@ preview read from disk.", buf, 0xCu);
          }

        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v59 = self;
          _CKLog();
        }
        -[CKMediaObject previewDispatchCache](self, "previewDispatchCache", v59);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCachedPreview:key:", v23, v16);

        v26 = v23;
        goto LABEL_79;
      }

    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "previewMaxWidth");
    v30 = v29;

    if (!-[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess")
      || -[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess")
      && (-[CKAudioMediaObject durationFromMetadata](self, "durationFromMetadata"), v31 != 0.0)
      && (-[CKAudioMediaObject powerLevelsFromMetadata](self, "powerLevelsFromMetadata"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = v32 == 0,
          v32,
          !v33))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAudioMediaObject duration](self, "duration");
      objc_msgSend(v34, "transcriptWaveformWidthForDuration:");
      v30 = v35;

      -[CKAudioMediaObject duration](self, "duration");
      v37 = v36;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "waveformMaxWidthDuration");
      v40 = v37 > v39;

      v41 = IMOSLoggingEnabled();
      if (v40)
      {
        if (v41)
        {
          CKLogCStringForType(2);
          OSLogHandleForIMFoundationCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v73 = self;
            _os_log_impl(&dword_18DFCD000, v42, OS_LOG_TYPE_DEBUG, "%@ duration is long. Generate waveform in background.", buf, 0xCu);
          }

        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v59 = self;
          _CKLog();
        }
        -[CKMediaObject previewDispatchCache](self, "previewDispatchCache", v59);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isGeneratingPreviewForKey:", v16);

        if ((v44 & 1) == 0)
        {
          -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_109;
          v67[3] = &unk_1E274FA40;
          v67[4] = self;
          *(double *)&v67[5] = v30;
          v68 = v3;
          v64[0] = MEMORY[0x1E0C809B0];
          v64[1] = 3221225472;
          v64[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_113;
          v64[3] = &unk_1E274E150;
          v64[4] = self;
          v65 = v16;
          v66 = v3;
          objc_msgSend(v45, "enqueueGenerationBlock:completion:withPriority:forKey:", v67, v64, 0, v65);

        }
      }
      else
      {
        if (v41)
        {
          CKLogCStringForType(2);
          OSLogHandleForIMFoundationCategory();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v73 = self;
            _os_log_impl(&dword_18DFCD000, v46, OS_LOG_TYPE_DEBUG, "%@ duration is short. Generate waveform sychronously.", buf, 0xCu);
          }

        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v59 = self;
          _CKLog();
        }
        -[CKAudioMediaObject generateThumbnailForWidth:](self, "generateThumbnailForWidth:", v30, v59);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v47, v3, v30);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(2);
            OSLogHandleForIMFoundationCategory();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v73 = self;
              _os_log_impl(&dword_18DFCD000, v49, OS_LOG_TYPE_DEBUG, "Finished generating preview for %@", buf, 0xCu);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v60 = self;
            _CKLog();
          }
          -[CKMediaObject previewDispatchCache](self, "previewDispatchCache", v60);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setCachedPreview:key:", v48, v16);

          -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke;
          v69[3] = &unk_1E274FA18;
          v69[4] = self;
          v71 = v3;
          v52 = v48;
          v70 = v52;
          objc_msgSend(v51, "enqueueSaveBlock:forMediaObject:withPriority:", v69, self, 0);

          goto LABEL_77;
        }
      }
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "defaultWaveformImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v54, "size");
      -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v54, v3);
      v52 = (id)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
LABEL_77:
        v19 = v52;
        goto LABEL_78;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v55, OS_LOG_TYPE_DEBUG, "Failed to load default waveform image from assets", buf, 2u);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
    }
    -[CKAudioMediaObject generatePlaceholderThumbnailForWidth:](self, "generatePlaceholderThumbnailForWidth:", v30);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v56, v3, v30);
    v52 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_77;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v73 = self;
      _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();
  v26 = 0;
LABEL_80:

  return v26;
}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "Saving waveform for %@ to disk.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = *(_QWORD *)(a1 + 32);
    _CKLog();
  }
  objc_msgSend(*(id *)(a1 + 32), "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", *(char *)(a1 + 48), CFSTR("png"), 1, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "savePreview:toURL:forOrientation:", *(_QWORD *)(a1 + 40), v6, *(char *)(a1 + 48));

}

id __45__CKAudioMediaObject_waveformForOrientation___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "Starting background generation of waveform for %@.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v10 = *(_QWORD *)(a1 + 32);
    _CKLog();
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "generateThumbnailForWidth:", *(double *)(a1 + 40), v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generatePreviewFromThumbnail:width:orientation:", v7, *(char *)(a1 + 48), *(double *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke_113(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_2;
  block[3] = &unk_1E274E150;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(_BYTE *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  char v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "previewDispatchCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "Finished generating preview for %@", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v7 = *(_QWORD *)(a1 + 32);
      _CKLog();
    }
    objc_msgSend(*(id *)(a1 + 32), "previewDispatchCache", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_114;
    v8[3] = &unk_1E274FA18;
    v8[4] = *(_QWORD *)(a1 + 32);
    v10 = *(_BYTE *)(a1 + 48);
    v9 = v3;
    objc_msgSend(v6, "enqueueSaveBlock:forMediaObject:withPriority:", v8, *(_QWORD *)(a1 + 32), 0);

    objc_msgSend(*(id *)(a1 + 32), "postPreviewDidChangeNotifications");
  }

}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "Saving waveform for %@ to disk.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = *(_QWORD *)(a1 + 32);
    _CKLog();
  }
  objc_msgSend(*(id *)(a1 + 32), "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", *(char *)(a1 + 48), CFSTR("png"), 1, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "savePreview:toURL:forOrientation:", *(_QWORD *)(a1 + 40), v6, *(char *)(a1 + 48));

}

- (id)composeWaveformForWidth:(double)a3 orientation:(char)a4
{
  return -[CKAudioMediaObject composeWaveformForWidth:orientation:withColor:](self, "composeWaveformForWidth:orientation:withColor:", a4, 0, a3);
}

- (id)composeWaveformForWidth:(double)a3 orientation:(char)a4 withColor:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v8 = a5;
  -[CKAudioMediaObject generateThumbnailForWidth:withColor:](self, "generateThumbnailForWidth:withColor:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:withColor:](self, "generatePreviewFromThumbnail:width:orientation:withColor:", v9, v5, v8, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[CKAudioMediaObject generatePlaceholderThumbnailForWidth:withColor:](self, "generatePlaceholderThumbnailForWidth:withColor:", v8, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:withColor:](self, "generatePreviewFromThumbnail:width:orientation:withColor:", v11, v5, v8, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a5;
  v8 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v5 == 1)
    v12 = 1;
  else
    v12 = 0xFFFFFFFFLL;
  objc_msgSend(v10, "waveformColorForColorType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:withColor:](self, "generatePreviewFromThumbnail:width:orientation:withColor:", v8, v5, v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5 withColor:(id)a6
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithAlignmentRectInsets:", 0.0, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v7, "waveformGapWidth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previewFilenameExtension
{
  return CFSTR("png");
}

- (void)savePreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[CKMediaObject fileManager](self, "fileManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = v7;
      v13 = v8;
      im_perform_with_task_assertion();

    }
  }

}

void __55__CKAudioMediaObject_savePreview_toURL_forOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CKCreatePNGRepresentationFromUIImageFilterTypeNone(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CKFreeSpaceWriteDataToURL(v2, *(void **)(a1 + 40), 1);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "%@ preview saved to %@.", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    _CKLog();

}

- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAudioMediaObject;
  -[CKMediaObject savedPreviewFromURL:forOrientation:](&v8, sel_savedPreviewFromURL_forOrientation_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithAlignmentRectInsets:", 0.0, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v5, "waveformGapWidth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)generateThumbnailForWidth:(double)a3
{
  return -[CKAudioMediaObject generateThumbnailForWidth:withColor:](self, "generateThumbnailForWidth:withColor:", 0, a3);
}

- (id)generateThumbnailForWidth:(double)a3 withColor:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v6 = a4;
  v7 = -[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess");
  -[CKAudioMediaObject powerLevels](self, "powerLevels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_4;
  +[CKAudioMediaObject generateThumbnailForWidth:color:powerLevels:fileURL:](CKAudioMediaObject, "generateThumbnailForWidth:color:powerLevels:fileURL:", v6, v8, 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRichAudioMessagesEnabled");

    -[CKAudioMediaObject powerLevelsFromMetadata](self, "powerLevelsFromMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[CKAudioMediaObject generateThumbnailForPowerLevelsFromMetadata:color:](CKAudioMediaObject, "generateThumbnailForPowerLevelsFromMetadata:color:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
LABEL_4:
    -[CKMediaObject fileURL](self, "fileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAudioMediaObject generateThumbnailForWidth:color:powerLevels:fileURL:](CKAudioMediaObject, "generateThumbnailForWidth:color:powerLevels:fileURL:", v6, v8, v12, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  }

  return v9;
}

+ (void)normalizedPowerLevelsForPowerValues:(id)a3 powerLevelsCount:(unint64_t)a4 powerLevels:(double *)a5
{
  id v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  float v23;
  float v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  double *v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = (uint64_t)&v29;
  MEMORY[0x1E0C80A78](v7);
  v8 = (char *)&v29 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, 8 * a4);
  bzero(a5, 8 * a4);
  bzero(v8, 8 * a4);
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v32)
  {
    v9 = 0;
    v10 = 0;
    v31 = *(_QWORD *)v34;
    v11 = a4 - 1;
    v30 = a5 + 1;
    do
    {
      v12 = 0;
      v13 = v10 * a4;
      v14 = v9;
      do
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v12), "floatValue");
        v16 = v15;
        v17 = objc_msgSend(v7, "count");
        if (v10 * a4 / v17 >= v11)
          v9 = a4 - 1;
        else
          v9 = v10 * a4 / v17;
        v18 = *(_QWORD *)&v8[8 * v9];
        v19 = v16 * v16 + a5[v9] * a5[v9] * (double)v18;
        v20 = v18 + 1;
        v21 = sqrt(v19 / (double)v20);
        a5[v9] = v21;
        if (v9 != v14 && v14 + 1 < v9)
        {
          v23 = a5[v14];
          v24 = v21 - v23;
          v25 = (float)((float)(v24 / (float)(v9 - v14)) + v23);
          v26 = v13 / v17;
          if (v13 / v17 >= v11)
            v26 = a4 - 1;
          v27 = ~v14 + v26;
          v28 = &v30[v14];
          do
          {
            *v28++ = v25;
            --v27;
          }
          while (v27);
        }
        *(_QWORD *)&v8[8 * v9] = v20;
        ++v10;
        ++v12;
        v13 += a4;
        v14 = v9;
      }
      while (v12 != v32);
      v32 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v32);
  }

}

+ (id)generateThumbnailForWidth:(double)a3 color:(id)a4 powerLevels:(id)a5 fileURL:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (unint64_t)(a3 / (double)(unint64_t)objc_msgSend(v12, "waveformPowerLevelWidthIncrement"));

  if (v13)
  {
    bzero((char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v13);
    if (objc_msgSend(v10, "count"))
    {
      +[CKAudioMediaObject normalizedPowerLevelsForPowerValues:powerLevelsCount:powerLevels:](CKAudioMediaObject, "normalizedPowerLevelsForPowerValues:powerLevelsCount:powerLevels:", v10, v13, (char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    }
    else if (!v11
           || !CKWaveformPowerLevelsForFileURL(v11, (char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0), v13))
    {
      v13 = 0;
      goto LABEL_8;
    }
    +[CKAudioMediaObject generateWaveformFromPowerLevels:powerLevelsCount:color:](CKAudioMediaObject, "generateWaveformFromPowerLevels:powerLevelsCount:color:", (char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0), v13, v9);
    v13 = objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return (id)v13;
}

+ (id)generateThumbnailForPowerLevelsFromMetadata:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char *v8;
  uint64_t i;
  void *v10;
  float v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = objc_msgSend(v5, "count");
    v8 = (char *)v14 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, 8 * v7);
    bzero(v8, 8 * v7);
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(v5, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "floatValue");
        *(double *)&v8[8 * i] = v11;

      }
    }
    +[CKAudioMediaObject generateWaveformFromPowerLevels:powerLevelsCount:color:](CKAudioMediaObject, "generateWaveformFromPowerLevels:powerLevelsCount:color:", v8, v7, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)generateWaveformFromPowerLevels:(double *)a3 powerLevelsCount:(unint64_t)a4 color:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double *v11;
  unint64_t v12;
  double v13;
  double v14;
  double *v15;
  unint64_t v16;
  void *v17;

  v7 = a5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "waveformMinLinearPowerLevel");
  v10 = v9;

  if (a4)
  {
    v11 = a3;
    v12 = a4;
    v13 = 1.0;
    do
    {
      if (*v11 < 1.0)
        v10 = 0.0;
      v14 = fmax(*v11 - v10, 0.0);
      *v11++ = v14;
      if (v13 < v14)
        v13 = v14;
      --v12;
    }
    while (v12);
    v15 = a3;
    v16 = a4;
    do
    {
      *v15 = *v15 / v13;
      ++v15;
      --v16;
    }
    while (v16);
  }
  CKWaveformWithPowerLevels((uint64_t)a3, a4, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)supportsPreviewMetadata
{
  return 1;
}

- (NSString)previewMetadataFilenameExtension
{
  return (NSString *)CFSTR("plist");
}

- (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D38CA0], 4, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  id v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "writeToURL:atomically:", v8, 1);
    if ((v9 & 1) == 0)
    {
      if (_IMWillLog())
      {
        v12 = v8;
        _IMAlwaysLog();
      }
      if (a5)
      {
        v10 = 9;
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D38CA0], v10, 0, v12);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    _IMWarn();
    v9 = 0;
    if (a5)
    {
      v10 = 13;
      goto LABEL_9;
    }
  }

  return v9;
}

- (BOOL)shouldBeQuickLooked
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  objc_super *v8;
  CKAudioMediaObject *v9;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRichAudioMessagesEnabled");

  if (v4)
  {
    -[CKMediaObject messageContext](self, "messageContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAudioMessage");

    if ((v6 & 1) != 0)
      return 0;
    v10.receiver = self;
    v8 = &v10;
  }
  else
  {
    v9 = self;
    v8 = (objc_super *)&v9;
  }
  v8->super_class = (Class)CKAudioMediaObject;
  return -[objc_super shouldBeQuickLooked](v8, sel_shouldBeQuickLooked, v9);
}

- (id)previewItemTitle
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[CKMediaObject filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Audio Message.caf")))
  {

  }
  else
  {
    -[CKMediaObject filename](self, "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Audio Message.amr"));

    if (!v5)
    {
      v7 = 0;
      return v7;
    }
  }
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUMMARY_AUDIO_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generatePlaceholderThumbnailForWidth:(double)a3
{
  return -[CKAudioMediaObject generatePlaceholderThumbnailForWidth:withColor:](self, "generatePlaceholderThumbnailForWidth:withColor:", 0, a3);
}

- (id)generatePlaceholderThumbnailForWidth:(double)a3 withColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGImage *v17;
  CGImageRef v18;
  CGImageRef v19;
  void *v20;
  _QWORD block[4];
  id v23;
  CGRect v24;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CKAudioMediaObject_generatePlaceholderThumbnailForWidth_withColor___block_invoke;
  block[3] = &unk_1E274A208;
  v6 = v5;
  v23 = v6;
  if (generatePlaceholderThumbnailForWidth_withColor__once != -1)
    dispatch_once(&generatePlaceholderThumbnailForWidth_withColor__once, block);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 / (double)(unint64_t)objc_msgSend(v7, "waveformPowerLevelWidthIncrement");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "waveformHeight");
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (double)(unint64_t)objc_msgSend(v12, "waveformPowerLevelWidthIncrement");

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;

  v17 = (CGImage *)objc_msgSend((id)generatePlaceholderThumbnailForWidth_withColor__sMaxWidthPlaceholderWaveform, "CGImage");
  v24.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v24.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v24.size.width = (double)(unint64_t)v8 * v13 * v16;
  v24.size.height = v11 * v16;
  v18 = CGImageCreateWithImageInRect(v17, v24);
  if (v18)
  {
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v18, 0, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v19);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __69__CKAudioMediaObject_generatePlaceholderThumbnailForWidth_withColor___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "waveformMaxPowerLevelsCount");

  v4 = (char *)v7 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * v3);
  bzero(v4, 8 * v3);
  CKWaveformWithPowerLevels((uint64_t)v4, v3, *(void **)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)generatePlaceholderThumbnailForWidth_withColor__sMaxWidthPlaceholderWaveform;
  generatePlaceholderThumbnailForWidth_withColor__sMaxWidthPlaceholderWaveform = v5;

}

- (NSURL)temporaryFileURL
{
  return self->_temporaryFileURL;
}

- (void)setTemporaryFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryFileURL, a3);
}

- (int64_t)totalPacketsCount
{
  return self->_totalPacketsCount;
}

- (void)setTotalPacketsCount:(int64_t)a3
{
  self->_totalPacketsCount = a3;
}

- (NSArray)powerLevelsFromMetadata
{
  return self->_powerLevelsFromMetadata;
}

- (void)setPowerLevelsFromMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_powerLevelsFromMetadata, a3);
}

- (double)durationFromMetadata
{
  return self->_durationFromMetadata;
}

- (void)setDurationFromMetadata:(double)a3
{
  self->_durationFromMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLevelsFromMetadata, 0);
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

@end
