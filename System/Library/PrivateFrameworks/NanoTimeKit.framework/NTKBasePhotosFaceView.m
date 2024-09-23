@implementation NTKBasePhotosFaceView

- (NTKBasePhotosFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  NTKBasePhotosFaceView *v9;
  NTKTaskScheduler *v10;
  NTKTaskScheduler *taskScheduler;
  uint64_t v12;
  UIColor *foregroundColor;
  uint64_t v14;
  UIColor *shadowColor;
  NTKUtilityComplicationFactory *v16;
  NTKUtilityComplicationFactory *complicationFactory;
  void *v18;
  uint64_t v19;
  NSValue *monochromeColorMatrix;
  objc_super v22;

  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKBasePhotosFaceView;
  v9 = -[NTKFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v22, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, v8, a5);
  if (v9)
  {
    if (CLKIsClockFaceApp())
    {
      v10 = objc_alloc_init(NTKTaskScheduler);
      taskScheduler = v9->_taskScheduler;
      v9->_taskScheduler = v10;

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = objc_claimAutoreleasedReturnValue();
    foregroundColor = v9->_foregroundColor;
    v9->_foregroundColor = (UIColor *)v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, *(double *)off_1E6BC9B88);
    v14 = objc_claimAutoreleasedReturnValue();
    shadowColor = v9->_shadowColor;
    v9->_shadowColor = (UIColor *)v14;

    v16 = -[NTKUtilityComplicationFactory initForDevice:]([NTKUtilityComplicationFactory alloc], "initForDevice:", v8);
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v16;

    -[NTKBasePhotosFaceView _configureComplicationFactory](v9, "_configureComplicationFactory");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__unpauseFromSwitcher, CFSTR("NTKFaceLibraryDismissedNotification"), 0);

    NTKDefaultMonochromeColorMatrix();
    v19 = objc_claimAutoreleasedReturnValue();
    monochromeColorMatrix = v9->_monochromeColorMatrix;
    v9->_monochromeColorMatrix = (NSValue *)v19;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKFaceLibraryDismissedNotification"), 0);

  -[NSTimer invalidate](self->_playOnWakeTimeout, "invalidate");
  -[NTKBasePhotosFaceView _unloadSnapshotContentViews](self, "_unloadSnapshotContentViews");
  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView dealloc](&v4, sel_dealloc);
}

- (id)createFaceColorPalette
{
  return -[NTKFaceColorPalette initWithFaceClass:]([NTKPhotosColorPalette alloc], "initWithFaceClass:", -[NTKBasePhotosFaceView photosFaceClass](self, "photosFaceClass"));
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKDigitalFaceView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_posterImageView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_cornerView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_noPhotosView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
}

- (unint64_t)dateAlignment
{
  if (self->_noPhotosViewVisible)
    return 0;
  else
    return self->_dateAlignment;
}

