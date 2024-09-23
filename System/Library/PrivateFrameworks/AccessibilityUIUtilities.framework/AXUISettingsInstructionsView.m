@implementation AXUISettingsInstructionsView

- (AXUISettingsInstructionsView)initWithSpecifier:(id)a3
{
  id v5;
  AXUISettingsInstructionsView *v6;
  uint64_t v7;
  NSMutableArray *marginConstraints;
  AXUISettingsInstructionsView *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXUISettingsInstructionsView;
  v6 = -[AXUISettingsInstructionsView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    marginConstraints = v6->_marginConstraints;
    v6->_marginConstraints = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_specifier, a3);
    -[AXUISettingsInstructionsView _initializeContent](v6, "_initializeContent");
    v9 = v6;
  }

  return v6;
}

- (id)settingsLocString:(id)a3 table:(id)a4
{
  PSSpecifier *specifier;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  specifier = self->_specifier;
  v6 = a4;
  v7 = a3;
  -[PSSpecifier propertyForKey:](specifier, "propertyForKey:", CFSTR("bundlePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v7, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_initializeContent
{
  NSMutableArray *v3;
  NSMutableArray *contentLabels;
  NSMutableArray *v5;
  NSMutableArray *moreLabels;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  UILabel *v32;
  UILabel *headerLabel;
  void *v34;
  double v35;
  void *v36;
  UILabel *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
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
  uint64_t v59;
  unint64_t v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UILabel *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
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
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  UILabel *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  UILabel *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  __int16 v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void *v145;
  AXUISettingsInstructionsView *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t (*v150)(uint64_t, uint64_t);
  void *v151;
  AXUISettingsInstructionsView *v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[3];
  _QWORD v159[3];
  _QWORD v160[3];
  _QWORD v161[3];
  _QWORD v162[3];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_opt_new();
  contentLabels = self->_contentLabels;
  self->_contentLabels = v3;

  v5 = (NSMutableArray *)objc_opt_new();
  moreLabels = self->_moreLabels;
  self->_moreLabels = v5;

  -[PSSpecifier propertyForKey:](self->_specifier, "propertyForKey:", CFSTR("table"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "groupedFooterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  -[PSSpecifier propertyForKey:](self->_specifier, "propertyForKey:", CFSTR("content"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v154, v163, 16);
  v11 = 0;
  if (!v131)
  {
LABEL_53:

    goto LABEL_54;
  }
  v128 = *(_QWORD *)v155;
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = 0x1E0D80000uLL;
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v122 = *MEMORY[0x1E0DC4AB8];
  v118 = *MEMORY[0x1E0DC3320];
  v119 = *MEMORY[0x1E0DC32B8];
  v117 = *MEMORY[0x1E0DC32A8];
  v124 = v7;
  v121 = v10;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v155 != v128)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * v17);
      objc_msgSend(v18, "objectForKey:", CFSTR("requiresNoHomeButton"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if (!v20 || (AXDeviceHasHomeButton() & 1) == 0)
      {
        objc_msgSend(v18, "objectForKey:", CFSTR("alreadyLocalized"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        objc_msgSend(v18, "objectForKey:", CFSTR("headerLabel"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v139 = v22;
        if (v22)
        {
          v25 = v23;
        }
        else
        {
          v148 = MEMORY[0x1E0C809B0];
          v149 = 3221225472;
          v150 = __50__AXUISettingsInstructionsView__initializeContent__block_invoke;
          v151 = &unk_1E76AB2B8;
          v152 = self;
          v153 = v7;
          AXLocStringForDeviceVariant();
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v26 = v25;
        objc_msgSend(v18, "objectForKey:", CFSTR("contentGetter"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v26;
        if (objc_msgSend(v27, "length"))
        {
          -[PSSpecifier target](self->_specifier, "target");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "safeStringForKey:", v27);
          v140 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = v138;
        }
        else
        {
          v140 = 0;
        }
        objc_msgSend(v18, "objectForKey:", CFSTR("contentLabel"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = v27;
        v134 = v29;
        if (v29)
        {
          if (v139)
          {
            v30 = v29;
            v31 = v140;
          }
          else
          {
            v142 = MEMORY[0x1E0C809B0];
            v143 = 3221225472;
            v144 = __50__AXUISettingsInstructionsView__initializeContent__block_invoke_2;
            v145 = &unk_1E76AB2B8;
            v146 = self;
            v147 = v7;
            AXLocStringForDeviceVariant();
            v30 = (id)objc_claimAutoreleasedReturnValue();

            v31 = v147;
          }

          v140 = v30;
          v27 = v137;
        }
        objc_msgSend(v18, "objectForKey:", CFSTR("moreLabel"));
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = v24;
        v133 = v17;
        if (objc_msgSend(v26, "length"))
        {
          v32 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v12, v13, v15, v16);
          headerLabel = self->_headerLabel;
          self->_headerLabel = v32;

          -[UILabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 0);
          -[UILabel setAdjustsFontForContentSizeCategory:](self->_headerLabel, "setAdjustsFontForContentSizeCategory:", 1);
          -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setBackgroundColor:](self->_headerLabel, "setBackgroundColor:", v34);

          -[UILabel setLineBreakMode:](self->_headerLabel, "setLineBreakMode:", 0);
          LODWORD(v35) = 0.5;
          -[UILabel _setHyphenationFactor:](self->_headerLabel, "_setHyphenationFactor:", v35);
          -[UILabel setText:](self->_headerLabel, "setText:", v26);
          v127 = v11;
          if ((AXProcessIsSetup() & 1) != 0)
          {
            objc_msgSend(getBFFStyleClass(), "sharedStyle");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "applyThemeToLabel:", self->_headerLabel);

          }
          else
          {
            -[UILabel setTextColor:](self->_headerLabel, "setTextColor:", v120);
          }
          objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v122, 2, 0);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", 0.0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](self->_headerLabel, "setFont:", v40);

          -[UILabel sizeToFit](self->_headerLabel, "sizeToFit");
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addSubview:", self->_headerLabel);

          -[UILabel leadingAnchor](self->_headerLabel, "leadingAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "leadingAnchor");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 0.0);
          v45 = objc_claimAutoreleasedReturnValue();

          v129 = (void *)v45;
          -[NSMutableArray addObject:](self->_marginConstraints, "addObject:", v45);
          -[UILabel topAnchor](self->_headerLabel, "topAnchor");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "topAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "constraintEqualToAnchor:constant:", v47, 5.0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v162[0] = v48;
          v162[1] = v45;
          -[UILabel trailingAnchor](self->_headerLabel, "trailingAnchor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "trailingAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:constant:", v51, -15.0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v162[2] = v52;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 3);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "addObjectsFromArray:", v53);

          v37 = self->_headerLabel;
          v54 = v129;
          v7 = v124;
          v10 = v121;
          goto LABEL_36;
        }
        if (objc_msgSend(v140, "length"))
        {
          v37 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v12, v13, v15, v16);
          -[UILabel setNumberOfLines:](v37, "setNumberOfLines:", 0);
          -[UILabel setLineBreakMode:](v37, "setLineBreakMode:", 0);
          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setBackgroundColor:](v37, "setBackgroundColor:", v38);

          -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          if ((AXProcessIsSetup() & 1) != 0)
          {
            objc_msgSend(getBFFStyleClass(), "sharedStyle");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "applyThemeToLabel:", v37);

          }
          else
          {
            -[UILabel setTextColor:](v37, "setTextColor:", v120);
          }
          -[UILabel setText:](v37, "setText:", v140);
          objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v122);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setFont:](v37, "setFont:", v61);

          -[UILabel setAdjustsFontForContentSizeCategory:](v37, "setAdjustsFontForContentSizeCategory:", 1);
          LODWORD(v62) = 0.5;
          -[UILabel _setHyphenationFactor:](v37, "_setHyphenationFactor:", v62);
          -[UILabel sizeToFit](v37, "sizeToFit");
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addSubview:", v37);

          -[NSMutableArray addObject:](self->_contentLabels, "addObject:", v37);
          -[UILabel topAnchor](v37, "topAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[UILabel bottomAnchor](v11, "bottomAnchor");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 0.0);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[AXUISettingsInstructionsView contentView](self, "contentView");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "topAnchor");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, 5.0);
            v135 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v67 = v11;

          -[UILabel leadingAnchor](v37, "leadingAnchor");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "leadingAnchor");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70, 0.0);
          v71 = objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](self->_marginConstraints, "addObject:", v71);
          v161[0] = v135;
          v161[1] = v71;
          -[UILabel trailingAnchor](v37, "trailingAnchor");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "trailingAnchor");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:constant:", v74, -15.0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v161[2] = v75;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 3);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "addObjectsFromArray:", v76);

          v141 = 8226;
          -[UILabel accessibilityLabel](v37, "accessibilityLabel");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v141, 1);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel accessibilityLabel](v37, "accessibilityLabel");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringByReplacingOccurrencesOfString:withString:options:range:", v78, &stru_1E76AC698, 1, 0, objc_msgSend(v79, "length"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setAccessibilityLabel:](v37, "setAccessibilityLabel:", v80);

          v54 = (void *)v71;
          v7 = v124;
          goto LABEL_36;
        }
        if (v136 && (AXProcessIsSetup() & 1) == 0)
        {
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", v12, v13, v15, v16);
          objc_msgSend(*(id *)(v14 + 1208), "appearance");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "footerHyperlinkColor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
          {
            objc_msgSend(*(id *)(v14 + 1208), "appearance");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "footerHyperlinkColor");
            v59 = objc_claimAutoreleasedReturnValue();

            v60 = 0x1E0DC3000;
          }
          else
          {
            v60 = 0x1E0DC3000uLL;
            objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
            v59 = objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(*(id *)(v60 + 1624), "clearColor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setBackgroundColor:", v81);

          objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v55, "setShowsVerticalScrollIndicator:", 0);
          objc_msgSend(v55, "setEditable:", 0);
          objc_msgSend(v55, "setSelectable:", 1);
          objc_msgSend(v55, "setScrollEnabled:", 0);
          objc_msgSend(v55, "textContainer");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setLineFragmentPadding:", 0.0);

          objc_msgSend(v55, "_setInteractiveTextSelectionDisabled:", 1);
          objc_msgSend(v55, "setDelegate:", self);
          objc_msgSend(v18, "objectForKey:", CFSTR("additionalContent"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_accessibilitySetRetainedValue:forKey:", v83, CFSTR("additionalContent"));

          objc_msgSend(v18, "objectForKey:", CFSTR("additionalTitleLabel"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_accessibilitySetRetainedValue:forKey:", v84, CFSTR("additionalTitleLabel"));

          objc_msgSend(v18, "objectForKey:", CFSTR("additionalSubtitleLabel"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_accessibilitySetRetainedValue:forKey:", v85, CFSTR("additionalSubtitleLabel"));

          objc_msgSend(v18, "objectForKey:", CFSTR("symbolName"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_accessibilitySetRetainedValue:forKey:", v86, CFSTR("symbolName"));

          objc_msgSend(v18, "objectForKey:", CFSTR("image"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_accessibilitySetRetainedValue:forKey:", v87, CFSTR("image"));

          objc_msgSend(v18, "objectForKey:", CFSTR("customActionBlock"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_accessibilitySetRetainedValue:forKey:", v88, CFSTR("customActionBlock"));

          objc_msgSend(v55, "_accessibilitySetRetainedValue:forKey:", v124, CFSTR("tableIdentifier"));
          if (v139)
          {
            v89 = v136;
          }
          else
          {
            -[AXUISettingsInstructionsView settingsLocString:table:](self, "settingsLocString:table:", v136, v124);
            v89 = (id)objc_claimAutoreleasedReturnValue();
          }
          v90 = v89;
          v91 = objc_alloc(MEMORY[0x1E0CB3498]);
          v159[0] = v119;
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E76AC698);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v160[0] = v92;
          v160[1] = MEMORY[0x1E0C9AAA0];
          v159[1] = v118;
          v159[2] = v117;
          v135 = (void *)v59;
          -[AXUISettingsInstructionsView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v59);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v160[2] = v93;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v160, v159, 3);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = v90;
          v95 = objc_msgSend(v91, "initWithString:attributes:", v90, v94);

          v126 = (void *)v95;
          objc_msgSend(v55, "setAttributedText:", v95);
          objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v122);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setFont:", v96);

          objc_msgSend(v55, "setAdjustsFontForContentSizeCategory:", 1);
          objc_msgSend(v55, "sizeToFit");
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "addSubview:", v55);

          objc_msgSend(v55, "topAnchor");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[UILabel bottomAnchor](v11, "bottomAnchor");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "constraintEqualToAnchor:constant:", v99, 0.0);
            v100 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[AXUISettingsInstructionsView contentView](self, "contentView");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "topAnchor");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "constraintEqualToAnchor:constant:", v101, 5.0);
            v100 = objc_claimAutoreleasedReturnValue();

          }
          v102 = v11;

          objc_msgSend(v55, "leadingAnchor");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "leadingAnchor");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "constraintEqualToAnchor:constant:", v105, 0.0);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](self->_marginConstraints, "addObject:", v106);
          v158[0] = v100;
          v158[1] = v106;
          objc_msgSend(v55, "trailingAnchor");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXUISettingsInstructionsView contentView](self, "contentView");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "trailingAnchor");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "constraintLessThanOrEqualToAnchor:constant:", v109, -15.0);
          v110 = (void *)v100;
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v158[2] = v111;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 3);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "addObjectsFromArray:", v112);

          v37 = v55;
          -[NSMutableArray addObject:](self->_moreLabels, "addObject:", v37);

          v10 = v121;
          v7 = v124;
          v54 = v130;
