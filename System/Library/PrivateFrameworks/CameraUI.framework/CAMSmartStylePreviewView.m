@implementation CAMSmartStylePreviewView

- (CAMSmartStylePreviewView)initWithFrame:(CGRect)a3
{
  CAMSmartStylePreviewView *v3;
  NUMediaView *v4;
  NUMediaView *mediaView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStylePreviewView;
  v3 = -[CAMSmartStylePreviewView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NUMediaView *)objc_alloc_init(MEMORY[0x1E0D523E0]);
    mediaView = v3->__mediaView;
    v3->__mediaView = v4;

    -[NUMediaView setTranslatesAutoresizingMaskIntoConstraints:](v3->__mediaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NUMediaView setUserInteractionEnabled:](v3->__mediaView, "setUserInteractionEnabled:", 0);
    -[NUMediaView setClipsToBounds:](v3->__mediaView, "setClipsToBounds:", 1);
    -[NUMediaView setDelegate:](v3->__mediaView, "setDelegate:", v3);
    -[CAMSmartStylePreviewView addSubview:](v3, "addSubview:", v3->__mediaView);
    -[CAMSmartStylePreviewView _addConstraints](v3, "_addConstraints");
  }
  return v3;
}

- (void)setLogIdentifier:(id)a3
{
  NSString *v5;
  NSString **p_logIdentifier;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  p_logIdentifier = &self->_logIdentifier;
  if (*p_logIdentifier != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](*p_logIdentifier, "isEqualToString:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)p_logIdentifier, a3);
      v5 = v8;
    }
  }

}

- (void)setResourceLoadResult:(id)a3
{
  void *v5;
  void *v6;
  PICompositionController *v7;
  PICompositionController *compositionController;
  CAMSmartStyleSettingsResourceLoadResult *v9;

  v9 = (CAMSmartStyleSettingsResourceLoadResult *)a3;
  if (self->_resourceLoadResult != v9)
  {
    objc_storeStrong((id *)&self->_resourceLoadResult, a3);
    -[CAMSmartStyleSettingsResourceLoadResult resourceLoadResult](v9, "resourceLoadResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compositionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PICompositionController *)objc_msgSend(v6, "copy");
    compositionController = self->__compositionController;
    self->__compositionController = v7;

    -[CAMSmartStylePreviewView _updatePreviewAdjustments](self, "_updatePreviewAdjustments");
  }

}

- (PEAsset)_asset
{
  void *v2;
  void *v3;
  void *v4;

  -[CAMSmartStylePreviewView resourceLoadResult](self, "resourceLoadResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceLoadResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PEAsset *)v4;
}

- (void)setStyle:(id)a3
{
  CEKSmartStyle *v5;
  CEKSmartStyle *style;
  char v7;
  CEKSmartStyle *v8;

  v5 = (CEKSmartStyle *)a3;
  style = self->_style;
  if (style != v5)
  {
    v8 = v5;
    v7 = -[CEKSmartStyle isEqualToSmartStyle:](style, "isEqualToSmartStyle:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_style, a3);
      -[CAMSmartStylePreviewView _updatePreviewAdjustments](self, "_updatePreviewAdjustments");
      v5 = v8;
    }
  }

}

- (void)mediaViewDidFinishRendering:(id)a3 withStatistics:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->__mediaView == a3)
  {
    v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStylePreviewView logIdentifier](self, "logIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSmartStylePreviewView resourceLoadResult](self, "resourceLoadResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "totalDuration");
      v12 = v11;
      objc_msgSend(v6, "duration");
      v14 = v13;
      objc_msgSend(v6, "latency");
      v16 = 138544386;
      v17 = v8;
      v18 = 2114;
      v19 = v10;
      v20 = 2048;
      v21 = v12;
      v22 = 2048;
      v23 = v14;
      v24 = 2048;
      v25 = v15;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@: didFinishRendering totalDuration=%.3f (duration=%.3f latency=%.3f)", (uint8_t *)&v16, 0x34u);

    }
    -[CAMSmartStylePreviewView _updateMediaViewZoomIfNecessary](self, "_updateMediaViewZoomIfNecessary");
  }

}