- (double)_timeTravelYAdjustment
{
  unint64_t v3;
  double result;
  objc_super v5;

  v3 = -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment");
  result = 0.0;
  if (v3 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKBasePhotosFaceView;
    -[NTKBackgroundImageFaceView _timeTravelYAdjustment](&v5, sel__timeTravelYAdjustment, 0.0);
  }
  return result;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[8];
  _QWORD v28[9];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v28[8] = *MEMORY[0x1E0C80C00];
  if (-[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment") == 1)
  {
    -[NTKBasePhotosFaceView bounds](self, "bounds");
    -[NTKFaceView device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", v10, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = &unk_1E6C9E020;
    v27[1] = &unk_1E6C9E038;
    v28[0] = &unk_1E6CA4308;
    v28[1] = &unk_1E6CA4318;
    v27[2] = &unk_1E6C9E050;
    v27[3] = &unk_1E6C9E068;
    v28[2] = &unk_1E6CA4328;
    v28[3] = &unk_1E6CA4338;
    v27[4] = &unk_1E6C9E080;
    v27[5] = &unk_1E6C9E098;
    v28[4] = &unk_1E6CA4348;
    v28[5] = &unk_1E6CA4358;
    v27[6] = &unk_1E6C9E0B0;
    v27[7] = &unk_1E6C9E0C8;
    v28[6] = &unk_1E6CA4368;
    v28[7] = &unk_1E6CA4358;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scaledValue:withOverrides:", v12, 99.0);

    CLKAlterRect();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[NTKFaceView device](self, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = NTKDigitalTimeLabelStyleWideRightSideMargin(v21);
    -[NTKFaceView device](self, "device");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v23, v14, v16, v18, v20, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)NTKBasePhotosFaceView;
    -[NTKBackgroundImageFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](&v26, sel__digitalTimeLabelStyleFromViewMode_faceBounds_, a3, x, y, width, height);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v24;
}

- (void)_layoutForegroundContainerView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _layoutForegroundContainerView](&v2, sel__layoutForegroundContainerView);
}

- (void)setNoPhotosViewVisible:(BOOL)a3
{
  _BOOL8 noPhotosViewVisible;
  UIView *currentGradientView;
  unint64_t v6;
  _BOOL8 v7;
  NTKAlbumEmptyView *v8;
  void *v9;
  NTKAlbumEmptyView *v10;
  NTKAlbumEmptyView *noPhotosView;
  void *v12;
  id v13;

  if (self->_noPhotosViewVisible != a3)
  {
    noPhotosViewVisible = a3;
    -[UIView removeFromSuperview](self->_currentGradientView, "removeFromSuperview");
    currentGradientView = self->_currentGradientView;
    self->_currentGradientView = 0;

    v6 = -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment");
    self->_noPhotosViewVisible = noPhotosViewVisible;
    if (noPhotosViewVisible)
    {
      if (self->_noPhotosView)
      {
        v7 = 0;
      }
      else
      {
        v8 = [NTKAlbumEmptyView alloc];
        -[NTKFaceView device](self, "device");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NTKAlbumEmptyView initForDevice:](v8, "initForDevice:", v9);
        noPhotosView = self->_noPhotosView;
        self->_noPhotosView = v10;

        -[NTKBasePhotosFaceView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_noPhotosView, 0);
        -[NTKBasePhotosFaceView setNeedsLayout](self, "setNeedsLayout");
        v7 = !self->_noPhotosViewVisible;
      }
    }
    else
    {
      v7 = 1;
    }
    -[NTKAlbumEmptyView setHidden:](self->_noPhotosView, "setHidden:", v7);
    -[NTKPhotoImageView setHidden:](self->_posterImageView, "setHidden:", self->_noPhotosViewVisible);
    -[NTKFaceView timeView](self, "timeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", self->_noPhotosViewVisible);

    if (-[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment") != v6)
      -[NTKBasePhotosFaceView _applyAlignment](self, "_applyAlignment");
    if (self->_noPhotosViewVisible != noPhotosViewVisible)
    {
      -[NTKBasePhotosFaceView _applyPhotosColor](self, "_applyPhotosColor");
      noPhotosViewVisible = self->_noPhotosViewVisible;
    }
    -[NTKBasePhotosFaceView _setComplicationsHidden:](self, "_setComplicationsHidden:", noPhotosViewVisible);
    if (self->_noPhotosViewVisible)
    {
      +[NTKPhotoAnalysis defaultAnalysis](NTKPhotoAnalysis, "defaultAnalysis");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[NTKBasePhotosFaceView _setDateAttributes:animated:](self, "_setDateAttributes:animated:", v13, 0);

    }
  }
}

- (void)_loadLayoutRules
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _loadLayoutRules](&v26, sel__loadLayoutRules);
  -[NTKBasePhotosFaceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[NTKBackgroundImageFaceView _shouldAdjustLayoutForTimeTravel](self, "_shouldAdjustLayoutForTimeTravel"))
  {
    -[NTKBasePhotosFaceView _timeTravelYAdjustment](self, "_timeTravelYAdjustment");
    CLKAlterRect();
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v27[0] = CFSTR("top");
  v27[1] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NTKFaceView complicationLayoutforSlot:](self, "complicationLayoutforSlot:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v21, -[NTKBasePhotosFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v20), v4, v6, v8, v10);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v17);
  }

}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  NTKUtilityComplicationFactory *complicationFactory;
  id v9;
  id v10;
  id v11;

  complicationFactory = self->_complicationFactory;
  v9 = a5;
  v10 = a3;
  v11 = -[NTKUtilityComplicationFactory newViewForComplication:family:forSlot:](complicationFactory, "newViewForComplication:family:forSlot:", v10, a4, -[NTKBasePhotosFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v9));

  -[NTKBasePhotosFaceView _configureComplicationView:forSlot:](self, "_configureComplicationView:forSlot:", v11, v9);
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F8E9F268))
  {
    v7 = *MEMORY[0x1E0DC1448];
    v8 = v10;
    objc_msgSend(v8, "setFontWeight:", v7);
    objc_msgSend(v8, "setForegroundColor:", self->_foregroundColor);
    objc_msgSend(v8, "setShadowColor:", self->_shadowColor);
    -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self->_complicationFactory, "foregroundAlphaForEditing:", -[NTKFaceView editing](self, "editing"));
    objc_msgSend(v8, "setForegroundAlpha:");
    -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self->_complicationFactory, "foregroundImageAlphaForEditing:", -[NTKFaceView editing](self, "editing"));
    objc_msgSend(v8, "setForegroundImageAlpha:");
    objc_msgSend(v8, "setUsesLegibility:", (*((unsigned __int8 *)self + 1192) >> 2) & 1);
    objc_msgSend(v8, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKBasePhotosFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v6)));
    objc_msgSend(v8, "setSuppressesInternalColorOverrides:", 1);
    objc_msgSend(v8, "setHidden:", self->_noPhotosViewVisible);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

  }
}

- (double)_foregroundAlphaForEditMode:(int64_t)a3
{
  double result;

  result = 0.2;
  if (a3 != 10)
    return 1.0;
  return result;
}

- (double)_foregroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  double result;

  -[NTKBasePhotosFaceView _foregroundAlphaForEditMode:](self, "_foregroundAlphaForEditMode:", a4);
  -[NTKBasePhotosFaceView _foregroundAlphaForEditMode:](self, "_foregroundAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  uint64_t v6;
  _QWORD v7[5];

  -[NTKBasePhotosFaceView _foregroundAlphaForTransitionFraction:fromEditMode:toEditMode:](self, "_foregroundAlphaForTransitionFraction:fromEditMode:toEditMode:", a4, a5, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__NTKBasePhotosFaceView__applyForegroundAlphaForTransitionFraction_fromEditMode_toEditMode___block_invoke;
  v7[3] = &__block_descriptor_40_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
  v7[4] = v6;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v7);
}

void __92__NTKBasePhotosFaceView__applyForegroundAlphaForTransitionFraction_fromEditMode_toEditMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "display");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F8E9F268))
  {
    objc_msgSend(v4, "setForegroundAlpha:", *(double *)(a1 + 32));
    objc_msgSend(v4, "setForegroundImageAlpha:", *(double *)(a1 + 32));
  }

}

- (void)_applyComplicationContentSpecificAttributesAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke;
  v3[3] = &unk_1E6BD0500;
  v4 = a3;
  v3[4] = self;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v3);
}

void __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  objc_msgSend(a3, "display");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_BYTE *)(a1 + 40))
  {
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_2;
    v12 = &unk_1E6BCD778;
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v14 = v8;
    objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, &v9, 0, 0.5);

  }
  else
  {
    objc_msgSend(v4, "setForegroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160));
  }
  objc_msgSend(v5, "setShadowColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168), v9, v10, v11, v12);
  objc_msgSend(v5, "setUsesLegibility:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1192) >> 2) & 1);

}

void __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_3;
  v5[3] = &unk_1E6BCD778;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "performWithoutAnimation:", v5);

}

