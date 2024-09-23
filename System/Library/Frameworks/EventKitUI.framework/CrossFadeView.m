@implementation CrossFadeView

- (CrossFadeView)initWithFrame:(CGRect)a3
{
  CrossFadeView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CrossFadeView;
  result = -[CrossFadeView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_scaleSize = 1;
  return result;
}

- (CrossFadeView)initWithStartView:(id)a3 endView:(id)a4 startFrame:(CGRect)a5 endFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v16;
  id v17;
  CrossFadeView *v18;
  CrossFadeView *v19;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.size.height;
  v11 = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v16 = a3;
  v17 = a4;
  v18 = -[CrossFadeView initWithFrame:](self, "initWithFrame:", v13, v12, v11, v10);
  v19 = v18;
  if (v18)
  {
    v18->_startFrame.origin.x = v13;
    v18->_startFrame.origin.y = v12;
    v18->_startFrame.size.width = v11;
    v18->_startFrame.size.height = v10;
    v18->_endFrame.origin.x = x;
    v18->_endFrame.origin.y = y;
    v18->_endFrame.size.width = width;
    v18->_endFrame.size.height = height;
    -[CrossFadeView setStartView:](v18, "setStartView:", v16);
    -[CrossFadeView setEndView:](v19, "setEndView:", v17);
  }

  return v19;
}

- (void)setStartView:(id)a3
{
  UIView *v5;
  UIView **p_startView;
  UIView *startView;
  CrossFadeView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_startView = &self->_startView;
  startView = self->_startView;
  v9 = v5;
  if (startView != v5)
  {
    if (startView)
    {
      -[UIView superview](startView, "superview");
      v8 = (CrossFadeView *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
        -[UIView removeFromSuperview](*p_startView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_startView, a3);
    if (*p_startView)
    {
      -[UIView removeFromSuperview](*p_startView, "removeFromSuperview");
      -[CrossFadeView addSubview:](self, "addSubview:", *p_startView);
      -[CrossFadeView bounds](self, "bounds");
      -[UIView setFrame:](*p_startView, "setFrame:");
      -[UIView setAutoresizingMask:](*p_startView, "setAutoresizingMask:", 18);
    }
  }

}

- (void)setEndView:(id)a3
{
  UIView *v5;
  UIView **p_endView;
  UIView *endView;
  CrossFadeView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_endView = &self->_endView;
  endView = self->_endView;
  v9 = v5;
  if (endView != v5)
  {
    if (endView)
    {
      -[UIView superview](endView, "superview");
      v8 = (CrossFadeView *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
        -[UIView removeFromSuperview](*p_endView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_endView, a3);
    if (*p_endView)
    {
      -[UIView removeFromSuperview](*p_endView, "removeFromSuperview");
      -[CrossFadeView addSubview:](self, "addSubview:", *p_endView);
      -[CrossFadeView bounds](self, "bounds");
      -[UIView setFrame:](*p_endView, "setFrame:");
      -[UIView setAutoresizingMask:](*p_endView, "setAutoresizingMask:", 18);
    }
  }

}

- (void)animateToStartStateWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v6 = a4;
  -[CrossFadeView setToEndState](self, "setToEndState");
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v10 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke;
  v11[3] = &unk_1E6018688;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke_2;
  v9[3] = &unk_1E6018CC0;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 327680, v11, v9, a3, 0.0);

}

uint64_t __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToStartState");
}

uint64_t __60__CrossFadeView_animateToStartStateWithDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animateToEndStateWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v6 = a4;
  -[CrossFadeView setToStartState](self, "setToStartState");
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v10 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke;
  v11[3] = &unk_1E6018688;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke_2;
  v9[3] = &unk_1E6018CC0;
  v8 = v6;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 327680, v11, v9, a3, 0.0);

}

uint64_t __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToEndState");
}

uint64_t __58__CrossFadeView_animateToEndStateWithDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)springAnimateToStartStateWithTimingFunction:(int)a3
{
  -[CrossFadeView springAnimateToStartStateWithTimingFunction:completion:](self, "springAnimateToStartStateWithTimingFunction:completion:", *(_QWORD *)&a3, 0);
}

- (void)springAnimateToStartStateWithTimingFunction:(int)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v5 = a4;
  -[CrossFadeView setToEndState](self, "setToEndState");
  v6 = (void *)MEMORY[0x1E0DC3F10];
  +[SpringFactory sharedFactory](SpringFactory, "sharedFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke;
  v11[3] = &unk_1E6018688;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke_2;
  v9[3] = &unk_1E6018CC0;
  v8 = v5;
  objc_msgSend(v6, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v7, v11, v9, 0.91, 0.0);

}

