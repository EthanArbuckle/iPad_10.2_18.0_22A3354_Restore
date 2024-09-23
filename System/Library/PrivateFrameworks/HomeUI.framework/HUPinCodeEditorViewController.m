@implementation HUPinCodeEditorViewController

- (void)_commonInitWithManager:(id)a3 home:(id)a4 initialPinCodeValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
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
  id v29;
  void *v30;
  void *v31;
  HUPaddedTextField *v32;
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
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id location;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HUPinCodeEditorViewController setHome:](self, "setHome:", v9);
  -[HUPinCodeEditorViewController setPinCodeManager:](self, "setPinCodeManager:", v8);
  -[HUPinCodeEditorViewController setCodeLengthMin:](self, "setCodeLengthMin:", 4);
  -[HUPinCodeEditorViewController setCodeLengthMax:](self, "setCodeLengthMax:", 8);
  v11 = objc_alloc(MEMORY[0x1E0CEA700]);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
  -[HUPinCodeEditorViewController setInstructionHeader:](self, "setInstructionHeader:", v16);

  v17 = *MEMORY[0x1E0CEB590];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNumberOfLines:", 0);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextAlignment:", 1);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v12, v13, v14, v15);
  -[HUPinCodeEditorViewController setFooterLabel:](self, "setFooterLabel:", v22);

  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNumberOfLines:", 0);

  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFont:", v25);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextColor:", v27);

  -[HUPinCodeEditorViewController _updateHeaderAndFooter](self, "_updateHeaderAndFooter");
  if (!numberFormatter)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v30 = (void *)numberFormatter;
    numberFormatter = (uint64_t)v29;

    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)numberFormatter, "setLocale:", v31);

    objc_msgSend((id)numberFormatter, "setNumberStyle:", 0);
  }
  v32 = -[HUPaddedTextField initWithFrame:]([HUPaddedTextField alloc], "initWithFrame:", v12, v13, v14, v15);
  -[HUPinCodeEditorViewController setTextField:](self, "setTextField:", v32);

  v55 = *MEMORY[0x1E0CEA0B0];
  v56[0] = &unk_1E7043918;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDefaultTextAttributes:", v33);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB580]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFont:", v35);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTextColor:", v37);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDelegate:", self);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBorderStyle:", 3);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setClearButtonMode:", 0);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTextAlignment:", 1);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setEnabled:", 1);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setKeyboardType:", 4);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setDisableUpdateMask:", 16);

  v47 = objc_msgSend(v10, "length");
  objc_msgSend((id)numberFormatter, "setMinimumIntegerDigits:", v47);
  objc_msgSend((id)numberFormatter, "numberFromString:", v10);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)numberFormatter, "stringForObjectValue:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setText:", v49);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sizeToFit");

  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __81__HUPinCodeEditorViewController__commonInitWithManager_home_initialPinCodeValue___block_invoke;
  v52[3] = &unk_1E6F60810;
  objc_copyWeak(&v53, &location);
  objc_msgSend(v8, "fetchPinCodeConstraints:", v52);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);

}

void __81__HUPinCodeEditorViewController__commonInitWithManager_home_initialPinCodeValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCodeLengthMin:", a2);
  objc_msgSend(WeakRetained, "setCodeLengthMax:", a3);
  objc_msgSend(WeakRetained, "_updateHeaderAndFooter");

}

- (id)initForEditingPinCodeWithItem:(id)a3 pinCodeManager:(id)a4 pinCodeValue:(id)a5 home:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HUPinCodeEditorViewController *v17;
  HUPinCodeEditorViewController *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HUPinCodeEditorViewController;
  v17 = -[HUPinCodeEditorViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    -[HUPinCodeEditorViewController setSourceItem:](v17, "setSourceItem:", v12);
    -[HUPinCodeEditorViewController _commonInitWithManager:home:initialPinCodeValue:](v18, "_commonInitWithManager:home:initialPinCodeValue:", v13, v15, v14);
    -[HUPinCodeEditorViewController setUpdatedPINCodeCompletionBlock:](v18, "setUpdatedPINCodeCompletionBlock:", v16);
  }

  return v18;
}

