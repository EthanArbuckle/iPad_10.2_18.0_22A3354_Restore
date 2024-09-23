@implementation CKMediaObject

+ (id)mediaClasses
{
  if (mediaClasses_once != -1)
    dispatch_once(&mediaClasses_once, &__block_literal_global_61);
  return (id)mediaClasses_classes;
}

void __50__CKMediaObject_mediaIsSpatialUsingPhotosFormats___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75140]), "initWithMediaURL:detail:timeZoneLookup:shouldCache:", a1[4], 1, 0, 1);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "isSpatialMedia");
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)dealloc
{
  objc_super v3;

  -[CKFileTransfer mediaObjectRemoved](self->_transfer, "mediaObjectRemoved");
  v3.receiver = self;
  v3.super_class = (Class)CKMediaObject;
  -[CKMediaObject dealloc](&v3, sel_dealloc);
}

- (void)mediaIsSpatialBasedOnMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Checking spatial state using metadata for %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x2020000000;
  v17 = 0;
  -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(2, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CKMediaObject_mediaIsSpatialBasedOnMetadata___block_invoke;
  block[3] = &unk_1E274F680;
  v13 = v4;
  p_buf = &buf;
  v12 = v7;
  v9 = v4;
  v10 = v7;
  dispatch_async(v8, block);

  _Block_object_dispose(&buf, 8);
}

- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[CKMediaObject transfer](self, "transfer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:transferGUID:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:transferGUID:", v6, v8, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSURL)fileURL
{
  void *v2;
  void *v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (CKFileTransfer)transfer
{
  return self->_transfer;
}

- (CKMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CKMediaObject *v10;
  CKMediaObject *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKMediaObject;
  v10 = -[CKMediaObject init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CKMediaObject setTransfer:](v10, "setTransfer:", v8);
    -[CKMediaObject transfer](v11, "transfer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaObjectAdded");

    -[CKMediaObject setMessageContext:](v11, "setMessageContext:", v9);
    -[CKMediaObject setForceInlinePreviewGeneration:](v11, "setForceInlinePreviewGeneration:", v5);
    -[CKMediaObject _refreshSpatialMetadata](v11, "_refreshSpatialMetadata");
    -[CKMediaObject setSpatialState:](v11, "setSpatialState:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v11, sel__transferUpdated_, *MEMORY[0x1E0D35578], 0);

  }
  return v11;
}

- (void)setTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_transfer, a3);
}

- (void)setMessageContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setForceInlinePreviewGeneration:(BOOL)a3
{
  self->_forceInlinePreviewGeneration = a3;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[CKMediaObject messageContext](self, "messageContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (CKMessageContext)messageContext
{
  return self->_messageContext;
}

void __47__CKMediaObject_mediaIsSpatialBasedOnMetadata___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("plist"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v6);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D380C8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "BOOLValue");

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)mediaIsSpatialUsingPhotosFormats:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  __int128 *p_buf;
  uint8_t v15[4];
  CKMediaObject *v16;
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Checking spatial state using PhotosFormats for %@", (uint8_t *)&buf, 0xCu);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v19 = 0;
  if (!-[CKMediaObject isFromMe](self, "isFromMe"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v15 = 138412290;
        v16 = self;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Not checking mediaIsSpatialUsingPhotosFormats because media isn't from self: %@", v15, 0xCu);
      }

    }
    v4[2](v4, *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
  }
  -[CKMediaObject fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(2, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CKMediaObject_mediaIsSpatialUsingPhotosFormats___block_invoke;
  block[3] = &unk_1E274F680;
  v13 = v4;
  p_buf = &buf;
  v12 = v7;
  v9 = v4;
  v10 = v7;
  dispatch_async(v8, block);

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateShareURL, 0);
  objc_storeStrong((id *)&self->_highQualityFetchInProgressGroup, 0);
  objc_storeStrong((id *)&self->_cachedHighQualityFileURL, 0);
  objc_storeStrong((id *)&self->_generativePlaygroundRecipeData, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
  objc_storeStrong((id *)&self->_senderContext, 0);
  objc_storeStrong((id *)&self->_messageContext, 0);
  objc_storeStrong((id *)&self->_UTIType, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_transferGUID, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_internalCachedAdaptiveImageGlyph, 0);
  objc_storeStrong((id *)&self->_transfer, 0);
}

void __29__CKMediaObject_mediaClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mediaClasses_classes;
  mediaClasses_classes = v0;

}

- (id)_balloonViewForClassWithWidth:(double)a3 orientation:(char)a4
{
  return CKBalloonViewForClass(-[CKMediaObject balloonViewClassForWidth:orientation:](self, "balloonViewClassForWidth:orientation:", a4, a3));
}

- (id)_composeImageForBalloonView:(id)a3 colorType:(char)a4 traitCollection:(id)a5
{
  uint64_t v6;
  id v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v20;
  CGSize v21;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKBalloonView_CKMediaObject.m"), 293, CFSTR("A traitCollection is needed to create a compose image for balloon view %@"), v9);

  }
  objc_msgSend(v9, "setColor:", v6);
  objc_msgSend(v9, "prepareForDisplayIfNeeded");
  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v10, "displayScale");
  objc_msgSend(v9, "ck_recursivelySetContentScaleFactor:");
  objc_msgSend(v9, "bounds");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "displayScale");
  v16 = v15;
  v21.width = v12;
  v21.height = v14;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v16);
  objc_msgSend(v9, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v18;
}

- (id)composeImagesForEntryContentViewWidth:(double)a3 traitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  void *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGSize v62;
  CGSize v63;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewMaxWidth");
  v10 = v9;

  -[CKMediaObject _balloonViewForClassWithWidth:orientation:](self, "_balloonViewForClassWithWidth:orientation:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configureForMediaObject:previewWidth:orientation:", self, 1, v10);
  objc_msgSend(v11, "prepareForDisplayIfNeeded");
  objc_msgSend(v11, "setOrientation:", 1);
  objc_msgSend(v11, "setCanUseOpaqueMask:", 0);
  objc_msgSend(v11, "setHasTail:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "chevron");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setControlHidden:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "prepareForDisplayIfNeeded");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "composeBalloonMaxWidthForEntryContentViewWidth:", a3);
    v16 = v15;

    objc_msgSend(v11, "sizeThatFits:", v16, 1.79769313e308);
    if (v17 >= v16)
      v19 = v16;
    else
      v19 = v17;
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v19, v18);
    objc_msgSend(v11, "setNeedsLayout");
    objc_msgSend(v11, "layoutIfNeeded");
    -[CKMediaObject _composeImageForBalloonView:colorType:traitCollection:](self, "_composeImageForBalloonView:colorType:traitCollection:", v11, 0xFFFFFFFFLL, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v20, &unk_1E2870228);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "setObject:forKey:", v20, &unk_1E2870240);
      objc_msgSend(v7, "setObject:forKey:", v20, &unk_1E2870258);
      objc_msgSend(v7, "setObject:forKey:", v20, &unk_1E2870270);
    }
    else
    {
      -[CKMediaObject _composeImageForBalloonView:colorType:traitCollection:](self, "_composeImageForBalloonView:colorType:traitCollection:", v11, 0, v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v21, &unk_1E2870240);

      -[CKMediaObject _composeImageForBalloonView:colorType:traitCollection:](self, "_composeImageForBalloonView:colorType:traitCollection:", v11, 1, v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v22, &unk_1E2870258);

      -[CKMediaObject _composeImageForBalloonView:colorType:traitCollection:](self, "_composeImageForBalloonView:colorType:traitCollection:", v11, 6, v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v23, &unk_1E2870270);

    }
    goto LABEL_30;
  }
  if ((objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || objc_msgSend(v11, "isMemberOfClass:", objc_opt_class()))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "composeBalloonMaxWidthForEntryContentViewWidth:", a3);
    v26 = v25;

    objc_msgSend(v11, "sizeThatFits:", v26, 1.79769313e308);
    if (v27 >= v26)
      v29 = v26;
    else
      v29 = v27;
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v29, v28);
    objc_msgSend(v11, "prepareForDisplayIfNeeded");
    objc_msgSend(v11, "layoutIfNeeded");
    objc_msgSend(v11, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v57 = 0u;
    if (v11)
      objc_msgSend(v11, "balloonDescriptor");
    BYTE1(v57) = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v20;
      if (!v30)
        goto LABEL_29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setScale:", 0.0);
      objc_msgSend(v31, "setPreferredRange:", 0);
      objc_msgSend(v31, "setOpaque:", 0);
      v32 = objc_alloc(MEMORY[0x1E0CEA610]);
      objc_msgSend(v11, "bounds");
      v33 = (void *)objc_msgSend(v32, "initWithBounds:format:", v31);
      v51 = MEMORY[0x1E0C809B0];
      v52 = 3221225472;
      v53 = __80__CKMediaObject_Compose__composeImagesForEntryContentViewWidth_traitCollection___block_invoke;
      v54 = &unk_1E274A4E8;
      v55 = v11;
      v56 = v20;
      objc_msgSend(v33, "imageWithActions:", &v51);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }
    }
    objc_msgSend(v7, "setObject:forKey:", v30, &unk_1E2870240, v51, v52, v53, v54);
    objc_msgSend(v7, "setObject:forKey:", v30, &unk_1E2870258);
    objc_msgSend(v7, "setObject:forKey:", v30, &unk_1E2870270);
    objc_msgSend(v7, "setObject:forKey:", v30, &unk_1E2870228);
    goto LABEL_29;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "composeBalloonMaxWidthForEntryContentViewWidth:", a3);
  v37 = v36;

  objc_msgSend(v11, "prepareForDisplayIfNeeded");
  objc_msgSend(v11, "sizeThatFits:", v37, 1.79769313e308);
  if (v38 >= v37)
    v40 = v37;
  else
    v40 = v38;
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, v40, v39);
  objc_msgSend(v11, "layoutIfNeeded");
  objc_msgSend(v11, "bounds");
  v62.width = v41;
  v62.height = v42;
  UIGraphicsBeginImageContextWithOptions(v62, 0, 0.0);
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v11, "bounds");
    v44 = v43;
    v46 = v45;
    objc_msgSend(v11, "contentScaleFactor");
    v48 = v47;
    v63.width = v44;
    v63.height = v46;
    UIGraphicsBeginImageContextWithOptions(v63, 0, v48);
    +[CKTranscriptPrintPageRenderer renderViewWithText:withOffsetVertical:](CKTranscriptPrintPageRenderer, "renderViewWithText:withOffsetVertical:", v11, 0.0);
  }
  else
  {
    objc_msgSend(v11, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "renderInContext:", UIGraphicsGetCurrentContext());

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v7, "setObject:forKey:", v50, &unk_1E2870240);
  objc_msgSend(v7, "setObject:forKey:", v50, &unk_1E2870258);
  objc_msgSend(v7, "setObject:forKey:", v50, &unk_1E2870270);
  objc_msgSend(v7, "setObject:forKey:", v50, &unk_1E2870228);

