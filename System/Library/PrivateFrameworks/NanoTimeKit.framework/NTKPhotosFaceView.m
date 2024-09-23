@implementation NTKPhotosFaceView

- (NTKPhotosFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  NTKPhotosFaceView *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKPhotosFaceView;
  result = -[NTKBasePhotosFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v6, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, a4, a5);
  if (result)
    result->_currentContent = 2989;
  return result;
}

- (void)layoutSubviews
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)NTKPhotosFaceView;
  v3 = -[NTKBasePhotosFaceView layoutSubviews](&v17, sel_layoutSubviews);
  if (NTKInternalBuild(v3, v4) && _os_feature_enabled_impl())
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NTKBasePhotosFaceView posterImageView](self, "posterImageView", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "setHidden:", 1);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

    -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCA72B8](objc_msgSend(v12, "bounds"));
    -[UILabel setCenter:](self->_aplLabel, "setCenter:");

  }
}

- (void)_applyFrozen
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKPhotosFaceView;
  -[NTKBasePhotosFaceView _applyFrozen](&v3, sel__applyFrozen);
  -[UITapGestureRecognizer setEnabled:](self->_singleTapGesture, "setEnabled:", -[NTKBasePhotosFaceView isInteractive](self, "isInteractive"));
}

- (Class)photosFaceClass
{
  return (Class)objc_opt_class();
}

- (void)_loadSnapshotContentViews
{
  void *v3;
  NTKRoundedCornerOverlayView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UIView *v14;
  UIView *photoTransitionCornerView;
  void *v16;
  UIView *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *preloaded;
  NSMutableArray *v21;
  NSMutableArray *toload;
  UITapGestureRecognizer *v23;
  UITapGestureRecognizer *singleTapGesture;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)NTKPhotosFaceView;
  -[NTKBasePhotosFaceView _loadSnapshotContentViews](&v29, sel__loadSnapshotContentViews);
  if ((*((_BYTE *)self + 1248) & 1) == 0)
  {
    *((_BYTE *)self + 1248) |= 1u;
    -[NTKFaceView device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_deviceSizeClass = objc_msgSend(v3, "sizeClass");

    v4 = [NTKRoundedCornerOverlayView alloc];
    -[NTKPhotosFaceView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NTKFaceView device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:](v4, "initWithFrame:forDeviceCornerRadius:", v13, v6, v8, v10, v12);
    photoTransitionCornerView = self->_photoTransitionCornerView;
    self->_photoTransitionCornerView = v14;

    -[UIView setAlpha:](self->_photoTransitionCornerView, "setAlpha:", 0.0);
    -[NTKFaceView contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->_photoTransitionCornerView;
    -[NTKBasePhotosFaceView cornerView](self, "cornerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSubview:aboveSubview:", v17, v18);

    v19 = (NSMutableArray *)objc_opt_new();
    preloaded = self->_preloaded;
    self->_preloaded = v19;

    v21 = (NSMutableArray *)objc_opt_new();
    toload = self->_toload;
    self->_toload = v21;

    v23 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleSingleTap_);
    singleTapGesture = self->_singleTapGesture;
    self->_singleTapGesture = v23;

    -[UITapGestureRecognizer setDelegate:](self->_singleTapGesture, "setDelegate:", self);
    -[NTKPhotosFaceView addGestureRecognizer:](self, "addGestureRecognizer:", self->_singleTapGesture);
    v25 = -[NTKPhotosFaceView _updateContents:](self, "_updateContents:", 1);
    if (NTKInternalBuild(v25, v26))
    {
      if (_os_feature_enabled_impl())
      {
        -[NTKFaceView timeView](self, "timeView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setHidden:", 1);

        -[NTKFaceView complicationContainerView](self, "complicationContainerView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setHidden:", 1);

      }
    }
  }
}

- (void)_unloadSnapshotContentViews
{
  UIView *photoTransitionCornerView;
  UIView *photoTransitionSnapshotView;
  UITapGestureRecognizer *singleTapGesture;
  NSMutableArray *preloaded;
  NSMutableArray *toload;
  id enqueuePreloadedPhotoCompletion;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKPhotosFaceView;
  -[NTKBasePhotosFaceView _unloadSnapshotContentViews](&v9, sel__unloadSnapshotContentViews);
  if ((*((_BYTE *)self + 1248) & 1) != 0)
  {
    *((_BYTE *)self + 1248) &= ~1u;
    -[UIView removeFromSuperview](self->_photoTransitionCornerView, "removeFromSuperview");
    photoTransitionCornerView = self->_photoTransitionCornerView;
    self->_photoTransitionCornerView = 0;

    -[UIView removeFromSuperview](self->_photoTransitionSnapshotView, "removeFromSuperview");
    photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
    self->_photoTransitionSnapshotView = 0;

    -[NTKPhotosFaceView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_singleTapGesture);
    singleTapGesture = self->_singleTapGesture;
    self->_singleTapGesture = 0;

    preloaded = self->_preloaded;
    self->_preloaded = 0;

    toload = self->_toload;
    self->_toload = 0;

    enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
    self->_enqueuePreloadedPhotoCompletion = 0;

    ++self->_preloadGeneration;
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  unint64_t currentContent;
  NSObject *v11;
  int v12;
  objc_super v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKPhotosFaceView;
  -[NTKBasePhotosFaceView _applyOption:forCustomEditMode:slot:](&v13, sel__applyOption_forCustomEditMode_slot_, v8, a4, a5);
  if (a4 == 14)
  {
    -[NTKPhotosFaceView _updateDateAttributesAnimated:](self, "_updateDateAttributesAnimated:", 0);
  }
  else if (a4 == 12)
  {
    v9 = v8;
    currentContent = self->_currentContent;
    if (currentContent != objc_msgSend(v9, "photosContent"))
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v9, "photosContent");
        *(_DWORD *)buf = 67109120;
        v15 = v12;
        _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView: photosContent now set to %d", buf, 8u);
      }

      self->_currentContent = objc_msgSend(v9, "photosContent");
      -[NTKPhotosFaceView _updateContents:](self, "_updateContents:", 1);
    }

  }
}

