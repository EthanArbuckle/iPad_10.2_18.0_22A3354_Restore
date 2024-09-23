@implementation IMSticker(CKUtils)

- (id)initWithUISticker:()CKUtils adaptiveImageGlyph:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "representations");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "effectType");
  objc_msgSend(v6, "externalURI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D37F30]);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (id)v13;
    v15 = a1;
    v16 = v11;
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pluginForIdentifier:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

      v11 = v16;
      a1 = v15;
      goto LABEL_12;
    }

    v12 = 0;
    v11 = v16;
    a1 = v15;
  }
  switch(objc_msgSend(v6, "_ck_stickerType"))
  {
    case 0:
    case 1:
    case 2:
      v19 = (id *)MEMORY[0x1E0D374D0];
      goto LABEL_11;
    case 3:
      v19 = (id *)MEMORY[0x1E0D37560];
      goto LABEL_11;
    case 4:
      v19 = (id *)MEMORY[0x1E0D37590];
      goto LABEL_11;
    case 5:
      v19 = (id *)MEMORY[0x1E0D375B8];
LABEL_11:
      v14 = *v19;
      break;
    default:
      v14 = 0;
      break;
  }
LABEL_12:
  v20 = (id)objc_msgSend(a1, "initWithStickerIdentifier:stickerPackID:representations:effectType:initialFrameIndex:externalURI:stickerName:accessibilityLabel:metadata:", v31, v14, v29, v8, 0, v9, v10, v11, v30);
  objc_msgSend(v20, "setAttributionInfo:", v12);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D39B18], "saveAdaptiveImageGlyphToTemporaryFile:", v7);
    v28 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v20, "setFileURL:", v22);

    objc_msgSend(v20, "setRepresentations:", 0);
    objc_msgSend(v7, "contentIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v20, "setAdaptiveImageGlyphContentIdentifier:", v24);

    objc_msgSend(v7, "contentDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v20, "setAdaptiveImageGlyphContentDescription:", v26);

    objc_msgSend(v20, "setCachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly:", v7);
    v11 = v28;
  }

  return v20;
}

- (id)uiSticker
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  uint64_t v20;

  objc_msgSend(a1, "stickerGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "representations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(a1, "stickerEffectType");
  objc_msgSend(a1, "externalURI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stickerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adaptiveImageGlyphContentDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "adaptiveImageGlyphContentDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(a1, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)MEMORY[0x193FF3C18](CFSTR("MSSticker"), CFSTR("Messages")), "_stickerRepresentationsForImageFileURL:", v11);
    v19 = v7;
    v12 = v6;
    v13 = v5;
    v14 = v4;
    v15 = v2;
    v16 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v16;
    v2 = v15;
    v4 = v14;
    v5 = v13;
    v6 = v12;
    v7 = v19;
  }
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setIdentifier:", v2);
  objc_msgSend(v17, "setRepresentations:", v3);
  objc_msgSend(v17, "setAttributionInfo:", v5);
  objc_msgSend(v17, "setEffectType:", v20);
  objc_msgSend(v17, "setName:", v6);
  objc_msgSend(v17, "setExternalURI:", v4);
  objc_msgSend(v17, "setSearchText:", v9);
  objc_msgSend(v17, "setAccessibilityName:", v10);
  objc_msgSend(v17, "setAccessibilityLabel:", v7);
  objc_msgSend(v17, "setMetadata:", v8);

  return v17;
}

