@implementation CAMControlDrawer

- (CAMControlDrawer)initWithLayoutStyle:(int64_t)a3
{
  CAMControlDrawer *v4;
  CAMControlDrawer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawer;
  v4 = -[CAMControlDrawer initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
    -[CAMControlDrawer _commonInitializationWithLayoutStyle:](v4, "_commonInitializationWithLayoutStyle:", a3);
  return v5;
}

- (void)_commonInitializationWithLayoutStyle:(int64_t)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *controlMap;
  UIScrollView *v6;
  UIScrollView *scrollView;

  self->_layoutStyle = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  controlMap = self->__controlMap;
  self->__controlMap = v4;

  v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->__scrollView;
  self->__scrollView = v6;

  -[UIScrollView setShowsHorizontalScrollIndicator:](self->__scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->__scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setDecelerationRate:](self->__scrollView, "setDecelerationRate:", *MEMORY[0x1E0DC5360]);
  -[UIScrollView setDelegate:](self->__scrollView, "setDelegate:", self);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->__scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[CAMControlDrawer addSubview:](self, "addSubview:", self->__scrollView);
}

- (CAMControlDrawer)initWithFrame:(CGRect)a3
{
  CAMControlDrawer *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawer;
  v3 = -[CAMControlDrawer initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    -[CAMControlDrawer _commonInitializationWithLayoutStyle:](v3, "_commonInitializationWithLayoutStyle:", v5);
  }
  return v3;
}

- (CAMControlDrawer)initWithCoder:(id)a3
{
  CAMControlDrawer *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMControlDrawer;
  v3 = -[CAMControlDrawer initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    -[CAMControlDrawer _commonInitializationWithLayoutStyle:](v3, "_commonInitializationWithLayoutStyle:", v5);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;
  CGRect v51;

  v49 = *MEMORY[0x1E0C80C00];
  -[CAMControlDrawer visibleControlTypes](self, "visibleControlTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAMControlDrawer bounds](self, "bounds");
  v51.origin.x = v13;
  v51.origin.y = v14;
  v51.size.width = v15;
  v51.size.height = v16;
  v50.origin.x = v6;
  v50.origin.y = v8;
  v50.size.width = v10;
  v50.size.height = v12;
  v17 = CGRectEqualToRect(v50, v51);

  if (!v17)
  {
    -[CAMControlDrawer bounds](self, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  }
  -[CAMControlDrawer _scrollingContentSizeForControlCount:](self, "_scrollingContentSizeForControlCount:", objc_msgSend(v3, "count"));
  v28 = v27;
  v30 = v29;
  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "contentSize");
  v33 = v32;
  v35 = v34;

  if (v33 != v28 || v35 != v30)
  {
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContentSize:", v28, v30);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v37 = v3;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v45;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v45 != v40)
          objc_enumerationMutation(v37);
        -[CAMControlDrawer _layoutVisibleControlForType:visibleControlTypes:](self, "_layoutVisibleControlForType:visibleControlTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v41++), "integerValue", (_QWORD)v44), v37);
      }
      while (v39 != v41);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v39);
  }

  -[CAMControlDrawer expandedControl](self, "expandedControl");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[CAMControlDrawer expandedControl](self, "expandedControl");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawer _updateExpansionInsetsForExpandableButton:](self, "_updateExpansionInsetsForExpandableButton:", v43);

  }
  -[CAMControlDrawer _layoutFilterScrubberView](self, "_layoutFilterScrubberView", (_QWORD)v44);
  -[CAMControlDrawer _layoutApertureSlider](self, "_layoutApertureSlider");
  -[CAMControlDrawer _layoutIntensitySlider](self, "_layoutIntensitySlider");
  -[CAMControlDrawer _layoutExposureSlider](self, "_layoutExposureSlider");
  -[CAMControlDrawer _layoutLowLightSlider](self, "_layoutLowLightSlider");
  -[CAMControlDrawer _layoutSemanticStyleControl](self, "_layoutSemanticStyleControl");
  -[CAMControlDrawer _updateControlsScaleAnimated:](self, "_updateControlsScaleAnimated:", 0);
  -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);

}

- (id)_createControlForType:(int64_t)a3
{
  void *v4;

  if ((unint64_t)a3 > 0xF)
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(*off_1EA329380[a3]), "initWithLayoutStyle:", -[CAMControlDrawer layoutStyle](self, "layoutStyle"));
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__handleControlValueChanged_, 4096);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__handleControlReleased_, 64);
  objc_msgSend(v4, "setAlpha:", 0.0);
  return v4;
}

- (id)buttonForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CAMDrawerFlashButton)flashButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3AFFC8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerFlashButton *)v3;
}

- (CAMDrawerLivePhotoButton)livePhotoButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3AFFE0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerLivePhotoButton *)v3;
}

- (CAMDrawerAspectRatioButton)aspectRatioButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3AFFF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerAspectRatioButton *)v3;
}

- (CAMDrawerTimerButton)timerButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0010);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerTimerButton *)v3;
}

- (CAMDrawerFilterButton)filterButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0028);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerFilterButton *)v3;
}

- (CAMDrawerApertureButton)apertureButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0040);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerApertureButton *)v3;
}

- (CAMDrawerIntensityButton)intensityButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0058);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerIntensityButton *)v3;
}

- (CAMDrawerExposureButton)exposureButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0070);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerExposureButton *)v3;
}

- (CAMDrawerHDRButton)hdrButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0088);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerHDRButton *)v3;
}

- (CAMDrawerLowLightButton)lowLightButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B00A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerLowLightButton *)v3;
}