uint64_t __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setForegroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1160));
}

- (void)_setComplicationsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NTKFaceView complicationContainerView](self, "complicationContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1 && (a4 & 0xFFFFFFFFFFFFFFFBLL) != 10;
}

- (void)_prepareForEditing
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _prepareForEditing](&v4, sel__prepareForEditing);
  -[NTKBasePhotosFaceView _setComplicationsHidden:](self, "_setComplicationsHidden:", 0);
  +[NTKPhotoAnalysis defaultAnalysis](NTKPhotoAnalysis, "defaultAnalysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBasePhotosFaceView _setDateAttributes:animated:](self, "_setDateAttributes:animated:", v3, 1);

}

- (void)_cleanupAfterEditing
{
  objc_super v3;

  -[NTKBasePhotosFaceView _setComplicationsHidden:](self, "_setComplicationsHidden:", self->_noPhotosViewVisible);
  v3.receiver = self;
  v3.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _cleanupAfterEditing](&v3, sel__cleanupAfterEditing);
}

- (double)_backgroundImageAlphaForEditMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double result;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  result = 0.5;
  if (a3 != 14)
  {
    v7 = v3;
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)NTKBasePhotosFaceView;
    -[NTKBackgroundImageFaceView _backgroundImageAlphaForEditMode:](&v6, sel__backgroundImageAlphaForEditMode_, 0.5);
  }
  return result;
}

