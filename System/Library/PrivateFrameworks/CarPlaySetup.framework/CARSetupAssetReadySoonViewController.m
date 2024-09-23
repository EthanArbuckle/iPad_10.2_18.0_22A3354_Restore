@implementation CARSetupAssetReadySoonViewController

- (CARSetupAssetReadySoonViewController)initWithDoneHandler:(id)a3
{
  id v4;
  CARSetupAssetReadySoonViewController *v5;
  uint64_t v6;
  id doneHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARSetupAssetReadySoonViewController;
  v5 = -[CARSetupAssetReadySoonViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
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
  id vala;
  id v65;
  id obj;
  _QWORD v67[4];
  id v68;
  id location;
  objc_super v70;
  _QWORD v71[5];
  _QWORD v72[3];
  _QWORD v73[5];

  v73[3] = *MEMORY[0x24BDAC8D0];
  v70.receiver = self;
  v70.super_class = (Class)CARSetupAssetReadySoonViewController;
  -[CARSetupAssetReadySoonViewController viewDidLoad](&v70, sel_viewDidLoad);
  -[CARSetupAssetReadySoonViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARSetupAssetReadySoonViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  -[CARSetupAssetReadySoonViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidesBackButton:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setBackgroundColor:", v3);

  objc_msgSend(v62, "safeAreaLayoutGuide");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  obj = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("READY_SOON_CARD_TITLE"), &stru_250987190, CFSTR("Localizable-Themed"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "setText:", v59);
  v5 = (void *)MEMORY[0x24BDF6A78];
  -[CARSetupAssetReadySoonViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7848], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v58, 0.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setFont:", v57);
  objc_msgSend(obj, "setTextAlignment:", 1);
  objc_msgSend(obj, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "setTextColor:", v8);

  objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v62, "addSubview:", obj);
  objc_storeStrong((id *)&self->_titleLabel, obj);
  objc_msgSend(obj, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v11;
  objc_msgSend(obj, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -30.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v14;
  objc_msgSend(obj, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 60.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addConstraints:", v18);

  v65 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("READY_SOON_CARD_MESSAGE"), &stru_250987190, CFSTR("Localizable-Themed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v65, "setText:", v20);
  v21 = (void *)MEMORY[0x24BDF6A78];
  -[CARSetupAssetReadySoonViewController traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF7810], v22);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v56, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFont:", v55);
  objc_msgSend(v65, "setTextAlignment:", 1);
  objc_msgSend(v65, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setTextColor:", v23);

  objc_msgSend(v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v62, "addSubview:", v65);
  objc_storeStrong((id *)&self->_subtitleLabel, v65);
  objc_msgSend(v65, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 30.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v26;
  objc_msgSend(v65, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -30.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v29;
  objc_msgSend(v65, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 60.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addConstraints:", v33);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("READY_SOON_CARD_DISMISS"), &stru_250987190, CFSTR("Localizable-Themed"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6888], "grayButtonConfiguration");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setBaseForegroundColor:", v35);

  v36 = (void *)MEMORY[0x24BDF6880];
  v37 = (void *)MEMORY[0x24BDF67B8];
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __51__CARSetupAssetReadySoonViewController_viewDidLoad__block_invoke;
  v67[3] = &unk_250986EA0;
  objc_copyWeak(&v68, &location);
  objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", v54, 0, 0, v67);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "buttonWithConfiguration:primaryAction:", v60, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v62, "addSubview:", v39);
  objc_storeStrong((id *)&self->_doneButton, v39);
  objc_msgSend(v39, "centerXAnchor");
  vala = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "centerXAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(vala, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v52;
  objc_msgSend(v39, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v49;
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, -30.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v42;
  objc_msgSend(v39, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:multiplier:", v44, 0.75);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v45;
  objc_msgSend(v39, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToConstant:", 50.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addConstraints:", v48);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);

}

void __51__CARSetupAssetReadySoonViewController_viewDidLoad__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_237AF2000, v3, OS_LOG_TYPE_DEFAULT, "asset ready soon: done", v6, 2u);
  }

  -[CARSetupAssetReadySoonViewController doneHandler](self, "doneHandler");
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

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_doneHandler, 0);
}

@end
