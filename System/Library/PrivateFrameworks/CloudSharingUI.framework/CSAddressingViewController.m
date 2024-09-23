@implementation CSAddressingViewController

- (CSAddressingViewController)initWithViewModel:(id)a3 userDidClickPrimaryButton:(id)a4 userDidClickSecondaryButton:(id)a5 userDidClickShowContactPicker:(id)a6 userDidChangeAddresses:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CSAddressingViewController *v17;
  _TtC14CloudSharingUI21AddressingViewFactory *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _TtC14CloudSharingUI21AddressingViewFactory *addressingViewFactory;
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
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;
  _QWORD v61[6];

  v61[4] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v60.receiver = self;
  v60.super_class = (Class)CSAddressingViewController;
  v17 = -[CSAddressingViewController initWithNibName:bundle:](&v60, sel_initWithNibName_bundle_, 0, 0);
  if (v17)
  {
    v59 = v13;
    v18 = [_TtC14CloudSharingUI21AddressingViewFactory alloc];
    objc_msgSend(v12, "headerImageData");
    v56 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headerTitle");
    v57 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadingText");
    v58 = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "supplementaryText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInfoText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryButtonText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "secondaryButtonText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[AddressingViewFactory initWithHeaderImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:](v18, "initWithHeaderImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:", v19, v20, v21, v22, v23, v24, v25, v59, v58, v57, v56);
    v55 = v12;
    addressingViewFactory = v17->_addressingViewFactory;
    v17->_addressingViewFactory = (_TtC14CloudSharingUI21AddressingViewFactory *)v26;

    -[AddressingViewFactory viewController](v17->_addressingViewFactory, "viewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAddressingViewController addChildViewController:](v17, "addChildViewController:", v28);
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CSAddressingViewController view](v17, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v31);

    v45 = (void *)MEMORY[0x24BDD1628];
    -[CSAddressingViewController view](v17, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v51);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v50;
    -[CSAddressingViewController view](v17, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v44;
    -[CSAddressingViewController view](v17, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leftAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v33;
    -[CSAddressingViewController view](v17, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v39);

    v14 = v58;
    v15 = v57;

    v12 = v55;
    v16 = v56;

    v13 = v59;
  }

  return v17;
}

- (void)updateWithViewModel:(id)a3
{
  _TtC14CloudSharingUI21AddressingViewFactory *addressingViewFactory;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  addressingViewFactory = self->_addressingViewFactory;
  v4 = a3;
  objc_msgSend(v4, "headerImageData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadingText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supplementaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfoText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryButtonText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryButtonText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AddressingViewFactory updateWithHeaderImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:](addressingViewFactory, "updateWithHeaderImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:", v11, v5, v6, v7, v8, v9, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressingViewFactory, 0);
}

@end
