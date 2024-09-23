@implementation PHCarPlayInCallHardPauseButton

- (PHCarPlayInCallHardPauseButton)init
{
  PHCarPlayInCallHardPauseButton *v2;
  PHCarPlayInCallHardPauseButton *v3;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PHCarPlayInCallHardPauseButton;
  v2 = -[PHCarPlayInCallHardPauseButton initWithFrame:](&v23, "initWithFrame:", 0.0, 0.0, 107.0, 28.0);
  v3 = v2;
  if (v2)
  {
    -[PHCarPlayInCallHardPauseButton setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton layer](v3, "layer"));
    objc_msgSend(v4, "setCornerRadius:", 3.0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _externalSystemSuperDarkGrayColor](UIColor, "_externalSystemSuperDarkGrayColor"));
    -[PHCarPlayInCallHardPauseButton setBackgroundColor:](v3, "setBackgroundColor:", v5);

    -[PHCarPlayInCallHardPauseButton setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CARPLAY_HARD_PAUSE_DEFAULT_TITLE"), &stru_10028DC20, CFSTR("PHCarPlay")));
    -[PHCarPlayInCallHardPauseButton setTitle:forState:](v3, "setTitle:forState:", v7, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PHCarPlayInCallHardPauseButton setTitleColor:forState:](v3, "setTitleColor:forState:", v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    -[PHCarPlayInCallHardPauseButton setTitleColor:forState:](v3, "setTitleColor:forState:", v9, 2);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _externalSystemSuperDarkGrayColor](UIColor, "_externalSystemSuperDarkGrayColor"));
    -[PHCarPlayInCallHardPauseButton setTitleColor:forState:](v3, "setTitleColor:forState:", v10, 1);

    -[PHCarPlayInCallHardPauseButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", 0.0, 14.0, 0.0, 14.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v12, "setBackgroundColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v13, "setOpaque:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v16, "setFont:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v18, "setTextColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v19, "setTextAlignment:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v20, "setLineBreakMode:", 4);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton titleLabel](v3, "titleLabel"));
    objc_msgSend(v21, "setNumberOfLines:", 1);

    -[PHCarPlayInCallHardPauseButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, "hardPausePressed", 64);
  }
  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[PHCarPlayInCallHardPauseButton setEnabled:](self, "setEnabled:", !a3);
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayInCallHardPauseButton;
  -[PHCarPlayInCallHardPauseButton setHidden:](&v7, "setHidden:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton delegate](self, "delegate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton delegate](self, "delegate"));
    objc_msgSend(v6, "hardPauseButtonDidChangeVisibility:", self);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (a3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor externalSystemTealColor](UIColor, "externalSystemTealColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor _externalSystemSuperDarkGrayColor](UIColor, "_externalSystemSuperDarkGrayColor"));
  v6 = (void *)v5;
  -[PHCarPlayInCallHardPauseButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayInCallHardPauseButton;
  -[PHCarPlayInCallHardPauseButton setHighlighted:](&v7, "setHighlighted:", v3);
}

- (void)hardPausePressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallHardPauseButton delegate](self, "delegate"));
  objc_msgSend(v3, "hardPauseButtonDidSendHardPauseDigits:", self);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  PHCarPlayInCallHardPauseButton *v5;

  v5 = (PHCarPlayInCallHardPauseButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextFocusedItem"));
  -[PHCarPlayInCallHardPauseButton setHighlighted:](self, "setHighlighted:", v5 == self);

}

- (PHCarPlayHardPauseButtonDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PHCarPlayHardPauseButtonDelegate *)a3;
}

@end
