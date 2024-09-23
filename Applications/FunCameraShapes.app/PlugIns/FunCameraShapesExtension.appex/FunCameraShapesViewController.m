@implementation FunCameraShapesViewController

- (void)viewDidLoad
{
  uint64_t v3;
  FunCameraStickerBrowserViewController *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)FunCameraShapesViewController;
  -[FunCameraShapesViewController viewDidLoad](&v29, "viewDidLoad");
  +[CFXEffect initEffectRegistry](CFXEffect, "initEffectRegistry");
  v3 = CFXEffectTypeIdentifierShapes;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000027E8;
  v28[3] = &unk_100004190;
  v28[4] = self;
  +[CFXEffectMessagesStickerUtilities cacheAnimatedStickerPreviewsForOverlayTypeId:atStickerSize:previewDuration:previewFrameRate:previewCompletedBlock:](CFXEffectMessagesStickerUtilities, "cacheAnimatedStickerPreviewsForOverlayTypeId:atStickerSize:previewDuration:previewFrameRate:previewCompletedBlock:", CFXEffectTypeIdentifierShapes, 1, 24, v28, 1.0);
  v4 = -[FunCameraStickerBrowserViewController initWithEffectTypeIdentifier:]([FunCameraStickerBrowserViewController alloc], "initWithEffectTypeIdentifier:", v3);
  -[FunCameraShapesViewController setStickerBrowserViewController:](self, "setStickerBrowserViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController stickerBrowserViewController](self, "stickerBrowserViewController"));
  objc_msgSend(v5, "setDataSource:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController stickerBrowserViewController](self, "stickerBrowserViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController stickerBrowserViewController](self, "stickerBrowserViewController"));
  -[FunCameraShapesViewController addChildViewController:](self, "addChildViewController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", v7);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v30[0] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v30[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v11));
  v30[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v30[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController stickerBrowserViewController](self, "stickerBrowserViewController"));
  objc_msgSend(v18, "didMoveToParentViewController:", self);

}

- (int64_t)funCamStickerBrowser:(id)a3 numberOfStickersForEffectTypeIdentifier:(id)a4
{
  return (int64_t)+[CFXEffectMessagesStickerUtilities numberOfStickersForEffectTypeId:](CFXEffectMessagesStickerUtilities, "numberOfStickersForEffectTypeId:", a4);
}

- (id)funCamStickerBrowser:(id)a3 stickerForIndex:(int64_t)a4 forEffectTypeIdentifier:(id)a5
{
  return +[CFXEffectMessagesStickerUtilities stickerPropertiesForIndex:forEffectTypeId:](CFXEffectMessagesStickerUtilities, "stickerPropertiesForIndex:forEffectTypeId:", a4, a5);
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FunCameraShapesViewController stickerBrowserViewController](self, "stickerBrowserViewController"));
  objc_msgSend(v5, "updateSnapshotWithCompletionBlock:", v4);

}

- (FunCameraStickerBrowserViewController)stickerBrowserViewController
{
  return self->_stickerBrowserViewController;
}

- (void)setStickerBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stickerBrowserViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBrowserViewController, 0);
}

@end
