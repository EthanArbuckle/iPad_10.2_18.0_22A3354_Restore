@implementation APUISuggestionView

- (void)layoutSuggestion:(id)a3
{
  NSObject *v5;

  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[APUISuggestionView layoutSuggestion:].cold.1(v5);

  -[APUISuggestionView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)createViewsIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
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
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t platterSize;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
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
  unint64_t v77;
  void *v78;
  void *v79;
  void *v80;
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
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _QWORD v117[4];
  void *v118;
  _QWORD v119[4];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[5];

  v122[3] = *MEMORY[0x24BDAC8D0];
  -[APUISuggestionView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[APUISuggestionView setAppImageView:](self, "setAppImageView:", v4);

    -[APUISuggestionView appImageView](self, "appImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[APUISuggestionView appImageView](self, "appImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 1);

    v7 = dbl_21998ECC0[-[APUISuggestionView platterSize](self, "platterSize") == 2];
    v8 = *MEMORY[0x24BDF77D0];
    v9 = *MEMORY[0x24BDF7680];
    if (self->_platterSize == 2)
      v10 = *MEMORY[0x24BDF7680];
    else
      v10 = *MEMORY[0x24BDF7660];
    objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x24BDF77D0], v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[APUISuggestionView setTitleLabel:](self, "setTitleLabel:", v12);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView titleLabel](self, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDF7890];
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 13.0, *MEMORY[0x24BDF7890]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v11;
    objc_msgSend(v11, "pointSize");
    objc_msgSend(v15, "scaledFontForFont:maximumPointSize:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView titleLabel](self, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    -[APUISuggestionView titleLabel](self, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAdjustsFontSizeToFitWidth:", 0);

    -[APUISuggestionView titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1132068864;
    objc_msgSend(v21, "setContentCompressionResistancePriority:forAxis:", 1, v22);

    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLineBreakMode:", 4);

    -[APUISuggestionView titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v25 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[APUISuggestionView setSubtitleLabel:](self, "setSubtitleLabel:", v25);

    v26 = *MEMORY[0x24BDF77C8];
    objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x24BDF77C8], v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFont:", v27);

    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v29);

    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 1132003328;
    objc_msgSend(v31, "setContentCompressionResistancePriority:forAxis:", 1, v32);

    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLineBreakMode:", 4);

    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:maximumContentSizeCategory:", v26, v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[APUISuggestionView setReasonLabel:](self, "setReasonLabel:", v36);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 11.0, v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v35;
    objc_msgSend(v35, "pointSize");
    v115 = v15;
    objc_msgSend(v15, "scaledFontForFont:maximumPointSize:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView reasonLabel](self, "reasonLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFont:", v38);

    -[APUISuggestionView reasonLabel](self, "reasonLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLineBreakMode:", 4);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView reasonLabel](self, "reasonLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTextColor:", v41);

    -[APUISuggestionView reasonLabel](self, "reasonLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[APUISuggestionView _updateReasonStylingProvider](self, "_updateReasonStylingProvider");
    -[APUISuggestionView _updateMaximumNumberOfLines](self, "_updateMaximumNumberOfLines");
    -[APUISuggestionView titleLabel](self, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v44;
    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v45;
    -[APUISuggestionView reasonLabel](self, "reasonLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v122[2] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView setLabels:](self, "setLabels:", v47);

    v48 = objc_alloc(MEMORY[0x24BDF6DD0]);
    -[APUISuggestionView titleLabel](self, "titleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v49;
    -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v50;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v48, "initWithArrangedSubviews:", v51);

    objc_msgSend(v52, "setAxis:", 1);
    objc_msgSend(v52, "setAlignment:", 1);
    objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v52, "setSpacing:", 3.0);
    v53 = objc_alloc(MEMORY[0x24BDF6DD0]);
    -[APUISuggestionView appImageView](self, "appImageView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v120[0] = v54;
    v120[1] = v52;
    v112 = v52;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v53, "initWithArrangedSubviews:", v55);
    -[APUISuggestionView setStackView:](self, "setStackView:", v56);

    platterSize = self->_platterSize;
    -[APUISuggestionView stackView](self, "stackView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (platterSize == 2)
    {
      objc_msgSend(v58, "setAxis:", 0);

      -[APUISuggestionView stackView](self, "stackView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setAlignment:", 3);

      -[APUISuggestionView stackView](self, "stackView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      v63 = 8.0;
    }
    else
    {
      objc_msgSend(v58, "setDistribution:", 0);

      -[APUISuggestionView stackView](self, "stackView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setAxis:", 1);

      -[APUISuggestionView stackView](self, "stackView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setAlignment:", 1);

      -[APUISuggestionView stackView](self, "stackView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      v63 = 5.5;
    }
    objc_msgSend(v61, "setSpacing:", v63);

    -[APUISuggestionView stackView](self, "stackView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[APUISuggestionView stackView](self, "stackView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView addSubview:](self, "addSubview:", v67);

    v96 = (void *)MEMORY[0x24BDD1628];
    -[APUISuggestionView appImageView](self, "appImageView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "heightAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView heightAnchor](self, "heightAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:multiplier:", v106, v7);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v104;
    -[APUISuggestionView appImageView](self, "appImageView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "widthAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView appImageView](self, "appImageView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "heightAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:multiplier:", v94, 1.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v93;
    -[APUISuggestionView stackView](self, "stackView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView leadingAnchor](self, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, 16.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v119[2] = v71;
    -[APUISuggestionView trailingAnchor](self, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView stackView](self, "stackView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:constant:", v74, 16.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v119[3] = v75;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 4);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "activateConstraints:", v76);

    v77 = self->_platterSize;
    v78 = (void *)MEMORY[0x24BDD1628];
    -[APUISuggestionView stackView](self, "stackView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (v77 == 2)
    {
      objc_msgSend(v79, "centerYAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView centerYAnchor](self, "centerYAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v83;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v118, 1);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "activateConstraints:", v84);
    }
    else
    {
      objc_msgSend(v79, "topAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView topAnchor](self, "topAnchor");
      v105 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "constraintEqualToAnchor:constant:", v105, 16.0);
      v101 = objc_claimAutoreleasedReturnValue();
      v117[0] = v101;
      -[APUISuggestionView bottomAnchor](self, "bottomAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView stackView](self, "stackView");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "bottomAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "constraintGreaterThanOrEqualToAnchor:constant:", v109, 16.0);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v117[1] = v107;
      -[APUISuggestionView titleLabel](self, "titleLabel");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "trailingAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView stackView](self, "stackView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "trailingAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToAnchor:", v95);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v117[2] = v85;
      -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
      v86 = v78;
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "trailingAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView stackView](self, "stackView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "trailingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "constraintEqualToAnchor:", v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v117[3] = v91;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v117, 4);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "activateConstraints:", v92);

      v83 = (void *)v101;
      v82 = (void *)v105;

      v81 = v111;
    }

  }
}

- (void)_updateReasonStylingProvider
{
  void *v3;
  void *v4;
  void *v5;
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *reasonStylingProvider;
  void *v8;

  -[APUISuggestionView reasonLabel](self, "reasonLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](self->_reasonStylingProvider, "stopAutomaticallyUpdatingView:", v3);
    v4 = (void *)MEMORY[0x24BE64070];
    -[APUISuggestionView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 0, 3, objc_msgSend(v5, "userInterfaceStyle"));
    v6 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    reasonStylingProvider = self->_reasonStylingProvider;
    self->_reasonStylingProvider = v6;

    -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_reasonStylingProvider, "automaticallyUpdateView:withStyle:", v8, 21);
    v3 = v8;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  NSObject *v4;

  __atxlog_handle_ui();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[APUISuggestionView traitCollectionDidChange:].cold.1(v4);

  -[APUISuggestionView _updateMaximumNumberOfLines](self, "_updateMaximumNumberOfLines");
  -[APUISuggestionView _updateReasonStylingProvider](self, "_updateReasonStylingProvider");
}

- (void)_updateMaximumNumberOfLines
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = -[APUISuggestionView _titleNumberOfLines](self, "_titleNumberOfLines");
  -[APUISuggestionView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", v3);

  v5 = -[APUISuggestionView _subtitleNumberOfLines](self, "_subtitleNumberOfLines");
  -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", v5);

  -[APUISuggestionView reasonLabel](self, "reasonLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 1);

}

- (int)_titleNumberOfLines
{
  void *v3;
  NSString *v4;
  UIContentSizeCategory *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  int v11;

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (self->_platterSize == 2)
  {
    v5 = (UIContentSizeCategory *)MEMORY[0x24BDF7660];
LABEL_5:
    v9 = UIContentSizeCategoryCompareToCategory(v4, *v5) == NSOrderedDescending;
    v10 = 1;
    goto LABEL_7;
  }
  -[APUISuggestionView reasonLabel](self, "reasonLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v5 = (UIContentSizeCategory *)MEMORY[0x24BDF7688];
    goto LABEL_5;
  }
  v9 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x24BDF7680]) == NSOrderedDescending;
  v10 = 2;
LABEL_7:
  if (v9)
    v11 = v10;
  else
    v11 = v10 + 1;

  return v11;
}

- (int)_subtitleNumberOfLines
{
  void *v3;
  NSString *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (self->_platterSize == 2)
  {
    if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x24BDF7688]) == NSOrderedDescending)
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)installReasonLabelIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  _QWORD *v19;
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
  _QWORD v32[4];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  -[APUISuggestionView reasonLabel](self, "reasonLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[APUISuggestionView reasonLabel](self, "reasonLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[APUISuggestionView _updateMaximumNumberOfLines](self, "_updateMaximumNumberOfLines");
    -[APUISuggestionView reasonLabel](self, "reasonLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView addSubview:](self, "addSubview:", v7);

    v27 = (void *)MEMORY[0x24BDD1628];
    if (self->_platterSize == 2)
    {
      -[APUISuggestionView stackView](self, "stackView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leadingAnchor");
      v30 = v8;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", -8.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v26;
      -[APUISuggestionView trailingAnchor](self, "trailingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trailingAnchor");
      v25 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:constant:", 16.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v10;
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView topAnchor](self, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 16.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v14;
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView bottomAnchor](self, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v17, 16.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v18;
      v19 = v33;
    }
    else
    {
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView stackView](self, "stackView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "bottomAnchor");
      v30 = v20;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", 5.5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v26;
      -[APUISuggestionView bottomAnchor](self, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bottomAnchor");
      v25 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", 16.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v10;
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView leadingAnchor](self, "leadingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 16.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v14;
      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[APUISuggestionView trailingAnchor](self, "trailingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v17, -16.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[3] = v18;
      v19 = v32;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v22);

  }
}

- (void)_setINImage:(id)a3 withBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  APUISuggestionView *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD9DB8], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_ui();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_219979000, v9, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent: INRemoteImageProxy image using connection %@", buf, 0xCu);
    }

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke;
    v15[3] = &unk_24DB7DAC0;
    v16 = v8;
    v17 = v6;
    v18 = self;
    v19 = v7;
    v10 = v7;
    v11 = v8;
    objc_msgSend(v11, "loadImageDataAndSizeForImage:reply:", v17, v15);

  }
  else
  {
    __atxlog_handle_ui();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_219979000, v12, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent: using fetchUIImageWithCompletion %@", buf, 0xCu);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_18;
    v13[3] = &unk_24DB7DAE8;
    v13[4] = self;
    v14 = v7;
    v11 = v7;
    objc_msgSend(v6, "fetchUIImageWithCompletion:", v13);

  }
}