- (void)_configureForEditMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKPhotosFaceView;
  -[NTKBasePhotosFaceView _configureForEditMode:](&v5, sel__configureForEditMode_);
  if (a3 == 12)
    -[NTKPhotosFaceView _updateDateAttributesAnimated:](self, "_updateDateAttributesAnimated:", 1);
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKPhotosFaceView;
  -[NTKFaceView _updateForResourceDirectoryChange:](&v4, sel__updateForResourceDirectoryChange_, a3);
  -[NTKPhotosFaceView _updateContents:](self, "_updateContents:", 0);
}

- (double)_timeLabelAlphaForEditMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double result;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  result = 0.5;
  if (a3 != 12)
  {
    v7 = v3;
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)NTKPhotosFaceView;
    -[NTKBasePhotosFaceView _timeLabelAlphaForEditMode:](&v6, sel__timeLabelAlphaForEditMode_, 0.5);
  }
  return result;
}

- (double)_backgroundImageAlphaForEditMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double result;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  result = 1.0;
  if (a3 != 12)
  {
    v7 = v3;
    v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)NTKPhotosFaceView;
    -[NTKBasePhotosFaceView _backgroundImageAlphaForEditMode:](&v6, sel__backgroundImageAlphaForEditMode_, 1.0);
  }
  return result;
}

- (void)_startScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKPhotosFaceView;
  -[NTKBackgroundImageFaceView _startScrubbingAnimated:withCompletion:](&v5, sel__startScrubbingAnimated_withCompletion_, a3, a4);
  *((_BYTE *)self + 1248) |= 2u;
}

- (void)_endScrubbingAnimated:(BOOL)a3 withCompletion:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKPhotosFaceView;
  -[NTKBackgroundImageFaceView _endScrubbingAnimated:withCompletion:](&v5, sel__endScrubbingAnimated_withCompletion_, a3, a4);
  *((_BYTE *)self + 1248) &= ~2u;
}

- (void)_finalizeForSnapshotting:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView _finalizeForSnapshotting", buf, 2u);
  }

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke;
  aBlock[3] = &unk_1E6BCDF60;
  v7 = v4;
  v15 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((self->_currentContent | 2) == 2)
  {
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView waiting for photos analysis", buf, 2u);
    }

    _NTKPhotosAnalysisQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_61;
    v12[3] = &unk_1E6BCDF60;
    v13 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView nothing to wait for", buf, 2u);
    }

    v8[2](v8);
  }

}

void __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_2;
  block[3] = &unk_1E6BCDF60;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__NTKPhotosFaceView__finalizeForSnapshotting___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_preloadNextPhoto
{
  unint64_t numberOfPhotos;

  numberOfPhotos = self->_numberOfPhotos;
  if (numberOfPhotos)
    -[NTKPhotosFaceView _nextPhotoAnimated:preroll:method:completion:](self, "_nextPhotoAnimated:preroll:method:completion:", 0, 1, 2, 0);
  return numberOfPhotos != 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  BOOL v5;
  objc_super v7;

  v4 = (UITapGestureRecognizer *)a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKPhotosFaceView;
  v5 = !-[NTKBackgroundImageFaceView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, v4)
    || (*((_BYTE *)self + 1248) & 8) == 0
    || self->_singleTapGesture == v4;

  return v5;
}

- (void)readerDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__NTKPhotosFaceView_readerDidChange___block_invoke;
  v6[3] = &unk_1E6BCD778;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

