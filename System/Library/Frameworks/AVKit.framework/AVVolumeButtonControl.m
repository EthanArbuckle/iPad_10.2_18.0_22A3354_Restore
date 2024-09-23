@implementation AVVolumeButtonControl

- (void)setMicaPackageStateName:(id)a3
{
  NSString *v4;
  NSString *micaPackageStateName;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_micaPackageStateName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    micaPackageStateName = self->_micaPackageStateName;
    self->_micaPackageStateName = v4;

    -[AVVolumeButtonControl micaPackage](self, "micaPackage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVolumeButtonControl _updateMicaPackage:](self, "_updateMicaPackage:", v6);

  }
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVVolumeButtonControl layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVVolumeButtonControl setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVVolumeButtonControl _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)setLongPressEnabled:(BOOL)a3
{
  self->_longPressEnabled = a3;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  id v4;

  if (self->_hasFullScreenAppearance != a3)
  {
    self->_hasFullScreenAppearance = a3;
    -[AVVolumeButtonControl micaPackage](self, "micaPackage");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVVolumeButtonControl _updateMicaPackage:](self, "_updateMicaPackage:", v4);

  }
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    -[AVVolumeButtonControl invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVVolumeButtonControl _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

void __39__AVVolumeButtonControl_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateMicaPackage:", v3);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setMicaPackage:", v3);

}

- (void)setMicaPackage:(id)a3
{
  AVMicaPackage *v5;
  AVMicaPackage *v6;

  v5 = (AVMicaPackage *)a3;
  if (self->_micaPackage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_micaPackage, a3);
    v5 = v6;
    if (v6)
    {
      -[AVVolumeButtonControl _updateMicaPackage:](self, "_updateMicaPackage:", v6);
      -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
      v5 = v6;
    }
  }

}

