@implementation MediaControlsContainerView

- (MediaControlsContainerView)initWithFrame:(CGRect)a3
{
  MediaControlsContainerView *v3;
  MediaControlsTimeControl *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  MediaControlsTimeControl *timeControl;
  MediaControlsTransportStackView *v11;
  MediaControlsTransportStackView *transportStackView;
  uint64_t v13;
  UIVisualEffectView *primaryVisualEffectView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MediaControlsContainerView;
  v3 = -[MediaControlsContainerView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MediaControlsTimeControl alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[MediaControlsTimeControl initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    timeControl = v3->_timeControl;
    v3->_timeControl = (MediaControlsTimeControl *)v9;

    v11 = -[MediaControlsTransportStackView initWithFrame:]([MediaControlsTransportStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    transportStackView = v3->_transportStackView;
    v3->_transportStackView = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
    primaryVisualEffectView = v3->_primaryVisualEffectView;
    v3->_primaryVisualEffectView = (UIVisualEffectView *)v13;

    -[MediaControlsContainerView primaryVisualEffectView](v3, "primaryVisualEffectView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsContainerView addSubview:](v3, "addSubview:", v15);

    -[MediaControlsContainerView primaryVisualEffectView](v3, "primaryVisualEffectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsContainerView timeControl](v3, "timeControl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    -[MediaControlsContainerView transportStackView](v3, "transportStackView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsContainerView addSubview:](v3, "addSubview:", v19);

    -[MediaControlsContainerView _updateStyle](v3, "_updateStyle");
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)MediaControlsContainerView;
  -[MediaControlsContainerView layoutSubviews](&v35, sel_layoutSubviews);
  -[MediaControlsContainerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[MediaControlsContainerView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  UIRoundToScale();
  -[MediaControlsContainerView primaryVisualEffectView](self, "primaryVisualEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  if (self->_style == 1)
  {
    UIRectIntegralWithScale();
    v14 = v13;
    v34 = v15;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    UIRectIntegralWithScale();
    v34 = v20;
    v17 = v21;
    v19 = v22;
    v14 = v23;
  }
  UIRectIntegralWithScale();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[MediaControlsContainerView transportStackView](self, "transportStackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  -[MediaControlsContainerView timeControl](self, "timeControl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v14, v34, v17, v19);

}

- (void)setEmpty:(BOOL)a3
{
  _BOOL4 empty;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  empty = self->_empty;
  if (empty != a3)
  {
    self->_empty = a3;
    empty = a3;
  }
  v5 = empty;
  -[MediaControlsContainerView timeControl](self, "timeControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEmpty:", v5);

  v7 = self->_empty;
  -[MediaControlsContainerView transportStackView](self, "transportStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEmpty:", v7);

  -[MediaControlsContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  void *v6;

  -[MediaControlsContainerView timeControl](self, "timeControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", a3);

  -[MediaControlsContainerView transportStackView](self, "transportStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", a3);

  if (self->_style != a3)
  {
    self->_style = a3;
    -[MediaControlsContainerView _updateStyle](self, "_updateStyle");
    -[MediaControlsContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRatingActionSheetDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MediaControlsContainerView transportStackView](self, "transportStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActionsDelegate:", v4);

}

- (void)setTimeControlOnScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MediaControlsContainerView timeControl](self, "timeControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeControlOnScreen:", v3);

}

- (BOOL)isTimeControlOnScreen
{
  void *v2;
  char v3;

  -[MediaControlsContainerView timeControl](self, "timeControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTimeControlOnScreen");

  return v3;
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
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[MediaControlsContainerView transportStackView](self, "transportStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MediaControlsContainerView timeControl](self, "timeControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponse:", v4);

  -[MediaControlsContainerView transportStackView](self, "transportStackView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponse:", v4);

}

- (MPCPlayerResponse)response
{
  void *v2;
  void *v3;

  -[MediaControlsContainerView transportStackView](self, "transportStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCPlayerResponse *)v3;
}

- (void)_updateStyle
{
  int64_t style;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  style = self->_style;
  if (style == 2)
  {
    -[MediaControlsContainerView timeControl](self, "timeControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[MediaControlsContainerView transportStackView](self, "transportStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
  }
  else
  {
    if (style == 1)
    {
      -[MediaControlsContainerView timeControl](self, "timeControl");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 0.0;
    }
    else
    {
      -[MediaControlsContainerView timeControl](self, "timeControl");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = 1.0;
    }
    objc_msgSend(v4, "setAlpha:", v6);

    -[MediaControlsContainerView transportStackView](self, "transportStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1.0;
  }
  v10 = v8;
  objc_msgSend(v8, "setAlpha:", v9);

}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (MediaControlsTransportStackView)transportStackView
{
  return self->_transportStackView;
}

- (void)setTransportStackView:(id)a3
{
  objc_storeStrong((id *)&self->_transportStackView, a3);
}

- (MediaControlsTimeControl)timeControl
{
  return self->_timeControl;
}

- (void)setTimeControl:(id)a3
{
  objc_storeStrong((id *)&self->_timeControl, a3);
}

- (UIVisualEffectView)primaryVisualEffectView
{
  return self->_primaryVisualEffectView;
}

- (void)setPrimaryVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryVisualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryVisualEffectView, 0);
  objc_storeStrong((id *)&self->_timeControl, 0);
  objc_storeStrong((id *)&self->_transportStackView, 0);
}

@end