- (CAMDrawerSemanticStyleButton)semanticStyleButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B00B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerSemanticStyleButton *)v3;
}

- (CAMDrawerSmartStyleButton)smartStyleButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B00D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerSmartStyleButton *)v3;
}

- (CAMDrawerRAWButton)rawButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B00E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerRAWButton *)v3;
}

- (CAMDrawerProResButton)proResButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerProResButton *)v3;
}

- (CAMDrawerSharedLibraryButton)sharedLibraryButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0118);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerSharedLibraryButton *)v3;
}

- (CAMDrawerVideoStabilizationButton)videoStabilizationButton
{
  void *v2;
  void *v3;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA3B0130);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAMDrawerVideoStabilizationButton *)v3;
}

- (void)_handleControlValueChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "controlType");
  -[CAMControlDrawer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlDrawer:didChangeValueForControlType:", self, v4);

  switch(v4)
  {
    case 0:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer flashButton](self, "flashButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeFlashMode:", self, objc_msgSend(v6, "flashMode"));
      goto LABEL_11;
    case 1:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer livePhotoButton](self, "livePhotoButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeLivePhotoMode:", self, objc_msgSend(v6, "livePhotoMode"));
      goto LABEL_11;
    case 2:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer aspectRatioButton](self, "aspectRatioButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeAspectRatio:", self, objc_msgSend(v6, "aspectRatio"));
      goto LABEL_11;
    case 3:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer timerButton](self, "timerButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeTimerDuration:", self, objc_msgSend(v6, "timerDuration"));
      goto LABEL_11;
    case 5:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer hdrButton](self, "hdrButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeHDRMode:", self, objc_msgSend(v6, "hdrMode"));
      goto LABEL_11;
    case 12:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer rawButton](self, "rawButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeRAWMode:", self, objc_msgSend(v6, "rawMode"));
      goto LABEL_11;
    case 13:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer proResButton](self, "proResButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeProResVideoMode:", self, objc_msgSend(v6, "proResVideoMode"));
      goto LABEL_11;
    case 14:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer sharedLibraryButton](self, "sharedLibraryButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeSharedLibraryMode:", self, objc_msgSend(v6, "sharedLibraryMode"));
      goto LABEL_11;
    case 15:
      -[CAMControlDrawer delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CAMControlDrawer videoStabilizationButton](self, "videoStabilizationButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controlDrawer:didChangeVideoStabilizationMode:", self, objc_msgSend(v6, "videoStabilizationMode"));
LABEL_11:

      break;
    default:
      return;
  }
}

- (void)_handleControlReleased:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = objc_msgSend(a3, "controlType");
  -[CAMControlDrawer _loadCustomUIIfNeededForControlType:](self, "_loadCustomUIIfNeededForControlType:", v4);
  if (v4 == 4)
  {
    -[CAMControlDrawer delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawer filterButton](self, "filterButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controlDrawer:wantsFilterScrubberVisible:", self, objc_msgSend(v7, "isExpanded") ^ 1);

    goto LABEL_7;
  }
  if (!v4)
  {
    -[CAMControlDrawer flashButton](self, "flashButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFlashUnavailable");

    if (v6)
    {
      -[CAMControlDrawer delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "controlDrawerFlashButtonUnavailable:", self);
LABEL_7:

    }
  }
}

- (void)_loadCustomUIIfNeededForControlType:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      -[CAMControlDrawer _loadFilterScrubberIfNeeded](self, "_loadFilterScrubberIfNeeded");
      break;
    case 6:
      -[CAMControlDrawer _loadApertureSliderIfNeeded](self, "_loadApertureSliderIfNeeded");
      break;
    case 7:
      -[CAMControlDrawer _loadIntensitySliderIfNeeded](self, "_loadIntensitySliderIfNeeded");
      break;
    case 8:
      -[CAMControlDrawer _loadExposureSliderIfNeeded](self, "_loadExposureSliderIfNeeded");
      break;
    case 9:
      -[CAMControlDrawer _loadLowLightSliderIfNeeded](self, "_loadLowLightSliderIfNeeded");
      break;
    case 10:
      -[CAMControlDrawer _loadSemanticStyleControlIfNeeded](self, "_loadSemanticStyleControlIfNeeded");
      break;
    default:
      return;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_scrubberGradientEdgeInsets
{
  double v2;
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  +[CAMControlDrawerButton buttonSize](CAMControlDrawerButton, "buttonSize");
  v3 = v2 * 0.5 + 44.0 + 5.0;
  v4 = 20.0;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)_loadFilterScrubberIfNeeded
{
  id v3;
  CEKWheelScrubberView *v4;
  CEKWheelScrubberView *filterScrubberView;
  void *v6;
  void *v7;

  if (!self->_filterScrubberView)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0D0B0]);
    v4 = (CEKWheelScrubberView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    filterScrubberView = self->_filterScrubberView;
    self->_filterScrubberView = v4;

    -[CEKWheelScrubberView setCornerStyle:](self->_filterScrubberView, "setCornerStyle:", 1);
    -[CEKWheelScrubberView setTransparentGradients](self->_filterScrubberView, "setTransparentGradients");
    -[CAMControlDrawer _scrubberGradientEdgeInsets](self, "_scrubberGradientEdgeInsets");
    -[CEKWheelScrubberView setGradientInsets:](self->_filterScrubberView, "setGradientInsets:");
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:atIndex:", self->_filterScrubberView, 0);

    -[CEKWheelScrubberView addTarget:action:forControlEvents:](self->_filterScrubberView, "addTarget:action:forControlEvents:", self, sel__filterScrubberDidChangeValue, 4096);
    -[CAMControlDrawer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "controlDrawerDidCreateFilterScrubber:", self);

    -[CAMControlDrawer _layoutFilterScrubberView](self, "_layoutFilterScrubberView");
    -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);
  }
}