LABEL_36:

          v11 = v37;
          v14 = 0x1E0D80000;
          v24 = v132;
          v17 = v133;
          v27 = v137;
          v26 = v138;
        }

        if ((v139 & 1) == 0)
      }
      ++v17;
    }
    while (v131 != v17);
    v113 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v154, v163, 16);
    v131 = v113;
  }
  while (v113);

  if (v11)
  {
    -[UILabel bottomAnchor](v11, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsInstructionsView contentView](self, "contentView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "bottomAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:constant:", v115, -5.0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "addObject:", v116);

    goto LABEL_53;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v123);

}

uint64_t __50__AXUISettingsInstructionsView__initializeContent__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsLocString:table:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __50__AXUISettingsInstructionsView__initializeContent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsLocString:table:", a2, *(_QWORD *)(a1 + 40));
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  unsigned int (*v20)(void);
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  void *v45;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  AXUISettingsInstructionsView *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void *v54;
  AXUISettingsInstructionsView *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void *v60;
  AXUISettingsInstructionsView *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void *v66;
  AXUISettingsInstructionsView *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  v35 = a5;
  v42 = v7;
  objc_msgSend(v7, "_accessibilityValueForKey:", CFSTR("additionalContent"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityValueForKey:", CFSTR("tableIdentifier"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityValueForKey:", CFSTR("additionalTitleLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityValueForKey:", CFSTR("additionalSubtitleLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityValueForKey:", CFSTR("image"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityValueForKey:", CFSTR("symbolName"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityValueForKey:", CFSTR("customActionBlock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v8;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0DC3428];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke;
    v73[3] = &unk_1E76AB2E0;
    v74 = v8;
    objc_msgSend(v9, "actionWithHandler:", v73);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v74;
    goto LABEL_39;
  }
  if (v39)
  {
    -[AXUISettingsInstructionsView settingsLocString:table:](self, "settingsLocString:table:", v39, v43);
    v33 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  if (v40)
  {
    v12 = objc_alloc(MEMORY[0x1E0D651A8]);
    -[AXUISettingsInstructionsView settingsLocString:table:](self, "settingsLocString:table:", v38, v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithTitle:detailText:symbolName:", v13, v33, v40);
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0D651A8]);
    -[AXUISettingsInstructionsView settingsLocString:table:](self, "settingsLocString:table:", v38, v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v14 = objc_msgSend(v15, "initWithTitle:detailText:icon:", v13, v33, v36);
    }
    else
    {
      v16 = (void *)objc_msgSend(v15, "initWithTitle:", v13);

      if (!v33)
      {
LABEL_41:
        v45 = v16;
        goto LABEL_13;
      }
      objc_msgSend(v16, "headerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDetailText:", v33);
      v14 = (uint64_t)v16;
    }
  }
  v45 = (void *)v14;

LABEL_13:
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v37;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  if (v17)
  {
    v47 = *(_QWORD *)v70;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v70 != v47)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("identifier"), v33, v34);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "isEqualToString:", CFSTR("REACHABILITY")))
          goto LABEL_24;
        if (MGGetBoolAnswer())
        {
          v76 = 0;
          v77 = &v76;
          v78 = 0x2020000000;
          v20 = (unsigned int (*)(void))getSBSIsReachabilityEnabledSymbolLoc_ptr;
          v79 = getSBSIsReachabilityEnabledSymbolLoc_ptr;
          if (!getSBSIsReachabilityEnabledSymbolLoc_ptr)
          {
            v75[0] = MEMORY[0x1E0C809B0];
            v75[1] = 3221225472;
            v75[2] = __getSBSIsReachabilityEnabledSymbolLoc_block_invoke;
            v75[3] = &unk_1E76AB358;
            v75[4] = &v76;
            __getSBSIsReachabilityEnabledSymbolLoc_block_invoke((uint64_t)v75);
            v20 = (unsigned int (*)(void))v77[3];
          }
          _Block_object_dispose(&v76, 8);
          if (!v20)
          {
            -[AXUISettingsInstructionsView textView:primaryActionForTextItem:defaultAction:].cold.1();
            __break(1u);
            goto LABEL_41;
          }
          if (v20())
          {
LABEL_24:
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("alreadyLocalized"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "BOOLValue");

            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("contentLabel"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("headerLabel"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("sectionLabel"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v26 = v23;
              v27 = v24;
              v28 = v25;
            }
            else
            {
              v63 = MEMORY[0x1E0C809B0];
              v64 = 3221225472;
              v65 = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_2;
              v66 = &unk_1E76AB2B8;
              v67 = self;
              v68 = v43;
              AXLocStringForDeviceVariant();
              v26 = (id)objc_claimAutoreleasedReturnValue();
              v57 = MEMORY[0x1E0C809B0];
              v58 = 3221225472;
              v59 = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_3;
              v60 = &unk_1E76AB2B8;
              v61 = self;
              v62 = v68;
              AXLocStringForDeviceVariant();
              v27 = (id)objc_claimAutoreleasedReturnValue();
              v51 = MEMORY[0x1E0C809B0];
              v52 = 3221225472;
              v53 = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_4;
              v54 = &unk_1E76AB2B8;
              v55 = self;
              v56 = v62;
              AXLocStringForDeviceVariant();
              v28 = (id)objc_claimAutoreleasedReturnValue();
            }
            v29 = v28;
            if (objc_msgSend(v28, "length"))
              objc_msgSend(v45, "addSectionWithHeader:content:", v29, &stru_1E76AC698);
            if (objc_msgSend(v26, "length") || objc_msgSend(v27, "length"))
              objc_msgSend(v45, "addBulletedListItemWithTitle:description:", v27, v26);

            if (v22)
            {

            }
            else
            {

            }
          }
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      if (v17)
        continue;
      break;
    }
  }

  objc_msgSend(v45, "addSectionWithHeader:content:", CFSTR(" "), CFSTR(" "));
  -[AXUISettingsInstructionsView setMoreInfoController:](self, "setMoreInfoController:", v45);
  v30 = (void *)MEMORY[0x1E0DC3428];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_5;
  v48[3] = &unk_1E76AB308;
  v49 = v45;
  v50 = self;
  v31 = v45;
  objc_msgSend(v30, "actionWithHandler:", v48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)v33;
LABEL_39:

  return v10;
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsLocString:table:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsLocString:table:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsLocString:table:", a2, *(_QWORD *)(a1 + 40));
}

void __80__AXUISettingsInstructionsView_textView_primaryActionForTextItem_defaultAction___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D65180]), "initWithRootViewController:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, *(_QWORD *)(a1 + 40), sel_doneButtonTapped_);
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v2);

  objc_msgSend(*(id *)(a1 + 40), "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)doneButtonTapped:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AXUISettingsInstructionsView moreInfoController](self, "moreInfoController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AXUISettingsInstructionsView_doneButtonTapped___block_invoke;
  v5[3] = &unk_1E76AB330;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

uint64_t __49__AXUISettingsInstructionsView_doneButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMoreInfoController:", 0);
}

