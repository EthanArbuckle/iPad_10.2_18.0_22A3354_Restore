@implementation NUMediaViewRenderer

- (CGRect)convertRect:(CGRect)a3 fromImageToView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  NUMediaView **p_mediaView;
  id v9;
  id WeakRetained;
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
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_mediaView = &self->_mediaView;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  objc_msgSend(WeakRetained, "_renderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_containerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertRect:toLayer:", v13, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

uint64_t __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(MEMORY[0x24BE6C400], "begin");
  v2 = objc_msgSend(*(id *)(a1 + 40), "mediaType");
  v3 = *(void **)(a1 + 32);
  if (v2 == 2)
  {
    objc_msgSend(v3, "_backfillRenderRequestForComposition:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", CFSTR("NUMediaViewRenderer-zoomedToFit"));
    v5 = *(_QWORD **)(a1 + 32);
    v6 = (void *)v5[2];
    objc_msgSend(v5, "_videoFrameImageRenderResponseHandler");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v3, "isZoomedToFit") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_zoomRenderRequestForComposition:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setName:", CFSTR("NUMediaViewRenderer-roi"));
      v9 = *(_QWORD **)(a1 + 32);
      v10 = (void *)v9[1];
      objc_msgSend(v9, "_zoomRenderResponseHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "submitGenericRequest:completion:", v8, v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "_backfillRenderRequestForComposition:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", CFSTR("NUMediaViewRenderer-zoomedToFit"));
    v12 = *(_QWORD **)(a1 + 32);
    v6 = (void *)v12[2];
    objc_msgSend(v12, "_backfillRenderResponseHandler");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v7;
  objc_msgSend(v6, "submitGenericRequest:completion:", v4, v7);

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(v14 + 112);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke_2;
  v17[3] = &unk_24C625740;
  v17[4] = v14;
  return objc_msgSend(MEMORY[0x24BE6C400], "commitAndNotifyOnQueue:withBlock:", v15, v17);
}

- (id)_backfillRenderRequestForComposition:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x24BE6C388];
  v5 = a3;
  v6 = [v4 alloc];
  -[NUMediaViewRenderer targetSize](self, "targetSize");
  v7 = (void *)objc_msgSend(v6, "initWithTargetSize:");
  v8 = (void *)objc_opt_new();
  v9 = -[NUMediaViewRenderer newRenderRequestForComposition:scalePolicy:regionPolicy:](self, "newRenderRequestForComposition:scalePolicy:regionPolicy:", v5, v7, v8);

  return v9;
}

- (CGSize)targetSize
{
  id WeakRetained;
  void *v4;
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
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGAffineTransform v28;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NUMediaViewRenderer _scrollBounds](self, "_scrollBounds");
    v6 = v5;
    v8 = v7;
    objc_msgSend(WeakRetained, "edgeInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(WeakRetained, "_renderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_roiLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nu_contentsAreFlipped");
    if (v6 - (v16 + v12) > 0.0)
      v19 = v6 - (v16 + v12);
    else
      v19 = 0.0;
    if (v8 - (v10 + v14) > 0.0)
      v20 = v8 - (v10 + v14);
    else
      v20 = 0.0;

    CGAffineTransformMakeScale(&v28, self->_backingScale, self->_backingScale);
    v21 = v20 * v28.c + v28.a * v19;
    v22 = v20 * v28.d + v28.b * v19;
  }
  else
  {
    v21 = *MEMORY[0x24BDBF148];
    v22 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v23 = v21 < 1.0;
  if (v22 < 1.0)
    v23 = 1;
  if (v23)
    v24 = 768.0;
  else
    v24 = v22;
  if (v23)
    v25 = 1024.0;
  else
    v25 = v21;

  v26 = v25;
  v27 = v24;
  result.height = v27;
  result.width = v26;
  return result;
}

- (id)newRenderRequestForComposition:(id)a3 scalePolicy:(id)a4 regionPolicy:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v8 = (objc_class *)MEMORY[0x24BE6C410];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithComposition:", v11);

  objc_msgSend(v12, "setScalePolicy:", v10);
  objc_msgSend(v12, "setRegionPolicy:", v9);

  -[NUMediaViewRenderer colorSpace](self, "colorSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NUMediaViewRenderer colorSpace](self, "colorSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColorSpace:", v14);

  }
  -[NUMediaViewRenderer pixelFormat](self, "pixelFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NUMediaViewRenderer pixelFormat](self, "pixelFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPixelFormat:", v16);

  }
  -[NUMediaViewRenderer displayMaximumEDRHeadroom](self, "displayMaximumEDRHeadroom");
  if (v17 > 1.0)
  {
    -[NUMediaViewRenderer displayMaximumEDRHeadroom](self, "displayMaximumEDRHeadroom");
    objc_msgSend(v12, "setMaxEDRHeadroom:");
    -[NUMediaViewRenderer displayCurrentEDRHeadroom](self, "displayCurrentEDRHeadroom");
    objc_msgSend(v12, "setCurrentEDRHeadroom:");
  }
  -[NUMediaViewRenderer pipelineFilters](self, "pipelineFilters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPipelineFilters:", v18);

  v24 = 0uLL;
  v25 = 0;
  -[NUAVPlayerController player](self->_nuAVPlayerController, "player");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "currentTime");
  }
  else
  {
    v24 = 0uLL;
    v25 = 0;
  }

  if ((BYTE12(v24) & 1) != 0)
  {
    v22 = v24;
    v23 = v25;
    objc_msgSend(v12, "setTime:", &v22);
  }
  return v12;
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (CGRect)_scrollBounds
{
  id WeakRetained;
  void *v3;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (id)_backfillRenderResponseHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke;
  v3[3] = &unk_24C625790;
  v3[4] = self;
  return (id)MEMORY[0x212B9F6E4](v3, a2);
}

- (int64_t)playbackMode
{
  return self->_playbackMode;
}

- (void)updateComposition:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NUMediaViewRenderer *v19;
  SEL v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  -[NUMediaViewRenderer mediaView](self, "mediaView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_displayType == 2
    || objc_msgSend(v21, "mediaType") == 3
    && objc_msgSend(v4, "loopsVideoPlayback")
    && objc_msgSend(v4, "isVideoEnabled"))
  {
    objc_msgSend(v21, "setMediaType:", 2);
  }
  v5 = objc_msgSend(v21, "mediaType");
  if (!self->_displayType)
    -[NUMediaViewRenderer _updateDisplayForMediaType:](self, "_updateDisplayForMediaType:", v5);
  switch(v5)
  {
    case 0:
      NUAssertLogger_439();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown mediaType for composition: %@"), v21);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v7;
        _os_log_error_impl(&dword_20D1BC000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v8 = (const void **)MEMORY[0x24BE6C280];
      specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
      NUAssertLogger_439();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v11)
        {
          v14 = dispatch_get_specific(*v8);
          v15 = (void *)MEMORY[0x24BDD17F0];
          v16 = v14;
          objc_msgSend(v15, "callStackSymbols");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v14;
          v24 = 2114;
          v25 = v18;
          _os_log_error_impl(&dword_20D1BC000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v13;
        _os_log_error_impl(&dword_20D1BC000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      v19 = (NUMediaViewRenderer *)_NUAssertFailHandler();
      -[NUMediaViewRenderer composition](v19, v20);
      return;
    case 1:
      -[NUMediaViewRenderer _updateImageRenderForComposition:](self, "_updateImageRenderForComposition:", v21);
      goto LABEL_14;
    case 2:
      if (-[NUMediaViewRenderer canRenderVideoLive](self, "canRenderVideoLive"))
      {
        -[NUMediaViewRenderer _updateVideoComposition:](self, "_updateVideoComposition:", v21);
      }
      else
      {
        -[NUAVPlayerController pause](self->_nuAVPlayerController, "pause");
        -[NUMediaViewRenderer _updateImageRenderForComposition:](self, "_updateImageRenderForComposition:", v21);
        -[NUMediaViewRenderer _coalesceUpdateVideoComposition:](self, "_coalesceUpdateVideoComposition:", v21);
      }
      goto LABEL_14;
    case 3:
      -[NUMediaViewRenderer _updateImageRenderForComposition:](self, "_updateImageRenderForComposition:", v21);
      -[NUMediaViewRenderer _coalesceUpdateLivePhotoComposition:](self, "_coalesceUpdateLivePhotoComposition:", v21);
      goto LABEL_14;
    default:
LABEL_14:

      return;
  }
}

- (NUComposition)composition
{
  return self->_composition;
}

- (NUMediaView)mediaView
{
  return (NUMediaView *)objc_loadWeakRetained((id *)&self->_mediaView);
}

- (void)_updateImageRenderForComposition:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[5];
  id v8;

  v4 = a3;
  activity = _os_activity_create(&dword_20D1BC000, "Update Composition", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke;
  block[3] = &unk_24C625768;
  block[4] = self;
  v8 = v4;
  v5 = v4;
  os_activity_apply(activity, block);

}

- (void)_updateDisplayForMediaType:(int64_t)a3
{
  NSObject *v3;
  void *v4;
  const void **v5;
  void *specific;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NUMediaViewRenderer *v16;
  SEL v17;
  unint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 1) >= 3)
  {
    NUAssertLogger_439();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We must have a known display type"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v4;
      _os_log_error_impl(&dword_20D1BC000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v19, 0xCu);

    }
    v5 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_439();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific(*v5);
        v12 = (void *)MEMORY[0x24BDD17F0];
        v13 = v11;
        objc_msgSend(v12, "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v11;
        v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v19, 0x16u);

      }
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v19, 0xCu);

    }
    v16 = (NUMediaViewRenderer *)_NUAssertFailHandler();
    -[NUMediaViewRenderer _setDisplayType:](v16, v17, v18);
  }
  else
  {
    -[NUMediaViewRenderer _setDisplayType:](self, "_setDisplayType:");
  }
}

