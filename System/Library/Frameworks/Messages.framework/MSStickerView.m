@implementation MSStickerView

- (void)_configureStickerView
{
  id v3;
  UIImageView *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapRecognizer;
  objc_class *v7;
  id v8;
  PXRoundProgressView *v9;
  PXRoundProgressView *roundProgressView;
  UIImageView *imageView;
  UIImageView *v12;
  UIImageView *outlineImageView;
  id v14;

  if (!self->_imageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[MSStickerView bounds](self, "bounds");
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    -[UIImageView setContentMode:](v4, "setContentMode:", 1);
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_handleTap_);
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    -[MSStickerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    v7 = (objc_class *)_configureStickerView_PXPhotosRoundProgressViewClass;
    if (!_configureStickerView_PXPhotosRoundProgressViewClass)
    {
      v7 = (objc_class *)MEMORY[0x1DF0A9E4C](CFSTR("PXRoundProgressView"), CFSTR("PhotosUICore"));
      _configureStickerView_PXPhotosRoundProgressViewClass = (uint64_t)v7;
    }
    if (!self->_roundProgressView)
    {
      v8 = [v7 alloc];
      v9 = (PXRoundProgressView *)objc_msgSend(v8, "initWithFrame:style:", 5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      roundProgressView = self->_roundProgressView;
      self->_roundProgressView = v9;

      -[PXRoundProgressView setHidden:](self->_roundProgressView, "setHidden:", 1);
      -[MSStickerView addSubview:](self, "addSubview:", self->_roundProgressView);
    }
    -[MSStickerView _configureDragAndDrop](self, "_configureDragAndDrop");
    -[MSStickerView addSubview:](self, "addSubview:", v4);
    imageView = self->_imageView;
    self->_imageView = v4;

    -[MSStickerView setClipsToBounds:](self, "setClipsToBounds:", 1);
  }
  if (!self->_outlineImageView)
  {
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    outlineImageView = self->_outlineImageView;
    self->_outlineImageView = v12;

    -[UIImageView setContentMode:](self->_outlineImageView, "setContentMode:", 1);
    -[UIImageView setHidden:](self->_outlineImageView, "setHidden:", 1);
    -[MSStickerView addSubview:](self, "addSubview:", self->_outlineImageView);
  }
  -[MSStickerView setEffectView:](self, "setEffectView:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__stickerPreviewCachePreviewDidChange_, CFSTR("MSStickerPreviewCachePreviewDidChange"), 0);

}

- (MSStickerView)initWithFrame:(CGRect)a3
{
  MSStickerView *v3;
  MSStickerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSStickerView;
  v3 = -[MSStickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MSStickerView _configureStickerView](v3, "_configureStickerView");
  return v4;
}

- (MSStickerView)initWithFrame:(CGRect)frame sticker:(MSSticker *)sticker
{
  double height;
  double width;
  double y;
  double x;
  MSSticker *v9;
  MSStickerView *v10;
  MSStickerView *v11;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  v9 = sticker;
  v10 = -[MSStickerView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
    -[MSStickerView setSticker:](v10, "setSticker:", v9);

  return v11;
}

- (MSStickerView)initWithCoder:(id)a3
{
  MSStickerView *v3;
  MSStickerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSStickerView;
  v3 = -[MSStickerView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MSStickerView _configureStickerView](v3, "_configureStickerView");
  return v4;
}

- (void)dealloc
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;

  -[MSStickerView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[MSStickerView setImage:](self, "setImage:", 0);
  -[MSStickerView setImageData:](self, "setImageData:", 0);
  -[MSStickerView setFrames:](self, "setFrames:", 0);
  -[MSStickerView setIsPeeled:](self, "setIsPeeled:", 0);
  -[MSStickerView setAnimating:](self, "setAnimating:", 0);
  -[MSStickerView setStickerError:](self, "setStickerError:", 0);
  -[MSStickerView setStickerImage:](self, "setStickerImage:", 0);
  -[MSStickerView roundProgressView](self, "roundProgressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[MSStickerView roundProgressView](self, "roundProgressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForReuse");

  -[MSStickerView setEffectView:](self, "setEffectView:", 0);
  self->_animationDuration = 0.0;
  -[MSStickerView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v32.receiver = self;
  v32.super_class = (Class)MSStickerView;
  -[MSStickerView layoutSubviews](&v32, sel_layoutSubviews);
  -[MSStickerView bounds](self, "bounds");
  v4 = v3;
  v30 = v5;
  v31 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MSStickerView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8, v10);
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  v20 = CGRectGetWidth(v33) * 0.5;
  v34.origin.x = v13;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  v21 = v20 - CGRectGetWidth(v34) * 0.5;
  v35.origin.y = v30;
  v35.origin.x = v31;
  v35.size.width = v8;
  v35.size.height = v10;
  v22 = CGRectGetHeight(v35) * 0.5;
  v36.origin.x = v21;
  v36.origin.y = v15;
  v36.size.width = v17;
  v36.size.height = v19;
  v23 = v22 - CGRectGetHeight(v36) * 0.5;
  objc_msgSend(v11, "setFrame:", v21, v23, v17, v19);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isStickersAppEnabled");

  if (v25)
  {
    -[MSStickerView effectView](self, "effectView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v21, v23, v17, v19);

  }
  if (!-[MSStickerView initialLayoutComplete](self, "initialLayoutComplete"))
  {
    -[MSStickerView bounds](self, "bounds");
    if (!CGRectEqualToRect(v37, *MEMORY[0x1E0C9D648]))
    {
      -[MSStickerView setInitialLayoutComplete:](self, "setInitialLayoutComplete:", 1);
      -[MSStickerView sticker](self, "sticker");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        -[MSStickerView image](self, "image");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
          -[MSStickerView _loadSticker](self, "_loadSticker");
      }
    }
  }
  -[PXRoundProgressView setFrame:](self->_roundProgressView, "setFrame:", v17 + -20.0, v19 + -20.0, 20.0, 20.0);
  -[MSStickerView bringSubviewToFront:](self, "bringSubviewToFront:", self->_roundProgressView);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_class *CKUIBehaviorClass;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MSStickerView imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pxSize");
  v7 = v6;
  v9 = v8;

  CKUIBehaviorClass = (objc_class *)getCKUIBehaviorClass();
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (CKUIBehaviorClass)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[MSStickerView sizeThatFits:].cold.2(CKUIBehaviorClass);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[MSStickerView sizeThatFits:].cold.1();
  }

  -[objc_class sharedBehaviors](objc_retainAutorelease(CKUIBehaviorClass), "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stickerScreenScale");
  v15 = v14;

  v16 = v7 / v15;
  v17 = v9 / v15;
  v18 = v9 / v15 > height;
  if (v7 / v15 > width)
    v18 = 1;
  if (v18)
  {
    v17 = height;
    v16 = width;
  }
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setSticker:(MSSticker *)sticker
{
  MSSticker *v5;
  MSSticker **p_sticker;
  NSError *stickerError;
  void *v8;
  void *v9;
  MSSticker *v10;
  NSError *v11;
  NSError *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  NSObject *v18;
  NSObject *v19;
  NSError *v20;
  NSError *v21;
  void *v22;
  void *v23;
  NSError *v24;
  NSError *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSError *v35;
  NSError *v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v5 = sticker;
  p_sticker = &self->_sticker;
  if (self->_sticker != v5)
  {
    objc_storeStrong((id *)&self->_sticker, sticker);
    stickerError = self->_stickerError;
    self->_stickerError = 0;

    if (v5)
    {
      -[MSSticker representations](*p_sticker, "representations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[MSSticker _generateImageData](*p_sticker, "_generateImageData");
      -[MSSticker _imageData](*p_sticker, "_imageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *p_sticker;
      if (v9)
      {
        -[MSSticker _stickerError](v10, "_stickerError");
        v11 = (NSError *)objc_claimAutoreleasedReturnValue();
        v12 = self->_stickerError;
        self->_stickerError = v11;

        if (!self->_stickerError)
        {
          v13 = v9;
LABEL_22:
          -[MSStickerView setImageData:](self, "setImageData:", v13);
          if (-[MSStickerView initialLayoutComplete](self, "initialLayoutComplete"))
            -[MSStickerView _loadSticker](self, "_loadSticker");

          goto LABEL_25;
        }
      }
      else
      {
        -[MSSticker imageFileURL](v10, "imageFileURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if ((objc_msgSend(v14, "__ms_conformsToUTI:", *MEMORY[0x1E0CA5B90]) & 1) != 0)
          {
            v38 = 0;
            v39 = &v38;
            v40 = 0x2050000000;
            v16 = (void *)getCKImageDataClass_softClass_0;
            v41 = getCKImageDataClass_softClass_0;
            if (!getCKImageDataClass_softClass_0)
            {
              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = __getCKImageDataClass_block_invoke_0;
              v37[3] = &unk_1EA25C548;
              v37[4] = &v38;
              __getCKImageDataClass_block_invoke_0((uint64_t)v37);
              v16 = (void *)v39[3];
            }
            v17 = objc_retainAutorelease(v16);
            _Block_object_dispose(&v38, 8);
            IMLogHandleForCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v17)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                -[MSStickerView setSticker:].cold.2(v17);
            }
            else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              -[MSStickerView setSticker:].cold.1();
            }

            v26 = objc_alloc(objc_retainAutorelease(v17));
            -[MSSticker imageFileURL](*p_sticker, "imageFileURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v26, "initWithURL:", v27);

            if (v13)
            {

              goto LABEL_22;
            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "path");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "fileExistsAtPath:", v31))
              v32 = 2;
            else
              v32 = 1;

            v33 = (void *)MEMORY[0x1E0CB35C8];
            v42 = CFSTR("MSStickersErrorStickerInfoKey");
            v43 = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.stickers-error"), v32, v34);
            v35 = (NSError *)objc_claimAutoreleasedReturnValue();
            v36 = self->_stickerError;
            self->_stickerError = v35;

          }
          else
          {
            v22 = (void *)MEMORY[0x1E0CB35C8];
            v44 = CFSTR("MSStickersErrorStickerInfoKey");
            v45[0] = v15;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.stickers-error"), 3, v23);
            v24 = (NSError *)objc_claimAutoreleasedReturnValue();
            v25 = self->_stickerError;
            self->_stickerError = v24;

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.stickers-error"), 1, 0);
          v20 = (NSError *)objc_claimAutoreleasedReturnValue();
          v21 = self->_stickerError;
          self->_stickerError = v20;

        }
      }

      goto LABEL_33;
    }
    -[MSStickerView _prepareForReuse](self, "_prepareForReuse");
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isStickersAppEnabled");

  if (v29)
    -[MSStickerView _configureEffectView](self, "_configureEffectView");
LABEL_33:

}

- (void)_configureEffectView
{
  void *v3;

  -[MSStickerView sticker](self, "sticker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stickerEffectType");

  if (!self->_sticker
    || (IMStickerEffectTypeShouldAvoidEffectView() & 1) != 0
    || -[MSStickerView isAnimated](self, "isAnimated"))
  {
    -[MSStickerView _removeEffectView](self, "_removeEffectView");
  }
  else
  {
    -[MSStickerView _buildEffectView](self, "_buildEffectView");
    -[MSStickerView _enableEffectView](self, "_enableEffectView");
  }
}

- (void)_removeEffectView
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStickersAppEnabled");

  if (v4)
  {
    if (self->_imageView)
      -[MSStickerView addSubview:](self, "addSubview:");
    -[MSStickerView setEffectView:](self, "setEffectView:", 0);
  }
}

- (void)_buildEffectView
{
  void *v3;
  int v4;
  void *v5;
  VKCStickerEffectView *effectView;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStickersAppEnabled");

  if (v4)
  {
    -[UIImageView image](self->_imageView, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[MSStickerView _loadSticker](self, "_loadSticker");
    effectView = self->_effectView;
    if (effectView)
    {
      -[VKCStickerEffectView removeFromSuperview](effectView, "removeFromSuperview");
    }
    else
    {
      v7 = MTLCreateSystemDefaultDevice();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6DF0]), "initWithDevice:", v7);
      -[MSStickerView setEffectView:](self, "setEffectView:", v8);

    }
    -[VKCStickerEffectView setContentMode:](self->_effectView, "setContentMode:", 1);
    -[UIImageView frame](self->_imageView, "frame");
    -[VKCStickerEffectView setFrame:](self->_effectView, "setFrame:");
    v9 = (void *)MEMORY[0x1E0DC6DE8];
    -[MSStickerView sticker](self, "sticker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectWithType:", objc_msgSend(v10, "stickerEffectType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCStickerEffectView setEffect:](self->_effectView, "setEffect:", v11);

    if (!-[MSStickerView isAnimated](self, "isAnimated"))
    {
      -[VKCStickerEffectView setImage:](self->_effectView, "setImage:", self->_stickerImage);
      v17 = (void *)MEMORY[0x1E0DC6DE8];
      -[MSStickerView sticker](self, "sticker");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "effectWithType:", objc_msgSend(v19, "stickerEffectType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCStickerEffectView setEffect:](self->_effectView, "setEffect:", v18);

      goto LABEL_12;
    }
    -[MSStickerView sticker](self, "sticker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "representations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsString:", CFSTR("public.heic"));

    if (v16)
    {
      -[IMImageDataProtocol data](self->_imageData, "data");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[VKCStickerEffectView setVideoData:](self->_effectView, "setVideoData:", v19);
LABEL_12:

      return;
    }
    -[VKCStickerEffectView setImage:](self->_effectView, "setImage:", self->_stickerImage);
  }
}

- (void)setEffectView:(id)a3
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStickersAppEnabled");

  if (v6)
  {
    -[VKCStickerEffectView setPaused:](self->_effectView, "setPaused:", 1);
    -[VKCStickerEffectView removeFromSuperview](self->_effectView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_effectView, a3);
    if (!self->_effectView && (-[MSStickerView containsView:](self, "containsView:", self->_imageView) & 1) == 0)
      -[MSStickerView addSubview:](self, "addSubview:", self->_imageView);
  }

}

- (void)_enableEffectView
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStickersAppEnabled");

  if (v4)
  {
    if (self->_effectView && (-[MSStickerView containsView:](self, "containsView:") & 1) == 0)
      -[MSStickerView addSubview:](self, "addSubview:", self->_effectView);
    if (-[MSStickerView containsView:](self, "containsView:", self->_imageView))
      -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    -[VKCStickerEffectView setPaused:](self->_effectView, "setPaused:", 0);
  }
}

- (void)_stickerPreviewCachePreviewDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_class *CKPreviewDispatchCacheClass;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  IMAnimatedImageProtocol *v10;
  void *v11;

  -[MSStickerView sticker](self, "sticker", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSSticker MSStickerPreviewCacheKeyForSticker:](MSSticker, "MSStickerPreviewCacheKeyForSticker:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CKPreviewDispatchCacheClass = (objc_class *)getCKPreviewDispatchCacheClass();
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (CKPreviewDispatchCacheClass)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MSStickerView _stickerPreviewCachePreviewDidChange:].cold.2(CKPreviewDispatchCacheClass);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[MSStickerView _stickerPreviewCachePreviewDidChange:].cold.1();
  }

  -[objc_class stickerPreviewCache](objc_retainAutorelease(CKPreviewDispatchCacheClass), "stickerPreviewCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedPreviewForKey:", v5);
  v10 = (IMAnimatedImageProtocol *)objc_claimAutoreleasedReturnValue();

  if (v10 && v10 != self->_image)
  {
    -[MSStickerView setImage:](self, "setImage:", v10);
    -[IMAnimatedImageProtocol frames](v10, "frames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView setFrames:](self, "setFrames:", v11);

    -[MSStickerView _updateStickerView](self, "_updateStickerView");
    -[MSStickerView setNeedsLayout](self, "setNeedsLayout");
    -[MSStickerView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (void)setImage:(id)a3
{
  IMAnimatedImageProtocol *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (IMAnimatedImageProtocol *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    self->_animationDuration = 0.0;
    -[MSStickerView image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "durations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "doubleValue", (_QWORD)v14);
          self->_animationDuration = v13 + self->_animationDuration;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)startAnimating
{
  -[MSStickerView setAnimating:](self, "setAnimating:", 1);
}

- (void)stopAnimating
{
  -[MSStickerView setAnimating:](self, "setAnimating:", 0);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)_loadSticker
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)clearCachedPreviewsForCurrentSticker
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_loadAnimatedStickerIfNecessary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

id __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke(uint64_t a1)
{
  objc_class *CKAnimatedImageClass;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;

  CKAnimatedImageClass = (objc_class *)getCKAnimatedImageClass();
  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (CKAnimatedImageClass)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_4(CKAnimatedImageClass);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_3();
  }

  v5 = objc_retainAutorelease(CKAnimatedImageClass);
  v6 = *(_QWORD *)(a1 + 32);
  v20 = 0;
  -[objc_class animatedImageFromOptimizedBitmapAtFileURL:error:](v5, "animatedImageFromOptimizedBitmapAtFileURL:error:", v6, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 40), "thumbnailAtIndex:fillToSize:maxCount:", v11, 0x7FFFFFFFLL, 1.79769313e308, 1.79769313e308);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v10, "addObject:", v12);

        ++v11;
      }
      while (v11 < objc_msgSend(*(id *)(a1 + 40), "count"));
    }
    objc_msgSend(*(id *)(a1 + 40), "durationsWithMaxCount:", 0x7FFFFFFFLL);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "roundProgressView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_2;
      v19[3] = &unk_1EA25C5A0;
      v19[4] = *(_QWORD *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], v19);
    }
    v15 = (objc_class *)getCKAnimatedImageClass();
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_2(v15);
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_1();
    }

    v9 = (id)objc_msgSend(objc_alloc(objc_retainAutorelease(v15)), "initWithImages:durations:", v10, v13);
  }

  return v9;
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setProgress:", v3);

  objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "cachedPreviewForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_4;
    block[3] = &unk_1EA25C5A0;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v4 = *(void **)(a1 + 32);
      v5[0] = v3;
      v5[1] = 3221225472;
      v5[2] = __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_5;
      v5[3] = &unk_1EA25C640;
      v6 = v2;
      v7 = *(id *)(a1 + 56);
      objc_msgSend(v4, "enqueueSaveBlock:withPriority:", v5, 0);

    }
  }

}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MSStickerPreviewCachePreviewDidChange"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));

}