+ (id)stickerWithMSMessageMediaPayload:()CKUtils
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend(v3, "attributionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D37F30];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D37F30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "containsString:", CFSTR("com.apple.messages.MSMessageExtensionBalloonPlugin:")))
    {
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject teamIdentifier](v9, "teamIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("0000000000");
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    IMBalloonExtensionIDWithTeamAndSuffix();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "balloonPluginForBundleID:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    IMLogHandleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v18;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Using plugin identifier for sticker drop: %@", (uint8_t *)&v26, 0xCu);

    }
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[IMSticker(CKUtils) stickerWithMSMessageMediaPayload:].cold.1(v5, v9, v20);
    v6 = 0;
    v16 = 0;
  }

  objc_msgSend(v16, "identifier");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = &stru_1E276D870;
  if (v21)
    v23 = (__CFString *)v21;
  v24 = v23;

  objc_msgSend(v3, "convertToStickerWithExtensionIdentifier:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)image
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(a1, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "representations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v7 = 0;
      return v7;
    }
    v11 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(a1, "representations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithData:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (CKImageData)imageData
{
  void *v2;
  void *v3;
  CKImageData *v4;
  void *v5;
  CKImageData *v6;
  void *v7;
  void *v8;
  void *v9;
  CKImageData *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [CKImageData alloc];
    objc_msgSend(a1, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKImageData initWithURL:](v4, "initWithURL:", v5);
  }
  else
  {
    objc_msgSend(a1, "representations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v6 = 0;
      return v6;
    }
    v10 = [CKImageData alloc];
    objc_msgSend(a1, "representations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKImageData initWithData:](v10, "initWithData:", v12);

  }
  return v6;
}

+ (double)calculatePreviewScaleWithTargetSize:()CKUtils imageData:
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;

  v7 = a5;
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "ptSize");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v7, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "previewMaxWidth");
    v18 = v17;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "thumbnailFillSizeForWidth:imageSize:", v18, v10, v12);
    v21 = v20;
    v23 = v22;

    objc_msgSend(v7, "thumbnailFillToSize:", v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v26 = v25;
    v28 = v27;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stickerScreenScale");
    objc_msgSend(v29, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v26, v28, v15, 1.0, v31, v18);
    v33 = v32;
    v35 = v34;

    if (v12 <= v10)
    {
      if (v33 <= 0.0)
        v46 = 1.0;
      else
        v46 = v33;
      v37 = a1 / v46;
    }
    else
    {
      if (v35 <= 0.0)
        v36 = 1.0;
      else
        v36 = v35;
      v37 = a2 / v36;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      +[IMSticker(CKUtils) calculatePreviewScaleWithTargetSize:imageData:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);

    v37 = 1.0;
  }

  return v37;
}

+ (double)calculatedRecentsItemWidthFromStickersUltraExtensionForStickerChatItem:()CKUtils collectionViewWidth:
{
  id v5;
  uint64_t v6;
  void *v7;
  double width;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  uint64_t v23;
  CGAffineTransform v25;
  CGAffineTransformComponents v26;
  CGAffineTransform v27;

  memset(&v27, 0, sizeof(v27));
  v5 = a4;
  CGAffineTransformMakeScale(&v27, 1.25, 1.25);
  v6 = MEMORY[0x193FF3C18](CFSTR("_MSStickerDragPreviewContainerView"), CFSTR("Messages"));
  if (v6)
  {
    v7 = (void *)v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "targetPreviewTransform");
      v27 = (CGAffineTransform)v26;
    }
  }
  v25 = v27;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformDecompose(&v26, &v25);
  width = v26.scale.width;
  v9 = v26.scale.width * 48.0;
  v10 = v26.scale.height * 48.0;
  objc_msgSend(v5, "mediaObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transfer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D37F10]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stickerPackGUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  IMStickersExtensionIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "containsString:", v16) & 1) != 0)
  {
    objc_msgSend(v11, "sticker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "externalURI");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "hasPrefix:", CFSTR("sticker:///emoji/")) & 1) != 0)
    {

      goto LABEL_17;
    }
    v23 = objc_msgSend(v14, "length");

    if (v23)
      goto LABEL_17;
  }
  else
  {

  }
  v19 = 96.0;
  if (a1 > 430.0)
    v19 = 224.0;
  v20 = 4.0;
  if (a1 > 430.0)
    v20 = 8.0;
  v21 = (a1 + -32.0 - v19) / v20 * width;
  v22 = v21 < v9;
  if (v21 < v10)
    v22 = 1;
  if (!v22)
    v9 = v21;
LABEL_17:

  return v9;
}

- (double)calculatePreviewScaleWithTargetSize:()CKUtils
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  v5 = (void *)MEMORY[0x1E0D39B18];
  objc_msgSend(a1, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calculatePreviewScaleWithTargetSize:imageData:", v6, a2, a3);
  v8 = v7;

  return v8;
}

- (void)stickerViewForStickerChatItem:()CKUtils snapshotEffectView:completion:
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isClingEnabled");

  if (v11)
  {
    if (a4)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __82__IMSticker_CKUtils__stickerViewForStickerChatItem_snapshotEffectView_completion___block_invoke;
      v13[3] = &unk_1E274F630;
      v13[4] = a1;
      v14 = v9;
      objc_msgSend(a1, "stickerEffectViewSnapshotForStickerChatItem:completion:", v8, v13);

    }
    else
    {
      objc_msgSend(a1, "stickerEffectViewForStickerChatItem:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v12);

    }
  }

}

