@implementation EKLocationVirtualConferenceSearchFieldsView

- (EKLocationVirtualConferenceSearchFieldsView)init
{
  EKLocationVirtualConferenceSearchFieldsView *v2;
  EKLocationVirtualConferenceSearchFieldsView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UITextField *locationTextField;
  void *v11;
  void *v12;
  uint64_t v13;
  UITextField *virtualConferenceTextField;
  UIView *v15;
  UIView *hairline;
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
  id v28;
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
  _QWORD v76[4];
  id v77;
  id location;
  objc_super v79;
  uint64_t v80;
  _QWORD v81[18];

  v81[16] = *MEMORY[0x1E0C80C00];
  v79.receiver = self;
  v79.super_class = (Class)EKLocationVirtualConferenceSearchFieldsView;
  v2 = -[EKLocationVirtualConferenceSearchFieldsView init](&v79, sel_init);
  v3 = v2;
  if (v2)
  {
    -[EKLocationVirtualConferenceSearchFieldsView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCornerRadius:", 10.0);

    -[EKLocationVirtualConferenceSearchFieldsView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView setBackgroundColor:](v3, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v74);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setBackgroundColor:", v6);

    objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKLocationVirtualConferenceSearchFieldsView addSubview:](v3, "addSubview:", v75);
    -[EKLocationVirtualConferenceSearchFieldsView locationLabelText](v3, "locationLabelText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView locationLabelImageName](v3, "locationLabelImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EKLocationVirtualConferenceSearchFieldsView _newTextFieldWithLeftViewText:imageName:](v3, "_newTextFieldWithLeftViewText:imageName:", v7, v8);
    locationTextField = v3->_locationTextField;
    v3->_locationTextField = (UITextField *)v9;

    -[UITextField setTextContentType:](v3->_locationTextField, "setTextContentType:", *MEMORY[0x1E0DC5430]);
    -[EKLocationVirtualConferenceSearchFieldsView addSubview:](v3, "addSubview:", v3->_locationTextField);
    -[EKLocationVirtualConferenceSearchFieldsView conferenceLabelText](v3, "conferenceLabelText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView conferenceLabelImageName](v3, "conferenceLabelImageName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EKLocationVirtualConferenceSearchFieldsView _newTextFieldWithLeftViewText:imageName:](v3, "_newTextFieldWithLeftViewText:imageName:", v11, v12);
    virtualConferenceTextField = v3->_virtualConferenceTextField;
    v3->_virtualConferenceTextField = (UITextField *)v13;

    -[EKLocationVirtualConferenceSearchFieldsView addSubview:](v3, "addSubview:", v3->_virtualConferenceTextField);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    hairline = v3->_hairline;
    v3->_hairline = v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_hairline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_hairline, "setBackgroundColor:", v17);

    -[EKLocationVirtualConferenceSearchFieldsView addSubview:](v3, "addSubview:", v3->_hairline);
    v30 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v75, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView leadingAnchor](v3, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v71;
    objc_msgSend(v75, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView topAnchor](v3, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v68;
    objc_msgSend(v75, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView bottomAnchor](v3, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v65;
    objc_msgSend(v75, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView trailingAnchor](v3, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v81[3] = v62;
    -[UITextField leadingAnchor](v3->_locationTextField, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v81[4] = v58;
    -[UITextField topAnchor](v3->_locationTextField, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView topAnchor](v3, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v81[5] = v55;
    -[UITextField trailingAnchor](v3->_locationTextField, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v81[6] = v51;
    -[UITextField bottomAnchor](v3->_locationTextField, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField topAnchor](v3->_virtualConferenceTextField, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v81[7] = v48;
    -[UITextField heightAnchor](v3->_locationTextField, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField heightAnchor](v3->_virtualConferenceTextField, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v81[8] = v45;
    -[UITextField leadingAnchor](v3->_virtualConferenceTextField, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v81[9] = v41;
    -[UITextField trailingAnchor](v3->_virtualConferenceTextField, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v81[10] = v37;
    -[UITextField bottomAnchor](v3->_virtualConferenceTextField, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView bottomAnchor](v3, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v81[11] = v34;
    -[UIView leadingAnchor](v3->_hairline, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView leadingAnchor](v3, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v81[12] = v31;
    -[UIView trailingAnchor](v3->_hairline, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView trailingAnchor](v3, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v81[13] = v20;
    -[UIView centerYAnchor](v3->_hairline, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView centerYAnchor](v3, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v81[14] = v23;
    -[UIView heightAnchor](v3->_hairline, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 1.0 / EKUIScaleFactor());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v81[15] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v26);

    objc_initWeak(&location, v3);
    v80 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __51__EKLocationVirtualConferenceSearchFieldsView_init__block_invoke;
    v76[3] = &unk_1E6018610;
    objc_copyWeak(&v77, &location);
    v28 = (id)-[EKLocationVirtualConferenceSearchFieldsView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v27, v76);

    objc_destroyWeak(&v77);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __51__EKLocationVirtualConferenceSearchFieldsView_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[54];
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "locationLabelText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationLabelImageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateLeftViewForTextField:withText:imageName:", v2, v3, v4);

    v5 = v8[55];
    objc_msgSend(v8, "conferenceLabelText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conferenceLabelImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateLeftViewForTextField:withText:imageName:", v5, v6, v7);

    WeakRetained = v8;
  }

}

- (double)preferredHeight
{
  return 93.0;
}

- (id)_newTextFieldWithLeftViewText:(id)a3 imageName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0DC3DB8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setLeftViewMode:", 3);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setClearButtonMode:", 3);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v11);

  objc_msgSend(v9, "setReturnKeyType:", 9);
  objc_msgSend(v9, "setEnablesReturnKeyAutomatically:", 0);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_textFieldDidChange_, 0x20000);
  -[EKLocationVirtualConferenceSearchFieldsView updateLeftViewForTextField:withText:imageName:](self, "updateLeftViewForTextField:withText:imageName:", v9, v8, v7);

  return v9;
}

- (void)updateLeftViewForTextField:(id)a3 withText:(id)a4 imageName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a5;
  v9 = a3;
  -[EKLocationVirtualConferenceSearchFieldsView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = EKUIUsesLargeTextLayout(v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v8, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    objc_msgSend(v9, "setLeftView:", v14);
    v9 = (id)v13;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v12, "setText:", v18);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v16);

    objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v17);

    objc_msgSend(v9, "setLeftView:", v12);
  }

}

- (void)setDisableConferenceTextField:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (self->_disableConferenceTextField != a3)
  {
    -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self, "virtualConferenceTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setEnabled:", 0);

      -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self, "virtualConferenceTextField");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setClearButtonMode:", 0);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    }
    else
    {
      objc_msgSend(v5, "setEnabled:", 1);

      -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self, "virtualConferenceTextField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClearButtonMode:", 3);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self, "virtualConferenceTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
  self->_disableConferenceTextField = v3;
}

- (id)locationLabelText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Location: "), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)locationLabelImageName
{
  return CFSTR("mappin.circle.fill");
}

- (id)conferenceLabelText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Video Call: "), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)conferenceLabelImageName
{
  return CFSTR("video.fill");
}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[EKLocationVirtualConferenceSearchFieldsView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textField:didChange:", v4, v5);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKLocationVirtualConferenceSearchFieldsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textFieldDoneTapped:", v4);

  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EKLocationVirtualConferenceSearchFieldsView selectedTextField](self, "selectedTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[EKLocationVirtualConferenceSearchFieldsView setSelectedTextField:](self, "setSelectedTextField:", v6);
    -[EKLocationVirtualConferenceSearchFieldsView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedTextFieldChanged:", v6);

  }
}

- (UITextField)locationTextField
{
  return self->_locationTextField;
}

- (UITextField)virtualConferenceTextField
{
  return self->_virtualConferenceTextField;
}

- (UITextField)selectedTextField
{
  return self->_selectedTextField;
}

- (void)setSelectedTextField:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTextField, a3);
}

- (BOOL)disableConferenceTextField
{
  return self->_disableConferenceTextField;
}

- (EKLocationVirtualConferenceSearchFieldsDelegate)delegate
{
  return (EKLocationVirtualConferenceSearchFieldsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedTextField, 0);
  objc_storeStrong((id *)&self->_virtualConferenceTextField, 0);
  objc_storeStrong((id *)&self->_locationTextField, 0);
  objc_storeStrong((id *)&self->_hairline, 0);
}

@end