uint64_t __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4 = 0;
  return objc_msgSend(v2, "writeAsOptimizedBitmapToFileURL:error:", v1, &v4);
}

- (void)_updateStickerView
{
  void *v3;
  UIImage *v4;
  UIImage *stickerImage;

  -[MSStickerView frames](self, "frames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  stickerImage = self->_stickerImage;
  self->_stickerImage = v4;

  -[MSStickerView _setImage:](self, "_setImage:", self->_stickerImage);
  -[MSStickerView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
}

- (void)_setImage:(id)a3
{
  UIImageView *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = self->_imageView;
  -[UIImageView image](v4, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[MSStickerView setStickerImage:](self, "setStickerImage:", v6);
    -[UIImageView setImage:](v4, "setImage:", v6);
  }

}

- (void)_swapWithOutlineImage
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_resetPeel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MSStickerView outlineImageView](self, "outlineImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[MSStickerView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView addSubview:](self, "addSubview:", v4);

  -[MSStickerView stickerImage](self, "stickerImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[MSStickerView setIsPeeled:](self, "setIsPeeled:", 0);
  -[MSStickerView setAnimating:](self, "setAnimating:", 1);
  -[MSStickerView _configureEffectView](self, "_configureEffectView");
}

- (id)accessibilityLabel
{
  return -[MSSticker localizedDescription](self->_sticker, "localizedDescription");
}

- (void)setAnimating:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if (-[MSStickerView isAnimated](self, "isAnimated")
    && !-[MSStickerView isPeeled](self, "isPeeled")
    && self->_animating != v3)
  {
    self->_animating = v3;
    -[MSStickerView stickerImage](self, "stickerImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView _setImage:](self, "_setImage:", v5);

    -[MSStickerView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
  }
}

- (BOOL)isAnimated
{
  void *v2;
  BOOL v3;

  -[MSStickerView imageData](self, "imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)updateAnimationTimerObserving
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)prepareForSnapshotting
{
  void *v3;
  id v4;

  if (-[MSStickerView isAnimated](self, "isAnimated"))
  {
    -[MSStickerView setAnimating:](self, "setAnimating:", 0);
    -[MSStickerView frames](self, "frames");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView _setImage:](self, "_setImage:", v3);

  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSStickerView;
  -[MSStickerView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MSStickerView updateAnimationTimerObserving](self, "updateAnimationTimerObserving");
}

- (void)pauseVisionKitEffect:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MSStickerView effectView](self, "effectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

}

- (void)_sendStickerUsageAnalyticsForDragAndDrop
{
  MSStickerUsageEvent *v3;
  void *v4;
  MSStickerUsageEvent *v5;

  v3 = [MSStickerUsageEvent alloc];
  -[MSStickerView sticker](self, "sticker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MSStickerUsageEvent initWithSticker:](v3, "initWithSticker:", v4);

  -[MSStickerUsageEvent setUsageType:](v5, "setUsageType:", 1);
  -[MSStickerUsageEvent send](v5, "send");

}

- (void)_logStickerUsage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (getSTKStickerUsageManagerClass())
  {
    getSTKStickerUsageManagerClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(getSTKStickerUsageManagerClass(), "sharedManager");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[MSSticker stickerIdentifier](self->_sticker, "stickerIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "UUIDString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MSStickerSendManager sharedInstance](_MSStickerSendManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hostBundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logStickerWithStickerIdentifier:bundleIdentifier:", v4, v6);

    }
  }
}

- (void)_configureDragAndDrop
{
  void *v3;
  int v4;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *longPressRecognizer;
  UIDragInteraction *v7;
  UIDragInteraction *dragInteraction;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClingEnabled");

  if (v4 && !-[MSStickerView _isInsideMessagesCamera](self, "_isInsideMessagesCamera"))
  {
    v7 = (UIDragInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA550]), "initWithDelegate:", self);
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v7;

    -[MSStickerView addInteraction:](self, "addInteraction:", self->_dragInteraction);
  }
  else
  {
    v5 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel_handleLongPress_);
    longPressRecognizer = self->_longPressRecognizer;
    self->_longPressRecognizer = v5;

    -[MSStickerView addGestureRecognizer:](self, "addGestureRecognizer:", self->_longPressRecognizer);
    -[UILongPressGestureRecognizer setDelegate:](self->_longPressRecognizer, "setDelegate:", self);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressRecognizer, "setMinimumPressDuration:", 0.15);
  }
}

