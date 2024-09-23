@implementation AVPlaybackControlsRoutePickerView

- (void)setIncluded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIncluded");

  if (v6 != v3)
  {
    -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIncluded:", v3);

    -[AVPlaybackControlsRoutePickerView _updateLayoutItem](self, "_updateLayoutItem");
    -[AVPlaybackControlsRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
  }
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  CGAffineTransform *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;

  v3 = a3;
  self->_hasFullScreenAppearance = a3;
  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CGAffineTransformMakeTranslation(&v10, 0.0, 1.0);
    v5 = &v10;
  }
  else
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7 = *MEMORY[0x1E0C9BAA8];
    v8 = v6;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v5 = (CGAffineTransform *)&v7;
  }
  objc_msgSend(v4, "setTransform:", v5, v7, v8, v9);

}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extrinsicContentSize");
  v8 = v7;
  v10 = v9;

  if (width != v8 || height != v10)
  {
    -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExtrinsicContentSize:", width, height);

    -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateIntrinsicContentSize");

    -[AVPlaybackControlsRoutePickerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVPlaybackControlsRoutePickerView _updateLayoutItem](self, "_updateLayoutItem");
  }
}

- (void)setPrioritizesVideoDevices:(BOOL)a3
{
  const __CFString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsRoutePickerView;
  -[AVRoutePickerView setPrioritizesVideoDevices:](&v5, sel_setPrioritizesVideoDevices_, a3);
  if (-[AVRoutePickerView prioritizesVideoDevices](self, "prioritizesVideoDevices"))
    v4 = CFSTR("AVRoutePickerViewSquareAirPlayGlyph");
  else
    v4 = CFSTR("AVRoutePickerViewCircularAirPlayGlyph");
  -[AVPlaybackControlsRoutePickerView setCurrentMicaPackageName:](self, "setCurrentMicaPackageName:", v4);
}

- (AVPlaybackControlsRoutePickerView)initWithSecondGenerationButton:(BOOL)a3
{
  AVPlaybackControlsRoutePickerView *result;

  result = -[AVPlaybackControlsRoutePickerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
    result->_secondGenerationButton = a3;
  return result;
}

- (AVPlaybackControlsRoutePickerView)initWithFrame:(CGRect)a3
{
  AVPlaybackControlsRoutePickerView *v3;
  AVPlaybackControlsRoutePickerView *v4;
  AVLayoutItemAttributes *v5;
  AVLayoutItemAttributes *layoutAttributes;
  AVLayoutItemAttributes *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackControlsRoutePickerView;
  v3 = -[AVRoutePickerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_secondGenerationButton = 1;
    v5 = objc_alloc_init(AVLayoutItemAttributes);
    layoutAttributes = v4->_layoutAttributes;
    v4->_layoutAttributes = v5;

    v7 = v4->_layoutAttributes;
    -[AVPlaybackControlsRoutePickerView intrinsicContentSize](v4, "intrinsicContentSize");
    -[AVLayoutItemAttributes setMinimumSize:](v7, "setMinimumSize:");
    -[AVLayoutItemAttributes setCollapsed:](v4->_layoutAttributes, "setCollapsed:", -[AVPlaybackControlsRoutePickerView isCollapsed](v4, "isCollapsed"));
    -[AVLayoutItemAttributes setIncluded:](v4->_layoutAttributes, "setIncluded:", -[AVPlaybackControlsRoutePickerView isIncluded](v4, "isIncluded"));
    -[AVLayoutItemAttributes setHasFlexibleContentSize:](v4->_layoutAttributes, "setHasFlexibleContentSize:", 0);
    -[AVLayoutItemAttributes setAccessibilityIdentifier:](v4->_layoutAttributes, "setAccessibilityIdentifier:", CFSTR("Airplay"));
  }
  return v4;
}

void __67__AVPlaybackControlsRoutePickerView__updateCustomButtonMicaPackage__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "customButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMicaPackage:", v3);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "updateButtonAppearance");

}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVPlaybackControlsRoutePickerView layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsRoutePickerView setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (void)setCollapsed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCollapsed");

  if (v6 != v3)
  {
    -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCollapsed:", v3);

    -[AVPlaybackControlsRoutePickerView _updateLayoutItem](self, "_updateLayoutItem");
    -[AVPlaybackControlsRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
  }
}

