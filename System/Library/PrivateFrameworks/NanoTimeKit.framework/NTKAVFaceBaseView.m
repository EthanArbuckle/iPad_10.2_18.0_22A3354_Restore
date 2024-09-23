@implementation NTKAVFaceBaseView

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NTKAVFaceBaseView setVideoPlayerView:](self, "setVideoPlayerView:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKAVFaceBaseView;
  -[NTKFaceView dealloc](&v4, sel_dealloc);
}

- (NTKAVFaceBaseView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  NTKAVFaceBaseView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKAVFaceBaseView;
  v5 = -[NTKFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v8, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__mediaServicesWereReset_, *MEMORY[0x1E0C89738], 0);

  }
  return v5;
}

- (void)_loadSnapshotContentViews
{
  UIImageView *v3;
  UIImageView *posterImageView;
  UIImageView *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKAVFaceBaseView;
  -[NTKBackgroundImageFaceView _loadSnapshotContentViews](&v8, sel__loadSnapshotContentViews);
  if (!self->_posterImageView)
  {
    -[NTKAVFaceBaseView _posterImageView](self, "_posterImageView");
    v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    posterImageView = self->_posterImageView;
    self->_posterImageView = v3;
    v5 = v3;

    -[NTKBackgroundImageFaceView backgroundContainerView](self, "backgroundContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_posterImageView);

    -[NTKBackgroundImageFaceView backgroundContainerView](self, "backgroundContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendSubviewToBack:", self->_posterImageView);

  }
}

- (void)_unloadSnapshotContentViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAVFaceBaseView;
  -[NTKBackgroundImageFaceView _unloadSnapshotContentViews](&v3, sel__unloadSnapshotContentViews);
  -[UIImageView removeFromSuperview](self->_posterImageView, "removeFromSuperview");
}

- (id)_selectedContentView
{
  kdebug_trace();
  return self->_posterImageView;
}

- (void)_transitionToPosterView:(id)a3
{
  id v4;
  void *v5;
  void *posterImageView;
  UIImageView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = v4;
  if (self->_posterImageView)
  {
    objc_msgSend(v4, "image");
    posterImageView = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_posterImageView, "setImage:", posterImageView);
  }
  else
  {
    v7 = (UIImageView *)v4;
    posterImageView = self->_posterImageView;
    self->_posterImageView = v7;
  }

  v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[CLKVideoPlayerView bounds](self->_videoPlayerView, "bounds");
  v9 = (void *)objc_msgSend(v8, "initWithFrame:");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "setAlpha:", 0.0);
  -[NTKFaceView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSubview:aboveSubview:", v9, self->_videoPlayerView);

  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke;
  v17[3] = &unk_1E6BCD5F0;
  v18 = v9;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_2;
  v15[3] = &unk_1E6BD20B8;
  v15[4] = self;
  v16 = v18;
  v14 = v18;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 0x10000, v17, v15, 0.2, 0.0);

}

uint64_t __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "pause");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "backgroundContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088));

  objc_msgSend(*(id *)(a1 + 32), "backgroundContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setHidden:", 0);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_3;
  v9[3] = &unk_1E6BCD778;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_4;
  v7[3] = &unk_1E6BD05C8;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 0x10000, v9, v7, 0.3, 0.0);

}

uint64_t __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "posterImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __45__NTKAVFaceBaseView__transitionToPosterView___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_prepareForEditing
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAVFaceBaseView;
  -[NTKBackgroundImageFaceView _prepareForEditing](&v4, sel__prepareForEditing);
  -[NTKAVFaceBaseView _posterImageView](self, "_posterImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAVFaceBaseView _transitionToPosterView:](self, "_transitionToPosterView:", v3);

}

- (void)_beginTransitionToOption
{
  -[UIImageView removeFromSuperview](self->_posterImageView, "removeFromSuperview");
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKAVFaceBaseView;
  -[NTKBackgroundImageFaceView _cleanupAfterTransitionToOption:forCustomEditMode:slot:](&v8, sel__cleanupAfterTransitionToOption_forCustomEditMode_slot_, a3, a4, a5);
  -[NTKBackgroundImageFaceView backgroundContainerView](self, "backgroundContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_posterImageView);

  -[NTKBackgroundImageFaceView backgroundContainerView](self, "backgroundContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendSubviewToBack:", self->_posterImageView);

}

- (void)_mediaServicesWereReset:(id)a3
{
  _QWORD block[5];

  kdebug_trace();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NTKAVFaceBaseView__mediaServicesWereReset___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __45__NTKAVFaceBaseView__mediaServicesWereReset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKAVFaceBaseView;
  -[NTKDigitalFaceView layoutSubviews](&v11, sel_layoutSubviews);
  -[NTKAVFaceBaseView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_posterImageView, "ntk_setBoundsAndPositionFromFrame:");
  -[CLKVideoPlayerView ntk_setBoundsAndPositionFromFrame:](self->_videoPlayerView, "ntk_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
}

- (CLKVideoPlayerView)videoPlayerView
{
  -[NTKAVFaceBaseView _createVideoPlayerViewIfNeeded](self, "_createVideoPlayerViewIfNeeded");
  return self->_videoPlayerView;
}

- (void)pauseVideoPlayerViewIfItExists
{
  -[CLKVideoPlayerView pause](self->_videoPlayerView, "pause");
}

- (void)_createVideoPlayerViewIfNeeded
{
  id v3;
  void *v4;

  if (!self->_videoPlayerView)
  {
    kdebug_trace();
    v3 = objc_alloc(MEMORY[0x1E0C94570]);
    -[NTKAVFaceBaseView bounds](self, "bounds");
    v4 = (void *)objc_msgSend(v3, "initWithFrame:");
    -[NTKAVFaceBaseView setVideoPlayerView:](self, "setVideoPlayerView:", v4);

    -[CLKVideoPlayerView setDelegate:](self->_videoPlayerView, "setDelegate:", self);
  }
}

- (void)_reset
{
  UIImageView *posterImageView;

  -[CLKVideoPlayerView setDelegate:](self->_videoPlayerView, "setDelegate:", 0);
  -[CLKVideoPlayerView pause](self->_videoPlayerView, "pause");
  -[CLKVideoPlayerView removeFromSuperview](self->_videoPlayerView, "removeFromSuperview");
  -[NTKAVFaceBaseView setVideoPlayerView:](self, "setVideoPlayerView:", 0);
  -[NTKAVFaceBaseView _createVideoPlayerViewIfNeeded](self, "_createVideoPlayerViewIfNeeded");
  if (-[NTKFaceView dataMode](self, "dataMode") == 1)
  {
    -[UIImageView removeFromSuperview](self->_posterImageView, "removeFromSuperview");
    posterImageView = self->_posterImageView;
    self->_posterImageView = 0;

    -[NTKAVFaceBaseView addSubview:](self, "addSubview:", self->_videoPlayerView);
    -[NTKAVFaceBaseView sendSubviewToBack:](self, "sendSubviewToBack:", self->_videoPlayerView);
  }
}

- (id)_posterImageView
{
  return 0;
}

- (void)setVideoPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayerView, a3);
}

- (UIImageView)posterImageView
{
  return self->_posterImageView;
}

- (void)setPosterImageView:(id)a3
{
  objc_storeStrong((id *)&self->_posterImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterImageView, 0);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
}

@end