_QWORD *__37__NTKPhotosFaceView_readerDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _NTKPhotoIndexGenerator *v4;
  uint64_t v5;
  void *v6;
  _QWORD *result;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "_clearPreloaded");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328) = objc_msgSend(*(id *)(a1 + 40), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 1328))
  {
    v4 = -[_NTKPhotoIndexGenerator initWithSize:]([_NTKPhotoIndexGenerator alloc], "initWithSize:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1264);
    *(_QWORD *)(v5 + 1264) = v4;
  }
  else
  {
    v6 = *(void **)(v3 + 1264);
    *(_QWORD *)(v3 + 1264) = 0;
  }

  result = *(_QWORD **)(a1 + 32);
  v8 = result[166];
  if (v2)
  {
    if (!v8)
      return (_QWORD *)objc_msgSend(result, "setNoPhotosViewVisible:", 1);
  }
  else if (v8)
  {
    objc_msgSend(result, "setNoPhotosViewVisible:", 0);
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_nextPhotoAnimated:preroll:method:completion:", objc_msgSend(*(id *)(a1 + 32), "isInteractive"), 0, 3, 0);
  }
  return result;
}

- (BOOL)_shouldAnimationContinue:(BOOL)a3
{
  if (a3
    && -[NTKFaceView dataMode](self, "dataMode") == 1
    && -[NTKBasePhotosFaceView isInteractive](self, "isInteractive")
    && self->_numberOfPhotos)
  {
    return 1;
  }
  -[NTKPhotosFaceView _resetTapAnimationState](self, "_resetTapAnimationState");
  return 0;
}

- (void)_displayCachedPhoto:(id)a3 animated:(BOOL)a4 preroll:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  UILabel *v47;
  UILabel *aplLabel;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  float v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  void (**v59)(id, _QWORD);
  id v60;
  _BYTE location[12];
  __int16 v62;
  CGFloat v63;
  __int16 v64;
  CGFloat v65;
  __int16 v66;
  CGFloat v67;
  __int16 v68;
  CGFloat v69;
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v7 = a5;
  v8 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  if (v10 && (objc_msgSend(v10, "photo"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    objc_msgSend(v10, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;
    objc_msgSend(v13, "size");
    if (!v13 || ((v18 = v15 * v17, v15 * v16 >= 1.0) ? (v19 = v18 < 1.0) : (v19 = 1), v19))
    {
      if (v11)
        v11[2](v11, 0);
    }
    else
    {
      NTKGenerateMonochromeColorMatrixFromImage(v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKBasePhotosFaceView setMonochromeColorMatrix:](self, "setMonochromeColorMatrix:", v20);

      objc_msgSend(v10, "photo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "crop");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      v71.origin.x = v23;
      v71.origin.y = v25;
      v71.size.width = v27;
      v71.size.height = v29;
      if (CGRectIsEmpty(v71))
        goto LABEL_10;
      v72.origin.x = v23;
      v72.origin.y = v25;
      v72.size.width = v27;
      v72.size.height = v29;
      v73.origin.x = v23;
      v73.origin.y = v25;
      v73.size.width = v27;
      v73.size.height = v29;
      if (!CGRectEqualToRect(v72, v73))
      {
LABEL_10:
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "photo");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "localIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138413314;
          *(_QWORD *)&location[4] = v57;
          v62 = 2048;
          v63 = v23;
          v64 = 2048;
          v65 = v25;
          v66 = 2048;
          v67 = v27;
          v68 = 2048;
          v69 = v29;
          _os_log_error_impl(&dword_1B72A3000, v30, OS_LOG_TYPE_ERROR, "Bad crop on photo %@: { %.1f, %.1f, %.1f, %.1f }", location, 0x34u);

        }
        -[NTKFaceView device](self, "device");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NTKPhotosDefaultCropForImage(v13, v31);
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;

        objc_msgSend(v10, "photo");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setCrop:", v33, v35, v37, v39);

      }
      -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setPhoto:allowIris:", v10, 1);

      -[NTKPhotosFaceView setPresentedPhoto:](self, "setPresentedPhoto:", v10);
      if (v7)
      {
        -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "isPhotoIris");

        if (v43)
        {
          -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "prepareToPlayWithMode:", 2);

        }
      }
      objc_initWeak((id *)location, self);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __69__NTKPhotosFaceView__displayCachedPhoto_animated_preroll_completion___block_invoke;
      v58[3] = &unk_1E6BD1890;
      objc_copyWeak(&v60, (id *)location);
      v59 = v11;
      v45 = -[NTKPhotosFaceView _updateDateAttributesAnimated:completion:](self, "_updateDateAttributesAnimated:completion:", v8, v58);
      if (NTKInternalBuild(v45, v46) && _os_feature_enabled_impl())
      {
        if (!self->_aplLabel)
        {
          v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
          aplLabel = self->_aplLabel;
          self->_aplLabel = v47;

          objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 20.0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](self->_aplLabel, "setFont:", v49);

          objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](self->_aplLabel, "setTextColor:", v50);

          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setBackgroundColor:](self->_aplLabel, "setBackgroundColor:", v51);

          -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addSubview:", self->_aplLabel);

        }
        v53 = (void *)MEMORY[0x1E0CB3940];
        CLKUIComputeImageAPL();
        objc_msgSend(v53, "stringWithFormat:", CFSTR("APL: %0.2f%%"), v54 * 100.0);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](self->_aplLabel, "setText:", v55);

        -[UILabel sizeToFit](self->_aplLabel, "sizeToFit");
      }

      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)location);
    }

  }
  else if (v11)
  {
    v11[2](v11, 0);
  }

}

