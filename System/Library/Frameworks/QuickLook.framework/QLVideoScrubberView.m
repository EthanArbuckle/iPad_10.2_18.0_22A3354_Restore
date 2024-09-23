@implementation QLVideoScrubberView

- (void)layoutSubviews
{
  double v2;
  uint64_t v4;
  id v5;
  PHVideoScrubberView *v6;
  PHVideoScrubberView *photosScrubber;
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_photosScrubber)
  {
    gotLoadHelper_x8__OBJC_CLASS___PHVideoScrubberView(v2);
    v5 = objc_alloc(*(Class *)(v4 + 3352));
    -[QLVideoScrubberView bounds](self, "bounds");
    v6 = (PHVideoScrubberView *)objc_msgSend(v5, "initWithFrame:");
    photosScrubber = self->_photosScrubber;
    self->_photosScrubber = v6;

    -[PHVideoScrubberView setInteractionDelegate:](self->_photosScrubber, "setInteractionDelegate:", self);
    -[QLVideoScrubberView addSubview:](self, "addSubview:", self->_photosScrubber);
    -[PHVideoScrubberView setTranslatesAutoresizingMaskIntoConstraints:](self->_photosScrubber, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[QLVideoScrubberView leftAnchor](self, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHVideoScrubberView leftAnchor](self->_photosScrubber, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    -[QLVideoScrubberView rightAnchor](self, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHVideoScrubberView rightAnchor](self->_photosScrubber, "rightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v9;
    -[QLVideoScrubberView topAnchor](self, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHVideoScrubberView topAnchor](self->_photosScrubber, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v12;
    -[QLVideoScrubberView bottomAnchor](self, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHVideoScrubberView bottomAnchor](self->_photosScrubber, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLVideoScrubberView addConstraints:](self, "addConstraints:", v16);

  }
}

- (PHVideoScrubberView)photosScrubber
{
  PHVideoScrubberView *photosScrubber;

  photosScrubber = self->_photosScrubber;
  if (!photosScrubber)
  {
    -[QLVideoScrubberView layoutSubviews](self, "layoutSubviews");
    photosScrubber = self->_photosScrubber;
  }
  return photosScrubber;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)-[PHVideoScrubberView scrollView](self->_photosScrubber, "scrollView");
}

- (void)didEndTouchingVideoScrubberView:(id)a3
{
  self->_touchGestureIsActive = 0;
  -[QLVideoScrubberView _updateUserInteractingWithScrubberIfNeeded](self, "_updateUserInteractingWithScrubberIfNeeded", a3);
}

- (void)didBeginTouchingVideoScrubberView:(id)a3
{
  self->_touchGestureIsActive = 1;
  -[QLVideoScrubberView _updateUserInteractingWithScrubberIfNeeded](self, "_updateUserInteractingWithScrubberIfNeeded", a3);
}

- (void)_updateUserInteractingWithScrubberIfNeeded
{
  void *v3;
  id v4;

  if (self->_touchGestureIsActive)
  {
    -[QLVideoScrubberView setUserInteractingWithScrubber:](self, "setUserInteractingWithScrubber:", 1);
  }
  else
  {
    -[QLVideoScrubberView scrollView](self, "scrollView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isDragging"))
    {
      -[QLVideoScrubberView setUserInteractingWithScrubber:](self, "setUserInteractingWithScrubber:", 1);
    }
    else
    {
      -[QLVideoScrubberView scrollView](self, "scrollView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLVideoScrubberView setUserInteractingWithScrubber:](self, "setUserInteractingWithScrubber:", objc_msgSend(v3, "isDecelerating"));

    }
  }
}

- (BOOL)isUserInteractingWithScrubber
{
  return self->_userInteractingWithScrubber;
}

- (void)setUserInteractingWithScrubber:(BOOL)a3
{
  self->_userInteractingWithScrubber = a3;
}

- (BOOL)touchGestureIsActive
{
  return self->_touchGestureIsActive;
}

- (void)setTouchGestureIsActive:(BOOL)a3
{
  self->_touchGestureIsActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosScrubber, 0);
}

@end
