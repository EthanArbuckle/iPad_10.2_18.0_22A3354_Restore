@implementation SUUIRedeemInputViewController

- (SUUIRedeemInputViewController)initWithRedeemCategory:(int64_t)a3
{
  SUUIRedeemInputViewController *v4;
  SUUIRedeemInputViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIRedeemInputViewController;
  v4 = -[SUUIRedeemInputViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_category = a3;
    -[SUUIRedeemInputViewController setEdgesForExtendedLayout:](v4, "setEdgesForExtendedLayout:", 0);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x25120F368, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE868], 0);
  -[SUUIRedeemTextField setDelegate:](self->_field, "setDelegate:", 0);
  -[SUUIRedeemITunesPassLockup removeTarget:action:forControlEvents:](self->_passbookLockup, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v4.receiver = self;
  v4.super_class = (Class)SUUIRedeemInputViewController;
  -[SUUIRedeemInputViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  UIImageView *imageView;
  id v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  float v42;
  SUUIRedeemTextField *v43;
  SUUIRedeemTextField *field;
  double MaxY;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  SUUILinkButton *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  SUUIRedeemITunesPassLockup *passbookLockup;
  SUUIRedeemITunesPassLockup *v63;
  void *v64;
  void *v65;
  void *v66;
  SUUIRedeemITunesPassLockup *v67;
  SUUIRedeemITunesPassLockup *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  float v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  SUUIRedeemITunesPassLockup *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  float v89;
  void *v90;
  id v91;
  void *v92;
  UIBarButtonItem *v93;
  UIBarButtonItem *redeemButton;
  UIBarButtonItem *v95;
  void *v96;
  UIBarButtonItem *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  objc_super v102;
  _QWORD v103[2];
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  v103[1] = *MEMORY[0x24BDAC8D0];
  v102.receiver = self;
  v102.super_class = (Class)SUUIRedeemInputViewController;
  -[SUUIRedeemInputViewController loadView](&v102, sel_loadView);
  -[SUUIRedeemStepViewController clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemInputViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 50.0;
  if (v10 <= 480.0)
    v13 = 28.0;
  if (v12)
    v14 = 30.0;
  else
    v14 = v13;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  if (!imageView)
  {
    v16 = objc_alloc(MEMORY[0x24BEBD668]);
    -[SUUIRedeemStepViewController configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (UIImageView *)objc_msgSend(v16, "initWithImage:", v18);
    v20 = self->_imageView;
    self->_imageView = v19;

    -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 5);
    -[SUUIRedeemStepViewController configuration](self, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObserver:selector:name:object:", self, sel__redeemConfigurationImagesDidLoad_, 0x25120F368, v21);

    imageView = self->_imageView;
  }
  -[UIImageView frame](imageView, "frame");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  v24 = dbl_241EFC390[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v25 = dbl_241EFC3A0[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  objc_msgSend(v4, "frame");
  v27 = (v26 - v25) * 0.5;
  v28 = floorf(v27);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v28, v14, v25, v24);
  objc_msgSend(v4, "addSubview:", self->_imageView);
  v29 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v29, "setAutoresizingMask:", 2);
  objc_msgSend(v4, "backgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBackgroundColor:", v30);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v31);

  if (+[SUUIRedeemViewControllerLegacy redeemRequiresNationalId:](SUUIRedeemViewControllerLegacy, "redeemRequiresNationalId:", v3))
  {
    v32 = CFSTR("REDEEM_PROMPT_CN");
  }
  else
  {
    v32 = CFSTR("REDEEM_PROMPT");
  }
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", v32, CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v32, 0, CFSTR("Redeem"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v33);

  objc_msgSend(v29, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextColor:", v34);

  objc_msgSend(v29, "setNumberOfLines:", 0);
  objc_msgSend(v29, "frame");
  objc_msgSend(v4, "frame");
  v36 = v35 + -20.0;
  objc_msgSend(v4, "frame");
  objc_msgSend(v29, "sizeThatFits:", v37 + -20.0, 1.79769313e308);
  v39 = v38;
  v104.origin.x = v28;
  v104.origin.y = v14;
  v104.size.width = v25;
  v104.size.height = v24;
  v40 = CGRectGetMaxY(v104) + 15.0;
  objc_msgSend(v4, "frame");
  v42 = (v41 - v36) * 0.5;
  objc_msgSend(v29, "setFrame:", roundf(v42), v40, v36, v39);
  objc_msgSend(v4, "addSubview:", v29);
  v43 = -[SUUIRedeemInputViewController _newTextFieldWithClientContext:](self, "_newTextFieldWithClientContext:", v3);
  field = self->_field;
  self->_field = v43;

  -[SUUIRedeemTextField setDelegate:](self->_field, "setDelegate:", self);
  -[SUUIRedeemTextField setText:](self->_field, "setText:", self->_initialCode);
  -[SUUIRedeemTextField frame](self->_field, "frame");
  objc_msgSend(v29, "frame");
  MaxY = CGRectGetMaxY(v105);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "userInterfaceIdiom");

  v48 = 6.0;
  if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v48 = 30.0;
  v49 = MaxY + v48;
  objc_msgSend(v4, "frame");
  v51 = v50;
  v52 = 0.0;
  v53 = 44.0;
  -[SUUIRedeemTextField setFrame:](self->_field, "setFrame:", 0.0, v49);
  objc_msgSend(v4, "addSubview:", self->_field);
  objc_msgSend(v101, "addObserver:selector:name:object:", self, sel__textFieldTextDidChange_, *MEMORY[0x24BEBE868], self->_field);
  v54 = -[SUUILinkButton initWithArrowStyle:]([SUUILinkButton alloc], "initWithArrowStyle:", 0);
  -[SUUILinkButton setAutoresizingMask:](v54, "setAutoresizingMask:", 5);
  v100 = v4;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_TERMS_LINK"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_TERMS_LINK"), 0, CFSTR("Redeem"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILinkButton setTitle:forState:](v54, "setTitle:forState:", v55, 0);

  -[SUUILinkButton titleLabel](v54, "titleLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFont:", v57);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILinkButton setTitleColor:forState:](v54, "setTitleColor:forState:", v58, 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILinkButton setTitleColor:forState:](v54, "setTitleColor:forState:", v59, 1);

  -[SUUILinkButton addTarget:action:forControlEvents:](v54, "addTarget:action:forControlEvents:", self, sel__termsButtonAction_, 64);
  v60 = v100;
  objc_msgSend(v100, "backgroundColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILinkButton setBackgroundColor:](v54, "setBackgroundColor:", v61);

  if (-[SUUIRedeemStepViewController shouldShowPassbookLearnMore](self, "shouldShowPassbookLearnMore"))
  {
    passbookLockup = self->_passbookLockup;
    if (!passbookLockup)
    {
      v63 = [SUUIRedeemITunesPassLockup alloc];
      -[SUUIRedeemStepViewController configuration](self, "configuration");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "ITunesPassConfiguration");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIRedeemStepViewController clientContext](self, "clientContext");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[SUUIRedeemITunesPassLockup initWithITunesPassConfiguration:clientContext:](v63, "initWithITunesPassConfiguration:clientContext:", v65, v66);
      v68 = self->_passbookLockup;
      self->_passbookLockup = v67;

      v60 = v100;
      -[SUUIRedeemITunesPassLockup addTarget:action:forControlEvents:](self->_passbookLockup, "addTarget:action:forControlEvents:", self, sel__passbookLockupAction_, 64);
      -[SUUIRedeemITunesPassLockup setAutoresizingMask:](self->_passbookLockup, "setAutoresizingMask:", 5);
      passbookLockup = self->_passbookLockup;
    }
    -[SUUIRedeemITunesPassLockup frame](passbookLockup, "frame");
    -[SUUIRedeemITunesPassLockup sizeThatFits:](self->_passbookLockup, "sizeThatFits:", v8 + -60.0, 1.79769313e308);
    v70 = v69;
    v72 = v71;
    objc_msgSend(v60, "bounds");
    v74 = (v73 - v70) * 0.5;
    v75 = floorf(v74);
    v106.origin.x = 0.0;
    v106.origin.y = v49;
    v106.size.width = v51;
    v106.size.height = 44.0;
    -[SUUIRedeemITunesPassLockup setFrame:](self->_passbookLockup, "setFrame:", v75, CGRectGetMaxY(v106) + 30.0, v70, v72);
    objc_msgSend(v60, "addSubview:", self->_passbookLockup);
  }
  -[SUUILinkButton sizeToFit](v54, "sizeToFit");
  -[SUUILinkButton frame](v54, "frame");
  v77 = v76;
  v79 = v78;
  objc_msgSend(v60, "bounds");
  v81 = v80;
  v82 = self->_passbookLockup;
  if (v82)
  {
    -[SUUIRedeemITunesPassLockup frame](v82, "frame");
    v52 = v83;
    v49 = v84;
    v51 = v85;
    v53 = v86;
    v87 = 30.0;
  }
  else
  {
    v87 = 26.0;
  }
  v107.origin.x = v52;
  v107.origin.y = v49;
  v107.size.width = v51;
  v107.size.height = v53;
  v88 = CGRectGetMaxY(v107) + v87;
  v89 = (v81 - v77) * 0.5;
  -[SUUILinkButton setFrame:](v54, "setFrame:", floorf(v89), v88, v77, v79);
  objc_msgSend(v60, "addSubview:", v54);
  -[SUUIRedeemInputViewController navigationItem](self, "navigationItem");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setHidesBackButton:", 1);
  v91 = objc_alloc_init(MEMORY[0x24BEBD410]);
  objc_msgSend(v91, "setAction:", sel__cancelAction_);
  objc_msgSend(v91, "setTarget:", self);
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_CANCEL_BUTTON"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_CANCEL_BUTTON"), 0, CFSTR("Redeem"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTitle:", v92);

  objc_msgSend(v90, "setLeftBarButtonItem:", v91);
  v93 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x24BEBD410]);
  redeemButton = self->_redeemButton;
  self->_redeemButton = v93;

  -[UIBarButtonItem setAction:](self->_redeemButton, "setAction:", sel__redeemAction_);
  -[UIBarButtonItem setTarget:](self->_redeemButton, "setTarget:", self);
  v95 = self->_redeemButton;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_REDEEM_BUTTON"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_REDEEM_BUTTON"), 0, CFSTR("Redeem"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](v95, "setTitle:", v96);

  -[UIBarButtonItem setStyle:](self->_redeemButton, "setStyle:", 2);
  v97 = self->_redeemButton;
  -[SUUIRedeemTextField text](self->_field, "text");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](v97, "setEnabled:", objc_msgSend(v98, "length") != 0);

  v103[0] = self->_redeemButton;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setRightBarButtonItems:", v99);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[SUUIRedeemInputViewController _redeemAction:](self, "_redeemAction:", 0);
  return 1;
}