- (BOOL)_isInsideMessagesCamera
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v2, "inputItems", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "userInfo");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("context-is-messages-camera"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqual:", &unk_1EA2679D8);

          if ((v10 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)animationTimerFired:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;

  -[MSStickerView frames](self, "frames");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    -[MSStickerView image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView animationOffset](self, "animationOffset");
    objc_msgSend(v5, "frameForAnimationTime:", v6 + a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSStickerView _setImage:](self, "_setImage:", v7);
  }

}

- (void)handleTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[MSStickerView stageStickerForce:](self, "stageStickerForce:", 0);
}

- (void)stageStickerForce:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;

  v3 = a3;
  -[MSStickerView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MSStickerView window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "coordinateSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v14, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[MSSticker imageFileURL](self->_sticker, "imageFileURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    -[MSSticker _convertImageFileURLIfNeeded](self->_sticker, "_convertImageFileURLIfNeeded");
  -[MSStickerView _stickerSendManager](self, "_stickerSendManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "insertSticker:forceStage:frameInRemoteView:completionHandler:", self->_sticker, v3, &__block_literal_global_7, v16, v18, v20, v22);

  -[MSStickerView _logStickerUsage](self, "_logStickerUsage");
}

void __35__MSStickerView_stageStickerForce___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Sticker error: %@"), a2);
}