- (double)_timeLabelAlphaForEditMode:(int64_t)a3
{
  double result;

  if (a3 == 10)
    return 0.2;
  result = 1.0;
  if (a3 == 1)
    return 0.2;
  return result;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  int64_t v8;

  v4 = a3;
  v5 = -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment");
  if (objc_msgSend(v4, "isEqual:", CFSTR("top")))
  {
    v6 = v5 == 0;
    v7 = 5;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqual:", CFSTR("bottom")))
    {
      v8 = 0;
      goto LABEL_9;
    }
    v6 = v5 == 0;
    v7 = 7;
  }
  if (v6)
    v8 = v7;
  else
    v8 = v7 + 1;
LABEL_9:

  return v8;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  double result;

  -[NTKUtilityComplicationFactory keylineCornerRadiusForSlot:](self->_complicationFactory, "keylineCornerRadiusForSlot:", -[NTKBasePhotosFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", a3));
  return result;
}

- (void)_configureComplicationFactory
{
  -[NTKUtilityComplicationFactory setForegroundAlpha:](self->_complicationFactory, "setForegroundAlpha:", 1.0);
  -[NTKUtilityComplicationFactory setForegroundImageAlpha:](self->_complicationFactory, "setForegroundImageAlpha:", 1.0);
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (void)_applyAlignment
{
  UIView *currentGradientView;
  void *v4;
  id v5;

  -[UIView removeFromSuperview](self->_currentGradientView, "removeFromSuperview");
  currentGradientView = self->_currentGradientView;
  self->_currentGradientView = 0;

  -[NTKBasePhotosFaceView _loadLayoutRules](self, "_loadLayoutRules");
  -[NTKBasePhotosFaceView setNeedsLayout](self, "setNeedsLayout");
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[NTKDigitalFaceView invalidateDigitalTimeLabelStyle](self, "invalidateDigitalTimeLabelStyle");
  -[NTKFaceView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceViewWantsComplicationKeylineFramesReloaded");

}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;

  v13 = a3;
  v8 = a5;
  switch(a4)
  {
    case 10:
      -[NTKBasePhotosFaceView palette](self, "palette");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKBasePhotosFaceView updateWithColorPalette:](self, "updateWithColorPalette:", v9);
LABEL_12:

      break;
    case 14:
      v12 = -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment");
      self->_dateAlignment = objc_msgSend(v13, "alignment");
      if (-[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment") != v12)
        -[NTKBasePhotosFaceView _applyAlignment](self, "_applyAlignment");
      break;
    case 12:
      NTKCompanionClockFaceLocalizedString(CFSTR("PHOTOS_FACE_NO_CUSTOM_PHOTOS_TEXT_COMPANION"), CFSTR("No photos"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NTKCompanionClockFaceLocalizedString(CFSTR("PHOTOS_FACE_NO_SYNCED_ALBUM_TEXT_COMPANION"), CFSTR("No synced photos"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NTKCompanionClockFaceLocalizedString(CFSTR("PHOTOS_FACE_NO_MEMORIES_TEXT_COMPANION"), CFSTR("No memories"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "photosContent") == 1)
        -[NTKAlbumEmptyView setBodyLabelText:](self->_noPhotosView, "setBodyLabelText:", v9);
      if (!objc_msgSend(v13, "photosContent"))
        -[NTKAlbumEmptyView setBodyLabelText:](self->_noPhotosView, "setBodyLabelText:", v10);
      if (objc_msgSend(v13, "photosContent") == 2)
        -[NTKAlbumEmptyView setBodyLabelText:](self->_noPhotosView, "setBodyLabelText:", v11);

      goto LABEL_12;
  }

}

- (void)updateWithColorPalette:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *photosColorRamp;
  UIImage *v7;
  UIImage *photosMonoColorRamp;

  v4 = a3;
  objc_msgSend(v4, "colorRampImage");
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  photosColorRamp = self->_photosColorRamp;
  self->_photosColorRamp = v5;

  objc_msgSend(v4, "monocolorRampImage");
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

  photosMonoColorRamp = self->_photosMonoColorRamp;
  self->_photosMonoColorRamp = v7;

  -[NTKBasePhotosFaceView _applyPhotosColor](self, "_applyPhotosColor");
}

- (void)_applyPhotosColor
{
  -[NTKBasePhotosFaceView applyPhotosColorRamp:photosMonoColorRamp:monochromeColorMatrix:toPhotosImageView:](self, "applyPhotosColorRamp:photosMonoColorRamp:monochromeColorMatrix:toPhotosImageView:", self->_photosColorRamp, self->_photosMonoColorRamp, self->_monochromeColorMatrix, self->_posterImageView);
}

- (void)applyPhotosColorRamp:(id)a3 photosMonoColorRamp:(id)a4 monochromeColorMatrix:(id)a5 toPhotosImageView:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  if (NTKIsDefaultMonochromeColorMatrix(v9))
    v13 = v11;
  else
    v13 = v12;
  v14 = v13;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__NTKBasePhotosFaceView_applyPhotosColorRamp_photosMonoColorRamp_monochromeColorMatrix_toPhotosImageView___block_invoke;
  block[3] = &unk_1E6BCDCB8;
  v19 = v14;
  v20 = v9;
  v21 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __106__NTKBasePhotosFaceView_applyPhotosColorRamp_photosMonoColorRamp_monochromeColorMatrix_toPhotosImageView___block_invoke(_QWORD *a1)
{
  return +[NTKPhotosColorPalette applyColorRamp:colorRampAmount:monochromeColorMatrix:toView:](NTKPhotosColorPalette, "applyColorRamp:colorRampAmount:monochromeColorMatrix:toView:", a1[4], a1[5], a1[6], 1.0);
}

- (void)_applyPhotosColorFrom:(id)a3 to:(id)a4 fraction:(double)a5
{
  NSValue *monochromeColorMatrix;
  _QWORD v8[5];

  monochromeColorMatrix = self->_monochromeColorMatrix;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke;
  v8[3] = &unk_1E6BD0550;
  v8[4] = self;
  +[NTKPhotosColorPalette colorRampForMonochromeColorMatrix:fromPalette:toPalette:transitionFraction:completion:](NTKPhotosColorPalette, "colorRampForMonochromeColorMatrix:fromPalette:toPalette:transitionFraction:completion:", monochromeColorMatrix, a3, a4, v8, a5);
}

void __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  double v15;

  v7 = a2;
  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke_2;
  v11[3] = &unk_1E6BD0528;
  v15 = a4;
  v12 = v7;
  v13 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke_2(uint64_t a1)
{
  return +[NTKPhotosColorPalette applyColorRamp:colorRampAmount:monochromeColorMatrix:toView:](NTKPhotosColorPalette, "applyColorRamp:colorRampAmount:monochromeColorMatrix:toView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1080), *(double *)(a1 + 56));
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v6;
  void *v7;
  objc_super v8;
  CGAffineTransform v9;

  if (a4 == 14)
  {
    v6 = NTKScaleForRubberBandingFraction(a3);
    -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v9, v6, v6);
    objc_msgSend(v7, "setTransform:", &v9);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKBasePhotosFaceView;
    -[NTKBackgroundImageFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v8, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5, a3);
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (a6 == 10)
  {
    -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fromPalette");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView interpolatedColorPalette](self, "interpolatedColorPalette");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "toPalette");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBasePhotosFaceView _applyPhotosColorFrom:to:fraction:](self, "_applyPhotosColorFrom:to:fraction:", v19, v21, a3);

  }
  else if (a6 == 14)
  {
    if (a3 >= 0.5)
      v15 = v13;
    else
      v15 = v12;
    -[NTKBasePhotosFaceView _applyOption:forCustomEditMode:slot:](self, "_applyOption:forCustomEditMode:slot:", v15, 14, v14);
    v16 = (a3 * -2.0 + 1.0) * (a3 * -2.0 + 1.0) * (fabs(a3 * -2.0 + 1.0) * -2.0 + 3.0);
    -[NTKFaceView timeView](self, "timeView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlpha:", v16);

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __93__NTKBasePhotosFaceView__applyTransitionFraction_fromOption_toOption_forCustomEditMode_slot___block_invoke;
    v22[3] = &__block_descriptor_40_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
    *(double *)&v22[4] = v16;
    -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v22);
  }

}

void __93__NTKBasePhotosFaceView__applyTransitionFraction_fromOption_toOption_forCustomEditMode_slot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  objc_msgSend(a3, "display");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  double result;
  objc_super v5;

  if (a3 == 14)
    return 150.0;
  v5.receiver = self;
  v5.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _editSpeedForCustomEditMode:slot:](&v5, sel__editSpeedForCustomEditMode_slot_, a3, a4);
  return result;
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (id)_selectedContentView
{
  int *v2;

  if (self->_noPhotosViewVisible)
    v2 = &OBJC_IVAR___NTKBasePhotosFaceView__noPhotosView;
  else
    v2 = &OBJC_IVAR___NTKBasePhotosFaceView__posterImageView;
  return *(id *)((char *)&self->super.super.super.super.super.super.isa + *v2);
}

- (void)_applyFrozen
{
  char v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _applyFrozen](&v4, sel__applyFrozen);
  if (-[NTKFaceView isFrozen](self, "isFrozen"))
    v3 = 0;
  else
    v3 = 2;
  *((_BYTE *)self + 1192) = *((_BYTE *)self + 1192) & 0xFD | v3;
  -[NTKBasePhotosFaceView _updatePaused](self, "_updatePaused");
}

- (void)_applySlow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _applySlow](&v3, sel__applySlow);
  -[NTKBasePhotosFaceView _updatePaused](self, "_updatePaused");
}

- (void)_prepareForOrb
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _prepareForOrb](&v3, sel__prepareForOrb);
  -[NTKBasePhotosFaceView _updatePaused](self, "_updatePaused");
}

- (void)_cleanupAfterOrb:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _cleanupAfterOrb:](&v4, sel__cleanupAfterOrb_, a3);
  -[NTKBasePhotosFaceView _updatePaused](self, "_updatePaused");
}