- (void)_filterScrubberDidChangeValue
{
  id v3;

  -[CAMControlDrawer delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDrawer:didChangeValueForControlType:", self, 4);

}

- (void)_loadApertureSliderIfNeeded
{
  CEKApertureSlider *v3;
  CEKApertureSlider *apertureSlider;
  void *v5;
  id v6;

  if (!self->_apertureSlider)
  {
    v3 = (CEKApertureSlider *)objc_alloc_init(MEMORY[0x1E0D0D018]);
    apertureSlider = self->_apertureSlider;
    self->_apertureSlider = v3;

    -[CAMControlDrawer _scrubberGradientEdgeInsets](self, "_scrubberGradientEdgeInsets");
    -[CEKApertureSlider setGradientInsets:](self->_apertureSlider, "setGradientInsets:");
    -[CEKApertureSlider setTitleAlignment:](self->_apertureSlider, "setTitleAlignment:", 2);
    -[CEKApertureSlider setFontStyle:](self->_apertureSlider, "setFontStyle:", -[CAMControlDrawer _sliderFontStyle](self, "_sliderFontStyle"));
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", self->_apertureSlider, 0);

    -[CAMControlDrawer _layoutApertureSlider](self, "_layoutApertureSlider");
    -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);
    -[CEKApertureSlider addTarget:action:forControlEvents:](self->_apertureSlider, "addTarget:action:forControlEvents:", self, sel__apertureSliderDidChangeValue, 4096);
    -[CAMControlDrawer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlDrawerDidCreateApertureSlider:", self);

  }
}

- (void)_apertureSliderDidChangeValue
{
  id v3;

  -[CAMControlDrawer delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDrawer:didChangeValueForControlType:", self, 6);

}

- (void)_loadIntensitySliderIfNeeded
{
  CEKSlider *v3;
  CEKSlider *intensitySlider;
  CEKSlider *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!self->_intensitySlider)
  {
    CAMLocalizedFrameworkString(CFSTR("PORTRAIT_INTENSITY_SLIDER_TITLE"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (CEKSlider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D090]), "initWithTitle:", v9);
    intensitySlider = self->_intensitySlider;
    self->_intensitySlider = v3;

    -[CAMControlDrawer _scrubberGradientEdgeInsets](self, "_scrubberGradientEdgeInsets");
    -[CEKSlider setGradientInsets:](self->_intensitySlider, "setGradientInsets:");
    -[CEKSlider setSliderVerticalAlignment:](self->_intensitySlider, "setSliderVerticalAlignment:", 2);
    -[CEKSlider setValueLabelVisibility:](self->_intensitySlider, "setValueLabelVisibility:", 2);
    -[CEKSlider setTitleAlignment:](self->_intensitySlider, "setTitleAlignment:", 2);
    -[CEKSlider setFontStyle:](self->_intensitySlider, "setFontStyle:", -[CAMControlDrawer _sliderFontStyle](self, "_sliderFontStyle"));
    v5 = self->_intensitySlider;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKSlider setOpaqueGradientsWithColor:](v5, "setOpaqueGradientsWithColor:", v6);

    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", self->_intensitySlider, 0);

    -[CAMControlDrawer _layoutIntensitySlider](self, "_layoutIntensitySlider");
    -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);
    -[CEKSlider addTarget:action:forControlEvents:](self->_intensitySlider, "addTarget:action:forControlEvents:", self, sel__intensitySliderDidChangeValue, 4096);
    -[CAMControlDrawer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controlDrawerDidCreateIntensitySlider:", self);

  }
}

