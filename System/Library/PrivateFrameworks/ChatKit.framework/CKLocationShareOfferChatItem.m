@implementation CKLocationShareOfferChatItem

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKLocationShareOfferChatItem;
  -[CKLocationShareOfferChatItem dealloc](&v4, sel_dealloc);
}

- (CKLocationShareOfferChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  CKLocationShareOfferChatItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKLocationShareOfferChatItem;
  v4 = -[CKChatItem initWithIMChatItem:maxWidth:](&v13, sel_initWithIMChatItem_maxWidth_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__handleLocationDidChangeNotification_, *MEMORY[0x1E0D35568], 0);

    objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareOfferChatItem sender](v4, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findMyLocationForHandleOrSibling:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "fmfLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        -[CKLocationShareOfferChatItem setLastKnownLocation:](v4, "setLastKnownLocation:", v10);
    }

  }
  return v4;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)failed
{
  return 0;
}

- (id)time
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IMHandle)sender
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMHandle *)v3;
}

- (void)configureBalloonView:(id)a3
{
  objc_msgSend(a3, "configureForLocationShareOfferChatItem:", self);
}

- (int64_t)offerState
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "offerState");

  return v3;
}

- (NSString)titleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;

  -[CKLocationShareOfferChatItem sender](self, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_displayNameWithAbbreviation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKLocationShareOfferChatItem offerState](self, "offerState"))
  {
    if (-[CKLocationShareOfferChatItem offerState](self, "offerState") != 1
      && -[CKLocationShareOfferChatItem offerState](self, "offerState") != 2)
    {
      v14 = 0;
      goto LABEL_10;
    }
    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SHARE_BUBBLE_LOCATION_TEXT");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SHARE_BUBBLE_ACTION_TEXT");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

  if (v12 == 1)
    v13 = CFSTR("\u200F");
  else
    v13 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return (NSString *)v14;
}

- (NSString)locationText
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[CKLocationShareOfferChatItem lastKnownLocation](self, "lastKnownLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || objc_msgSend(v3, "isEqualToString:", &stru_1E276D870))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOCATING"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return (NSString *)v3;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  void *v6;
  double v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  CKLocationShareOfferChatItem *v25;
  uint8_t buf[4];
  CKLocationShareOfferChatItem *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = (unint64_t)(v7 * a3);

  -[CKLocationShareOfferChatItem _previewCacheKey:](self, "_previewCacheKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedPreviewForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
    goto LABEL_29;
  }
  -[CKLocationShareOfferChatItem previewURLForWidth:](self, "previewURLForWidth:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareOfferChatItem savedPreviewFromURL:](self, "savedPreviewFromURL:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_15;
  if (-[CKLocationShareOfferChatItem offerState](self, "offerState") == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKLocationShareOfferChatItem _desaturatedImageForImage:](self, "_desaturatedImageForImage:", v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_DEBUG, "%@ preview read from disk.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v25 = self;
    _CKLog();
  }
  objc_msgSend(v10, "setCachedPreview:key:", v11, v9, v25);
  if (!v11)
  {
LABEL_15:
    -[CKLocationShareOfferChatItem _placeholderCacheKey](self, "_placeholderCacheKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKLocationShareOfferChatItem placeholderPreviewCache](CKLocationShareOfferChatItem, "placeholderPreviewCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_28:

      goto LABEL_29;
    }
    if (-[CKLocationShareOfferChatItem offerState](self, "offerState") == 2)
    {
      -[CKLocationShareOfferChatItem _desaturatedImageForImage:](self, "_desaturatedImageForImage:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        +[CKLocationShareOfferChatItem placeholderPreviewCache](CKLocationShareOfferChatItem, "placeholderPreviewCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v11, v15);

        goto LABEL_28;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = self;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Preview is nil for location chat item: %@ and state: IMLocationShareOfferStateExpired", buf, 0xCu);
        }
LABEL_26:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = self;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Preview is nil for location chat item: %@", buf, 0xCu);
      }
      goto LABEL_26;
    }
    v11 = 0;
    goto LABEL_28;
  }