- (void)_updatePaused
{
  _BOOL4 v3;
  NSTimer *v4;
  NSTimer *playOnWakeTimeout;

  v3 = -[NTKFaceView isFrozen](self, "isFrozen")
    || -[NTKFaceView orbing](self, "orbing")
    || -[NTKFaceView isSlow](self, "isSlow")
    || -[NTKFaceView dataMode](self, "dataMode") != 1;
  if (self->_paused != v3)
  {
    self->_paused = v3;
    if (v3)
    {
      if (-[NTKPhotoImageView isPlaying](self->_posterImageView, "isPlaying"))
        -[NTKPhotoImageView interruptPlayback](self->_posterImageView, "interruptPlayback");
      self->_shouldPlayOnWake = 0;
    }
    else if (-[NTKBasePhotosFaceView _screenOn](self, "_screenOn"))
    {
      self->_shouldPlayOnWake = 0;
      -[NTKBasePhotosFaceView _playPhoto](self, "_playPhoto");
    }
    else
    {
      self->_shouldPlayOnWake = 1;
      -[NSTimer invalidate](self->_playOnWakeTimeout, "invalidate");
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__playVideoForScreenWake_, 0, 0, 0.25);
      v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      playOnWakeTimeout = self->_playOnWakeTimeout;
      self->_playOnWakeTimeout = v4;

    }
    self->_updateWhenUnpausing = 0;
  }
}

- (BOOL)_screenOn
{
  return 1;
}

- (void)_playIrisOnSingleTap
{
  self->_isStartingPlaybackOnSingleTap = 1;
  -[NTKPhotoImageView playWithMode:](self->_posterImageView, "playWithMode:", 2);
}