LABEL_31:
  CKBalloonViewReuse(v11);

  return v7;
}

uint64_t __80__CKMediaObject_Compose__composeImagesForEntryContentViewWidth_traitCollection___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;

  v2 = (void *)MEMORY[0x1E0CEA390];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composeBalloonCornerRadius");
  objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addClip");

  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(v14, "drawInRect:");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKMediaObject;
  -[CKMediaObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject transfer](self, "transfer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)UTITypes
{
  return &unk_1E286F3E8;
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("FILE");
}

- (void)_transferUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFileTransfer guid](self->_transfer, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = objc_msgSend(v5, "transferState");

    if (v8 == 5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412290;
          v12 = v10;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Transfer finished for guid: %@; refreshing spatial metadata",
            (uint8_t *)&v11,
            0xCu);

        }
      }
      -[CKMediaObject _refreshSpatialMetadata](self, "_refreshSpatialMetadata");
    }
  }
  else
  {

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[CKMediaObject transferGUID](self, "transferGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transferGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)transferGUID
{
  void *v2;
  void *v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)commSafetySensitive
{
  void *v2;
  int64_t v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "commSafetySensitive");

  return v3;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[CKMediaObject fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
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
    v6 = CFSTR("SUMMARY_FILE_TYPE");
  else
    v6 = CFSTR("SUMMARY_FILE_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)filename
{
  void *v2;
  void *v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)transcoderUserInfo
{
  void *v2;
  void *v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcoderUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)mimeType
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject filename](self, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MIMETypeOfPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isDirectory
{
  void *v2;
  char v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDirectory");

  return v3;
}

- (NSString)UTIType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (-[CKMediaObject isDirectory](self, "isDirectory")
    && (-[CKMediaObject filename](self, "filename"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "pathExtension"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v3,
        !v5))
  {
    v8 = (id)*MEMORY[0x1E0CA5B58];
  }
  else
  {
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject filename](self, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UTITypeForFilename:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (NSString)metricsCollectorMediaType
{
  return (NSString *)(id)*MEMORY[0x1E0D386C0];
}

- (id)pasteboardItemProvider
{
  void *v3;
  void *v4;
  void *v5;

  -[CKMediaObject fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithContentsOfURL:", v3);
  -[CKMediaObject filename](self, "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedName:", v5);

  return v4;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CKMediaObject fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v13 = objc_alloc(MEMORY[0x1E0DC12B0]);
    -[CKMediaObject data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject UTIType](self, "UTIType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v13, "initWithData:ofType:", v14, v15);

LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v17 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v6, 0, &v17);
  v8 = v17;
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v10, "setFileWrapper:", v7);

    goto LABEL_13;
  }
  v10 = v8;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Unable to create file wrapper for NSItemProvider with error: %@", buf, 0xCu);
    }

  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

  return v12;
}

- (int)mediaType
{
  return 0;
}

- (BOOL)needsAnimation
{
  return 0;
}

- (BOOL)generatePreviewOutOfProcess
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject UTIType](self, "UTIType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = IMIsSupportedUTIType();

  -[CKMediaObject transfer](self, "transfer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFileURLFinalized");

  v7 = -[CKMediaObject forceInlinePreviewGeneration](self, "forceInlinePreviewGeneration");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v4)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      if (v6)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v13 = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      if (v7)
        v9 = CFSTR("YES");
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Generating Preview OOP: isSupported(%@), isFinalized(%@), forceInline(%@)", (uint8_t *)&v13, 0x20u);
    }

  }
  if (v4)
    return v6 & !v7;
  else
    return 0;
}

- (BOOL)validatePreviewFormat
{
  return 0;
}

- (BOOL)isPhotosCompatible
{
  return 0;
}

- (void)fetchHighQualityFile:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  dispatch_group_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[5];
  id v17;

  v4 = a3;
  -[CKMediaObject highQualityFetchInProgressGroup](self, "highQualityFetchInProgressGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKMediaObject highQualityFetchInProgressGroup](self, "highQualityFetchInProgressGroup");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__CKMediaObject_fetchHighQualityFile___block_invoke;
    block[3] = &unk_1E274C2E0;
    block[4] = self;
    v17 = v4;
    dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

  }
  -[CKMediaObject cachedHighQualityFileURL](self, "cachedHighQualityFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      -[CKMediaObject cachedHighQualityFileURL](self, "cachedHighQualityFileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v8);

    }
  }
  else
  {
    -[CKMediaObject transfer](self, "transfer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = dispatch_group_create();
      -[CKMediaObject setHighQualityFetchInProgressGroup:](self, "setHighQualityFetchInProgressGroup:", v11);

      -[CKMediaObject highQualityFetchInProgressGroup](self, "highQualityFetchInProgressGroup");
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v12);

      -[CKMediaObject transfer](self, "transfer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __38__CKMediaObject_fetchHighQualityFile___block_invoke_2;
      v14[3] = &unk_1E274F6A8;
      v14[4] = self;
      v15 = v4;
      objc_msgSend(v13, "fetchHighQualityFile:", v14);

    }
    else if (v4)
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
  }

}

uint64_t __38__CKMediaObject_fetchHighQualityFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchHighQualityFile:", *(_QWORD *)(a1 + 40));
}

void __38__CKMediaObject_fetchHighQualityFile___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 32), "setCachedHighQualityFileURL:", v7);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  objc_msgSend(*(id *)(a1 + 32), "highQualityFetchInProgressGroup");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v6);

  objc_msgSend(*(id *)(a1 + 32), "setHighQualityFetchInProgressGroup:", 0);
}

- (NSString)syndicationIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  NSObject *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject transferGUID](self, "transferGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (IMFileTransferGUIDIsTemporary())
    {
      objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transferForGUID:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        IMLogHandleForCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CKMediaObject syndicationIdentifier].cold.2();
        v12 = 0;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chatForTransfer:", v4);
      v6 = objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        IMLogHandleForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[CKMediaObject syndicationIdentifier].cold.3();
        v12 = 0;
        goto LABEL_29;
      }
      objc_msgSend(v4, "messageGUID");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject messageItemForGUID:](v6, "messageItemForGUID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v15 = 138412546;
            v16 = v2;
            v17 = 2112;
            v18 = v7;
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Found message item for transfer with GUID %@, messageGUID: %@", (uint8_t *)&v15, 0x16u);
          }

        }
        if (objc_msgSend(v8, "messagePartIndexForAttachmentMessagePartWithTransferGUID:", v2) != 0x7FFFFFFFFFFFFFFFLL)
        {
          IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        IMLogHandleForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CKMediaObject syndicationIdentifier].cold.4();
      }
      else
      {
        IMLogHandleForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          -[NSObject guid](v6, "guid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412802;
          v16 = v2;
          v17 = 2112;
          v18 = v7;
          v19 = 2112;
          v20 = v14;
          _os_log_error_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_ERROR, "Could not get message item to derive attachment index. transferGUID: %@. messageGUID: %@. chat: %@", (uint8_t *)&v15, 0x20u);

        }
      }

      v12 = 0;
LABEL_28:

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
    v12 = v2;
  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CKMediaObject syndicationIdentifier].cold.1();

    v12 = 0;
  }
LABEL_31:

  return (NSString *)v12;
}

- (BOOL)shouldSuppressPreview
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;

  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
    return 1;
  -[CKMediaObject messageContext](self, "messageContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFromMe");

  if ((v5 & 1) != 0)
    return 0;
  -[CKMediaObject messageContext](self, "messageContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "filterCategory");

  -[CKMediaObject messageContext](self, "messageContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "isSpam");

  if ((_DWORD)v7)
  {
    if ((unint64_t)(v8 - 5) < 0xFFFFFFFFFFFFFFFELL)
      return 1;
  }
  if (-[CKMediaObject supportsUnknownSenderPreview](self, "supportsUnknownSenderPreview"))
    return 0;
  -[CKMediaObject messageContext](self, "messageContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasResponded");

  if ((v12 & 1) != 0)
    return 0;
  -[CKMediaObject messageContext](self, "messageContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSenderUnknown");

  if ((v14 & 1) != 0)
    return 1;
  -[CKMediaObject messageContext](self, "messageContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isSenderUnauthenticated");

  return (v16 & 1) != 0;
}

- (IMHandle)senderHandle
{
  void *v2;
  void *v3;
  void *v4;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "IMMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMHandle *)v4;
}

- (BOOL)canShareItem
{
  return 1;
}

- (NSURL)previewItemURL
{
  void *v3;

  -[CKMediaObject cachedHighQualityFileURL](self, "cachedHighQualityFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CKMediaObject cachedHighQualityFileURL](self, "cachedHighQualityFileURL");
  else
    -[CKMediaObject fileURL](self, "fileURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isPromisedItem
{
  void *v2;
  char v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestoring");

  return v3;
}

- (CKMediaObject)initWithCoder:(id)a3
{
  id v4;
  CKMediaObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKMediaObject;
  v5 = -[CKMediaObject init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKMEDIAOBJECT_FILEURL_KEY"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject setFileURL:](v5, "setFileURL:", v6);

    -[CKMediaObject setForceInlinePreviewGeneration:](v5, "setForceInlinePreviewGeneration:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CKMEDIAOBJECT_FORCEINLINEPREVIEWGENERATION_KEY")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKMEDIAOBJECT_TRANSFERGUID_KEY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject setTransferGUID:](v5, "setTransferGUID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKMEDIAOBJECT_DATA_KEY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject setData:](v5, "setData:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKMEDIAOBJECT_FILENAME_KEY"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject setFilename:](v5, "setFilename:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKMEDIAOBJECT_MIMETYPE_KEY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject setMimeType:](v5, "setMimeType:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKMEDIAOBJECT_UTITYPE_KEY"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject setUTIType:](v5, "setUTIType:", v11);

    -[CKMediaObject setGeneratePreviewOutOfProcess:](v5, "setGeneratePreviewOutOfProcess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CKMEDIAOBJECT_GENERATEPREIVIEWOOP_KEY")));
    -[CKMediaObject setIsPhotosCompatible:](v5, "setIsPhotosCompatible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CKMEDIAOBJECT_ISPHOTOSCOMPTAIBLE_KEY")));
    -[CKMediaObject setValidatePreviewFormat:](v5, "setValidatePreviewFormat:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CKMEDIAOBJECT_VALIDATEPREVIEWFORMAT_KEY")));
    -[CKMediaObject setIsFromMe:](v5, "setIsFromMe:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CKMEDIAOBJECT_ISFROMME_KEY")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CKMediaObject fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("CKMEDIAOBJECT_FILEURL_KEY"));

  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject forceInlinePreviewGeneration](self, "forceInlinePreviewGeneration"), CFSTR("CKMEDIAOBJECT_FORCEINLINEPREVIEWGENERATION_KEY"));
  -[CKMediaObject transferGUID](self, "transferGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("CKMEDIAOBJECT_TRANSFERGUID_KEY"));

  -[CKMediaObject data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("CKMEDIAOBJECT_DATA_KEY"));

  -[CKMediaObject filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("CKMEDIAOBJECT_FILENAME_KEY"));

  -[CKMediaObject mimeType](self, "mimeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("CKMEDIAOBJECT_MIMETYPE_KEY"));

  -[CKMediaObject UTIType](self, "UTIType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("CKMEDIAOBJECT_UTITYPE_KEY"));

  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"), CFSTR("CKMEDIAOBJECT_GENERATEPREIVIEWOOP_KEY"));
  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject isPhotosCompatible](self, "isPhotosCompatible"), CFSTR("CKMEDIAOBJECT_ISPHOTOSCOMPTAIBLE_KEY"));
  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject validatePreviewFormat](self, "validatePreviewFormat"), CFSTR("CKMEDIAOBJECT_VALIDATEPREVIEWFORMAT_KEY"));
  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject isFromMe](self, "isFromMe"), CFSTR("CKMEDIAOBJECT_ISFROMME_KEY"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSAdaptiveImageGlyph)internalCachedAdaptiveImageGlyph
{
  return self->_internalCachedAdaptiveImageGlyph;
}

- (void)setInternalCachedAdaptiveImageGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_internalCachedAdaptiveImageGlyph, a3);
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)forceInlinePreviewGeneration
{
  return self->_forceInlinePreviewGeneration;
}

- (void)setTransferGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setUTIType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (IMSenderContext)senderContext
{
  return self->_senderContext;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (void)setGeneratePreviewOutOfProcess:(BOOL)a3
{
  self->_generatePreviewOutOfProcess = a3;
}

- (void)setValidatePreviewFormat:(BOOL)a3
{
  self->_validatePreviewFormat = a3;
}

- (void)setIsPhotosCompatible:(BOOL)a3
{
  self->_isPhotosCompatible = a3;
}

- (UITraitCollection)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (void)setTranscriptTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptTraitCollection, a3);
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSData)generativePlaygroundRecipeData
{
  return self->_generativePlaygroundRecipeData;
}

- (void)setGenerativePlaygroundRecipeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)supportsUnknownSenderPreview
{
  return self->_supportsUnknownSenderPreview;
}

- (BOOL)isMonoskiAsset
{
  return self->_isMonoskiAsset;
}

- (NSURL)cachedHighQualityFileURL
{
  return self->_cachedHighQualityFileURL;
}

- (void)setCachedHighQualityFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_cachedHighQualityFileURL, a3);
}

- (OS_dispatch_group)highQualityFetchInProgressGroup
{
  return self->_highQualityFetchInProgressGroup;
}

- (void)setHighQualityFetchInProgressGroup:(id)a3
{
  objc_storeStrong((id *)&self->_highQualityFetchInProgressGroup, a3);
}

- (unint64_t)oopPreviewRequestCount
{
  return self->_oopPreviewRequestCount;
}

- (void)setOopPreviewRequestCount:(unint64_t)a3
{
  self->_oopPreviewRequestCount = a3;
}

- (BOOL)cachedValidPreviewExists
{
  return self->_cachedValidPreviewExists;
}

- (void)setCachedValidPreviewExists:(BOOL)a3
{
  self->_cachedValidPreviewExists = a3;
}

- (NSURL)alternateShareURL
{
  return self->_alternateShareURL;
}

- (void)setAlternateShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)spatialState
{
  return self->_spatialState;
}

- (void)setSpatialState:(int64_t)a3
{
  self->_spatialState = a3;
}

- (BOOL)didRequestAdaptiveImageGlyphDerivedFromPreviewImage
{
  return self->_didRequestAdaptiveImageGlyphDerivedFromPreviewImage;
}

- (void)setDidRequestAdaptiveImageGlyphDerivedFromPreviewImage:(BOOL)a3
{
  self->_didRequestAdaptiveImageGlyphDerivedFromPreviewImage = a3;
}

- (void)_refreshSpatialMetadata
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD aBlock[5];
  uint8_t buf[4];
  CKMediaObject *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Refreshing spatial metadata for: %@", buf, 0xCu);
    }

  }
  if (-[CKMediaObject spatialState](self, "spatialState"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Spatial state is already known or being fetched - bailing.", buf, 2u);
      }

    }
  }
  else
  {
    -[CKMediaObject setSpatialState:](self, "setSpatialState:", 1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke;
    aBlock[3] = &unk_1E274A1B8;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    if (-[CKMediaObject isFromMe](self, "isFromMe"))
      -[CKMediaObject mediaIsSpatialUsingPhotosFormats:](self, "mediaIsSpatialUsingPhotosFormats:", v5);
    else
      -[CKMediaObject mediaIsSpatialBasedOnMetadata:](self, "mediaIsSpatialBasedOnMetadata:", v5);

  }
}

void __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke_2;
  v2[3] = &unk_1E274CA88;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
        v4 = CFSTR("YES");
      else
        v4 = CFSTR("NO");
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Determined spatial state = %@ for %@", (uint8_t *)&v7, 0x16u);
    }

  }
  if (*(_BYTE *)(a1 + 40))
    v5 = 3;
  else
    v5 = 2;
  result = objc_msgSend(*(id *)(a1 + 32), "setSpatialState:", v5);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "postPreviewDidChangeNotifications");
  return result;
}

- (IMPreviewConstraints)_previewConstraintsForWidth:(SEL)a3
{
  void *v7;
  double v8;
  double v9;
  char v10;
  IMPreviewConstraints *result;
  id v12;

  *(_QWORD *)&retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  retstr->var2 = v8;

  retstr->var0 = v9 * a4;
  retstr->var1.width = v9 * 50.0;
  retstr->var1.height = v9 * 50.0;
  -[CKMediaObject transfer](self, "transfer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var3 = objc_msgSend(v12, "isSticker");
  retstr->var5 = objc_msgSend(v12, "isAdaptiveImageGlyph");
  if (-[CKMediaObject conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE1DAFB0))
    v10 = -[CKMediaObject supportsPreviewMetadata](self, "supportsPreviewMetadata");
  else
    v10 = 1;
  retstr->var4 = v10;

  return result;
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isPreviewable
{
  return 0;
}

- (BOOL)isPreviewable
{
  return objc_msgSend((id)objc_opt_class(), "isPreviewable");
}

- (Class)balloonViewClassForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  double v21;
  void *v22;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  if (-[CKMediaObject shouldSuppressPreview](self, "shouldSuppressPreview"))
  {
    -[CKMediaObject placeholderBalloonViewClass](self, "placeholderBalloonViewClass");
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  -[CKMediaObject transfer](self, "transfer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isSticker") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[CKMediaObject transfer](self, "transfer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_7:
    -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cachedPreviewForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v11 = -[CKMediaObject previewBalloonViewClass](self, "previewBalloonViewClass");
      if (v11)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v4, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMediaObject transfer](self, "transfer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isDownloadable") & 1) != 0)
    {

    }
    else
    {
      v18 = -[CKMediaObject validPreviewExistsAtURL:](self, "validPreviewExistsAtURL:", v16);

      if (v18)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v24 = 138412290;
            v25 = 0;
            _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Got disk preview exists preview, class is %@", (uint8_t *)&v24, 0xCu);
          }

        }
        v11 = -[CKMediaObject previewBalloonViewClass](self, "previewBalloonViewClass");

        if (v11)
          goto LABEL_24;
        goto LABEL_19;
      }
    }

LABEL_19:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "mapPreviewMaxWidth");
      a3 = v21;

    }
    -[CKMediaObject previewForWidth:orientation:](self, "previewForWidth:orientation:", v4, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22
      || (v11 = -[CKMediaObject previewBalloonViewClass](self, "previewBalloonViewClass"), v22, !v11))
    {
      v11 = -[CKMediaObject placeholderBalloonViewClass](self, "placeholderBalloonViewClass");
    }
    goto LABEL_24;
  }
  v11 = -[CKMediaObject inlineStickerBalloonViewClass](self, "inlineStickerBalloonViewClass");
LABEL_25:
  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
    v11 = -[CKMediaObject placeholderBalloonViewClass](self, "placeholderBalloonViewClass");
  if (!v11)
    v11 = -[CKMediaObject balloonViewClass](self, "balloonViewClass");
  v7 = v11;
  return v7;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)placeholderBalloonViewClass
{
  void *v3;
  int v4;

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFromMomentShare");

  if (v4)
    objc_opt_class();
  else
    -[CKMediaObject balloonViewClass](self, "balloonViewClass");
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (Class)inlineStickerBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)title
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[CKMediaObject filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CKIsAttachmentFallbackFilename(v3);

  if (!v4 || (v5 = (void *)UTTypeCopyDescription((CFStringRef)-[CKMediaObject UTIType](self, "UTIType"))) == 0)
  {
    -[CKMediaObject filename](self, "filename");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttachmentTitleFromFilename();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)icon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  +[CKMediaObject iconCache](CKMediaObject, "iconCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject UTIType](self, "UTIType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaObjectCachedIconSize");
      v8 = v7;
      v10 = v9;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v13 = v12;

      -[CKMediaObject _generateIconWithSize:scale:](self, "_generateIconWithSize:scale:", v8, v10, v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v3, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_generateIconWithSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;

  height = a3.height;
  width = a3.width;
  -[CKMediaObject fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithURL:", v8);
  }
  else
  {
    -[CKMediaObject UTIType](self, "UTIType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithType:", v10);

  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setSize:", width, height);
  objc_msgSend(v11, "setScale:", a4);
  if (CKIsRunningInMacCatalyst())
    objc_msgSend(v11, "setVariantOptions:", 1);
  objc_msgSend(v9, "prepareImageForDescriptor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0CEA638];
    v15 = objc_msgSend(v12, "CGImage");
    objc_msgSend(v13, "scale");
    objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0, v16 + v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldDenyUTITypeFromRichIcon
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  int v8;
  int v9;
  const __CFString *v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;

  v3 = -[CKMediaObject UTIType](self, "UTIType");
  v4 = UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E0CA5CC8]);
  v5 = -[CKMediaObject UTIType](self, "UTIType");
  v6 = UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E0CA5B78]);
  v7 = -[CKMediaObject UTIType](self, "UTIType");
  v8 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E0CA5C58]);
  v9 = UTTypeConformsTo((CFStringRef)-[CKMediaObject UTIType](self, "UTIType"), CFSTR("public.xhtml"));
  v10 = -[CKMediaObject UTIType](self, "UTIType");
  v11 = UTTypeConformsTo(v10, (CFStringRef)*MEMORY[0x1E0CA5C00]);
  v12 = UTTypeConformsTo((CFStringRef)-[CKMediaObject UTIType](self, "UTIType"), CFSTR("com.pixar.universal-scene-description-mobile"));
  v13 = UTTypeConformsTo((CFStringRef)-[CKMediaObject UTIType](self, "UTIType"), CFSTR("com.apple.reality"));
  if (v4)
    v14 = 0;
  else
    v14 = v6 == 0;
  return !v14 || v8 != 0 || v9 != 0 || v11 != 0 || (v12 | v13) != 0;
}

