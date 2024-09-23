@implementation HUCameraRecordingPlayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVPlayerLayer)playerLayer
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class();
  -[HUCameraRecordingPlayerView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  return (AVPlayerLayer *)v6;
}

- (HUCameraRecordingPlayerView)initWithPlayer:(id)a3 displayingProgressView:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  HUCameraRecordingPlayerView *v8;
  HUCameraRecordingPlayerView *v9;
  void *v10;
  uint64_t v11;
  UIProgressView *progressView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];

  v4 = a4;
  v26[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HUCameraRecordingPlayerView;
  v8 = -[HUCameraRecordingPlayerView init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_player, a3);
    -[HUCameraRecordingPlayerView playerLayer](v9, "playerLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlayer:", v7);

    if (v4)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8E8]), "initWithProgressViewStyle:", 0);
      progressView = v9->_progressView;
      v9->_progressView = (UIProgressView *)v11;

      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIProgressView setTintColor:](v9->_progressView, "setTintColor:", v13);

      -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v9->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HUCameraRecordingPlayerView addSubview:](v9, "addSubview:", v9->_progressView);
      -[UIProgressView leftAnchor](v9->_progressView, "leftAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraRecordingPlayerView leftAnchor](v9, "leftAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 10.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v14;
      -[UIProgressView rightAnchor](v9->_progressView, "rightAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraRecordingPlayerView rightAnchor](v9, "rightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -10.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v17;
      -[UIProgressView bottomAnchor](v9->_progressView, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraRecordingPlayerView bottomAnchor](v9, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -10.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
    }
  }

  return v9;
}

- (AVPlayer)player
{
  return self->_player;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
