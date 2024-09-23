@implementation CARSetupAssetProgressViewController

- (CARSetupAssetProgressViewController)initWithProgressReporter:(id)a3 cancelHandler:(id)a4
{
  id v7;
  id v8;
  CARSetupAssetProgressViewController *v9;
  CARSetupAssetProgressViewController *v10;
  uint64_t v11;
  id cancelHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CARSetupAssetProgressViewController;
  v9 = -[CARSetupAssetProgressViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progressReporter, a3);
    v11 = MEMORY[0x23B81FF38](v8);
    cancelHandler = v10->_cancelHandler;
    v10->_cancelHandler = (id)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[CARSetupAssetProgressViewController _invalidateUseLaterTimer](self, "_invalidateUseLaterTimer");
  v3.receiver = self;
  v3.super_class = (Class)CARSetupAssetProgressViewController;
  -[CARSetupAssetProgressViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CARSetupAppIconProgressView *v11;
  CARSetupAppIconProgressView *progressView;
  CARSetupAppIconProgressView *v13;
  CARSetupAppIconProgressView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  UILabel *titleLabel;
  UILabel *v32;
  void *v33;
  void *v34;
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
  CARSetupAppIconProgressView *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  _QWORD v58[4];
  _QWORD v59[6];

  v59[4] = *MEMORY[0x24BDAC8D0];
  v57.receiver = self;
  v57.super_class = (Class)CARSetupAssetProgressViewController;
  -[CARSetupAssetProgressViewController viewDidLoad](&v57, sel_viewDidLoad);
  -[CARSetupAssetProgressViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSetupAssetProgressViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_250987190, CFSTR("Localizable-Themed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__cancel);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v8;
  objc_msgSend(v8, "setTintColor:", v9);

  -[CARSetupAssetProgressViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v8);

  v11 = objc_alloc_init(CARSetupAppIconProgressView);
  -[CARSetupAppIconProgressView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v11);
  progressView = self->_progressView;
  self->_progressView = v11;
  v13 = v11;

  v14 = v13;
  v53 = v13;
  -[CARSetupAppIconProgressView centerXAnchor](v13, "centerXAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  objc_msgSend(v3, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v51);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v49;
  -[CARSetupAppIconProgressView centerYAnchor](v13, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44, -30.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v16;
  -[CARSetupAppIconProgressView widthAnchor](v13, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v15;
  objc_msgSend(v15, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:multiplier:", v18, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v19;
  -[CARSetupAppIconProgressView heightAnchor](v13, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSetupAppIconProgressView widthAnchor](v14, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraints:", v23);

  v24 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SETTING_UP_CARD_TITLE"), &stru_250987190, CFSTR("Localizable-Themed"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](v24, "setText:", v55);
  v26 = (void *)MEMORY[0x24BDF6A78];
  v27 = *MEMORY[0x24BDF7850];
  -[CARSetupAssetProgressViewController traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "fontDescriptorWithSymbolicTraits:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v52, 0.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v24, "setFont:", v50);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v24, "setTextColor:", v30);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v48, "addSubview:", v24);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v24;
  v32 = v24;

  -[UILabel centerXAnchor](v32, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v45);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v43;
  -[UILabel widthAnchor](v32, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v40;
  -[UILabel topAnchor](v32, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSetupAppIconProgressView bottomAnchor](v53, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 30.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v35;
  -[UILabel bottomAnchor](v32, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v37, -30.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "addConstraints:", v39);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CARSetupAssetProgressViewController;
  -[CARSetupAssetProgressViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  CARSetupLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_237AF2000, v4, OS_LOG_TYPE_DEFAULT, "starting asset progress animation", v6, 2u);
  }

  -[CARSetupAssetProgressViewController progressView](self, "progressView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  -[CARSetupAssetProgressViewController _startUseLaterTimer](self, "_startUseLaterTimer");
}

- (void)_startUseLaterTimer
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__showUseLater, 0, 0, 30.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CARSetupAssetProgressViewController setUseLaterTimer:](self, "setUseLaterTimer:", v3);

}

- (void)_invalidateUseLaterTimer
{
  void *v3;
  id v4;

  -[CARSetupAssetProgressViewController useLaterTimer](self, "useLaterTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "invalidate");
    -[CARSetupAssetProgressViewController setUseLaterTimer:](self, "setUseLaterTimer:", 0);
    v3 = v4;
  }

}

- (void)_showUseLater
{
  NSObject *v3;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id buf[2];
  _QWORD v30[6];

  v30[4] = *MEMORY[0x24BDAC8D0];
  CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_237AF2000, v3, OS_LOG_TYPE_DEFAULT, "showing button for asset ready soon progress", (uint8_t *)buf, 2u);
  }

  -[CARSetupAssetProgressViewController useLaterTimer](self, "useLaterTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CARSetupAssetProgressViewController setUseLaterTimer:](self, "setUseLaterTimer:", 0);
  objc_initWeak(buf, self);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("USE_LATER"), &stru_250987190, CFSTR("Localizable-Themed"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDF6880];
  v7 = (void *)MEMORY[0x24BDF67B8];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __52__CARSetupAssetProgressViewController__showUseLater__block_invoke;
  v27[3] = &unk_250986EA0;
  objc_copyWeak(&v28, buf);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v26, 0, 0, v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemButtonWithPrimaryAction:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CARSetupAssetProgressViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);
  objc_storeStrong((id *)&self->_useLaterButton, v9);
  objc_msgSend(v9, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  objc_msgSend(v9, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSetupAssetProgressViewController titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(v9, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -30.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v14;
  objc_msgSend(v9, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v18);

  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);
}

void __52__CARSetupAssetProgressViewController__showUseLater__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_useLater");

}

- (void)_cancel
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_237AF2000, v3, OS_LOG_TYPE_DEFAULT, "asset progress: canceling", v6, 2u);
  }

  -[CARSetupAssetProgressViewController cancelHandler](self, "cancelHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

- (void)_useLater
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  CARSetupLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_237AF2000, v3, OS_LOG_TYPE_DEFAULT, "asset progress: use later", v6, 2u);
  }

  -[CARSetupAssetProgressViewController cancelHandler](self, "cancelHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);

}

- (NSProgressReporting)progressReporter
{
  return self->_progressReporter;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (CARSetupAppIconProgressView)progressView
{
  return self->_progressView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIButton)useLaterButton
{
  return self->_useLaterButton;
}

- (NSTimer)useLaterTimer
{
  return self->_useLaterTimer;
}

- (void)setUseLaterTimer:(id)a3
{
  objc_storeStrong((id *)&self->_useLaterTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useLaterTimer, 0);
  objc_storeStrong((id *)&self->_useLaterButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);
}

@end
