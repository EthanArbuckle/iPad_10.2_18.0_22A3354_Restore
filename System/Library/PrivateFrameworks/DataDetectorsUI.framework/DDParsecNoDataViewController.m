@implementation DDParsecNoDataViewController

- (void)loadView
{
  void *v3;
  UIView *v4;
  UIView *container;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *errorLabel;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
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
  __CFString *v43;
  void *v44;
  int v45;
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
  id v77;
  void *v78;
  _UIContentUnavailableView *v79;
  _UIContentUnavailableView *emptyNoContentView;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;

  v93 = (id)objc_opt_new();
  if (!self->_lookup)
  {
    -[DDParsecNoDataViewController altURL](self, "altURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v77 = objc_alloc(MEMORY[0x1E0CEACD8]);
      -[DDParsecNoDataViewController reason](self, "reason");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (_UIContentUnavailableView *)objc_msgSend(v77, "initWithFrame:title:style:", v78, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      emptyNoContentView = self->_emptyNoContentView;
      self->_emptyNoContentView = v79;

      -[_UIContentUnavailableView setTranslatesAutoresizingMaskIntoConstraints:](self->_emptyNoContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v93, "addSubview:", self->_emptyNoContentView);
      -[_UIContentUnavailableView topAnchor](self->_emptyNoContentView, "topAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "topAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setActive:", 1);

      -[_UIContentUnavailableView bottomAnchor](self->_emptyNoContentView, "bottomAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "bottomAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "constraintEqualToAnchor:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setActive:", 1);

      -[_UIContentUnavailableView leadingAnchor](self->_emptyNoContentView, "leadingAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "leadingAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintEqualToAnchor:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setActive:", 1);

      -[_UIContentUnavailableView trailingAnchor](self->_emptyNoContentView, "trailingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "trailingAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setActive:", 1);

      -[DDParsecNoDataViewController setView:](self, "setView:", v93);
      goto LABEL_24;
    }
  }
  v4 = (UIView *)objc_opt_new();
  container = self->_container;
  self->_container = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_container, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v93, "addSubview:", self->_container);
  -[UIView centerYAnchor](self->_container, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UIView centerXAnchor](self->_container, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UIView widthAnchor](self->_container, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v15 = (UILabel *)objc_opt_new();
  errorLabel = self->_errorLabel;
  self->_errorLabel = v15;

  -[DDParsecNoDataViewController reason](self, "reason");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_1E4259460;
  -[UILabel setText:](self->_errorLabel, "setText:", v19);

  v20 = (void *)MEMORY[0x1E0CEA5E8];
  v21 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB538]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pointSize");
  objc_msgSend(v20, "boldSystemFontOfSize:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_errorLabel, "setFont:", v23);

  -[UILabel setLineBreakMode:](self->_errorLabel, "setLineBreakMode:", 0);
  -[UILabel setTextAlignment:](self->_errorLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_errorLabel, "setTextColor:", v24);

  -[UIView addSubview:](self->_container, "addSubview:", self->_errorLabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_errorLabel, "setNumberOfLines:", 0);
  -[UILabel topAnchor](self->_errorLabel, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_container, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 15.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[UILabel centerXAnchor](self->_errorLabel, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_container, "centerXAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[UILabel widthAnchor](self->_errorLabel, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_container, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:constant:", v32, -15.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  -[DDParsecNoDataViewController altURL](self, "altURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {

  }
  else if (!-[DDParsecNoDataViewController lookup](self, "lookup")
         || (objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"),
             v44 = (void *)objc_claimAutoreleasedReturnValue(),
             v45 = objc_msgSend(v44, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47128]),
             v44,
             v45 == 2))
  {
    v35 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v21);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFont:", v36);

  objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTextColor:", v38);

  objc_msgSend(v35, "titleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setLineBreakMode:", 0);

  objc_msgSend(v35, "titleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTextAlignment:", 1);

  -[DDParsecNoDataViewController altURL](self, "altURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    v43 = CFSTR("Settings");
  else
    v43 = CFSTR("Search Web");
  DDLocalizedString(v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTitle:forState:", v46, 0);

  objc_msgSend(v35, "addTarget:action:forControlEvents:", self, sel_searchWeb_, 64);
  -[UIView addSubview:](self->_container, "addSubview:", v35);
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v35, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_errorLabel, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 15.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  objc_msgSend(v35, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_container, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  objc_msgSend(v35, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_container, "widthAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:constant:", v54, -15.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

LABEL_15:
  if (-[DDParsecNoDataViewController lookup](self, "lookup"))
  {
    -[DDParsecNoDataViewController manageDictionariesURL](self, "manageDictionariesURL");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v21);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "titleLabel");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setFont:", v58);

      objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "titleLabel");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setTextColor:", v60);

      objc_msgSend(v57, "titleLabel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setLineBreakMode:", 0);

      objc_msgSend(v57, "titleLabel");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setTextAlignment:", 1);

      DDLocalizedString(CFSTR("Manage Dictionaries"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setTitle:forState:", v64, 0);

      objc_msgSend(v57, "addTarget:action:forControlEvents:", self, sel_manageDictionaries_, 64);
      -[UIView addSubview:](self->_container, "addSubview:", v57);
      objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (v35)
      {
        objc_msgSend(v57, "topAnchor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bottomAnchor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, 15.0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setActive:", 1);

      }
      objc_msgSend(v57, "centerXAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](self->_container, "centerXAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToAnchor:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setActive:", 1);

      objc_msgSend(v57, "widthAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView widthAnchor](self->_container, "widthAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintLessThanOrEqualToAnchor:constant:", v72, -15.0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setActive:", 1);

      objc_msgSend(v57, "bottomAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_container, "bottomAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, -15.0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setActive:", 1);

      goto LABEL_22;
    }
  }
  if (v35)
  {
    objc_msgSend(v35, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_container, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v74, -15.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setActive:", 1);
LABEL_22:

  }
  -[DDParsecNoDataViewController setView:](self, "setView:", v93);

LABEL_24:
}

- (void)updateStyle
{
  void *v3;
  id v4;

  -[DDParsecNoDataViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_container, "setBackgroundColor:", v3);

  -[UIView layer](self->_container, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 14.0);

}

- (void)setReason:(id)a3
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  id v8;

  objc_storeStrong((id *)&self->_reason, a3);
  v5 = a3;
  -[DDParsecNoDataViewController reason](self, "reason");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = &stru_1E4259460;
  -[UILabel setText:](self->_errorLabel, "setText:", v7);

}

- (void)searchWeb:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  -[DDParsecNoDataViewController altURL](self, "altURL", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  -[DDParsecNoDataViewController searchWebQuery](self, "searchWebQuery");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    -[DDParsecNoDataViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[DDParsecNoDataViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interactionEndedWithPunchout:", 1);

    }
    dispatch_get_global_queue(33, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__DDParsecNoDataViewController_searchWeb___block_invoke;
    v10[3] = &unk_1E4258140;
    v11 = (id)v4;
    v12 = (id)v5;
    dispatch_async(v9, v10);

  }
}

void __42__DDParsecNoDataViewController_searchWeb___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

  }
  else
  {
    DDPerformWebSearchFromQuery(*(void **)(a1 + 40));
  }
}

- (id)manageDictionariesURL
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=DICTIONARY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "bundleIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.datadetectors.DDActionsService")),
        v4,
        v3,
        v5))
  {
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)manageDictionaries:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  -[DDParsecNoDataViewController manageDictionariesURL](self, "manageDictionariesURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[DDParsecNoDataViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[DDParsecNoDataViewController navigationController](self, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "interactionEndedWithPunchout:", 1);

    }
    dispatch_get_global_queue(33, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__DDParsecNoDataViewController_manageDictionaries___block_invoke;
    block[3] = &unk_1E42580C8;
    v10 = v4;
    dispatch_async(v8, block);

  }
}

void __51__DDParsecNoDataViewController_manageDictionaries___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)searchWebQuery
{
  return self->_searchWebQuery;
}

- (void)setSearchWebQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchWebQuery, a3);
}

- (NSURL)altURL
{
  return self->_altURL;
}

- (void)setAltURL:(id)a3
{
  objc_storeStrong((id *)&self->_altURL, a3);
}

- (BOOL)lookup
{
  return self->_lookup;
}

- (void)setLookup:(BOOL)a3
{
  self->_lookup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altURL, 0);
  objc_storeStrong((id *)&self->_searchWebQuery, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_emptyNoContentView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
