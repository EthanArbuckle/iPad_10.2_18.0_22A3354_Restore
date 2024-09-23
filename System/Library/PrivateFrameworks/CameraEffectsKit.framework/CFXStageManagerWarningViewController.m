@implementation CFXStageManagerWarningViewController

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CFXStageManagerWarningViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v40.receiver = self;
  v40.super_class = (Class)CFXStageManagerWarningViewController;
  -[CFXStageManagerWarningViewController viewDidLoad](&v40, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[CFXStageManagerWarningViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CFXStageManagerWarningViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  v33 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v7, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXStageManagerWarningViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v34;
  objc_msgSend(v7, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXStageManagerWarningViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v11;
  objc_msgSend(v7, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXStageManagerWarningViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -32.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v16);

  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("STAGEMANAGER_UNSUPPORTED_WARNING"), &stru_24EE5C428, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v18);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 24.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v19);

  objc_msgSend(v7, "setNumberOfLines:", 3);
  objc_msgSend(v7, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v20);

  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(MEMORY[0x24BE72D78], "doneButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXStageManagerWarningViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v21);

  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_doneButtonTapped_, 64);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v37 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v21, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  -[CFXStageManagerWarningViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v24, 16.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v25;
  objc_msgSend(v21, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXStageManagerWarningViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -16.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v30);

  -[CFXStageManagerWarningViewController setDoneButton:](v31, "setDoneButton:", v21);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXStageManagerWarningViewController;
  -[CFXStageManagerWarningViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[CFXStageManagerWarningViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[CFXStageManagerWarningViewController isMultitasking](self, "isMultitasking") ^ 1);

  -[CFXStageManagerWarningViewController doneButton](self, "doneButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", -[CFXStageManagerWarningViewController showDoneButton](self, "showDoneButton") ^ 1);

}

- (BOOL)isMultitasking
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CFXStageManagerWarningViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  return v7 != v12 || v5 != v10;
}

- (BOOL)showDoneButton
{
  void *v3;
  void *v4;
  char v5;

  -[CFXStageManagerWarningViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CFXStageManagerWarningViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)doneButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CFXStageManagerWarningViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    -[CFXStageManagerWarningViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stageManagerWarningDoneButtonWasTapped:", v8);

    goto LABEL_5;
  }
  -[CFXStageManagerWarningViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    goto LABEL_4;
LABEL_5:

}

- (CFXStageManagerWarningViewControllerDelegate)delegate
{
  return (CFXStageManagerWarningViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