- (void)_updateLayoutItem
{
  void *v3;
  void *v4;
  id v5;

  -[AVPlaybackControlsRoutePickerView layoutAttributes](self, "layoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsRoutePickerView intrinsicContentSize](self, "intrinsicContentSize");
  objc_msgSend(v3, "setMinimumSize:");

  -[AVPlaybackControlsRoutePickerView layoutAttributes](self, "layoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncluded:", -[AVPlaybackControlsRoutePickerView isIncluded](self, "isIncluded"));

  -[AVPlaybackControlsRoutePickerView layoutAttributes](self, "layoutAttributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollapsed:", -[AVPlaybackControlsRoutePickerView isCollapsed](self, "isCollapsed"));

}

- (BOOL)isIncluded
{
  void *v2;
  char v3;

  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isIncluded");

  return v3;
}

- (BOOL)isCollapsed
{
  void *v2;
  char v3;

  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCollapsed");

  return v3;
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
  v13.super_class = (Class)AVPlaybackControlsRoutePickerView;
  -[AVRoutePickerView intrinsicContentSize](&v13, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[AVPlaybackControlsRoutePickerView extrinsicContentSize](self, "extrinsicContentSize");
  if (v7 > 0.0)
  {
    -[AVPlaybackControlsRoutePickerView extrinsicContentSize](self, "extrinsicContentSize");
    v4 = v8;
  }
  -[AVPlaybackControlsRoutePickerView extrinsicContentSize](self, "extrinsicContentSize");
  if (v9 > 0.0)
  {
    -[AVPlaybackControlsRoutePickerView extrinsicContentSize](self, "extrinsicContentSize");
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
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)updateButtonAppearance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AVPlaybackControlsRoutePickerView;
  -[AVRoutePickerView updateButtonAppearance](&v30, sel_updateButtonAppearance);
  if (-[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.55);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "micaPackage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);
  }
  v8 = -[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive");
  v9 = CFSTR("off");
  if (v8)
    v9 = CFSTR("on");
  v10 = v9;
  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "micaPackage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v3);
  objc_msgSend(v12, "setState:color:", v10, objc_msgSend(v13, "CGColor"));

  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "micaPackage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setState:color:", v10, 0);

  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "micaPackage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackControlsRoutePickerView extrinsicContentSize](self, "extrinsicContentSize");
  objc_msgSend(v17, "setTargetSize:");

  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHasAlternateAppearance:", -[AVRoutePickerView isAirPlayActive](self, "isAirPlayActive"));

  v19 = -[AVPlaybackControlsRoutePickerView isCollapsedOrExcluded](self, "isCollapsedOrExcluded");
  if (v19 != -[AVPlaybackControlsRoutePickerView isHidden](self, "isHidden")
    || (!v19 ? (v20 = 1.0) : (v20 = 0.0), -[AVPlaybackControlsRoutePickerView alpha](self, "alpha"), v21 != v20))
  {
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    if ((v19 & 1) == 0)
    {
      -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      v24 = v23;
      v26 = v25;
      v27 = MEMORY[0x1E0C9D820];
      v28 = *MEMORY[0x1E0C9D820];

      if (v24 == v28 && v26 == *(double *)(v27 + 8))
      {
        -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "invalidateIntrinsicContentSize");

        -[AVPlaybackControlsRoutePickerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      }
    }
  }

}

- (AVButton)customButton
{
  AVButton *customButton;
  _BOOL8 secondGenerationButton;
  void *v5;
  AVButton *v6;
  AVButton *v7;
  AVButton *v8;
  AVButton *v9;
  AVButton *v10;
  void *v11;

  customButton = self->_customButton;
  if (!customButton)
  {
    secondGenerationButton = self->_secondGenerationButton;
    -[AVPlaybackControlsRoutePickerView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    +[AVButton buttonWithAccessibilityIdentifier:isSecondGeneration:](AVButton, "buttonWithAccessibilityIdentifier:isSecondGeneration:", CFSTR("AirPlay"), secondGenerationButton);
    v6 = (AVButton *)objc_claimAutoreleasedReturnValue();
    v7 = self->_customButton;
    self->_customButton = v6;
    v8 = v6;

    -[AVButton setIncluded:](self->_customButton, "setIncluded:", -[AVPlaybackControlsRoutePickerView isIncluded](self, "isIncluded"));
    -[AVButton setCollapsed:](self->_customButton, "setCollapsed:", -[AVPlaybackControlsRoutePickerView isCollapsed](self, "isCollapsed"));
    v9 = self->_customButton;
    -[AVPlaybackControlsRoutePickerView extrinsicContentSize](self, "extrinsicContentSize");
    -[AVButton setExtrinsicContentSize:](v9, "setExtrinsicContentSize:");
    v10 = self->_customButton;
    -[AVPlaybackControlsRoutePickerView bounds](self, "bounds");
    -[AVButton setFrame:](v10, "setFrame:");
    -[AVPlaybackControlsRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
    -[AVPlaybackControlsRoutePickerView currentMicaPackageName](self, "currentMicaPackageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackControlsRoutePickerView setCurrentMicaPackageName:](self, "setCurrentMicaPackageName:", v11);

    -[AVButton setImageName:](v8, "setImageName:", CFSTR("AVMobileImageNameNoImage"));
    -[AVButton setAlternateImageName:](v8, "setAlternateImageName:", CFSTR("AVMobileImageNameNoImage"));
    -[AVButton setMicaSnapshotAlpha:](v8, "setMicaSnapshotAlpha:", 0.55);

    customButton = self->_customButton;
  }
  return customButton;
}

- (BOOL)isCollapsedOrExcluded
{
  void *v2;
  char v3;

  -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCollapsedOrExcluded");

  return v3;
}

- (void)setCurrentMicaPackageName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AVPlaybackControlsRoutePickerView currentMicaPackageName](self, "currentMicaPackageName");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_currentMicaPackageName, a3);
    -[AVPlaybackControlsRoutePickerView _updateCustomButtonMicaPackage](self, "_updateCustomButtonMicaPackage");
    if ((__CFString *)self->_currentMicaPackageName == CFSTR("AVRoutePickerViewCircularAirPlayGlyph"))
    {
      -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImageName:", CFSTR("AVMobileImageNameNoImage"));

      -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlternateImageName:", CFSTR("AVMobileImageNameNoImage"));

    }
  }

}

- (NSString)currentMicaPackageName
{
  return self->_currentMicaPackageName;
}

- (void)_updateCustomButtonMicaPackage
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = -[AVPlaybackControlsRoutePickerView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  objc_initWeak(&location, self);
  -[AVPlaybackControlsRoutePickerView currentMicaPackageName](self, "currentMicaPackageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__AVPlaybackControlsRoutePickerView__updateCustomButtonMicaPackage__block_invoke;
  v5[3] = &unk_1E5BB3EF0;
  objc_copyWeak(&v6, &location);
  +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:](AVMicaPackage, "asynchronouslyPrepareMicaPackageWithName:layoutDirection:completion:", v4, v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setRemoved:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_removed != a3)
  {
    v3 = a3;
    self->_removed = a3;
    -[AVPlaybackControlsRoutePickerView customButton](self, "customButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoved:", v3);

    -[AVPlaybackControlsRoutePickerView updateButtonAppearance](self, "updateButtonAppearance");
  }
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  self->_hasAlternateAppearance = a3;
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMicaPackageName, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_customButton, 0);
}

@end
