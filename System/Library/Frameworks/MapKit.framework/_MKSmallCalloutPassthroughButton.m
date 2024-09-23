@implementation _MKSmallCalloutPassthroughButton

- (_MKSmallCalloutPassthroughButton)initWithFrame:(CGRect)a3
{
  _MKSmallCalloutPassthroughButton *v3;
  _MKSmallCalloutPassthroughButton *v4;
  _MKSmallCalloutPassthroughButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKSmallCalloutPassthroughButton;
  v3 = -[_MKSmallCalloutPassthroughButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_MKSmallCalloutPassthroughButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_handleTap_, 64);
    v5 = v4;
  }

  return v4;
}

- (void)handleTap:(id)a3
{
  -[UIControl sendActionsForControlEvents:](self->_targetControl, "sendActionsForControlEvents:", 64);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  UIView *highlightView;
  id v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MKSmallCalloutPassthroughButton;
  -[_MKSmallCalloutPassthroughButton setHighlighted:](&v16, sel_setHighlighted_);
  if (v3 && self->_targetControl)
  {
    highlightView = self->_highlightView;
    if (!highlightView)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_highlightView;
      self->_highlightView = v7;

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.150000006);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v9);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_highlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      highlightView = self->_highlightView;
    }
    -[_MKSmallCalloutPassthroughButton insertSubview:atIndex:](self, "insertSubview:atIndex:", highlightView, 0);
    v10 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_highlightView"), self->_highlightView, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_highlightView]|"), 0, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKSmallCalloutPassthroughButton addConstraints:](self, "addConstraints:", v12);

    v13 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_highlightView"), self->_highlightView, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_highlightView]|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKSmallCalloutPassthroughButton addConstraints:](self, "addConstraints:", v15);

  }
  else
  {
    -[UIView removeFromSuperview](self->_highlightView, "removeFromSuperview");
  }
}

- (UIControl)targetControl
{
  return self->_targetControl;
}

- (void)setTargetControl:(id)a3
{
  objc_storeStrong((id *)&self->_targetControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_targetControl, 0);
}

@end