void __47__APUISuggestionView__setINImage_withBundleID___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD block[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_ui();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__APUISuggestionView__setINImage_withBundleID___block_invoke_cold_1((uint64_t)a1, v6, v7);

  }
  __atxlog_handle_ui();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_219979000, v8, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent:connection %@ reply loadedImage=%@", buf, 0x16u);
  }

  objc_msgSend(v5, "_imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_15;
    block[3] = &unk_24DB7D290;
    block[4] = a1[6];
    v17 = v11;
    v12 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2;
    v14[3] = &unk_24DB7D290;
    v13 = (void *)a1[7];
    v14[4] = a1[6];
    v15 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

  }
}

uint64_t __47__APUISuggestionView__setINImage_withBundleID___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAppImageViewWithImage:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAppImageViewWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
}

void __47__APUISuggestionView__setINImage_withBundleID___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2_19;
  block[3] = &unk_24DB7D3D0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __47__APUISuggestionView__setINImage_withBundleID___block_invoke_2_19(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_setAppImageViewWithImage:");
  else
    return objc_msgSend(v2, "_setAppImageViewWithBundleIdentifier:", a1[6]);
}

- (void)setINImage:(id)a3 withBundleID:(id)a4
{
  if (a3)
    -[APUISuggestionView _setINImage:withBundleID:](self, "_setINImage:withBundleID:", a3, a4);
  else
    -[APUISuggestionView _setAppImageViewWithBundleIdentifier:](self, "_setAppImageViewWithBundleIdentifier:", a4);
}