void __69__NTKPhotosFaceView__displayCachedPhoto_animated_preroll_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateImageToBlur");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);

}

- (BOOL)_enqueuePreloadedPhoto:(id)a3 ifMatchingGeneration:(unint64_t)a4
{
  id v6;
  unint64_t preloadGeneration;
  id enqueuePreloadedPhotoCompletion;
  void (**v9)(void *, BOOL);
  id v10;

  v6 = a3;
  preloadGeneration = self->_preloadGeneration;
  if (preloadGeneration == a4)
    -[NSMutableArray enqueueCachedPhoto:](self->_preloaded, "enqueueCachedPhoto:", v6);
  enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
  if (enqueuePreloadedPhotoCompletion)
  {
    v9 = (void (**)(void *, BOOL))_Block_copy(enqueuePreloadedPhotoCompletion);
    v10 = self->_enqueuePreloadedPhotoCompletion;
    self->_enqueuePreloadedPhotoCompletion = 0;

    v9[2](v9, preloadGeneration == a4);
  }

  return preloadGeneration == a4;
}

- (id)_dequeueToLoadIfMatchingGeneration:(unint64_t)a3
{
  void *v3;

  if (self->_preloadGeneration == a3)
  {
    -[NSMutableArray dequeueCachedPhoto](self->_toload, "dequeueCachedPhoto");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_startBackgroundRefill
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  void *preloadGeneration;
  unint64_t v7;
  int64_t v8;
  void *v9;
  NTKCachedPhoto *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13[2];
  id buf;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_preloaded, "count");
  v4 = -[NSMutableArray count](self->_toload, "count") + v3;
  if (v4 < 2)
  {
    preloadGeneration = (void *)self->_preloadGeneration;
    v7 = 2 - v4;
    do
    {
      v8 = -[_NTKPhotoIndexGenerator nextSequential](self->_generator, "nextSequential");
      -[NTKPhotosReader objectAtIndexedSubscript:](self->_reader, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NTKCachedPhoto initWithPhoto:index:]([NTKCachedPhoto alloc], "initWithPhoto:index:", v9, v8);
      -[NSMutableArray enqueueCachedPhoto:](self->_toload, "enqueueCachedPhoto:", v10);

      --v7;
    }
    while (v7);
    objc_initWeak(&buf, self);
    if (_NTKPhotosLoadQueue_onceToken != -1)
      dispatch_once(&_NTKPhotosLoadQueue_onceToken, &__block_literal_global_204);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke;
    v12[3] = &unk_1E6BD19B0;
    v11 = (id)_NTKPhotosLoadQueue___photoLoadQueue;
    objc_copyWeak(v13, &buf);
    v13[1] = preloadGeneration;
    dispatch_async(v11, v12);

    objc_destroyWeak(v13);
    objc_destroyWeak(&buf);
  }
  else if (v3 >= 3)
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v3;
      v15 = 1024;
      v16 = 2;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "_preloaded.count (%d) higher than _NTKPhotosMaxPreloadedPhotos (%d)", (uint8_t *)&buf, 0xEu);
    }

  }
}

void __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD block[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v2 = (id *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v4 = MEMORY[0x1E0C80D38];
  do
  {
    WeakRetained = objc_loadWeakRetained(v2);
    if (!WeakRetained)
      break;
    v6 = WeakRetained;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__15;
    v20 = __Block_byref_object_dispose__15;
    v21 = 0;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_71;
    block[3] = &unk_1E6BD1960;
    block[4] = WeakRetained;
    block[5] = &v16;
    block[6] = *(_QWORD *)(a1 + 40);
    dispatch_sync(v4, block);
    v7 = (void *)v17[5];
    if (!v7)
    {
      _Block_object_dispose(&v16, 8);

      return;
    }
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v14 = objc_msgSend(v7, "load") ^ 1;
    if (*((_BYTE *)v12 + 24))
    {
      v8 = 1;
    }
    else
    {
      v10[0] = v3;
      v10[1] = 3221225472;
      v10[2] = __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_2;
      v10[3] = &unk_1E6BD1988;
      v10[4] = v6;
      v10[5] = &v11;
      v9 = *(_QWORD *)(a1 + 40);
      v10[6] = &v16;
      v10[7] = v9;
      dispatch_sync(v4, v10);

      v8 = *((unsigned __int8 *)v12 + 24);
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v16, 8);

  }
  while (!v8);
}

void __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_71(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_dequeueToLoadIfMatchingGeneration:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __43__NTKPhotosFaceView__startBackgroundRefill__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_enqueuePreloadedPhoto:ifMatchingGeneration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (void)_clearPreloaded
{
  id enqueuePreloadedPhotoCompletion;

  -[NSMutableArray removeAllObjects](self->_preloaded, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_toload, "removeAllObjects");
  ++self->_preloadGeneration;
  enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
  self->_enqueuePreloadedPhotoCompletion = 0;

}

- (void)_nextPhotoReadyAnimated:(BOOL)a3 preroll:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSMutableArray *preloaded;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  preloaded = self->_preloaded;
  v9 = a5;
  -[NSMutableArray dequeueCachedPhoto](preloaded, "dequeueCachedPhoto");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKPhotosFaceView _displayCachedPhoto:animated:preroll:completion:](self, "_displayCachedPhoto:animated:preroll:completion:", v10, v6, v5, v9);

  -[NTKPhotosFaceView _startBackgroundRefill](self, "_startBackgroundRefill");
}