- (void)_redeemConfigurationImagesDidLoad:(id)a3
{
  UIImageView *imageView;
  void *v4;
  id v5;

  imageView = self->_imageView;
  -[SUUIRedeemStepViewController configuration](self, "configuration", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v4);

}

- (void)_textFieldTextDidChange:(id)a3
{
  UIBarButtonItem *redeemButton;
  id v4;

  redeemButton = self->_redeemButton;
  -[SUUIRedeemTextField text](self->_field, "text", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](redeemButton, "setEnabled:", objc_msgSend(v4, "length") != 0);

}

- (void)_cancelAction:(id)a3
{
  void *v4;
  id v5;

  -[SUUIRedeemInputViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_passbookLockupAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUUIRedeemITunesPassLearnMoreViewController *v8;

  v8 = objc_alloc_init(SUUIRedeemITunesPassLearnMoreViewController);
  -[SUUIRedeemStepViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemStepViewController setClientContext:](v8, "setClientContext:", v4);

  -[SUUIRedeemStepViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemStepViewController setConfiguration:](v8, "setConfiguration:", v5);

  -[SUUIRedeemStepViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemStepViewController setOperationQueue:](v8, "setOperationQueue:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  -[SUUIRedeemInputViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_redeemAction:(id)a3
{
  SUUIRedeemOperation *v4;
  void *v5;
  SUUIRedeemOperation *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[SUUIRedeemTextField resignFirstResponder](self->_field, "resignFirstResponder", a3);
  UIKeyboardOrderOutAutomatic();
  -[SUUIRedeemInputViewController _toggleActivityIndicatorBarButtonItem:](self, "_toggleActivityIndicatorBarButtonItem:", 1);
  v4 = [SUUIRedeemOperation alloc];
  -[SUUIRedeemTextField text](self->_field, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIRedeemOperation initWithCode:](v4, "initWithCode:", v5);

  -[SUUIRedeemOperation setCameraRecognized:](v6, "setCameraRecognized:", 0);
  -[SUUIRedeemStepViewController clientContext](self, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemOperation setClientContext:](v6, "setClientContext:", v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIRedeemInputViewController__redeemAction___block_invoke;
  v9[3] = &unk_2511F59A8;
  v9[4] = self;
  -[SUUIRedeemOperation setResultBlock:](v6, "setResultBlock:", v9);
  -[SUUIRedeemStepViewController operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v6);

}

void __47__SUUIRedeemInputViewController__redeemAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  SUUIRedeemResultsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SUUIRedeemResultsViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[5];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = -[SUUIRedeemResultsViewController initWithRedeem:]([SUUIRedeemResultsViewController alloc], "initWithRedeem:", v5);
    objc_msgSend(*(id *)(a1 + 32), "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController setClientContext:](v8, "setClientContext:", v9);

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController setConfiguration:](v8, "setConfiguration:", v10);

    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemStepViewController setOperationQueue:](v8, "setOperationQueue:", v11);

    -[SUUIRedeemResultsViewController setRedeemCategory:](v8, "setRedeemCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000));
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v8, 1);

    UIKeyboardOrderOutAutomatic();
LABEL_3:

    goto LABEL_4;
  }
  if (v6)
  {
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("hideError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "clientContext");
      v15 = (SUUIRedeemResultsViewController *)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      v16 = (void *)MEMORY[0x24BEBD3B0];
      if (v15)
        -[SUUIRedeemResultsViewController localizedStringForKey:inTable:](v15, "localizedStringForKey:inTable:", CFSTR("REDEEM_FAILURE_TITLE"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_FAILURE_TITLE"), 0, CFSTR("Redeem"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "code") == 9518)
      {
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__SUUIRedeemInputViewController__redeemAction___block_invoke_2;
        aBlock[3] = &unk_2511F51F0;
        aBlock[4] = *(_QWORD *)(a1 + 32);
        v20 = _Block_copy(aBlock);
      }
      else
      {
        v20 = 0;
      }
      v21 = (void *)MEMORY[0x24BEBD3A8];
      if (v8)
        -[SUUIRedeemResultsViewController localizedStringForKey:inTable:](v8, "localizedStringForKey:inTable:", CFSTR("REDEEM_OK_BUTTON"), CFSTR("Redeem"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_OK_BUTTON"), 0, CFSTR("Redeem"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v23);

      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v19, 1, 0);
      goto LABEL_3;
    }
  }
LABEL_4:
  objc_msgSend(*(id *)(a1 + 32), "_toggleActivityIndicatorBarButtonItem:", 0);

}

void __47__SUUIRedeemInputViewController__redeemAction___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "redeemStepDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "redeemStepViewControllerShouldValidateNationalID:", *(_QWORD *)(a1 + 32));

}

- (void)_termsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);

}

- (id)_newTextFieldWithClientContext:(id)a3
{
  id v4;
  SUUIRedeemTextField *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = objc_alloc_init(SUUIRedeemTextField);
  -[SUUIRedeemTextField setAutocapitalizationType:](v5, "setAutocapitalizationType:", 3);
  -[SUUIRedeemTextField setAutocorrectionType:](v5, "setAutocorrectionType:", 1);
  -[SUUIRedeemTextField setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
  -[SUUIRedeemTextField setEnablesReturnKeyAutomatically:](v5, "setEnablesReturnKeyAutomatically:", 1);
  -[SUUIRedeemTextField setReturnKeyType:](v5, "setReturnKeyType:", 9);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIRedeemTextField setFont:](v5, "setFont:", v6);
  v7 = objc_alloc(MEMORY[0x24BDBCE70]);
  v8 = *MEMORY[0x24BEBB360];
  -[SUUIRedeemInputViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tintColor");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v12 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v10, *MEMORY[0x24BEBB368], 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.7, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v13, *MEMORY[0x24BEBB368], 0);

  }
  v14 = objc_alloc(MEMORY[0x24BDD1458]);
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("REDEEM_CODE_PLACEHOLDER"), CFSTR("Redeem"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_CODE_PLACEHOLDER"), 0, CFSTR("Redeem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v12);

  -[SUUIRedeemTextField setAttributedPlaceholder:](v5, "setAttributedPlaceholder:", v16);
  return v5;
}

- (void)_toggleActivityIndicatorBarButtonItem:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *redeemButton;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
    objc_msgSend(v4, "startAnimating");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v4);
    -[SUUIRedeemInputViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = self->_redeemButton;
    v9[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItems:", v7);

  }
  else
  {
    -[SUUIRedeemInputViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    redeemButton = self->_redeemButton;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &redeemButton, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItems:", v5);
  }

}

- (int64_t)category
{
  return self->_category;
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemButton, 0);
  objc_storeStrong((id *)&self->_passbookLockup, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
