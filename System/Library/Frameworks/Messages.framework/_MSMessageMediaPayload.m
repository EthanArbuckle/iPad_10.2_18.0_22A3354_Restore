@implementation _MSMessageMediaPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)convertToStickerWithExtensionIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  _MSMessageMediaPayload *v54;
  _MSMessageMediaPayload *v55;
  NSObject *v56;
  void *v57;
  __CFDictionary *Mutable;
  NSObject *v59;
  void *v60;
  void *v61;
  unint64_t v63;
  void *v64;
  void *v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[_MSMessageMediaPayload isSticker](self, "isSticker"))
  {
    v10 = 0;
    goto LABEL_48;
  }
  -[_MSMessageMediaPayload stickerRepresentations](self, "stickerRepresentations");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[_MSMessageMediaPayload stickerStoreIdentifier](self, "stickerStoreIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[_MSMessageMediaPayload mediaURL](self, "mediaURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IMSharedHelperMD5HashOfFileAtPath();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-sticker"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MSMessageMediaPayload mediaURL](self, "mediaURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathExtension");
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v15, "stringByAppendingPathExtension:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "im_randomTemporaryFileURLWithFileName:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = (void *)v17;
    if (v20
      && (-[_MSMessageMediaPayload mediaURL](self, "mediaURL"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          v21))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MSMessageMediaPayload mediaURL](self, "mediaURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      v24 = objc_msgSend(v22, "copyItemAtURL:toURL:error:", v23, v20, &v66);
      v25 = v66;

      if (!v24 || !v25)
      {
        v28 = v25;
        goto LABEL_19;
      }
      ms_defaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_MSMessageMediaPayload convertToStickerWithExtensionIdentifier:].cold.3();
    }
    else
    {
      ms_defaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[_MSMessageMediaPayload mediaURL](self, "mediaURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v68 = v20;
        v69 = 2112;
        v70 = v27;
        _os_log_impl(&dword_1DB1A9000, v26, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: Cannot copy sticker file: %@ to %@, because either the source or destination file URL is nil. This may be expected if the original sticker did not have a file URL", buf, 0x16u);

      }
      v25 = 0;
    }
    v28 = v25;

LABEL_19:
    v29 = v15;
    v30 = v4;
    v31 = v4;
    if (+[_MSPresentationState isRunningInCameraContext](_MSPresentationState, "isRunningInCameraContext"))
    {
      -[_MSMessageMediaPayload mediaFilename](self, "mediaFilename");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        -[_MSMessageMediaPayload mediaURL](self, "mediaURL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v32 = 0;
    }
    v34 = objc_alloc(MEMORY[0x1E0D39B18]);
    -[_MSMessageMediaPayload accessibilityLabel](self, "accessibilityLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v34, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:", v29, v31, v20, v35, 0, v32);

    -[_MSMessageMediaPayload stickerRepresentations](self, "stickerRepresentations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[_MSMessageMediaPayload stickerRepresentations](self, "stickerRepresentations");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRepresentations:", v37);

    }
    -[_MSMessageMediaPayload externalURI](self, "externalURI");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[_MSMessageMediaPayload externalURI](self, "externalURI");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExternalURI:", v39);

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isStickersAppEnabled");

    if (v41 && -[_MSMessageMediaPayload stickerEffectType](self, "stickerEffectType"))
      objc_msgSend(v10, "setStickerEffectType:", -[_MSMessageMediaPayload stickerEffectType](self, "stickerEffectType"));

    v4 = v30;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isStickersAppEnabled");

  if (v9)
    v63 = -[_MSMessageMediaPayload stickerEffectType](self, "stickerEffectType");
  else
    v63 = -1;
  v42 = objc_alloc(MEMORY[0x1E0D39B18]);
  -[_MSMessageMediaPayload stickerStoreIdentifier](self, "stickerStoreIdentifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "UUIDString");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSMessageMediaPayload stickerRepresentations](self, "stickerRepresentations");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[_MSMessageMediaPayload initialFrameIndex](self, "initialFrameIndex");
  -[_MSMessageMediaPayload externalURI](self, "externalURI");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSMessageMediaPayload stickerName](self, "stickerName");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSMessageMediaPayload accessibilityLabel](self, "accessibilityLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSMessageMediaPayload stickerMetadata](self, "stickerMetadata");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v42, "initWithStickerIdentifier:stickerPackID:representations:effectType:initialFrameIndex:externalURI:stickerName:accessibilityLabel:metadata:", v43, v4, v44, v63, v45, v46, v47, v48, v49);

LABEL_33:
  IMBalloonExtensionIDWithSuffix();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v4, "isEqualToString:", v50);

  if (v51)
  {
    -[_MSMessageMediaPayload animatedImageCacheURL](self, "animatedImageCacheURL");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnimatedImageCacheURLFromExtension:", v52);

  }
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "balloonPluginForBundleID:", v4);
  v54 = (_MSMessageMediaPayload *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v55 = v54;
  }
  else
  {
    ms_defaultLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      -[_MSMessageMediaPayload convertToStickerWithExtensionIdentifier:].cold.2();

    v55 = self;
  }
  -[_MSMessageMediaPayload attributionInfo](v55, "attributionInfo");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (__CFDictionary *)objc_msgSend(v57, "mutableCopy");

  if (!Mutable)
  {
    ms_defaultLog();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      -[_MSMessageMediaPayload convertToStickerWithExtensionIdentifier:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    Mutable = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  objc_msgSend(v10, "accessibilityLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D37F10], v60);

  v61 = (void *)-[__CFDictionary copy](Mutable, "copy");
  objc_msgSend(v10, "setAttributionInfo:", v61);

LABEL_48:
  return v10;
}

- (_MSMessageMediaPayload)initWithSticker:(id)a3
{
  id v4;
  _MSMessageMediaPayload *v5;
  uint64_t v6;
  NSURL *mediaURL;
  uint64_t v8;
  NSString *accessibilityLabel;
  uint64_t v10;
  NSData *data;
  uint64_t v12;
  NSString *stickerPackGUID;
  uint64_t v14;
  NSArray *stickerRepresentations;
  uint64_t v16;
  NSString *externalURI;
  uint64_t v18;
  NSUUID *stickerStoreIdentifier;
  uint64_t v20;
  NSDictionary *attributionInfo;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSURL *animatedImageCacheURL;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  NSDictionary *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSDictionary *v44;
  NSObject *v46;
  objc_super v47;
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_MSMessageMediaPayload;
  v5 = -[_MSMessageMediaPayload init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "imageFileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    mediaURL = v5->_mediaURL;
    v5->_mediaURL = (NSURL *)v6;

    objc_msgSend(v4, "localizedDescription");
    v8 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;

    v5->_isSticker = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "data");
      v10 = objc_claimAutoreleasedReturnValue();
      data = v5->_data;
      v5->_data = (NSData *)v10;

    }
    objc_msgSend(v4, "stickerPackGUID");
    v12 = objc_claimAutoreleasedReturnValue();
    stickerPackGUID = v5->_stickerPackGUID;
    v5->_stickerPackGUID = (NSString *)v12;

    objc_msgSend(v4, "representations");
    v14 = objc_claimAutoreleasedReturnValue();
    stickerRepresentations = v5->_stickerRepresentations;
    v5->_stickerRepresentations = (NSArray *)v14;

    objc_msgSend(v4, "externalURI");
    v16 = objc_claimAutoreleasedReturnValue();
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v16;

    objc_msgSend(v4, "stickerIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    stickerStoreIdentifier = v5->_stickerStoreIdentifier;
    v5->_stickerStoreIdentifier = (NSUUID *)v18;

    v5->_stickerEffectType = objc_msgSend(v4, "stickerEffectType");
    objc_msgSend(v4, "attributionInfo");
    v20 = objc_claimAutoreleasedReturnValue();
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v20;

    if (!v5->_attributionInfo)
    {
      ms_defaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[_MSMessageMediaPayload initWithSticker:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    }
    objc_msgSend(v4, "animatedImageCacheURL");
    v30 = objc_claimAutoreleasedReturnValue();
    animatedImageCacheURL = v5->_animatedImageCacheURL;
    v5->_animatedImageCacheURL = (NSURL *)v30;

    v32 = *MEMORY[0x1E0D37F30];
    -[NSDictionary objectForKey:](v5->_attributionInfo, "objectForKey:", *MEMORY[0x1E0D37F30]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      if (-[_MSMessageMediaPayload uriIsMemoji](v5, "uriIsMemoji"))
      {
        ms_defaultLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB1A9000, v34, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be Memoji. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        v35 = (id *)MEMORY[0x1E0D37560];
LABEL_13:
        v36 = *v35;
        if (!v36)
          goto LABEL_25;
        goto LABEL_21;
      }
      if (!IMIsRunningIniMessageAppExtension())
      {
        if (!-[_MSMessageMediaPayload uriIsUltraExtension](v5, "uriIsUltraExtension"))
          goto LABEL_25;
        ms_defaultLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB1A9000, v46, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be StickersUltraExtension. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        v35 = (id *)MEMORY[0x1E0D374D0];
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bundleIdentifier");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        ms_defaultLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v36;
          _os_log_impl(&dword_1DB1A9000, v38, OS_LOG_TYPE_DEFAULT, "MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID from 3rd party extension: %@", buf, 0xCu);
        }

        v39 = v36;
      }

      if (v36)
      {
LABEL_21:
        v40 = v5->_attributionInfo;
        if (v40)
        {
          v41 = (void *)-[NSDictionary mutableCopy](v40, "mutableCopy");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v42 = v41;
        objc_msgSend(v41, "setObject:forKey:", v36, v32);
        v43 = objc_msgSend(v42, "copy");
        v44 = v5->_attributionInfo;
        v5->_attributionInfo = (NSDictionary *)v43;

      }
    }
  }
LABEL_25:

  return v5;
}

- (_MSMessageMediaPayload)initWithIMSticker:(id)a3
{
  id v4;
  _MSMessageMediaPayload *v5;
  uint64_t v6;
  NSURL *mediaURL;
  uint64_t v8;
  NSString *accessibilityLabel;
  uint64_t v10;
  NSString *stickerPackGUID;
  uint64_t v12;
  NSArray *stickerRepresentations;
  uint64_t v14;
  NSString *externalURI;
  id v16;
  void *v17;
  uint64_t v18;
  NSUUID *stickerStoreIdentifier;
  void *v20;
  uint64_t v21;
  NSDictionary *attributionInfo;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  NSURL *animatedImageCacheURL;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  id *v38;
  id v39;
  void *v40;
  NSObject *v41;
  id v42;
  NSDictionary *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSDictionary *v47;
  NSObject *v49;
  objc_super v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_MSMessageMediaPayload;
  v5 = -[_MSMessageMediaPayload init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "fileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    mediaURL = v5->_mediaURL;
    v5->_mediaURL = (NSURL *)v6;

    objc_msgSend(v4, "accessibilityLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;

    v5->_isSticker = 1;
    objc_msgSend(v4, "stickerPackGUID");
    v10 = objc_claimAutoreleasedReturnValue();
    stickerPackGUID = v5->_stickerPackGUID;
    v5->_stickerPackGUID = (NSString *)v10;

    objc_msgSend(v4, "representations");
    v12 = objc_claimAutoreleasedReturnValue();
    stickerRepresentations = v5->_stickerRepresentations;
    v5->_stickerRepresentations = (NSArray *)v12;

    objc_msgSend(v4, "externalURI");
    v14 = objc_claimAutoreleasedReturnValue();
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v14;

    v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "uniqueID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithUUIDString:", v17);
    stickerStoreIdentifier = v5->_stickerStoreIdentifier;
    v5->_stickerStoreIdentifier = (NSUUID *)v18;

    v5->_stickerEffectType = objc_msgSend(v4, "stickerEffectType");
    objc_msgSend(v4, "attributionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v21;

    if (!v5->_attributionInfo)
    {
      ms_defaultLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[_MSMessageMediaPayload initWithSticker:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    }
    objc_msgSend(v4, "ballonBundleID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsString:", *MEMORY[0x1E0D375D0]);

    if ((v32 & 1) == 0)
    {
      objc_msgSend(v4, "animatedImageCacheURLFromExtension");
      v33 = objc_claimAutoreleasedReturnValue();
      animatedImageCacheURL = v5->_animatedImageCacheURL;
      v5->_animatedImageCacheURL = (NSURL *)v33;

    }
    v35 = *MEMORY[0x1E0D37F30];
    -[NSDictionary objectForKey:](v5->_attributionInfo, "objectForKey:", *MEMORY[0x1E0D37F30]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      if (-[_MSMessageMediaPayload uriIsMemoji](v5, "uriIsMemoji"))
      {
        ms_defaultLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB1A9000, v37, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be Memoji. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        v38 = (id *)MEMORY[0x1E0D37560];
LABEL_13:
        v39 = *v38;
        if (!v39)
          goto LABEL_25;
        goto LABEL_21;
      }
      if (!IMIsRunningIniMessageAppExtension())
      {
        if (!-[_MSMessageMediaPayload uriIsUltraExtension](v5, "uriIsUltraExtension"))
          goto LABEL_25;
        ms_defaultLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB1A9000, v49, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be StickersUltraExtension. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        v38 = (id *)MEMORY[0x1E0D374D0];
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bundleIdentifier");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        ms_defaultLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v39;
          _os_log_impl(&dword_1DB1A9000, v41, OS_LOG_TYPE_DEFAULT, "MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID from 3rd party extension: %@", buf, 0xCu);
        }

        v42 = v39;
      }

      if (v39)
      {
LABEL_21:
        v43 = v5->_attributionInfo;
        if (v43)
        {
          v44 = (void *)-[NSDictionary mutableCopy](v43, "mutableCopy");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v45 = v44;
        objc_msgSend(v44, "setObject:forKey:", v39, v35);
        v46 = objc_msgSend(v45, "copy");
        v47 = v5->_attributionInfo;
        v5->_attributionInfo = (NSDictionary *)v46;

      }
    }
  }
LABEL_25:

  return v5;
}

- (BOOL)uriIsMemoji
{
  NSString *externalURI;

  externalURI = self->_externalURI;
  return externalURI && -[NSString hasPrefix:](externalURI, "hasPrefix:", CFSTR("sticker:///memoji"));
}

- (BOOL)uriIsUltraExtension
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_externalURI)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = objc_msgSend(&unk_1EA267A20, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(&unk_1EA267A20);
          if (-[NSString hasPrefix:](self->_externalURI, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)))
          {
            LOBYTE(v3) = 1;
            return v3;
          }
        }
        v4 = objc_msgSend(&unk_1EA267A20, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        LOBYTE(v3) = 0;
        if (v4)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (_MSMessageMediaPayload)initWithCoder:(id)a3
{
  id v4;
  _MSMessageMediaPayload *v5;
  uint64_t v6;
  NSString *mediaType;
  uint64_t v8;
  NSData *mediaData;
  uint64_t v10;
  NSString *mediaFilename;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSData *data;
  uint64_t v16;
  NSData *generativePlaygroundRecipeData;
  uint64_t v18;
  NSString *accessibilityLabel;
  uint64_t v20;
  NSString *stickerPackGUID;
  void *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGSize v28;
  void *v29;
  Class v30;
  uint64_t v31;
  NSArray *stickerRepresentations;
  uint64_t v33;
  NSString *externalURI;
  uint64_t v35;
  NSUUID *stickerStoreIdentifier;
  uint64_t v37;
  NSString *stickerName;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  NSDictionary *attributionInfo;
  uint64_t v46;
  uint64_t v47;
  NSURL *animatedImageCacheURL;
  NSObject *v49;
  id v51;
  objc_super v52;
  uint8_t buf[4];
  id v54;
  _QWORD v55[7];

  v55[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)_MSMessageMediaPayload;
  v5 = -[_MSMessageMediaPayload init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v6 = objc_claimAutoreleasedReturnValue();
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaData"));
    v8 = objc_claimAutoreleasedReturnValue();
    mediaData = v5->_mediaData;
    v5->_mediaData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaFilename"));
    v10 = objc_claimAutoreleasedReturnValue();
    mediaFilename = v5->_mediaFilename;
    v5->_mediaFilename = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v12 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v14 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gpRecipeData"));
    v16 = objc_claimAutoreleasedReturnValue();
    generativePlaygroundRecipeData = v5->_generativePlaygroundRecipeData;
    v5->_generativePlaygroundRecipeData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityLabel"));
    v18 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stickerPackGUID"));
    v20 = objc_claimAutoreleasedReturnValue();
    stickerPackGUID = v5->_stickerPackGUID;
    v5->_stickerPackGUID = (NSString *)v20;

    v5->_isSticker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSticker"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceFrame"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "CGRectValue");
      v5->_sourceFrame.origin.x = v24;
      v5->_sourceFrame.origin.y = v25;
      v5->_sourceFrame.size.width = v26;
      v5->_sourceFrame.size.height = v27;
    }
    else
    {
      v28 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v5->_sourceFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v5->_sourceFrame.size = v28;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialFrameIndex"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_initialFrameIndex = objc_msgSend(v29, "unsignedIntegerValue");
    v30 = NSClassFromString(CFSTR("_UIStickerRepresentation"));
    if (v30)
    {
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v30, CFSTR("stickerRepresentations"));
      v31 = objc_claimAutoreleasedReturnValue();
      stickerRepresentations = v5->_stickerRepresentations;
      v5->_stickerRepresentations = (NSArray *)v31;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalURI"));
    v33 = objc_claimAutoreleasedReturnValue();
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stickerStoreIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    stickerStoreIdentifier = v5->_stickerStoreIdentifier;
    v5->_stickerStoreIdentifier = (NSUUID *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stickerName"));
    v37 = objc_claimAutoreleasedReturnValue();
    stickerName = v5->_stickerName;
    v5->_stickerName = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributionInfoData"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_stickerEffectType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("stickerEffectType"));
    v40 = (void *)MEMORY[0x1E0C99E60];
    v55[0] = objc_opt_class();
    v55[1] = objc_opt_class();
    v55[2] = objc_opt_class();
    v55[3] = objc_opt_class();
    v55[4] = objc_opt_class();
    v55[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v51 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v42, v39, &v51);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v51;
      attributionInfo = v5->_attributionInfo;
      v5->_attributionInfo = (NSDictionary *)v43;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v42, v39, 0);
      v46 = objc_claimAutoreleasedReturnValue();
      v44 = 0;
      attributionInfo = v5->_attributionInfo;
      v5->_attributionInfo = (NSDictionary *)v46;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("animatedImageCacheURL"));
    v47 = objc_claimAutoreleasedReturnValue();
    animatedImageCacheURL = v5->_animatedImageCacheURL;
    v5->_animatedImageCacheURL = (NSURL *)v47;

    if (v44)
    {
      ms_defaultLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v44;
        _os_log_impl(&dword_1DB1A9000, v49, OS_LOG_TYPE_DEFAULT, "strict-decoding 011 exception/error after unarchivedObjectOfClasses: [%@]", buf, 0xCu);
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  UIImage *image;
  void *v9;
  id v10;
  NSURL *mediaURL;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = self->_mediaData;
  v5 = self->_mediaType;
  v6 = self->_mediaFilename;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
    goto LABEL_11;
  image = self->_image;
  if (image)
  {
    -[UIImage __ms_PNGData](image, "__ms_PNGData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)*MEMORY[0x1E0CA5C10];
  }
  else
  {
    mediaURL = self->_mediaURL;
    if (!mediaURL)
    {
LABEL_11:
      v9 = v4;
      v10 = v5;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", mediaURL, 8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSURL __ms_UTI](self->_mediaURL, "__ms_UTI");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[NSURL lastPathComponent](self->_mediaURL, "lastPathComponent");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_12:
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("mediaType"));
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("mediaData"));
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("mediaFilename"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_generativePlaygroundRecipeData, CFSTR("gpRecipeData"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_accessibilityLabel, CFSTR("accessibilityLabel"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_stickerPackGUID, CFSTR("stickerPackGUID"));
  objc_msgSend(v15, "encodeBool:forKey:", self->_isSticker, CFSTR("isSticker"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_sourceFrame.origin.x, self->_sourceFrame.origin.y, self->_sourceFrame.size.width, self->_sourceFrame.size.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("sourceFrame"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_initialFrameIndex);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("initialFrameIndex"));

  objc_msgSend(v15, "encodeObject:forKey:", self->_stickerRepresentations, CFSTR("stickerRepresentations"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_externalURI, CFSTR("externalURI"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_stickerStoreIdentifier, CFSTR("stickerStoreIdentifier"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_stickerName, CFSTR("stickerName"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_animatedImageCacheURL, CFSTR("animatedImageCacheURL"));
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_attributionInfo, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("attributionInfoData"));

  objc_msgSend(v15, "encodeInteger:forKey:", self->_stickerEffectType, CFSTR("stickerEffectType"));
}

- (_MSMessageMediaPayload)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MSMessageMediaPayload;
  return -[_MSMessageMediaPayload init](&v3, sel_init);
}

- (void)setMediaURL:(id)a3
{
  NSURL *v4;
  NSString *mediaType;
  NSData *mediaData;
  NSURL *mediaURL;

  v4 = (NSURL *)a3;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  mediaURL = self->_mediaURL;
  self->_mediaURL = v4;

}

- (NSURL)mediaURL
{
  NSURL *mediaURL;
  void *v4;
  NSURL *v5;
  NSURL *v6;

  mediaURL = self->_mediaURL;
  if (!mediaURL)
  {
    if (self->_mediaData && self->_mediaType)
    {
      +[_MSTempFileManager sharedInstance](_MSTempFileManager, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeTemporaryFileWithData:type:", self->_mediaData, self->_mediaType);
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v6 = self->_mediaURL;
      self->_mediaURL = v5;

      mediaURL = self->_mediaURL;
    }
    else
    {
      mediaURL = 0;
    }
  }
  return mediaURL;
}

- (void)setImage:(id)a3
{
  UIImage *v4;
  NSString *mediaType;
  NSData *mediaData;
  UIImage *image;

  v4 = (UIImage *)a3;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  image = self->_image;
  self->_image = v4;

}

- (UIImage)image
{
  const __CFString *mediaType;
  UIImage *v5;
  UIImage *image;

  if (!self->_image)
  {
    if (self->_mediaData)
    {
      mediaType = (const __CFString *)self->_mediaType;
      if (mediaType)
      {
        if (UTTypeConformsTo(mediaType, (CFStringRef)*MEMORY[0x1E0CA5B90]))
        {
          objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", self->_mediaData);
          v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
          image = self->_image;
          self->_image = v5;

        }
      }
    }
  }
  return self->_image;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)&unk_1EA267A38;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)&unk_1EA267A50;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;

  v6 = (void (**)(id, void *, _QWORD))a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.sticker.mediaPayload")))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 8675309, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v7);
  }

  return 0;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, a3, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (a5 && !v6)
  {
    *a5 = objc_retainAutorelease(v7);
    ms_defaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_MSMessageMediaPayload objectWithItemProviderData:typeIdentifier:error:].cold.1();

  }
  return v6;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)mediaFilename
{
  return self->_mediaFilename;
}

- (void)setMediaFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (NSString)stickerPackGUID
{
  return self->_stickerPackGUID;
}

- (void)setStickerPackGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)stickerPositionVersion
{
  return self->_stickerPositionVersion;
}

- (void)setStickerPositionVersion:(unint64_t)a3
{
  self->_stickerPositionVersion = a3;
}

- (NSData)generativePlaygroundRecipeData
{
  return self->_generativePlaygroundRecipeData;
}

- (void)setGenerativePlaygroundRecipeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CGRect)sourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceFrame.origin.x;
  y = self->_sourceFrame.origin.y;
  width = self->_sourceFrame.size.width;
  height = self->_sourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (unint64_t)initialFrameIndex
{
  return self->_initialFrameIndex;
}

- (void)setInitialFrameIndex:(unint64_t)a3
{
  self->_initialFrameIndex = a3;
}

- (NSArray)stickerRepresentations
{
  return self->_stickerRepresentations;
}

- (void)setStickerRepresentations:(id)a3
{
  objc_storeStrong((id *)&self->_stickerRepresentations, a3);
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSUUID)stickerStoreIdentifier
{
  return self->_stickerStoreIdentifier;
}

- (void)setStickerStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (void)setStickerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)stickerMetadata
{
  return self->_stickerMetadata;
}

- (void)setStickerMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSURL)animatedImageCacheURL
{
  return self->_animatedImageCacheURL;
}

- (void)setAnimatedImageCacheURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->_stickerMetadata, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_stickerStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_stickerRepresentations, 0);
  objc_storeStrong((id *)&self->_generativePlaygroundRecipeData, 0);
  objc_storeStrong((id *)&self->_stickerPackGUID, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mediaFilename, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (void)convertToStickerWithExtensionIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DB1A9000, v1, OS_LOG_TYPE_ERROR, "IMStickerFromPayload: could not generate attribution info for '%@' even after attempting to fall back to using the info on the media payload: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)convertToStickerWithExtensionIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB1A9000, v0, v1, "IMStickerFromPayload: unable to find plugin for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)convertToStickerWithExtensionIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB1A9000, v0, v1, "Error copying sticker file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithSticker:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB1A9000, a1, a3, "_MSMessageMediaPayload: Missing sticker attributionInfo in initWithSticker", a5, a6, a7, a8, 0);
}

+ (void)objectWithItemProviderData:typeIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB1A9000, v0, v1, "Decoding _MSMessageMediaPayload for sticker failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