- (void)_setDisplayType:(unint64_t)a3
{
  void *v5;
  UIView *v6;
  void *v7;
  NULivePhotoRenderClient *v8;
  NUVideoRenderClient *videoClient;
  void *v10;
  UIView *livePhotoView;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NULivePhotoRenderClient *livePhotoClient;
  void *v17;
  NUVideoRenderClient *v18;
  id v19;
  NULivePhotoRenderClient *v20;
  NULivePhotoRenderClient *v21;
  NULivePhotoRenderClient *v22;
  _QWORD v23[4];
  id v24;
  id location;

  if (self->_computedDisplayType != a3)
  {
    -[NUMediaViewRenderer mediaView](self, "mediaView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self->_livePhotoView;
    if (a3 != 3)
    {
      if (a3 == 2)
      {
        objc_msgSend(v5, "_renderView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setHidden:", 0);

        objc_msgSend(v5, "_videoPlayerView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_renderView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", v14);

        -[NUMediaViewRenderer _addFullExtentConstraintsForView:](self, "_addFullExtentConstraintsForView:", v14);
        -[NUMediaViewRenderer _setupAVPlayerController](self, "_setupAVPlayerController");
        if (v6)
          -[UIView setHidden:](v6, "setHidden:", 1);
        -[NULivePhotoRenderClient cancel](self->_livePhotoClient, "cancel");
        livePhotoClient = self->_livePhotoClient;
        self->_livePhotoClient = 0;

      }
      else if (a3 == 1)
      {
        objc_msgSend(v5, "_renderView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setHidden:", 0);

        -[NUMediaViewRenderer _tearDownAVPlayerController](self, "_tearDownAVPlayerController");
        objc_msgSend(v5, "_rendererDidCreateAVPlayerController:", 0);
        if (v6)
          -[UIView setHidden:](v6, "setHidden:", 1);
        -[NULivePhotoRenderClient cancel](self->_livePhotoClient, "cancel");
        v8 = self->_livePhotoClient;
        self->_livePhotoClient = 0;

        -[NUVideoRenderClient cancel](self->_videoClient, "cancel");
        videoClient = self->_videoClient;
        self->_videoClient = 0;

      }
LABEL_18:
      self->_computedDisplayType = a3;

      return;
    }
    objc_msgSend(v5, "_renderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

    -[NUMediaViewRenderer _tearDownAVPlayerController](self, "_tearDownAVPlayerController");
    objc_msgSend(v5, "_rendererDidCreateAVPlayerController:", 0);
    if (v6)
    {
      livePhotoView = v6;
      v12 = 0;
    }
    else
    {
      objc_msgSend(v5, "_livePhotoView");
      v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_16;
      objc_msgSend(v5, "_renderView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", v6);

      -[NUMediaViewRenderer _addFullExtentConstraintsForView:](self, "_addFullExtentConstraintsForView:", v6);
      objc_storeStrong((id *)&self->_livePhotoView, v6);
      -[UIView performSelector:withObject:](self->_livePhotoView, "performSelector:withObject:", sel_setDelegate_, self);
      livePhotoView = self->_livePhotoView;
      v12 = 1;
    }
    -[UIView setHidden:](livePhotoView, "setHidden:", v12);
LABEL_16:
    -[NUVideoRenderClient cancel](self->_videoClient, "cancel");
    v18 = self->_videoClient;
    self->_videoClient = 0;

    if (!self->_livePhotoClient)
    {
      v19 = objc_alloc(MEMORY[0x24BE6C3C0]);
      v20 = (NULivePhotoRenderClient *)objc_msgSend(v19, "initWithName:responseQueue:", CFSTR("NUMediaViewRenderer-LivePhotoClient"), MEMORY[0x24BDAC9B8]);
      v21 = self->_livePhotoClient;
      self->_livePhotoClient = v20;

      objc_initWeak(&location, self);
      v22 = self->_livePhotoClient;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __39__NUMediaViewRenderer__setDisplayType___block_invoke;
      v23[3] = &unk_24C6257E0;
      objc_copyWeak(&v24, &location);
      -[NULivePhotoRenderClient setCompletionBlock:](v22, "setCompletionBlock:", v23);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    goto LABEL_18;
  }
}

- (void)_updateBackfillLayerWithLatestRenderResponse
{
  NSObject *renderQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__485;
  v9 = __Block_byref_object_dispose__486;
  v10 = 0;
  renderQueue = self->_renderQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__NUMediaViewRenderer__updateBackfillLayerWithLatestRenderResponse__block_invoke;
  v4[3] = &unk_24C6257B8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(renderQueue, v4);
  if (v6[5])
    -[NUMediaViewRenderer _updateBackfillLayerWithRenderResponse:](self, "_updateBackfillLayerWithRenderResponse:");
  _Block_object_dispose(&v5, 8);

}

- (void)_updateBackfillLayerWithRenderResponse:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NURenderStatistics *v8;
  NURenderStatistics *lastBackfillRenderStatictics;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_renderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_backfillLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUMediaViewRenderer _updateImageLayer:withRenderResponse:](self, "_updateImageLayer:withRenderResponse:", v7, v11);
    v8 = (NURenderStatistics *)objc_claimAutoreleasedReturnValue();
    lastBackfillRenderStatictics = self->_lastBackfillRenderStatictics;
    self->_lastBackfillRenderStatictics = v8;

    objc_msgSend(WeakRetained, "_livePhotoView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

  }
}

- (id)_updateImageLayer:(id)a3 withRenderResponse:(id)a4
{
  unint64_t v4;
  NSObject *v7;
  id specific;
  void *WeakRetained;
  char **__ptr32 *v10;
  const void **v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v17;
  const void **v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  const void **v23;
  __int16 v24;
  const void **v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  specific = a4;
  WeakRetained = (void *)0x24BDD1000;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    NUAssertLogger_439();
    v17 = objc_claimAutoreleasedReturnValue();
    v10 = &off_20D1D4000;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("This code must be running on the main thread"));
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_error_impl(&dword_20D1BC000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v11 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_439();
    v7 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        specific = dispatch_get_specific(*v11);
        v20 = (void *)MEMORY[0x24BDD17F0];
        v10 = (char **__ptr32 *)specific;
        objc_msgSend(v20, "callStackSymbols");
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "componentsJoinedByString:", CFSTR("\n"));
        v11 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = (const void **)specific;
        v24 = 2114;
        v25 = v11;
        _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = (const void **)WeakRetained;
      _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_17:
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
    goto LABEL_5;
  }
  v4 = 0x24BDE5000uLL;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  v21 = 0;
  objc_msgSend(specific, "result:", &v21);
  v10 = (char **__ptr32 *)objc_claimAutoreleasedReturnValue();
  v11 = (const void **)v21;
  if (v10)
  {
    objc_msgSend(v10, "geometry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setImage:](v7, "setImage:", v13);

    -[NUMediaViewRenderer _renderFinishedWithGeometry:layer:](self, "_renderFinishedWithGeometry:layer:", v12, v7);
    objc_msgSend(v10, "statistics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (*MEMORY[0x24BE6C478] != -1)
    goto LABEL_17;
LABEL_5:
  v15 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v11;
    _os_log_error_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);
  }
  -[NSObject setImage:](v7, "setImage:", 0);
  v14 = 0;
LABEL_8:
  objc_msgSend(WeakRetained, "_rendererDidFinishWithStatistics:", v14);
  objc_msgSend(*(id *)(v4 + 2008), "commit");

  return v14;
}

- (void)_renderFinishedWithGeometry:(id)a3 layer:(id)a4
{
  double v4;
  NSObject *v7;
  id specific;
  const void **v9;
  char **__ptr32 *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double maximumZoomScale;
  void *v17;
  double v18;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  NSObject *v39;
  NUMediaViewRenderer *v40;
  NUMediaViewRenderer *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  uint8_t buf[4];
  double v48;
  __int16 v49;
  NUMediaViewRenderer *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  specific = a4;
  -[NUMediaViewRenderer mediaView](self, "mediaView");
  v9 = (const void **)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_renderView");
  v10 = (char **__ptr32 *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_backfillLayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NSObject scaledSize](v7, "scaledSize");
  if (-[NUMediaViewRenderer isZoomedToFit](self, "isZoomedToFit") && v12 == specific)
  {
    -[NSObject renderScale](v7, "renderScale");
    if ((NUScaleCompare() & 0x8000000000000000) == 0)
    {
      -[NUMediaViewRenderer targetSize](self, "targetSize");
      NUPixelSizeFromCGSize();
      NUScaleToFitSizeInSize();
    }
    NUScaleToDouble();
    v4 = v13;
    objc_msgSend(v9, "setScrollUpdatesSuppressed:", 1);
    objc_msgSend(v11, "minimumZoomScale");
    if (vabdd_f64(v14, v4) > 0.00000011920929
      || (objc_msgSend(v11, "zoomScale"), vabdd_f64(v15, v4) > 0.00000011920929)
      || (objc_msgSend(v11, "maximumZoomScale"), vabdd_f64(v37, v4) > 0.00000011920929)
      && (objc_msgSend(v11, "maximumZoomScale"), vabdd_f64(v38, self->_maximumZoomScale) > 0.00000011920929))
    {
      objc_msgSend(v11, "setMinimumZoomScale:", 1.17549435e-38);
      objc_msgSend(v11, "setMaximumZoomScale:", 3.40282347e38);
      objc_msgSend(v11, "setMinimumZoomScale:", v4);
      maximumZoomScale = self->_maximumZoomScale;
      if (v4 >= maximumZoomScale)
        maximumZoomScale = v4;
      objc_msgSend(v11, "setMaximumZoomScale:", maximumZoomScale);
      objc_msgSend(v11, "setZoomScale:", v4);
      if (*MEMORY[0x24BE6C478] == -1)
        goto LABEL_10;
      goto LABEL_32;
    }
  }
  while (1)
  {
    objc_msgSend(v10, "setGeometry:", v7);
    if (specific)
      break;
    NUAssertLogger_439();
    v43 = objc_claimAutoreleasedReturnValue();
    v10 = &off_20D1D4000;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("nil render layer"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = *(double *)&v44;
      _os_log_error_impl(&dword_20D1BC000, v43, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v9 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_439();
    v7 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        specific = dispatch_get_specific(*v9);
        v46 = (void *)MEMORY[0x24BDD17F0];
        v10 = (char **__ptr32 *)specific;
        objc_msgSend(v46, "callStackSymbols");
        v9 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
        self = (NUMediaViewRenderer *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = *(double *)&specific;
        v49 = 2114;
        v50 = self;
        _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v45)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      specific = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specific, "componentsJoinedByString:", CFSTR("\n"));
      v9 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = *(double *)&v9;
      _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_32:
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
LABEL_10:
    v17 = (void *)*MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      v39 = v17;
      objc_msgSend(v11, "minimumZoomScale");
      v41 = v40;
      objc_msgSend(v11, "maximumZoomScale");
      *(_DWORD *)buf = 134218496;
      v48 = v4;
      v49 = 2048;
      v50 = v41;
      v51 = 2048;
      v52 = v42;
      _os_log_debug_impl(&dword_20D1BC000, v39, OS_LOG_TYPE_DEBUG, "renderedScale = %g, minimumScale = %g, maximumScale = %g", buf, 0x20u);

    }
  }
  v18 = *MEMORY[0x24BDBEFB0];
  v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(specific, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], v19);
  objc_msgSend(specific, "setGeometry:", v7);
  NUPixelSizeToCGRect();
  if (v12 == specific)
  {
    v28 = v20;
    v29 = v21;
    v30 = v22;
    v31 = v23;
    objc_msgSend(specific, "bounds");
    if (vabdd_f64(v32, v28) > 0.00000011920929
      || (objc_msgSend(specific, "bounds"), vabdd_f64(v33, v29) > 0.00000011920929)
      || (objc_msgSend(specific, "bounds"), vabdd_f64(v34, v30) > 0.00000011920929)
      || (objc_msgSend(specific, "bounds"), vabdd_f64(v35, v31) > 0.00000011920929))
    {
      objc_msgSend(specific, "setBounds:", v28, v29, v30, v31);
      objc_msgSend(specific, "setPosition:", v18, v19);
    }
  }
  else
  {
    -[NUMediaViewRenderer _scrollBounds](self, "_scrollBounds");
    v25 = v24;
    v27 = v26;
    objc_msgSend(v10, "convertRect:fromView:", v11);
    objc_msgSend(v10, "convertRectToImage:");
    objc_msgSend(specific, "setPosition:");
    objc_msgSend(specific, "setBounds:", 0.0, 0.0, v25 * self->_backingScale, v27 * self->_backingScale);
  }
  objc_msgSend(v10, "_roiLayer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setHidden:", -[NUMediaViewRenderer isZoomedToFit](self, "isZoomedToFit"));

  objc_msgSend(v9, "setScrollUpdatesSuppressed:", 0);
}