- (void)_nextPhotoAnimated:(BOOL)a3 preroll:(BOOL)a4 method:(unint64_t)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v14;
  id enqueuePreloadedPhotoCompletion;
  int64_t v16;
  int64_t v17;
  void *v18;
  NTKCachedPhoto *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int);
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  id v25;
  BOOL v26;
  BOOL v27;
  id location;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (self->_numberOfPhotos)
  {
    if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[NTKPhotosFaceView presentedPhoto](self, "presentedPhoto");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPhotosFaceView _clearPreloaded](self, "_clearPreloaded");
      if (a5 == 3)
      {
        -[_NTKPhotoIndexGenerator reset](self->_generator, "reset");
      }
      else if (self->_numberOfPhotos >= 2 && v12 != 0)
      {
        -[_NTKPhotoIndexGenerator setIndex:](self->_generator, "setIndex:", objc_msgSend(v12, "index"));
      }

    }
    if (-[NSMutableArray count](self->_preloaded, "count"))
    {
      -[NTKPhotosFaceView _nextPhotoReadyAnimated:preroll:completion:](self, "_nextPhotoReadyAnimated:preroll:completion:", v8, v7, v11);
    }
    else
    {
      if (a5 == 2)
      {
        v16 = -[_NTKPhotoIndexGenerator nextRandom](self->_generator, "nextRandom");
      }
      else
      {
        if (!a5)
        {
          objc_initWeak(&location, self);
          v20 = MEMORY[0x1E0C809B0];
          v21 = 3221225472;
          v22 = __66__NTKPhotosFaceView__nextPhotoAnimated_preroll_method_completion___block_invoke;
          v23 = &unk_1E6BD19D8;
          objc_copyWeak(&v25, &location);
          v26 = v8;
          v27 = v7;
          v24 = v11;
          v14 = _Block_copy(&v20);
          enqueuePreloadedPhotoCompletion = self->_enqueuePreloadedPhotoCompletion;
          self->_enqueuePreloadedPhotoCompletion = v14;

          -[NTKPhotosFaceView _startBackgroundRefill](self, "_startBackgroundRefill", v20, v21, v22, v23);
          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);
          goto LABEL_25;
        }
        v16 = -[_NTKPhotoIndexGenerator nextSequential](self->_generator, "nextSequential");
      }
      v17 = v16;
      -[NTKPhotosReader objectAtIndexedSubscript:](self->_reader, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NTKCachedPhoto initWithPhoto:index:]([NTKCachedPhoto alloc], "initWithPhoto:index:", v18, v17);
      if (-[NTKCachedPhoto load](v19, "load"))
      {
        -[NTKPhotosFaceView _displayCachedPhoto:animated:preroll:completion:](self, "_displayCachedPhoto:animated:preroll:completion:", v19, v8, v7, v11);
        -[NTKPhotosFaceView _startBackgroundRefill](self, "_startBackgroundRefill");
      }
      else if (v11)
      {
        v11[2](v11, 0);
      }

    }
  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }
LABEL_25:

}

void __66__NTKPhotosFaceView__nextPhotoAnimated_preroll_method_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_nextPhotoReadyAnimated:preroll:completion:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
}

- (void)_animationFinished:(BOOL)a3
{
  _BOOL4 v3;
  UIView *photoTransitionSnapshotView;
  BOOL v6;

  v3 = a3;
  -[UIView removeFromSuperview](self->_photoTransitionSnapshotView, "removeFromSuperview");
  photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
  self->_photoTransitionSnapshotView = 0;

  *((_BYTE *)self + 1248) &= ~8u;
  if (self->_queuedTransitionCount)
    v6 = !v3;
  else
    v6 = 1;
  if (!v6 && -[NTKFaceView dataMode](self, "dataMode") == 1)
  {
    --self->_queuedTransitionCount;
    -[NTKPhotosFaceView _handleSingleTap:](self, "_handleSingleTap:", 0);
  }
}

- (void)_animationStart
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, 0.95, 0.95);
  v14 = v15;
  -[NTKBasePhotosFaceView cornerView](self, "cornerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  objc_msgSend(v3, "setTransform:", &v13);

  v12 = v15;
  -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  objc_msgSend(v4, "setTransform:", &v11);

  -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__NTKPhotosFaceView__animationStart__block_invoke;
  v10[3] = &unk_1E6BCD5F0;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v10, 0, 0.25, 0.1);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __36__NTKPhotosFaceView__animationStart__block_invoke_2;
  v9[3] = &unk_1E6BCD5F0;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v9, 0, 0.25, 0.0);
  v7[4] = self;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __36__NTKPhotosFaceView__animationStart__block_invoke_3;
  v8[3] = &unk_1E6BCD5F0;
  v8[4] = self;
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __36__NTKPhotosFaceView__animationStart__block_invoke_4;
  v7[3] = &unk_1E6BD05C8;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 131074, v8, v7, 0.8, 0.0);
}

