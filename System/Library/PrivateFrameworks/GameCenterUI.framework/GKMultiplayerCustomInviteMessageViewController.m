@implementation GKMultiplayerCustomInviteMessageViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)GKMultiplayerCustomInviteMessageViewController;
  -[GKMultiplayerCustomInviteMessageViewController viewDidLoad](&v33, sel_viewDidLoad);
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerCustomInviteMessageViewController setTitle:](self, "setTitle:", v4);

  -[GKMultiplayerCustomInviteMessageViewController doneButton](self, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  -[GKMultiplayerCustomInviteMessageViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingMessageForInviteViewController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GKMultiplayerCustomInviteMessageViewController messageTextField](self, "messageTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    GKGameCenterUIFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithString:", v12);
    -[GKMultiplayerCustomInviteMessageViewController messageTextField](self, "messageTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedPlaceholder:", v13);

  }
  -[GKMultiplayerCustomInviteMessageViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNavigationBarHidden:", 1);

  -[GKMultiplayerCustomInviteMessageViewController backgroundEffectView](self, "backgroundEffectView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
    -[GKMultiplayerCustomInviteMessageViewController setBackgroundEffectView:](self, "setBackgroundEffectView:", v17);

    objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerCustomInviteMessageViewController backgroundEffectView](self, "backgroundEffectView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundEffects:", v18);

    -[GKMultiplayerCustomInviteMessageViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[GKMultiplayerCustomInviteMessageViewController backgroundEffectView](self, "backgroundEffectView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    -[GKMultiplayerCustomInviteMessageViewController backgroundEffectView](self, "backgroundEffectView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAutoresizingMask:", 18);

  }
  -[GKMultiplayerCustomInviteMessageViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerCustomInviteMessageViewController backgroundEffectView](self, "backgroundEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "insertSubview:atIndex:", v32, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerCustomInviteMessageViewController;
  -[GKMultiplayerCustomInviteMessageViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[GKMultiplayerCustomInviteMessageViewController messageTextField](self, "messageTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)donePressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[GKMultiplayerCustomInviteMessageViewController messageTextField](self, "messageTextField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[GKMultiplayerCustomInviteMessageViewController messageTextField](self, "messageTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[GKMultiplayerCustomInviteMessageViewController messageTextField](self, "messageTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[GKMultiplayerCustomInviteMessageViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customInviteViewController:didFinishWithMessage:", self, v9);

}

- (GKMultiplayerCustomInviteMessageViewControllerDelegate)delegate
{
  return (GKMultiplayerCustomInviteMessageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UITextView)messageTextField
{
  return self->_messageTextField;
}

- (void)setMessageTextField:(id)a3
{
  objc_storeStrong((id *)&self->_messageTextField, a3);
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffectView, a3);
}

- (NSLayoutConstraint)titleBarHeightConstraint
{
  return self->_titleBarHeightConstraint;
}

- (void)setTitleBarHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleBarHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleBarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_messageTextField, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