- (void)_playPhoto
{
  void *v3;

  if (-[NTKPhotoImageView isPhotoIris](self->_posterImageView, "isPhotoIris")
    && (-[NTKPhotoImageView irisURL](self->_posterImageView, "irisURL"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[NTKBasePhotosFaceView _playVideo](self, "_playVideo");
  }
  else
  {
    -[NTKBasePhotosFaceView _playStill](self, "_playStill");
  }
}

- (void)_playStill
{
  -[NTKBasePhotosFaceView _hideCurtainView](self, "_hideCurtainView");
  if (self->_shouldPlayIntro)
  {
    -[NTKBasePhotosFaceView _animateIn](self, "_animateIn");
    self->_shouldPlayIntro = 0;
  }
}

- (void)_playVideo
{
  _BOOL4 shouldPlayIntro;
  NTKPhotoImageView *posterImageView;

  shouldPlayIntro = self->_shouldPlayIntro;
  posterImageView = self->_posterImageView;
  if (shouldPlayIntro)
  {
    -[NTKPhotoImageView playWithMode:](posterImageView, "playWithMode:", 2);
    self->_shouldPlayIntro = 0;
  }
  else if (-[NTKPhotoImageView isPlaying](posterImageView, "isPlaying"))
  {
    -[NTKBasePhotosFaceView _hideCurtainView](self, "_hideCurtainView");
    self->_isStartingPlaybackOnSingleTap = 0;
    -[NTKPhotoImageView resumeInterruptedPlayback](self->_posterImageView, "resumeInterruptedPlayback");
  }
}

- (void)_playVideoForScreenWake:(id)a3
{
  _QWORD block[5];

  -[NSTimer invalidate](self->_playOnWakeTimeout, "invalidate", a3);
  if (self->_shouldPlayOnWake && !self->_preLoadingPhotoOnSleep)
  {
    self->_shouldPlayOnWake = 0;
    if (-[NTKPhotoImageView isPhotoIris](self->_posterImageView, "isPhotoIris"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__NTKBasePhotosFaceView__playVideoForScreenWake___block_invoke;
      block[3] = &unk_1E6BCD5F0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      -[NTKBasePhotosFaceView _playStill](self, "_playStill");
    }
  }
}

uint64_t __49__NTKBasePhotosFaceView__playVideoForScreenWake___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playPhoto");
}

- (void)_unpauseFromSwitcher
{
  if (self->_updateWhenUnpausing)
  {
    -[NTKBasePhotosFaceView _updatePaused](self, "_updatePaused");
    self->_updateWhenUnpausing = 0;
  }
}

- (void)_loadSnapshotContentViews
{
  NTKPhotoImageView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NTKPhotoImageView *v13;
  NTKPhotoImageView *posterImageView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NTKRoundedCornerOverlayView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  UIView *v29;
  UIView *cornerView;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _loadSnapshotContentViews](&v32, sel__loadSnapshotContentViews);
  if ((*((_BYTE *)self + 1192) & 1) == 0)
  {
    -[NTKBasePhotosFaceView _invalidatePreloadedPhoto](self, "_invalidatePreloadedPhoto");
    -[NTKPhotoImageView removeFromSuperview](self->_posterImageView, "removeFromSuperview");
    v3 = [NTKPhotoImageView alloc];
    -[NTKBasePhotosFaceView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[NTKFaceView device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NTKPhotoImageView initWithFrame:forDevice:](v3, "initWithFrame:forDevice:", v12, v5, v7, v9, v11);
    posterImageView = self->_posterImageView;
    self->_posterImageView = v13;

    -[NTKBasePhotosFaceView _applyPhotosColor](self, "_applyPhotosColor");
    -[NTKPhotoImageView setDelegate:](self->_posterImageView, "setDelegate:", self);
    -[NTKPhotoImageView layer](self->_posterImageView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsEdgeAntialiasing:", 0);

    -[NTKPhotoImageView layer](self->_posterImageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupOpacity:", 0);

    -[NTKFaceView contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_posterImageView);

    -[NTKFaceView contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendSubviewToBack:", self->_posterImageView);

    v19 = [NTKRoundedCornerOverlayView alloc];
    -[NTKBasePhotosFaceView bounds](self, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[NTKFaceView device](self, "device");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:](v19, "initWithFrame:forDeviceCornerRadius:", v28, v21, v23, v25, v27);
    cornerView = self->_cornerView;
    self->_cornerView = v29;

    -[NTKFaceView contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "insertSubview:aboveSubview:", self->_cornerView, self->_posterImageView);

    *((_BYTE *)self + 1192) |= 1u;
    *((_BYTE *)self + 1192) |= 2u;
  }
}

- (void)_unloadSnapshotContentViews
{
  UIView *currentGradientView;
  NTKAlbumEmptyView *noPhotosView;
  NTKPhotoImageView *posterImageView;
  UIView *cornerView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _unloadSnapshotContentViews](&v7, sel__unloadSnapshotContentViews);
  self->_updateWhenUnpausing = 0;
  if ((*((_BYTE *)self + 1192) & 1) != 0)
  {
    -[NTKPhotoImageView removeFromSuperview](self->_posterImageView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_cornerView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_currentGradientView, "removeFromSuperview");
    currentGradientView = self->_currentGradientView;
    self->_currentGradientView = 0;

    -[NTKAlbumEmptyView removeFromSuperview](self->_noPhotosView, "removeFromSuperview");
    noPhotosView = self->_noPhotosView;
    self->_noPhotosView = 0;

    posterImageView = self->_posterImageView;
    self->_posterImageView = 0;

    cornerView = self->_cornerView;
    self->_cornerView = 0;

    *((_BYTE *)self + 1192) &= ~1u;
    *((_BYTE *)self + 1192) &= ~2u;
  }
}

- (void)_applyDataMode
{
  int64_t v3;
  int64_t v4;
  void *v5;
  _BOOL4 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKFaceView _applyDataMode](&v7, sel__applyDataMode);
  v3 = -[NTKFaceView dataMode](self, "dataMode");
  v4 = v3;
  if ((unint64_t)(v3 - 3) >= 3)
  {
    if (v3 == 2)
    {
      -[NTKFaceView device](self, "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isLocked") & 1) != 0)
      {

      }
      else
      {
        v6 = -[NTKBasePhotosFaceView screenWillGoDark](self, "screenWillGoDark");

        if (v6)
        {
          -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
          -[NTKBasePhotosFaceView _scheduleSleepPreloadTask](self, "_scheduleSleepPreloadTask");
        }
      }
    }
    else
    {
      if (v3 != 1)
        goto LABEL_3;
      if (self->_previousDataMode == 3)
      {
        self->_updateWhenUnpausing = 1;
        goto LABEL_3;
      }
    }
  }
  -[NTKBasePhotosFaceView _updatePaused](self, "_updatePaused");
LABEL_3:
  self->_previousDataMode = v4;
}

- (void)_scheduleSleepPreloadTask
{
  NTKTaskScheduler *taskScheduler;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  self->_preloadedPhotoOnSleep = 0;
  objc_initWeak(&location, self);
  taskScheduler = self->_taskScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__NTKBasePhotosFaceView__scheduleSleepPreloadTask__block_invoke;
  v5[3] = &unk_1E6BD0578;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v4 = -[NTKTaskScheduler scheduleTask:identifier:](taskScheduler, "scheduleTask:identifier:", v5, CFSTR("com.apple.ntk.NTKBasePhotosFaceView"));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __50__NTKBasePhotosFaceView__scheduleSleepPreloadTask__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "screenWillGoDark") && !v3[1129])
  {
    v4 = 1;
    v3[1104] = 1;
    v3[1128] = 1;
    objc_msgSend(v3, "_preloadNextPhoto");
    v3[1128] = 0;
    v3[1129] = 1;
    if (v3[1105] && objc_msgSend(*(id *)(a1 + 32), "_screenOn"))
      objc_msgSend(v3, "_playVideoForScreenWake:", 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_preloadNextPhoto
{
  return 0;
}

- (void)_invalidatePreloadedPhoto
{
  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  self->_preloadedPhotoOnSleep = 0;
}

- (void)_animateIn
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeScale(&v8, 0.95, 0.95);
  v7 = v8;
  -[UIView setTransform:](self->_cornerView, "setTransform:", &v7);
  v6 = v8;
  -[NTKPhotoImageView setTransform:](self->_posterImageView, "setTransform:", &v6);
  -[NTKPhotoImageView setAlpha:](self->_posterImageView, "setAlpha:", 0.0);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NTKBasePhotosFaceView__animateIn__block_invoke;
  v5[3] = &unk_1E6BCD5F0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0x20000, v5, 0, 0.8, 0.0);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __35__NTKBasePhotosFaceView__animateIn__block_invoke_2;
  v4[3] = &unk_1E6BCD5F0;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.25, 0.1);
}

uint64_t __35__NTKBasePhotosFaceView__animateIn__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAlpha:", 1.0);
}

uint64_t __35__NTKBasePhotosFaceView__animateIn__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];
  _OWORD v9[2];
  __int128 v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v6 = v9[0];
  v9[1] = v7;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v5 = v10;
  objc_msgSend(v2, "setTransform:", v9);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1152);
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  return objc_msgSend(v3, "setTransform:", v8);
}

- (void)_handleScreenWake
{
  -[NTKTaskScheduler cancelAllTasks](self->_taskScheduler, "cancelAllTasks");
  -[NTKBasePhotosFaceView _playVideoForScreenWake:](self, "_playVideoForScreenWake:", 0);
}

- (void)_showCurtainView
{
  UIView *blackView;
  id v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  id v8;

  blackView = self->_blackView;
  if (!blackView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[NTKPhotoImageView bounds](self->_posterImageView, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_blackView;
    self->_blackView = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_blackView, "setBackgroundColor:", v7);

    blackView = self->_blackView;
  }
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKBasePhotosFaceView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", blackView, v8);

}