void __36__NTKPhotosFaceView__animationStart__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[3];
  _OWORD v8[2];
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 32), "posterImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v5 = v8[0];
  v8[1] = v6;
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v4 = v9;
  objc_msgSend(v2, "setTransform:", v8);

  objc_msgSend(*(id *)(a1 + 32), "cornerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = v6;
  v7[2] = v4;
  objc_msgSend(v3, "setTransform:", v7);

}

uint64_t __36__NTKPhotosFaceView__animationStart__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1304), "setAlpha:", 0.0);
}

void __36__NTKPhotosFaceView__animationStart__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "posterImageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __36__NTKPhotosFaceView__animationStart__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animationFinished:", a2);
}

- (void)_handleSingleTap:(id)a3
{
  id v4;
  void *v5;
  UIView *v6;
  UIView *photoTransitionSnapshotView;
  void *v8;
  unint64_t queuedTransitionCount;
  _QWORD v10[5];
  id v11;
  id location;

  v4 = a3;
  if (-[NTKBasePhotosFaceView isInteractive](self, "isInteractive")
    && self->_numberOfPhotos >= 2
    && (*((_BYTE *)self + 1248) & 2) == 0)
  {
    if ((*((_BYTE *)self + 1248) & 8) != 0)
    {
      queuedTransitionCount = self->_queuedTransitionCount;
      if (queuedTransitionCount <= 1)
        self->_queuedTransitionCount = queuedTransitionCount + 1;
    }
    else
    {
      *((_BYTE *)self + 1248) |= 8u;
      -[NTKBasePhotosFaceView posterImageView](self, "posterImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "snapshotViewAfterScreenUpdates:", 0);
      v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
      self->_photoTransitionSnapshotView = v6;

      -[UIView setAlpha:](self->_photoTransitionCornerView, "setAlpha:", 1.0);
      -[NTKFaceView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertSubview:belowSubview:", self->_photoTransitionSnapshotView, self->_photoTransitionCornerView);

      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __38__NTKPhotosFaceView__handleSingleTap___block_invoke;
      v10[3] = &unk_1E6BD1A00;
      objc_copyWeak(&v11, &location);
      v10[4] = self;
      -[NTKPhotosFaceView _nextPhotoAnimated:preroll:method:completion:](self, "_nextPhotoAnimated:preroll:method:completion:", 1, 1, 0, v10);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

}

void __38__NTKPhotosFaceView__handleSingleTap___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v6 = objc_msgSend(WeakRetained, "_shouldAnimationContinue:", a2);
    v5 = v9;
    if (v6)
    {
      objc_msgSend(v9, "posterImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPhotoIris");

      if (v8)
        objc_msgSend(*(id *)(a1 + 32), "_playIrisOnSingleTap");
      else
        objc_msgSend(v9, "_animationStart");
      v5 = v9;
    }
  }

}

- (void)_resetTapAnimationState
{
  UIView *photoTransitionSnapshotView;

  -[UIView removeFromSuperview](self->_photoTransitionSnapshotView, "removeFromSuperview");
  photoTransitionSnapshotView = self->_photoTransitionSnapshotView;
  self->_photoTransitionSnapshotView = 0;

  *((_BYTE *)self + 1248) &= ~8u;
  self->_queuedTransitionCount = 0;
}

- (void)_updateDateAttributesAnimated:(BOOL)a3
{
  -[NTKPhotosFaceView _updateDateAttributesAnimated:completion:](self, "_updateDateAttributesAnimated:completion:", a3, 0);
}

- (void)_updateDateAttributesAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  unint64_t currentContent;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *currentAnalysisOperationID;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;
  void (**v27)(_QWORD);
  uint64_t *v28;
  id v29[3];
  BOOL v30;
  id location;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  currentContent = self->_currentContent;
  switch(currentContent)
  {
    case 2uLL:
LABEL_4:
      -[NTKPhotosFaceView presentedPhoto](self, "presentedPhoto");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKPhotosFaceView _analysisCacheKeyFor:](self, "_analysisCacheKeyFor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__15;
      v36 = __Block_byref_object_dispose__15;
      -[NTKPhotosFaceView _cachedAnalysisForKey:](self, "_cachedAnalysisForKey:", v9);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v33[5];
      if (v10)
      {
        -[NTKBasePhotosFaceView _setDateAttributes:animated:](self, "_setDateAttributes:animated:", v10, v4);
      }
      else
      {
        -[NTKPhotosFaceView presentedPhoto](self, "presentedPhoto");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "image");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_initWeak(&location, self);
          currentAnalysisOperationID = (void *)self->_currentAnalysisOperationID;
          -[NTKPhotosFaceView presentedPhoto](self, "presentedPhoto");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "image");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment");
          _NTKPhotosAnalysisQueue();
          v18 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke;
          block[3] = &unk_1E6BD1A50;
          objc_copyWeak(v29, &location);
          v29[1] = currentAnalysisOperationID;
          v28 = &v32;
          v19 = v9;
          v29[2] = v17;
          v25 = v19;
          v26 = v16;
          v30 = v4;
          v27 = v6;
          v20 = v16;
          dispatch_async(v18, block);

          objc_destroyWeak(v29);
          objc_destroyWeak(&location);
LABEL_12:
          _Block_object_dispose(&v32, 8);

          goto LABEL_19;
        }
      }
      if (v6)
        v6[2](v6);
      goto LABEL_12;
    case 1uLL:
      -[NTKPhotosFaceView _analysisForAlignment:](self, "_analysisForAlignment:", -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_9;
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[NTKPhotosFaceView _updateDateAttributesAnimated:completion:].cold.1(self, v21);

      if (NTKInternalBuild(v22, v23))
      {
        +[NTKPhotoAnalysis invalidAnalysis](NTKPhotoAnalysis, "invalidAnalysis");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
LABEL_9:
          -[NTKBasePhotosFaceView _setDateAttributes:animated:](self, "_setDateAttributes:animated:", v11, v4);

        }
      }
      break;
    case 0uLL:
      goto LABEL_4;
  }
  if (v6)
    v6[2](v6);
