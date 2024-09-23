@implementation CFXPlayButtonView

- (CFXPlayButtonView)initWithCoder:(id)a3
{
  CFXPlayButtonView *v3;
  CFXPlayButtonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXPlayButtonView;
  v3 = -[CFXPlayButtonView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[CFXPlayButtonView sharedInit](v3, "sharedInit");
  return v4;
}

- (CFXPlayButtonView)initWithFrame:(CGRect)a3
{
  CFXPlayButtonView *v3;
  CFXPlayButtonView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CFXPlayButtonView;
  v3 = -[CFXPlayButtonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CFXPlayButtonView sharedInit](v3, "sharedInit");
  return v4;
}

- (void)sharedInit
{
  void *v3;
  id v4;
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
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x24BDAC8D0];
  -[CFXPlayButtonView setClipsToBounds:](self, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "loadNibNamed:owner:options:", CFSTR("CFXPlayButtonView"), self, 0);

  -[CFXPlayButtonView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView addSubview:](self, "addSubview:", v5);

  -[CFXPlayButtonView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v35 = (void *)MEMORY[0x24BDD1628];
  -[CFXPlayButtonView contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView leadingAnchor](self, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v39;
  -[CFXPlayButtonView contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView trailingAnchor](self, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v34;
  -[CFXPlayButtonView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v10;
  -[CFXPlayButtonView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView bottomAnchor](self, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v15);

  v16 = (void *)MEMORY[0x24BDF6870];
  -[CFXPlayButtonView bounds](self, "bounds");
  objc_msgSend(v16, "bezierPathWithOvalInRect:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView setBackgroundColor:](self, "setBackgroundColor:", v18);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView setPlayControlMaskLayer:](self, "setPlayControlMaskLayer:", v19);

  v20 = objc_retainAutorelease(v17);
  v21 = objc_msgSend(v20, "CGPath");
  -[CFXPlayButtonView playControlMaskLayer](self, "playControlMaskLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPath:", v21);

  v23 = *MEMORY[0x24BDE5988];
  -[CFXPlayButtonView playControlMaskLayer](self, "playControlMaskLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFillRule:", v23);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = objc_msgSend(v25, "CGColor");
  -[CFXPlayButtonView playControlMaskLayer](self, "playControlMaskLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFillColor:", v26);

  -[CFXPlayButtonView playControlMaskLayer](self, "playControlMaskLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMask:", v28);

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 80.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("play.circle.fill"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView setPlayImage:](self, "setPlayImage:", v32);

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("pause.circle.fill"), v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView setPauseImage:](self, "setPauseImage:", v33);

}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXPlayButtonView;
  -[CFXPlayButtonView layoutSubviews](&v7, sel_layoutSubviews);
  v3 = (void *)MEMORY[0x24BDF6870];
  -[CFXPlayButtonView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGPath");
  -[CFXPlayButtonView playControlMaskLayer](self, "playControlMaskLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", v5);

}

- (void)playButtonTapped:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setSelected:", objc_msgSend(v4, "isSelected") ^ 1);
  v5 = objc_msgSend(v4, "isSelected");

  -[CFXPlayButtonView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "playButtonViewDidTapPlay:", self);
  else
    objc_msgSend(v6, "playButtonViewDidTapPause:", self);

}

- (void)notifyWasTapped
{
  id v3;

  -[CFXPlayButtonView playButton](self, "playButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView playButtonTapped:](self, "playButtonTapped:", v3);

}

- (void)notifyPlaybackDidStart
{
  void *v3;
  void *v4;
  id v5;

  -[CFXPlayButtonView playButton](self, "playButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView pauseImage](self, "pauseImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v4, 0);

  -[CFXPlayButtonView playButton](self, "playButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 1);

}

- (void)notifyPlaybackDidStop
{
  void *v3;
  void *v4;
  id v5;

  -[CFXPlayButtonView playButton](self, "playButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXPlayButtonView playImage](self, "playImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v4, 0);

  -[CFXPlayButtonView playButton](self, "playButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 0);

}

- (CFXPlayButtonViewDelegate)delegate
{
  return (CFXPlayButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAShapeLayer)playControlMaskLayer
{
  return self->_playControlMaskLayer;
}

- (void)setPlayControlMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_playControlMaskLayer, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIButton)playButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_playButton);
}

- (void)setPlayButton:(id)a3
{
  objc_storeWeak((id *)&self->_playButton, a3);
}

- (UIImage)playImage
{
  return self->_playImage;
}

- (void)setPlayImage:(id)a3
{
  objc_storeStrong((id *)&self->_playImage, a3);
}

- (UIImage)pauseImage
{
  return self->_pauseImage;
}

- (void)setPauseImage:(id)a3
{
  objc_storeStrong((id *)&self->_pauseImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_destroyWeak((id *)&self->_playButton);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_playControlMaskLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
