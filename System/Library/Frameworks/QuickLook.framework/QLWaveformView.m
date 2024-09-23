@implementation QLWaveformView

- (void)setAsset:(id)a3
{
  AVAsset *v5;
  AVAsset *v6;

  v5 = (AVAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[QLWaveformView updateImage](self, "updateImage");
    v5 = v6;
  }

}

- (void)updateImage
{
  NSObject **v3;
  NSObject *v4;
  CGSize *p_waveSize;
  double v6;
  UIImage *waveImage;
  UIView *v8;
  UIView *lineView;
  void *v10;
  UIImageView *waveView;
  id v12;
  UIImageView *v13;
  UIImageView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  double width;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[6];
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_DEFAULT, "Updating waveform image #Waveform", buf, 2u);
  }
  if (!self->_asset
    || (p_waveSize = &self->_waveSize, self->_waveSize.height == 0.0)
    || (v6 = p_waveSize->width, p_waveSize->width == 0.0))
  {
    waveImage = self->_waveImage;
    self->_waveImage = 0;

  }
  else
  {
    if (!self->_lineView)
    {
      v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, self->_waveSize.height * 0.5 + -0.5, p_waveSize->width, 1.0);
      lineView = self->_lineView;
      self->_lineView = v8;

      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_lineView, "setBackgroundColor:", v10);

      -[QLWaveformView addSubview:](self, "addSubview:", self->_lineView);
    }
    waveView = self->_waveView;
    if (!waveView)
    {
      v12 = objc_alloc(MEMORY[0x24BEBD668]);
      v13 = (UIImageView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
      v14 = self->_waveView;
      self->_waveView = v13;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_waveView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[QLWaveformView addSubview:](self, "addSubview:", self->_waveView);
      -[UIImageView leftAnchor](self->_waveView, "leftAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLWaveformView leftAnchor](self, "leftAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v29;
      -[UIImageView rightAnchor](self->_waveView, "rightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLWaveformView rightAnchor](self, "rightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v26;
      -[UIImageView bottomAnchor](self->_waveView, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLWaveformView bottomAnchor](self, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v17;
      -[UIImageView topAnchor](self->_waveView, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLWaveformView topAnchor](self, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLWaveformView addConstraints:](self, "addConstraints:", v21);

      waveView = self->_waveView;
    }
    -[UIImageView image](waveView, "image", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (v23)
    {
      *(_QWORD *)buf = 0;
      v34 = buf;
      v35 = 0x2020000000;
      v36 = 1;
      width = p_waveSize->width;
      -[QLWaveformView asset](self, "asset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __29__QLWaveformView_updateImage__block_invoke;
      v32[3] = &unk_24C725D78;
      v32[4] = self;
      v32[5] = buf;
      +[QLWaveformScrubberViewProvider generateWaveformForWidth:asset:updateHandler:](QLWaveformScrubberViewProvider, "generateWaveformForWidth:asset:updateHandler:", v25, v32, width);

      _Block_object_dispose(buf, 8);
    }
  }
}

void __29__QLWaveformView_updateImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject **v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a4;
  v6 = (NSObject **)MEMORY[0x24BE7BF48];
  v7 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_DEFAULT, "Waveform image delivered #Waveform", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateWithWaveformImage:", v5);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_expandWaveform");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)_expandWaveform
{
  __int128 v3;
  UIImageView *waveView;
  _QWORD v5[5];
  _QWORD v6[5];
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  -[UIImageView setAlpha:](self->_waveView, "setAlpha:", 0.0);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v8.c = v3;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformScale(&v9, &v8, 1.0, 0.0);
  waveView = self->_waveView;
  v7 = v9;
  -[UIImageView setTransform:](waveView, "setTransform:", &v7);
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__QLWaveformView__expandWaveform__block_invoke;
  v6[3] = &unk_24C724B00;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__QLWaveformView__expandWaveform__block_invoke_2;
  v5[3] = &unk_24C724B28;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v6, v5, 0.3, 0.0, 0.98, 40.0);
}

uint64_t __33__QLWaveformView__expandWaveform__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 448);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

void __33__QLWaveformView__expandWaveform__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 432);
  *(_QWORD *)(v2 + 432) = 0;

}

- (void)_updateWithWaveformImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *waveView;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBDB00];
  waveView = self->_waveView;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__QLWaveformView__updateWithWaveformImage___block_invoke;
  v8[3] = &unk_24C724778;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", waveView, 5242880, v8, 0, 0.25);

}

void __43__QLWaveformView__updateWithWaveformImage___block_invoke(uint64_t a1)
{
  NSObject **v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setImage:", *(_QWORD *)(a1 + 40));
  v1 = (NSObject **)MEMORY[0x24BE7BF48];
  v2 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v2 = *v1;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20D4F5000, v2, OS_LOG_TYPE_DEFAULT, "Waveform image was updated. #Waveform", v3, 2u);
  }
}

- (void)layoutSubviews
{
  CGSize *p_waveSize;
  double v4;
  double height;
  double v6;
  CGFloat v8;
  CGFloat v9;
  objc_super v10;

  p_waveSize = &self->_waveSize;
  -[QLWaveformView frame](self, "frame");
  height = p_waveSize->height;
  if (p_waveSize->width != v6 || height != v4)
  {
    -[QLWaveformView frame](self, "frame", p_waveSize->width, height);
    p_waveSize->width = v8;
    p_waveSize->height = v9;
    -[QLWaveformView updateImage](self, "updateImage");
  }
  v10.receiver = self;
  v10.super_class = (Class)QLWaveformView;
  -[QLWaveformView layoutSubviews](&v10, sel_layoutSubviews);
}

- (AVAsset)asset
{
  return self->_asset;
}

- (UIImage)placeholderImage
{
  return self->placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->placeholderImage, a3);
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->visibleRect.origin.x;
  y = self->visibleRect.origin.y;
  width = self->visibleRect.size.width;
  height = self->visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->visibleRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->placeholderImage, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_waveView, 0);
  objc_storeStrong((id *)&self->_waveImage, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
}

@end