- (void)_intensitySliderDidChangeValue
{
  id v3;

  -[CAMControlDrawer delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDrawer:didChangeValueForControlType:", self, 7);

}

- (void)_loadLowLightSliderIfNeeded
{
  CAMLowLightSlider *v3;
  CAMLowLightSlider *lowLightSlider;
  void *v5;
  id v6;

  if (!self->_lowLightSlider)
  {
    v3 = objc_alloc_init(CAMLowLightSlider);
    lowLightSlider = self->_lowLightSlider;
    self->_lowLightSlider = v3;

    -[CAMControlDrawer _scrubberGradientEdgeInsets](self, "_scrubberGradientEdgeInsets");
    -[CEKDiscreteSlider setGradientInsets:](self->_lowLightSlider, "setGradientInsets:");
    -[CEKDiscreteSlider setTitleAlignment:](self->_lowLightSlider, "setTitleAlignment:", 2);
    -[CEKDiscreteSlider setFontStyle:](self->_lowLightSlider, "setFontStyle:", -[CAMControlDrawer _sliderFontStyle](self, "_sliderFontStyle"));
    -[CEKDiscreteSlider setTransparentGradients](self->_lowLightSlider, "setTransparentGradients");
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", self->_lowLightSlider, 0);

    -[CAMControlDrawer _layoutLowLightSlider](self, "_layoutLowLightSlider");
    -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);
    -[CAMLowLightSlider addTarget:action:forControlEvents:](self->_lowLightSlider, "addTarget:action:forControlEvents:", self, sel__lowLightSliderDidChangeValue, 4096);
    -[CAMControlDrawer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlDrawerDidCreateLowLightSlider:", self);

  }
}

- (void)_lowLightSliderDidChangeValue
{
  id v3;

  -[CAMControlDrawer delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDrawer:didChangeValueForControlType:", self, 9);

}

- (void)_loadExposureSliderIfNeeded
{
  CAMExposureSlider *v3;
  CAMExposureSlider *exposureSlider;
  void *v5;
  id v6;

  if (!self->_exposureSlider)
  {
    v3 = objc_alloc_init(CAMExposureSlider);
    exposureSlider = self->_exposureSlider;
    self->_exposureSlider = v3;

    -[CAMControlDrawer _scrubberGradientEdgeInsets](self, "_scrubberGradientEdgeInsets");
    -[CEKDiscreteSlider setGradientInsets:](self->_exposureSlider, "setGradientInsets:");
    -[CEKDiscreteSlider setTitleAlignment:](self->_exposureSlider, "setTitleAlignment:", 2);
    -[CEKDiscreteSlider setFontStyle:](self->_exposureSlider, "setFontStyle:", -[CAMControlDrawer _sliderFontStyle](self, "_sliderFontStyle"));
    -[CEKDiscreteSlider setTransparentGradients](self->_exposureSlider, "setTransparentGradients");
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", self->_exposureSlider, 0);

    -[CAMControlDrawer _layoutExposureSlider](self, "_layoutExposureSlider");
    -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);
    -[CAMExposureSlider addTarget:action:forControlEvents:](self->_exposureSlider, "addTarget:action:forControlEvents:", self, sel__exposureSliderDidChangeValue, 4096);
    -[CAMControlDrawer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlDrawerDidCreateExposureSlider:", self);

  }
}

- (void)_exposureSliderDidChangeValue
{
  id v3;

  -[CAMControlDrawer delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDrawer:didChangeValueForControlType:", self, 8);

}

- (void)_loadSemanticStyleControlIfNeeded
{
  CAMSemanticStyleControl *v3;
  CAMSemanticStyleControl *semanticStyleControl;
  void *v5;
  id v6;

  if (!self->_semanticStyleControl)
  {
    v3 = objc_alloc_init(CAMSemanticStyleControl);
    semanticStyleControl = self->_semanticStyleControl;
    self->_semanticStyleControl = v3;

    -[CAMControlDrawer _scrubberGradientEdgeInsets](self, "_scrubberGradientEdgeInsets");
    -[CAMSemanticStyleControl setGradientInsets:](self->_semanticStyleControl, "setGradientInsets:");
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertSubview:atIndex:", self->_semanticStyleControl, 0);

    -[CAMControlDrawer _layoutSemanticStyleControl](self, "_layoutSemanticStyleControl");
    -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", 0);
    -[CAMSemanticStyleControl addTarget:action:forControlEvents:](self->_semanticStyleControl, "addTarget:action:forControlEvents:", self, sel__semanticStyleControlDidChangeValue, 4096);
    -[CAMControlDrawer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlDrawerDidCreateSemanticStyleControl:", self);

  }
}

- (void)_semanticStyleControlDidChangeValue
{
  id v3;

  -[CAMControlDrawer delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDrawer:didChangeValueForControlType:", self, 10);

}

- (unint64_t)_sliderFontStyle
{
  void *v2;
  unint64_t v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sfCameraFontSupported");

  return v3;
}

- (unint64_t)_viewportMaximumControlCount
{
  double v2;

  -[CAMControlDrawer _viewportLength](self, "_viewportLength");
  if (v2 < 375.0)
    return 5;
  else
    return 6;
}

- (double)_viewportLength
{
  double v2;

  -[CAMControlDrawer bounds](self, "bounds");
  return v2;
}

- (double)_controlCenterSpacingForControlCount:(unint64_t)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double result;
  unint64_t v9;

  -[CAMControlDrawer _viewportLength](self, "_viewportLength");
  v6 = v5;
  v7 = -[CAMControlDrawer _viewportMaximumControlCount](self, "_viewportMaximumControlCount");
  result = 0.0;
  if (a3 >= 2)
  {
    if (v7 >= a3)
      v9 = a3;
    else
      v9 = v7;
    return (v6 + -44.0 + -44.0) / (double)(v9 - 1);
  }
  return result;
}

- (CGSize)_scrollingContentSizeForControlCount:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[CAMControlDrawer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  if (-[CAMControlDrawer _viewportMaximumControlCount](self, "_viewportMaximumControlCount") < a3)
  {
    -[CAMControlDrawer _controlCenterSpacingForControlCount:](self, "_controlCenterSpacingForControlCount:", a3);
    v6 = v9 * (double)(a3 - 1) + 88.0;
  }
  v10 = v6;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_layoutVisibleControlForType:(int64_t)a3 visibleControlTypes:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "indexOfObject:", v6);

  -[CAMControlDrawer expandedControl](self, "expandedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "controlType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "indexOfObject:", v9);

  }
  -[CAMControlDrawer bounds](self, "bounds");
  v10 = objc_msgSend(v27, "count");
  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    +[CAMControlDrawerButton buttonSize](CAMControlDrawerButton, "buttonSize");
  else
    -[CAMControlDrawer _controlCenterSpacingForControlCount:](self, "_controlCenterSpacingForControlCount:", v10);
  objc_msgSend(v13, "intrinsicContentSize");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v13, "frameForAlignmentRect:");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (v8)
  {
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMControlDrawer convertRect:toView:](self, "convertRect:toView:", v22, v15, v17, v19, v21);
    v15 = v23;
    v17 = v24;
    v19 = v25;
    v21 = v26;

  }
  CAMViewSetBoundsAndCenterForFrame(v13, v15, v17, v19, v21);

}

