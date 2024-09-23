@implementation IMSticker

- (BOOL)isEmojiSticker
{
  return 0;
}

- (IMSticker)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "IMSticker. Calling init directly is not supported", v5, 2u);
    }

  }
  return 0;
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 moodCategory:(id)a7 stickerName:(id)a8
{
  return -[IMSticker initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:](self, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:", a3, a4, a5, a6, a7, a8);
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 moodCategory:(id)a7 stickerName:(id)a8 effectType:(int64_t)a9
{
  return -[IMSticker initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:effectType:textToSpeechName:](self, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:effectType:textToSpeechName:", a3, a4, a5, a6, a7, a9, a8);
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 moodCategory:(id)a7 stickerName:(id)a8 textToSpeechName:(id)a9
{
  return -[IMSticker initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:effectType:textToSpeechName:](self, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:effectType:textToSpeechName:", a3, a4, a5, a6, a7, a8, -1, a9);
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 moodCategory:(id)a7 stickerName:(id)a8 effectType:(int64_t)a9 textToSpeechName:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  IMSticker *v23;
  uint64_t v24;
  NSString *stickerGUID;
  uint64_t v26;
  NSString *stickerPackGUID;
  uint64_t v28;
  NSURL *fileURL;
  uint64_t v30;
  NSString *accessibilityLabel;
  uint64_t v32;
  NSString *moodCategory;
  uint64_t v34;
  NSString *stickerName;
  uint64_t v36;
  NSString *textToSpeechName;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSString *uniqueID;
  NSString *externalURI;
  NSArray *representations;
  IMSticker *v51;
  NSObject *v52;
  id v54;
  objc_super v55;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  if (v16)
  {
    v55.receiver = self;
    v55.super_class = (Class)IMSticker;
    v23 = -[IMSticker init](&v55, sel_init);
    if (v23)
    {
      v24 = objc_msgSend(v16, "copy");
      stickerGUID = v23->_stickerGUID;
      v23->_stickerGUID = (NSString *)v24;

      v26 = objc_msgSend(v17, "copy");
      stickerPackGUID = v23->_stickerPackGUID;
      v23->_stickerPackGUID = (NSString *)v26;

      v28 = objc_msgSend(v18, "copy");
      fileURL = v23->_fileURL;
      v23->_fileURL = (NSURL *)v28;

      v30 = objc_msgSend(v19, "copy");
      accessibilityLabel = v23->_accessibilityLabel;
      v23->_accessibilityLabel = (NSString *)v30;

      v32 = objc_msgSend(v20, "copy");
      moodCategory = v23->_moodCategory;
      v23->_moodCategory = (NSString *)v32;

      v34 = objc_msgSend(v21, "copy");
      stickerName = v23->_stickerName;
      v23->_stickerName = (NSString *)v34;

      v36 = objc_msgSend(v22, "copy");
      textToSpeechName = v23->_textToSpeechName;
      v23->_textToSpeechName = (NSString *)v36;

      v38 = (void *)MEMORY[0x1E0CB3940];
      -[IMSticker stickerPackGUID](v23, "stickerPackGUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMSticker stickerGUID](v23, "stickerGUID");
      v54 = v16;
      v40 = v22;
      v41 = v21;
      v42 = v20;
      v43 = v19;
      v44 = v18;
      v45 = v17;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@.%@"), v39, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      uniqueID = v23->_uniqueID;
      v23->_uniqueID = (NSString *)v47;

      v17 = v45;
      v18 = v44;
      v19 = v43;
      v20 = v42;
      v21 = v41;
      v22 = v40;
      v16 = v54;

      externalURI = v23->_externalURI;
      v23->_externalURI = 0;

      representations = v23->_representations;
      v23->_representations = 0;

      v23->_stickerEffectType = -1;
    }
    self = v23;
    v51 = self;
  }
  else
  {
    IMLogHandleForCategory("IMSticker");
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      sub_19E36D680();

    v51 = 0;
  }

  return v51;
}

- (IMSticker)initWithStickerIdentifier:(id)a3 stickerPackID:(id)a4 representations:(id)a5 effectType:(int64_t)a6 initialFrameIndex:(unint64_t)a7 externalURI:(id)a8 stickerName:(id)a9 accessibilityLabel:(id)a10 metadata:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  IMSticker *v22;
  uint64_t v23;
  NSString *stickerGUID;
  uint64_t v25;
  NSString *stickerPackGUID;
  NSURL *fileURL;
  uint64_t v28;
  NSString *accessibilityLabel;
  NSString *moodCategory;
  uint64_t v31;
  NSString *stickerName;
  NSString *textToSpeechName;
  uint64_t v34;
  NSString *uniqueID;
  uint64_t v36;
  NSString *externalURI;
  uint64_t v38;
  NSData *metadata;
  objc_super v43;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v43.receiver = self;
  v43.super_class = (Class)IMSticker;
  v22 = -[IMSticker init](&v43, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    stickerGUID = v22->_stickerGUID;
    v22->_stickerGUID = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    stickerPackGUID = v22->_stickerPackGUID;
    v22->_stickerPackGUID = (NSString *)v25;

    fileURL = v22->_fileURL;
    v22->_fileURL = 0;

    v28 = objc_msgSend(v20, "copy");
    accessibilityLabel = v22->_accessibilityLabel;
    v22->_accessibilityLabel = (NSString *)v28;

    moodCategory = v22->_moodCategory;
    v22->_moodCategory = 0;

    v31 = objc_msgSend(v19, "copy");
    stickerName = v22->_stickerName;
    v22->_stickerName = (NSString *)v31;

    textToSpeechName = v22->_textToSpeechName;
    v22->_textToSpeechName = 0;

    -[IMSticker stickerGUID](v22, "stickerGUID");
    v34 = objc_claimAutoreleasedReturnValue();
    uniqueID = v22->_uniqueID;
    v22->_uniqueID = (NSString *)v34;

    v36 = objc_msgSend(v18, "copy");
    externalURI = v22->_externalURI;
    v22->_externalURI = (NSString *)v36;

    objc_storeStrong((id *)&v22->_representations, a5);
    v22->_stickerEffectType = a6;
    v22->_initialFrameIndex = a7;
    v38 = objc_msgSend(v21, "copy");
    metadata = v22->_metadata;
    v22->_metadata = (NSData *)v38;

  }
  return v22;
}

- (IMSticker)initWithAdaptiveImageGlyphFromUnknownSource:(id)a3
{
  id v5;
  IMSticker *v6;
  void *v7;
  uint64_t v8;
  NSString *stickerGUID;
  NSString *stickerPackGUID;
  void *v11;
  uint64_t v12;
  NSURL *fileURL;
  void *v14;
  uint64_t v15;
  NSString *adaptiveImageGlyphContentIdentifier;
  void *v17;
  uint64_t v18;
  NSString *adaptiveImageGlyphContentDescription;
  void *v20;
  uint64_t v21;
  NSString *accessibilityLabel;
  NSString *moodCategory;
  void *v24;
  uint64_t v25;
  NSString *stickerName;
  void *v27;
  uint64_t v28;
  NSString *textToSpeechName;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *uniqueID;
  NSString *externalURI;
  NSArray *representations;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IMSticker;
  v6 = -[IMSticker init](&v38, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "contentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    stickerGUID = v6->_stickerGUID;
    v6->_stickerGUID = (NSString *)v8;

    stickerPackGUID = v6->_stickerPackGUID;
    v6->_stickerPackGUID = (NSString *)CFSTR("com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension");

    +[IMSticker saveAdaptiveImageGlyphToTemporaryFile:](IMSticker, "saveAdaptiveImageGlyphToTemporaryFile:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v12;

    objc_msgSend(v5, "contentIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    adaptiveImageGlyphContentIdentifier = v6->_adaptiveImageGlyphContentIdentifier;
    v6->_adaptiveImageGlyphContentIdentifier = (NSString *)v15;

    objc_msgSend(v5, "contentDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    adaptiveImageGlyphContentDescription = v6->_adaptiveImageGlyphContentDescription;
    v6->_adaptiveImageGlyphContentDescription = (NSString *)v18;

    objc_storeStrong((id *)&v6->_cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly, a3);
    objc_msgSend(v5, "contentDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    accessibilityLabel = v6->_accessibilityLabel;
    v6->_accessibilityLabel = (NSString *)v21;

    moodCategory = v6->_moodCategory;
    v6->_moodCategory = 0;

    objc_msgSend(v5, "contentDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    stickerName = v6->_stickerName;
    v6->_stickerName = (NSString *)v25;

    objc_msgSend(v5, "contentDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    textToSpeechName = v6->_textToSpeechName;
    v6->_textToSpeechName = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E0CB3940];
    -[IMSticker stickerPackGUID](v6, "stickerPackGUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker stickerGUID](v6, "stickerGUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@.%@"), v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    uniqueID = v6->_uniqueID;
    v6->_uniqueID = (NSString *)v33;

    externalURI = v6->_externalURI;
    v6->_externalURI = 0;

    representations = v6->_representations;
    v6->_representations = 0;

    v6->_stickerEffectType = -1;
  }

  return v6;
}

+ (id)saveAdaptiveImageGlyphToTemporaryFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v3 = a3;
  objc_msgSend(v3, "contentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "im_temporaryFileURLForAdaptiveImageGlyphWithContentIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fileExistsAtPath:", v7))
  {
    IMLogHandleForCategory("IMSticker");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Temporary file already exists for adaptive image glyph content identifier, not re-saving image.", v13, 2u);
    }
  }
  else
  {
    objc_msgSend(v7, "stringByDeletingLastPathComponent");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "__im_makeDirectoriesInPath:mode:", v8, 448) & 1) == 0)
    {
      IMLogHandleForCategory("IMSticker");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_19E36D6D8();

    }
    objc_msgSend(v3, "imageContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "writeToURL:atomically:", v6, 1) & 1) == 0)
    {
      IMLogHandleForCategory("IMSticker");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_19E36D6AC();

    }
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IMSticker Name: %@, guid %@, packID %@, fileURL %@, accessibilityLabel %@, moodCategory %@, attributionInfo: %@, balloonBundleID: %@, textToSpeechName: %@, externalURI: %@, self %p>"), self->_stickerName, self->_stickerGUID, self->_stickerPackGUID, self->_fileURL, self->_accessibilityLabel, self->_moodCategory, self->_attributionInfo, self->_ballonBundleID, self->_textToSpeechName, self->_externalURI, self);
}

- (BOOL)isEqual:(id)a3
{
  IMSticker *v4;
  IMSticker *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  int v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  unint64_t v60;
  int v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;

  v4 = (IMSticker *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[IMSticker stickerGUID](self, "stickerGUID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSticker stickerGUID](v5, "stickerGUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v9 = v7;
        v10 = v9;
        if (v8 == v9)
        {

        }
        else
        {
          v11 = 0;
          v12 = v9;
          v13 = v8;
          if (!v8 || !v9)
            goto LABEL_79;
          v14 = objc_msgSend(v8, "isEqualToString:", v9);

          if (!v14)
          {
            v11 = 0;
LABEL_80:

            goto LABEL_81;
          }
        }
        -[IMSticker stickerPackGUID](self, "stickerPackGUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSticker stickerPackGUID](v5, "stickerPackGUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v15;
        v17 = v16;
        v12 = v17;
        if (v13 == v17)
        {

        }
        else
        {
          v11 = 0;
          v18 = v17;
          v19 = v13;
          if (!v13 || !v17)
            goto LABEL_78;
          v20 = objc_msgSend(v13, "isEqualToString:", v17);

          if (!v20)
          {
            v11 = 0;
LABEL_79:

            goto LABEL_80;
          }
        }
        -[IMSticker stickerName](self, "stickerName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSticker stickerName](v5, "stickerName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v21;
        v23 = v22;
        v18 = v23;
        if (v19 == v23)
        {

        }
        else
        {
          v11 = 0;
          v24 = v23;
          v25 = v19;
          if (!v19 || !v23)
            goto LABEL_77;
          v26 = objc_msgSend(v19, "isEqualToString:", v23);

          if (!v26)
          {
            v11 = 0;
LABEL_78:

            goto LABEL_79;
          }
        }
        -[IMSticker textToSpeechName](self, "textToSpeechName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSticker textToSpeechName](v5, "textToSpeechName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v27;
        v29 = v28;
        v74 = v29;
        v73 = v18;
        if (v25 != v29)
        {
          v11 = 0;
          if (v25)
          {
            v30 = v29;
            v31 = v25;
            if (v29)
            {
              v32 = objc_msgSend(v25, "isEqualToString:", v29);

              if (!v32)
              {
                v11 = 0;
LABEL_76:
                v24 = v74;
                v18 = v73;
LABEL_77:

                goto LABEL_78;
              }
LABEL_30:
              v72 = v25;
              -[IMSticker moodCategory](self, "moodCategory");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMSticker moodCategory](v5, "moodCategory");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v33;
              v36 = v34;
              v70 = v36;
              v71 = v35;
              if (v35 == v36)
              {

              }
              else
              {
                v11 = 0;
                if (!v35)
                {
                  v37 = v36;
                  v25 = v72;
                  goto LABEL_73;
                }
                v37 = v36;
                v25 = v72;
                if (!v36)
                {
LABEL_73:

                  goto LABEL_74;
                }
                v38 = objc_msgSend(v35, "isEqualToString:", v36);

                if (!v38)
                {
                  v11 = 0;
                  v25 = v72;
LABEL_74:
                  v30 = v70;
                  v31 = v71;
                  goto LABEL_75;
                }
              }
              -[IMSticker accessibilityLabel](self, "accessibilityLabel");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMSticker accessibilityLabel](v5, "accessibilityLabel");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v39;
              v41 = v40;
              v68 = v35;
              v69 = v41;
              if (v35 != v41)
              {
                v11 = 0;
                if (v35)
                {
                  v42 = v41;
                  v25 = v72;
                  if (v41)
                  {
                    v43 = objc_msgSend(v35, "isEqualToString:", v41);

                    if (!v43)
                    {
                      v11 = 0;
                      v25 = v72;
                      v37 = v69;
                      goto LABEL_73;
                    }
LABEL_43:
                    -[IMSticker fileURL](self, "fileURL");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMSticker fileURL](v5, "fileURL");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = v44;
                    v47 = v45;
                    v66 = v47;
                    v67 = v46;
                    if (v46 != v47)
                    {
                      v11 = 0;
                      if (v46)
                      {
                        v48 = v47;
                        v25 = v72;
                        if (v47)
                        {
                          v49 = objc_msgSend(v46, "isEqual:", v47);

                          if (!v49)
                          {
                            v11 = 0;
                            v25 = v72;
LABEL_71:
                            v42 = v66;
                            v35 = v67;
                            goto LABEL_72;
                          }
LABEL_50:
                          -[IMSticker representations](self, "representations");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          -[IMSticker representations](v5, "representations");
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = v50;
                          v52 = v51;
                          v65 = v52;
                          if (v46 == v52)
                          {

                          }
                          else
                          {
                            v11 = 0;
                            if (!v46)
                            {
                              v53 = v52;
                              v54 = 0;
                              goto LABEL_68;
                            }
                            v53 = v52;
                            v54 = v46;
                            if (!v52)
                            {
LABEL_68:

                              goto LABEL_69;
                            }
                            v55 = objc_msgSend(v46, "isEqual:", v52);

                            if (!v55)
                            {
                              v11 = 0;
LABEL_69:
                              v25 = v72;
                              v48 = v65;
                              goto LABEL_70;
                            }
                          }
                          -[IMSticker externalURI](self, "externalURI");
                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                          -[IMSticker externalURI](v5, "externalURI");
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          v54 = v56;
                          v58 = v57;
                          v59 = v58;
                          if (v54 == v58)
                          {
                            v63 = v58;

                            v64 = v54;
                          }
                          else
                          {
                            if (!v54 || !v58)
                            {

                              v53 = v59;
                              v11 = 0;
                              goto LABEL_68;
                            }
                            v62 = objc_msgSend(v54, "isEqualToString:", v58);
                            v63 = v59;

                            v64 = v54;
                            if (!v62)
                            {
                              v11 = 0;
LABEL_65:
                              v53 = v63;
                              v54 = v64;
                              goto LABEL_68;
                            }
                          }
                          v60 = -[IMSticker initialFrameIndex](self, "initialFrameIndex");
                          v11 = v60 == -[IMSticker initialFrameIndex](v5, "initialFrameIndex");
                          goto LABEL_65;
                        }
                      }
                      else
                      {
                        v48 = v47;
                        v25 = v72;
                      }
LABEL_70:

                      goto LABEL_71;
                    }

                    goto LABEL_50;
                  }
                }
                else
                {
                  v42 = v41;
                  v25 = v72;
                }
LABEL_72:

                v35 = v68;
                v37 = v69;
                goto LABEL_73;
              }

              goto LABEL_43;
            }
          }
          else
          {
            v30 = v29;
            v31 = 0;
          }
LABEL_75:

          goto LABEL_76;
        }

        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_81:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IMSticker uniqueID](self, "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (IMSticker)initWithStickerPropertyDictionary:(id)a3 stickerPackID:(id)a4 stickerPackBundlePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  IMSticker *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8
    && v9
    && (objc_msgSend(v8, "objectForKey:", CFSTR("IMStickerIdentifier")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10)
    && v11)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("IMStickerIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject im_lastPathComponent](v12, "im_lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v10, "stringByAppendingPathComponent:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fileURLWithPath:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stickerEffectType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v27 = (void *)v16;
      v28 = v13;
      v26 = v17;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = objc_msgSend(v17, "integerValue");
      else
        v18 = -1;
      objc_msgSend(v8, "objectForKey:", CFSTR("IMStickerIdentifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("IMStickerAccessibilityLabel"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("IMStickerMoodCategory"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("IMStickerName"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[IMSticker initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:effectType:](self, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:effectType:", v21, v9, v27, v22, v23, v24, v18);

      v19 = self;
      v13 = v28;
    }
    else
    {
      IMLogHandleForCategory("IMSticker");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_19E36D704((uint64_t)v12, v20);

      v19 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory("IMSticker");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v10;
      _os_log_error_impl(&dword_19E239000, v12, OS_LOG_TYPE_ERROR, "initWithStickerPropertyDictionary called with invalid parameters stickerPropertyDictionary %@ stickerPackGUID %@ stickerPackBundlePath %@", buf, 0x20u);
    }
    v19 = 0;
  }

  return v19;
}

- (id)getSafeExternalURI
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  if (-[NSString hasPrefix:](self->_externalURI, "hasPrefix:", CFSTR("sticker:///")))
  {
    -[NSString componentsSeparatedByString:](self->_externalURI, "componentsSeparatedByString:", CFSTR("/"));
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isValidUUID = TRUE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      if (objc_msgSend(v5, "count") == 1)
      {
        objc_msgSend(v5, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByReplacingOccurrencesOfString:withString:](self->_externalURI, "stringByReplacingOccurrencesOfString:withString:", v8, &stru_1E3FBBA48);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = self->_externalURI;
      }
    }
    else
    {
      IMLogHandleForCategory("IMSticker");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "This externalURI format was not accounted for at time of writing this function. Returning empty string.", buf, 2u);
      }

      v7 = &stru_1E3FBBA48;
    }

  }
  else
  {
    IMLogHandleForCategory("IMSticker");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "externalURI did not start with 'sticker:///'. Returning empty string.", v10, 2u);
    }
    v7 = &stru_1E3FBBA48;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[IMSticker representations](self, "representations", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc((Class)objc_opt_class());
  -[IMSticker stickerGUID](self, "stickerGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker stickerPackGUID](self, "stickerPackGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[IMSticker representations](self, "representations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[IMSticker stickerEffectType](self, "stickerEffectType");
    v10 = -[IMSticker initialFrameIndex](self, "initialFrameIndex");
    -[IMSticker externalURI](self, "externalURI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker stickerName](self, "stickerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker accessibilityLabel](self, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker metadata](self, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v5, "initWithStickerIdentifier:stickerPackID:representations:effectType:initialFrameIndex:externalURI:stickerName:accessibilityLabel:metadata:", v6, v7, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    -[IMSticker fileURL](self, "fileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker accessibilityLabel](self, "accessibilityLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker moodCategory](self, "moodCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker stickerName](self, "stickerName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker textToSpeechName](self, "textToSpeechName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v5, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:", v6, v7, v16, v17, v18, v19, v20);

    objc_msgSend(v15, "setStickerEffectType:", -[IMSticker stickerEffectType](self, "stickerEffectType"));
  }
  v21 = v15;

  return v21;
}

+ (id)userInfoDictionaryWithLayoutIntent:(unint64_t)a3 parentPreviewWidth:(double)a4 xScalar:(double)a5 yScalar:(double)a6 scale:(double)a7 rotation:(double)a8 initialFrameIndex:(unint64_t)a9 stickerPositionVersion:(unint64_t)a10 externalURI:(id)a11
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v31;
  _QWORD v32[10];
  _QWORD v33[12];

  v33[10] = *MEMORY[0x1E0C80C00];
  v18 = (void *)MEMORY[0x1E0CB3940];
  v31 = a11;
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%tu"), a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tu"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.8f"), *(_QWORD *)&a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.8f"), *(_QWORD *)&a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.8f"), *(_QWORD *)&a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.8f"), *(_QWORD *)&a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.8f"), *(_QWORD *)&a8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("sli");
  v32[1] = CFSTR("sai");
  v33[0] = v29;
  v33[1] = v19;
  v32[2] = CFSTR("spw");
  v32[3] = CFSTR("sxs");
  v33[2] = v20;
  v33[3] = v21;
  v32[4] = CFSTR("sys");
  v32[5] = CFSTR("ssa");
  v33[4] = v22;
  v33[5] = v23;
  v32[6] = CFSTR("sro");
  v32[7] = CFSTR("safi");
  v33[6] = v25;
  v33[7] = v24;
  v32[8] = CFSTR("spv");
  v32[9] = CFSTR("suri");
  v33[8] = v26;
  v33[9] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)userInfoDictionaryWithLayoutIntent:(unint64_t)a3 parentPreviewWidth:(double)a4 xScalar:(double)a5 yScalar:(double)a6 scale:(double)a7 rotation:(double)a8 initialFrameIndex:(unint64_t)a9 externalURI:(id)a10
{
  return (id)MEMORY[0x1E0DE7D20](IMSticker, sel_userInfoDictionaryWithLayoutIntent_parentPreviewWidth_xScalar_yScalar_scale_rotation_initialFrameIndex_stickerPositionVersion_externalURI_);
}

+ (id)userInfoDictionaryWithExternalURI:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = CFSTR("suri");
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory("IMSticker");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_19E36D778();

    v5 = 0;
  }

  return v5;
}

+ (id)userInfoDictionaryWithGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_userInfoDictionaryWithLayoutIntent_parentPreviewWidth_xScalar_yScalar_scale_rotation_initialFrameIndex_externalURI_);
}

+ (IMAssociatedMessageGeometryDescriptor)geometryDescriptorFromUserInfoDictionary:(SEL)a3
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  IMAssociatedMessageGeometryDescriptor *result;
  id v30;

  v5 = a4;
  *(_OWORD *)&retstr->var0 = IMAssociatedMessageGeometryDescriptorZero;
  *(_OWORD *)&retstr->var2 = unk_19E381400;
  *(_OWORD *)&retstr->var4 = xmmword_19E381410;
  retstr->var6 = 0.0;
  if (v5)
  {
    v30 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sli"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sli"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

    }
    else
    {
      v8 = 0;
    }
    retstr->var0 = v8;

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sli"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
    v11 = 0.0;
    if (v9)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sli"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v11 = v13;

    }
    retstr->var2 = v11;

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sxs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sxs"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v10 = v16;

    }
    retstr->var3 = v10;

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sys"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0.0;
    v19 = 0.0;
    if (v17)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sys"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v19 = v21;

    }
    retstr->var4 = v19;

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ssa"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ssa"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v18 = v24;

    }
    retstr->var5 = v18;

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sro"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sro"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

    }
    else
    {
      v28 = 0.0;
    }
    retstr->var6 = v28;

    v5 = v30;
  }

  return result;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)stickerGUID
{
  return self->_stickerGUID;
}

