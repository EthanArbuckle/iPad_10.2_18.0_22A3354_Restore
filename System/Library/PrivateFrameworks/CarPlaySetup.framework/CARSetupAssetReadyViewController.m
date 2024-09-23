@implementation CARSetupAssetReadyViewController

- (CARSetupAssetReadyViewController)initWithDoneHandler:(id)a3
{
  id v4;
  CARSetupAssetReadyViewController *v5;
  uint64_t v6;
  id doneHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARSetupAssetReadyViewController;
  v5 = -[CARSetupAssetReadyViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = MEMORY[0x23B81FF38](v4);
    doneHandler = v5->_doneHandler;
    v5->_doneHandler = (id)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v2;
  void *v3;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id vala;
  void *v79;
  id obj;
  id v81;
  _QWORD v82[4];
  id v83;
  id location;
  objc_super v85;
  _QWORD v86[5];
  _QWORD v87[4];
  _QWORD v88[3];
  _QWORD v89[5];

  v89[3] = *MEMORY[0x24BDAC8D0];
  v85.receiver = self;
  v85.super_class = (Class)CARSetupAssetReadyViewController;
  -[CARSetupAssetReadyViewController viewDidLoad](&v85, sel_viewDidLoad);
  -[CARSetupAssetReadyViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSetupAssetReadyViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  -[CARSetupAssetReadyViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidesBackButton:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setBackgroundColor:", v3);

  objc_msgSend(v79, "safeAreaLayoutGuide");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  obj = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("READY_CARD_TITLE"), &stru_250987190, CFSTR("Localizable-Themed"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "setText:", v72);
  v5 = (void *)MEMORY[0x24BDF6A78];
  -[CARSetupAssetReadyViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7848], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v71, 0.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setFont:", v70);
  objc_msgSend(obj, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setTextColor:", v8);

  objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v79, "addSubview:", obj);
  objc_storeStrong((id *)&self->_titleLabel, obj);
  objc_msgSend(obj, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v11;
  objc_msgSend(obj, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -30.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v14;
  objc_msgSend(obj, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 60.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addConstraints:", v18);

  v81 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("READY_CARD_MESSAGE"), &stru_250987190, CFSTR("Localizable-Themed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v81, "setText:", v20);
  v21 = (void *)MEMORY[0x24BDF6A78];
  -[CARSetupAssetReadyViewController traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7810], v22);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v69, 0.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setFont:", v68);
  objc_msgSend(v81, "setTextAlignment:", 1);
  objc_msgSend(v81, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setTextColor:", v23);

  objc_msgSend(v81, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v79, "addSubview:", v81);
  objc_storeStrong((id *)&self->_subtitleLabel, v81);
  objc_msgSend(v81, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 30.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v26;
  objc_msgSend(v81, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -30.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v29;
  objc_msgSend(v81, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v31, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addConstraints:", v33);

  v34 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "imageNamed:inBundle:withConfiguration:", CFSTR("SiriIcon"), v35, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v67);
  objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v79, "addSubview:", v75);
  objc_storeStrong((id *)&self->_iconView, v75);
  objc_msgSend(v75, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v37;
  objc_msgSend(v75, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 20.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v40;
  objc_msgSend(v75, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToConstant:", 75.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v42;
  objc_msgSend(v75, "heightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToConstant:", 75.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v44;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addConstraints:", v45);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("READY_CARD_DONE"), &stru_250987190, CFSTR("Localizable-Themed"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6888], "grayButtonConfiguration");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setBaseForegroundColor:", v47);

  v48 = (void *)MEMORY[0x24BDF6880];
  v49 = (void *)MEMORY[0x24BDF67B8];
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __47__CARSetupAssetReadyViewController_viewDidLoad__block_invoke;
  v82[3] = &unk_250986EA0;
  objc_copyWeak(&v83, &location);
  objc_msgSend(v49, "actionWithTitle:image:identifier:handler:", v66, 0, 0, v82);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "buttonWithConfiguration:primaryAction:", v74, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v79, "addSubview:", v51);
  objc_storeStrong((id *)&self->_doneButton, v51);
  objc_msgSend(v51, "centerXAnchor");
  vala = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "centerXAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(vala, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v64;
  objc_msgSend(v51, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v61;
  objc_msgSend(v51, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, -30.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v54;
  objc_msgSend(v51, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:multiplier:", v56, 0.75);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v57;
  objc_msgSend(v51, "heightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", 50.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v86[4] = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addConstraints:", v60);

  objc_destroyWeak(&v83);
  objc_destroyWeak(&location);

}

void __47__CARSetupAssetReadyViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_done");

}

- (void)_done
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
    _os_log_impl(&dword_237AF2000, v3, OS_LOG_TYPE_DEFAULT, "asset ready: done", v6, 2u);
  }

  -[CARSetupAssetReadyViewController doneHandler](self, "doneHandler");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);

}

- (id)doneHandler
{
  return self->_doneHandler;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_doneHandler, 0);
}

@end
