@implementation CKWatchfaceImageBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  uint64_t v6;
  void *v9;
  id v10;

  v6 = a5;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "linkMetadataForWidth:orientation:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKWatchfaceImageBalloonView setMetadata:](self, "setMetadata:", v9);

  }
}

- (void)setMetadata:(id)a3
{
  LPLinkMetadata *v5;
  LPLinkMetadata *v6;

  v5 = (LPLinkMetadata *)a3;
  if (self->_metadata != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_metadata, a3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    v5 = v6;
  }

}

- (void)prepareForReuse
{
  LPLinkMetadata *metadata;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKWatchfaceImageBalloonView;
  -[CKLinkBalloonView prepareForReuse](&v4, sel_prepareForReuse);
  metadata = self->_metadata;
  self->_metadata = 0;

}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CKLinkBalloonView linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKLinkBalloonView linkView](self, "linkView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMetadata:", self->_metadata);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithMetadata:", self->_metadata);
    -[CKLinkBalloonView setLinkView:](self, "setLinkView:", v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)CKWatchfaceImageBalloonView;
  -[CKLinkBalloonView prepareForDisplay](&v5, sel_prepareForDisplay);
}

- (void)tapGestureRecognized:(id)a3
{
  LPLinkMetadata *metadata;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  metadata = self->_metadata;
  if (metadata)
  {
    -[LPLinkMetadata originalURL](metadata, "originalURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[LPLinkMetadata originalURL](self->_metadata, "originalURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKWatchfaceUtilities addWatchFaceAtURL:completionHandler:](CKWatchfaceUtilities, "addWatchFaceAtURL:completionHandler:", v6, &__block_literal_global_86);

    }
  }

}

void __52__CKWatchfaceImageBalloonView_tapGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t buf[4];
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(47);
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v5 = v2;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEBUG, "Failed to import URL: %@", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
  }

}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
