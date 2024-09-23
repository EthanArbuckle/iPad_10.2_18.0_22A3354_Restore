@implementation CKEmojiImageMediaObject

+ (id)UTITypes
{
  return &unk_1E286F358;
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
    v6 = CFSTR("SUMMARY_STICKER_TYPE");
  else
    v6 = CFSTR("SUMMARY_STICKER_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)shouldShadePreview
{
  return 0;
}

- (id)previewDispatchCache
{
  return +[CKPreviewDispatchCache genmojiPreviewCache](CKPreviewDispatchCache, "genmojiPreviewCache");
}

- (id)inProcessGenerateAdaptiveImageGlyph
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CKEmojiImageMediaObject inProcessGenerateAdaptiveImageGlyph].cold.3();

  -[CKMediaObject data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC1260]), "initWithImageContent:", v4);
    v6 = v5;
    if (v5)
    {
      v6 = v5;
      v7 = v6;
    }
    else
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CKEmojiImageMediaObject inProcessGenerateAdaptiveImageGlyph].cold.2();

      v7 = 0;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKEmojiImageMediaObject inProcessGenerateAdaptiveImageGlyph].cold.1();
    v7 = 0;
  }

  return v7;
}

- (id)outOfProcessGenerateAdaptiveImageGlyph
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph].cold.4();

  -[CKMediaObject fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject(Display) senderContext](self, "senderContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D396A8], "generateEmojiImageAssetFromSourceURL:senderContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "imageData");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v8, "length"))
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC1260]), "initWithImageContent:", v8);
      v10 = v9;
      if (v9)
      {
        v10 = v9;
        v11 = v10;
      }
      else
      {
        IMLogHandleForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph].cold.3();

        v11 = 0;
      }
    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph].cold.2();
      v11 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph].cold.1();
    v11 = 0;
  }

  return v11;
}

- (id)strikeImageAtPreviewSize:(double)a3 scaleFactor:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  -[CKMediaObject adaptiveImageGlyph](self, "adaptiveImageGlyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v10[0] = 0;
    v10[1] = 0;
    v8 = (void *)objc_msgSend(v6, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", v11, v10, a3, a3, a4);
    if (v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", v8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)stickerDetailsTitleText
{
  void *v2;
  void *v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKStickerDetailViewController localizedAppNameForStickerDetailsFromFileTransfer:](CKStickerDetailViewController, "localizedAppNameForStickerDetailsFromFileTransfer:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)stickerDetailsSubtitleText
{
  void *v3;
  void *v4;

  if (-[CKEmojiImageMediaObject hasGenmojiBundleID](self, "hasGenmojiBundleID"))
  {
    -[CKMediaObject transfer](self, "transfer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adaptiveImageGlyphContentDescription");
  }
  else
  {
    -[CKImageMediaObject sticker](self, "sticker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSDate)stickerDetailsDateAdded
{
  return 0;
}

- (IMSticker)saveableSticker
{
  return (IMSticker *)+[CKUtilities saveableStickerForMediaObject:](CKUtilities, "saveableStickerForMediaObject:", self);
}

- (BOOL)canDeleteFromStickerDetails
{
  return 0;
}

- (BOOL)hasGenmojiBundleID
{
  void *v2;
  BOOL v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CKStickerDetailViewController isGenmojiBundleIDFromFileTransfer:](CKStickerDetailViewController, "isGenmojiBundleIDFromFileTransfer:", v2);

  return v3;
}

- (id)stickerDetailsPreview
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  -[CKMediaObject adaptiveImageGlyph](self, "adaptiveImageGlyph");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "previewMaxWidth");
    v5 = v4;

    v9[0] = 0;
    v9[1] = 0;
    v8[0] = 0;
    v8[1] = 0;
    v6 = (void *)objc_msgSend(v2, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", v9, v8, v5, v5, 3.0);
    if (v6)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", v6);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)inProcessGenerateAdaptiveImageGlyph
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "In process generating adaptive image glyph", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)outOfProcessGenerateAdaptiveImageGlyph
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "OOP generating adaptive image glyph", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