- (BOOL)isZoomedToFit
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoomScale");
  v5 = v4;
  objc_msgSend(v3, "minimumZoomScale");
  LOBYTE(WeakRetained) = v5 == v6;

  return (char)WeakRetained;
}

- (void)setComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setPlaybackRate:(double)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  id v11;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rate");
    v7 = v6;

    v4 = v11;
    if (v7 != a3)
    {
      objc_msgSend(v11, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a3;
      *(float *)&v10 = v8;
      objc_msgSend(v9, "setRate:", v10);

      v4 = v11;
    }
  }

}

- (void)pause
{
  -[NUMediaViewRenderer setPlaybackRate:](self, "setPlaybackRate:", 0.0);
}

- (NUAVPlayerController)nuAVPlayerController
{
  return self->_nuAVPlayerController;
}

- (void)setPixelFormat:(id)a3
{
  objc_storeStrong((id *)&self->_pixelFormat, a3);
}

- (void)setBackingScale:(double)a3
{
  self->_backingScale = a3;
}

- (NUMediaViewRenderer)initWithMediaView:(id)a3
{
  id v3;
  NUMediaViewRenderer *v4;
  dispatch_group_t v5;
  OS_dispatch_group *renderGroup;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *renderQueue;
  id v10;
  uint64_t v11;
  NUSurfaceRenderClient *zoomClient;
  NUSurfaceRenderClient *v13;
  void *v14;
  uint64_t v15;
  NUSurfaceRenderClient *backfillClient;
  NUSurfaceRenderClient *v17;
  void *v18;
  uint64_t v19;
  NUCoalescer *livePhotoUpdateCoalescer;
  uint64_t v21;
  NUCoalescer *videoUpdateCoalescer;
  void *v23;
  NUObservatory *v24;
  NUObservatory *observatory;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NUMediaViewRenderer;
  v3 = a3;
  v4 = -[NUMediaViewRenderer init](&v27, sel_init);
  v5 = dispatch_group_create();
  renderGroup = v4->_renderGroup;
  v4->_renderGroup = (OS_dispatch_group *)v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("View Controller Image Response", v7);
  renderQueue = v4->_renderQueue;
  v4->_renderQueue = (OS_dispatch_queue *)v8;

  v10 = objc_alloc(MEMORY[0x24BE6C408]);
  v11 = objc_msgSend(v10, "initWithName:responseQueue:", CFSTR("NUMediaViewRenderer-roi"), v4->_renderQueue, v27.receiver, v27.super_class);
  zoomClient = v4->_zoomClient;
  v4->_zoomClient = (NUSurfaceRenderClient *)v11;

  -[NUSurfaceRenderClient setShouldCoalesceUpdates:](v4->_zoomClient, "setShouldCoalesceUpdates:", 1);
  v13 = v4->_zoomClient;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 0);
  -[NUSurfaceRenderClient setPriority:](v13, "setPriority:", v14);

  v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE6C408]), "initWithName:responseQueue:", CFSTR("NUMediaViewRenderer-zoomedToFit"), v4->_renderQueue);
  backfillClient = v4->_backfillClient;
  v4->_backfillClient = (NUSurfaceRenderClient *)v15;

  -[NUSurfaceRenderClient setShouldCoalesceUpdates:](v4->_backfillClient, "setShouldCoalesceUpdates:", 1);
  v17 = v4->_backfillClient;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 1);
  -[NUSurfaceRenderClient setPriority:](v17, "setPriority:", v18);

  v4->_backingScale = 1.0;
  v4->_maximumZoomScale = 1.0;
  objc_storeWeak((id *)&v4->_mediaView, v3);

  v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE6C378]), "initWithDelay:", 0.25);
  livePhotoUpdateCoalescer = v4->_livePhotoUpdateCoalescer;
  v4->_livePhotoUpdateCoalescer = (NUCoalescer *)v19;

  v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE6C378]), "initWithDelay:", 0.5);
  videoUpdateCoalescer = v4->_videoUpdateCoalescer;
  v4->_videoUpdateCoalescer = (NUCoalescer *)v21;

  objc_msgSend(MEMORY[0x24BE6C3E0], "currentPlatform");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_canRenderLoopingVideoLive = objc_msgSend(v23, "supportsLiveVideoRendering");

  v24 = (NUObservatory *)objc_alloc_init(MEMORY[0x24BE6C3D0]);
  observatory = v4->_observatory;
  v4->_observatory = v24;

  return v4;
}

- (NUMediaViewRenderer)init
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)MEMORY[0x24BE6C478];
  if (*MEMORY[0x24BE6C478] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x24BE6C468];
    v5 = (void *)*MEMORY[0x24BE6C468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C468], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_20D1BC000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_420);
LABEL_7:
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x24BDD17F0];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_420);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
    {
      goto LABEL_7;
    }
    v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
      v20 = (void *)MEMORY[0x24BDD17F0];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_20D1BC000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_420);
  }
}

- (void)beginPanning
{
  self->_isPanning = 1;
  -[NUMediaViewRenderer _beginAnimating](self, "_beginAnimating");
}

- (void)endPanning
{
  -[NUMediaViewRenderer _endAnimating](self, "_endAnimating");
  self->_isPanning = 0;
}

- (void)beginZooming
{
  id WeakRetained;
  void *v4;
  double v5;

  self->_isZooming = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomScale");
  self->_lastZoomScale = v5;

  -[NUMediaViewRenderer _beginAnimating](self, "_beginAnimating");
}

- (void)endZooming
{
  -[NUMediaViewRenderer _endAnimating](self, "_endAnimating");
  self->_isZooming = 0;
  self->_lastZoomScale = 0.0;
}

- (void)_beginAnimating
{
  NUSurfaceRenderClient *zoomClient;
  void *v4;
  NUSurfaceRenderClient *backfillClient;
  void *v6;
  double v7;

  zoomClient = self->_zoomClient;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 2);
  -[NUSurfaceRenderClient setPriority:](zoomClient, "setPriority:", v4);

  backfillClient = self->_backfillClient;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 3);
  -[NUSurfaceRenderClient setPriority:](backfillClient, "setPriority:", v6);

  NUAbsoluteTime();
  self->_lastZoomRenderTime = v7;
}

- (void)_endAnimating
{
  NUSurfaceRenderClient *zoomClient;
  void *v4;
  NUSurfaceRenderClient *backfillClient;
  id v6;

  self->_lastZoomRenderTime = 0.0;
  zoomClient = self->_zoomClient;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 0);
  -[NUSurfaceRenderClient setPriority:](zoomClient, "setPriority:", v4);

  backfillClient = self->_backfillClient;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE6C3E8]), "initWithLevel:", 1);
  -[NUSurfaceRenderClient setPriority:](backfillClient, "setPriority:", v6);

}

- (void)wait
{
  double v3;
  double v4;
  NSObject *renderGroup;
  dispatch_time_t v6;
  double v7;
  double v8;
  NSObject *v9;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NUAbsoluteTime();
  v4 = v3;
  renderGroup = self->_renderGroup;
  v6 = dispatch_time(0, 1000000000);
  dispatch_group_wait(renderGroup, v6);
  NUAbsoluteTime();
  v8 = v7;
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
  v9 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v10 = 134217984;
    v11 = (v8 - v4) * 1000.0;
    _os_log_debug_impl(&dword_20D1BC000, v9, OS_LOG_TYPE_DEBUG, "Waited for %0.1f ms", (uint8_t *)&v10, 0xCu);
  }
  -[NUMediaViewRenderer _updateBackfillLayerWithLatestRenderResponse](self, "_updateBackfillLayerWithLatestRenderResponse");
  -[NUMediaViewRenderer _updateROILayerWithLatestRenderResponse](self, "_updateROILayerWithLatestRenderResponse");
}

