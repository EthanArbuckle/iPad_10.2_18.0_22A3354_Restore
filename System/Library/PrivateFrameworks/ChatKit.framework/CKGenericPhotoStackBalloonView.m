@implementation CKGenericPhotoStackBalloonView

+ (id)genericStackViewWithItemAspectRatio:(double)a3
{
  return -[CKMessagesCarouselView initWithItemAspectRatio:]([CKMessagesCarouselView alloc], "initWithItemAspectRatio:", a3);
}

- (void)prepareForDisplay
{
  PXMessagesStackView *v3;
  PXMessagesStackView *stackView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKGenericPhotoStackBalloonView;
  -[CKBalloonView prepareForDisplay](&v5, sel_prepareForDisplay);
  if (!self->_stackView)
  {
    -[CKGenericPhotoStackBalloonView _createStackView](self, "_createStackView");
    v3 = (PXMessagesStackView *)objc_claimAutoreleasedReturnValue();
    stackView = self->_stackView;
    self->_stackView = v3;

    -[CKGenericPhotoStackBalloonView addSubview:](self, "addSubview:", self->_stackView);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXMessagesStackView prepareForDisplay](self->_stackView, "prepareForDisplay");
}

- (id)createOverlayImageView
{
  return 0;
}

- (void)setHasOverlay:(BOOL)a3 autoDismiss:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKGenericPhotoStackBalloonView;
  -[CKBalloonView setHasOverlay:autoDismiss:](&v6, sel_setHasOverlay_autoDismiss_, a3, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PXMessagesStackView setSelectionOverlayEnabled:](self->_stackView, "setSelectionOverlayEnabled:", v4);
}

- (PXAssetReference)currentAssetReference
{
  return (PXAssetReference *)-[PXMessagesStackView currentAssetReference](self->_stackView, "currentAssetReference");
}

- (double)horizontalContentMarginForSize:(CGSize)a3
{
  double height;
  double width;
  double result;

  height = a3.height;
  width = a3.width;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXMessagesStackView horizontalContentMarginForSize:](self->_stackView, "horizontalContentMarginForSize:", width, height);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXMessagesStackView horizontalContentMargin](self->_stackView, "horizontalContentMargin");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (void)setHorizontalContentMarginAdjustment:(double)a3 edge:(int64_t)a4
{
  double v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!a4)
    {
      v7 = a3;
      a3 = 0.0;
      goto LABEL_7;
    }
    if (a4 == 1)
    {
      v7 = 0.0;
LABEL_7:
      -[PXMessagesStackView setLeftEdgeHorizontalContentMarginAdjustment:](self->_stackView, "setLeftEdgeHorizontalContentMarginAdjustment:", v7);
      -[PXMessagesStackView setRightEdgeHorizontalContentMarginAdjustment:](self->_stackView, "setRightEdgeHorizontalContentMarginAdjustment:", a3);
    }
  }
}

- (BOOL)_scrollTrailingAnimated:(BOOL)a3
{
  return -[PXMessagesStackView scrollToIndex:animated:](self->_stackView, "scrollToIndex:animated:", -[PXMessagesStackView currentIndex](self->_stackView, "currentIndex") + 1, a3);
}

- (BOOL)_scrollLeadingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = -[PXMessagesStackView currentIndex](self->_stackView, "currentIndex");
  if (v5)
    LOBYTE(v5) = -[PXMessagesStackView scrollToIndex:animated:](self->_stackView, "scrollToIndex:animated:", v5 - 1, v3);
  return v5;
}

- (BOOL)pageRightAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = -[CKGenericPhotoStackBalloonView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v5 == 1)
    return -[CKGenericPhotoStackBalloonView _scrollLeadingAnimated:](self, "_scrollLeadingAnimated:", v3);
  if (v5)
    return 0;
  return -[CKGenericPhotoStackBalloonView _scrollTrailingAnimated:](self, "_scrollTrailingAnimated:", v3);
}