LABEL_19:

}

void __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[5];
  id v12;
  __int128 v13;
  char v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (objc_msgSend(WeakRetained, "_canOperationProceed:", *(_QWORD *)(a1 + 72)))
  {
    objc_msgSend(WeakRetained, "_createAndCachePhotoAnalysisForKey:dateAlignment:image:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_2;
    block[3] = &unk_1E6BD1A28;
    block[4] = WeakRetained;
    v12 = *(id *)(a1 + 40);
    v14 = *(_BYTE *)(a1 + 88);
    v8 = *(_OWORD *)(a1 + 48);
    v6 = (id)v8;
    v13 = v8;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

    v7 = v12;
LABEL_5:

    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_3;
    v9[3] = &unk_1E6BCDF60;
    v10 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v9);
    v7 = v10;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_operationIsDone");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "presentedPhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
    objc_msgSend(*(id *)(a1 + 32), "_setDateAttributes:animated:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(unsigned __int8 *)(a1 + 64));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__NTKPhotosFaceView__updateDateAttributesAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_canOperationProceed:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  _NTKPhotosAnalysisQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NTKPhotosFaceView__canOperationProceed___block_invoke;
  block[3] = &unk_1E6BD1A78;
  block[5] = &v8;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

_QWORD *__42__NTKPhotosFaceView__canOperationProceed___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if ((*(_BYTE *)(v1 + 1248) & 4) == 0 && result[6] == *(_QWORD *)(v1 + 1280))
  {
    *(_BYTE *)(v1 + 1248) |= 4u;
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)_operationIsDone
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  ++self->_currentAnalysisOperationID;
  *((_BYTE *)self + 1248) &= ~4u;
}

- (void)_updateContents:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKPhotosFaceView: _updateContents", v6, 2u);
  }

  if ((*((_BYTE *)self + 1248) & 1) != 0)
  {
    -[NTKPhotosFaceView _updateReader:](self, "_updateReader:", v3);
    -[NTKBasePhotosFaceView setNoPhotosViewVisible:](self, "setNoPhotosViewVisible:", self->_numberOfPhotos == 0);
    -[NTKPhotosFaceView _nextPhotoAnimated:preroll:method:completion:](self, "_nextPhotoAnimated:preroll:method:completion:", -[NTKBasePhotosFaceView isInteractive](self, "isInteractive"), 0, 3, 0);
  }
}