- (void)_updateExpansionInsetsForExpandableButton:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double MinX;
  double v30;
  double MaxX;
  CGFloat v32;
  double v33;
  double v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35 = a3;
  objc_msgSend(v35, "frame");
  objc_msgSend(v35, "alignmentRectForFrame:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v32 = v10;
  -[CAMControlDrawer _viewportLength](self, "_viewportLength");
  UIRectIntegralWithScale();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer convertRect:toView:](self, "convertRect:toView:", v19, v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v33 = *MEMORY[0x1E0DC49E8];
  v34 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v36.origin.x = v5;
  v28 = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v32;
  MinX = CGRectGetMinX(v36);
  v37.origin.x = v21;
  v37.origin.y = v23;
  v37.size.width = v25;
  v37.size.height = v27;
  v30 = MinX - CGRectGetMinX(v37);
  v38.origin.x = v21;
  v38.origin.y = v23;
  v38.size.width = v25;
  v38.size.height = v27;
  MaxX = CGRectGetMaxX(v38);
  v39.origin.x = v28;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v32;
  objc_msgSend(v35, "setExpansionInsets:", v33, v30, v34, MaxX - CGRectGetMaxX(v39));

}

- (void)_layoutFullWidthCustomView:(id)a3 forAssociatedControl:(id)a4 expanded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CGRect v10;
  CGRect v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[CAMControlDrawer bounds](self, "bounds");
  v11 = CGRectInset(v10, 0.0, 2.0);
  -[CAMControlDrawer _layoutFullWidthCustomView:withAlignmentRect:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:withAlignmentRect:forAssociatedControl:expanded:", v9, v8, v5, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);

}

- (void)_layoutFullWidthCustomView:(id)a3 withAlignmentRect:(CGRect)a4 forAssociatedControl:(id)a5 expanded:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  CGRect v39;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v38 = a3;
  if (!a6)
  {
    v13 = a5;
    objc_msgSend(v13, "center");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v13, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMControlDrawer convertPoint:fromView:](self, "convertPoint:fromView:", v18, v15, v17);
    v20 = v19;

    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    x = v20 - CGRectGetMidX(v39);
  }
  objc_msgSend(v38, "frameForAlignmentRect:", x, y, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v38, "superview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer convertRect:toView:](self, "convertRect:toView:", v29, v22, v24, v26, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);
}

- (void)_layoutApertureSlider
{
  void *v3;
  id v4;

  -[CAMControlDrawer apertureSlider](self, "apertureSlider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer apertureButton](self, "apertureButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _layoutFullWidthCustomView:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:forAssociatedControl:expanded:", v4, v3, -[CAMControlDrawer isApertureSliderExpanded](self, "isApertureSliderExpanded"));

}

- (void)_layoutIntensitySlider
{
  void *v3;
  id v4;

  -[CAMControlDrawer intensitySlider](self, "intensitySlider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer intensityButton](self, "intensityButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _layoutFullWidthCustomView:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:forAssociatedControl:expanded:", v4, v3, -[CAMControlDrawer isIntensitySliderExpanded](self, "isIntensitySliderExpanded"));

}

- (void)_layoutExposureSlider
{
  void *v3;
  id v4;

  -[CAMControlDrawer exposureSlider](self, "exposureSlider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer exposureButton](self, "exposureButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _layoutFullWidthCustomView:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:forAssociatedControl:expanded:", v4, v3, -[CAMControlDrawer isExposureSliderExpanded](self, "isExposureSliderExpanded"));

}

- (void)_layoutLowLightSlider
{
  void *v3;
  id v4;

  -[CAMControlDrawer lowLightSlider](self, "lowLightSlider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer lowLightButton](self, "lowLightButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _layoutFullWidthCustomView:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:forAssociatedControl:expanded:", v4, v3, -[CAMControlDrawer isLowLightSliderExpanded](self, "isLowLightSliderExpanded"));

}

- (void)_layoutSemanticStyleControl
{
  void *v3;
  id v4;

  -[CAMControlDrawer semanticStyleControl](self, "semanticStyleControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer semanticStyleButton](self, "semanticStyleButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _layoutFullWidthCustomView:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:forAssociatedControl:expanded:", v4, v3, -[CAMControlDrawer isSemanticStyleControlExpanded](self, "isSemanticStyleControlExpanded"));

}

- (void)_layoutFilterScrubberView
{
  void *v3;
  id v4;

  -[CAMControlDrawer filterScrubberView](self, "filterScrubberView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer filterButton](self, "filterButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _layoutScrubberView:forAssociatedControl:expanded:](self, "_layoutScrubberView:forAssociatedControl:expanded:", v4, v3, -[CAMControlDrawer isFilterScrubberExpanded](self, "isFilterScrubberExpanded"));

}

- (void)_layoutScrubberView:(id)a3 forAssociatedControl:(id)a4 expanded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  if (a3)
  {
    v5 = a5;
    v8 = a4;
    v9 = a3;
    objc_msgSend(v9, "thumbnailSize");
    -[CAMControlDrawer bounds](self, "bounds");
    UIRectCenteredYInRectScale();
    -[CAMControlDrawer _layoutFullWidthCustomView:withAlignmentRect:forAssociatedControl:expanded:](self, "_layoutFullWidthCustomView:withAlignmentRect:forAssociatedControl:expanded:", v9, v8, v5, 0);

    objc_msgSend(v9, "selectedThumbnailBorderWidth");
    UIFloorToViewScale();
    objc_msgSend(v9, "setSelectionDotCenterTopSpacing:");

  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CAMControlDrawer _controlMap](self, "_controlMap", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setLayoutStyle:", a3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setVisibleControlTypes:(id)a3
{
  -[CAMControlDrawer setVisibleControlTypes:animated:](self, "setVisibleControlTypes:animated:", a3, 0);
}

- (void)setVisibleControlTypes:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v7;
  NSArray *v8;
  CAMControlDrawer *v9;
  NSArray *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSArray *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  NSArray *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  NSArray *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = (NSArray *)a3;
  v8 = v7;
  if (self->_visibleControlTypes != v7)
  {
    v9 = self;
    if (!-[NSArray isEqualToArray:](v7, "isEqualToArray:"))
    {
      v10 = self->_visibleControlTypes;
      objc_storeStrong((id *)&self->_visibleControlTypes, a3);
      -[CAMControlDrawer _ensureVisibleControls](self, "_ensureVisibleControls");
      -[CAMControlDrawer expandedControl](self, "expandedControl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "controlType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSArray containsObject:](v8, "containsObject:", v13);

        if (!v14)
          -[CAMControlDrawer _setExpandedControl:animated:updatePreferredDrawerControl:](v9, "_setExpandedControl:animated:updatePreferredDrawerControl:", 0, v4, 0);
      }
      if (v4)
      {
        v26 = v10;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v8;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "minusSet:", v15);
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v33 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v24 = objc_msgSend(v23, "integerValue");
              v25 = (void *)MEMORY[0x1E0DC3F10];
              v28[0] = MEMORY[0x1E0C809B0];
              v28[1] = 3221225472;
              v28[2] = __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke;
              v28[3] = &unk_1EA3292E8;
              v28[4] = v9;
              v31 = v24;
              v29 = v16;
              v30 = v23;
              objc_msgSend(v25, "performWithoutAnimation:", v28);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v20);
        }

        -[CAMControlDrawer setNeedsLayout](v9, "setNeedsLayout");
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke_2;
        v27[3] = &unk_1EA328868;
        v27[4] = v9;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v27, 0, 0.5, 0.0, 1.0, 1.0);
        v8 = v16;
        v10 = v26;
      }
      else
      {
        -[CAMControlDrawer setNeedsLayout](v9, "setNeedsLayout");
      }

    }
  }

}

