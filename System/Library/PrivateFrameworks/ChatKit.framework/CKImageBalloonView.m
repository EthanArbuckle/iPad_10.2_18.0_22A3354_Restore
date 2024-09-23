@implementation CKImageBalloonView

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  objc_super v4;

  if (-[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask") != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)CKImageBalloonView;
    -[CKBalloonView setCanUseOpaqueMask:](&v4, sel_setCanUseOpaqueMask_, 0);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)setHasTail:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CKBalloonView hasTail](self, "hasTail") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKImageBalloonView;
    -[CKBalloonView setHasTail:](&v5, sel_setHasTail_, v3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKImageBalloonView;
  -[CKObscurableBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  -[CKImageBalloonView setImage:](self, "setImage:", 0);
  -[CKImageBalloonView setAnimatedImage:](self, "setAnimatedImage:", 0);
  -[CKImageBalloonView setIsIrisAsset:](self, "setIsIrisAsset:", 0);
  -[CKImageBalloonView setIsMonoskiAsset:](self, "setIsMonoskiAsset:", 0);
  -[CKImageBalloonView setSuppressMask:](self, "setSuppressMask:", 0);
  -[CKImageBalloonView setScheduled:](self, "setScheduled:", 0);
  -[CKImageBalloonView imageContentView](self, "imageContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskView:", 0);

  -[CKImageBalloonView imageContentView](self, "imageContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[CKImageBalloonView setGradientView:](self, "setGradientView:", 0);
}

- (void)setSuppressMask:(BOOL)a3
{
  if (self->_suppressMask != a3)
  {
    self->_suppressMask = a3;
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[CKBalloonView prepareForDisplayIfNeeded](self, "prepareForDisplayIfNeeded");
  }
}

- (void)setIsMonoskiAsset:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsBalloonBadges");

  if (v6 && self->_isMonoskiAsset != v3)
  {
    self->_isMonoskiAsset = v3;
    -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
    {

      if (!v8)
      {
        +[CKMonoskiBadgeViewFactory badgeViewWithSupportsGradient:](_TtC7ChatKit25CKMonoskiBadgeViewFactory, "badgeViewWithSupportsGradient:", -[CKImageBalloonView isScheduled](self, "isScheduled") ^ 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "effectView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          -[CKImageBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v12, v10);
        else
          -[CKImageBalloonView addSubview:](self, "addSubview:", v12);
        -[CKImageBalloonView setMonoskiBadgeView:](self, "setMonoskiBadgeView:", v12);
        -[CKImageBalloonView setIsIrisAsset:](self, "setIsIrisAsset:", 0);

      }
    }
    else
    {

      if (v8)
      {
        -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

        -[CKImageBalloonView setMonoskiBadgeView:](self, "setMonoskiBadgeView:", 0);
      }
    }
  }
}

- (void)setIsIrisAsset:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsBalloonBadges");

  if (v6 && self->_isIrisAsset != v3)
  {
    self->_isIrisAsset = v3;
    if (v3 && !self->_isMonoskiAsset)
    {
      -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc(MEMORY[0x1E0CEA658]);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "livePhotoBadgeImage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v10, "initWithImage:", v12);

        objc_msgSend(v19, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = 0.5;
        objc_msgSend(v13, "setShadowOpacity:", v14);

        objc_msgSend(v19, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setShadowOffset:", 0.0, 0.0);

        objc_msgSend(v19, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setShadowRadius:", 1.0);

        -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "effectView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          -[CKImageBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v19, v18);
        else
          -[CKImageBalloonView addSubview:](self, "addSubview:", v19);
        -[CKImageBalloonView setIrisBadgeView:](self, "setIrisBadgeView:", v19);

      }
    }
    else
    {
      -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        -[CKImageBalloonView setIrisBadgeView:](self, "setIrisBadgeView:", 0);
      }
    }
  }
}

- (void)setImage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  UIView *v9;
  UIView *gradientView;
  CAGradientLayer *v11;
  CAGradientLayer *gradientLayer;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_animatedImage
    && +[CKImageAnimationTimer accessibilityAnimatedImagesDisabled](CKImageAnimationTimer, "accessibilityAnimatedImagesDisabled")&& !-[CKImageBalloonView userExplicitlyUnpausedAnimation](self, "userExplicitlyUnpausedAnimation"))
  {
    -[CKImageBalloonView _addPauseButtonToImage:](self, "_addPauseButtonToImage:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isScheduledMessagesCoreEnabled");

  if (v7)
  {
    -[CKImageBalloonView imageContentView](self, "imageContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v4);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CKImageBalloonView;
    -[CKBalloonImageView setImage:](&v19, sel_setImage_, v4);
  }
  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    gradientView = self->_gradientView;
    self->_gradientView = v9;

    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v11 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
    gradientLayer = self->_gradientLayer;
    self->_gradientLayer = v11;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_retainAutorelease(v13);
    v20[0] = objc_msgSend(v15, "CGColor");
    v16 = objc_retainAutorelease(v14);
    v20[1] = objc_msgSend(v16, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v17);

    -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", 0.0, 1.0);
    -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", 0.0, 0.0);
    -[UIView layer](self->_gradientView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertSublayer:atIndex:", self->_gradientLayer, 0);

    -[CKImageBalloonView addSubview:](self, "addSubview:", self->_gradientView);
  }

}

- (void)setAnimatedImage:(id)a3
{
  CKAnimatedImage *v5;
  void *v6;
  void *v7;
  CKAnimatedImage *v8;

  v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    -[CKAnimatedImage frames](self->_animatedImage, "frames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {

      v6 = 0;
    }
    -[CKImageBalloonView setFrames:](self, "setFrames:", v6);
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v6, "objectAtIndex:", 0);
    else
      -[CKAnimatedImage image](v8, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView setImage:](self, "setImage:", v7);

    -[CKImageBalloonView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
    v5 = v8;
  }

}

- (CKImageBalloonView)initWithFrame:(CGRect)a3
{
  CKImageBalloonView *v3;
  CKBalloonImageView *v4;
  CKBalloonImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CKBalloonImageView *v12;
  CKBalloonImageView *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKImageBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKBalloonImageView alloc];
    -[CKImageBalloonView bounds](v3, "bounds");
    v5 = -[CKBalloonImageView initWithFrame:](v4, "initWithFrame:");
    -[CKBalloonImageView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[CKImageBalloonView setTailMask:](v3, "setTailMask:", v5);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unfilledBalloonColorForColorType:", 0xFFFFFFFFLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ckColor");
    -[CKBalloonView setStrokeColor:](v3, "setStrokeColor:");

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v9, "isScheduledMessagesCoreEnabled");

    if ((_DWORD)v7)
    {
      v10 = objc_alloc(MEMORY[0x1E0CEA658]);
      -[CKImageBalloonView bounds](v3, "bounds");
      v11 = (void *)objc_msgSend(v10, "initWithFrame:");
      objc_msgSend(v11, "setContentMode:", 2);
      -[CKImageBalloonView setImageContentView:](v3, "setImageContentView:", v11);
      v12 = [CKBalloonImageView alloc];
      -[CKImageBalloonView bounds](v3, "bounds");
      v13 = -[CKBalloonImageView initWithFrame:](v12, "initWithFrame:");
      -[CKImageBalloonView setImageInsetMask:](v3, "setImageInsetMask:", v13);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v3, sel__animatedImagesStateChanged_, *MEMORY[0x1E0DDE200], 0);

  }
  return v3;
}