- (id)richIcon
{
  id v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  CKMediaObject *v22;
  _QWORD v23[4];
  id v24;
  CKMediaObject *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!-[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess")
    && !-[CKMediaObject shouldSuppressPreview](self, "shouldSuppressPreview"))
  {
    if (objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Skipping rich icon generation - we are in Lockdown mode", buf, 2u);
        }

      }
      goto LABEL_3;
    }
    CKRichIconPreviewCacheKey(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedPreviewForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Got cached rich icon %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8 == v10;

    if (v11)
      goto LABEL_22;
    if (!v8 && (objc_msgSend(v7, "isGeneratingPreviewForKey:", v6) & 1) == 0)
    {
      if (-[CKMediaObject _shouldDenyUTITypeFromRichIcon](self, "_shouldDenyUTITypeFromRichIcon"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            -[CKMediaObject UTIType](self, "UTIType");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v28 = v13;
            _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Don't generate rich icon for %@", buf, 0xCu);

          }
        }
LABEL_22:
        v3 = 0;
LABEL_27:

        return v3;
      }
      -[CKMediaObject fileURL](self, "fileURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        -[CKMediaObject transfer](self, "transfer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "thumbnailURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Not generating rich icon due to nil fileURL", buf, 2u);
            }

          }
          goto LABEL_22;
        }
      }
      v16 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __34__CKMediaObject_Display__richIcon__block_invoke;
      v23[3] = &unk_1E2759D60;
      v24 = v14;
      v25 = self;
      v26 = v7;
      v19[0] = v16;
      v19[1] = 3221225472;
      v19[2] = __34__CKMediaObject_Display__richIcon__block_invoke_81;
      v19[3] = &unk_1E274A0B8;
      v20 = v26;
      v21 = v6;
      v22 = self;
      v17 = v14;
      objc_msgSend(v20, "enqueueGenerationBlock:completion:withPriority:forKey:", v23, v19, 0, v21);

    }
    v3 = v8;
    goto LABEL_27;
  }
LABEL_3:
  v3 = 0;
  return v3;
}

id __34__CKMediaObject_Display__richIcon__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, void *);
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__74;
  v45 = __Block_byref_object_dispose__74;
  v46 = 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentBalloonSize");
  v6 = v5;
  v8 = v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentBalloonRichIconInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32C8]), "initWithFileAtURL:size:scale:representationTypes:", *(_QWORD *)(a1 + 32), 4, v6 - (v13 + v17), v8 - (v11 + v15), v20);
  objc_msgSend(v21, "setShouldUseRestrictedExtension:", 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v21;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Requesting rich icon generation with request %@", buf, 0xCu);
    }

  }
  v23 = dispatch_group_create();
  dispatch_group_enter(v23);
  objc_msgSend(*(id *)(a1 + 40), "_qlThumbnailGeneratorSharedGenerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __34__CKMediaObject_Display__richIcon__block_invoke_77;
  v36 = &unk_1E2759D38;
  v40 = &v41;
  v37 = *(id *)(a1 + 48);
  v25 = v3;
  v38 = v25;
  v26 = v23;
  v39 = v26;
  objc_msgSend(v24, "generateBestRepresentationForRequest:completionHandler:", v21, &v33);

  v27 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v26, v27))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v21;
        _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Timed out getting rich icon from QuickLookThumbnailing for request %@", buf, 0xCu);
      }

    }
    v29 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v33, v34, v35, v36, v37, v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCachedPreview:key:", v30, v25);

  }
  v31 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  return v31;
}

void __34__CKMediaObject_Display__richIcon__block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "UIImage");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v15 = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Generation completed with result %@ error %@", (uint8_t *)&v15, 0x16u);
    }

  }
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "setCachedPreview:key:", v13, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __34__CKMediaObject_Display__richIcon__block_invoke_81(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__CKMediaObject_Display__richIcon__block_invoke_2;
    v5[3] = &unk_1E274A108;
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = v3;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __34__CKMediaObject_Display__richIcon__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Posting rich icon change notif for generating rich icon for key: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("CKRichIconDidChangeNotification"), *(_QWORD *)(a1 + 40));

}

- (id)_qlThumbnailGeneratorSharedGenerator
{
  return (id)objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
}

- (id)location
{
  return 0;
}

- (BOOL)shouldShowViewer
{
  void *v3;
  char v4;

  if (!-[CKMediaObject shouldBeQuickLooked](self, "shouldBeQuickLooked"))
    return 0;
  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFileDataReady") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isRestoring");

  return v4;
}

- (BOOL)shouldBeQuickLooked
{
  void *v3;
  char v4;

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:](CKCommSafetyHelper, "shouldDisableTranscriptCapabilitiesForCKFileTransfer:", v3))
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0CD3250], "canPreviewItem:", self);
  }

  return v4;
}

- (BOOL)canExport
{
  return 0;
}

- (BOOL)canPerformQuickAction
{
  _BOOL4 v3;

  if (-[CKMediaObject isFromMe](self, "isFromMe"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[CKMediaObject canExport](self, "canExport");
    if (v3)
      LOBYTE(v3) = -[CKMediaObject mediaType](self, "mediaType") == 3
                || -[CKMediaObject mediaType](self, "mediaType") == 2;
  }
  return v3;
}

- (id)previewCacheKeyWithOrientation:(char)a3
{
  void *v4;
  int v5;

  -[CKMediaObject transfer](self, "transfer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSticker");

  if (v5)
    CKStickerPreviewCacheKey(self);
  else
    -[CKMediaObject transferGUID](self, "transferGUID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)defaultPreviewWidth
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewMaxWidth");
  v4 = v3;

  return v4;
}

- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5 transferGUID:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a6;
  -[CKMediaObject fileURL](self, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttachmentPreviewFileURL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[CKMediaObject transfer](self, "transfer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filename");
    -[CKMediaObject mimeType](self, "mimeType");
    -[CKMediaObject UTIType](self, "UTIType");
    v13 = (void *)IMDCopyAttachmentPersistentPath();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    IMAttachmentPreviewFileURL();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)transcoderPreviewGenerationFailed
{
  void *v3;
  int v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  __int16 v18;
  uint8_t v19[2];
  uint8_t buf[16];

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRejected");

  if (!v4)
  {
    -[CKMediaObject transfer](self, "transfer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D37F60]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          v15 = "transcoderPreviewGenerationFailed: Preview marked as failed by blastdoor on receive";
          v16 = v19;
          goto LABEL_17;
        }
LABEL_18:

      }
    }
    else
    {
      +[CKMediaObject transferGUIDSFailingPreviewGeneration](CKMediaObject, "transferGUIDSFailingPreviewGeneration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject transferGUID](self, "transferGUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsObject:", v12);

      if (!v13)
      {
        v6 = 0;
LABEL_20:

        return v6;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v18 = 0;
          v15 = "transcoderPreviewGenerationFailed: Failed to generate preview OOP from CKMediaObject";
          v16 = (uint8_t *)&v18;
LABEL_17:
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
    }
    v6 = 1;
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "transcoderPreviewGenerationFailed: Transfer Rejected for preview", buf, 2u);
    }

  }
  return 0;
}

- (id)fileSizeString
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalBytes");

  if (v3 == -1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)shouldScaleUpPreview
{
  return CKIsRunningInMacCatalyst() == 0;
}

+ (BOOL)shouldShadePreview
{
  return 1;
}

- (void)cacheAndPersistPreview:(id)a3 orientation:(char)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  char v12;

  v4 = a4;
  v6 = a3;
  if (CKIsRunningInFullCKClient())
  {
    -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCachedPreview:key:", v6, v7);
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__CKMediaObject_Display__cacheAndPersistPreview_orientation___block_invoke;
    block[3] = &unk_1E274E150;
    block[4] = self;
    v12 = v4;
    v11 = v6;
    dispatch_async(v9, block);

  }
}

void __61__CKMediaObject_Display__cacheAndPersistPreview_orientation___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "previewFilenameExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Persisting preview to URL %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "savePreview:toURL:forOrientation:", *(_QWORD *)(a1 + 40), v5, *(char *)(a1 + 48));

}

- (id)invisibleInkEffectImageWithPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CKMediaObject transferGUID](self, "transferGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-invisibleInk"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedPreviewForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_8;
      objc_msgSend(v4, "image");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (v10)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "theme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "transcriptBackgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject image:withBackgroundColor:](self, "image:withBackgroundColor:", v11, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setCachedPreview:key:", v9, v7);
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
  }
LABEL_9:

  return v9;
}