- (BOOL)pageLeftAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = -[CKGenericPhotoStackBalloonView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v5 == 1)
    return -[CKGenericPhotoStackBalloonView _scrollTrailingAnimated:](self, "_scrollTrailingAnimated:", v3);
  if (v5)
    return 0;
  return -[CKGenericPhotoStackBalloonView _scrollLeadingAnimated:](self, "_scrollLeadingAnimated:", v3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKGenericPhotoStackBalloonView;
  -[CKBalloonView layoutSubviews](&v22, sel_layoutSubviews);
  -[CKGenericPhotoStackBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stackBalloonVerticalInset");
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "smallTranscriptSpace");
  v14 = v13;

  -[CKGenericPhotoStackBalloonView bounds](self, "bounds");
  v16 = v15;
  v18 = v17;
  if (CKMainScreenScale_once_24 != -1)
    dispatch_once(&CKMainScreenScale_once_24, &__block_literal_global_55);
  v19 = v8 + v14 * -2.0 + v11 * 2.0;
  v20 = v16 + floor((v18 - v19) * 0.5);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_24 == 0.0)
    v21 = 1.0;
  else
    v21 = *(double *)&CKMainScreenScale_sMainScreenScale_24;
  -[PXMessagesStackView setFrame:](self->_stackView, "setFrame:", round(v4 * v21) / v21, round(v20 * v21) / v21, round(v6 * v21) / v21, round(v19 * v21) / v21);
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKGenericPhotoStackBalloonView;
  -[CKBalloonView prepareForReuse](&v2, sel_prepareForReuse);
}

- (id)_createStackView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0D7B5B8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKGenericPhotoStackBalloonView mediaProvider](self, "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaProvider:", v5);

  -[CKGenericPhotoStackBalloonView dataSourceManager](self, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSourceManager:", v6);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stackBalloonVerticalInset");
  objc_msgSend(v4, "setVerticalContentInsets:");

  return v4;
}

- (void)setMediaProvider:(id)a3
{
  PXUIMediaProvider *v5;
  PXUIMediaProvider *v6;

  v5 = (PXUIMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXMessagesStackView setMediaProvider:](self->_stackView, "setMediaProvider:", self->_mediaProvider);
    v5 = v6;
  }

}

- (void)setDataSourceManager:(id)a3
{
  PXAssetsDataSourceManager *v5;
  PXAssetsDataSourceManager **p_dataSourceManager;
  PXAssetsDataSourceManager *dataSourceManager;
  PXAssetsDataSourceManager *v8;

  v5 = (PXAssetsDataSourceManager *)a3;
  p_dataSourceManager = &self->_dataSourceManager;
  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager != v5)
  {
    v8 = v5;
    -[PXAssetsDataSourceManager unregisterChangeObserver:context:](dataSourceManager, "unregisterChangeObserver:context:", self, DataSourceManagerObservationContext);
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    -[PXAssetsDataSourceManager registerChangeObserver:context:](*p_dataSourceManager, "registerChangeObserver:context:", self, DataSourceManagerObservationContext);
    -[PXMessagesStackView setDataSourceManager:](self->_stackView, "setDataSourceManager:", *p_dataSourceManager);
    v5 = v8;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 2) != 0 && (void *)DataSourceManagerObservationContext == a5)
    -[CKGenericPhotoStackBalloonView _additionalItemsCountDidChange](self, "_additionalItemsCountDidChange", a3);
}

- (PXMessagesStackView)stackView
{
  return self->_stackView;
}

- (CKGradientReferenceView)gradientReferenceView
{
  return (CKGradientReferenceView *)objc_loadWeakRetained((id *)&self->_gradientReferenceView);
}

- (void)setGradientReferenceView:(id)a3
{
  objc_storeWeak((id *)&self->_gradientReferenceView, a3);
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  self->_wantsContactImageLayout = a3;
}

- (double)horizontalContentMargin
{
  return self->_horizontalContentMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_destroyWeak((id *)&self->_gradientReferenceView);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