- (void)handleLongPress:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  MSSticker *sticker;
  void *v26;
  _QWORD v27[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[MSStickerView _swapWithOutlineImage](self, "_swapWithOutlineImage");
    -[MSStickerView setIsPeeled:](self, "setIsPeeled:", 1);
    -[MSStickerView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[MSStickerView window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView convertRect:toView:](self, "convertRect:toView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = (void *)MEMORY[0x1DF0AA074]();
    -[MSStickerView _stickerSendManager](self, "_stickerSendManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    sticker = self->_sticker;
    objc_msgSend(MEMORY[0x1E0CEAC18], "_synchronizedDrawingFence");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __33__MSStickerView_handleLongPress___block_invoke;
    v27[3] = &unk_1EA25CA10;
    v27[4] = self;
    objc_msgSend(v24, "startDragSticker:frameInRemoteView:fence:completionHandler:", sticker, v26, v27, v16, v18, v20, v22);

    objc_autoreleasePoolPop(v23);
  }

}

void __33__MSStickerView_handleLongPress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MSStickerView_handleLongPress___block_invoke_2;
  v6[3] = &unk_1EA25C640;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __33__MSStickerView_handleLongPress___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_resetPeel");
  if (*(_QWORD *)(a1 + 40))
    NSLog(CFSTR("Sticker error: %@"), *(_QWORD *)(a1 + 40));
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  VKCStickerEffectView *v11;
  void *v12;
  UIImageView *imageView;
  UIImageView *v14;
  void *v15;
  void (**v16)(void);
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  _MSStickerDragPreviewContainerView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  VKCStickerEffectView *v39;
  _BYTE v40[48];

  v6 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  v7 = objc_alloc_init(MEMORY[0x1E0CEA390]);
  objc_msgSend(v6, "setShadowPath:", v7);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  +[_MSStickerDragPreviewContainerView shadowPropertiesForDrag](_MSStickerDragPreviewContainerView, "shadowPropertiesForDrag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "_setShadowProperties:", v9);
  -[MSStickerView superview](self, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_effectView;
  -[VKCStickerEffectView superview](v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  imageView = (UIImageView *)v11;
  if (!v12)
    imageView = self->_imageView;
  v14 = imageView;

  -[MSStickerView dragPreviewLiftContainerProvider](self, "dragPreviewLiftContainerProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MSStickerView dragPreviewLiftContainerProvider](self, "dragPreviewLiftContainerProvider");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = v17;

      v10 = v18;
    }

  }
  -[MSStickerView superview](self, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView center](self, "center");
  objc_msgSend(v19, "convertPoint:toView:", v10);
  v21 = v20;
  v23 = v22;

  v24 = objc_alloc(MEMORY[0x1E0CEA570]);
  +[_MSStickerDragPreviewContainerView targetPreviewTransform](_MSStickerDragPreviewContainerView, "targetPreviewTransform");
  v25 = (void *)objc_msgSend(v24, "initWithContainer:center:transform:", v10, v40, v21, v23);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA90]), "initWithView:parameters:target:", v14, v6, v25);

  v27 = -[_MSStickerDragPreviewContainerView initWithIsDropAnimation:]([_MSStickerDragPreviewContainerView alloc], "initWithIsDropAnimation:", 0);
  -[MSStickerView setContainer:](self, "setContainer:", v27);
  -[MSStickerView stickerImage](self, "stickerImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSStickerDragPreviewContainerView setImage:](v27, "setImage:", v28);

  objc_msgSend(v26, "_setPreviewContainer:", v27);
  -[MSStickerView frames](self, "frames");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v29, "count") <= 1)
  {

    v36 = 0;
  }
  else
  {
    v39 = v11;
    -[MSStickerView imageView](self, "imageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "image");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[MSStickerView frames](self, "frames");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSStickerView imageView](self, "imageView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "image");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v9;
      v35 = objc_msgSend(v32, "indexOfObject:", v34);

      if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        v36 = 0;
      else
        v36 = v35;
      v9 = v38;
    }
    else
    {
      v36 = 0;
    }
    v11 = v39;
  }
  -[MSStickerView setInitialFrameIndexForCurrentDrag:](self, "setInitialFrameIndexForCurrentDrag:", v36, v38);

  return v26;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v6 = a5;
  -[MSStickerView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView center](self, "center");
  objc_msgSend(v8, "convertPoint:toView:", v7);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA570]), "initWithContainer:center:", v7, v10, v12);
  objc_msgSend(v6, "retargetedPreviewWithTarget:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[MSStickerView container](self, "container", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__MSStickerView__dragInteractionDidCancelLiftWithoutDragging___block_invoke;
  v5[3] = &unk_1EA25C5A0;
  v5[4] = self;
  objc_msgSend(v4, "_animateLiftCancellationAlongsideAnimator:completion:", 0, v5);

}