void __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_layoutVisibleControlForType:visibleControlTypes:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_controlMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __52__CAMControlDrawer_setVisibleControlTypes_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)isFilterScrubberExpanded
{
  return -[CAMControlDrawer isControlExpandedForType:](self, "isControlExpandedForType:", 4);
}

- (BOOL)isApertureSliderExpanded
{
  return -[CAMControlDrawer isControlExpandedForType:](self, "isControlExpandedForType:", 6);
}

- (BOOL)isIntensitySliderExpanded
{
  return -[CAMControlDrawer isControlExpandedForType:](self, "isControlExpandedForType:", 7);
}

- (BOOL)isExposureSliderExpanded
{
  return -[CAMControlDrawer isControlExpandedForType:](self, "isControlExpandedForType:", 8);
}

- (BOOL)isLowLightSliderExpanded
{
  return -[CAMControlDrawer isControlExpandedForType:](self, "isControlExpandedForType:", 9);
}

- (BOOL)isSemanticStyleControlExpanded
{
  return -[CAMControlDrawer isControlExpandedForType:](self, "isControlExpandedForType:", 10);
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMControlDrawer setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CAMControlDrawer _controlMap](self, "_controlMap", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setOrientation:animated:", a3, v4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)setExpanded:(BOOL)a3 forControlType:(int64_t)a4 animated:(BOOL)a5 updatePreferredDrawerControl:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;

  v6 = a6;
  v7 = a5;
  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isExpandable") & 1) != 0)
  {
    v14 = v13;
    v15 = v14;
    if (!a3)
    {
      if (!-[CAMControlDrawer isControlExpandedForType:](self, "isControlExpandedForType:", a4))
      {
LABEL_6:

        goto LABEL_10;
      }
      v15 = 0;
    }
    -[CAMControlDrawer _setExpandedControl:animated:updatePreferredDrawerControl:](self, "_setExpandedControl:animated:updatePreferredDrawerControl:", v15, v7, v6);
    goto LABEL_6;
  }
  v16 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[CAMControlDrawer setExpanded:forControlType:animated:updatePreferredDrawerControl:].cold.1((uint64_t)v13, v16);

LABEL_10:
}

- (void)expandControlForType:(int64_t)a3 animated:(BOOL)a4 updatePreferredDrawerControl:(BOOL)a5
{
  -[CAMControlDrawer setExpanded:forControlType:animated:updatePreferredDrawerControl:](self, "setExpanded:forControlType:animated:updatePreferredDrawerControl:", 1, a3, a4, a5);
}

- (BOOL)isControlExpandedForType:(int64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;

  -[CAMControlDrawer expandedControl](self, "expandedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CAMControlDrawer expandedControl](self, "expandedControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "controlType") == a3;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)expandedControlType
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CAMControlDrawer expandedControl](self, "expandedControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMControlDrawer expandedControl](self, "expandedControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "controlType");

  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (void)collapseExpandableButtonsAnimated:(BOOL)a3 updatePreferredDrawerControl:(BOOL)a4
{
  -[CAMControlDrawer _setExpandedControl:animated:updatePreferredDrawerControl:](self, "_setExpandedControl:animated:updatePreferredDrawerControl:", 0, a3, a4);
}

- (void)_ensureVisibleControls
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CAMControlDrawer visibleControlTypes](self, "visibleControlTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "integerValue");
        -[CAMControlDrawer _loadControlIfNeededForType:](self, "_loadControlIfNeededForType:", v8);
        -[CAMControlDrawer _installControlIfNeededForType:](self, "_installControlIfNeededForType:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_loadControlIfNeededForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CAMControlDrawer _createControlForType:](self, "_createControlForType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOrientation:", -[CAMControlDrawer orientation](self, "orientation"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7);

    if (objc_msgSend(v6, "isExpandable"))
      objc_msgSend(v6, "setDelegate:", self);
    -[CAMControlDrawer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "controlDrawer:didCreateControlForType:", self, a3);

  }
}