- (id)initForCreatingNewPinCodeWithManager:(id)a3 initialPinCodeValue:(id)a4 home:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HUPinCodeEditorViewController *v14;
  HUPinCodeEditorViewController *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUPinCodeEditorViewController;
  v14 = -[HUPinCodeEditorViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    -[HUPinCodeEditorViewController _commonInitWithManager:home:initialPinCodeValue:](v14, "_commonInitWithManager:home:initialPinCodeValue:", v10, v12, v11);
    -[HUPinCodeEditorViewController setNewPINCodeCompletionBlock:](v15, "setNewPINCodeCompletionBlock:", v13);
  }

  return v15;
}

- (HUPinCodeEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initForEditingPinCodeWithItem_pinCodeManager_pinCodeValue_home_completionBlock_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPinCodeEditorViewController.m"), 159, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPinCodeEditorViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUPinCodeEditorViewController)initWithCoder:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initForEditingPinCodeWithItem_pinCodeManager_pinCodeValue_home_completionBlock_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPinCodeEditorViewController.m"), 164, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPinCodeEditorViewController initWithCoder:]",
    v6);

  return 0;
}

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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  objc_super v87;

  v87.receiver = self;
  v87.super_class = (Class)HUPinCodeEditorViewController;
  -[HUPinCodeEditorViewController viewDidLoad](&v87, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeEditorViewControllerTitle"), CFSTR("HUPinCodeEditorViewControllerTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController setTitle:](self, "setTitle:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[HUPinCodeEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[HUPinCodeEditorViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[HUPinCodeEditorViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -60.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v20);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v26);

  -[HUPinCodeEditorViewController textField](self, "textField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutMarginsGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v32);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v37, 10.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v38);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutMarginsGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v43, -10.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v44);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "centerXAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layoutMarginsGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v50);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54, -28.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v55);

  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "layoutMarginsGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v60, 10.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v61);

  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "layoutMarginsGuide");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:constant:", v66, -10.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v67);

  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "layoutMarginsGuide");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerXAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v73);

  -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController textField](self, "textField");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v77, 28.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v78);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
  -[HUPinCodeEditorViewController navigationController](self, "navigationController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "viewControllers");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v77) = objc_msgSend(v81, "isEqual:", self);

  if ((_DWORD)v77)
  {
    v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed_);
    -[HUPinCodeEditorViewController navigationItem](self, "navigationItem");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setLeftBarButtonItem:", v82);

  }
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_saveButtonPressed_);
  -[HUPinCodeEditorViewController setSaveButtonItem:](self, "setSaveButtonItem:", v84);

  -[HUPinCodeEditorViewController saveButtonItem](self, "saveButtonItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController navigationItem](self, "navigationItem");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setRightBarButtonItem:", v85);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUPinCodeEditorViewController;
  -[HUPinCodeEditorViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[HUPinCodeEditorViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)_updateHeaderAndFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;

  objc_opt_class();
  -[HUPinCodeEditorViewController sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v48 = v4;

  objc_opt_class();
  -[HUPinCodeEditorViewController sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = v7;
  else
    v8 = v48;
  objc_msgSend(v8, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  objc_msgSend(v48, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HUPinCodeEditorViewController codeLengthMin](self, "codeLengthMin");
  -[HUPinCodeEditorViewController codeLengthMax](self, "codeLengthMax");
  HULocalizedStringWithFormat(CFSTR("HUPinCodeEditorViewControllerInstructionHeaderNoName"), CFSTR("%ld%ld"), v18, v19, v20, v21, v22, v23, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v25 = -[HUPinCodeEditorViewController codeLengthMin](self, "codeLengthMin");
    -[HUPinCodeEditorViewController codeLengthMax](self, "codeLengthMax");
    HULocalizedStringWithFormat(CFSTR("HUPinCodeEditorViewControllerInstructionHeaderSelf"), CFSTR("%ld%ld"), v26, v27, v28, v29, v30, v31, v25);
  }
  else
  {
    if (!v16)
      goto LABEL_15;
    v32 = -[HUPinCodeEditorViewController codeLengthMin](self, "codeLengthMin");
    -[HUPinCodeEditorViewController codeLengthMax](self, "codeLengthMax");
    HULocalizedStringWithFormat(CFSTR("HUPinCodeEditorViewControllerInstructionHeader"), CFSTR("%ld%ld%@"), v33, v34, v35, v36, v37, v38, v32);
  }
  v39 = objc_claimAutoreleasedReturnValue();

  v24 = (void *)v39;
LABEL_15:
  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setText:", v24);

  -[HUPinCodeEditorViewController instructionHeader](self, "instructionHeader");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sizeToFit");

  if (v9)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeEditInstructionFooter"), CFSTR("HUPinCodeEditInstructionFooter"), 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v42);

    -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sizeToFit");

    -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    v47 = 0;
  }
  else
  {
    -[HUPinCodeEditorViewController footerLabel](self, "footerLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    v47 = 1;
  }
  objc_msgSend(v45, "setHidden:", v47);

}

- (void)cancelButtonPressed:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[HUPinCodeEditorViewController textField](self, "textField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[HUPinCodeEditorViewController presentationDelegate](self, "presentationDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "finishPresentation:animated:", self, 1);

}

- (void)saveButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  id v23;

  v4 = a3;
  -[HUPinCodeEditorViewController textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  -[HUPinCodeEditorViewController textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(MEMORY[0x1E0D31648], "asciiStringForLocalizedPINString:error:", v7, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  -[HUPinCodeEditorViewController setEditedPinCode:](self, "setEditedPinCode:", v8);
  objc_initWeak(&location, self);
  -[HUPinCodeEditorViewController checkForPINCodeValueValidationErrors](self, "checkForPINCodeValueValidationErrors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke;
  v20[3] = &unk_1E6F4F2D0;
  v12 = v9;
  v21 = v12;
  objc_msgSend(v10, "recover:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_46;
  v18[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v13, "addFailureBlock:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2_48;
  v16[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v17, &location);
  v15 = (id)objc_msgSend(v14, "addSuccessBlock:", v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

id __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = v4;

    v3 = v5;
  }
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D309C0];
  objc_msgSend(v6, "logError:operationDescription:", v3, *MEMORY[0x1E0D309C0]);

  v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D305C8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D305B0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2;
    aBlock[3] = &unk_1E6F4C638;
    v24 = v3;
    v25 = v8;
    v13 = _Block_copy(aBlock);

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_44;
  v20[3] = &unk_1E6F4C638;
  v21 = v3;
  v15 = v8;
  v22 = v15;
  v16 = v3;
  objc_msgSend(v14, "handleError:operationType:options:retryBlock:cancelBlock:", v16, v7, 0, v13, v20);

  v17 = v22;
  v18 = v15;

  return v18;
}

uint64_t __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "code");
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == 77)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Optional PIN Code validation was dismissed by user. Proceeding to set PIN Code. %@", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }
  else
  {
    if (v4)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Unknown PIN Code validation error requested retry. Closing editor without setting PIN Code. %@", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "finishWithError:", *(_QWORD *)(a1 + 32));
  }
}

uint64_t __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v8) = 0;
    _os_log_error_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_ERROR, "Closing edit view without saving.", (uint8_t *)&v8, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "code") == 75
    || objc_msgSend(*(id *)(a1 + 32), "code") == 74
    || objc_msgSend(*(id *)(a1 + 32), "code") == 77
    || objc_msgSend(*(id *)(a1 + 32), "code") == 82)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Mandatory PIN Code validation. Stay on editor so user can fix issue. %@", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "cancel");
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Got failure trying to validate PIN Code. Closing editor without setting PIN Code. %@", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "finishWithError:", *(_QWORD *)(a1 + 32));
  }
}