uint64_t __62__MSStickerView__dragInteractionDidCancelLiftWithoutDragging___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetPeel");
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v6 = a5;
  -[MSStickerView container](self, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MSStickerView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v8[3] = &unk_1EA25C5A0;
  v8[4] = self;
  objc_msgSend(v7, "_animateLiftCancellationAlongsideAnimator:completion:", v6, v8);

}

uint64_t __68__MSStickerView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetPeel");
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__MSStickerView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_1EA25CA38;
  v5[4] = self;
  objc_msgSend(a4, "addCompletion:", v5);
}

uint64_t __69__MSStickerView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2 != 1)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_swapWithOutlineImage");
    return objc_msgSend(*(id *)(v2 + 32), "setIsPeeled:", 1);
  }
  return result;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  NSObject *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  _QWORD v50[5];
  _QWORD v51[5];
  id v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint8_t buf[4];
  MSStickerView *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  ms_defaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v59 = self;
    _os_log_impl(&dword_1DB1A9000, v5, OS_LOG_TYPE_DEFAULT, "<MSStickerView: %p> dragInteraction:itemsForBeginningSession:", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  -[MSStickerView effectView](self, "effectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  if (v9 == v12 && v11 == v13)
  {
    -[MSStickerView imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;

    if (v24 == v12 && v26 == v13)
    {
      -[MSStickerView frame](self, "frame");
      v37 = v39;
      v38 = v40;
      v34 = v41;
      v36 = v42;
      goto LABEL_15;
    }
    -[MSStickerView effectView](self, "effectView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView effectView](self, "effectView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "center");
    objc_msgSend(v28, "convertPoint:toView:", 0);
    v18 = v30;
    v20 = v31;

    -[MSStickerView imageView](self, "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MSStickerView effectView](self, "effectView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView effectView](self, "effectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "center");
    objc_msgSend(v15, "convertPoint:toView:", 0);
    v18 = v17;
    v20 = v19;

    -[MSStickerView effectView](self, "effectView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v21;
  objc_msgSend(v21, "bounds");
  v34 = v33;
  v36 = v35;
  v37 = v18 - v33 * 0.5;
  v38 = v20 - v35 * 0.5;

LABEL_15:
  -[MSStickerView sticker](self, "sticker");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_opt_class();
  v45 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke;
  v51[3] = &unk_1EA25CA60;
  v51[4] = self;
  v52 = v43;
  v53 = v37;
  v54 = v38;
  v55 = v34;
  v56 = v36;
  v46 = v43;
  objc_msgSend(v6, "registerObjectOfClass:visibility:loadHandler:", v44, 0, v51);
  -[MSStickerView _registerStandardRepresentationsInItemProvider:](self, "_registerStandardRepresentationsInItemProvider:", v6);
  -[MSStickerView _registerRepresentationsInItemProvider:](self, "_registerRepresentationsInItemProvider:", v6);
  v50[0] = v45;
  v50[1] = 3221225472;
  v50[2] = __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke_126;
  v50[3] = &unk_1EA25CA88;
  v50[4] = self;
  objc_msgSend(v6, "registerItemForTypeIdentifier:loadHandler:", CFSTR("com.apple.sticker"), v50);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v6);
  v57 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

uint64_t __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _MSMessageMediaPayload *, _QWORD);
  NSObject *v4;
  uint64_t v5;
  _MSMessageMediaPayload *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ms_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1DB1A9000, v4, OS_LOG_TYPE_DEFAULT, "<MSStickerView: %p> Item provider load for _MSMessageMediaPayload", (uint8_t *)&v8, 0xCu);
  }

  v6 = -[_MSMessageMediaPayload initWithSticker:]([_MSMessageMediaPayload alloc], "initWithSticker:", *(_QWORD *)(a1 + 40));
  -[_MSMessageMediaPayload setSourceFrame:](v6, "setSourceFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  -[_MSMessageMediaPayload setInitialFrameIndex:](v6, "setInitialFrameIndex:", objc_msgSend(*(id *)(a1 + 32), "initialFrameIndexForCurrentDrag"));
  v3[2](v3, v6, 0);

  return 0;
}

void __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke_126(uint64_t a1, void *a2)
{
  void (**v3)(id, void *, _QWORD);
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ms_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_1DB1A9000, v4, OS_LOG_TYPE_DEFAULT, "<MSStickerView: %p> Item provider load for com.apple.sticker", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v6, 0);

}

- (void)_registerRepresentationsInItemProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MSStickerView sticker](self, "sticker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "representations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "hasItemConformingToTypeIdentifier:", v12);

        if ((v13 & 1) == 0)
        {
          objc_msgSend(v11, "type");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __56__MSStickerView__registerRepresentationsInItemProvider___block_invoke;
          v15[3] = &unk_1EA25CA88;
          v15[4] = v11;
          objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v14, v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

void __56__MSStickerView__registerRepresentationsInItemProvider___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a2)[2](v4, v5, 0);

}

- (void)_registerStandardRepresentationsInItemProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
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
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  MSStickerView *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  MSStickerView *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  void *v40;
  MSStickerView *v41;

  v4 = a3;
  -[MSStickerView sticker](self, "sticker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSStickerView sticker](self, "sticker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke;
    v39[3] = &unk_1EA25CAB0;
    v40 = v8;
    v41 = self;
    v10 = v8;
    objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v9, v39);

    v11 = v40;
  }
  else
  {
    objc_msgSend(v7, "representations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[MSStickerView representationForRole:](self, "representationForRole:", CFSTR("com.apple.stickers.role.animated"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[MSStickerView representationForRole:](self, "representationForRole:", CFSTR("com.apple.stickers.role.still"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v10 == v11)
    {
      objc_msgSend(v10, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_2;
      v37[3] = &unk_1EA25CA88;
      v38 = v10;
      objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v14, v37);

    }
    if (v13)
    {
      -[MSStickerView effectView](self, "effectView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "effect");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v13, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSStickerView window](self, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "screen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      objc_msgSend(v17, "imageWithData:scale:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "type");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v22, "isEqualToString:", v23);

      if ((_DWORD)v20)
      {
        objc_msgSend(v13, "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_3;
        v32[3] = &unk_1EA25CB00;
        v33 = v16;
        v34 = v21;
        v35 = self;
        v36 = v13;
        objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v24, v32);

      }
      objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_5;
      v28[3] = &unk_1EA25CB28;
      v29 = v16;
      v30 = v21;
      v31 = self;
      v26 = v21;
      v27 = v16;
      objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v25, v28);

    }
  }

}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CEA638];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "imageFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithContentsOfFile:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addPNGImage:completion:", v8, v5);
}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_2(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a2)[2](v4, v5, 0);

}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v6 = a2;
  v7 = a4;
  if (*(_QWORD *)(a1 + 32) && +[MSSticker _isHEICSupported](MSSticker, "_isHEICSupported"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isStickersAppEnabled");

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_4;
      v13[3] = &unk_1EA25CAD8;
      v13[4] = *(_QWORD *)(a1 + 48);
      v14 = v6;
      objc_msgSend(v10, "applyToImage:completion:", v11, v13);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v12, 0);

  }
}

