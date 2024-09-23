@implementation HUCameraMicrophoneControl

- (HUCameraMicrophoneControl)initWithFrame:(CGRect)a3
{
  HUCameraMicrophoneControl *v3;
  HUCameraMicrophoneControl *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCameraMicrophoneControl;
  v3 = -[HUCameraMicrophoneControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUCameraMicrophoneControl setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUCameraMicrophoneControl talkButton](v4, "talkButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraMicrophoneControl addSubview:](v4, "addSubview:", v5);

    -[HUCameraMicrophoneControl doneButton](v4, "doneButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraMicrophoneControl addSubview:](v4, "addSubview:", v6);

  }
  return v4;
}

- (UIButton)talkButton
{
  UIButton *talkButton;
  UIButton *v4;
  void *v5;
  void *v6;
  UIButton *v7;

  talkButton = self->_talkButton;
  if (!talkButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_talkStateForButton:usingStandardSymbolConfiguration:", v4, 1);
    -[UIButton heightAnchor](v4, "heightAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToConstant:", 44.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 1);

    -[UIButton setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UIButton sizeToFit](v4, "sizeToFit");
    v7 = self->_talkButton;
    self->_talkButton = v4;

    talkButton = self->_talkButton;
  }
  return talkButton;
}

- (UIButton)doneButton
{
  UIButton *doneButton;
  UIButton *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
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
  HUIconView *doneButtonIconView;
  id v21;
  UIButton *v22;

  doneButton = self->_doneButton;
  if (!doneButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_doneStateForButton:usingStandardSymbolConfiguration:", v4, 1);
    -[UIButton heightAnchor](v4, "heightAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToConstant:", 44.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 1);

    -[UIButton setHidden:](v4, "setHidden:", 1);
    -[UIButton setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v7 = objc_alloc_init(MEMORY[0x1E0D33720]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = objc_alloc(MEMORY[0x1E0D311C8]);
    v9 = (void *)objc_msgSend(v8, "initWithPackageIdentifier:", *MEMORY[0x1E0D304A8]);
    objc_msgSend(v7, "updateWithIconDescriptor:displayStyle:animated:", v9, 1, 1);
    -[UIButton addSubview:](v4, "addSubview:", v7);
    objc_msgSend(v7, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](v4, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 13.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(v7, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v4, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 10.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    objc_msgSend(v7, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 18.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    objc_msgSend(v7, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 18.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    doneButtonIconView = self->_doneButtonIconView;
    self->_doneButtonIconView = (HUIconView *)v7;
    v21 = v7;

    v22 = self->_doneButton;
    self->_doneButton = v4;

    doneButton = self->_doneButton;
  }
  return doneButton;
}

- (void)setTalking:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  if (self->_talking != a3)
  {
    v3 = a3;
    -[HUCameraMicrophoneControl talkButton](self, "talkButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    -[HUCameraMicrophoneControl doneButton](self, "doneButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3 ^ 1);

    self->_talking = v3;
    -[HUCameraMicrophoneControl invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  if (-[HUCameraMicrophoneControl isTalking](self, "isTalking"))
    -[HUCameraMicrophoneControl doneButton](self, "doneButton");
  else
    -[HUCameraMicrophoneControl talkButton](self, "talkButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = 44.0;
  v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)isTalking
{
  return self->_talking;
}

- (void)setTalkButton:(id)a3
{
  objc_storeStrong((id *)&self->_talkButton, a3);
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (HUIconView)doneButtonIconView
{
  return self->_doneButtonIconView;
}

- (void)setDoneButtonIconView:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonIconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonIconView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_talkButton, 0);
}

@end