uint64_t __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToStartState");
}

uint64_t __72__CrossFadeView_springAnimateToStartStateWithTimingFunction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)springAnimateToEndStateWithTimingFunction:(int)a3
{
  -[CrossFadeView springAnimateToEndStateWithTimingFunction:completion:](self, "springAnimateToEndStateWithTimingFunction:completion:", *(_QWORD *)&a3, 0);
}

- (void)springAnimateToEndStateWithTimingFunction:(int)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v5 = a4;
  -[CrossFadeView setToStartState](self, "setToStartState");
  v6 = (void *)MEMORY[0x1E0DC3F10];
  +[SpringFactory sharedFactory](SpringFactory, "sharedFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke;
  v11[3] = &unk_1E6018688;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke_2;
  v9[3] = &unk_1E6018CC0;
  v8 = v5;
  objc_msgSend(v6, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v7, v11, v9, 0.91, 0.0);

}

uint64_t __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToEndState");
}

uint64_t __70__CrossFadeView_springAnimateToEndStateWithTimingFunction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setToStartState
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  id v8;

  if (-[CrossFadeView scaleSize](self, "scaleSize"))
  {
    -[CrossFadeView startFrame](self, "startFrame");
    scaleViewToFrame(self, v3, v4, v5, v6);
  }
  else
  {
    -[CrossFadeView frame](self, "frame");
    -[CrossFadeView startFrame](self, "startFrame");
    -[CrossFadeView setFrame:](self, "setFrame:");
  }
  -[CrossFadeView startView](self, "startView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  -[CrossFadeView endView](self, "endView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

}

- (void)setToEndState
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  id v8;

  if (-[CrossFadeView scaleSize](self, "scaleSize"))
  {
    -[CrossFadeView endFrame](self, "endFrame");
    scaleViewToFrame(self, v3, v4, v5, v6);
  }
  else
  {
    -[CrossFadeView frame](self, "frame");
    -[CrossFadeView endFrame](self, "endFrame");
    -[CrossFadeView setFrame:](self, "setFrame:");
  }
  -[CrossFadeView startView](self, "startView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  -[CrossFadeView endView](self, "endView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

}

- (void)haltAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CrossFadeView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[CrossFadeView startView](self, "startView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[CrossFadeView endView](self, "endView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllAnimations");

}

- (void)setScaleSize:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;

  self->_scaleSize = a3;
  if (a3)
  {
    -[CrossFadeView setAutoresizesSubviews:](self, "setAutoresizesSubviews:", 1);
    -[CrossFadeView startView](self, "startView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;

    -[CrossFadeView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    -[CrossFadeView startView](self, "startView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[CrossFadeView endView](self, "endView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;

    -[CrossFadeView bounds](self, "bounds");
  }
  else
  {
    -[CrossFadeView setAutoresizesSubviews:](self, "setAutoresizesSubviews:");
    -[CrossFadeView startView](self, "startView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;

    -[CrossFadeView startFrame](self, "startFrame");
    v27 = v26;
    v29 = v28;
    -[CrossFadeView startView](self, "startView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

    -[CrossFadeView endView](self, "endView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "frame");
    v16 = v32;
    v18 = v33;

    -[CrossFadeView endFrame](self, "endFrame");
  }
  v34 = v19;
  v35 = v20;
  -[CrossFadeView endView](self, "endView");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v16, v18, v34, v35);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)CrossFadeView;
  -[CrossFadeView description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CrossFadeView startView](self, "startView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CrossFadeView endView](self, "endView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CrossFadeView startFrame](self, "startFrame");
  NSStringFromCGRect(v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CrossFadeView endFrame](self, "endFrame");
  NSStringFromCGRect(v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  / startView = %@ / endView = %@ / startFrame = %@ / endFrame = %@"), v3, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIView)startView
{
  return self->_startView;
}

- (UIView)endView
{
  return self->_endView;
}

- (CGRect)startFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startFrame.origin.x;
  y = self->_startFrame.origin.y;
  width = self->_startFrame.size.width;
  height = self->_startFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)endFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endFrame.origin.x;
  y = self->_endFrame.origin.y;
  width = self->_endFrame.size.width;
  height = self->_endFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)scaleSize
{
  return self->_scaleSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endView, 0);
  objc_storeStrong((id *)&self->_startView, 0);
}

@end