uint64_t __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addHEICImage:completion:", a2, *(_QWORD *)(a1 + 40));
}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v6 = a2;
  v7 = a4;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isStickersAppEnabled");

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_6;
      v12[3] = &unk_1EA25CAD8;
      v12[4] = *(_QWORD *)(a1 + 48);
      v13 = v6;
      objc_msgSend(v10, "applyToImage:completion:", v11, v12);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addPNGImage:completion:", *(_QWORD *)(a1 + 40), v6);
  }

}

uint64_t __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addPNGImage:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (id)representationForRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MSStickerView sticker](self, "sticker", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "representations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "role");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)addHEICImage:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *, _QWORD);

  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(a3, "__ms_HEICData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[2](v7, v5, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.stickers-error"), -1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v6);

  }
}

- (void)addPNGImage:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  id v6;

  v5 = (void (**)(id, id, _QWORD))a4;
  objc_msgSend(a3, "__ms_PNGData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);

}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v4;

  -[MSStickerView _stickerSendManager](self, "_stickerSendManager", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerDruidDragStarted");

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void *v7;
  void *v8;

  -[MSStickerView _stickerSendManager](self, "_stickerSendManager", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView sticker](self, "sticker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stickerDruidDragEndedWithMSSticker:", v8);

  -[MSStickerView _resetPeel](self, "_resetPeel");
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[MSStickerView _logStickerUsage](self, "_logStickerUsage");
    -[MSStickerView _sendStickerUsageAnalyticsForDragAndDrop](self, "_sendStickerUsageAnalyticsForDragAndDrop");
  }
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = objc_alloc_init(MEMORY[0x1E0CEAD00]);
  objc_msgSend(v5, "set_wantsElasticEffects:", 1);
  objc_msgSend(v5, "set_resizable:", 1);
  objc_msgSend(v5, "set_rotatable:", 1);
  -[MSStickerView frame](self, "frame");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "set_maximumResizableSize:", 300.0, 300.0);
  objc_msgSend(v5, "set_minimumResizableSize:", v7, v9);
  return v5;
}