- (void)setTailMask:(id)a3
{
  objc_storeStrong((id *)&self->_tailMask, a3);
}

- (UIEdgeInsets)safeAreaInsets
{
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
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  UIEdgeInsets result;

  v20.receiver = self;
  v20.super_class = (Class)CKImageBalloonView;
  -[CKImageBalloonView safeAreaInsets](&v20, sel_safeAreaInsets);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "balloonMaskTailSizeForTailShape:", 1);
  v13 = v12;

  v14 = -[CKBalloonView orientation](self, "orientation");
  if (v14)
    v15 = v13;
  else
    v15 = v10;
  v16 = -0.0;
  if (!v14)
    v16 = v13;
  v17 = v6 + v16;
  v18 = v4;
  v19 = v8;
  result.right = v15;
  result.bottom = v19;
  result.left = v17;
  result.top = v18;
  return result;
}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](self, "configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:", a3, a5, 0, a4);
}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  CKImageBalloonView *v36;
  objc_super v37;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView configureForMediaObject:previewWidth:orientation:](&v37, sel_configureForMediaObject_previewWidth_orientation_, v10, v7, a4);
  if (CKIsRunningInMacCatalyst())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mapPreviewMaxWidth");
      a4 = v12;

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    if (objc_msgSend(v13, "isSticker"))
    {
      objc_msgSend(v13, "sticker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "externalURI");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("sticker:///emoji/"));

      objc_msgSend(v14, "representations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "size");
        v20 = v19;
        -[CKImageBalloonView traitCollection](self, "traitCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "displayScale");
        v23 = v20 / v22;

        objc_msgSend(v18, "size");
        v25 = v24;
        -[CKImageBalloonView traitCollection](self, "traitCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "displayScale");
        v28 = v25 / v27;

      }
      else
      {
        v23 = *MEMORY[0x1E0C9D820];
        v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKImageBalloonView traitCollection](self, "traitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "displayScale");
      objc_msgSend(v29, "stickerInlinePreviewMaxWidthForImageSize:isEmoji:displayScale:", v16, v23, v28, v31);
      a4 = v32;

    }
  }
  objc_msgSend(v10, "previewForWidth:orientation:", v7, a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKImageBalloonView setAnimatedImage:](self, "setAnimatedImage:", v33);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKImageBalloonView setImage:](self, "setImage:", v33);
      -[CKBalloonView configureForEffectViewWithMediaObject:](self, "configureForEffectViewWithMediaObject:", v10);
    }
  }
  if (v6)
  {
    objc_msgSend(v10, "invisibleInkEffectImageWithPreview:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonImageView setInvisibleInkEffectImage:](self, "setInvisibleInkEffectImage:", v34);

  }
  if (objc_msgSend(v10, "isMonoskiAsset"))
  {
    -[CKImageBalloonView setIsMonoskiAsset:](self, "setIsMonoskiAsset:", 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = objc_msgSend(v10, "isIrisAsset");
      v36 = self;
    }
    else
    {
      v36 = self;
      v35 = 0;
    }
    -[CKImageBalloonView setIsIrisAsset:](v36, "setIsIrisAsset:", v35);
  }

}