- (void)setPipelineFilters:(id)a3
{
  NSArray *pipelineFilters;
  id v5;
  NSArray *v6;
  NSArray *previousPipelineFilters;
  NSArray *v8;
  NSArray *v9;

  pipelineFilters = self->_pipelineFilters;
  v5 = a3;
  v6 = (NSArray *)-[NSArray copy](pipelineFilters, "copy");
  previousPipelineFilters = self->_previousPipelineFilters;
  self->_previousPipelineFilters = v6;

  v8 = (NSArray *)objc_msgSend(v5, "copy");
  v9 = self->_pipelineFilters;
  self->_pipelineFilters = v8;

}

- (BOOL)pipelineFilersHaveChanged
{
  NSArray *pipelineFilters;

  pipelineFilters = self->_pipelineFilters;
  if (pipelineFilters == self->_previousPipelineFilters)
    return 0;
  else
    return !-[NSArray isEqualToArray:](pipelineFilters, "isEqualToArray:");
}

- (BOOL)isReady
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[NUMediaViewRenderer mediaView](self, "mediaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_renderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_backfillLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)canRenderVideoLive
{
  int64_t v3;
  BOOL v4;

  v3 = -[NUMediaViewRenderer playbackMode](self, "playbackMode");
  v4 = !self->_canRenderLoopingVideoLive && v3 == 1;
  return !v4;
}

- (CGPoint)convertPoint:(CGPoint)a3 toImageFromView:(id)a4
{
  double y;
  double x;
  NUMediaView **p_mediaView;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_mediaView = &self->_mediaView;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  objc_msgSend(WeakRetained, "_renderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_containerLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "convertPoint:fromLayer:", v11, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromImageToView:(id)a4
{
  double y;
  double x;
  NUMediaView **p_mediaView;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_mediaView = &self->_mediaView;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  objc_msgSend(WeakRetained, "_renderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_containerLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "convertPoint:toLayer:", v11, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toImageFromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  NUMediaView **p_mediaView;
  id v9;
  id WeakRetained;
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
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_mediaView = &self->_mediaView;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_mediaView);
  objc_msgSend(WeakRetained, "_renderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_containerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertRect:fromLayer:", v13, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)canUpdateDisplayHeadroom
{
  return !-[NUMediaViewRenderer livePhotoViewIsScrubbing](self, "livePhotoViewIsScrubbing");
}

- (id)_regionPolicyForZoomTargetRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  NUViewport *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NUViewportRegionPolicy *v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUMediaViewRenderer mediaView](self, "mediaView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_renderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NUViewport initWithSize:backingScaleFactor:]([NUViewport alloc], "initWithSize:backingScaleFactor:", width, height, self->_backingScale);
  -[NUViewport setPosition:](v11, "setPosition:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend(v9, "convertRect:fromView:", v10, x, y, width, height);
  objc_msgSend(v9, "bounds");
  objc_msgSend(v9, "_roiLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nu_contentsAreFlipped");
  NUCGRectConvertFromRectToRect();
  v14 = v13;
  v16 = v15;

  -[NUViewport setAnchorPoint:](v11, "setAnchorPoint:", v14, v16, 0, 0, 0x3FF0000000000000, 0x3FF0000000000000);
  v17 = -[NUViewportRegionPolicy initWithViewport:]([NUViewportRegionPolicy alloc], "initWithViewport:", v11);

  return v17;
}

- (id)_zoomRenderResponseHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke;
  v3[3] = &unk_24C625790;
  v3[4] = self;
  return (id)MEMORY[0x212B9F6E4](v3, a2);
}

- (id)_videoFrameImageRenderResponseHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke;
  v3[3] = &unk_24C625790;
  v3[4] = self;
  return (id)MEMORY[0x212B9F6E4](v3, a2);
}

- (void)_updateROILayerWithLatestRenderResponse
{
  NSObject *renderQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__485;
  v9 = __Block_byref_object_dispose__486;
  v10 = 0;
  renderQueue = self->_renderQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__NUMediaViewRenderer__updateROILayerWithLatestRenderResponse__block_invoke;
  v4[3] = &unk_24C6257B8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(renderQueue, v4);
  if (v6[5])
    -[NUMediaViewRenderer _updateROILayerWithRenderResponse:](self, "_updateROILayerWithRenderResponse:");
  _Block_object_dispose(&v5, 8);

}

- (void)_updateROILayerWithRenderResponse:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NURenderStatistics *v8;
  NURenderStatistics *lastZoomRenderStatistics;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_renderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_roiLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUMediaViewRenderer _updateImageLayer:withRenderResponse:](self, "_updateImageLayer:withRenderResponse:", v7, v10);
    v8 = (NURenderStatistics *)objc_claimAutoreleasedReturnValue();
    lastZoomRenderStatistics = self->_lastZoomRenderStatistics;
    self->_lastZoomRenderStatistics = v8;

  }
}

- (id)renderClient
{
  return self->_backfillClient;
}

- (void)setDisplayType:(unint64_t)a3
{
  -[NUMediaViewRenderer _setDisplayType:](self, "_setDisplayType:");
  self->_displayType = a3;
}

- (void)_setupAVPlayerController
{
  NUAVPlayerController *v3;
  NUAVPlayerController *nuAVPlayerController;
  NUAVPlayerController *v5;
  uint64_t v6;
  NUAVPlayerController *v7;
  NUAVPlayerController *v8;
  NUAVPlayerController *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  if (!self->_nuAVPlayerController)
  {
    v3 = objc_alloc_init(NUAVPlayerController);
    nuAVPlayerController = self->_nuAVPlayerController;
    self->_nuAVPlayerController = v3;

    -[NUAVPlayerController setLoopsVideo:](self->_nuAVPlayerController, "setLoopsVideo:", self->_playbackMode == 1);
    -[NUAVPlayerController setMuted:](self->_nuAVPlayerController, "setMuted:", self->_muted);
    objc_initWeak(&location, self);
    v5 = self->_nuAVPlayerController;
    v6 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke;
    v16[3] = &unk_24C625808;
    objc_copyWeak(&v17, &location);
    -[NUAVPlayerController addPlaybackTimeObserver:block:](v5, "addPlaybackTimeObserver:block:", self, v16);
    v7 = self->_nuAVPlayerController;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_2;
    v14[3] = &unk_24C625830;
    objc_copyWeak(&v15, &location);
    -[NUAVPlayerController addPlayerStatusObserver:block:](v7, "addPlayerStatusObserver:block:", self, v14);
    v8 = self->_nuAVPlayerController;
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_3;
    v12[3] = &unk_24C625858;
    objc_copyWeak(&v13, &location);
    -[NUAVPlayerController addPlaybackRateObserver:block:](v8, "addPlaybackRateObserver:block:", self, v12);
    v9 = self->_nuAVPlayerController;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_4;
    v10[3] = &unk_24C625880;
    objc_copyWeak(&v11, &location);
    -[NUAVPlayerController addExternalPlaybackObserver:block:](v9, "addExternalPlaybackObserver:block:", self, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)_playerStatusDidChange:(int64_t)a3
{
  void *v5;
  int v6;
  int v7;
  double v8;
  id v9;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rate");
  v7 = v6;

  LODWORD(v8) = v7;
  -[NUMediaViewRenderer _notifyPlaybackStateChange:](self, "_notifyPlaybackStateChange:", -[NUMediaViewRenderer _playbackStateFromPlayerStatus:rate:](self, "_playbackStateFromPlayerStatus:rate:", a3, v8));

}

- (void)_tearDownAVPlayerController
{
  NUAVPlayerController *nuAVPlayerController;
  NUAVPlayerController *v4;

  nuAVPlayerController = self->_nuAVPlayerController;
  if (nuAVPlayerController)
  {
    -[NUAVPlayerController removeObserver:](nuAVPlayerController, "removeObserver:", self);
    v4 = self->_nuAVPlayerController;
    self->_nuAVPlayerController = 0;

    -[NUMediaViewRenderer _notifyPlaybackStateChange:](self, "_notifyPlaybackStateChange:", 0);
  }
}

- (id)cacheVideoRenderFilter
{
  if (cacheVideoRenderFilter_onceToken != -1)
    dispatch_once(&cacheVideoRenderFilter_onceToken, &__block_literal_global_466);
  return (id)cacheVideoRenderFilter_filter;
}

- (void)_updateVideoWithResult:(id)a3 sourceChanged:(BOOL)a4
{
  id v6;
  NUAVPlayerController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id WeakRetained;
  _BOOL4 v31;
  int v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  _BOOL8 v38;
  void *v39;
  NSObject *v40;
  void *v41;
  const void **v42;
  void *specific;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  NUAVPlayerController *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE buf[24];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[NUMediaViewRenderer computedDisplayType](self, "computedDisplayType") == 2 && !self->_didReleaseAVObjects)
  {
    v7 = self->_nuAVPlayerController;
    -[NUAVPlayerController videoAsset](v7, "videoAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUAVPlayerController videoComposition](v7, "videoComposition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v55 = v7;
      objc_msgSend(v6, "videoComposition");
      v11 = v10;
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioMix");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUMediaViewRenderer mediaView](self, "mediaView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "player");
      v58 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "playbackState");

      v16 = (void *)objc_opt_class();
      v56 = (void *)v12;
      v17 = v12;
      v10 = v11;
      v18 = objc_msgSend(v16, "_forceUpdateForNewVideoComposition:previousComposition:newAsset:previousAsset:isPlaying:", v17, v9, v11, v8, v15 == 3);
      v19 = 0;
      if ((v18 & 1) == 0 && v15 == 3)
        v19 = objc_msgSend(MEMORY[0x24BE6C438], "compositionInstructions:areEqualToCompositionInstructions:", v56, v9) ^ 1;
      v54 = v19;
      v7 = v55;
      if (v8 != v10)
      {
        v53 = v8;
        v20 = objc_alloc(MEMORY[0x24BE6C3B8]);
        -[NUMediaViewRenderer composition](self, "composition");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithComposition:", v21);

        objc_msgSend(v22, "setName:", CFSTR("PXSubjectTrackingView-getUnadjustedImageSize"));
        v61 = 0;
        objc_msgSend(v22, "submitSynchronous:", &v61);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v61;
        objc_msgSend(v23, "properties");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          objc_msgSend(v25, "size");
          NUPixelSizeToCGSize();
          v27 = v26;
          v29 = v28;
          WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
          objc_msgSend(WeakRetained, "set_masterSizeWithoutGeometry:", v27, v29);

        }
        v8 = v53;
      }
      v31 = -[NUMediaViewRenderer pipelineFilersHaveChanged](self, "pipelineFilersHaveChanged", v53);
      v32 = v18 | v31;
      v33 = objc_loadWeakRetained((id *)&self->_mediaView);
      objc_msgSend(v6, "geometry");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUMediaViewRenderer _updateVideoViewLayoutWithGeometry:](self, "_updateVideoViewLayoutWithGeometry:", v34);
      if (v32 == 1)
      {
        if (!v55)
        {
          NUAssertLogger_439();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("We should have an initialized AV player controller"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v41;
            _os_log_error_impl(&dword_20D1BC000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

          }
          v42 = (const void **)MEMORY[0x24BE6C280];
          specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
          NUAssertLogger_439();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v45)
            {
              v48 = dispatch_get_specific(*v42);
              v49 = (void *)MEMORY[0x24BDD17F0];
              v50 = v48;
              objc_msgSend(v49, "callStackSymbols");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v48;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v52;
              _os_log_error_impl(&dword_20D1BC000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

            }
          }
          else if (v45)
          {
            objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v47;
            _os_log_error_impl(&dword_20D1BC000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          }
          _NUAssertFailHandler();
        }
        if (v8 == v10 && !objc_msgSend(v33, "isHidden"))
        {
          v36 = v56;
          -[NUAVPlayerController updateVideoComposition:](v55, "updateVideoComposition:", v56);
          -[NUAVPlayerController updateAudioMix:](v55, "updateAudioMix:", v57);
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x24BDC0D40];
          *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
          if (!a4)
          {
            if (-[NUAVPlayerController currentlySeeking](v55, "currentlySeeking"))
              -[NUAVPlayerController currentSeekTime](v55, "currentSeekTime");
            else
              -[NUAVPlayerController currentTime](v55, "currentTime");
          }
          v38 = self->_playbackMode == 1;
          v59 = *(_OWORD *)buf;
          v60 = *(_QWORD *)&buf[16];
          v36 = v56;
          if (-[NUAVPlayerController prepareWithAVAsset:videoComposition:audioMix:loopsVideo:seekToTime:](v55, "prepareWithAVAsset:videoComposition:audioMix:loopsVideo:seekToTime:", v10, v56, v57, v38, &v59))
          {
            objc_msgSend(v33, "_rendererDidCreateAVPlayerController:", v55);
            -[NUMediaViewRenderer _notifyPlaybackStateChange:](self, "_notifyPlaybackStateChange:", 1);
          }
        }
      }
      else
      {
        -[NUAVPlayerController updateAudioMix:](v55, "updateAudioMix:", v57);
        v36 = v56;
        if (v56)
          v37 = v54;
        else
          v37 = 0;
        if (v37 == 1)
          -[NUAVPlayerController updateWithVideoPrepareNodeFromVideoComposition:](v55, "updateWithVideoPrepareNodeFromVideoComposition:", v56);
      }
      if (v31)
        -[NUMediaViewRenderer setPipelineFilters:](self, "setPipelineFilters:", self->_pipelineFilters);
      objc_msgSend(v6, "statistics");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_rendererDidFinishWithStatistics:", v39);

      v9 = v58;
    }
    else
    {
      if (*MEMORY[0x24BE6C478] != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
      v35 = *MEMORY[0x24BE6C488];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20D1BC000, v35, OS_LOG_TYPE_ERROR, "Nil video asset received", buf, 2u);
      }
    }

  }
}