- (id)_stickerSendManager
{
  return +[_MSStickerSendManager sharedInstance](_MSStickerSendManager, "sharedInstance");
}

- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  int v20;

  v6 = a3;
  -[MSStickerView sticker](self, "sticker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stickerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("stickerIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MSStickerView_animatedStickerCreationProgressChanged_progress___block_invoke;
  block[3] = &unk_1EA25CB50;
  block[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = v6;
  v19 = a4;
  v20 = 1119092736;
  v10 = v6;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__MSStickerView_animatedStickerCreationProgressChanged_progress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "sticker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      v5 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {

      }
      else
      {
        v7 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

        if (!(_DWORD)v7)
          return;
      }
      objc_msgSend(*(id *)(a1 + 64), "valueForKey:", CFSTR("type"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("begin")))
      {
        objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = 0;
      }
      else
      {
        if (!objc_msgSend(v19, "isEqualToString:", CFSTR("end")))
        {
          if (!objc_msgSend(v19, "isEqualToString:", CFSTR("update")))
            goto LABEL_13;
          objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setHidden:", 0);

          v15 = *(double *)(a1 + 72);
          if (v15 == 100.0)
          {
            objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v16;
            *(float *)&v17 = *(float *)(a1 + 80) / 100.0;
          }
          else
          {
            v18 = v15 * *(float *)(a1 + 80) / 100.0;
            objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v16;
            v17 = v18 / 100.0;
            *(float *)&v17 = v18 / 100.0;
          }
          objc_msgSend(v16, "setProgress:", v17);
LABEL_12:

LABEL_13:
          return;
        }
        objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = 1.0;
        objc_msgSend(v12, "setProgress:", v13);

        objc_msgSend(*(id *)(a1 + 32), "roundProgressView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = 1;
      }
      objc_msgSend(v9, "setHidden:", v11);
      goto LABEL_12;
    }
  }
}

- (MSSticker)sticker
{
  return self->_sticker;
}

- (NSTimeInterval)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (NSError)stickerError
{
  return self->_stickerError;
}

- (void)setStickerError:(id)a3
{
  objc_storeStrong((id *)&self->_stickerError, a3);
}

- (UIImage)stickerImage
{
  return self->_stickerImage;
}

- (void)setStickerImage:(id)a3
{
  objc_storeStrong((id *)&self->_stickerImage, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)outlineImageView
{
  return self->_outlineImageView;
}

- (void)setOutlineImageView:(id)a3
{
  objc_storeStrong((id *)&self->_outlineImageView, a3);
}

- (VKCStickerEffectView)effectView
{
  return self->_effectView;
}

- (PXRoundProgressView)roundProgressView
{
  return self->_roundProgressView;
}

- (void)setRoundProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_roundProgressView, a3);
}

- (IMAnimatedImageProtocol)image
{
  return self->_image;
}

- (IMImageDataProtocol)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (unint64_t)initialFrameIndexForCurrentDrag
{
  return self->_initialFrameIndexForCurrentDrag;
}

- (void)setInitialFrameIndexForCurrentDrag:(unint64_t)a3
{
  self->_initialFrameIndexForCurrentDrag = a3;
}

- (BOOL)initialLayoutComplete
{
  return self->_initialLayoutComplete;
}

- (void)setInitialLayoutComplete:(BOOL)a3
{
  self->_initialLayoutComplete = a3;
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (_MSStickerDragPreviewContainerView)container
{
  return (_MSStickerDragPreviewContainerView *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (BOOL)isPeeled
{
  return self->_isPeeled;
}

- (void)setIsPeeled:(BOOL)a3
{
  self->_isPeeled = a3;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (double)animationOffset
{
  return self->_animationOffset;
}

- (void)setAnimationOffset:(double)a3
{
  self->_animationOffset = a3;
}

- (id)dragPreviewLiftContainerProvider
{
  return self->_dragPreviewLiftContainerProvider;
}

- (void)setDragPreviewLiftContainerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dragPreviewLiftContainerProvider, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_roundProgressView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_outlineImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_stickerImage, 0);
  objc_storeStrong((id *)&self->_stickerError, 0);
  objc_storeStrong((id *)&self->_sticker, 0);
}

- (void)sizeThatFits:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1DB1A9000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)sizeThatFits:(objc_class *)a1 .cold.2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)setSticker:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1DB1A9000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)setSticker:(objc_class *)a1 .cold.2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_stickerPreviewCachePreviewDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1DB1A9000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_stickerPreviewCachePreviewDidChange:(objc_class *)a1 .cold.2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1DB1A9000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1DB1A9000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_4(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

@end