- (void)configureForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView configureForComposition:](&v22, sel_configureForComposition_, v4);
  objc_msgSend(v4, "shelfPluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D375E0]))
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "existingPhotoBrowserViewController");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v8;

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v11, "fetchPluginPayloadsAndClear:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaObjectFromPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  IMBalloonExtensionIDWithSuffix();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if (v10)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerForPluginIdentifier:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v4, "shelfPluginPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "shouldSendAsMediaObject"))
  {
    objc_msgSend(v11, "mediaObjectFromPayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v4, "mediaObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  if (v14)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "previewMaxWidth");
    -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](self, "configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:", v14, 1, 1);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isScheduledMessagesCoreEnabled");

  if (v17)
  {
    objc_msgSend(v4, "sendLaterPluginInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[CKImageBalloonView setScheduled:](self, "setScheduled:", 1);
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isDashedBalloonsEnabled");

      if (v20)
        v21 = 3;
      else
        v21 = 1;
      -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", v21);
    }
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationTimerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKImageBalloonView animatedImage](self, "animatedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKImageBalloonView animatedImage:%@ %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  _BOOL4 v31;
  CGFloat v32;
  CGFloat v33;
  _BOOL4 v34;
  void *v35;
  objc_super v36;
  CGPoint v37;
  CGRect v38;

  v4 = a3;
  v5 = +[CKImageAnimationTimer accessibilityAnimatedImagesDisabled](CKImageAnimationTimer, "accessibilityAnimatedImagesDisabled");
  v6 = -[CKObscurableBalloonView isObscured](self, "isObscured");
  if (!self->_animatedImage || v6 || !v5)
    goto LABEL_10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playButtonImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  -[CKImageBalloonView bounds](self, "bounds");
  -[CKImageBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (CKMainScreenScale_once_22 != -1)
    dispatch_once(&CKMainScreenScale_once_22, &__block_literal_global_268_0);
  v21 = *(double *)&CKMainScreenScale_sMainScreenScale_22;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_22 == 0.0)
    v21 = 1.0;
  v22 = v10 * v21;
  v23 = v12 * v21;
  v24 = v14 * v21 + floor((v18 * v21 - v10 * v21) * 0.5);
  v25 = v16 * v21 + floor((v20 * v21 - v12 * v21) * 0.5);
  v26 = 1.0 / v21;
  v27 = v26 * v24;
  v28 = v26 * v25;
  v29 = v22 * v26;
  v30 = v23 * v26;
  v31 = -[CKImageBalloonView userExplicitlyUnpausedAnimation](self, "userExplicitlyUnpausedAnimation");
  objc_msgSend(v4, "locationInView:", self);
  v37.x = v32;
  v37.y = v33;
  v38.origin.x = v27;
  v38.origin.y = v28;
  v38.size.width = v29;
  v38.size.height = v30;
  v34 = CGRectContainsPoint(v38, v37);
  if (v31 || v34)
  {
    -[CKImageBalloonView setUserExplicitlyUnpausedAnimation:](self, "setUserExplicitlyUnpausedAnimation:", -[CKImageBalloonView userExplicitlyUnpausedAnimation](self, "userExplicitlyUnpausedAnimation") ^ 1);
    if (v31)
    {
      -[CKImageBalloonView image](self, "image");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKImageBalloonView setImage:](self, "setImage:", v35);

    }
  }
  else
  {
LABEL_10:
    v36.receiver = self;
    v36.super_class = (Class)CKImageBalloonView;
    -[CKObscurableBalloonView tapGestureRecognized:](&v36, sel_tapGestureRecognized_, v4);
  }

}

