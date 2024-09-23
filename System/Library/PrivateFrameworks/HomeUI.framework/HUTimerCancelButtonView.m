@implementation HUTimerCancelButtonView

- (HUTimerCancelButtonView)initWithDelegate:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  HUTimerCancelButtonView *v10;
  HUTimerCancelButtonView *v11;
  uint64_t v12;
  UIView *circleBackgroundView;
  void *v14;
  uint64_t v15;
  UIButton *cancelButton;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUTimerCancelButtonView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[HUTimerCancelButtonView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_delegate, a3);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
    circleBackgroundView = v11->_circleBackgroundView;
    v11->_circleBackgroundView = (UIView *)v12;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11->_circleBackgroundView, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (UIButton *)v15;

    -[UIButton addTarget:action:forControlEvents:](v11->_cancelButton, "addTarget:action:forControlEvents:", v11, sel__cancelTimer_, 64);
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 7, 20.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v11->_cancelButton, "setImage:forState:", v18, 0);
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](v11->_cancelButton, "setTintColor:", v19);

    }
    -[HUTimerCancelButtonView addSubview:](v11, "addSubview:", v11->_circleBackgroundView);
    -[HUTimerCancelButtonView addSubview:](v11, "addSubview:", v11->_cancelButton);

  }
  return v11;
}

- (void)layoutSubviews
{
  double MidX;
  double MidY;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)HUTimerCancelButtonView;
  -[HUTimerCancelButtonView layoutSubviews](&v21, sel_layoutSubviews);
  -[HUTimerCancelButtonView bounds](self, "bounds");
  MidX = CGRectGetMidX(v22);
  -[HUTimerCancelButtonView bounds](self, "bounds");
  MidY = CGRectGetMidY(v23);
  -[HUTimerCancelButtonView bounds](self, "bounds");
  v6 = v5;
  -[HUTimerCancelButtonView bounds](self, "bounds");
  v8 = v7;
  -[HUTimerCancelButtonView circleBackgroundView](self, "circleBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v6, v8);

  -[HUTimerCancelButtonView circleBackgroundView](self, "circleBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11 * 0.5;
  -[HUTimerCancelButtonView circleBackgroundView](self, "circleBackgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setContinuousCornerRadius:", v12);

  -[HUTimerCancelButtonView circleBackgroundView](self, "circleBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCenter:", MidX, MidY);

  -[HUTimerCancelButtonView bounds](self, "bounds");
  v16 = v15 * 0.7;
  -[HUTimerCancelButtonView bounds](self, "bounds");
  v18 = v17 * 0.7;
  -[HUTimerCancelButtonView cancelButton](self, "cancelButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v16, v18);

  -[HUTimerCancelButtonView cancelButton](self, "cancelButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCenter:", MidX, MidY);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_cancelTimer:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HUTimerCancelButtonView *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2080;
    v9 = "-[HUTimerCancelButtonView _cancelTimer:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped cancel timer", (uint8_t *)&v6, 0x16u);
  }

  -[HUTimerCancelButtonView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelTimer");

}

- (UIView)circleBackgroundView
{
  return self->_circleBackgroundView;
}

- (void)setCircleBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_circleBackgroundView, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (HUTimerCancelDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_circleBackgroundView, 0);
}

@end
