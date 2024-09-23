@implementation IMEmojiSticker

+ (id)stickerPackID
{
  void *v2;
  void *v3;

  IMStickersExtensionIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix((uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4
{
  return (IMEmojiSticker *)MEMORY[0x1E0DE7D20](self, sel_initWithEmojiString_stickerPackID_fileURL_moodCategory_);
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5
{
  return (IMEmojiSticker *)MEMORY[0x1E0DE7D20](self, sel_initWithEmojiString_stickerPackID_fileURL_moodCategory_);
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerID:(id)a4 stickerPackID:(id)a5 fileURL:(id)a6 accessibilityLabel:(id)a7 moodCategory:(id)a8 stickerName:(id)a9 textToSpeechName:(id)a10
{
  id v16;
  IMEmojiSticker *v17;
  uint64_t v18;
  NSString *emojiString;
  objc_super v21;

  v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IMEmojiSticker;
  v17 = -[IMSticker initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:](&v21, sel_initWithStickerID_stickerPackID_fileURL_accessibilityLabel_moodCategory_stickerName_textToSpeechName_, a4, a5, a6, a7, a8, a9, a10);
  if (v17)
  {
    v18 = objc_msgSend(v16, "copy");
    emojiString = v17->_emojiString;
    v17->_emojiString = (NSString *)v18;

  }
  return v17;
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 moodCategory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  IMEmojiSticker *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    objc_msgSend(v10, "__im_emojiStickerID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[IMEmojiSticker tempFileURLForStickerID:](IMEmojiSticker, "tempFileURLForStickerID:", v14);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v40 = 0;
    v41 = (id *)&v40;
    v42 = 0x3032000000;
    v43 = sub_19E2475CC;
    v44 = sub_19E2474C4;
    v45 = 0;
    v34 = 0;
    v35 = (id *)&v34;
    v36 = 0x3032000000;
    v37 = sub_19E2475CC;
    v38 = sub_19E2474C4;
    v39 = 0;
    v28 = 0;
    v29 = (id *)&v28;
    v30 = 0x3032000000;
    v31 = sub_19E2475CC;
    v32 = sub_19E2474C4;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = sub_19E2475CC;
    v26 = sub_19E2474C4;
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localeIdentifier");
    CEMCreateEmojiLocaleData();

    objc_msgSend(v10, "length");
    v21 = MEMORY[0x1E0C809B0];
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
    v16 = (void *)v23[5];
    if (v16)
    {
      if (!v41[5])
        objc_storeStrong(v41 + 5, v16);
      if (!v35[5])
        objc_storeStrong(v35 + 5, v41[5]);
      if (!v29[5])
        objc_storeStrong(v29 + 5, v35[5]);
      v17 = (void *)v23[5];
      objc_msgSend(v17, "__im_emojiStickerID");
      v18 = objc_claimAutoreleasedReturnValue();
      self = -[IMEmojiSticker initWithEmojiString:stickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:](self, "initWithEmojiString:stickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:", v17, v18, v11, v12, v29[5], v13, v41[5], v35[5], v21, 3221225472, sub_19E28B250, &unk_1E3FB62A0, &v22, &v34, &v40, &v28);
      v19 = self;
    }
    else
    {
      IMLogHandleForCategory("IMEmojiSticker");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_19E36C314((uint64_t)v10, v18);
      v19 = 0;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    IMLogHandleForCategory("IMEmojiSticker");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19E36C2D4(v14);
    v19 = 0;
  }

  return v19;
}

+ (id)tempFileURLForStickerID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  IMSafeTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMEmojiSticker;
  if (-[IMSticker isEqual:](&v9, sel_isEqual_, v4))
  {
    -[IMEmojiSticker emojiString](self, "emojiString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emojiString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMEmojiSticker emojiString](self, "emojiString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker stickerGUID](self, "stickerGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker stickerPackGUID](self, "stickerPackGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker accessibilityLabel](self, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker moodCategory](self, "moodCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker stickerName](self, "stickerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker textToSpeechName](self, "textToSpeechName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithEmojiString:stickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (BOOL)isEmojiSticker
{
  return 1;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  -[IMSticker fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("NO");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSticker fileURL](self, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

    if (v8)
      v4 = CFSTR("YES");
  }
  v21 = v4;

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[IMEmojiSticker emojiString](self, "emojiString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker stickerName](self, "stickerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker stickerGUID](self, "stickerGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker stickerPackGUID](self, "stickerPackGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker fileURL](self, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker accessibilityLabel](self, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker moodCategory](self, "moodCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker attributionInfo](self, "attributionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker ballonBundleID](self, "ballonBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSticker textToSpeechName](self, "textToSpeechName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<IMEmojiSticker: %@,  Name: %@, guid %@, packID %@, fileURL %@, fileExists: %@, accessibilityLabel %@, moodCategory %@, attributionInfo: %@, balloonBundleID: %@, textToSpeechName: %@, self %p>"), v19, v9, v10, v11, v12, v21, v13, v14, v15, v16, v17, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (NSString)defaultEmojiStickerPackID
{
  return (NSString *)CFSTR("com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension");
}

- (id)tapbackEquivalent
{
  void *v2;
  IMEmojiTapback *v3;

  -[IMEmojiSticker emojiString](self, "emojiString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[IMEmojiTapback initWithEmoji:isRemoved:]([IMEmojiTapback alloc], "initWithEmoji:isRemoved:", v2, 0);

  return v3;
}

- (NSString)emojiString
{
  return self->_emojiString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiString, 0);
}

@end