- (NSString)stickerPackGUID
{
  return self->_stickerPackGUID;
}

- (void)setStickerPackGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->_adaptiveImageGlyphContentIdentifier;
}

- (void)setAdaptiveImageGlyphContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->_adaptiveImageGlyphContentDescription;
}

- (void)setAdaptiveImageGlyphContentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)moodCategory
{
  return self->_moodCategory;
}

- (void)setMoodCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (void)setStickerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)textToSpeechName
{
  return self->_textToSpeechName;
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)animatedImageCacheURLFromExtension
{
  return self->_animatedImageCacheURLFromExtension;
}

- (void)setAnimatedImageCacheURLFromExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_recipe, a3);
}

- (NSString)ballonBundleID
{
  return self->_ballonBundleID;
}

- (void)setBallonBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSAdaptiveImageGlyph)cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly
{
  return self->_cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly;
}

- (void)setCachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(int64_t)a3
{
  self->_stickerEffectType = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unint64_t)initialFrameIndex
{
  return self->_initialFrameIndex;
}

- (void)setInitialFrameIndex:(unint64_t)a3
{
  self->_initialFrameIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_ballonBundleID, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_animatedImageCacheURLFromExtension, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_textToSpeechName, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_moodCategory, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_stickerPackGUID, 0);
  objc_storeStrong((id *)&self->_stickerGUID, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