- (void)_installControlIfNeededForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMControlDrawer _controlMap](self, "_controlMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "superview");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      objc_msgSend(v9, "addSubview:", v7);
  }

}

- (void)_updateControlsScaleAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  -[CAMControlDrawer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAMControlDrawer expandedControl](self, "expandedControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v14 = 0.5;
  else
    v14 = 0.0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__CAMControlDrawer__updateControlsScaleAnimated___block_invoke;
  v16[3] = &unk_1EA329310;
  v18 = v6;
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v16, 0, v14, 1.0, 1.0);

}

void __49__CAMControlDrawer__updateControlsScaleAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  void *v11;
  BOOL v12;
  double v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "intrinsicContentSize");
        if (v10 > *(double *)(a1 + 64)
          || ((v11 = *(void **)(a1 + 40), v11 != v8) ? (v12 = v11 == 0) : (v12 = 1),
              v12 ? (v13 = 1.0) : (v13 = 0.92),
              v9 > *(double *)(a1 + 72)))
        {
          v13 = 0.75;
        }
        CGAffineTransformMakeScale(&v15, v13, v13);
        v14 = v15;
        objc_msgSend(v8, "setTransform:", &v14);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

- (void)_updateControlsVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = a3;
  -[CAMControlDrawer expandedControl](self, "expandedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[CAMControlDrawer visibleControlTypes](self, "visibleControlTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = 3221225472;
  v12[0] = MEMORY[0x1E0C809B0];
  if (v3)
    v9 = 0.5;
  else
    v9 = 0.0;
  v12[2] = __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke;
  v12[3] = &unk_1EA329360;
  v12[4] = self;
  v13 = v8;
  v14 = v5;
  v10 = v5;
  v11 = v8;
  +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v12, 0, v9, 1.0, 1.0);

}

void __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke(id *a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  objc_msgSend(a1[4], "_controlMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke_2;
  v18 = &unk_1EA329338;
  v19 = a1[5];
  v20 = a1[6];
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v15);

  if (objc_msgSend(a1[4], "isFilterScrubberExpanded", v15, v16, v17, v18))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(a1[4], "filterScrubberView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (objc_msgSend(a1[4], "isApertureSliderExpanded"))
    v5 = 1.0;
  else
    v5 = 0.0;
  objc_msgSend(a1[4], "apertureSlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  if (objc_msgSend(a1[4], "isIntensitySliderExpanded"))
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(a1[4], "intensitySlider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  if (objc_msgSend(a1[4], "isExposureSliderExpanded"))
    v9 = 1.0;
  else
    v9 = 0.0;
  objc_msgSend(a1[4], "exposureSlider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  if (objc_msgSend(a1[4], "isLowLightSliderExpanded"))
    v11 = 1.0;
  else
    v11 = 0.0;
  objc_msgSend(a1[4], "lowLightSlider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v11);

  if (objc_msgSend(a1[4], "isSemanticStyleControlExpanded"))
    v13 = 1.0;
  else
    v13 = 0.0;
  objc_msgSend(a1[4], "semanticStyleControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v13);

}

void __54__CAMControlDrawer__updateControlsVisibilityAnimated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v9, "setAlpha:", (double)objc_msgSend(v5, "containsObject:", a2));
  v6 = *(id *)(a1 + 40);
  if (v6)
    v7 = v6 == v9;
  else
    v7 = 1;
  v8 = v7;
  objc_msgSend(v9, "setUserInteractionEnabled:", v8);

}

- (void)_setExpandedControl:(id)a3 animated:(BOOL)a4 updatePreferredDrawerControl:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  CAMControlDrawerExpandableButton *v9;
  id *p_expandedControl;
  CAMControlDrawerExpandableButton *expandedControl;
  id v12;
  CAMControlDrawerExpandableButton *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[16];

  v5 = a5;
  v6 = a4;
  v9 = (CAMControlDrawerExpandableButton *)a3;
  p_expandedControl = (id *)&self->_expandedControl;
  expandedControl = self->_expandedControl;
  if (expandedControl == v9)
    goto LABEL_23;
  if (v6)
  {
    -[CAMControlDrawer layoutIfNeeded](self, "layoutIfNeeded");
    expandedControl = (CAMControlDrawerExpandableButton *)*p_expandedControl;
  }
  if (expandedControl)
  {
    v12 = *p_expandedControl;
    *p_expandedControl = 0;
    v13 = expandedControl;

    -[CAMControlDrawerExpandableButton setExpanded:animated:](v13, "setExpanded:animated:", 0, v6);
    if (v9)
      v14 = 0;
    else
      v14 = v5;
    -[CAMControlDrawer presentationDelegate](self, "presentationDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "controlDrawer:didChangeExpanded:forControlType:animated:updatePreferredDrawerControl:", self, 0, -[CAMControlDrawerExpandableButton controlType](v13, "controlType"), v6, v14);

  }
  if (v9)
  {
    -[CAMControlDrawer _loadCustomUIIfNeededForControlType:](self, "_loadCustomUIIfNeededForControlType:", -[CAMControlDrawerExpandableButton controlType](v9, "controlType"));
    if (v6)
      -[CAMControlDrawer layoutIfNeeded](self, "layoutIfNeeded");
  }
  objc_storeStrong((id *)&self->_expandedControl, a3);
  -[CAMControlDrawer setNeedsLayout](self, "setNeedsLayout");
  if (!*p_expandedControl)
  {
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setScrollEnabled:", 1);
LABEL_18:

    goto LABEL_19;
  }
  -[CAMControlDrawer bringSubviewToFront:](self, "bringSubviewToFront:");
  objc_msgSend(*p_expandedControl, "setExpanded:animated:", 1, v6);
  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setScrollEnabled:", 0);

  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stopScrollingAndZooming");

  -[CAMControlDrawerExpandableButton frame](v9, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "_isRectFullyVisible:", v19, v21, v23, v25);

  if ((v27 & 1) == 0)
  {
    v28 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v28, OS_LOG_TYPE_DEFAULT, "Scrolling control drawer to make control visible before expansion", buf, 2u);
    }

    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "scrollRectToVisible:animated:", 0, v19, v21, v23, v25);
    goto LABEL_18;
  }
LABEL_19:
  if (v6)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __78__CAMControlDrawer__setExpandedControl_animated_updatePreferredDrawerControl___block_invoke;
    v31[3] = &unk_1EA328868;
    v31[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v31, 0, 0.5, 0.0, 1.0, 1.0);
  }
  -[CAMControlDrawer _updateControlsScaleAnimated:](self, "_updateControlsScaleAnimated:", v6);
  -[CAMControlDrawer _updateControlsVisibilityAnimated:](self, "_updateControlsVisibilityAnimated:", v6);
  if (v9)
  {
    -[CAMControlDrawer presentationDelegate](self, "presentationDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "controlDrawer:didChangeExpanded:forControlType:animated:updatePreferredDrawerControl:", self, 1, objc_msgSend(*p_expandedControl, "controlType"), v6, v5);

  }
LABEL_23:

}

uint64_t __78__CAMControlDrawer__setExpandedControl_animated_updatePreferredDrawerControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)expandableButton:(id)a3 willChangeExpanded:(BOOL)a4
{
  -[CAMControlDrawer setExpanded:forControlType:animated:updatePreferredDrawerControl:](self, "setExpanded:forControlType:animated:updatePreferredDrawerControl:", a4, objc_msgSend(a3, "controlType"), 1, 1);
}