- (id)stickerEffectViewForStickerChatItem:()CKUtils
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v21[8];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isClingEnabled");

  if (v6)
  {
    objc_msgSend(v4, "mediaObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = objc_msgSend(v8, "stickerEffectType");
      if ((objc_msgSend(v8, "needsAnimation") & 1) != 0 || (IMStickerEffectTypeShouldAvoidEffectView() & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v11 = MTLCreateSystemDefaultDevice();
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6DF0]), "initWithDevice:", v11);
        objc_msgSend(v10, "setContentMode:", 1);
        objc_msgSend(v10, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        v21[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        v21[5] = v13;
        v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        v21[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        v21[7] = v14;
        v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        v21[0] = *MEMORY[0x1E0CD2610];
        v21[1] = v15;
        v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        v21[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        v21[3] = v16;
        objc_msgSend(v12, "setTransform:", v21);

        objc_msgSend(v10, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeAllAnimations");

        objc_msgSend(a1, "image");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v18);

        objc_msgSend(MEMORY[0x1E0DC6DE8], "effectWithType:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setEffect:", v19);

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)stickerEffectViewSnapshotForStickerChatItem:()CKUtils completion:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isClingEnabled");

  if (v9)
  {
    objc_msgSend(a1, "stickerEffectViewForStickerChatItem:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke;
      v18[3] = &unk_1E274F658;
      v19 = v7;
      -[NSObject snapshotWithCompletionHandler:](v10, "snapshotWithCompletionHandler:", v18);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[IMSticker(CKUtils) stickerEffectViewSnapshotForStickerChatItem:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

+ (uint64_t)dragItemIsSticker:()CKUtils
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "itemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.sticker.mediaPayload")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "itemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.sticker"));

  }
  return v5;
}

+ (BOOL)dragItemIsRepositioningSticker:()CKUtils
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStickerRepositioningEnabled");

  if (v5
    && (objc_msgSend(v3, "localObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0)
    && objc_msgSend(MEMORY[0x1E0D39B18], "dragItemIsSticker:", v3))
  {
    objc_msgSend(v3, "localObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("kStickerIsRepositioningKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)dropSessionIsRepositioningSticker:()CKUtils
{
  void *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(MEMORY[0x1E0D39B18], "dragItemIsRepositioningSticker:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)) & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (void)stickerWithMSMessageMediaPayload:()CKUtils .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, a3, "Missing sticker pack bundle ID in attributionInfo for media payload. Expected attributionInfo key: %@.", (uint8_t *)&v3);
}

+ (void)calculatePreviewScaleWithTargetSize:()CKUtils imageData:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Unable to calculate initial scaled for nil image", a5, a6, a7, a8, 0);
}

- (void)stickerEffectViewSnapshotForStickerChatItem:()CKUtils completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Could not snapshot effectView. Platform not supported or feature not enabled.", a5, a6, a7, a8, 0);
}

@end
