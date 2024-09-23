@implementation SFDownloadsBarButtonItem

- (SFDownloadsBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  SFDownloadsBarButtonItem *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SFDownloadsBarButtonItemView *buttonView;
  SFDownloadsBarButtonItem *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFDownloadsBarButtonItem;
  v7 = -[UIBarItem init](&v15, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.down.circle"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDownloadsBarButtonItem setImage:](v7, "setImage:", v9);

    -[SFDownloadsBarButtonItem setTarget:](v7, "setTarget:", v6);
    -[SFDownloadsBarButtonItem setAction:](v7, "setAction:", a4);
    SFAccessibilityTitleForBarItem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDownloadsBarButtonItem setTitle:](v7, "setTitle:", v10);

    +[SFDownloadsBarButtonItemView buttonWithBarButtonItem:](SFDownloadsBarButtonItemView, "buttonWithBarButtonItem:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    buttonView = v7->_buttonView;
    v7->_buttonView = (SFDownloadsBarButtonItemView *)v11;

    -[SFDownloadsBarButtonItem setCustomView:](v7, "setCustomView:", v7->_buttonView);
    -[SFDownloadsBarButtonItem setProgress:](v7, "setProgress:", -2.0);
    v13 = v7;

  }
  return v7;
}

- (void)setProgress:(double)a3
{
  -[SFDownloadsBarButtonItemView setProgress:](self->_buttonView, "setProgress:");
  self->_progress = a3;
}

- (void)pulse
{
  -[SFDownloadsBarButtonItemView pulse](self->_buttonView, "pulse");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFDownloadsBarButtonItem;
  -[SFDownloadsBarButtonItem setEnabled:](&v5, sel_setEnabled_);
  -[SFDownloadsBarButtonItemView setEnabled:](self->_buttonView, "setEnabled:", v3);
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end
