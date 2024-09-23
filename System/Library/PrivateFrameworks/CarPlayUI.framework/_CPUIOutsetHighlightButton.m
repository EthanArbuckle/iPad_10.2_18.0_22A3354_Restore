@implementation _CPUIOutsetHighlightButton

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  CPUIFocusRingView *focusRingView;
  CPUIFocusRingView *v7;
  CPUIFocusRingView *v8;
  CPUIFocusRingView *v9;
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
  objc_super v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)_CPUIOutsetHighlightButton;
  -[_CPUIOutsetHighlightButton didMoveToWindow](&v22, sel_didMoveToWindow);
  -[_CPUIOutsetHighlightButton window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    focusRingView = self->_focusRingView;

    if (focusRingView)
      return;
    -[_CPUIOutsetHighlightButton setClipsToBounds:](self, "setClipsToBounds:", 0);
    v7 = [CPUIFocusRingView alloc];
    v8 = -[CPUIFocusRingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v9 = self->_focusRingView;
    self->_focusRingView = v8;

    -[CPUIFocusRingView setTranslatesAutoresizingMaskIntoConstraints:](self->_focusRingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPUIFocusRingView setCornerRadius:](self->_focusRingView, "setCornerRadius:", 6.0);
    -[CPUIFocusRingView setRingWidth:](self->_focusRingView, "setRingWidth:", 3.0);
    -[CPUIFocusRingView setHidden:](self->_focusRingView, "setHidden:", 1);
    -[_CPUIOutsetHighlightButton addSubview:](self, "addSubview:", self->_focusRingView);
    v19 = (void *)MEMORY[0x24BDD1628];
    -[CPUIFocusRingView leadingAnchor](self->_focusRingView, "leadingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIOutsetHighlightButton leadingAnchor](self, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, -3.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v21;
    -[CPUIFocusRingView trailingAnchor](self->_focusRingView, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIOutsetHighlightButton trailingAnchor](self, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v18, 3.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v10;
    -[CPUIFocusRingView topAnchor](self->_focusRingView, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIOutsetHighlightButton topAnchor](self, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -3.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v13;
    -[CPUIFocusRingView bottomAnchor](self->_focusRingView, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUIOutsetHighlightButton bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 3.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v17);

  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  _CPUIOutsetHighlightButton *v5;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (_CPUIOutsetHighlightButton *)objc_claimAutoreleasedReturnValue();
  -[CPUIFocusRingView setHidden:](self->_focusRingView, "setHidden:", v5 != self);

}

- (CPUIFocusRingView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
  objc_storeStrong((id *)&self->_focusRingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusRingView, 0);
}

@end
