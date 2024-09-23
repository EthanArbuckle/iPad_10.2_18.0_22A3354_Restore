@implementation VMPlayerControlsView

- (VMPlayerControlsView)initWithCoder:(id)a3
{
  -[VMPlayerControlsView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMPlayerControlsView;
  -[VMPlayerControlsView commonInit](&v3, "commonInit");
  self->_constraintsLoaded = 0;
  self->_enabled = 1;
  self->_style = 0;
  -[VMPlayerControlsView loadSubviews](self, "loadSubviews");
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
  objc_msgSend(v5, "duration");
  v7 = v6;

  if (v7 != a3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
    objc_msgSend(v8, "setDuration:", a3);

  }
}

- (double)elapsedTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
  objc_msgSend(v2, "elapsedTime");
  v4 = v3;

  return v4;
}

- (void)setElapsedTime:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
  objc_msgSend(v4, "setElapsedTime:", a3);

}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
  objc_msgSend(v6, "setElapsedTime:animated:", v4, a3);

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMPlayerControlsView;
  -[VMPlayerControlsView setUserInteractionEnabled:](&v9, "setUserInteractionEnabled:");
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    if (v3)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));

      v5 = (void *)v6;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
    objc_msgSend(v7, "setUserInteractionEnabled:", v3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
    objc_msgSend(v8, "setTintColor:", v5);

  }
}

- (void)setState:(int64_t)a3
{
  -[VMPlayerControlsView setState:animated:](self, "setState:animated:", a3, 0);
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_state != a3)
    self->_state = a3;
}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[VMPlayerControlsView unloadConstraints](self, "unloadConstraints");
    if (a3 == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[VMPlayerControlButton buttonWithState:](VMPlayerControlButton, "buttonWithState:", 0));
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v8) = 1148846080;
      objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v8);
      LODWORD(v9) = 1148846080;
      objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v9);
      -[VMPlayerControlsView addSubview:](self, "addSubview:", v7);
      v6 = v7;
    }
    else
    {
      if (a3)
      {
LABEL_9:
        -[VMPlayerControlsView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
        return;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView playPauseButton](self, "playPauseButton"));
      v6 = v5;
      if (!v5)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v5, "removeFromSuperview");
      v7 = 0;
    }
    -[VMPlayerControlsView setPlayPauseButton:](self, "setPlayPauseButton:", v7);
    goto LABEL_8;
  }
}

- (void)loadSubviews
{
  VMPlayerTimelineSlider *v3;
  VMPlayerTimelineSlider *timelineSlider;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = objc_alloc_init(VMPlayerTimelineSlider);
  timelineSlider = self->_timelineSlider;
  self->_timelineSlider = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[VMPlayerTimelineSlider setBackgroundColor:](self->_timelineSlider, "setBackgroundColor:", v5);

  -[VMPlayerTimelineSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_timelineSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1144750080;
  -[VMPlayerTimelineSlider setContentCompressionResistancePriority:forAxis:](self->_timelineSlider, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[VMPlayerTimelineSlider setContentCompressionResistancePriority:forAxis:](self->_timelineSlider, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  LODWORD(v8) = 1132068864;
  -[VMPlayerTimelineSlider setContentHuggingPriority:forAxis:](self->_timelineSlider, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1148846080;
  -[VMPlayerTimelineSlider setContentHuggingPriority:forAxis:](self->_timelineSlider, "setContentHuggingPriority:forAxis:", 1, v9);
  -[VMPlayerControlsView addSubview:](self, "addSubview:", self->_timelineSlider);
  -[VMPlayerControlsView setSemanticContentAttribute:](self, "setSemanticContentAttribute:", 1);
}

- (void)loadConstraints
{
  id v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v32;
  objc_super v33;

  if (!-[VMPlayerControlsView constraintsLoaded](self, "constraintsLoaded"))
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = -[VMPlayerControlsView isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView topAnchor](self, "topAnchor"));
    if (v4)
    {
      -[VMPlayerControlsView timelineSliderTopAnchorConstraintAccessibilityConstant](self, "timelineSliderTopAnchorConstraintAccessibilityConstant");
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7));
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    }
    v9 = (void *)v8;

    objc_msgSend(v3, "addObject:", v9);
    v10 = -[VMPlayerControlsView style](self, "style");
    if (v10 == 1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView playPauseButton](self, "playPauseButton"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView leadingAnchor](self, "leadingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));

      objc_msgSend(v3, "addObject:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView playPauseButton](self, "playPauseButton"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 16.0));

      objc_msgSend(v3, "addObject:", v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView playPauseButton](self, "playPauseButton"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "slider"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v24));

    }
    else
    {
      if (v10)
      {
LABEL_10:
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView trailingAnchor](self, "trailingAnchor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
        objc_msgSend(v3, "addObject:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView bottomAnchor](self, "bottomAnchor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
        objc_msgSend(v3, "addObject:", v32);

        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
        -[VMPlayerControlsView setConstraintsLoaded:](self, "setConstraintsLoaded:", 1);

        goto LABEL_11;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView timelineSlider](self, "timelineSlider"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerControlsView leadingAnchor](self, "leadingAnchor"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    }

    objc_msgSend(v3, "addObject:", v14);
    v9 = (void *)v14;
    goto LABEL_10;
  }
LABEL_11:
  v33.receiver = self;
  v33.super_class = (Class)VMPlayerControlsView;
  -[VMPlayerControlsView loadConstraints](&v33, "loadConstraints");
}

- (double)timelineSliderLeadingAnchorConstraintAccessibilityConstant
{
  return 7.0;
}

- (double)timelineSliderTopAnchorConstraintAccessibilityConstant
{
  return 9.0;
}

- (VMPlayerControlsDelegate)delegate
{
  return (VMPlayerControlsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)style
{
  return self->_style;
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButton, a3);
}

- (VMPlayerTimelineSlider)timelineSlider
{
  return self->_timelineSlider;
}

- (void)setTimelineSlider:(id)a3
{
  objc_storeStrong((id *)&self->_timelineSlider, a3);
}

- (BOOL)constraintsLoaded
{
  return self->_constraintsLoaded;
}

- (void)setConstraintsLoaded:(BOOL)a3
{
  self->_constraintsLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineSlider, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
