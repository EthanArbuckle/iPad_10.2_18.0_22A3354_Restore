@implementation CKPhotoStackBalloonView

- (void)prepareForDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPhotoStackBalloonView;
  -[CKGenericPhotoStackBalloonView prepareForDisplay](&v4, sel_prepareForDisplay);
  -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoStackBalloonView _setTapbackManagerOnStackView:](self, "_setTapbackManagerOnStackView:", v3);

  -[CKPhotoStackBalloonView _updateAdditionalItemsCount](self, "_updateAdditionalItemsCount");
}

- (id)_createStackView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKPhotoStackBalloonView;
  -[CKGenericPhotoStackBalloonView _createStackView](&v7, sel__createStackView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setAllowPlayableContentLoading:", 1);
  objc_msgSend(v3, "tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requireGestureRecognizerToFail:", v5);

  -[CKPhotoStackBalloonView _setTapbackManagerOnStackView:](self, "_setTapbackManagerOnStackView:", v3);
  return v3;
}

- (void)_setTapbackManagerOnStackView:(id)a3
{
  id v4;
  void *v5;
  CKMediaObjectTapbackManager *v6;

  v4 = a3;
  v6 = objc_alloc_init(CKMediaObjectTapbackManager);
  -[CKGenericPhotoStackBalloonView gradientReferenceView](self, "gradientReferenceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectTapbackManager setGradientReferenceView:](v6, "setGradientReferenceView:", v5);

  -[CKMediaObjectTapbackManager setInvertTapbackTailDirection:](v6, "setInvertTapbackTailDirection:", 1);
  objc_msgSend(v4, "setTapbackStatusManager:", v6);

}

- (void)_additionalItemsCountDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPhotoStackBalloonView;
  -[CKGenericPhotoStackBalloonView _additionalItemsCountDidChange](&v3, sel__additionalItemsCountDidChange);
  -[CKPhotoStackBalloonView _updateAdditionalItemsCount](self, "_updateAdditionalItemsCount");
}

- (void)_updateAdditionalItemsCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKGenericPhotoStackBalloonView dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "additionalItemsCount");
  v6 = v5;

  objc_msgSend(v7, "setAdditionalItemsCount:", v4, v6);
}

- (void)stackView:(id)a3 didSelectAssetReference:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "tapGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView tapGestureRecognized:](self, "tapGestureRecognized:", v7);

  if (!CKIsRunningInMacCatalyst())
  {
    -[CKBalloonView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CKBalloonView delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "photoStackBalloonView:photoStack:didSelectAssetReference:", self, v11, v6);

    }
  }

}

- (void)stackView:(id)a3 didChangeCurrentAssetReference:(id)a4 isProgrammaticChange:(BOOL)a5 didChangeIndex:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v12 = a4;
  -[CKBalloonView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CKBalloonView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoStackBalloonView:didChangeCurrentAssetReference:isProgrammaticChange:didChangeIndex:", self, v12, v7, v6);

  }
}

- (BOOL)stackView:(id)a3 shouldAutoplayAsset:(id)a4
{
  return 1;
}

- (void)stackViewDidSelectAdditionalItemsCard:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKBalloonView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKBalloonView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoStackBalloonView:photoStackDidSelectAdditionalItems:", self, v7);

  }
}

- (id)transitionViewForCurrentItem:(id)a3 sourceFrame:(CGRect *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  CGSize v19;

  v6 = a3;
  -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqual:", v6) & 1) == 0)
  {
    -[CKGenericPhotoStackBalloonView dataSourceManager](self, "dataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaObjectDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetReferenceForMediaObject:", v6);
    v13 = objc_claimAutoreleasedReturnValue();

    -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scrollToAssetReference:animated:", v13, 0);

    v8 = (void *)v13;
  }
  objc_msgSend(v10, "transfer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isFileURLFinalized");

  if (v16)
  {
    -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "installTransitionSnapshotViewForAssetReference:uncroppedImageFrame:", v8, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    a4->size = v19;
  }

  return v18;
}

- (void)removeTransitionView
{
  id v2;

  -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeTransitionSnapshotView");

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKPhotoStackBalloonView;
  -[CKGenericPhotoStackBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  -[CKGenericPhotoStackBalloonView dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMediaObjectDataSource:", 0);

  -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalItemsCount:", *MEMORY[0x1E0D7C360], *(_QWORD *)(MEMORY[0x1E0D7C360] + 8));

}

- (CGRect)currentAssetFrameInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  -[CKGenericPhotoStackBalloonView stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionOfInterestForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rectInCoordinateSpace:", v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  CKMediaObjectImageProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  CKMediaObjectAssetDataSourceManager *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKPhotoStackBalloonView;
  -[CKBalloonView configureForMessagePart:](&v11, sel_configureForMessagePart_, v4);
  -[CKGenericPhotoStackBalloonView mediaProvider](self, "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc_init(CKMediaObjectImageProvider);
    -[CKGenericPhotoStackBalloonView setMediaProvider:](self, "setMediaProvider:", v6);

  }
  objc_msgSend(v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGenericPhotoStackBalloonView dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setMediaObjectDataSource:", v7);
  }
  else
  {
    v10 = -[CKMediaObjectAssetDataSourceManager initWithDataSource:]([CKMediaObjectAssetDataSourceManager alloc], "initWithDataSource:", v7);
    -[CKGenericPhotoStackBalloonView setDataSourceManager:](self, "setDataSourceManager:", v10);

  }
}

@end
