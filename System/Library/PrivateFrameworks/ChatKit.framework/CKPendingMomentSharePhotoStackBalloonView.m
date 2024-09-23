@implementation CKPendingMomentSharePhotoStackBalloonView

- (CKPendingMomentSharePhotoStackBalloonView)initWithFrame:(CGRect)a3
{
  CKPendingMomentSharePhotoStackBalloonView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_handleTap_);
    -[CKPendingMomentSharePhotoStackBalloonView addGestureRecognizer:](v3, "addGestureRecognizer:", v4);

  }
  return v3;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  -[CKGenericPhotoStackBalloonView prepareForDisplay](&v8, sel_prepareForDisplay);
  -[CKGenericPhotoStackBalloonView dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke;
    v6[3] = &unk_1E274EEA8;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v7, "forceSyncMomentShareWithCompletion:", v6);

  }
}

void __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_2(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_1(a1, v5);
  }

}

- (id)_createStackView
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  -[CKGenericPhotoStackBalloonView _createStackView](&v4, sel__createStackView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "setProvidesLoadingAppearanceAndBehavior:", 1);
  return v2;
}

- (void)handleTap:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapPendingMomentSharePhotoStackBalloonView:", self);

}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  CKPendingMomentShareImageProvider *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  CKMomentSharePreviewAssetsDataSourceManager *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKPendingMomentSharePhotoStackBalloonView;
  -[CKBalloonView configureForMessagePart:](&v14, sel_configureForMessagePart_, v4);
  -[CKGenericPhotoStackBalloonView mediaProvider](self, "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc_init(CKPendingMomentShareImageProvider);
    -[CKGenericPhotoStackBalloonView setMediaProvider:](self, "setMediaProvider:", v6);

  }
  objc_msgSend(v4, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMCoreMomentShareURLForMessage();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGenericPhotoStackBalloonView dataSourceManager](self, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "momentShareURL"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = CKIsEqual(v11, v8),
        v11,
        (v12 & 1) == 0))
  {
    v13 = -[CKMomentSharePreviewAssetsDataSourceManager initWithMomentShareURL:]([CKMomentSharePreviewAssetsDataSourceManager alloc], "initWithMomentShareURL:", v8);
    -[CKGenericPhotoStackBalloonView setDataSourceManager:](self, "setDataSourceManager:", v13);

  }
}

void __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134218242;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_debug_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_DEBUG, "<%p> Did force sync moment share: %{public}@", (uint8_t *)&v5, 0x16u);

}

void __62__CKPendingMomentSharePhotoStackBalloonView_prepareForDisplay__block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_ERROR, "<%p> Failed to force sync moment share: %{public}@, error: %@", (uint8_t *)&v7, 0x20u);

}

@end
