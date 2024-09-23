@implementation MCDErrorLoadingView

- (MCDErrorLoadingView)initWithTitle:(id)a3 buttonText:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  MCDErrorLoadingView *v12;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MCDErrorLoadingView *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  objc_super v59;
  _QWORD v60[10];

  v60[8] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v59.receiver = self;
  v59.super_class = (Class)MCDErrorLoadingView;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = -[MCDErrorLoadingView initWithFrame:](&v59, sel_initWithFrame_, *MEMORY[0x24BDBF090], v9, v10, v11);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDErrorLoadingView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v8, v9, v10, v11);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v58 = v6;
    if (v6)
    {
      objc_msgSend(v14, "setText:", v6);
    }
    else
    {
      MCDCarDisplayBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FUSE_TIMEOUT_TITLE"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v16);

    }
    _MCDNoContentFontWithTextStyle(*MEMORY[0x24BEBE248]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v17);

    objc_msgSend(v14, "setTextAlignment:", 1);
    objc_msgSend(v14, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v18);

    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _MCDNoContentFontWithTextStyle(*MEMORY[0x24BEBE1D8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v21);

    v57 = v7;
    if (v7)
    {
      objc_msgSend(v19, "setTitle:forState:", v7, 0);
    }
    else
    {
      MCDCarDisplayBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Try Again"), &stru_24FD78C58, CFSTR("MusicCarDisplayUI"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:forState:", v23, 0);

    }
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v19, "addTarget:action:forControlEvents:", v12, sel_retryButtonPressed_, 64);
    objc_msgSend(v19, "sizeToFit");
    v24 = objc_alloc_init(MEMORY[0x24BEBD718]);
    -[MCDErrorLoadingView addLayoutGuide:](v12, "addLayoutGuide:", v24);
    -[MCDErrorLoadingView addSubview:](v12, "addSubview:", v14);
    -[MCDErrorLoadingView addSubview:](v12, "addSubview:", v19);
    v44 = (void *)MEMORY[0x24BDD1628];
    v55 = v24;
    objc_msgSend(v24, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDErrorLoadingView heightAnchor](v12, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:multiplier:constant:", v54, 0.15, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v53;
    objc_msgSend(v14, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v50;
    objc_msgSend(v14, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDErrorLoadingView safeAreaLayoutGuide](v12, "safeAreaLayoutGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 12.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v46;
    objc_msgSend(v14, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDErrorLoadingView safeAreaLayoutGuide](v12, "safeAreaLayoutGuide");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -12.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v40;
    objc_msgSend(v19, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDErrorLoadingView centerXAnchor](v12, "centerXAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v37;
    objc_msgSend(v19, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDErrorLoadingView widthAnchor](v12, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:multiplier:constant:", v35, 0.699999988, 0.0);
    v45 = v14;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v25;
    objc_msgSend(v19, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToConstant:", 40.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v60[6] = v27;
    objc_msgSend(v19, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCDErrorLoadingView safeAreaLayoutGuide](v12, "safeAreaLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, -24.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60[7] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activateConstraints:", v32);

    v33 = v12;
    v7 = v57;
    v6 = v58;
  }

  return v12;
}

- (void)retryButtonPressed:(id)a3
{
  MCDErrorViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  NSObject *v7;
  id v8;
  uint8_t v9[16];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    MCDGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22FBAA000, v7, OS_LOG_TYPE_DEFAULT, "Retry button pressed", v9, 2u);
    }

    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "errorViewDidTapButton:", self);

  }
}

- (MCDErrorViewDelegate)delegate
{
  return (MCDErrorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldEnableNetwork
{
  return self->_shouldEnableNetwork;
}

- (void)setShouldEnableNetwork:(BOOL)a3
{
  self->_shouldEnableNetwork = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