- (void)menuButtonDidSelectItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[CAMControlDrawer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "controlType");

  objc_msgSend(v6, "controlDrawer:didSelectMenuItemForControlType:", self, v5);
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;

  -[CAMControlDrawer expandedControl](self, "expandedControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[CAMControlDrawer setNeedsLayout](self, "setNeedsLayout");
    v4 = v5;
  }

}

- (id)touchingRecognizersToCancel
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[CAMControlDrawer _scrollView](self, "_scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[CAMControlDrawer expandedControl](self, "expandedControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAMControlDrawer expandedControl](self, "expandedControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
  else
  {
    -[CAMControlDrawer _scrollView](self, "_scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationOfAccessibilityGestureInView:", v10);
    v12 = v11;
    v14 = v13;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[CAMControlDrawer visibleControlTypes](self, "visibleControlTypes", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[CAMControlDrawer _controlMap](self, "_controlMap");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "frame");
          v29.x = v12;
          v29.y = v14;
          if (CGRectContainsPoint(v30, v29))
          {
            v7[2](v7, v22);

            goto LABEL_13;
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CAMControlDrawer_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_1EA328A90;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[CAMControlDrawer _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __54__CAMControlDrawer_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "hudItemForAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CAMControlDrawer_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_1EA328AB8;
  v7 = v4;
  v5 = v4;
  -[CAMControlDrawer _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v6);

}

uint64_t __54__CAMControlDrawer_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectedByAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CAMControlDrawer_shouldAccessibilityGestureBeginForHUDManager___block_invoke;
  v7[3] = &unk_1EA328A90;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[CAMControlDrawer _iterateViewsForHUDManager:withItemFoundBlock:](self, "_iterateViewsForHUDManager:withItemFoundBlock:", v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __65__CAMControlDrawer_shouldAccessibilityGestureBeginForHUDManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "shouldAccessibilityGestureBeginForHUDManager:", *(_QWORD *)(a1 + 32));

}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMControlDrawerDelegate)delegate
{
  return (CAMControlDrawerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMControlDrawerPresentationDelegate)presentationDelegate
{
  return (CAMControlDrawerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (NSArray)visibleControlTypes
{
  return self->_visibleControlTypes;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CAMControlDrawerExpandableButton)expandedControl
{
  return self->_expandedControl;
}

- (CEKWheelScrubberView)filterScrubberView
{
  return self->_filterScrubberView;
}

- (CEKApertureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (CEKSlider)intensitySlider
{
  return self->_intensitySlider;
}

- (CAMLowLightSlider)lowLightSlider
{
  return self->_lowLightSlider;
}

- (CAMExposureSlider)exposureSlider
{
  return self->_exposureSlider;
}

- (CAMSemanticStyleControl)semanticStyleControl
{
  return self->_semanticStyleControl;
}

- (NSMutableDictionary)_controlMap
{
  return self->__controlMap;
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scrollView, 0);
  objc_storeStrong((id *)&self->__controlMap, 0);
  objc_storeStrong((id *)&self->_semanticStyleControl, 0);
  objc_storeStrong((id *)&self->_exposureSlider, 0);
  objc_storeStrong((id *)&self->_lowLightSlider, 0);
  objc_storeStrong((id *)&self->_intensitySlider, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_filterScrubberView, 0);
  objc_storeStrong((id *)&self->_expandedControl, 0);
  objc_storeStrong((id *)&self->_visibleControlTypes, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setExpanded:(uint64_t)a1 forControlType:(NSObject *)a2 animated:updatePreferredDrawerControl:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Trying to expand a control that is not expandable: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