void __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_46(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v8, "code");

  if (v5 != 3072)
  {
LABEL_5:
    objc_msgSend(WeakRetained, "presentationDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "finishPresentation:animated:", WeakRetained, 1);
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");
LABEL_6:

}

void __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_2_48(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "newPINCodeCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "presentationDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "finishPresentation:animated:", WeakRetained, 1);

    objc_msgSend(WeakRetained, "newPINCodeCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "editedPinCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  else
  {
    objc_msgSend(WeakRetained, "updatedPINCodeCompletionBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      NSLog(CFSTR("Attempting to save new PIN Code Value but we don't have a completion handler."));
      goto LABEL_6;
    }
    objc_msgSend(WeakRetained, "commitPinCodeChange");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_3;
    v9[3] = &unk_1E6F60838;
    v9[4] = WeakRetained;
    v8 = (id)objc_msgSend(v5, "addSuccessBlock:", v9);
  }

LABEL_6:
}

void __51__HUPinCodeEditorViewController_saveButtonPressed___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void (**v7)(id, id);

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "presentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "finishPresentation:animated:", *(_QWORD *)(a1 + 32), 1);

  objc_msgSend(*(id *)(a1 + 32), "updatedPINCodeCompletionBlock");
  v7 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v4);

}

- (id)commitPinCodeChange
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;

  -[HUPinCodeEditorViewController _showSpinner](self, "_showSpinner");
  objc_opt_class();
  -[HUPinCodeEditorViewController sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  -[HUPinCodeEditorViewController sourceItem](self, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    v9 = v8;
  else
    v9 = v5;
  objc_msgSend(v9, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController editedPinCode](self, "editedPinCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController pinCodeManager](self, "pinCodeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
    objc_msgSend(v12, "setUserPinCode:forUser:", v11, v10);
  else
    objc_msgSend(v12, "updatePinCodeWithItem:withCodeValue:", v5, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__HUPinCodeEditorViewController_commitPinCodeChange__block_invoke;
  v17[3] = &unk_1E6F4E380;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v14, "addCompletionBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v15;
}

void __52__HUPinCodeEditorViewController_commitPinCodeChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideSpinner");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v6, *MEMORY[0x1E0D30A60], 0, 0, 0);

  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  if (-[HUPinCodeEditorViewController codeLengthMax](self, "codeLengthMax") <= 0)
  {
    NSLog(CFSTR("Ignoring invalid max code length, but if we don't have valid contraints we should even be allowing editing PIN Codes."));
    v16 = 1;
  }
  else
  {
    -[HUPinCodeEditorViewController textField](self, "textField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_1E6F60E80;
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    -[__CFString stringByReplacingCharactersInRange:withString:](v13, "stringByReplacingCharactersInRange:withString:", location, length, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "length");
    v16 = v15 <= -[HUPinCodeEditorViewController codeLengthMax](self, "codeLengthMax");

  }
  return v16;
}

- (id)checkForPINCodeValueValidationErrors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  -[HUPinCodeEditorViewController sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  -[HUPinCodeEditorViewController textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pinCodeValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPinCodeEditorViewController pinCodeManager](self, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "checkForValidationErrorsWithPINCodeValue:originalPINCode:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_showSpinner
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
  -[HUPinCodeEditorViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(v5, "startAnimating");
}

- (void)_hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_opt_class();
  -[HUPinCodeEditorViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v9 = v6;

  -[HUPinCodeEditorViewController saveButtonItem](self, "saveButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPinCodeEditorViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  objc_msgSend(v9, "stopAnimating");
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HMHome)home
{
  return (HMHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (UILabel)instructionHeader
{
  return self->_instructionHeader;
}

- (void)setInstructionHeader:(id)a3
{
  objc_storeStrong((id *)&self->_instructionHeader, a3);
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footerLabel, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (UIBarButtonItem)saveButtonItem
{
  return self->_saveButtonItem;
}

- (void)setSaveButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_saveButtonItem, a3);
}

- (NSString)editedPinCode
{
  return self->_editedPinCode;
}

- (void)setEditedPinCode:(id)a3
{
  objc_storeStrong((id *)&self->_editedPinCode, a3);
}

- (id)newPINCodeCompletionBlock
{
  return self->_newPINCodeCompletionBlock;
}

- (void)setNewPINCodeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (id)updatedPINCodeCompletionBlock
{
  return self->_updatedPINCodeCompletionBlock;
}

- (void)setUpdatedPINCodeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (int64_t)codeLengthMin
{
  return self->_codeLengthMin;
}

- (void)setCodeLengthMin:(int64_t)a3
{
  self->_codeLengthMin = a3;
}

- (int64_t)codeLengthMax
{
  return self->_codeLengthMax;
}

- (void)setCodeLengthMax:(int64_t)a3
{
  self->_codeLengthMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPINCodeCompletionBlock, 0);
  objc_storeStrong(&self->_newPINCodeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_editedPinCode, 0);
  objc_storeStrong((id *)&self->_saveButtonItem, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_instructionHeader, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
