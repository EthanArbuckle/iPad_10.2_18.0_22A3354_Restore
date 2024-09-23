@implementation SFSafariLaunchPlaceholderView

+ (id)blankPlaceholder
{
  return (id)-[SFSafariLaunchPlaceholderView initWithAppName:destinationURL:forAuthentication:dismissalHandler:openHandler:]((uint64_t)objc_alloc((Class)a1), 0, 0, 0, 0, 0);
}

- (uint64_t)initWithAppName:(void *)a3 destinationURL:(char)a4 forAuthentication:(void *)a5 dismissalHandler:(void *)a6 openHandler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  _BYTE *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  int v46;
  uint64_t v47;
  id v49;
  objc_super v50;
  _QWORD v51[3];
  _QWORD v52[4];

  v52[3] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    v50.receiver = (id)a1;
    v50.super_class = (Class)SFSafariLaunchPlaceholderView;
    v15 = objc_msgSendSuper2(&v50, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    a1 = (uint64_t)v15;
    if (v15)
    {
      v15[416] = a4;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "setBackgroundColor:", v16);

      v17 = objc_alloc_init(MEMORY[0x1E0DC3A28]);
      v18 = *(void **)(a1 + 472);
      *(_QWORD *)(a1 + 472) = v17;

      objc_msgSend(*(id *)(a1 + 472), "setDelegate:", a1);
      objc_msgSend(*(id *)(a1 + 472), "_setAlwaysUseDefaultMetrics:", 1);
      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 472));
      if (v12)
      {
        v49 = v13;
        v19 = MEMORY[0x1A8598C40](v13);
        v20 = *(void **)(a1 + 440);
        *(_QWORD *)(a1 + 440) = v19;

        v21 = MEMORY[0x1A8598C40](v14);
        v22 = *(void **)(a1 + 448);
        *(_QWORD *)(a1 + 448) = v21;

        -[SFSafariLaunchPlaceholderView _setUpExplanationViewIfNeeded]((id *)a1);
        if (*(_BYTE *)(a1 + 416))
          v23 = 0;
        else
          v23 = 3;
        objc_msgSend(*(id *)(a1 + 456), "textContainer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMaximumNumberOfLines:", v23);

        if (*(_BYTE *)(a1 + 416))
          v25 = 0;
        else
          v25 = 5;
        objc_msgSend(*(id *)(a1 + 456), "textContainer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setLineBreakMode:", v25);

        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("globe"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 432), "setImage:", v27);

        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AE8], 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 432), "setPreferredSymbolConfiguration:", v28);

        _WBSLocalizedString();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 464), "setText:", v31);

        v32 = (void *)MEMORY[0x1E0CB3940];
        if (*(_BYTE *)(a1 + 416))
        {
          _WBSLocalizedString();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "safari_userVisibleHost");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", v33, v11, v34, v11);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          _WBSLocalizedString();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", v33, v11);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v36 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
        objc_msgSend(v36, "setAlignment:", 1);
        v37 = objc_alloc(MEMORY[0x1E0CB3778]);
        v51[0] = *MEMORY[0x1E0DC32A0];
        objc_msgSend(*(id *)(a1 + 456), "font");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = v38;
        v51[1] = *MEMORY[0x1E0DC32A8];
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v51[2] = *MEMORY[0x1E0DC32C0];
        v52[1] = v39;
        v52[2] = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v37, "initWithString:attributes:", v35, v40);

        if (!*(_BYTE *)(a1 + 416))
        {
          objc_msgSend(v12, "safari_userVisibleString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "safari_replaceOccurrenceOfString:withString:link:", CFSTR("{some-url}"), v42, v12);

        }
        objc_msgSend(*(id *)(a1 + 456), "setAttributedText:", v41);
        -[SFSafariLaunchPlaceholderView _updateLargeButton](a1);
        v43 = objc_alloc_init(MEMORY[0x1E0DC3A48]);
        v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", &stru_1E4AC8470, 2, a1, sel__dismissTapped_);
        v45 = *(void **)(a1 + 480);
        *(_QWORD *)(a1 + 480) = v44;

        v46 = objc_msgSend(MEMORY[0x1E0C99DC8], "_sf_isRTL");
        v47 = *(_QWORD *)(a1 + 480);
        if (v46)
          objc_msgSend(v43, "setRightBarButtonItem:", v47);
        else
          objc_msgSend(v43, "setLeftBarButtonItem:", v47);
        objc_msgSend(*(id *)(a1 + 472), "pushNavigationItem:animated:", v43, 0);

        v13 = v49;
      }
      else
      {
        v29 = objc_alloc_init(MEMORY[0x1E0DC3E68]);
        v30 = *(void **)(a1 + 424);
        *(_QWORD *)(a1 + 424) = v29;

        objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 424));
      }
    }
  }

  return a1;
}

