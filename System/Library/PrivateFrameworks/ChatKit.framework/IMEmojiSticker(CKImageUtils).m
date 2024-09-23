@implementation IMEmojiSticker(CKImageUtils)

- (id)generateImageForFontSize:()CKImageUtils imageGenerationScale:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "emojiString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__ck_generateImageForFontSize:imageGenerationScale:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)generateImage
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;

  objc_msgSend(a1, "emojiString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emojiStickerImageGenerationFontSize");
  v4 = v3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stickerScreenScale");
  objc_msgSend(v1, "__ck_generateImageForFontSize:imageGenerationScale:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)writeGeneratedImageToFileURL:()CKImageUtils error:
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;

  v6 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emojiStickerImageGenerationFontSize");
  v9 = v8;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stickerScreenScale");
  v12 = objc_msgSend(a1, "writeGeneratedImageToFileURL:fontSize:imageGenerationScale:error:", v6, a4, v9, v11);

  return v12;
}

- (uint64_t)writeGeneratedImageToFileURL:()CKImageUtils fontSize:imageGenerationScale:error:
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  if (v10)
  {
    -[NSObject generateImageForFontSize:imageGenerationScale:](a1, "generateImageForFontSize:imageGenerationScale:", a2, a3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v18 = 0;
      v13 = -[NSObject __ck_writePNGToURL:error:](v11, "__ck_writePNGToURL:error:", v10, &v18);
      v14 = v18;
      v15 = v14;
      if ((v13 & 1) != 0)
      {
        IMLogHandleForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          v20 = (uint64_t)a2;
          v21 = 2048;
          v22 = (uint64_t)a3;
          v23 = 2112;
          v24 = v10;
          v25 = 2112;
          v26 = a1;
          _os_log_debug_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_DEBUG, "Wrote image (size: %ld, scale: %ld) to %@ for sticker: %@", buf, 0x2Au);
        }
      }
      else
      {
        if (a6)
          *a6 = objc_retainAutorelease(v14);
        IMLogHandleForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134219010;
          v20 = (uint64_t)a2;
          v21 = 2048;
          v22 = (uint64_t)a3;
          v23 = 2112;
          v24 = v10;
          v25 = 2112;
          v26 = v15;
          v27 = 2112;
          v28 = a1;
          _os_log_error_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_ERROR, "Writing image (size: %ld, scale: %ld) to %@ FAILED with error: %@ for sticker: %@", buf, 0x34u);
        }
      }

    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[IMEmojiSticker(CKImageUtils) writeGeneratedImageToFileURL:fontSize:imageGenerationScale:error:].cold.2();
      v13 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[IMEmojiSticker(CKImageUtils) writeGeneratedImageToFileURL:fontSize:imageGenerationScale:error:].cold.1();
    v13 = 0;
  }

  return v13;
}

- (uint64_t)prepareToSend
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v8;

  objc_msgSend(a1, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v3 = objc_msgSend(a1, "writeGeneratedImageToFileURL:error:", v2, &v8);
  v4 = v8;

  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[IMEmojiSticker(CKImageUtils) prepareToSend].cold.1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[IMEmojiSticker(CKImageUtils) prepareToSend].cold.2();
  }

  return v3;
}

- (id)image
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
    objc_msgSend(a1, "prepareToSend");
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EE2E3930;
  objc_msgSendSuper2(&v7, sel_image);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CKEmojiStickerLabel)stickerView
{
  CKEmojiStickerLabel *v2;
  CKEmojiStickerLabel *v3;
  void *v4;

  v2 = [CKEmojiStickerLabel alloc];
  v3 = -[CKEmojiStickerLabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(a1, "emojiString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEmojiStickerLabel setText:](v3, "setText:", v4);

  -[CKEmojiStickerLabel sizeToFit](v3, "sizeToFit");
  return v3;
}

- (void)writeGeneratedImageToFileURL:()CKImageUtils fontSize:imageGenerationScale:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Can't write image to nil url for emoji sticker: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)writeGeneratedImageToFileURL:()CKImageUtils fontSize:imageGenerationScale:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to generate image for emoji sticker: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)prepareToSend
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_18DFCD000, v1, OS_LOG_TYPE_ERROR, "Preparing to send failed for Emoji Sticker: %@, with error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