- (id)_scalePolicyForVideoCompositionRender
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  int v33;
  double v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[NUMediaViewRenderer overrideZoomToFitSize](self, "overrideZoomToFitSize");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x24BDBF148];
  v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[NUMediaViewRenderer overrideZoomScale](self, "overrideZoomScale");
  if (v4 != v7 || v6 != v8)
  {
    -[NUMediaViewRenderer overrideZoomToFitSize](self, "overrideZoomToFitSize");
    goto LABEL_6;
  }
  if (v9 == 0.0 && -[NUMediaViewRenderer isZoomedToFit](self, "isZoomedToFit"))
  {
    -[NUMediaViewRenderer targetSize](self, "targetSize");
LABEL_6:
    v13 = (int)v11;
    v14 = (double)(int)v11;
    v15 = (int)v12;
    v16 = (double)(int)v12;
    if (v13 >= 0)
      v17 = v13 & 1;
    else
      v17 = -(v13 & 1);
    v18 = (double)(2 - v17);
    if (!v17)
      v18 = -0.0;
    v19 = v15 & 1;
    if (v15 < 0)
      v19 = -v19;
    v20 = v18 + v14;
    if (v19)
      v21 = (double)(2 - v19);
    else
      v21 = -0.0;
    v22 = v21 + v16;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C388]), "initWithTargetSize:", v20, v21 + v16);
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
    v24 = *MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      v33 = 134218240;
      v34 = v20;
      v35 = 2048;
      v36 = v22;
      v25 = "VideoCompositorScalePolicy: FIT scale policy fit to %f x %f";
      v26 = v24;
      v27 = 22;
LABEL_31:
      _os_log_debug_impl(&dword_20D1BC000, v26, OS_LOG_TYPE_DEBUG, v25, (uint8_t *)&v33, v27);
      return v23;
    }
    return v23;
  }
  -[NUMediaViewRenderer overrideZoomScale](self, "overrideZoomScale");
  if (v28 == 0.0)
    -[NUMediaViewRenderer _targetZoomScale](self, "_targetZoomScale");
  else
    -[NUMediaViewRenderer overrideZoomScale](self, "overrideZoomScale");
  v30 = v29;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C440]), "initWithZoomFactor:", v29);
  if (*MEMORY[0x24BE6C478] != -1)
    dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
  v31 = *MEMORY[0x24BE6C488];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
  {
    v33 = 134217984;
    v34 = v30;
    v25 = "VideoCompositorScalePolicy: ZOOM scale policy zoomed to %f";
    v26 = v31;
    v27 = 12;
    goto LABEL_31;
  }
  return v23;
}

- (void)_updateVideoComposition:(id)a3
{
  id v4;
  int *p_videoRenderInFlightCount;
  unsigned int v6;
  NUVideoRenderClient *v7;
  NUVideoRenderClient *videoClient;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NUAVPlayerController *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NUVideoRenderClient *v19;
  NUAVPlayerController *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  NUAVPlayerController *v24;
  char v25;
  BOOL v26;

  v4 = a3;
  if (!self->_didReleaseAVObjects)
  {
    p_videoRenderInFlightCount = &self->_videoRenderInFlightCount;
    do
      v6 = __ldaxr((unsigned int *)p_videoRenderInFlightCount);
    while (__stlxr(v6 + 1, (unsigned int *)p_videoRenderInFlightCount));
    if (!self->_videoClient)
    {
      v7 = (NUVideoRenderClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE6C430]), "initWithName:", CFSTR("NUMediaViewRenderer-NUVideoRenderRequest"));
      videoClient = self->_videoClient;
      self->_videoClient = v7;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v10 != 0) == (self->_currentVideoSourceAssetIdentifier == 0))
      v11 = 1;
    else
      v11 = objc_msgSend(v10, "isEqualToString:") ^ 1;
    objc_storeStrong((id *)&self->_currentVideoSourceAssetIdentifier, v10);
    -[NUMediaViewRenderer mediaView](self, "mediaView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_nuAVPlayerController;
    v14 = -[NUMediaViewRenderer canRenderVideoLive](self, "canRenderVideoLive");
    -[NUMediaViewRenderer pipelineFilters](self, "pipelineFilters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[NUMediaViewRenderer cacheVideoRenderFilter](self, "cacheVideoRenderFilter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObject:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "_rendererDidStartPreparingVideo");
      v15 = (void *)v17;
    }
    -[NUMediaViewRenderer _scalePolicyForVideoCompositionRender](self, "_scalePolicyForVideoCompositionRender");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUVideoRenderClient setPipelineFilters:](self->_videoClient, "setPipelineFilters:", v15);
    -[NUVideoRenderClient setScalePolicy:](self->_videoClient, "setScalePolicy:", v18);
    -[NUVideoRenderClient setSampleMode:](self->_videoClient, "setSampleMode:", 2);
    v19 = self->_videoClient;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __47__NUMediaViewRenderer__updateVideoComposition___block_invoke;
    v22[3] = &unk_24C625930;
    v25 = v11;
    v26 = v14;
    v22[4] = self;
    v23 = v12;
    v24 = v13;
    v20 = v13;
    v21 = v12;
    -[NUVideoRenderClient submitRequestForComposition:completion:](v19, "submitRequestForComposition:completion:", v4, v22);

  }
}