+ (id)compatibilityPlaceholderWithAppName:(id)a3 destinationURL:(id)a4 forAuthentication:(BOOL)a5 dismissalHandler:(id)a6 openHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)-[SFSafariLaunchPlaceholderView initWithAppName:destinationURL:forAuthentication:dismissalHandler:openHandler:]((uint64_t)objc_alloc((Class)a1), v15, v14, a5, v13, v12);

  return v16;
}

- (void)_setUpExplanationViewIfNeeded
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
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
  _QWORD v64[13];
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a1[54])
    {
      v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      v3 = a1[54];
      a1[54] = v2;

      objc_msgSend(a1[54], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      v5 = a1[58];
      a1[58] = v4;

      objc_msgSend(a1[58], "setTextAlignment:", 1);
      objc_msgSend(MEMORY[0x1E0DC37E8], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B58], 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[58], "setFont:", v6);

      objc_msgSend(a1[58], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(a1[58], "setNumberOfLines:", 2);
      v7 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
      v8 = a1[57];
      a1[57] = v7;

      objc_msgSend(a1[57], "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[57], "setBackgroundColor:", v9);

      objc_msgSend(a1[57], "setEditable:", 0);
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[57], "setFont:", v10);

      objc_msgSend(a1[57], "_setInteractiveTextSelectionDisabled:", 1);
      v65 = *MEMORY[0x1E0DC32A8];
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[57], "setLinkTextAttributes:", v12);

      objc_msgSend(a1[57], "setScrollEnabled:", 0);
      objc_msgSend(a1[57], "setSelectable:", 1);
      objc_msgSend(a1[57], "setShowsVerticalScrollIndicator:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[57], "setTextColor:", v13);

      objc_msgSend(a1[57], "textContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLineFragmentPadding:", 0.0);

      objc_msgSend(a1[57], "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      objc_msgSend(a1[57], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v15 = (void *)MEMORY[0x1E0DC3518];
      objc_msgSend(MEMORY[0x1E0DC3520], "borderedButtonConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "buttonWithConfiguration:primaryAction:", v16, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = a1[61];
      a1[61] = (id)v17;

      objc_msgSend(a1[61], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(a1, "insertSubview:belowSubview:", a1[54], a1[59]);
      objc_msgSend(a1, "insertSubview:belowSubview:", a1[58], a1[59]);
      objc_msgSend(a1, "insertSubview:belowSubview:", a1[57], a1[59]);
      objc_msgSend(a1, "insertSubview:belowSubview:", a1[61], a1[59]);
      objc_msgSend(a1[57], "centerYAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v21;
      LODWORD(v22) = 1132068864;
      objc_msgSend(v21, "setPriority:", v22);
      objc_msgSend(a1[61], "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[57], "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 32.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v25;
      v43 = v25;
      LODWORD(v27) = 1132068864;
      objc_msgSend(v25, "setPriority:", v27);
      v51 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(a1[54], "centerXAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerXAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "constraintEqualToAnchor:", v62);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v61;
      objc_msgSend(a1[58], "centerXAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerXAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v59);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v58;
      objc_msgSend(a1[57], "centerXAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerXAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v64[2] = v55;
      objc_msgSend(a1[61], "centerXAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "centerXAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintEqualToAnchor:", v53);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v64[3] = v52;
      objc_msgSend(a1[54], "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[59], "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:constant:", v49, 13.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v64[4] = v48;
      objc_msgSend(a1[58], "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[54], "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 20.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v64[5] = v44;
      objc_msgSend(a1[58], "leadingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 30.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v64[6] = v40;
      objc_msgSend(a1, "trailingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[58], "trailingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v38, 30.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v64[7] = v28;
      v64[8] = v21;
      objc_msgSend(a1[57], "widthAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintLessThanOrEqualToConstant:", 300.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v64[9] = v30;
      objc_msgSend(a1[57], "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[58], "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 13.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v64[10] = v33;
      v64[11] = v26;
      objc_msgSend(a1, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[61], "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:", v35, 10.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v64[12] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 13);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "activateConstraints:", v37);

    }
  }
}

- (void)_updateLargeButton
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 416))
    {
      objc_msgSend(*(id *)(a1 + 488), "setHidden:", *(_BYTE *)(a1 + 496) == 0);
      objc_msgSend(*(id *)(a1 + 488), "addTarget:action:forControlEvents:", a1, sel__openTapped_, 0x2000);
      v2 = *(void **)(a1 + 488);
      _WBSLocalizedString();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 488), "setHidden:", 0);
      objc_msgSend(*(id *)(a1 + 488), "addTarget:action:forControlEvents:", a1, sel__dismissTapped_, 0x2000);
      v5 = *(void **)(a1 + 488);
      objc_msgSend(*(id *)(a1 + 480), "title");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = v5;
    }
    v6 = (id)v3;
    objc_msgSend(v4, "setTitle:forState:");

  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double topLayoutGuideInset;
  int IsCompactSizeClass;
  UIToolbar *bottomToolbar;
  double v20;
  double v21;
  double Height;
  CGFloat v23;
  uint64_t v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v25.receiver = self;
  v25.super_class = (Class)SFSafariLaunchPlaceholderView;
  -[SFSafariLaunchPlaceholderView layoutSubviews](&v25, sel_layoutSubviews);
  -[SFSafariLaunchPlaceholderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFSafariLaunchPlaceholderView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statusBarManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "statusBarFrame");
  +[_SFNavigationBar estimatedDefaultHeightForStatusBarHeight:](_SFBrowserNavigationBar, "estimatedDefaultHeightForStatusBarHeight:", CGRectGetHeight(v26));
  v15 = v14;

  -[SFSafariLaunchPlaceholderView safeAreaInsets](self, "safeAreaInsets");
  topLayoutGuideInset = v16;
  if ((dyld_program_sdk_at_least() & 1) == 0)
    topLayoutGuideInset = self->_topLayoutGuideInset;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  -[UINavigationBar setFrame:](self->_topNavigationBar, "setFrame:", 0.0, topLayoutGuideInset, CGRectGetWidth(v27), v15);
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  CGRectGetWidth(v28);
  IsCompactSizeClass = _SFWidthIsCompactSizeClass();
  bottomToolbar = self->_bottomToolbar;
  if (IsCompactSizeClass)
  {
    -[UIToolbar sizeThatFits:](bottomToolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v21 = v20;
    -[SFSafariLaunchPlaceholderView _sf_bottomUnsafeAreaFrameForToolbar](self, "_sf_bottomUnsafeAreaFrameForToolbar");
    Height = CGRectGetHeight(v29);
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    v23 = CGRectGetHeight(v30) - v21 - Height;
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    -[UIToolbar setFrame:](self->_bottomToolbar, "setFrame:", 0.0, v23, CGRectGetWidth(v31), v21);
    bottomToolbar = self->_bottomToolbar;
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  -[UIToolbar setHidden:](bottomToolbar, "setHidden:", v24);
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)updateBarTintColor:(id)a3
{
  UINavigationBar *topNavigationBar;
  id v5;

  topNavigationBar = self->_topNavigationBar;
  v5 = a3;
  -[UINavigationBar setBarTintColor:](topNavigationBar, "setBarTintColor:", v5);
  -[UIToolbar setBarTintColor:](self->_bottomToolbar, "setBarTintColor:", v5);

}

- (void)updateControlTintColor:(id)a3
{
  UINavigationBar *topNavigationBar;
  id v5;

  topNavigationBar = self->_topNavigationBar;
  v5 = a3;
  -[UINavigationBar setTintColor:](topNavigationBar, "setTintColor:", v5);
  -[UIToolbar setTintColor:](self->_bottomToolbar, "setTintColor:", v5);

}

- (void)updateDismissButtonStyle:(int64_t)a3
{
  id v4;

  +[SFDismissButton titleForDismissButtonStyle:]((uint64_t)SFDismissButton, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](self->_dismissButton, "setTitle:", v4);
  -[SFSafariLaunchPlaceholderView _updateLargeButton]((uint64_t)self);

}

- (void)setShowContinueButton:(BOOL)a3
{
  if (self->_showContinueButton != a3)
  {
    self->_showContinueButton = a3;
    -[SFSafariLaunchPlaceholderView _updateLargeButton]((uint64_t)self);
  }
}

- (void)_dismissTapped:(id)a3
{
  void (**dismissalHandler)(void);

  dismissalHandler = (void (**)(void))self->_dismissalHandler;
  if (dismissalHandler)
    dismissalHandler[2]();
}

- (void)_openTapped:(id)a3
{
  void (**openHandler)(void);

  -[UIButton setEnabled:](self->_largeButton, "setEnabled:", 0);
  openHandler = (void (**)(void))self->_openHandler;
  if (openHandler)
    openHandler[2]();
}

- (double)topLayoutGuideInset
{
  return self->_topLayoutGuideInset;
}

- (void)setTopLayoutGuideInset:(double)a3
{
  self->_topLayoutGuideInset = a3;
}

- (BOOL)showContinueButton
{
  return self->_showContinueButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_topNavigationBar, 0);
  objc_storeStrong((id *)&self->_linkTitleLabel, 0);
  objc_storeStrong((id *)&self->_linkCaptionTextView, 0);
  objc_storeStrong(&self->_openHandler, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_browserIconView, 0);
  objc_storeStrong((id *)&self->_bottomToolbar, 0);
}

@end