- (id)image:(id)a3 withBackgroundColor:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGContext *CurrentContext;
  CGColor *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGSize v23;
  CGRect v24;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "scale");
  v12 = v11;
  v23.width = v8;
  v23.height = v10;
  UIGraphicsBeginImageContextWithOptions(v23, 0, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  v14 = (CGColor *)objc_msgSend(v5, "cgColor");

  CGContextSetFillColorWithColor(CurrentContext, v14);
  objc_msgSend(v6, "size");
  v16 = v15;
  objc_msgSend(v6, "size");
  v24.size.height = v17;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v16;
  CGContextFillRect(CurrentContext, v24);
  objc_msgSend(v6, "size");
  v19 = v18;
  objc_msgSend(v6, "size");
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v19, v20);

  UIGraphicsGetImageFromCurrentImageContext();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v21;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  CKMediaObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  const __CFString *v30;
  NSObject *v31;
  NSObject *v32;
  _BOOL4 v33;
  const __CFString *v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  NSObject *v38;
  CKMediaObject *v39;
  void *v40;
  NSObject *v41;
  __CFString *v42;
  void *v43;
  CKMediaObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint8_t buf[4];
  CKMediaObject *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v4 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[CKMediaObject transferGUID](self, "transferGUID");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[CKMediaObject filename](self, "filename");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v51 = self;
      v52 = 2112;
      v53 = v9;
      v54 = 2112;
      v55 = v10;
      v56 = 1024;
      LODWORD(v57) = v4;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] previewForOrientation:%d", buf, 0x26u);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    -[CKMediaObject transferGUID](self, "transferGUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject filename](self, "filename");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (int)v4;
    v45 = self;
    v46 = v11;
    _CKLog();

  }
  if (!-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed", v45, v46, v47, v49))
  {
    -[CKMediaObject transfer](self, "transfer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKMediaObject isPreviewable](self, "isPreviewable")
      || (objc_msgSend(v14, "isFileDataReady") & 1) == 0 && (objc_msgSend(v14, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v51 = self;
          _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
      v13 = 0;
      goto LABEL_78;
    }
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cachedPreviewForKey:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[CKMediaObject transferGUID](self, "transferGUID");
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[CKMediaObject filename](self, "filename");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v51 = self;
          v52 = 2112;
          v53 = v17;
          v54 = 2112;
          v55 = v18;
          v56 = 2112;
          v57 = v13;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] found in cache! returning %@", buf, 0x2Au);

        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        -[CKMediaObject transferGUID](self, "transferGUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject filename](self, "filename");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        _CKLog();

      }
LABEL_77:

LABEL_78:
      goto LABEL_79;
    }
    -[CKMediaObject transfer](self, "transfer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isFileURLFinalized"))
    {

    }
    else
    {
      -[CKMediaObject transfer](self, "transfer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isSticker");

      if (!v23)
        goto LABEL_56;
    }
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v4, v24, 0);
    v25 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();

    if (-[CKMediaObject validPreviewExistsAtURL:](self, "validPreviewExistsAtURL:", v25))
    {
      -[CKMediaObject savedPreviewFromURL:forOrientation:](self, "savedPreviewFromURL:forOrientation:", v25, v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trackEvent:", *MEMORY[0x1E0D387A0]);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = -[CKMediaObject isFromMe](self, "isFromMe");
          v30 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v51 = v25;
          v52 = 2112;
          if (v29)
            v30 = CFSTR("YES");
          v53 = v30;
          v54 = 2112;
          v55 = v26;
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Persisted preview at url %@ isFromMe %@ is %@", buf, 0x20u);
        }

      }
      if (v26)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v51 = self;
            _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "%@ preview read from disk.", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = -[CKMediaObject isFromMe](self, "isFromMe");
            v34 = CFSTR("NO");
            if (v33)
              v34 = CFSTR("YES");
            *(_DWORD *)buf = 138412546;
            v51 = v25;
            v52 = 2112;
            v53 = v34;
            _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Got persisted preview from disk at URL %@ isFromMe %@", buf, 0x16u);
          }

        }
        objc_msgSend(v15, "setCachedPreview:key:", v26, v7);
        v13 = v26;

        goto LABEL_77;
      }
    }

LABEL_56:
    if (-[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
    {
      -[CKMediaObject generateOOPPreviewForWidth:orientation:](self, "generateOOPPreviewForWidth:orientation:", v4, a3);
      v13 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Using legacy preview generator", buf, 2u);
        }

      }
      v36 = (__CFString *)objc_alloc_init(MEMORY[0x1E0D36AE8]);
      -[__CFString startTimingForKey:](v36, "startTimingForKey:", CFSTR("CKMediaObject_PreviewGenerationTime"));
      if (-[CKMediaObject mediaType](self, "mediaType") == 7 || -[CKMediaObject mediaType](self, "mediaType") == 9)
      {
        -[CKMediaObject generateThumbnailForWidth:orientation:](self, "generateThumbnailForWidth:orientation:", v4, a3);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[CKMediaObject generateThumbnailForWidth:orientation:](self, "generateThumbnailForWidth:orientation:", v4, a3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v37, v4, a3);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[__CFString stopTimingForKey:](v36, "stopTimingForKey:", CFSTR("CKMediaObject_PreviewGenerationTime"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          -[CKMediaObject UTIType](self, "UTIType");
          v39 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v51 = v39;
          v52 = 2112;
          v53 = v36;
          _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with timing: %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trackEvent:", *MEMORY[0x1E0D387A8]);

      if (v13)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            -[CKMediaObject transferGUID](self, "transferGUID");
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[CKMediaObject filename](self, "filename");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v51 = self;
            v52 = 2112;
            v53 = v42;
            v54 = 2112;
            v55 = v43;
            _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "[%p, %@, %@] preview generated.", buf, 0x20u);

          }
        }
        -[CKMediaObject cacheAndPersistPreview:orientation:](self, "cacheAndPersistPreview:orientation:", v13, v4);
      }

    }
    goto LABEL_77;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Preview generation failed - returning no preview", buf, 2u);
    }

  }
  v13 = 0;
LABEL_79:

  return v13;
}

- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  _BYTE buf[12];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Prewarm: Asked to prewarm preview for key %@", buf, 0xCu);
    }

  }
  if (!-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    -[CKMediaObject transfer](self, "transfer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CKMediaObject isPreviewable](self, "isPreviewable")
      || (objc_msgSend(v9, "isFileDataReady") & 1) == 0 && (objc_msgSend(v9, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v6;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, not previewable", buf, 0xCu);
        }

      }
      goto LABEL_31;
    }
    -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedPreviewForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v6;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Prewarm: %@ already in cache", buf, 0xCu);
        }

      }
      goto LABEL_30;
    }
    -[CKMediaObject transfer](self, "transfer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isFileURLFinalized"))
    {

    }
    else
    {
      -[CKMediaObject transfer](self, "transfer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isSticker");

      if (!v16)
      {
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
    }
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewCachesFileURLWithOrientation:extension:generateIntermediaries:](self, "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", v4, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Prewarm: Async fetching %@ at path %@", buf, 0x16u);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    +[CKPreviewDispatchCache previewPrewarmQueue](CKPreviewDispatchCache, "previewPrewarmQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke;
    block[3] = &unk_1E2759D88;
    objc_copyWeak(&v26, (id *)buf);
    v23 = v18;
    v27 = v4;
    v24 = v6;
    v25 = v10;
    v21 = v18;
    dispatch_async(v20, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, transcode generation failed", buf, 0xCu);
    }

  }
LABEL_32:

}

void __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_msgSend(WeakRetained, "validPreviewExistsAtURL:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "savedPreviewFromURL:forOrientation:", *(_QWORD *)(a1 + 32), *(char *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = objc_loadWeakRetained(v2);
        v16 = 138412546;
        v17 = v6;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Prewarm: preview %@, welf %@", (uint8_t *)&v16, 0x16u);

      }
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke_108;
    v12[3] = &unk_1E274A0B8;
    v13 = v6;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v9 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 32);
      v16 = 138412290;
      v17 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Prewarm: No valid preview exists at %@", (uint8_t *)&v16, 0xCu);
    }

  }
}

void __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke_108(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Prewarm: returned value is %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v4 = *(_QWORD *)(a1 + 32) == 0;
  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Prewarm: No preview on disk for %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  else
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Prewarm: Successfully prewarmed %@", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "setCachedPreview:key:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
}

- (void)generateOOPPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t (*v7)(uint64_t, uint64_t);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  id v19;
  _BYTE *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:");
  v7 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[CKMediaObject UTIType](self, "UTIType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      v29 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Request to generate OOP preview for type %@ width %f key %@", buf, 0x20u);

    }
  }
  -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isGeneratingPreviewForKey:", v7) & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v7;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Already generating OOP preview for key %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v12, "startTimingForKey:", CFSTR("OOPPreviewGeneration"));
    v27 = 0;
    v25 = 0u;
    v26 = 0u;
    -[CKMediaObject _previewConstraintsForWidth:](self, "_previewConstraintsForWidth:", a3);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v29 = __Block_byref_object_copy__74;
    v30 = __Block_byref_object_dispose__74;
    v31 = 0;
    -[CKMediaObject fileURL](self, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentPreviewFileURL();
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v15 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke;
      v17[3] = &unk_1E2759DD8;
      v20 = buf;
      v17[4] = self;
      v21 = v25;
      v22 = v26;
      v23 = v27;
      v24 = a4;
      v18 = v10;
      v19 = v12;
      v16[0] = v15;
      v16[1] = 3221225472;
      v16[2] = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_112;
      v16[3] = &unk_1E274A208;
      v16[4] = self;
      objc_msgSend(v18, "enqueueGenerationBlock:completion:withPriority:forKey:", v17, v16, 0, v7);

    }
    _Block_object_dispose(buf, 8);

  }
}

id __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, void *);
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[16];
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "previewFilenameExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttachmentPreviewFileURL();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__74;
  v36 = __Block_byref_object_dispose__74;
  v37 = 0;
  objc_msgSend(*(id *)(a1 + 32), "senderContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_transcodeControllerSharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(*(_QWORD *)(v12 + 8) + 40);
  v22 = MEMORY[0x1E0C809B0];
  v24 = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2;
  v25 = &unk_1E2759DB0;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v29 = &v32;
  v30 = v12;
  v26 = v14;
  v23 = 3221225472;
  v31 = *(_BYTE *)(a1 + 104);
  v27 = v15;
  v16 = v3;
  v28 = v16;
  v17 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 64);
  v39 = v17;
  v40 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v10, "generatePreview:previewURL:senderContext:constraints:completionBlock:blockUntilReply:", v11, v13, v9, buf, &v22, 1);

  if (v33[5])
    objc_msgSend(*(id *)(a1 + 32), "setCachedValidPreviewExists:", 1, v22, v23, v24, v25, v26, v27);
  objc_msgSend(*(id *)(a1 + 48), "stopTimingForKey:", CFSTR("OOPPreviewGeneration"), v22, v23, v24, v25, v26);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Preview generation timing %@", buf, 0xCu);
    }

  }
  v20 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v20;
}

