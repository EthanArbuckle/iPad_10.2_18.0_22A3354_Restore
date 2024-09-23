@implementation HUCameraLiveButtonView

- (void)didMoveToSuperview
{
  void *v3;
  HUCameraLiveButtonView *v4;
  void *v5;
  void *v6;
  HUCameraLiveButtonView *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUCameraLiveButtonView;
  -[HUCameraLiveButtonView didMoveToSuperview](&v9, sel_didMoveToSuperview);
  -[HUCameraLiveButtonView avBackground](self, "avBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (HUCameraLiveButtonView *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[HUCameraLiveButtonView avBackground](self, "avBackground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLiveButtonView addSubview:](self, "addSubview:", v5);

  }
  -[HUCameraLiveButtonView liveButton](self, "liveButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (HUCameraLiveButtonView *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    -[HUCameraLiveButtonView liveButton](self, "liveButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLiveButtonView addSubview:](self, "addSubview:", v8);

  }
}

- (UIButton)liveButton
{
  UIButton *liveButton;
  UIButton *v4;
  void *v5;
  UIButton *v6;

  liveButton = self->_liveButton;
  if (!liveButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberLiveButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 16.0);
    -[UIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 18.0, 0.0, 18.0);
    v6 = self->_liveButton;
    self->_liveButton = v4;

    liveButton = self->_liveButton;
  }
  return liveButton;
}

- (AVBackgroundView)avBackground
{
  AVBackgroundView *avBackground;
  id v4;
  AVBackgroundView *v5;

  avBackground = self->_avBackground;
  if (!avBackground)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C8B3F8]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "_setContinuousCornerRadius:", 16.0);
    v5 = self->_avBackground;
    self->_avBackground = (AVBackgroundView *)v4;

    avBackground = self->_avBackground;
  }
  return avBackground;
}

- (void)updateDisplayForStreaming:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLiveButtonView liveButton](self, "liveButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraLiveButtonView liveButton](self, "liveButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveButtonView liveButton](self, "liveButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[9];

  v33[7] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)HUCameraLiveButtonView;
  -[HUCameraLiveButtonView updateConstraints](&v32, sel_updateConstraints);
  v19 = (void *)MEMORY[0x1E0CB3718];
  -[HUCameraLiveButtonView avBackground](self, "avBackground");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveButtonView rightAnchor](self, "rightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v28;
  -[HUCameraLiveButtonView avBackground](self, "avBackground");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 44.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v25;
  -[HUCameraLiveButtonView avBackground](self, "avBackground");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveButtonView liveButton](self, "liveButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v20;
  -[HUCameraLiveButtonView avBackground](self, "avBackground");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveButtonView centerYAnchor](self, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v15;
  -[HUCameraLiveButtonView liveButton](self, "liveButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveButtonView rightAnchor](self, "rightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v4;
  -[HUCameraLiveButtonView liveButton](self, "liveButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraLiveButtonView centerYAnchor](self, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v8;
  -[HUCameraLiveButtonView liveButton](self, "liveButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 44.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v12);

}

- (void)setLiveButton:(id)a3
{
  objc_storeStrong((id *)&self->_liveButton, a3);
}

- (void)setAvBackground:(id)a3
{
  objc_storeStrong((id *)&self->_avBackground, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avBackground, 0);
  objc_storeStrong((id *)&self->_liveButton, 0);
}

@end