- (void)_hideCurtainView
{
  UIView *blackView;

  -[UIView removeFromSuperview](self->_blackView, "removeFromSuperview");
  blackView = self->_blackView;
  self->_blackView = 0;

}

- (BOOL)_curtainViewVisible
{
  void *v2;
  BOOL v3;

  -[UIView superview](self->_blackView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v9, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  -[NTKBasePhotosFaceView _applyForegroundAlphaForTransitionFraction:fromEditMode:toEditMode:](self, "_applyForegroundAlphaForTransitionFraction:fromEditMode:toEditMode:", a4, a5, a3);
}

- (void)_configureForEditMode:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _configureForEditMode:](&v6, sel__configureForEditMode_);
  if (a3 == 14 || a3 == 1)
  {
    +[NTKPhotoAnalysis defaultAnalysis](NTKPhotoAnalysis, "defaultAnalysis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKBasePhotosFaceView _setDateAttributes:animated:](self, "_setDateAttributes:animated:", v5, 1);

  }
  -[NTKBasePhotosFaceView _applyForegroundAlphaForTransitionFraction:fromEditMode:toEditMode:](self, "_applyForegroundAlphaForTransitionFraction:fromEditMode:toEditMode:", a3, a3, 0.0);
}

- (id)_newGradientViewWithColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v4 = a3;
  NTKImageNamed(CFSTR("PhotoGradient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenBounds");
  v8 = v7;
  v10 = v9;

  if (-[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment") == 1)
  {
    v11 = (void *)MEMORY[0x1E0DC3870];
    v12 = objc_retainAutorelease(v5);
    v13 = objc_msgSend(v12, "CGImage");
    objc_msgSend(v12, "scale");
    objc_msgSend(v11, "imageWithCGImage:scale:orientation:", v13, 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "size");
    v15 = v14;
    v16 = v10 - v14;
  }
  else
  {
    objc_msgSend(v5, "size");
    v15 = v17;
    v16 = 0.0;
  }
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, v16, v8, v15);
  objc_msgSend(v19, "setImage:", v18);
  objc_msgSend(v19, "setTintColor:", v4);

  objc_msgSend(v19, "setAlpha:", 0.0);
  return v19;
}

- (void)setMonochromeColorMatrix:(id)a3
{
  void *v4;
  char v5;

  objc_storeStrong((id *)&self->_monochromeColorMatrix, a3);
  -[NTKBasePhotosFaceView palette](self, "palette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOriginalColor");

  if ((v5 & 1) == 0)
    -[NTKBasePhotosFaceView _applyPhotosColor](self, "_applyPhotosColor");
}

- (void)_setDateAttributes:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  UIColor *legibilityGradientColor;
  void *v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  UIColor *v18;
  UIColor *v19;
  void *v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  uint64_t v26;
  int v27;
  char v28;
  void *v29;
  void *v30;
  float v31;
  double v32;
  float v33;
  double v34;
  float v35;
  void *v36;
  void *v37;
  void *v38;
  UIView *v39;
  UIView *currentGradientView;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  UIView *v44;
  UIView *v45;
  UIView *v46;
  UIView *v47;
  UIView *v48;
  unsigned int v49;
  _QWORD v50[5];
  _QWORD v51[4];
  UIView *v52;
  _QWORD v53[4];
  UIView *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  NTKBasePhotosFaceView *v58;
  id v59;
  char v60;
  uint8_t buf[4];
  const __CFString *v62;
  uint64_t v63;

  v4 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment");
    v9 = CFSTR("Bottom");
    if (!v8)
      v9 = CFSTR("Top");
    *(_DWORD *)buf = 138412290;
    v62 = v9;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Applying color analysis for %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  legibilityGradientColor = self->_legibilityGradientColor;
  self->_legibilityGradientColor = 0;

  if ((objc_msgSend(v6, "isComplexBackground") & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v6, "bgHue");
    v14 = v13;
    objc_msgSend(v6, "bgSaturation");
    v16 = v15;
    objc_msgSend(v6, "bgBrightness");
    objc_msgSend(v12, "colorWithHue:saturation:brightness:alpha:", v14, v16, v17, 0.7);
    v18 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v19 = self->_legibilityGradientColor;
    self->_legibilityGradientColor = v18;

  }
  else if ((objc_msgSend(v6, "isColoredText") & 1) != 0)
  {
    v20 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v6, "textHue");
    v22 = v21;
    objc_msgSend(v6, "textSaturation");
    v24 = v23;
    objc_msgSend(v6, "textBrightness");
    objc_msgSend(v20, "colorWithHue:saturation:brightness:alpha:", v22, v24, v25, 1.0);
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v28 = 0;
    v29 = 0;
    v10 = (void *)v26;
    goto LABEL_10;
  }
  v30 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(v6, "shadowHue");
  v32 = v31;
  objc_msgSend(v6, "shadowSaturation");
  v34 = v33;
  objc_msgSend(v6, "shadowBrightness");
  objc_msgSend(v30, "colorWithHue:saturation:brightness:alpha:", v32, v34, v35, *(double *)off_1E6BC9B88);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 4;
  v27 = 1;