LABEL_29:
  if (-[CKLocationShareOfferChatItem offerState](self, "offerState") != 2)
  {
    -[CKLocationShareOfferChatItem lastKnownLocation](self, "lastKnownLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
      goto LABEL_34;
    if (!v12)
    {
      -[CKLocationShareOfferChatItem previewURLForWidth:](self, "previewURLForWidth:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CKLocationShareOfferChatItem lastKnownLocation](self, "lastKnownLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareOfferChatItem lastKnownLocation](self, "lastKnownLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CKLocationShareOfferChatItem shouldUpdatePreviewWithLocation:lastKnownLocation:previewURL:](self, "shouldUpdatePreviewWithLocation:lastKnownLocation:previewURL:", v21, v22, v12);

    if (v23)
LABEL_34:
      -[CKLocationShareOfferChatItem _generateMapPreview](self, "_generateMapPreview");
  }

  return v11;
}

- (id)_previewCacheKey:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  int v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CKLocationShareOfferChatItem sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKLocationShareOfferChatItem offerState](self, "offerState");
  v9 = -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation");
  -[CKLocationShareOfferChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%d-%d-%d-%ld"), v7, v8, a3, v9, objc_msgSend(v10, "userInterfaceStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_placeholderCacheKey
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CKLocationShareOfferChatItem offerState](self, "offerState");
  -[CKLocationShareOfferChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("placeholder-%d-%ld"), v4, objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewURL
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  unint64_t v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewMaxWidth");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = (unint64_t)(v5 * v7);

  return -[CKLocationShareOfferChatItem previewURLForWidth:](self, "previewURLForWidth:", v8);
}

- (id)previewURLForWidth:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKLocationShareOfferChatItem sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLocationShareOfferChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocationSharePreviewCachesFileURL(v6, a3, (uint64_t)CFSTR("jpeg"), objc_msgSend(v7, "userInterfaceStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_generateMapPreview
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  CKLocationShareOfferChatItem *v15;
  __int128 *p_buf;
  unint64_t v17;
  _QWORD v18[7];
  __int128 buf;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapPreviewMaxWidth");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = (unint64_t)(v5 * v7);

  -[CKLocationShareOfferChatItem _previewCacheKey:](self, "_previewCacheKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isGeneratingPreviewForKey:", v9))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_DEBUG, "%@ is already generating preview. Abort.", (uint8_t *)&buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x2020000000;
    v21 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke;
    v18[3] = &unk_1E274A3F8;
    *(double *)&v18[6] = v5;
    v18[4] = self;
    v18[5] = &buf;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_97;
    v12[3] = &unk_1E274A448;
    v13 = v10;
    v14 = v9;
    v15 = self;
    p_buf = &buf;
    v17 = v8;
    objc_msgSend(v13, "enqueueGenerationBlock:completion:withPriority:forKey:", v18, v12, -1, v14);

    _Block_object_dispose(&buf, 8);
  }

}

id __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
      v31 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_DEBUG, "%@ generate preview.", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v29 = *(_QWORD *)(a1 + 32);
    _CKLog();
  }
  objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance", v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findMyLocationForHandleOrSibling:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fmfLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastKnownLocation:", v9);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationOfferMapThumbnailFillSizeForWidth:", *(double *)(a1 + 48));
    v12 = v11;
    v14 = v13;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "thumbnailContentAlignmentInsetsForOrientation:", objc_msgSend(*(id *)(a1 + 32), "balloonOrientation"));
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = *(void **)(a1 + 32);
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v24, "_generateThumbnailFillToSize:contentAlignmentInsets:withCoordinate:forState:", objc_msgSend(*(id *)(a1 + 32), "offerState"), v12, v14, v17, v19, v21, v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_97(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  __int128 v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_2;
  block[3] = &unk_1E274A448;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_3;
    v7[3] = &unk_1E274A420;
    v5 = *(_QWORD *)(a1 + 64);
    v7[4] = *(_QWORD *)(a1 + 48);
    v9 = v5;
    v8 = v2;
    objc_msgSend(v4, "enqueueSaveBlock:withPriority:", v7, -1);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("CKPreviewDidChangeNotification"), *(_QWORD *)(a1 + 48));

    }
  }

}