- (void)setLNImage:(id)a3 withBundleID:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = v6;
  if (a3)
  {
    objc_msgSend(a3, "inImage");
    v7 = objc_claimAutoreleasedReturnValue();
    -[APUISuggestionView setINImage:withBundleID:](self, "setINImage:withBundleID:", v7, v9);

    v8 = (void *)v7;
  }
  else
  {
    -[APUISuggestionView _setAppImageViewWithBundleIdentifier:](self, "_setAppImageViewWithBundleIdentifier:", v6);
    v8 = v9;
  }

}

- (void)_setAppImageViewWithImage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[APUISuggestionView _setAppImageViewWithImage:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent %s:  image: %@", (uint8_t *)&v10, 0x16u);
  }

  -[APUISuggestionView appImageView](self, "appImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 5.0);

  -[APUISuggestionView appImageView](self, "appImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 1);

  -[APUISuggestionView appImageView](self, "appImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v4);

}

- (void)_setAppImageViewWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __atxlog_handle_ui();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[APUISuggestionView _setAppImageViewWithBundleIdentifier:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: image with intent %s:  bundleId: %@", (uint8_t *)&v11, 0x16u);
  }

  -[APUISuggestionView appImageView](self, "appImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 0.0);

  -[APUISuggestionView appImageView](self, "appImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClipsToBounds:", 0);

  -[APUISuggestionView appImageView](self, "appImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[APUIAppIconDataSource iconForBundleIdentifier:shouldApplyMask:](APUIAppIconDataSource, "iconForBundleIdentifier:shouldApplyMask:", v4, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v10);

}

- (unint64_t)platterSize
{
  return self->_platterSize;
}

- (void)setPlatterSize:(unint64_t)a3
{
  self->_platterSize = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIImageView)appImageView
{
  return self->_appImageView;
}

- (void)setAppImageView:(id)a3
{
  objc_storeStrong((id *)&self->_appImageView, a3);
}

- (UILabel)reasonLabel
{
  return self->_reasonLabel;
}

- (void)setReasonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_reasonLabel, a3);
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (BOOL)canEngageSuggestion
{
  return self->_canEngageSuggestion;
}

- (void)setCanEngageSuggestion:(BOOL)a3
{
  self->_canEngageSuggestion = a3;
}

- (APUISuggestionsWidgetViewDelegate)delegate
{
  return (APUISuggestionsWidgetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_reasonLabel, 0);
  objc_storeStrong((id *)&self->_appImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_reasonStylingProvider, 0);
}

- (void)layoutSuggestion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219979000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: -[APUISuggestionView layoutSuggestion:] should be called only from a subclass", v1, 2u);
}

- (void)traitCollectionDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[APUISuggestionView traitCollectionDidChange:]";
  _os_log_debug_impl(&dword_219979000, log, OS_LOG_TYPE_DEBUG, "%{public}s", (uint8_t *)&v1, 0xCu);
}

void __47__APUISuggestionView__setINImage_withBundleID___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218754;
  v8 = 5517;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  _os_log_error_impl(&dword_219979000, a3, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: Error with connection %@ loadImageDataAndSizeForImage %@: %@", (uint8_t *)&v7, 0x2Au);

}

@end