void __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "savedPreviewFromURL:forOrientation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(char *)(a1 + 72));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "IMTranscoderAgent preview generation completed with preview %@ error %@", (uint8_t *)&v13, 0x16u);
    }

  }
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCachedPreview:key:", v10, *(_QWORD *)(a1 + 48));
  }
  else
  {
    +[CKMediaObject transferGUIDSFailingPreviewGeneration](CKMediaObject, "transferGUIDSFailingPreviewGeneration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "transferGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
}

void __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_112(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2_113;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2_113(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Posting preview change notif for OOP generation completion", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "postPreviewDidChangeNotifications");
  return objc_msgSend(*(id *)(a1 + 32), "_refreshSpatialMetadata");
}

- (id)_transcodeControllerSharedInstance
{
  return (id)objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
}

- (void)_sampleImageEdges:(id)a3 usingRect:(CGRect)a4 forMostlyWhitePixels:(unint64_t *)a5 otherPixels:(unint64_t *)a6
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  void *v13;
  double v14;
  int64_t v15;
  double v16;
  uint64_t v17;
  __IOSurface *v18;
  __IOSurface *v19;
  char *BaseAddress;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGImage *v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int64_t v33;
  CGColorSpace *DeviceRGB;
  CGContext *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  id v39;
  CGRect v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v39 = a3;
  objc_msgSend(v39, "size");
  v13 = v39;
  v15 = (uint64_t)v14;
  if ((unint64_t)((uint64_t)v14 - 0x2000000000000000) >> 62 != 3)
    goto LABEL_53;
  v16 = v12;
  v17 = 4 * v15;
  v18 = (__IOSurface *)objc_msgSend(v39, "ioSurface");
  v19 = v18;
  if (v18)
  {
    IOSurfaceLock(v18, 1u, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(v19);
    if (!BaseAddress)
    {
      v25 = 0;
      v26 = 0;
LABEL_47:
      IOSurfaceUnlock(v19, 1u, 0);
      goto LABEL_49;
    }
LABEL_4:
    v21 = (uint64_t)x;
    v22 = (uint64_t)width;
    v23 = (uint64_t)y;
    v24 = (uint64_t)height;
    if ((uint64_t)y >= (uint64_t)height)
    {
      v26 = 0;
      v25 = 0;
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v27 = 4 * v15 * v23;
      v28 = &BaseAddress[4 * v21 + 1 + v27];
      v29 = 8 * v15;
      v30 = (uint64_t)y;
      do
      {
        if ((v28[1] < 0xFBu || *v28 < 0xFBu || *(v28 - 1) <= 0xFAu)
          && v28[2] > 0x31u)
        {
          v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v30 += 2;
        v28 += v29;
      }
      while (v30 < v24);
      v31 = &BaseAddress[4 * v22 - 2 + v27];
      v32 = (uint64_t)y;
      do
      {
        if ((*v31 < 0xFBu
           || *(v31 - 1) < 0xFBu
           || *(v31 - 2) <= 0xFAu)
          && v31[1] > 0x31u)
        {
          v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v32 += 2;
        v31 += v29;
      }
      while (v32 < v24);
    }
    if (v21 < v22)
    {
      v36 = &BaseAddress[4 * v21 + 3 + v17 * v23];
      v37 = (uint64_t)x;
      do
      {
        if ((*(v36 - 1) < 0xFBu
           || *(v36 - 2) < 0xFBu
           || *(v36 - 3) <= 0xFAu)
          && *v36 > 0x31u)
        {
          v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v37 += 2;
        v36 += 8;
      }
      while (v37 < v22);
      v38 = &BaseAddress[4 * v21 + 3 + v17 * (v24 - 1)];
      do
      {
        if ((*(v38 - 1) < 0xFBu
           || *(v38 - 2) < 0xFBu
           || *(v38 - 3) <= 0xFAu)
          && *v38 > 0x31u)
        {
          v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v21 += 2;
        v38 += 8;
      }
      while (v21 < v22);
    }
    if (!v19)
    {
      free(BaseAddress);
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  v25 = (CGImage *)objc_msgSend(objc_retainAutorelease(v39), "CGImage");
  if (v25)
  {
    v33 = (uint64_t)v16 * v17;
    v13 = v39;
    if ((unsigned __int128)((uint64_t)v16 * (__int128)v17) >> 64 != v33 >> 63)
      goto LABEL_53;
    BaseAddress = (char *)malloc_type_malloc(v33, 0xC792E4A8uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v35 = CGBitmapContextCreate(BaseAddress, v15, (uint64_t)v16, 8uLL, 4 * v15, DeviceRGB, 0x4001u);
    v40.size.width = (double)v15;
    v40.size.height = (double)(uint64_t)v16;
    v40.origin.x = 0.0;
    v40.origin.y = 0.0;
    CGContextDrawImage(v35, v40, v25);
    CGContextRelease(v35);
    CGColorSpaceRelease(DeviceRGB);
    if (BaseAddress)
      goto LABEL_4;
    v25 = 0;
  }
  v26 = 0;
LABEL_49:
  v13 = v39;
  if (a5)
    *a5 = v26;
  if (a6)
    *a6 = (unint64_t)v25;
LABEL_53:

}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  CKMediaObject *v28;
  double v29;
  double v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScale:", 0.0);
    objc_msgSend(v8, "setPreferredRange:", 0);
    objc_msgSend(v8, "setOpaque:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    objc_msgSend(v9, "thumbnailFillSizeForWidth:imageSize:", a4, v10, v11);
    v13 = v12;
    v15 = v14;

    objc_msgSend(v7, "__ck_imageScaledToFillSize:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v18 = (v13 - v17) * 0.5;
    objc_msgSend(v16, "size");
    v20 = (v15 - v19) * 0.5;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v8, v13, v15);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __73__CKMediaObject_Display__generatePreviewFromThumbnail_width_orientation___block_invoke;
    v26[3] = &unk_1E2756778;
    v29 = v18;
    v30 = v20;
    v27 = v16;
    v28 = self;
    v22 = v16;
    objc_msgSend(v21, "imageWithActions:", v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CKMediaObject(Display) generatePreviewFromThumbnail:width:orientation:]";
        _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "passed %s a nil thumbnail", buf, 0xCu);
      }

    }
    v23 = 0;
  }

  return v23;
}

void __73__CKMediaObject_Display__generatePreviewFromThumbnail_width_orientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  CGRect v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (objc_msgSend((id)objc_opt_class(), "shouldShadePreview"))
  {
    v10 = 0;
    v11 = 0;
    v6 = a1 + 32;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v6 + 8);
    objc_msgSend(v3, "format");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    objc_msgSend(v5, "_sampleImageEdges:usingRect:forMostlyWhitePixels:otherPixels:", v4, &v11, &v10);

    if ((double)(v10 + v11) / 5.0 < (double)v11)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.525490196, 0.525490196, 0.525490196, 0.06);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "set");

      objc_msgSend(v3, "format");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      UIRectFillUsingBlendMode(v12, kCGBlendModeSourceAtop);

    }
  }

}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "UTITypes", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((IMIsSupportedUTIType() & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (BOOL)canGeneratePreviewInMVSHostProcess
{
  return 1;
}

- (CGSize)transcoderGeneratedSizeForConstraints:(IMPreviewConstraints *)a3
{
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double var2;
  double v10;
  double v11;
  double v12;
  IMPreviewConstraints v13;
  CGSize result;

  -[CKMediaObject transcodingPreviewConstraints](self, "transcodingPreviewConstraints");
  v13 = *a3;
  v5 = 0.0;
  if (!IMPreviewConstraintsEqualToConstraints()
    || ((-[CKMediaObject transcodingPreviewPxSize](self, "transcodingPreviewPxSize", *(_OWORD *)&v13.var0, *(_OWORD *)&v13.var1.height, *(_QWORD *)&v13.var3), v6 == *MEMORY[0x1E0C9D820])? (v8 = v7 == *(double *)(MEMORY[0x1E0C9D820] + 8)): (v8 = 0), v8))
  {
    v10 = 0.0;
  }
  else
  {
    var2 = a3->var2;
    v10 = 0.0;
    if (var2 > 0.0)
    {
      v10 = v6 / var2;
      v5 = v7 / var2;
    }
  }
  v11 = v10;
  v12 = v5;
  result.height = v12;
  result.width = v11;
  return result;
}

- (IMPreviewConstraints)transcodingPreviewConstraints
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  IMPreviewConstraints *result;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject transfer](self, "transfer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37F48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)&retstr->var3 = 0;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var1.height = 0u;
    IMPreviewConstraintsFromDictionary();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject transferGUID](self, "transferGUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKMediaObject_Display: no generated preview constraints dictionary found for media object %@", (uint8_t *)&v11, 0xCu);

      }
    }
    IMPreviewConstraintsZero();
  }

  return result;
}

- (CGSize)transcodingPreviewPxSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  int v17;
  void *v18;
  uint64_t v19;
  CGSize result;

  v19 = *MEMORY[0x1E0C80C00];
  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D37F58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "attributionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D37F50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject transferGUID](self, "transferGUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "CKMediaObject_Display: no generated preview size value found for media object %@", (uint8_t *)&v17, 0xCu);

      }
    }
    v12 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(v5, "floatValue");
    v12 = v11;
    objc_msgSend(v7, "floatValue");
    v14 = v13;
  }

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)savePreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CKMediaObject(Display) savePreview:toURL:forOrientation:]";
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "%s persisting to %@", buf, 0x16u);
    }

  }
  if (v8
    && (-[CKMediaObject fileManager](self, "fileManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "path"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "fileExistsAtPath:", v11),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    v14 = v7;
    v15 = v8;
    im_perform_with_task_assertion();

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = (const char *)v8;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "No need to persist preview, URL already exists: %@", buf, 0xCu);
    }

  }
}

void __59__CKMediaObject_Display__savePreview_toURL_forOrientation___block_invoke(uint64_t a1)
{
  BOOL v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[CKImageData supportsASTC](CKImageData, "supportsASTC"))
  {
    v2 = +[CKImageData supportsASTC](CKImageData, "supportsASTC");
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (v2)
      objc_msgSend(v3, "ASTCDataFromImage:", v4);
    else
      objc_msgSend(v3, "JPEGDataFromImage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CKFreeSpaceWriteDataToURL(v5, *(void **)(a1 + 48), 1);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 48);
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "%@ preview saved to %@.", (uint8_t *)&v9, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D398A0], "persistCPBitmapWithImage:url:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage"), *(_QWORD *)(a1 + 48));
  }
}

- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15[2];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Prewarm: %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = 0;
    IMAttachmentFileNameAndExtension();
    v7 = 0;

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpbitmap")))
    {
      v15[0] = 0;
      +[CKMultiFrameImage firstFrameImageWithContentsOfCPBitmapURL:error:](CKMultiFrameImage, "firstFrameImageWithContentsOfCPBitmapURL:error:", v4, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15[0];
      v10 = v8;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Prewarm got bitmap %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v4, 1, 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Prewarm got data %@", buf, 0xCu);
        }

      }
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "ckImageWithData:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v10;
            _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Prewarm got image %@", buf, 0xCu);
          }

        }
      }
      else
      {
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)validPreviewExistsAtURL:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKMediaObject cachedValidPreviewExists](self, "cachedValidPreviewExists"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    if (v8)
    {
      if (-[CKMediaObject validatePreviewFormat](self, "validatePreviewFormat")
        && +[CKImageData supportsASTC](CKImageData, "supportsASTC"))
      {
        CGImageSourceGetTypeWithURL();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9
          && ((objc_msgSend(v9, "isEqualToString:", CFSTR("org.khronos.ktx")) & 1) != 0
           || (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.atx")) & 1) != 0))
        {
          v5 = 1;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v13 = 138412802;
              v14 = v4;
              v15 = 2112;
              v16 = CFSTR("org.khronos.ktx");
              v17 = 2112;
              v18 = v10;
              _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Persisted preview at %@ expected %@ got %@", (uint8_t *)&v13, 0x20u);
            }

          }
          v5 = 0;
        }

      }
      else
      {
        v5 = 1;
      }
    }
    else
    {
      v5 = 0;
    }
    -[CKMediaObject setCachedValidPreviewExists:](self, "setCachedValidPreviewExists:", v5);
  }

  return v5;
}

- (id)previewMetadata
{
  CKMediaObject *v3;
  id v4;
  void *v6;
  CKMediaObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  CKMediaObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  const __CFString *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  const __CFString *v32;
  NSObject *v33;
  NSObject *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  CKMediaObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  CKMediaObject *v48;
  _QWORD v49[5];
  _QWORD v50[4];
  CKMediaObject *v51;
  CKMediaObject *v52;
  id v53;
  CKMediaObject *v54;
  __int128 *v55;
  uint8_t buf[4];
  CKMediaObject *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!-[CKMediaObject conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE1DAFB0))
    return 0;
  v3 = self;
  if (!-[CKMediaObject supportsPreviewMetadata](v3, "supportsPreviewMetadata")
    || -[CKMediaObject transcoderPreviewGenerationFailed](v3, "transcoderPreviewGenerationFailed"))
  {
    v4 = 0;
    goto LABEL_74;
  }
  -[CKMediaObject transfer](v3, "transfer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKMediaObject isPreviewable](v3, "isPreviewable")
    || (objc_msgSend(v6, "isFileDataReady") & 1) == 0 && (objc_msgSend(v6, "isRestoring") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LODWORD(v64) = 138412290;
        *(_QWORD *)((char *)&v64 + 4) = v3;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "%@ isn't previewable.", (uint8_t *)&v64, 0xCu);
      }

    }
    v4 = 0;
    goto LABEL_73;
  }
  *(_QWORD *)&v64 = 0;
  *((_QWORD *)&v64 + 1) = &v64;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__74;
  v67 = __Block_byref_object_dispose__74;
  v68 = 0;
  CKPreviewMetadataCacheKey(v3);
  v7 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject previewDispatchCache](v3, "previewDispatchCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedPreviewForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(*((_QWORD *)&v64 + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40) = v9;

  if (*(_QWORD *)(*((_QWORD *)&v64 + 1) + 40))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject transferGUID](v3, "transferGUID");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject filename](v3, "filename");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40);
        *(_DWORD *)buf = 134218754;
        v57 = v3;
        v58 = 2112;
        v59 = v12;
        v60 = 2112;
        v61 = v13;
        v62 = 2112;
        v63 = v14;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "[%p, %@, %@] found in cache! returning %@", buf, 0x2Au);

      }
    }
    v4 = *(id *)(*((_QWORD *)&v64 + 1) + 40);
    goto LABEL_72;
  }
  -[CKMediaObject fileURL](v3, "fileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject previewMetadataFilenameExtension](v3, "previewMetadataFilenameExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttachmentPreviewMetadataFileURL();
  v18 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();

  -[CKMediaObject transfer](v3, "transfer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v19, "isFileURLFinalized");

  if (!(_DWORD)v17)
    goto LABEL_78;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject path](v18, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "fileExistsAtPath:", v21);

  if (!v22)
    goto LABEL_78;
  _CKMediaObjectPreviewMetadataWithContentsOfURL(v3, v18, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(void **)(*((_QWORD *)&v64 + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40) = v23;

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trackEvent:", *MEMORY[0x1E0D387A0]);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = -[CKMediaObject isFromMe](v3, "isFromMe");
      v28 = CFSTR("NO");
      v29 = *(void **)(*((_QWORD *)&v64 + 1) + 40);
      if (v27)
        v28 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v57 = v18;
      v58 = 2112;
      v59 = v28;
      v60 = 2112;
      v61 = v29;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Persisted preview metadata at url %@ isFromMe %@ is %@", buf, 0x20u);
    }

  }
  if (*(_QWORD *)(*((_QWORD *)&v64 + 1) + 40))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = -[CKMediaObject isFromMe](v3, "isFromMe");
        v32 = CFSTR("NO");
        if (v31)
          v32 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v57 = v18;
        v58 = 2112;
        v59 = v32;
        _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Got persisted preview metadata from disk at URL %@ isFromMe %@", buf, 0x16u);
      }

    }
    objc_msgSend(v8, "setCachedPreview:key:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40), v7);
  }
  else
  {
LABEL_78:
    if (-[CKMediaObject generatePreviewOutOfProcess](v3, "generatePreviewOutOfProcess"))
    {
      if (objc_msgSend(v8, "isGeneratingPreviewForKey:", v7))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v7;
            _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "Already generating OOP preview for key %@", buf, 0xCu);
          }

        }
      }
      else
      {
        -[CKMediaObject fileURL](v3, "fileURL");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject previewMetadataFilenameExtension](v3, "previewMetadataFilenameExtension");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        IMAttachmentPreviewMetadataFileURL();
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v7;
              _os_log_impl(&dword_18DFCD000, v45, OS_LOG_TYPE_INFO, "Request to generate OOP preview metadata with key %@", buf, 0xCu);
            }

          }
          v46 = MEMORY[0x1E0C809B0];
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __41__CKMediaObject_Display__previewMetadata__block_invoke;
          v50[3] = &unk_1E2759E28;
          v51 = v3;
          v18 = v44;
          v52 = v18;
          v55 = &v64;
          v53 = v8;
          v54 = v51;
          v49[0] = v46;
          v49[1] = 3221225472;
          v49[2] = __41__CKMediaObject_Display__previewMetadata__block_invoke_148;
          v49[3] = &unk_1E274A208;
          v49[4] = v51;
          objc_msgSend(v53, "enqueueGenerationBlock:completion:withPriority:forKey:", v50, v49, 0, v7);

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              -[CKMediaObject fileURL](v3, "fileURL");
              v48 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v57 = v48;
              _os_log_impl(&dword_18DFCD000, v47, OS_LOG_TYPE_INFO, "Failed to create destination for %@", buf, 0xCu);

            }
          }
          v18 = 0;
        }
      }
      v4 = 0;
      goto LABEL_71;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Generating preview metadata in process", buf, 2u);
        }

      }
      v35 = (__CFString *)objc_alloc_init(MEMORY[0x1E0D36AE8]);
      -[__CFString startTimingForKey:](v35, "startTimingForKey:", CFSTR("CKMediaObject_PreviewMetadataGenerationTime"));
      -[CKMediaObject generatePreviewMetadata](v3, "generatePreviewMetadata");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(void **)(*((_QWORD *)&v64 + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&v64 + 1) + 40) = v36;

      -[__CFString stopTimingForKey:](v35, "stopTimingForKey:", CFSTR("CKMediaObject_PreviewMetadataGenerationTime"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          -[CKMediaObject UTIType](v3, "UTIType");
          v39 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v57 = v39;
          v58 = 2112;
          v59 = v35;
          _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with timing: %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trackEvent:", *MEMORY[0x1E0D387A8]);

      if (*(_QWORD *)(*((_QWORD *)&v64 + 1) + 40))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v3;
            _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "%@ preview metadata generated.", buf, 0xCu);
          }

        }
        _CKMediaObjectWritePreviewMetadata(v3, *(void **)(*((_QWORD *)&v64 + 1) + 40));
      }

    }
  }
  v4 = *(id *)(*((_QWORD *)&v64 + 1) + 40);
LABEL_71:

LABEL_72:
  _Block_object_dispose(&v64, 8);

LABEL_73:
LABEL_74:

  return v4;
}

uint64_t __41__CKMediaObject_Display__previewMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD v30[2];
  uint64_t v31;
  _QWORD v32[4];
  uint64_t *v33;
  uint8_t buf[16];
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v4, "startTimingForKey:", CFSTR("OOPPreviewGeneration"));
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = MEMORY[0x1E0C809B0];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __41__CKMediaObject_Display__previewMetadata__block_invoke_2;
  v23 = &unk_1E2759E00;
  v29 = *(_QWORD *)(a1 + 64);
  v24 = v5;
  v25 = *(id *)(a1 + 40);
  v26 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 56);
  v27 = v8;
  v28 = v9;
  v10 = v24;
  v11 = v6;
  v12 = &v20;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "generateOOPPreviewMetadataToURL:WithCompletionBlock:", v11, v12, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    v36 = 0;
    *(_OWORD *)buf = 0u;
    v35 = 0u;
    objc_msgSend(v10, "defaultPreviewWidth", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    if (v10)
    {
      objc_msgSend(v10, "_previewConstraintsForWidth:");
    }
    else
    {
      v36 = 0;
      *(_OWORD *)buf = 0u;
      v35 = 0u;
    }
    BYTE1(v36) = 1;
    objc_msgSend(v10, "messageContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSenderUnknown");

    objc_msgSend(MEMORY[0x1E0D39A10], "contextWithKnownSender:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_transcodeControllerSharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = ___CKMediaObjectGenerateOOPPreviewMetadata_block_invoke;
    v32[3] = &unk_1E2759E50;
    v33 = v12;
    v30[0] = *(_OWORD *)buf;
    v30[1] = v35;
    v31 = v36;
    objc_msgSend(v16, "generateMetadata:metadataURL:senderContext:constraints:completionBlock:blockUntilReply:", v17, v11, v15, v30, v32, 1);

  }
  objc_msgSend(v4, "stopTimingForKey:", CFSTR("OOPPreviewGeneration"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Preview generation timing %@", buf, 0xCu);
    }

  }
  return 0;
}