void __51__CKLocationShareOfferChatItem__generateMapPreview__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "sender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "transcriptTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocationSharePreviewCachesFileURL(v3, v4, (uint64_t)CFSTR("jpeg"), objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "savePreview:toURL:", *(_QWORD *)(a1 + 40), v6);
}

- (id)_generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4 withCoordinate:(CLLocationCoordinate2D)a5 forState:(int64_t)a6
{
  double longitude;
  double latitude;
  double right;
  double bottom;
  double left;
  CGFloat top;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CKEntity *v43;
  void *v44;
  CKEntity *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  NSObject *v63;
  dispatch_time_t v64;
  NSObject *v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  double v70;
  double height;
  double width;
  _QWORD v73[4];
  id v74;
  id v75;
  NSObject *v76;
  uint64_t *v77;
  __int128 *v78;
  _QWORD *v79;
  double v80;
  double v81;
  double v82;
  _QWORD v83[4];
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint8_t buf[4];
  CKLocationShareOfferChatItem *v93;
  __int128 v94;
  uint64_t v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;

  longitude = a5.longitude;
  latitude = a5.latitude;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v99 = *MEMORY[0x1E0C80C00];
  if (_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_CLLocationCoordinate2DIsValidCoreLocation != -1)
    dispatch_once(&_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_3);
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__1;
  v90 = __Block_byref_object_dispose__1;
  v91 = 0;
  if ((_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___CLLocationCoordinate2DIsValid(latitude, longitude) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        LODWORD(v94) = 138412290;
        *(_QWORD *)((char *)&v94 + 4) = self;
        _os_log_impl(&dword_18DFCD000, v66, OS_LOG_TYPE_INFO, "%@ has invalid coordinate. Abort preview generation.", (uint8_t *)&v94, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
    goto LABEL_38;
  }
  v13 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit")));
  objc_msgSend(v13, "setMapType:", 0);
  if (_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_MKCoordinateRegionMakeWithDistanceMapKit != -1)
    dispatch_once(&_generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_109);
  _generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___MKCoordinateRegionMakeWithDistance(latitude, longitude, 500.0, 500.0);
  if (v15 >= -180.0
    && v15 <= 180.0
    && v14 >= -90.0
    && v14 <= 90.0
    && v16 >= 0.0
    && v16 <= 180.0
    && v17 >= 0.0
    && v17 <= 360.0)
  {
    objc_msgSend(v13, "setRegion:");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "locationShareBalloonButtonHeight");
    v20 = v19;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "locationShareBalloonLabelMaxHeightForOfferState:", 0);
    v23 = v22;

    v70 = v20 + v23;
    v24 = height + v20 + v23;
    objc_msgSend(v13, "setSize:", width, v24);
    -[CKLocationShareOfferChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTraitCollection:", v25);

    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("fmf_disc"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = top;
    *(_QWORD *)&v94 = 0;
    *((_QWORD *)&v94 + 1) = &v94;
    v95 = 0x4010000000;
    v96 = &unk_18E8EEE6F;
    v97 = 0u;
    v98 = 0u;
    objc_msgSend(v26, "size");
    v29 = v28;
    v31 = v30;
    v32 = left + *MEMORY[0x1E0C9D538];
    v33 = v27;
    v34 = v27 + *(double *)(MEMORY[0x1E0C9D538] + 8);
    v35 = width - (left + right);
    v36 = v24 - (v33 + bottom);
    if (CKMainScreenScale_once_1 != -1)
      dispatch_once(&CKMainScreenScale_once_1, &__block_literal_global_192);
    v37 = *(double *)&CKMainScreenScale_sMainScreenScale_1;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_1 == 0.0)
      v37 = 1.0;
    v38 = v29 * v37;
    v39 = v31 * v37;
    v40 = v32 * v37 + floor((v35 * v37 - v29 * v37) * 0.5);
    v41 = v34 * v37 + floor((v36 * v37 - v31 * v37) * 0.5);
    v42 = 1.0 / v37;
    *(double *)&v97 = v42 * v40;
    *((double *)&v97 + 1) = v42 * v41;
    *(double *)&v98 = v38 * v42;
    *((double *)&v98 + 1) = v39 * v42;
    v43 = [CKEntity alloc];
    -[CKLocationShareOfferChatItem sender](self, "sender");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[CKEntity initWithIMHandle:](v43, "initWithIMHandle:", v44);

    v46 = v35;
    -[CKEntity locationShareBalloonContactImage](v45, "locationShareBalloonContactImage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x4010000000;
    v83[3] = &unk_18E8EEE6F;
    v84 = 0u;
    v85 = 0u;
    objc_msgSend(v47, "size");
    v49 = v48;
    v51 = v50;
    if (CKMainScreenScale_once_1 != -1)
      dispatch_once(&CKMainScreenScale_once_1, &__block_literal_global_192);
    v52 = *(double *)&CKMainScreenScale_sMainScreenScale_1;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_1 == 0.0)
      v52 = 1.0;
    v53 = v49 * v52;
    v54 = v51 * v52;
    v55 = v32 * v52 + floor((v46 * v52 - v49 * v52) * 0.5);
    v56 = v34 * v52 + floor((v36 * v52 - v51 * v52) * 0.5);
    v57 = 1.0 / v52;
    *(double *)&v84 = v57 * v55;
    *((double *)&v84 + 1) = v57 * v56;
    *(double *)&v85 = v53 * v57;
    *((double *)&v85 + 1) = v54 * v57;
    v58 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"))), "initWithOptions:", v13);
    v59 = dispatch_group_create();
    dispatch_group_enter(v59);
    +[CKPreviewDispatchCache mapThumbnailQueue](CKPreviewDispatchCache, "mapThumbnailQueue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke_117;
    v73[3] = &unk_1E274A470;
    v80 = width;
    v81 = height;
    v82 = v70;
    v77 = &v86;
    v78 = &v94;
    v79 = v83;
    v61 = v26;
    v74 = v61;
    v62 = v47;
    v75 = v62;
    v63 = v59;
    v76 = v63;
    objc_msgSend(v58, "startWithQueue:completionHandler:", v60, v73);

    v64 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v63, v64))
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v93 = self;
          _os_log_impl(&dword_18DFCD000, v65, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
        _CKLogExternal();
    }

    _Block_object_dispose(v83, 8);
    _Block_object_dispose(&v94, 8);

LABEL_38:
    v67 = (id)v87[5];
    goto LABEL_44;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      LOWORD(v94) = 0;
      _os_log_impl(&dword_18DFCD000, v68, OS_LOG_TYPE_INFO, "CKLocationShareOfferChatItem - Map region is invalid, bailing!", (uint8_t *)&v94, 2u);
    }

  }
  v67 = 0;