- (void)_addConstraints
{
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
  void *v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3718];
  -[NUMediaView topAnchor](self->__mediaView, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStylePreviewView topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  -[NUMediaView bottomAnchor](self->__mediaView, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStylePreviewView bottomAnchor](self, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v5;
  -[NUMediaView leadingAnchor](self->__mediaView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStylePreviewView leadingAnchor](self, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  -[NUMediaView trailingAnchor](self->__mediaView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStylePreviewView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (void)_updatePreviewAdjustments
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMSmartStylePreviewView _compositionController](self, "_compositionController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CAMSmartStylePreviewView style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CAMSmartStylePreviewView style](self, "style");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSmartStylePreviewView _compositionController](self, "_compositionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSmartStylePreviewView _asset](self, "_asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMSmartStyleSettingsRenderUtilities compositionForStyle:compositionController:originalAsset:aspectRatio:](CAMSmartStyleSettingsRenderUtilities, "compositionForStyle:compositionController:originalAsset:aspectRatio:", v6, v7, v8, 1.0);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[CAMSmartStylePreviewView _setComposition:](self, "_setComposition:", v9);
    }
  }
}

- (void)_setComposition:(id)a3
{
  NUComposition *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (NUComposition *)a3;
  if (self->__composition != v5)
  {
    v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[CAMSmartStylePreviewView logIdentifier](self, "logIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMSmartStylePreviewView style](self, "style");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: updating composition for %{public}@", (uint8_t *)&v9, 0x16u);

    }
    objc_storeStrong((id *)&self->__composition, a3);
    self->__hasUpdatedZoomForComposition = 0;
    -[NUMediaView setComposition:](self->__mediaView, "setComposition:", v5);
    -[CAMSmartStylePreviewView _updateMediaViewZoomIfNecessary](self, "_updateMediaViewZoomIfNecessary");
  }

}

- (void)_updateMediaViewZoomIfNecessary
{
  NUMediaView *mediaView;
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v20;
  CGRect v21;
  CGRect v22;

  mediaView = self->__mediaView;
  if (mediaView)
  {
    if (!self->__hasUpdatedZoomForComposition)
    {
      -[NUMediaView setZoomScaleToFit](mediaView, "setZoomScaleToFit");
      -[NUMediaView zoomScale](self->__mediaView, "zoomScale");
      v5 = v4;
      -[NUMediaView imageFrame](self->__mediaView, "imageFrame");
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
      v10 = CGRectGetHeight(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v11 = CGRectGetWidth(v22);
      if (v10 != 0.0)
      {
        v12 = v11;
        if (v11 != 0.0)
        {
          v13 = v10 / v11;
          +[CAMSmartStylePreviewViewController desiredCarouselRatio](CAMSmartStylePreviewViewController, "desiredCarouselRatio");
          if (v13 != v14)
          {
            v15 = v14;
            -[NUMediaView frame](self->__mediaView, "frame");
            if (v13 <= v15)
              v20 = CGRectGetHeight(*(CGRect *)&v16) / v10;
            else
              v20 = CGRectGetWidth(*(CGRect *)&v16) / v12;
            -[NUMediaView setZoomScale:](self->__mediaView, "setZoomScale:", v5 * v20);
          }
          self->__hasUpdatedZoomForComposition = 1;
        }
      }
    }
  }
}

- (CAMSmartStyleSettingsResourceLoadResult)resourceLoadResult
{
  return self->_resourceLoadResult;
}

- (CEKSmartStyle)style
{
  return self->_style;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NUMediaView)_mediaView
{
  return self->__mediaView;
}

- (NUComposition)_composition
{
  return self->__composition;
}

- (BOOL)_hasUpdatedZoomForComposition
{
  return self->__hasUpdatedZoomForComposition;
}

- (PICompositionController)_compositionController
{
  return self->__compositionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__compositionController, 0);
  objc_storeStrong((id *)&self->__composition, 0);
  objc_storeStrong((id *)&self->__mediaView, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_resourceLoadResult, 0);
}

@end