- (BOOL)isCollapsedOrExcluded
{
  void *v3;
  BOOL v4;

  if (-[AVVolumeButtonControl isCollapsed](self, "isCollapsed")
    || !-[AVVolumeButtonControl isIncluded](self, "isIncluded"))
  {
    return 1;
  }
  -[AVVolumeButtonControl micaPackage](self, "micaPackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[AVVolumeButtonControl isRemoved](self, "isRemoved");
  else
    v4 = 1;

  return v4;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  _BOOL4 IsIdentity;
  void *v6;
  void *v7;
  void *v8;
  CGAffineTransform v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVVolumeButtonControl;
  -[AVVolumeButtonControl layoutSubviews](&v10, sel_layoutSubviews);
  -[AVVolumeButtonControl micaPackageContainerView](self, "micaPackageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "transform");
  else
    memset(&v9, 0, sizeof(v9));
  IsIdentity = CGAffineTransformIsIdentity(&v9);

  if (IsIdentity)
  {
    -[AVVolumeButtonControl micaPackageContainerView](self, "micaPackageContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVolumeButtonControl bounds](self, "bounds");
    objc_msgSend(v6, "setFrame:");

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVVolumeButtonControl micaPackage](self, "micaPackage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVolumeButtonControl bounds](self, "bounds");
    UIRectGetCenter();
    objc_msgSend(v8, "setPosition:");

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (AVMicaPackage)micaPackage
{
  return self->_micaPackage;
}

- (void)_updateMicaPackage:(id)a3
{
  id v4;
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
  int64_t v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;

  v4 = a3;
  if (v4 && !-[AVVolumeButtonControl hasFullScreenAppearance](self, "hasFullScreenAppearance"))
  {
    v34 = -[UIView avkit_isBeingScrolled](self, "avkit_isBeingScrolled");
    -[AVVolumeButtonControl micaPackageStateName](self, "micaPackageStateName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setState:color:", v35, 0);

    if (v34)
    {
      objc_initWeak(&location, self);
      -[AVVolumeButtonControl imageNameForMicaPackageState](self, "imageNameForMicaPackageState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0DC3870];
      -[AVVolumeButtonControl imageNameForMicaPackageState](self, "imageNameForMicaPackageState");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __44__AVVolumeButtonControl__updateMicaPackage___block_invoke;
      v40[3] = &unk_1E5BB4940;
      objc_copyWeak(&v42, &location);
      v39 = v36;
      v41 = v39;
      objc_msgSend(v37, "avkit_imageNamed:completion:", v38, v40);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      goto LABEL_17;
    }
  }
  else
  {
    -[AVVolumeButtonControl micaPackageStateName](self, "micaPackageStateName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setState:color:", v5, 0);

  }
  objc_msgSend(v4, "rootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVolumeButtonControl micaPackageContainerView](self, "micaPackageContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVVolumeButtonControl micaPackageContainerView](self, "micaPackageContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVolumeButtonControl addSubview:](self, "addSubview:", v10);

    -[AVVolumeButtonControl layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompositingFilter:", 0);

    -[AVVolumeButtonControl micaPackageContainerView](self, "micaPackageContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", 0);

    -[AVVolumeButtonControl micaPackageContainerView](self, "micaPackageContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v16);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "userInterfaceIdiom") == 1)
  {
    v19 = -[AVVolumeButtonControl volumeControllerType](self, "volumeControllerType");

    if (v19 == 1)
      v20 = 1.2;
    else
      v20 = 1.0;
  }
  else
  {

    v20 = 1.0;
  }
  v21 = -[AVVolumeButtonControl hasFullScreenAppearance](self, "hasFullScreenAppearance");
  v22 = 20.0;
  if (v21)
    v22 = 24.0;
  objc_msgSend(v4, "setTargetSize:", v20 * v22, v20 * v22);
  -[AVVolumeButtonControl bounds](self, "bounds");
  UIRectGetCenter();
  v24 = v23;
  v26 = v25;
  objc_msgSend(v4, "rootLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "position");
  v29 = v28;
  v31 = v30;

  if (v24 != v29 || v26 != v31)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(v4, "rootLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVolumeButtonControl bounds](self, "bounds");
    UIRectGetCenter();
    objc_msgSend(v32, "setPosition:");

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  -[AVVolumeButtonControl imageView](self, "imageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeFromSuperview");

LABEL_17:
}

- (UIView)micaPackageContainerView
{
  return self->_micaPackageContainerView;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (NSString)micaPackageStateName
{
  return self->_micaPackageStateName;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AVVolumeButtonControl)initWithFrame:(CGRect)a3
{
  char *v3;
  AVVolumeButtonControl *v4;
  id v5;
  uint64_t v6;
  UIImageView *imageView;
  id v8;
  uint64_t v9;
  UIView *micaPackageContainerView;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  AVLayoutItemAttributes *v18;
  AVLayoutItemAttributes *layoutAttributes;
  AVLayoutItemAttributes *v20;
  AVLayoutItemAttributes *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AVVolumeButtonControl;
  v3 = -[AVVolumeButtonControl initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (AVVolumeButtonControl *)v3;
  if (v3)
  {
    v3[477] = 1;
    *((_QWORD *)v3 + 58) = 0;
    v3[472] = 1;
    *(_OWORD *)(v3 + 632) = AVDefaultHitRectInsets_19471;
    *(_OWORD *)(v3 + 648) = unk_1AC5F8160;
    *((_QWORD *)v3 + 68) = 0;
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[AVVolumeButtonControl bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v6;

    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[AVVolumeButtonControl bounds](v4, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    micaPackageContainerView = v4->_micaPackageContainerView;
    v4->_micaPackageContainerView = (UIView *)v9;

    -[AVVolumeButtonControl layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[UIView layer](v4->_micaPackageContainerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupBlending:", 0);

    LODWORD(v13) = 1148846080;
    -[AVVolumeButtonControl setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v13);
    LODWORD(v14) = 1148846080;
    -[AVVolumeButtonControl setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v14);
    LODWORD(v15) = 1148846080;
    -[AVVolumeButtonControl setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    LODWORD(v16) = 1148846080;
    -[AVVolumeButtonControl setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    -[AVVolumeButtonControl setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Mute Toggle"));
    -[AVVolumeButtonControl setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 1);
    -[UIView avkit_reevaluateHiddenStateOfItem:](v4, "avkit_reevaluateHiddenStateOfItem:", v4);
    v17 = -[AVVolumeButtonControl effectiveUserInterfaceLayoutDirection](v4, "effectiveUserInterfaceLayoutDirection");
    objc_initWeak(&location, v4);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __39__AVVolumeButtonControl_initWithFrame___block_invoke;
    v27 = &unk_1E5BB3EF0;
    objc_copyWeak(&v28, &location);
    +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:](AVMicaPackage, "asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:", CFSTR("VolumeGlyph"), v17, &v24);
    v18 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v18;

    v20 = v4->_layoutAttributes;
    -[AVVolumeButtonControl intrinsicContentSize](v4, "intrinsicContentSize", v24, v25, v26, v27);
    -[AVLayoutItemAttributes setMinimumSize:](v20, "setMinimumSize:");
    -[AVLayoutItemAttributes setCollapsed:](v4->_layoutAttributes, "setCollapsed:", -[AVVolumeButtonControl isCollapsed](v4, "isCollapsed"));
    -[AVLayoutItemAttributes setIncluded:](v4->_layoutAttributes, "setIncluded:", -[AVVolumeButtonControl isIncluded](v4, "isIncluded"));
    -[AVLayoutItemAttributes setHasFlexibleContentSize:](v4->_layoutAttributes, "setHasFlexibleContentSize:", 0);
    v21 = v4->_layoutAttributes;
    -[AVVolumeButtonControl accessibilityIdentifier](v4, "accessibilityIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutItemAttributes setAccessibilityIdentifier:](v21, "setAccessibilityIdentifier:", v22);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)_updateLayoutItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[AVVolumeButtonControl layoutAttributes](self, "layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVolumeButtonControl intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v3, "setMinimumSize:");

  -[AVVolumeButtonControl layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVVolumeButtonControl isIncluded](self, "isIncluded"))
    v5 = -[AVVolumeButtonControl isRemoved](self, "isRemoved") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "setIncluded:", v5);

  -[AVVolumeButtonControl layoutAttributes](self, "layoutAttributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollapsed:", -[AVVolumeButtonControl isCollapsed](self, "isCollapsed"));

}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)AVVolumeButtonControl;
  -[AVVolumeButtonControl intrinsicContentSize](&v13, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[AVVolumeButtonControl extrinsicContentSize](self, "extrinsicContentSize");
  if (v7 > 0.0)
  {
    -[AVVolumeButtonControl extrinsicContentSize](self, "extrinsicContentSize");
    v4 = v8;
  }
  -[AVVolumeButtonControl extrinsicContentSize](self, "extrinsicContentSize");
  if (v9 > 0.0)
  {
    -[AVVolumeButtonControl extrinsicContentSize](self, "extrinsicContentSize");
    v6 = v10;
  }
  v11 = v4;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVVolumeButtonControl _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v4;
  UISelectionFeedbackGenerator *v5;

  feedbackGenerator = self->_feedbackGenerator;
  if (!feedbackGenerator)
  {
    v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
    v5 = self->_feedbackGenerator;
    self->_feedbackGenerator = v4;

    feedbackGenerator = self->_feedbackGenerator;
  }
  return feedbackGenerator;
}

- (void)setVolumeControllerType:(int64_t)a3
{
  self->_volumeControllerType = a3;
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVVolumeButtonControl _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)triggerSelectionChangedFeedback
{
  id v3;

  if (-[AVVolumeButtonControl isTracking](self, "isTracking"))
  {
    -[AVVolumeButtonControl feedbackGenerator](self, "feedbackGenerator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectionChanged");

  }
}

- (void)setShowsHighlightedAppearance:(BOOL)a3
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  if (-[AVVolumeButtonControl showsHighlightedAppearance](self, "showsHighlightedAppearance") != a3)
  {
    self->_showsHighlightedAppearance = a3;
    -[AVVolumeButtonControl highlightAnimator](self, "highlightAnimator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isRunning") && objc_msgSend(v5, "isInterruptible"))
    {
      objc_msgSend(v5, "stopAnimation:", 0);
      objc_msgSend(v5, "finishAnimationAtPosition:", 2);
    }
    if ((objc_msgSend(v5, "isRunning") & 1) == 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3F38]);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __55__AVVolumeButtonControl_setShowsHighlightedAppearance___block_invoke;
      v8[3] = &unk_1E5BB4CA0;
      v8[4] = self;
      v7 = (void *)objc_msgSend(v6, "initWithDuration:curve:animations:", 3, v8, 0.1);

      objc_msgSend(v7, "startAnimation");
      -[AVVolumeButtonControl setHighlightAnimator:](self, "setHighlightAnimator:", v7);
      v5 = v7;
    }

  }
}

- (void)setTrackingState:(int64_t)a3
{
  int64_t trackingState;
  double v5;
  double v6;
  uint64_t v7;
  id v8;

  trackingState = self->_trackingState;
  if (trackingState != a3)
  {
    self->_trackingState = a3;
    switch(a3)
    {
      case 0:
        if (trackingState == 4)
          -[AVVolumeButtonControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x4000000);
        v5 = *MEMORY[0x1E0C9D538];
        v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[AVVolumeButtonControl setCumulativeTranslationSincePanningBegan:](self, "setCumulativeTranslationSincePanningBegan:", *MEMORY[0x1E0C9D538], v6);
        -[AVVolumeButtonControl setTranslationOfPanFromPreviousTouch:](self, "setTranslationOfPanFromPreviousTouch:", v5, v6);
        -[AVVolumeButtonControl setLocationOfTouchInWindow:](self, "setLocationOfTouchInWindow:", v5, v6);
        goto LABEL_10;
      case 1:
        -[AVVolumeButtonControl feedbackGenerator](self, "feedbackGenerator");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "prepare");

        return;
      case 2:
        v7 = 0x400000;
        goto LABEL_8;
      case 3:
        v7 = 0x800000;
LABEL_8:
        -[AVVolumeButtonControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", v7);
        break;
      case 4:
        -[AVVolumeButtonControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
LABEL_10:
        -[AVVolumeButtonControl setShowsHighlightedAppearance:](self, "setShowsHighlightedAppearance:", 0);
        break;
      default:
        return;
    }
  }
}

- (void)setNeedsUpdateGlyphRenderingMode
{
  id v3;

  -[AVVolumeButtonControl micaPackage](self, "micaPackage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVVolumeButtonControl _updateMicaPackage:](self, "_updateMicaPackage:", v3);

}

- (id)imageNameForMicaPackageState
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  if (imageNameForMicaPackageState_onceToken != -1)
    dispatch_once(&imageNameForMicaPackageState_onceToken, &__block_literal_global_19466);
  v3 = (void *)imageNameForMicaPackageState_imageNamesForStates;
  -[AVVolumeButtonControl micaPackageStateName](self, "micaPackageStateName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("half");
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)avkit_shouldPreventExternalGestureRecognizerAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[AVVolumeButtonControl hitRect](self, "hitRect");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AVVolumeButtonControl;
  v8 = -[AVVolumeButtonControl beginTrackingWithTouch:withEvent:](&v19, sel_beginTrackingWithTouch_withEvent_, v6, v7);
  if (v8)
  {
    if (-[AVVolumeButtonControl isLongPressEnabled](self, "isLongPressEnabled"))
    {
      objc_initWeak(&location, self);
      v9 = (void *)MEMORY[0x1E0C99E88];
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __58__AVVolumeButtonControl_beginTrackingWithTouch_withEvent___block_invoke;
      v16 = &unk_1E5BB49A8;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v13, 0.5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVVolumeButtonControl setLongPressTimer:](self, "setLongPressTimer:", v10, v13, v14, v15, v16);
      -[AVVolumeButtonControl longPressTimer](self, "longPressTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTolerance:", 0.05);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    -[AVVolumeButtonControl setTrackingState:](self, "setTrackingState:", 1);
    objc_msgSend(v6, "preciseLocationInView:", self);
    -[AVVolumeButtonControl setInitialPreciseLocationOfTouch:](self, "setInitialPreciseLocationOfTouch:");
  }

  return v8;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  _BOOL4 v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t v23;
  double v24;
  double v25;
  double v26;
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
  void *v37;
  objc_super v39;
  CGPoint v40;
  CGRect v41;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AVVolumeButtonControl;
  v7 = -[AVVolumeButtonControl continueTrackingWithTouch:withEvent:](&v39, sel_continueTrackingWithTouch_withEvent_, v6, a4);
  if (v7)
  {
    if (-[AVVolumeButtonControl trackingState](self, "trackingState") == 1)
    {
      if (-[AVVolumeButtonControl isLongPressEnabled](self, "isLongPressEnabled")
        && (objc_msgSend(v6, "force"), v8 > 3.0))
      {
        -[AVVolumeButtonControl setTrackingState:](self, "setTrackingState:", 3);
      }
      else
      {
        -[AVVolumeButtonControl hitRect](self, "hitRect");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        objc_msgSend(v6, "locationInView:", self);
        v40.x = v17;
        v40.y = v18;
        v41.origin.x = v10;
        v41.origin.y = v12;
        v41.size.width = v14;
        v41.size.height = v16;
        -[AVVolumeButtonControl setShowsHighlightedAppearance:](self, "setShowsHighlightedAppearance:", CGRectContainsPoint(v41, v40));
      }
    }
    objc_msgSend(v6, "preciseLocationInView:", self);
    v20 = v19;
    -[AVVolumeButtonControl initialPreciseLocationOfTouch](self, "initialPreciseLocationOfTouch");
    v22 = v20 - v21;
    if (v22 < 0.0)
      v22 = -v22;
    if (v22 > 15.0 || -[AVVolumeButtonControl trackingState](self, "trackingState") == 4)
    {
      v23 = -[AVVolumeButtonControl trackingState](self, "trackingState");
      if (v23 == 4)
      {
        objc_msgSend(v6, "preciseLocationInView:", self);
        v25 = v24;
        v27 = v26;
        objc_msgSend(v6, "precisePreviousLocationInView:", self);
        -[AVVolumeButtonControl setTranslationOfPanFromPreviousTouch:](self, "setTranslationOfPanFromPreviousTouch:", v25 - v28, v27 - v29);
        -[AVVolumeButtonControl cumulativeTranslationSincePanningBegan](self, "cumulativeTranslationSincePanningBegan");
        v31 = v30;
        v33 = v32;
        -[AVVolumeButtonControl translationOfPanFromPreviousTouch](self, "translationOfPanFromPreviousTouch");
        if (v34 >= 0.0)
          v35 = v34;
        else
          v35 = -v34;
        -[AVVolumeButtonControl translationOfPanFromPreviousTouch](self, "translationOfPanFromPreviousTouch");
        if (v36 < 0.0)
          v36 = -v36;
        -[AVVolumeButtonControl setCumulativeTranslationSincePanningBegan:](self, "setCumulativeTranslationSincePanningBegan:", v31 + v35, v33 + v36);
        -[AVVolumeButtonControl window](self, "window");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "preciseLocationInView:", v37);
        -[AVVolumeButtonControl setLocationOfTouchInWindow:](self, "setLocationOfTouchInWindow:");

        -[AVVolumeButtonControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000000);
      }
      else if (v23 == 3 || v23 == 1)
      {
        -[AVVolumeButtonControl setTrackingState:](self, "setTrackingState:", 4);
      }
    }
  }

  return v7;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)AVVolumeButtonControl;
  -[AVVolumeButtonControl endTrackingWithTouch:withEvent:](&v9, sel_endTrackingWithTouch_withEvent_, v6, v7);
  -[AVVolumeButtonControl longPressTimer](self, "longPressTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  if (-[AVVolumeButtonControl trackingState](self, "trackingState") == 1)
  {
    objc_msgSend(v6, "locationInView:", self);
    if (-[AVVolumeButtonControl pointInside:withEvent:](self, "pointInside:withEvent:", v7))
      -[AVVolumeButtonControl setTrackingState:](self, "setTrackingState:", 2);
  }
  -[AVVolumeButtonControl setTrackingState:](self, "setTrackingState:", 0);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVVolumeButtonControl;
  -[AVVolumeButtonControl cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, a3);
  -[AVVolumeButtonControl longPressTimer](self, "longPressTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[AVVolumeButtonControl setTrackingState:](self, "setTrackingState:", 0);
}

- (id)accessibilityLabel
{
  return AVLocalizedString(CFSTR("Mute"));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isDescendantOfView:", self);

  return (char)self;
}

- (void)setBounds:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVVolumeButtonControl;
  -[AVVolumeButtonControl setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[AVVolumeButtonControl micaPackage](self, "micaPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVVolumeButtonControl _updateMicaPackage:](self, "_updateMicaPackage:", v4);

}

- (CGRect)hitRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  v26.receiver = self;
  v26.super_class = (Class)AVVolumeButtonControl;
  -[AVVolumeButtonControl hitRect](&v26, sel_hitRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVVolumeButtonControl hitRectInsets](self, "hitRectInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[AVVolumeButtonControl effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v19 == 1)
    v20 = v18;
  else
    v20 = v14;
  if (v19 == 1)
    v21 = v14;
  else
    v21 = v18;
  v22 = v4 + v20;
  v23 = v6 + v12;
  v24 = v8 - (v20 + v21);
  v25 = v10 - (v12 + v16);
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[AVVolumeButtonControl hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (NSDirectionalEdgeInsets)hitRectInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_hitRectInsets.top;
  leading = self->_hitRectInsets.leading;
  bottom = self->_hitRectInsets.bottom;
  trailing = self->_hitRectInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (CGPoint)translationOfPanFromPreviousTouch
{
  double x;
  double y;
  CGPoint result;

  x = self->_translationOfPanFromPreviousTouch.x;
  y = self->_translationOfPanFromPreviousTouch.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslationOfPanFromPreviousTouch:(CGPoint)a3
{
  self->_translationOfPanFromPreviousTouch = a3;
}

- (CGPoint)cumulativeTranslationSincePanningBegan
{
  double x;
  double y;
  CGPoint result;

  x = self->_cumulativeTranslationSincePanningBegan.x;
  y = self->_cumulativeTranslationSincePanningBegan.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCumulativeTranslationSincePanningBegan:(CGPoint)a3
{
  self->_cumulativeTranslationSincePanningBegan = a3;
}

- (CGPoint)locationOfTouchInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationOfTouchInWindow.x;
  y = self->_locationOfTouchInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationOfTouchInWindow:(CGPoint)a3
{
  self->_locationOfTouchInWindow = a3;
}

- (UIViewPropertyAnimator)highlightAnimator
{
  return (UIViewPropertyAnimator *)objc_loadWeakRetained((id *)&self->_highlightAnimator);
}

- (void)setHighlightAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_highlightAnimator, a3);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void)setMicaPackageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_micaPackageContainerView, a3);
}

- (CGPoint)initialPreciseLocationOfTouch
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialPreciseLocationOfTouch.x;
  y = self->_initialPreciseLocationOfTouch.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialPreciseLocationOfTouch:(CGPoint)a3
{
  self->_initialPreciseLocationOfTouch = a3;
}

- (NSTimer)longPressTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_longPressTimer);
}

- (void)setLongPressTimer:(id)a3
{
  objc_storeWeak((id *)&self->_longPressTimer, a3);
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (BOOL)showsHighlightedAppearance
{
  return self->_showsHighlightedAppearance;
}

- (int64_t)volumeControllerType
{
  return self->_volumeControllerType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_longPressTimer);
  objc_storeStrong((id *)&self->_micaPackageContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_micaPackage, 0);
  objc_destroyWeak((id *)&self->_highlightAnimator);
  objc_storeStrong((id *)&self->_micaPackageStateName, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

void __44__AVVolumeButtonControl__updateMicaPackage___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v25 = a2;
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "imageNameForMicaPackageState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "micaPackage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperlayer");

    v9 = objc_loadWeakRetained(v3);
    objc_msgSend(v9, "avkit_makeSubtreeDisallowGroupBlending");

    v10 = objc_loadWeakRetained(v3);
    objc_msgSend(v10, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

    v13 = objc_loadWeakRetained(v3);
    objc_msgSend(v13, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    v16 = objc_loadWeakRetained(v3);
    objc_msgSend(v16, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v25);

    v18 = objc_loadWeakRetained(v3);
    objc_msgSend(v18, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v3);
    objc_msgSend(v20, "bounds");
    objc_msgSend(v19, "setFrame:");

    v21 = objc_loadWeakRetained(v3);
    objc_msgSend(v21, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentMode:", 4);

    v23 = objc_loadWeakRetained(v3);
    objc_msgSend(v23, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

void __58__AVVolumeButtonControl_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "trackingState");

  if (v3 == 1)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "setTrackingState:", 3);

  }
}

void __53__AVVolumeButtonControl_imageNameForMicaPackageState__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("mute");
  v2[1] = CFSTR("off");
  v3[0] = CFSTR("VolumeMuted");
  v3[1] = CFSTR("VolumeZero");
  v2[2] = CFSTR("min");
  v2[3] = CFSTR("half");
  v3[2] = CFSTR("VolumeLow");
  v3[3] = CFSTR("VolumeMedium");
  v2[4] = CFSTR("full");
  v3[4] = CFSTR("VolumeHigh");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)imageNameForMicaPackageState_imageNamesForStates;
  imageNameForMicaPackageState_imageNamesForStates = v0;

}

void __55__AVVolumeButtonControl_setShowsHighlightedAppearance___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  memset(&v5, 0, sizeof(v5));
  if (objc_msgSend(*(id *)(a1 + 32), "showsHighlightedAppearance"))
  {
    CGAffineTransformMakeScale(&v5, 0.75, 0.75);
  }
  else
  {
    v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v5.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v5.c = v2;
    *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  objc_msgSend(*(id *)(a1 + 32), "micaPackageContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

@end