LABEL_44:
  _Block_object_dispose(&v86, 8);

  return v67;
}

void *__108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  _generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke_108()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("MKCoordinateRegionMakeWithDistance", CFSTR("MapKit"));
  _generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __108__CKLocationShareOfferChatItem__generateThumbnailFillToSize_contentAlignmentInsets_withCoordinate_forState___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationShareOfferChatItem for map snapshot: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  objc_msgSend(v5, "image");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  UIGraphicsBeginImageContextWithOptions(*(CGSize *)(a1 + 80), 0, 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "size");
  v12 = *MEMORY[0x1E0C9D538] + floor((*(double *)(a1 + 80) - v11) * 0.5);
  v14 = *(double *)(a1 + 96);
  v15 = *(double *)(MEMORY[0x1E0C9D538] + 8) + floor((*(double *)(a1 + 88) - v13) * 0.5) - v14 * 0.5;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 40)
                                                              - v14;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 40)
                                                              - *(double *)(a1 + 96);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "drawAtPoint:", v12, v15);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  UIGraphicsEndImageContext();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (id)transcriptTraitCollection
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKLocationShareOfferChatItem;
  -[CKChatItem transcriptTraitCollection](&v7, sel_transcriptTraitCollection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_generatePlaceholderThumbnailFillToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  objc_class *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  dispatch_time_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  _QWORD v39[2];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  height = a3.height;
  width = a3.width;
  v50 = *MEMORY[0x1E0C80C00];
  -[CKLocationShareOfferChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CKLocationSharePreviewPlaceHolderCacheFileURL(v6, (unint64_t)width, CFSTR("jpeg"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  v45 = 0;
  v39[0] = -[CKBalloonChatItem balloonOrientation](self, "balloonOrientation");
  -[CKLocationShareOfferChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = objc_msgSend(v8, "userInterfaceStyle");

  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v39, "{?=cq}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKLocationMediaObject placeholderPreviewCache](CKLocationMediaObject, "placeholderPreviewCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v41[5];
  v41[5] = v11;

  if (v41[5])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Found cached thumbnail in memory", buf, 2u);
      }

    }
    if (!os_log_shim_legacy_logging_enabled() || !_CKShouldLogExternal())
      goto LABEL_17;
    goto LABEL_16;
  }
  -[CKLocationShareOfferChatItem savedPreviewFromURL:](self, "savedPreviewFromURL:", v7);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v41[5];
  v41[5] = v14;

  if (v41[5])
  {
    +[CKLocationMediaObject placeholderPreviewCache](CKLocationMediaObject, "placeholderPreviewCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v41[5], v9);

    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Found cached thumnail on disk.", buf, 2u);
      }

    }
    if (!os_log_shim_legacy_logging_enabled() || !_CKShouldLogExternal())
      goto LABEL_17;
LABEL_16:
    _CKLogExternal();
LABEL_17:
    v18 = (id)v41[5];
    goto LABEL_18;
  }
  v20 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotOptions"), CFSTR("MapKit"));
  if (v20)
  {
    v21 = objc_alloc_init(v20);
    objc_msgSend(v21, "setMapType:", 105);
    -[CKLocationShareOfferChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTraitCollection:", v22);

    objc_msgSend(v21, "setSize:", width, height);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    objc_msgSend(v21, "setScale:");

    v24 = (objc_class *)MEMORY[0x193FF3C18](CFSTR("MKMapSnapshotter"), CFSTR("MapKit"));
    if (v24)
    {
      v25 = (void *)objc_msgSend([v24 alloc], "initWithOptions:", v21);
      v26 = dispatch_group_create();
      dispatch_group_enter(v26);
      dispatch_get_global_queue(0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __72__CKLocationShareOfferChatItem__generatePlaceholderThumbnailFillToSize___block_invoke;
      v36[3] = &unk_1E274A498;
      v38 = &v40;
      v28 = v26;
      v37 = v28;
      objc_msgSend(v25, "startWithQueue:completionHandler:", v27, v36);

      v29 = dispatch_time(0, 5000000000);
      if (dispatch_group_wait(v28, v29))
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v47 = (const __CFString *)self;
            _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
          }

        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
          _CKLogExternal();
      }
      v31 = v41[5];
      if (v31)
      {
        -[CKLocationShareOfferChatItem savePreview:toURL:](self, "savePreview:toURL:", v31, v7);
        +[CKLocationMediaObject placeholderPreviewCache](CKLocationMediaObject, "placeholderPreviewCache");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v41[5], v9);

        v33 = (void *)v41[5];
      }
      else
      {
        v33 = 0;
      }
      v18 = v33;

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v47 = CFSTR("MKMapSnapshotter");
          v48 = 2112;
          v49 = CFSTR("MapKit");
          _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
        }

      }
      v18 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v47 = CFSTR("MKMapSnapshotOptions");
        v48 = 2112;
        v49 = CFSTR("MapKit");
        _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Failed weak linking %@ from %@.", buf, 0x16u);
      }

    }
    v18 = 0;
  }