- (void)_updateVideoViewLayoutWithGeometry:(id)a3
{
  id v4;
  id WeakRetained;
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double maximumZoomScale;
  CGAffineTransform v30;

  v4 = a3;
  if (v4 && -[NUMediaViewRenderer isZoomedToFit](self, "isZoomedToFit"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
    objc_msgSend(WeakRetained, "_renderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUMediaViewRenderer _scrollBounds](self, "_scrollBounds");
    v9 = v8;
    v11 = v10;
    objc_msgSend(WeakRetained, "edgeInsets");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v6, "_roiLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nu_contentsAreFlipped");
    v21 = v11 - (v13 + v17);
    if (v9 - (v19 + v15) > 0.0)
      v22 = v9 - (v19 + v15);
    else
      v22 = 0.0;
    if (v21 > 0.0)
      v23 = v21;
    else
      v23 = 0.0;

    objc_msgSend(v4, "size");
    NUPixelSizeToCGSize();
    v25 = v24;
    v27 = v26;
    CGAffineTransformMakeScale(&v30, self->_backingScale, self->_backingScale);
    if ((v23 * v30.c + v30.a * v22) / v25 >= (v23 * v30.d + v30.b * v22) / v27)
      v28 = (v23 * v30.d + v30.b * v22) / v27;
    else
      v28 = (v23 * v30.c + v30.a * v22) / v25;
    objc_msgSend(v7, "setMinimumZoomScale:", 1.17549435e-38);
    objc_msgSend(v7, "setMaximumZoomScale:", 3.40282347e38);
    objc_msgSend(v7, "setMinimumZoomScale:", v28);
    objc_msgSend(v7, "setZoomScale:", v28);
    maximumZoomScale = self->_maximumZoomScale;
    if (maximumZoomScale < v28)
      maximumZoomScale = v28;
    objc_msgSend(v7, "setMaximumZoomScale:", maximumZoomScale);
    objc_msgSend(v6, "setGeometry:", v4);

  }
}

- (void)_coalesceUpdateVideoComposition:(id)a3
{
  id v4;
  NUCoalescer *videoUpdateCoalescer;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  videoUpdateCoalescer = self->_videoUpdateCoalescer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__NUMediaViewRenderer__coalesceUpdateVideoComposition___block_invoke;
  v7[3] = &unk_24C625958;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[NUCoalescer coalesceBlock:](videoUpdateCoalescer, "coalesceBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_coalesceUpdateLivePhotoComposition:(id)a3
{
  id v4;
  NUCoalescer *livePhotoUpdateCoalescer;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  livePhotoUpdateCoalescer = self->_livePhotoUpdateCoalescer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__NUMediaViewRenderer__coalesceUpdateLivePhotoComposition___block_invoke;
  v7[3] = &unk_24C625958;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[NUCoalescer coalesceBlock:](livePhotoUpdateCoalescer, "coalesceBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_updateLivePhotoComposition:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x24BE6C3C8];
  v5 = a3;
  v10 = (id)objc_msgSend([v4 alloc], "initWithComposition:", v5);

  objc_msgSend(v10, "setName:", CFSTR("NUMediaViewRenderer"));
  objc_msgSend(v10, "setPipelineFilters:", self->_pipelineFilters);
  v6 = objc_alloc(MEMORY[0x24BE6C388]);
  -[NUMediaViewRenderer targetSize](self, "targetSize");
  v7 = (void *)objc_msgSend(v6, "initWithTargetSize:");
  objc_msgSend(v10, "setScalePolicy:", v7);
  -[NUMediaViewRenderer colorSpace](self, "colorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NUMediaViewRenderer colorSpace](self, "colorSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColorSpace:", v9);

  }
  -[NULivePhotoRenderClient submitRequest:](self->_livePhotoClient, "submitRequest:", v10);

}

- (id)_livePhotoFromResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(v3, "video");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0uLL;
  v13 = 0;
  if (v3)
    objc_msgSend(v3, "photoTime");
  v6 = objc_alloc(NSClassFromString(CFSTR("PHLivePhoto")));
  v7 = objc_msgSend(v3, "photo");
  v10 = v12;
  v11 = v13;
  v8 = (void *)objc_msgSend(v6, "initWithImage:uiOrientation:videoAsset:photoTime:asset:options:videoComposition:", v7, 0, v4, &v10, 0, 1, v5);

  return v8;
}

- (void)_updateLivePhotoWithResponse:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  v4 = -[NUMediaViewRenderer computedDisplayType](self, "computedDisplayType");
  v5 = v24;
  if (v4 == 3)
  {
    -[NUMediaViewRenderer _livePhotoFromResponse:](self, "_livePhotoFromResponse:", v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
    objc_msgSend(WeakRetained, "_livePhotoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("livePhoto"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v24, "video");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("videoAsset"));
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("videoComposition"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "videoComposition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUMediaViewRenderer mediaView](self, "mediaView");
      v13 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "playbackState") == 3;

      v6 = v13;
      v17 = (void *)v10;
      v18 = (void *)v23;
      if (objc_msgSend((id)objc_opt_class(), "_forceUpdateForNewVideoComposition:previousComposition:newAsset:previousAsset:isPlaying:", v12, v11, v23, v17, v16))
      {
        objc_msgSend(WeakRetained, "_livePhotoView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "performSelector:withObject:", NSSelectorFromString(CFSTR("setLivePhoto:")), v6);

      }
      objc_msgSend(WeakRetained, "_livePhotoView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSSelectorFromString(CFSTR("setOverridePhoto:"));
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "_livePhotoView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "performSelector:withObject:", NSSelectorFromString(CFSTR("setOverridePhoto:")), objc_msgSend(v24, "photo"));

      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_livePhotoView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "performSelector:withObject:", NSSelectorFromString(CFSTR("setLivePhoto:")), v6);
    }

    objc_msgSend(WeakRetained, "_rendererDidUpdateLivePhoto");
    v5 = v24;
  }

}

- (id)_zoomRenderRequestForComposition:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;

  v4 = (objc_class *)MEMORY[0x24BE6C440];
  v5 = a3;
  v6 = [v4 alloc];
  -[NUMediaViewRenderer _targetZoomScale](self, "_targetZoomScale");
  v7 = (void *)objc_msgSend(v6, "initWithZoomFactor:");
  -[NUMediaViewRenderer _zoomTargetRect](self, "_zoomTargetRect");
  -[NUMediaViewRenderer _regionPolicyForZoomTargetRect:](self, "_regionPolicyForZoomTargetRect:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NUMediaViewRenderer newRenderRequestForComposition:scalePolicy:regionPolicy:](self, "newRenderRequestForComposition:scalePolicy:regionPolicy:", v5, v7, v8);

  NUAbsoluteTime();
  self->_lastZoomRenderTime = v10;

  return v9;
}

- (double)_targetZoomScale
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoomScale");
  v5 = v4;
  objc_msgSend(v3, "minimumZoomScale");
  v7 = v6;
  objc_msgSend(v3, "maximumZoomScale");
  v9 = fmax(v7, fmin(v5, v8));

  return v9;
}

- (CGRect)_zoomTargetRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
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
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect result;

  v39 = *MEMORY[0x24BDAC8D0];
  -[NUMediaViewRenderer _scrollBounds](self, "_scrollBounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_isPanning && !self->_isZooming)
  {
    -[NUMediaViewRenderer _lastRenderDuration](self, "_lastRenderDuration");
    v12 = v11;
    v13 = v7 - self->_lastZoomRect.origin.x;
    v14 = v8 - self->_lastZoomRect.origin.y;
    NUAbsoluteTime();
    v16 = v15 - self->_lastZoomRenderTime;
    v25 = v13;
    v26 = v14;
    v17 = v12 * v13 / v16;
    v18 = v12 * v14 / v16;
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
    v19 = v7 + v17;
    v20 = v8 + v18;
    v21 = (void *)*MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEBUG))
    {
      v22 = v21;
      v40.origin.x = v19;
      v40.origin.y = v20;
      v40.size.width = v9;
      v40.size.height = v10;
      NSStringFromCGRect(v40);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41.origin.x = v7;
      v41.origin.y = v8;
      v41.size.width = v9;
      v41.size.height = v10;
      NSStringFromCGRect(v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2048;
      v32 = v25;
      v33 = 2048;
      v34 = v26;
      v35 = 2048;
      v36 = v12;
      v37 = 2048;
      v38 = v16;
      _os_log_debug_impl(&dword_20D1BC000, v22, OS_LOG_TYPE_DEBUG, "targetRect: %@, clipRect: %@, dx = %f, dy = %f, dr = %f, dt= %f", buf, 0x3Eu);

    }
    NUAlignRectToPixelGrid();
    NUPixelRectToCGRect();
  }
  self->_lastZoomRect.origin.x = v7;
  self->_lastZoomRect.origin.y = v8;
  self->_lastZoomRect.size.width = v9;
  self->_lastZoomRect.size.height = v10;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)_lastRenderDuration
{
  NURenderStatistics *lastZoomRenderStatistics;
  double result;

  lastZoomRenderStatistics = self->_lastZoomRenderStatistics;
  if (!lastZoomRenderStatistics)
    lastZoomRenderStatistics = self->_lastBackfillRenderStatictics;
  -[NURenderStatistics totalDuration](lastZoomRenderStatistics, "totalDuration");
  return result;
}

- (void)_addFullExtentConstraintsForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)MEMORY[0x24BDD1628];
  v12 = CFSTR("v");
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[v]|"), 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v6);

  v7 = (void *)MEMORY[0x24BDD1628];
  v10 = CFSTR("v");
  v11 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[v]|"), 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateConstraints:", v9);

}

- (void)setVideoEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id WeakRetained;

  v4 = a4;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "setVideoPlayerVisible:animated:", v5, v4);

  -[UIView setHidden:](self->_livePhotoView, "setHidden:", v5 ^ 1);
  -[NUMediaViewRenderer _setVideoEnabled:](self, "_setVideoEnabled:", v5);
}

- (void)cancelPendingRenders
{
  -[NUSurfaceRenderClient cancel](self->_backfillClient, "cancel");
  -[NUSurfaceRenderClient cancel](self->_zoomClient, "cancel");
  -[NUVideoRenderClient cancel](self->_videoClient, "cancel");
  -[NULivePhotoRenderClient cancel](self->_livePhotoClient, "cancel");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mediaDuration
{
  void *v4;
  void *v5;
  uint64_t v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v8;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "duration");
  }
  else
  {
    v6 = MEMORY[0x24BDC0D40];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D40];
    retstr->var3 = *(_QWORD *)(v6 + 16);
  }

  return result;
}