void __41__CKMediaObject_Display__previewMetadata__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v15 = a2;
  v5 = a2;
  _CKMediaObjectPreviewMetadataWithContentsOfURL(v3, v4, &v15);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v15;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "IMTranscoderAgent preview generation completed with metadata: %@, error: %@", buf, 0x16u);
    }

  }
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "setCachedPreview:key:", v12, *(_QWORD *)(a1 + 56));
  }
  else
  {
    +[CKMediaObject transferGUIDSFailingPreviewGeneration](CKMediaObject, "transferGUIDSFailingPreviewGeneration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "transferGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
}

void __41__CKMediaObject_Display__previewMetadata__block_invoke_148(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CKMediaObject_Display__previewMetadata__block_invoke_2_149;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __41__CKMediaObject_Display__previewMetadata__block_invoke_2_149(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Posting preview change notif for OOP generation completion", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "postPreviewDidChangeNotifications");
}

- (void)postPreviewDidChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CKPreviewDidChangeNotification"), self);
  if (-[CKMediaObject didRequestAdaptiveImageGlyphDerivedFromPreviewImage](self, "didRequestAdaptiveImageGlyphDerivedFromPreviewImage")&& !-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CKAdaptiveImageGlyphGeneratedNotification"), self);
  }

}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  double height;
  double width;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  height = a3.height;
  width = a3.width;
  v12 = *MEMORY[0x1E0C80C00];
  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject transferGUID](self, "transferGUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v10, 0xCu);

      }
    }
    v8 = 0;
  }
  else
  {
    -[CKMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", width, height, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (CGSize)bbSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  return 0;
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  return 0;
}

- (id)previewDispatchCache
{
  return +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
}

- (id)fileManager
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
}

- (id)JPEGDataFromImage:(id)a3
{
  return (id)CKUIImageJPEGRepresentationWithHardwareAcceleration();
}

- (id)ASTCDataFromImage:(id)a3
{
  return (id)objc_msgSend(a3, "__ck_ASTCRepresentation");
}

+ (id)iconCache
{
  if (iconCache_once != -1)
    dispatch_once(&iconCache_once, &__block_literal_global_237);
  return (id)iconCache_sIconCache;
}

void __35__CKMediaObject_Display__iconCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  CKCreateNSCache(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iconCache_sIconCache;
  iconCache_sIconCache = v0;

}

+ (id)transferGUIDSFailingPreviewGeneration
{
  if (transferGUIDSFailingPreviewGeneration_once != -1)
    dispatch_once(&transferGUIDSFailingPreviewGeneration_once, &__block_literal_global_152_1);
  return (id)transferGUIDSFailingPreviewGeneration_sFailureSet;
}

void __63__CKMediaObject_Display__transferGUIDSFailingPreviewGeneration__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)transferGUIDSFailingPreviewGeneration_sFailureSet;
  transferGUIDSFailingPreviewGeneration_sFailureSet = (uint64_t)v0;

}

- (id)blastdooredAdaptiveImageGlyphFileURL
{
  void *v3;
  void *v4;
  void *v5;

  -[CKMediaObject transfer](self, "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFileURLFinalized"))
  {
    -[CKMediaObject fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IMAttachmentEmojiImagePreviewFileURL();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)cachedBlastdooredAdaptiveImageGlyph
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;

  if (-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
    return 0;
  -[CKMediaObject transfer](self, "transfer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKMediaObject isPreviewable](self, "isPreviewable")
    || (objc_msgSend(v4, "isFileDataReady") & 1) == 0 && (objc_msgSend(v4, "isRestoring") & 1) == 0)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.9();
    v8 = 0;
    goto LABEL_38;
  }
  -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
  v5 = objc_claimAutoreleasedReturnValue();
  CKEmojiImagePreviewCacheKey(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cachedPreviewForKey:](v5, "cachedPreviewForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.7();
LABEL_16:

    if (objc_msgSend(v4, "isFileURLFinalized"))
    {
      -[CKMediaObject blastdooredAdaptiveImageGlyphFileURL](self, "blastdooredAdaptiveImageGlyphFileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = -[NSObject fileExistsAtPath:](v12, "fileExistsAtPath:", v11);
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "trackEvent:", *MEMORY[0x1E0D387A0]);

        if (v13)
        {
          v22 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v10, 1, &v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v22;
          IMLogHandleForCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v15)
          {
            v21 = v16;
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.6();

            v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1260]), "initWithImageContent:", v15);
            IMLogHandleForCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            v18 = v19;
            if (v8)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.5();

              -[NSObject setCachedPreview:key:](v5, "setCachedPreview:key:", v8, v6);
              goto LABEL_37;
            }
            v16 = v21;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.4();
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.3();
          }

        }
      }
      else
      {
        IMLogHandleForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.2();
      }

    }
    IMLogHandleForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.1();

    v8 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.8();
    goto LABEL_16;
  }
  v8 = v7;
LABEL_37:

LABEL_38:
  return v8;
}

- (void)generateAndCacheBlastdooredAdaptiveImageGlyph
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  CKMediaObject *v12;
  _QWORD aBlock[4];
  id v14;
  id location;

  -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKEmojiImagePreviewCacheKey(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isGeneratingPreviewForKey:", v4))
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CKMediaObject(EmojiImage) generateAndCacheBlastdooredAdaptiveImageGlyph].cold.1();

  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke;
    aBlock[3] = &unk_1E275A248;
    objc_copyWeak(&v14, &location);
    v7 = _Block_copy(aBlock);
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CKMediaObject(EmojiImage) generateAndCacheBlastdooredAdaptiveImageGlyph].cold.2();

    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_30;
    v9[3] = &unk_1E274A0B8;
    v10 = v3;
    v11 = v4;
    v12 = self;
    objc_msgSend(v10, "enqueueGenerationBlock:completion:withPriority:forKey:", v7, v9, 1, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

id __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "generateNewBlastdooredAdaptiveImageGlyph");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_30(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2;
  block[3] = &unk_1E274A0B8;
  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "saveAdaptiveImageGlyphToFileCache:", v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("CKAdaptiveImageGlyphGeneratedNotification"), *(_QWORD *)(a1 + 48));

  }
  else
  {
    IMLogHandleForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2_cold_1();

  }
}

- (void)saveAdaptiveImageGlyphToFileCache:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (!CKIsRunningInFullCKClient())
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CKMediaObject(EmojiImage) saveAdaptiveImageGlyphToFileCache:].cold.1();

  }
  -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke;
  v8[3] = &unk_1E275A270;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enqueueSaveBlock:forMediaObject:withPriority:", v8, self, 0);

}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  id v10;

  objc_msgSend(a2, "blastdooredAdaptiveImageGlyphFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject fileExistsAtPath:](v5, "fileExistsAtPath:", v4) & 1) != 0)
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_2();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "imageContent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v8 = objc_msgSend(v7, "writeToFile:atomically:error:", v4, 1, &v10);
      v6 = v10;
      if ((v8 & 1) == 0)
      {
        IMLogHandleForCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_3();

      }
    }

  }
  else
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_1();
  }

}

- (id)adaptiveImageGlyph
{
  void *v3;

  -[CKMediaObject internalCachedAdaptiveImageGlyph](self, "internalCachedAdaptiveImageGlyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CKMediaObject cachedBlastdooredAdaptiveImageGlyph](self, "cachedBlastdooredAdaptiveImageGlyph");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[CKMediaObject setInternalCachedAdaptiveImageGlyph:](self, "setInternalCachedAdaptiveImageGlyph:", v3);
    else
      -[CKMediaObject generateAndCacheBlastdooredAdaptiveImageGlyph](self, "generateAndCacheBlastdooredAdaptiveImageGlyph");
  }
  return v3;
}

- (void)setAdaptiveImageGlyph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKMediaObject internalCachedAdaptiveImageGlyph](self, "internalCachedAdaptiveImageGlyph");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v7)
  {
    -[CKMediaObject setInternalCachedAdaptiveImageGlyph:](self, "setInternalCachedAdaptiveImageGlyph:", v7);
    if (v7)
    {
      -[CKMediaObject previewDispatchCache](self, "previewDispatchCache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CKEmojiImagePreviewCacheKey(self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCachedPreview:key:", v7, v6);
      -[CKMediaObject saveAdaptiveImageGlyphToFileCache:](self, "saveAdaptiveImageGlyphToFileCache:", v7);

    }
  }

}

- (id)generateSingleStrikeAdaptiveImageGlyphFromBlastdooredPreviewImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[CKMediaObject setDidRequestAdaptiveImageGlyphDerivedFromPreviewImage:](self, "setDidRequestAdaptiveImageGlyphDerivedFromPreviewImage:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewMaxWidth");
  -[CKMediaObject previewForWidth:orientation:](self, "previewForWidth:orientation:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(objc_retainAutorelease(v4), "CGImage");
    if (!v5)
    {
LABEL_9:
      v16 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    objc_msgSend(v4, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v5 = objc_msgSend(v8, "CGImage");

    if (!v5)
      goto LABEL_9;
  }
  v9 = objc_alloc(MEMORY[0x1E0DC1270]);
  v10 = objc_msgSend(v9, "initWithImage:alignmentInset:", v5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v11 = (void *)v10;
  if (v10)
  {
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObject transferGUID](self, "transferGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1268]), "initWithContentIdentifier:shortDescription:strikeImages:", v13, CFSTR("Preview Image"), v12);
    objc_msgSend(v14, "imageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1260]), "initWithImageContent:", v15);
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

LABEL_14:
  return v16;
}

- (void)syndicationIdentifier
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
  _os_log_error_impl(&dword_18DFCD000, v1, OS_LOG_TYPE_ERROR, "Could not derive attachment index from message item. transferGUID: %@. messageGUID: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Generated adaptive image glyph is of unexpected type. Not saving to file cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot write emoji image to disk cache without a valid file path for blastdoored emoji image preview.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Not saving generated emoji image to file cache, file already exists.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to write generated emoji image to file cache. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