LABEL_10:
  objc_storeStrong((id *)&self->_foregroundColor, v10);
  *((_BYTE *)self + 1192) = *((_BYTE *)self + 1192) & 0xFB | v28;
  objc_storeStrong((id *)&self->_shadowColor, v29);
  -[NTKFaceView timeView](self, "timeView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if ((_DWORD)v4)
  {
    v49 = v4;
    v38 = (void *)MEMORY[0x1E0DC3F10];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke;
    v55[3] = &unk_1E6BD05A0;
    v56 = v36;
    v57 = v10;
    v58 = self;
    v60 = v27;
    v59 = v29;
    objc_msgSend(v38, "transitionWithView:duration:options:animations:completion:", v56, 5242880, v55, 0, 0.5);
    v39 = self->_currentGradientView;
    if (v39)
    {
      currentGradientView = self->_currentGradientView;
      self->_currentGradientView = 0;

      v41 = (void *)MEMORY[0x1E0DC3F10];
      v42 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_2;
      v53[3] = &unk_1E6BCD5F0;
      v54 = v39;
      v51[0] = v42;
      v51[1] = 3221225472;
      v51[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_3;
      v51[3] = &unk_1E6BD05C8;
      v52 = v54;
      objc_msgSend(v41, "animateWithDuration:animations:completion:", v53, v51, 0.5);

    }
    v43 = MEMORY[0x1E0C809B0];
    if (self->_legibilityGradientColor)
    {
      v44 = -[NTKBasePhotosFaceView _newGradientViewWithColor:](self, "_newGradientViewWithColor:");
      v45 = self->_currentGradientView;
      self->_currentGradientView = v44;

      -[NTKPhotoImageView addSubview:](self->_posterImageView, "addSubview:", self->_currentGradientView);
      v50[0] = v43;
      v50[1] = 3221225472;
      v50[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_4;
      v50[3] = &unk_1E6BCD5F0;
      v50[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v50, 0.5);
    }

    v4 = v49;
  }
  else
  {
    objc_msgSend(v36, "setColor:", v10);
    objc_msgSend(v37, "setUsesLegibility:", v27 & -[NTKBasePhotosFaceView _timeLabelUsesLegibility](self, "_timeLabelUsesLegibility"));
    objc_msgSend(v37, "setShadowColor:", v29);
    -[UIView removeFromSuperview](self->_currentGradientView, "removeFromSuperview");
    v46 = self->_currentGradientView;
    self->_currentGradientView = 0;

    if (self->_legibilityGradientColor)
    {
      v47 = -[NTKBasePhotosFaceView _newGradientViewWithColor:](self, "_newGradientViewWithColor:");
      v48 = self->_currentGradientView;
      self->_currentGradientView = v47;

      -[UIView setAlpha:](self->_currentGradientView, "setAlpha:", 1.0);
      -[NTKPhotoImageView addSubview:](self->_posterImageView, "addSubview:", self->_currentGradientView);
    }
  }
  -[NTKBasePhotosFaceView _applyComplicationContentSpecificAttributesAnimated:](self, "_applyComplicationContentSpecificAttributesAnimated:", v4);
  -[NTKBasePhotosFaceView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke(uint64_t a1)
{
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "setColor:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "_timeLabelUsesLegibility"))
    v2 = *(_BYTE *)(a1 + 64) != 0;
  else
    v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setUsesLegibility:", v2);
  return objc_msgSend(*(id *)(a1 + 32), "setShadowColor:", *(_QWORD *)(a1 + 56));
}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "setAlpha:", 1.0);
}

- (void)imageViewDidBeginPlaying:(id)a3
{
  if (self->_isStartingPlaybackOnSingleTap)
  {
    self->_isStartingPlaybackOnSingleTap = 0;
    -[NTKBasePhotosFaceView _didStartPlayingIrisOnSingleTap](self, "_didStartPlayingIrisOnSingleTap", a3);
  }
  else
  {
    if (-[NTKBasePhotosFaceView _curtainViewVisible](self, "_curtainViewVisible", a3))
      -[NTKBasePhotosFaceView _animateIn](self, "_animateIn");
    -[NTKBasePhotosFaceView _hideCurtainView](self, "_hideCurtainView");
  }
}

- (void)_applyScrubbingForegroundColor:(id)a3 shadowColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NTKFaceView timeView](self, "timeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v6);
  objc_msgSend(v8, "setShadowColor:", v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__NTKBasePhotosFaceView__applyScrubbingForegroundColor_shadowColor___block_invoke;
  v11[3] = &unk_1E6BCF090;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v11);

}

void __68__NTKBasePhotosFaceView__applyScrubbingForegroundColor_shadowColor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "display");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForegroundColor:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setShadowColor:", *(_QWORD *)(a1 + 40));

}

- (void)_startScrubbingAnimationFromUIViewAnimateWithDuration
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBasePhotosFaceView _applyScrubbingForegroundColor:shadowColor:](self, "_applyScrubbingForegroundColor:shadowColor:", v4, v3);

}

- (void)_endScrubbingAnimationFromUIViewAnimateWithDuration
{
  -[NTKBasePhotosFaceView _applyScrubbingForegroundColor:shadowColor:](self, "_applyScrubbingForegroundColor:shadowColor:", self->_foregroundColor, self->_shadowColor);
}

- (BOOL)screenWillGoDark
{
  return 1;
}

- (UIView)cornerView
{
  return self->_cornerView;
}

- (NTKPhotoImageView)posterImageView
{
  return self->_posterImageView;
}

- (BOOL)isInteractive
{
  return (*((unsigned __int8 *)self + 1192) >> 1) & 1;
}

- (NTKAlbumEmptyView)noPhotosView
{
  return self->_noPhotosView;
}

- (BOOL)isNoPhotosViewVisible
{
  return self->_noPhotosViewVisible;
}

- (UIImage)photosColorRamp
{
  return self->_photosColorRamp;
}

- (UIImage)photosMonoColorRamp
{
  return self->_photosMonoColorRamp;
}

- (NSValue)monochromeColorMatrix
{
  return self->_monochromeColorMatrix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monochromeColorMatrix, 0);
  objc_storeStrong((id *)&self->_photosMonoColorRamp, 0);
  objc_storeStrong((id *)&self->_photosColorRamp, 0);
  objc_storeStrong((id *)&self->_noPhotosView, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_currentGradientView, 0);
  objc_storeStrong((id *)&self->_legibilityGradientColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_playOnWakeTimeout, 0);
  objc_storeStrong((id *)&self->_blackView, 0);
  objc_storeStrong((id *)&self->_posterImageView, 0);
}

- (Class)photosFaceClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