- (int64_t)playbackState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "videoAsset"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "status");
    objc_msgSend(v6, "rate");
    v8 = -[NUMediaViewRenderer _playbackStateFromPlayerStatus:rate:](self, "_playbackStateFromPlayerStatus:rate:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_playbackStateFromPlayerStatus:(int64_t)a3 rate:(float)a4
{
  int64_t v4;
  int64_t v5;

  v4 = 1;
  v5 = 2;
  if (a4 != 0.0)
    v5 = 3;
  if (a3 == 2)
    v4 = 4;
  if (a3 == 1)
    return v5;
  else
    return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v4;
  uint64_t v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v7;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "currentTime");
    v4 = v7;
  }
  else
  {
    v5 = MEMORY[0x24BDC0D40];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D40];
    retstr->var3 = *(_QWORD *)(v5 + 16);
  }

  return result;
}

- (void)seekToTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3;

  v3 = *a3;
  -[NUMediaViewRenderer seekToTime:exact:](self, "seekToTime:exact:", &v3, 1);
}

- (NSArray)loadedTimeRanges
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "loadedTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)seekToTime:(id *)a3 exact:(BOOL)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[NUMediaViewRenderer seekToTime:exact:forceSeek:](self, "seekToTime:exact:forceSeek:", &v4, a4, 0);
}

- (void)seekToTime:(id *)a3 exact:(BOOL)a4 forceSeek:(BOOL)a5
{
  _BOOL8 v5;
  CMTime v8;
  CMTime v9;
  __int128 v10;
  int64_t var3;
  CMTime v12;

  v5 = a5;
  memset(&v12, 0, sizeof(v12));
  if (a4)
    v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  else
    CMTimeMake(&v12, 5, 30);
  v10 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v9 = v12;
  v8 = v12;
  -[NUMediaViewRenderer seekToTime:toleranceBefore:toleranceAfter:forceSeek:](self, "seekToTime:toleranceBefore:toleranceAfter:forceSeek:", &v10, &v9, &v8, v5);
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  v6 = *a4;
  v5 = *a5;
  -[NUMediaViewRenderer seekToTime:toleranceBefore:toleranceAfter:forceSeek:](self, "seekToTime:toleranceBefore:toleranceAfter:forceSeek:", &v7, &v6, &v5, 0);
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 forceSeek:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  void *v11;
  __int128 v12;
  int64_t v13;
  __int128 v14;
  int64_t v15;
  __int128 v16;
  int64_t var3;

  v6 = a6;
  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v16 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v14 = *(_OWORD *)&a4->var0;
    v15 = a4->var3;
    v12 = *(_OWORD *)&a5->var0;
    v13 = a5->var3;
    objc_msgSend(v10, "seek:toleranceBefore:toleranceAfter:forceSeek:", &v16, &v14, &v12, v6);
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentSeekTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "currentSeekTime");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)stepByCount:(int64_t)a3
{
  void *v4;
  id v5;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "step:", a3);
    v4 = v5;
  }

}

- (void)play
{
  void *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id location;
  CMTime time2;
  CMTime time1;

  -[NUMediaViewRenderer currentTime](self, "currentTime");
  -[NUMediaViewRenderer mediaDuration](self, "mediaDuration");
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    -[NUMediaViewRenderer setPlaybackRate:](self, "setPlaybackRate:", 1.0);
  }
  else
  {
    objc_initWeak(&location, self);
    -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __27__NUMediaViewRenderer_play__block_invoke;
    v10[3] = &unk_24C625880;
    objc_copyWeak(&v11, &location);
    v8 = *MEMORY[0x24BDC0D88];
    v9 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v6 = v8;
    v7 = v9;
    v4 = v8;
    v5 = v9;
    objc_msgSend(v3, "seek:toleranceBefore:toleranceAfter:forceSeek:completionHandler:", &v8, &v6, &v4, 1, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (double)playbackRate
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  double v6;

  -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rate");
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)setPlaybackMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  if (self->_playbackMode != a3)
  {
    -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (!a3)
      {
        v6 = 0;
        goto LABEL_7;
      }
      if (a3 == 1)
      {
        v6 = 1;
LABEL_7:
        v7 = v5;
        objc_msgSend(v5, "setLoopsVideo:", v6);
        v5 = v7;
      }
    }
    self->_playbackMode = a3;

  }
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_muted != a3)
  {
    v3 = a3;
    -[NUMediaViewRenderer nuAVPlayerController](self, "nuAVPlayerController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "setMuted:", v3);
    -[NUMediaViewRenderer mediaView](self, "mediaView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_livePhotoView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("muted"));

    self->_muted = v3;
  }
}

- (id)addPlaybackStateObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_439();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_error_impl(&dword_20D1BC000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_439();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v10);
        v17 = (void *)MEMORY[0x24BDD17F0];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v20;
        _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  -[NUObservatory addObserverForKey:queue:block:](self->_observatory, "addObserverForKey:queue:block:", 0, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_notifyPlaybackStateChange:(int64_t)a3
{
  NUObservatory *observatory;
  _QWORD v4[6];

  observatory = self->_observatory;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__NUMediaViewRenderer__notifyPlaybackStateChange___block_invoke;
  v4[3] = &unk_24C625980;
  v4[4] = self;
  v4[5] = a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", 0, v4);
}

- (id)addExternalPlaybackObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_439();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_error_impl(&dword_20D1BC000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_439();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v10);
        v17 = (void *)MEMORY[0x24BDD17F0];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v20;
        _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  -[NUObservatory addObserverForKey:queue:block:](self->_observatory, "addObserverForKey:queue:block:", 2, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_notifyExternalPlaybackChange:(BOOL)a3
{
  NUObservatory *observatory;
  _QWORD v4[5];
  BOOL v5;

  observatory = self->_observatory;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__NUMediaViewRenderer__notifyExternalPlaybackChange___block_invoke;
  v4[3] = &unk_24C6259A8;
  v4[4] = self;
  v5 = a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", 2, v4);
}

- (id)addPlaybackTimeObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_439();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "block != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_error_impl(&dword_20D1BC000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_439();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v10);
        v17 = (void *)MEMORY[0x24BDD17F0];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v20;
        _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_error_impl(&dword_20D1BC000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  -[NUObservatory addObserverForKey:queue:block:](self->_observatory, "addObserverForKey:queue:block:", 1, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_notifyPlaybackTimeChange:(id *)a3
{
  NUObservatory *observatory;
  _QWORD v4[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  observatory = self->_observatory;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__NUMediaViewRenderer__notifyPlaybackTimeChange___block_invoke;
  v4[3] = &unk_24C6259D0;
  v4[4] = self;
  v5 = *a3;
  -[NUObservatory notifyAllObserversForKey:withBlock:](observatory, "notifyAllObserversForKey:withBlock:", 1, v4);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_439();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "observer != nil");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_error_impl(&dword_20D1BC000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v7 = (const void **)MEMORY[0x24BE6C280];
    specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
    NUAssertLogger_439();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x24BDD17F0];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        v21 = 2114;
        v22 = v17;
        _os_log_error_impl(&dword_20D1BC000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_error_impl(&dword_20D1BC000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v18 = v4;
  -[NUObservatory removeObserver:](self->_observatory, "removeObserver:", v4);

}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_livePhotoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  objc_msgSend(WeakRetained, "_livephotoPlaybackWillBegin");
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_livePhotoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(WeakRetained, "_livephotoPlaybackDidEnd");
}

- (void)livePhotoViewDidBeginScrubbing:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_livePhotoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[NUMediaViewRenderer setLivePhotoViewIsScrubbing:](self, "setLivePhotoViewIsScrubbing:", 1);
}

- (void)livePhotoViewDidEndScrubbing:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_livePhotoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[NUMediaViewRenderer setLivePhotoViewIsScrubbing:](self, "setLivePhotoViewIsScrubbing:", 0);
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (double)backingScale
{
  return self->_backingScale;
}

- (double)displayMaximumEDRHeadroom
{
  return self->_displayMaximumEDRHeadroom;
}

- (void)setDisplayMaximumEDRHeadroom:(double)a3
{
  self->_displayMaximumEDRHeadroom = a3;
}

- (double)displayCurrentEDRHeadroom
{
  return self->_displayCurrentEDRHeadroom;
}

- (void)setDisplayCurrentEDRHeadroom:(double)a3
{
  self->_displayCurrentEDRHeadroom = a3;
}

- (double)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (void)setMaximumZoomScale:(double)a3
{
  self->_maximumZoomScale = a3;
}

- (unint64_t)displayType
{
  return self->_displayType;
}

- (unint64_t)computedDisplayType
{
  return self->_computedDisplayType;
}

- (CGSize)overrideZoomToFitSize
{
  double width;
  double height;
  CGSize result;

  width = self->_overrideZoomToFitSize.width;
  height = self->_overrideZoomToFitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOverrideZoomToFitSize:(CGSize)a3
{
  self->_overrideZoomToFitSize = a3;
}

- (double)overrideZoomScale
{
  return self->_overrideZoomScale;
}

- (void)setOverrideZoomScale:(double)a3
{
  self->_overrideZoomScale = a3;
}

- (BOOL)_isVideoEnabled
{
  return self->__videoEnabled;
}

- (void)_setVideoEnabled:(BOOL)a3
{
  self->__videoEnabled = a3;
}

- (BOOL)livePhotoViewIsScrubbing
{
  return self->_livePhotoViewIsScrubbing;
}

- (void)setLivePhotoViewIsScrubbing:(BOOL)a3
{
  self->_livePhotoViewIsScrubbing = a3;
}

- (NSArray)previousPipelineFilters
{
  return self->_previousPipelineFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousPipelineFilters, 0);
  objc_storeStrong((id *)&self->_nuAVPlayerController, 0);
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
  objc_destroyWeak((id *)&self->_mediaView);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_lastBackfillRenderStatictics, 0);
  objc_storeStrong((id *)&self->_lastZoomRenderStatistics, 0);
  objc_storeStrong((id *)&self->_backfillRenderResponse, 0);
  objc_storeStrong((id *)&self->_zoomRenderResponse, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_renderGroup, 0);
  objc_storeStrong((id *)&self->_observatory, 0);
  objc_storeStrong((id *)&self->_videoUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_livePhotoUpdateCoalescer, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_currentVideoSourceAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_videoClient, 0);
  objc_storeStrong((id *)&self->_livePhotoClient, 0);
  objc_storeStrong((id *)&self->_backfillClient, 0);
  objc_storeStrong((id *)&self->_zoomClient, 0);
}

uint64_t __49__NUMediaViewRenderer__notifyPlaybackTimeChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, __int128 *);
  __int128 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *))(a2 + 16);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  return v4(a2, v3, &v6);
}