- (void)_updateReader:(BOOL)a3
{
  NSObject *v4;
  NTKPhotosReader *v5;
  void *generator;
  NTKPhotosReader *reader;
  void *v9;
  char v10;
  NSObject *p_super;
  unint64_t currentContent;
  NTKPhotosReader *v13;
  NTKPhotosReader *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t numberOfPhotos;
  _NTKPhotoIndexGenerator *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_currentContent != 2989)
  {
    -[NTKFaceView resourceDirectory](self, "resourceDirectory");
    generator = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
      reader = self->_reader;
      if (reader)
      {
        -[NTKPhotosReader resourceDirectory](reader, "resourceDirectory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = NTKEqualStrings(v9, generator);

        if ((v10 & 1) != 0)
        {
          _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v21) = 0;
            _os_log_impl(&dword_1B72A3000, p_super, OS_LOG_TYPE_DEFAULT, "_updateReader: resource dir didn't change; re-using existing reader",
              (uint8_t *)&v21,
              2u);
          }
LABEL_24:

          goto LABEL_25;
        }
      }
    }
    -[NTKPhotosFaceView _clearPreloaded](self, "_clearPreloaded");
    currentContent = self->_currentContent;
    if (currentContent)
    {
      if (currentContent == 1)
      {
        +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", generator);
        v13 = (NTKPhotosReader *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (currentContent != 2)
          goto LABEL_17;
        +[NTKPhotosReader readerForMemoriesWithResourceDirectory:](NTKPhotosReader, "readerForMemoriesWithResourceDirectory:", generator);
        v13 = (NTKPhotosReader *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[NTKPhotosReader readerForSyncedAlbumWithResourceDirectory:](NTKPhotosReader, "readerForSyncedAlbumWithResourceDirectory:", generator);
      v13 = (NTKPhotosReader *)objc_claimAutoreleasedReturnValue();
    }
    v14 = self->_reader;
    self->_reader = v13;

LABEL_17:
    -[NTKPhotosReader setDelegate:](self->_reader, "setDelegate:", self);
    v15 = -[NTKPhotosReader count](self->_reader, "count");
    self->_numberOfPhotos = v15;
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        numberOfPhotos = self->_numberOfPhotos;
        v21 = 138412546;
        v22 = generator;
        v23 = 2048;
        v24 = numberOfPhotos;
        _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "_updateReader: new reader for resource directory %@ (%ld)", (uint8_t *)&v21, 0x16u);
      }

      v19 = -[_NTKPhotoIndexGenerator initWithSize:]([_NTKPhotoIndexGenerator alloc], "initWithSize:", self->_numberOfPhotos);
      p_super = &self->_generator->super;
      self->_generator = v19;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[NTKPhotosFaceView _updateReader:].cold.2((uint64_t)generator, v17, v20);

      p_super = &self->_generator->super;
      self->_generator = 0;
    }
    goto LABEL_24;
  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[NTKPhotosFaceView _updateReader:].cold.1(v4);

  -[NTKPhotosFaceView _clearPreloaded](self, "_clearPreloaded");
  self->_numberOfPhotos = 0;
  v5 = self->_reader;
  self->_reader = 0;

  generator = self->_generator;
  self->_generator = 0;
LABEL_25:

}

- (id)_analysisForAlignment:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[NTKPhotosFaceView presentedPhoto](self, "presentedPhoto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analysisForAlignment:deviceSizeClass:", a3, self->_deviceSizeClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_analysisCacheKeyFor:(id)a3
{
  void *v4;
  unint64_t v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "photo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTKBasePhotosFaceView dateAlignment](self, "dateAlignment");
  switch(CLKDeviceCategoryForSizeClass())
  {
    case 1:
      v6 = v5 == 0;
      v7 = 66;
      v8 = 84;
      goto LABEL_8;
    case 2:
      v6 = v5 == 0;
      v7 = 82;
      v8 = 76;
      goto LABEL_8;
    case 3:
      v6 = v5 == 0;
      v7 = 83;
      v8 = 70;
      goto LABEL_8;
    case 4:
      v6 = v5 == 0;
      v7 = 79;
      v8 = 73;
      goto LABEL_8;
    case 5:
      v6 = v5 == 0;
      v7 = 68;
      v8 = 85;
LABEL_8:
      if (v6)
        v9 = v8;
      else
        v9 = v7;
      break;
    default:
      v9 = 45;
      break;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@~%@~%u~%c"), v11, v12, 1, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_cachedAnalysisForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[NTKPhotoAnalysisFileCache sharedInstance](NTKPhotoAnalysisFileCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoAnalysisForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createAndCachePhotoAnalysisForKey:(id)a3 dateAlignment:(unint64_t)a4 image:(id)a5
{
  unint64_t deviceSizeClass;
  id v8;
  void *v9;
  void *v10;

  deviceSizeClass = self->_deviceSizeClass;
  v8 = a3;
  +[NTKPhotoAnalysis analysisWithImage:alignment:deviceSizeClass:](NTKPhotoAnalysis, "analysisWithImage:alignment:deviceSizeClass:", a5, a4, deviceSizeClass);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPhotoAnalysisFileCache sharedInstance](NTKPhotoAnalysisFileCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPhotoAnalysis:forIdentifier:", v9, v8);

  return v9;
}

- (NTKCachedPhoto)presentedPhoto
{
  return self->_presentedPhoto;
}

- (void)setPresentedPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPhoto, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedPhoto, 0);
  objc_storeStrong((id *)&self->_aplLabel, 0);
  objc_storeStrong((id *)&self->_toload, 0);
  objc_storeStrong((id *)&self->_preloaded, 0);
  objc_storeStrong(&self->_enqueuePreloadedPhotoCompletion, 0);
  objc_storeStrong((id *)&self->_photoTransitionCornerView, 0);
  objc_storeStrong((id *)&self->_photoTransitionSnapshotView, 0);
  objc_storeStrong((id *)&self->_singleTapGesture, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_updateDateAttributesAnimated:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "presentedPhoto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v6, "photo analysis missing for %@", (uint8_t *)&v7);

}

- (void)_updateReader:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKPhotosFaceView: _createReader: _currentContent has not yet been set; no photos today!",
    v1,
    2u);
}

- (void)_updateReader:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "_updateReader: new reader for resource directory %@ is empty!", (uint8_t *)&v3);
}

@end