LABEL_18:

  _Block_object_dispose(&v40, 8);
  return v18;
}

void __72__CKLocationShareOfferChatItem__generatePlaceholderThumbnailFillToSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Got error back in CKLocationMediaObject for map snapshot: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_msgSend(v5, "image");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)savePreview:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    im_perform_with_task_assertion();

  }
}

void __50__CKLocationShareOfferChatItem_savePreview_toURL___block_invoke(uint64_t a1)
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
  CKUIImageJPEGRepresentationWithHardwareAcceleration();
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

- (id)savedPreviewFromURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C99D50];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithContentsOfURL:options:error:", v4, 1, 0);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageWithData:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)modificationDateForPreview:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_handleLocationDidChangeNotification:(id)a3
{
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
  id v14;

  objc_msgSend(a3, "object");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "fmfHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[CKLocationShareOfferChatItem sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findMySiblingHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__im_fmfHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v7, "containsObject:", v4))
  {
    objc_msgSend(MEMORY[0x1E0D35810], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareOfferChatItem sender](self, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "findMyLocationForHandleOrSibling:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fmfLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKLocationShareOfferChatItem lastKnownLocation](self, "lastKnownLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareOfferChatItem previewURL](self, "previewURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = -[CKLocationShareOfferChatItem shouldUpdatePreviewWithLocation:lastKnownLocation:previewURL:](self, "shouldUpdatePreviewWithLocation:lastKnownLocation:previewURL:", v11, v12, v13);

    -[CKLocationShareOfferChatItem setLastKnownLocation:](self, "setLastKnownLocation:", v11);
    if ((_DWORD)v10)
      -[CKLocationShareOfferChatItem _generateMapPreview](self, "_generateMapPreview");

  }
}

- (BOOL)shouldUpdatePreviewWithLocation:(id)a3 lastKnownLocation:(id)a4 previewURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (!v9)
        goto LABEL_5;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationValidInterval");
      v14 = v13;

      objc_msgSend(v8, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v16);
      v18 = v17;

      if (v18 <= v14)
      {
        -[CKLocationShareOfferChatItem modificationDateForPreview:](self, "modificationDateForPreview:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        v22 = v21;

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", v22);
        v24 = v23;

        LOBYTE(v11) = v24 > v14;
      }
      else
      {
LABEL_5:
        LOBYTE(v11) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (id)_desaturatedImageForImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGColorSpace *DeviceGray;
  CGContext *v13;
  id v14;
  CGImage *v15;
  CGImageRef Image;
  void *v17;
  CGRect v19;

  v3 = (void *)MEMORY[0x1E0CEA950];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  objc_msgSend(v4, "size");
  v9 = v7 * v8;
  objc_msgSend(v4, "size");
  v11 = v7 * v10;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v13 = CGBitmapContextCreate(0, (unint64_t)v9, (unint64_t)v11, 8uLL, 0, DeviceGray, 0);
  v14 = objc_retainAutorelease(v4);
  v15 = (CGImage *)objc_msgSend(v14, "CGImage");

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v9;
  v19.size.height = v11;
  CGContextDrawImage(v13, v19, v15);
  Image = CGBitmapContextCreateImage(v13);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", Image, 0, v7);
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v13);
  if (Image)
    CFRelease(Image);
  return v17;
}

+ (id)titleBarMaskImageForWidth:(double)a3
{
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CGSize v20;
  CGRect v21;

  v4 = *(double *)&titleBarMaskImageForWidth__sWidth;
  if (*(double *)&titleBarMaskImageForWidth__sWidth != a3)
  {
    titleBarMaskImageForWidth__sWidth = *(_QWORD *)&a3;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationOfferMapThumbnailFillSizeForWidth:", a3);
    v7 = v6;
    v9 = v8;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationShareBalloonButtonHeight");
    v12 = v11;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "locationShareBalloonLabelMaxHeightForOfferState:", 0);
    v15 = v12 + v14;

    v20.width = v7;
    v20.height = v9;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "set");

    v21.origin.x = 0.0;
    v21.origin.y = v9 - v15;
    v21.size.width = v7;
    v21.size.height = v15;
    UIRectFill(v21);
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)titleBarMaskImageForWidth__sTitleBarMaskImage;
    titleBarMaskImageForWidth__sTitleBarMaskImage = v17;

    UIGraphicsEndImageContext();
  }
  return (id)titleBarMaskImageForWidth__sTitleBarMaskImage;
}

+ (id)placeholderPreviewCache
{
  if (placeholderPreviewCache_once != -1)
    dispatch_once(&placeholderPreviewCache_once, &__block_literal_global_138);
  return (id)placeholderPreviewCache_sPlaceholderPreviews;
}

void __55__CKLocationShareOfferChatItem_placeholderPreviewCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  CKCreateNSCache(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)placeholderPreviewCache_sPlaceholderPreviews;
  placeholderPreviewCache_sPlaceholderPreviews = v0;

}

- (FMFLocation)lastKnownLocation
{
  return self->_lastKnownLocation;
}

- (void)setLastKnownLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownLocation, 0);
}

@end