uint64_t __53__NUMediaViewRenderer__notifyExternalPlaybackChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __50__NUMediaViewRenderer__notifyPlaybackStateChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __27__NUMediaViewRenderer_play__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPlaybackRate:", 1.0);

}

void __59__NUMediaViewRenderer__coalesceUpdateLivePhotoComposition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateLivePhotoComposition:", *(_QWORD *)(a1 + 32));

}

void __55__NUMediaViewRenderer__coalesceUpdateVideoComposition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateVideoComposition:", *(_QWORD *)(a1 + 32));

}

void __47__NUMediaViewRenderer__updateVideoComposition___block_invoke(uint64_t a1, void *a2)
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  unsigned int v15;
  __int16 v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 100);
  do
  {
    v4 = __ldaxr(v3);
    v5 = v4 - 1;
  }
  while (__stlxr(v4 - 1, v3));
  v17 = 0;
  objc_msgSend(a2, "result:", &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (!v6)
  {
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
    v8 = *MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl(&dword_20D1BC000, v8, OS_LOG_TYPE_DEFAULT, "Failed to update video composition: %{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__NUMediaViewRenderer__updateVideoComposition___block_invoke_59;
  v11[3] = &unk_24C625908;
  v16 = *(_WORD *)(a1 + 56);
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v15 = v5;
  v13 = v9;
  v14 = *(id *)(a1 + 48);
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

uint64_t __47__NUMediaViewRenderer__updateVideoComposition___block_invoke_59(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isVideoEnabled") & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 32), "displayType"), result == 2))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_updateVideoWithResult:sourceChanged:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 68));
    if (!*(_DWORD *)(a1 + 64) && !*(_BYTE *)(a1 + 69))
    {
      objc_msgSend(*(id *)(a1 + 48), "_rendererDidFinishPreparingVideo");
      objc_msgSend(*(id *)(a1 + 48), "setVideoPlayerVisible:animated:", 1, 1);
      result = objc_msgSend(*(id *)(a1 + 32), "playbackMode");
      if (result == 1)
        return objc_msgSend(*(id *)(a1 + 56), "play");
    }
  }
  return result;
}

void __45__NUMediaViewRenderer_cacheVideoRenderFilter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE6C3F8]), "initWithBlock:", &__block_literal_global_43);
  v1 = (void *)cacheVideoRenderFilter_filter;
  cacheVideoRenderFilter_filter = v0;

}

id __45__NUMediaViewRenderer_cacheVideoRenderFilter__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a2;
  v9 = a4;
  v10 = objc_msgSend(v8, "mediaTypeForComposition:", a3);
  v11 = v9;
  if (v10 == 2)
  {
    objc_msgSend(v8, "cacheNode:type:settings:error:", v9, CFSTR("Video"), MEMORY[0x24BDBD1B8], a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_notifyPlaybackTimeChange:", &v4);

}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_playerStatusDidChange:", a2);

}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_3(uint64_t a1, float a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (a2 == 0.0)
    v4 = 2;
  else
    v4 = 3;
  objc_msgSend(WeakRetained, "_notifyPlaybackStateChange:", v4);

}

void __47__NUMediaViewRenderer__setupAVPlayerController__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyExternalPlaybackChange:", a2);

}

void __39__NUMediaViewRenderer__setDisplayType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  objc_msgSend(a2, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_updateLivePhotoWithResponse:", v3);

  }
  else
  {
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
    v6 = *MEMORY[0x24BE6C488];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_error_impl(&dword_20D1BC000, v6, OS_LOG_TYPE_ERROR, "Error loading LivePhoto: %{public}@", buf, 0xCu);
    }
  }

}

void __67__NUMediaViewRenderer__updateBackfillLayerWithLatestRenderResponse__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

}

void __62__NUMediaViewRenderer__updateROILayerWithLatestRenderResponse__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

}

void __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD block[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), a2);
  v4 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke_2;
  block[3] = &unk_24C625740;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__NUMediaViewRenderer__videoFrameImageRenderResponseHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_updateBackfillLayerWithLatestRenderResponse");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(WeakRetained, "setVideoPlayerVisible:animated:", 0, 1);

}

void __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD block[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), a2);
  v4 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke_2;
  block[3] = &unk_24C625740;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __53__NUMediaViewRenderer__backfillRenderResponseHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackfillLayerWithLatestRenderResponse");
}

void __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD block[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), a2);
  v4 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke_2;
  block[3] = &unk_24C625740;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __49__NUMediaViewRenderer__zoomRenderResponseHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateROILayerWithLatestRenderResponse");
}

void __56__NUMediaViewRenderer__updateImageRenderForComposition___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 104));
}

+ (BOOL)_forceUpdateForNewVideoComposition:(id)a3 previousComposition:(id)a4 newAsset:(id)a5 previousAsset:(id)a6 isPlaying:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v13 != v14 || !v11 && v12 || v11 && !v12)
  {
    LOBYTE(v15) = 1;
    goto LABEL_7;
  }
  if (!v11 || !v12)
  {
    if (a7)
    {
      LOBYTE(v15) = 0;
      goto LABEL_7;
    }
LABEL_18:
    v15 = objc_msgSend(MEMORY[0x24BE6C438], "compositionInstructions:areEqualToCompositionInstructions:", v11, v12) ^ 1;
    goto LABEL_7;
  }
  objc_msgSend(v11, "renderSize");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "renderSize");
  LOBYTE(v15) = v20 != v22 || v18 != v21;
  if ((v15 & 1) == 0 && !a7)
    goto LABEL_18;
LABEL_7:

  return v15;
}

- (void)_withComposition:(id)a3 visitRenderClient:(id)a4
{
  void (**v6)(id, NUSurfaceRenderClient *, void *, void *);
  id WeakRetained;
  void *v8;
  void *v9;
  NUSurfaceRenderClient *backfillClient;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, NUSurfaceRenderClient *, void *, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  objc_msgSend(WeakRetained, "_renderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[NUMediaViewRenderer isZoomedToFit](self, "isZoomedToFit"))
    {
      -[NUMediaViewRenderer _backfillRenderRequestForComposition:](self, "_backfillRenderRequestForComposition:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      backfillClient = self->_backfillClient;
      -[NUMediaViewRenderer _backfillRenderResponseHandler](self, "_backfillRenderResponseHandler");
    }
    else
    {
      -[NUMediaViewRenderer _zoomRenderRequestForComposition:](self, "_zoomRenderRequestForComposition:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      backfillClient = self->_zoomClient;
      -[NUMediaViewRenderer _zoomRenderResponseHandler](self, "_zoomRenderResponseHandler");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, backfillClient, v9, v11);

  }
}

- (void)_releaseAVObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  os_log_t v14;
  void *specific;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  NUVideoRenderClient *videoClient;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (-[NUMediaViewRenderer computedDisplayType](self, "computedDisplayType") != 2)
  {
    v7 = (uint64_t *)MEMORY[0x24BE6C478];
    if (*MEMORY[0x24BE6C478] != -1)
      dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_420);
    v8 = (os_log_t *)MEMORY[0x24BE6C468];
    v9 = (void *)*MEMORY[0x24BE6C468];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C468], OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = v9;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("_releaseAVObjects should only be called when displaying video"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v12;
      _os_log_impl(&dword_20D1BC000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v27, 0xCu);

      v13 = *v7;
      if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
      {
        if (v13 != -1)
          dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_420);
LABEL_12:
        v14 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]);
          v16 = (void *)MEMORY[0x24BDD17F0];
          v17 = specific;
          v18 = v14;
          objc_msgSend(v16, "callStackSymbols");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543618;
          v28 = specific;
          v29 = 2114;
          v30 = v20;
          _os_log_error_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v27, 0x16u);

LABEL_25:
          goto LABEL_17;
        }
        goto LABEL_17;
      }
      if (v13 != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_420);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x24BE6C280]))
    {
      goto LABEL_12;
    }
    v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)MEMORY[0x24BDD17F0];
      v18 = v21;
      objc_msgSend(v24, "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v26;
      _os_log_error_impl(&dword_20D1BC000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v27, 0xCu);

      goto LABEL_25;
    }
LABEL_17:
    _NUAssertContinueHandler();
    return;
  }
  if (!self->_didReleaseAVObjects)
  {
    self->_didReleaseAVObjects = 1;
    -[NUMediaViewRenderer mediaView](self, "mediaView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_videoPlayerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "_renderView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v5);

      -[NUMediaViewRenderer _addFullExtentConstraintsForView:](self, "_addFullExtentConstraintsForView:", v5);
    }
    else
    {
      if (*MEMORY[0x24BE6C478] != -1)
        dispatch_once(MEMORY[0x24BE6C478], &__block_literal_global_421);
      v22 = *MEMORY[0x24BE6C488];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C488], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27) = 0;
        _os_log_error_impl(&dword_20D1BC000, v22, OS_LOG_TYPE_ERROR, "NUMediaViewRenderer: failed to create snapshot for videoView", (uint8_t *)&v27, 2u);
      }
    }
    -[NUMediaViewRenderer _tearDownAVPlayerController](self, "_tearDownAVPlayerController");
    objc_msgSend(v3, "_rendererDidCreateAVPlayerController:", 0);
    -[NUVideoRenderClient cancel](self->_videoClient, "cancel");
    videoClient = self->_videoClient;
    self->_videoClient = 0;

  }
}

- (BOOL)_didReleaseAVObjects
{
  return self->_didReleaseAVObjects;
}

@end