- (void)setNeedsLayout
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AXUISettingsInstructionsView;
  -[AXUISettingsInstructionsView setNeedsLayout](&v12, sel_setNeedsLayout);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_marginConstraints;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setConstant:", 15.0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (double)preferredHeightForWidth:(double)a3
{
  double v4;
  double v5;
  double v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3 + -15.0;
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", a3 + -15.0, 3.40282347e38);
  v6 = v5 + 5.0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_contentLabels;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "sizeThatFits:", v4, 3.40282347e38);
        v6 = v6 + v12;
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_moreLabels;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "sizeThatFits:", v4, 3.40282347e38, (_QWORD)v20);
        v6 = v6 + v18;
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  return v6 + 5.0;
}

- (OBWelcomeController)moreInfoController
{
  return self->_moreInfoController;
}

- (void)setMoreInfoController:(id)a3
{
  objc_storeStrong((id *)&self->_moreInfoController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreInfoController, 0);
  objc_storeStrong((id *)&self->_marginConstraints, 0);
  objc_storeStrong((id *)&self->_moreLabels, 0);
  objc_storeStrong((id *)&self->_contentLabels, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (OS_os_log)textView:primaryActionForTextItem:defaultAction:.cold.1()
{
  dlerror();
  abort_report_np();
  return __getBFFStyleClass_block_invoke_cold_1();
}

@end
