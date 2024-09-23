@implementation HUAccessoryDiagnosticsConsentViewController

- (HUAccessoryDiagnosticsConsentViewController)initWithItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  HUAccessoryDiagnosticsConsentViewController *v8;
  void *v9;
  id completionHandler;
  uint64_t v11;
  NSURL *privacyPolicyURL;
  uint64_t v13;
  NSString *manufacturer;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUAccessoryDiagnosticsConsentViewController;
  v8 = -[HUAccessoryDiagnosticsConsentViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = _Block_copy(v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = v9;

    objc_msgSend(v6, "privacyPolicyURL");
    v11 = objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = v8->_privacyPolicyURL;
    v8->_privacyPolicyURL = (NSURL *)v11;

    v8->_consentTextVersion = objc_msgSend(v6, "consentVersion");
    objc_msgSend(v6, "manufacturer");
    v13 = objc_claimAutoreleasedReturnValue();
    manufacturer = v8->_manufacturer;
    v8->_manufacturer = (NSString *)v13;

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUAccessoryDiagnosticsConsentViewController;
  -[HUAccessoryDiagnosticsConsentViewController viewDidLoad](&v21, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUAccessoryDiagnosticsConsentViewController manufacturer](self, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUAccessoryDiagnosticsConsentNavigationTitle"), CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController setTitle:](self, "setTitle:", v12);

  v13 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsConsentCancelButton"), CFSTR("HUAccessoryDiagnosticsConsentCancelButton"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, self, sel_cancelSubmission);
  -[HUAccessoryDiagnosticsConsentViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeftBarButtonItem:", v15);

  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController descriptionTextView](self, "descriptionTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController submitButton](self, "submitButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[HUAccessoryDiagnosticsConsentViewController _addConstraints](self, "_addConstraints");
}

- (void)_addConstraints
{
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
  _QWORD v53[11];

  v53[9] = *MEMORY[0x1E0C80C00];
  -[HUAccessoryDiagnosticsConsentViewController descriptionTextView](self, "descriptionTextView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "safeAreaLayoutGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 20.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v47;
  -[HUAccessoryDiagnosticsConsentViewController descriptionTextView](self, "descriptionTextView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leftAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "safeAreaLayoutGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leftAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 10.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v41;
  -[HUAccessoryDiagnosticsConsentViewController descriptionTextView](self, "descriptionTextView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "safeAreaLayoutGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -10.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v35;
  -[HUAccessoryDiagnosticsConsentViewController descriptionTextView](self, "descriptionTextView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController submitButton](self, "submitButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -10.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v30;
  -[HUAccessoryDiagnosticsConsentViewController submitButton](self, "submitButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaLayoutGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v24;
  -[HUAccessoryDiagnosticsConsentViewController submitButton](self, "submitButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 47.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v20;
  -[HUAccessoryDiagnosticsConsentViewController submitButton](self, "submitButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v15;
  -[HUAccessoryDiagnosticsConsentViewController submitButton](self, "submitButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v5, 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v6;
  -[HUAccessoryDiagnosticsConsentViewController submitButton](self, "submitButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsConsentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v11, -20.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
}

- (void)submitLog
{
  void (**v3)(_QWORD, _QWORD);

  -[HUAccessoryDiagnosticsConsentViewController completionHandler](self, "completionHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 1);

  -[HUAccessoryDiagnosticsConsentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cancelSubmission
{
  void (**v3)(_QWORD, _QWORD);

  -[HUAccessoryDiagnosticsConsentViewController completionHandler](self, "completionHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 0);

  -[HUAccessoryDiagnosticsConsentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (UITextView)descriptionTextView
{
  UITextView *descriptionTextView;
  UITextView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UITextView *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  descriptionTextView = self->_descriptionTextView;
  if (!descriptionTextView)
  {
    v4 = (UITextView *)objc_alloc_init(MEMORY[0x1E0CEAB18]);
    -[UITextView setEditable:](v4, "setEditable:", 0);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setTextAlignment:](v4, "setTextAlignment:", 1);
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsConsentExplanation"), CFSTR("HUAccessoryDiagnosticsConsentExplanation"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryDiagnosticsConsentLinkText"), CFSTR("HUAccessoryDiagnosticsConsentLinkText"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setAlignment:", 1);
    v19[0] = *MEMORY[0x1E0CEA098];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CEA0D0];
    v20[0] = v9;
    v20[1] = v8;
    v11 = *MEMORY[0x1E0CEA0A0];
    v19[1] = v10;
    v19[2] = v11;
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3498];
    -[HUAccessoryDiagnosticsConsentViewController privacyPolicyURL](self, "privacyPolicyURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", v5, v6, v15, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](v4, "setAttributedText:", v16);

    v17 = self->_descriptionTextView;
    self->_descriptionTextView = v4;

    descriptionTextView = self->_descriptionTextView;
  }
  return descriptionTextView;
}

- (UIButton)submitButton
{
  UIButton *submitButton;
  UIButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  UIButton *v16;

  submitButton = self->_submitButton;
  if (!submitButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel_submitLog, 64);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v4, "setTintColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[UIButton layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 8.0);

    -[HUAccessoryDiagnosticsConsentViewController manufacturer](self, "manufacturer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUAccessoryDiagnosticsConsentSubmitButton"), CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v4, "setTitle:forState:", v15, 0);

    v16 = self->_submitButton;
    self->_submitButton = v4;

    submitButton = self->_submitButton;
  }
  return submitButton;
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
}

- (void)setSubmitButton:(id)a3
{
  objc_storeStrong((id *)&self->_submitButton, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
  objc_storeStrong((id *)&self->_privacyPolicyURL, a3);
}

- (int64_t)consentTextVersion
{
  return self->_consentTextVersion;
}

- (void)setConsentTextVersion:(int64_t)a3
{
  self->_consentTextVersion = a3;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
}

@end