- (void)_animatedImagesStateChanged:(id)a3
{
  id v4;

  -[CKImageBalloonView image](self, "image", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKImageBalloonView setImage:](self, "setImage:", v4);

}

- (id)_addPauseButtonToImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  -[CKImageBalloonView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thumbnailContentAlignmentInsetsForOrientation:", -[CKBalloonView orientation](self, "orientation"));
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  +[CKMovieMediaObject playButtonPreviewForUIImage:scale:contentAlignmentInsets:](CKMovieMediaObject, "playButtonPreviewForUIImage:scale:contentAlignmentInsets:", v4, v7, v10, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (UIEdgeInsets)imageInsets
{
  void *v3;
  int v4;
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
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScheduledMessagesCoreEnabled");

  v5 = 0.0;
  if (v4)
  {
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    if (-[CKImageBalloonView isScheduled](self, "isScheduled"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageSendLaterInsets");
      v6 = v10;
      v5 = v11;
      v7 = v12;
      v8 = v13;

    }
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
  }
  v14 = v6;
  v15 = v5;
  v16 = v7;
  v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  int v57;
  UIImageView *imageContentView;
  double v59;
  double v60;
  double v61;
  double v62;
  CKBalloonImageView *imageInsetMask;
  double v64;
  double v65;
  UIImageView *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  objc_super v92;

  v92.receiver = self;
  v92.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView layoutSubviews](&v92, sel_layoutSubviews);
  -[CKImageBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CKImageBalloonView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContents:", 0);

  }
  -[CKImageBalloonView tailMask](self, "tailMask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  -[CKImageBalloonView outlineMask](self, "outlineMask");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  -[CKImageBalloonView outlineMask](self, "outlineMask");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImageBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v15);

  -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "verticalBalloonBadgeInset");
    v19 = v18;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "horizontalBalloonBadgeInset");
    v22 = v21;

    -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeToFit");

    -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    v28 = v27;

    if (!-[CKBalloonView orientation](self, "orientation"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "balloonMaskTailSizeForTailShape:", 1);
      v22 = v22 + v30;

    }
    -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v22, v19, v26, v28);

    -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v32);

  }
  -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[CKImageBalloonView safeAreaInsets](self, "safeAreaInsets");
    v91 = v34;
    -[CKImageBalloonView safeAreaInsets](self, "safeAreaInsets");
    v36 = v35;
    -[CKImageBalloonView bounds](self, "bounds");
    v38 = v37;
    -[CKImageBalloonView safeAreaInsets](self, "safeAreaInsets");
    v40 = v39;
    -[CKImageBalloonView safeAreaInsets](self, "safeAreaInsets");
    v42 = v38 - (v40 + v41);
    -[CKImageBalloonView bounds](self, "bounds");
    v44 = v43;
    -[CKImageBalloonView safeAreaInsets](self, "safeAreaInsets");
    v45 = v6;
    v46 = v4;
    v47 = v8;
    v48 = v10;
    v50 = v49;
    -[CKImageBalloonView safeAreaInsets](self, "safeAreaInsets");
    v52 = v44 - (v50 + v51);
    -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v52;
    v10 = v48;
    v8 = v47;
    v4 = v46;
    v6 = v45;
    objc_msgSend(v53, "setFrame:", v91, v36, v42, v54);

    if (!-[CKObscurableBalloonView isObscured](self, "isObscured"))
    {
      -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKImageBalloonView bringSubviewToFront:](self, "bringSubviewToFront:", v55);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isScheduledMessagesCoreEnabled");

  if (v57)
  {
    imageContentView = self->_imageContentView;
    -[CKImageBalloonView imageInsets](self, "imageInsets");
    -[UIImageView setFrame:](imageContentView, "setFrame:", v4 + v62, v6 + v59, v8 - (v62 + v60), v10 - (v59 + v61));
    imageInsetMask = self->_imageInsetMask;
    -[UIImageView frame](self->_imageContentView, "frame");
    v65 = v64;
    -[UIImageView frame](self->_imageContentView, "frame");
    -[CKBalloonImageView setFrame:](imageInsetMask, "setFrame:", 0.0, 0.0, v65);
    v66 = self->_imageContentView;
    if (-[CKImageBalloonView isScheduled](self, "isScheduled"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "scheduledImageBalloonAlpha");
      -[UIImageView setAlpha:](v66, "setAlpha:");

    }
    else
    {
      -[UIImageView setAlpha:](v66, "setAlpha:", 1.0);
    }
    -[UIImageView setHidden:](self->_imageContentView, "setHidden:", -[CKBalloonImageView imageHidden](self, "imageHidden"));
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "effectView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView frame](self->_imageContentView, "frame");
    objc_msgSend(v69, "setFrame:");

  }
  -[CKImageBalloonView gradientView](self, "gradientView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    -[CKImageBalloonView bounds](self, "bounds");
    v72 = v71;
    -[CKImageBalloonView bounds](self, "bounds");
    v74 = v73;
    -[CKImageBalloonView bounds](self, "bounds");
    v76 = v75;
    -[CKImageBalloonView bounds](self, "bounds");
    v78 = v77 * 0.5;
    -[CKImageBalloonView gradientLayer](self, "gradientLayer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setFrame:", v72, v74, v76, v78);

    -[CKImageBalloonView bounds](self, "bounds");
    v81 = v80;
    -[CKImageBalloonView bounds](self, "bounds");
    v83 = v82;
    -[CKImageBalloonView bounds](self, "bounds");
    v85 = v83 + v84 * 0.5;
    -[CKImageBalloonView bounds](self, "bounds");
    v87 = v86;
    -[CKImageBalloonView bounds](self, "bounds");
    v89 = v88 * 0.5;
    -[CKImageBalloonView gradientView](self, "gradientView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setFrame:", v81, v85, v87, v89);

  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKImageBalloonView;
  -[CKImageBalloonView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CKImageBalloonView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKImageBalloonView animatedImage](self, "animatedImage", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;
    v13 = v12;

    objc_msgSend(v8, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isScheduledMessagesCoreEnabled");

    if (v16)
    {
      -[CKImageBalloonView imageContentView](self, "imageContentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      v11 = v18;
      v13 = v19;

    }
    else
    {
      -[CKImageBalloonView image](self, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "size");
      v11 = v20;
      v13 = v21;
    }
  }

  if (width < v11 || height < v13)
  {
    v23 = width / v11;
    v24 = 0.0;
    if (v11 == 0.0)
      v23 = 0.0;
    if (v13 != 0.0)
      v24 = height / v13;
    v25 = fmin(v23, v24);
    v11 = ceil(v11 * v25);
    v13 = ceil(v13 * v25);
  }

  v26 = v11;
  v27 = v13;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKBalloonShapeView *v15;
  CKBalloonShapeView *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  CKBalloonImageView *imageInsetMask;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _OWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38[5];
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView prepareForDisplay](&v39, sel_prepareForDisplay);
  -[CKImageBalloonView tailMask](self, "tailMask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScheduledMessagesCoreEnabled");

  if (v5)
  {
    -[CKImageBalloonView imageContentView](self, "imageContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

  }
  -[CKImageBalloonView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMask:", 0);

  -[CKImageBalloonView outlineMask](self, "outlineMask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[CKImageBalloonView gradientView](self, "gradientView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperview");

  -[CKImageBalloonView tailMask](self, "tailMask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask"))
  {
    -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
    CKResizableBalloonPunchout(v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v11);

    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "effectView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[CKImageBalloonView suppressMask](self, "suppressMask"))
    {
      if (v13)
        -[CKImageBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10, v13);
      else
        -[CKImageBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10, 0);
    }
    goto LABEL_18;
  }
  -[CKImageBalloonView tailMask](self, "tailMask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKImageBalloonView suppressMask](self, "suppressMask"))
  {
    -[CKImageBalloonView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMask:", 0);
LABEL_17:

    goto LABEL_18;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  if (-[CKBalloonView balloonStyle](self, "balloonStyle"))
  {
    -[CKImageBalloonView outlineMask](self, "outlineMask");
    v15 = (CKBalloonShapeView *)objc_claimAutoreleasedReturnValue();
    BYTE8(v37) = 0;
    LOBYTE(v34) = -1;
    if (!v15)
    {
      v16 = [CKBalloonShapeView alloc];
      v30 = v35;
      v31 = v36;
      v32 = v37;
      v28 = v33;
      v29 = v34;
      v15 = -[CKBalloonShapeView initWithDescriptor:imageGenerator:](v16, "initWithDescriptor:imageGenerator:", &v28, &__block_literal_global_52);
      -[CKBalloonShapeView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
      -[CKImageBalloonView setOutlineMask:](self, "setOutlineMask:", v15);
    }
    v27[2] = v35;
    v27[3] = v36;
    v27[4] = v37;
    v27[0] = v33;
    v27[1] = v34;
    -[CKBalloonShapeView setDescriptor:](v15, "setDescriptor:", v27);
    -[CKImageBalloonView bounds](self, "bounds");
    -[CKBalloonShapeView setFrame:](v15, "setFrame:");
    if (!-[CKImageBalloonView suppressMask](self, "suppressMask"))
      -[CKImageBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v15, 0);
    BYTE2(v33) = 0;

  }
  if (!-[CKImageBalloonView isScheduled](self, "isScheduled"))
  {
    v30 = v35;
    v31 = v36;
    v32 = v37;
    v28 = v33;
    v29 = v34;
    CKResizableBalloonMask(&v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v17);

    -[CKImageBalloonView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMask:", v18);

    goto LABEL_17;
  }
LABEL_18:

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isScheduledMessagesCoreEnabled");

  if (v20)
  {
    if (-[CKImageBalloonView isScheduled](self, "isScheduled"))
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
      BYTE9(v37) = 0;
      BYTE2(v33) = 0;
      imageInsetMask = self->_imageInsetMask;
      v30 = v35;
      v31 = v36;
      v32 = v37;
      v28 = v33;
      v29 = v34;
      CKResizableBalloonMask(&v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonImageView setImage:](imageInsetMask, "setImage:", v22);

      -[CKImageBalloonView imageContentView](self, "imageContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMaskView:", self->_imageInsetMask);

      -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "effectView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setMaskView:", self->_imageInsetMask);

    }
    -[CKImageBalloonView imageContentView](self, "imageContentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v26, 0);

  }
}

id __39__CKImageBalloonView_prepareForDisplay__block_invoke(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  v2 = a2[3];
  v5[2] = a2[2];
  v5[3] = v2;
  v5[4] = a2[4];
  v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  CKResizableBalloonImage((uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)overlayColor
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageBalloonSelectionOverlayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)image
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScheduledMessagesCoreEnabled");

  if (v4)
  {
    -[CKImageBalloonView imageContentView](self, "imageContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKImageBalloonView;
    -[CKBalloonImageView image](&v8, sel_image);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScheduledMessagesCoreEnabled");

  if (v4)
  {
    -[CKImageBalloonView imageContentView](self, "imageContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "alignmentRectInsets");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15 = objc_msgSend(v6, "imageOrientation");
      if (v15)
      {
        v16 = v15;
        if (v15 == 4)
        {
          v17 = v14;
          v14 = v10;
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("CKGeometry.h"), 429, CFSTR("CKEdgeInsetsWithImageOrientation %ld hasn't been implemented"), v16);

      }
      v17 = v10;
      goto LABEL_10;
    }
    v8 = *MEMORY[0x1E0CEB4B0];
    v17 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    goto LABEL_10;
  }
  v28.receiver = self;
  v28.super_class = (Class)CKImageBalloonView;
  -[CKBalloonImageView alignmentRectInsets](&v28, sel_alignmentRectInsets);
  v8 = v18;
  v17 = v19;
  v12 = v20;
  v14 = v21;
LABEL_11:
  v24 = v8;
  v25 = v17;
  v26 = v12;
  v27 = v14;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (void)animationTimerFired:(double)a3
{
  id v5;

  if (!-[CKBalloonView animationPaused](self, "animationPaused"))
  {
    -[CKAnimatedImage frameForAnimationTime:](self->_animatedImage, "frameForAnimationTime:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView setImage:](self, "setImage:", v5);

  }
}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)attachInvisibleInkEffectView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CKImageBalloonView *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v19 = objc_claimAutoreleasedReturnValue();

  -[CKImageBalloonView tailMask](self, "tailMask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKImageBalloonView tailMask](self, "tailMask");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v7 = (void *)v6;
    -[CKImageBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v19, v6);

    goto LABEL_7;
  }
  -[CKBalloonView stickerEffectView](self, "stickerEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self;
  if (v8)
  {
    v10 = v19;
    v11 = 1;
  }
  else
  {
    -[CKImageBalloonView outlineMask](self, "outlineMask");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self;
    if (v18)
    {
      -[CKImageBalloonView outlineMask](self, "outlineMask");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    v10 = v19;
    v11 = 0;
  }
  -[CKImageBalloonView insertSubview:atIndex:](v9, "insertSubview:atIndex:", v10, v11);
LABEL_7:
  -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v13, v19);

  }
  -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)v19;
  if (v14)
  {
    -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v16, v19);

    v15 = (void *)v19;
  }

}

- (void)detachInvisibleInkEffectView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeFromSuperview");
  -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKImageBalloonView irisBadgeView](self, "irisBadgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView addSubview:](self, "addSubview:", v5);

  }
  -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKImageBalloonView monoskiBadgeView](self, "monoskiBadgeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView addSubview:](self, "addSubview:", v7);

  }
}

- (void)invisibleInkEffectViewWasUncovered
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[CKImageBalloonView animatedImage](self, "animatedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = v5;

  v7 = 5.0;
  if (v6 > 0.0)
    v7 = v6 * ceil(5.0 / v6);
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspendForTimeInterval:", v7);

}

- (void)invisibleInkEffectViewWasResumed
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CKImageBalloonView setAnimationFrameOffset:](self, "setAnimationFrameOffset:", 0);
  -[CKImageBalloonView frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CKImageBalloonView frames](self, "frames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonView setImage:](self, "setImage:", v6);

  }
  -[CKImageBalloonView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
}

- (void)updateAnimationTimerObserving
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[CKImageBalloonView frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2
    && (-[CKImageBalloonView window](self, "window"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    if (!-[CKBalloonView invisibleInkEffectEnabled](self, "invisibleInkEffectEnabled"))
    {

LABEL_9:
      +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAnimationTimerObserver:", self);
      goto LABEL_10;
    }
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSuspended");

    if (v7)
      goto LABEL_9;
  }
  else
  {

  }
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAnimationTimerObserver:", self);
LABEL_10:

}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "balloonBackdropFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "Cannot have two backdrop filter layers", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _CKAssert(v8 == 0);

    }
    -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperlayer");

      -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", 0);
    }
    -[CKImageBalloonView setSuppressMask:](self, "setSuppressMask:", 1);
    -[CKImageBalloonView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[CKImageBalloonView tailMask](self, "tailMask");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(MEMORY[0x1E0CD2708]);
    -[CKImageBalloonView bounds](self, "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v14, "setGroupName:", CFSTR("FSMBackdropGroup"));
    objc_msgSend(v4, "balloonBackdropFilters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFilters:", v15);

    objc_msgSend(v14, "setScale:", 0.25);
    if (v13)
    {
      objc_msgSend(v14, "setMaskImage:", v13);
      v16 = (void *)MEMORY[0x1E0CD27A8];
      -[CKImageBalloonView bounds](self, "bounds");
      objc_msgSend(v16, "boundsForMaskImage:withOriginalSize:", v13, v17, v18);
      objc_msgSend(v14, "setFrame:");
      -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", v14);
    }
    -[CKImageBalloonView layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", v14);

    -[CKBalloonView setInvisibleInkEffectEnabled:](self, "setInvisibleInkEffectEnabled:", 0);
  }
  -[CKImageBalloonView layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonFilters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFilters:", v21);

  -[CKImageBalloonView layer](self, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonCompositingFilter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCompositingFilter:", v23);

  v24.receiver = self;
  v24.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView addFilter:](&v24, sel_addFilter_, v4);

}

- (void)clearFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[CKImageBalloonView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupBlending:", 1);

  -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", 0);
  -[CKImageBalloonView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", 0);

  -[CKImageBalloonView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", 0);

  v7.receiver = self;
  v7.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView clearFilters](&v7, sel_clearFilters);
  -[CKImageBalloonView setSuppressMask:](self, "setSuppressMask:", 0);
}

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (CKBalloonImageView)tailMask
{
  return self->_tailMask;
}

- (CKBalloonShapeView)outlineMask
{
  return self->_outlineMask;
}

- (void)setOutlineMask:(id)a3
{
  objc_storeStrong((id *)&self->_outlineMask, a3);
}

- (BOOL)suppressMask
{
  return self->_suppressMask;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (BOOL)isMonoskiAsset
{
  return self->_isMonoskiAsset;
}

- (UIImageView)irisBadgeView
{
  return self->_irisBadgeView;
}

- (void)setIrisBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_irisBadgeView, a3);
}

- (UIView)monoskiBadgeView
{
  return self->_monoskiBadgeView;
}

- (void)setMonoskiBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_monoskiBadgeView, a3);
}

- (BOOL)isScheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (CKBalloonImageView)imageInsetMask
{
  return self->_imageInsetMask;
}

- (void)setImageInsetMask:(id)a3
{
  objc_storeStrong((id *)&self->_imageInsetMask, a3);
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 768);
}

- (UIImageView)imageContentView
{
  return self->_imageContentView;
}

- (void)setImageContentView:(id)a3
{
  objc_storeStrong((id *)&self->_imageContentView, a3);
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (unint64_t)animationFrameOffset
{
  return self->_animationFrameOffset;
}

- (void)setAnimationFrameOffset:(unint64_t)a3
{
  self->_animationFrameOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_imageContentView, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_imageInsetMask, 0);
  objc_storeStrong((id *)&self->_monoskiBadgeView, 0);
  objc_storeStrong((id *)&self->_irisBadgeView, 0);
  objc_storeStrong((id *)&self->_outlineMask, 0);
  objc_storeStrong((id *)&self->_tailMask, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView configureForMessagePart:](&v22, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "mediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewMaxWidth");
  v8 = v7;
  v9 = objc_msgSend(v4, "balloonOrientation");
  objc_msgSend(v4, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressiveSendStyleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](self, "configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:", v5, v9, objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")), v8);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v12, "isScheduledMessagesCoreEnabled");

  if ((_DWORD)v6)
  {
    objc_msgSend(v4, "messageItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "scheduleType");

    if (v14 == 2)
    {
      objc_msgSend(v4, "messageItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "scheduleState");

      if (v16 <= 5)
        v17 = (0x36u >> v16) & 1;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    -[CKImageBalloonView setScheduled:](self, "setScheduled:", v17);
  }
  else
  {
    LOBYTE(v17) = 0;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isDashedBalloonsEnabled");

  if (v19)
    v20 = 3;
  else
    v20 = 1;
  if ((v17 & 1) == 0)
    v20 = objc_msgSend(v4, "balloonStyle", v20);
  -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", v20);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "mediaObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonView configureForEffectViewWithMediaObject:](self, "configureForEffectViewWithMediaObject:", v21);

  }
}

- (void)configureForTranscriptPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKImageBalloonView;
  -[CKBalloonView configureForMessagePart:](&v8, sel_configureForMessagePart_, v4);
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSnapshotUtilities snapshotForGUID:](CKSnapshotUtilities, "snapshotForGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKImageBalloonView setImage:](self, "setImage:", v7);

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "wantsOutline"))
    -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", 1);

}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
  -[CKBalloonView addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:](self, "addSuggestedActionsMenuWithSuggestedActionsList:backgroundStyle:", a3, 2);
}

@end
