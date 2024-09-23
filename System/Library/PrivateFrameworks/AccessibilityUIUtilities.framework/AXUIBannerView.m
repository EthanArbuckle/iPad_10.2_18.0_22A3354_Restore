@implementation AXUIBannerView

- (AXUIBannerView)initWithFrame:(CGRect)a3
{
  AXUIBannerView *v3;
  AXUIBannerView *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
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
  uint64_t v78;
  NSArray *withSecondaryTextConstraints;
  void *v80;
  void *v81;
  AXUIBannerView *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
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
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  objc_super v110;
  _QWORD v111[2];
  _QWORD v112[5];
  _BYTE v113[128];
  _QWORD v114[5];

  v114[3] = *MEMORY[0x1E0C80C00];
  v110.receiver = self;
  v110.super_class = (Class)AXUIBannerView;
  v3 = -[AXUIPlatterContainerView initWithFrame:](&v110, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0DC37E8];
    -[AXUIPlatterContainerView primaryTextStyle](v3, "primaryTextStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFontForTextStyle:", v6);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0DC3F58]);
    v8 = (void *)MEMORY[0x1E0DC3F08];
    -[AXUIPlatterContainerView platterBlurEffect](v4, "platterBlurEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectForBlurEffect:style:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithEffect:", v10);

    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_alloc(MEMORY[0x1E0DC3F58]);
    v13 = (void *)MEMORY[0x1E0DC3F08];
    -[AXUIPlatterContainerView platterBlurEffect](v4, "platterBlurEffect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "effectForBlurEffect:style:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "initWithEffect:", v15);

    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AXUIPlatterContainerView contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v11);

    -[AXUIPlatterContainerView contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v16);

    objc_msgSend(v11, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v21, "setFont:", v105);
    objc_msgSend(v21, "setNumberOfLines:", 0);
    objc_msgSend(v21, "setTextAlignment:", 1);
    objc_msgSend(v19, "addSubview:", v21);
    objc_storeStrong((id *)&v4->_textLabel, v21);
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v23);

    objc_msgSend(v22, "setNumberOfLines:", 0);
    objc_msgSend(v22, "setTextAlignment:", 1);
    v104 = v20;
    objc_msgSend(v20, "addSubview:", v22);
    objc_msgSend(v22, "setHidden:", 1);
    objc_storeStrong((id *)&v4->_secondaryTextLabel, v22);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB3718];
    -[AXUIPlatterContainerView contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v11;
    objc_msgSend(v25, "ax_constraintsToMakeView:sameDimensionsAsView:", v11, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObjectsFromArray:", v27);

    v28 = (void *)MEMORY[0x1E0CB3718];
    -[AXUIPlatterContainerView contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v16;
    objc_msgSend(v28, "ax_constraintsToMakeView:sameDimensionsAsView:", v16, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v24;
    objc_msgSend(v24, "addObjectsFromArray:", v30);

    v32 = (void *)MEMORY[0x1E0DC37F8];
    -[AXUIPlatterContainerView primaryTextStyle](v4, "primaryTextStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "metricsForTextStyle:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIBannerView defaultTitleToSubtitleVerticalSpacing](v4, "defaultTitleToSubtitleVerticalSpacing");
    objc_msgSend(v34, "scaledValueForValue:");
    v36 = v35;
    objc_msgSend(v22, "font");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "capHeight");
    v39 = v36 + v38;

    v40 = (void *)MEMORY[0x1E0DC37F8];
    -[AXUIPlatterContainerView primaryTextStyle](v4, "primaryTextStyle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "metricsForTextStyle:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIBannerView defaultPlatterToTextVerticalSpacing](v4, "defaultPlatterToTextVerticalSpacing");
    objc_msgSend(v42, "scaledValueForValue:");
    v44 = v43;

    objc_msgSend(v105, "capHeight");
    v46 = v44 + v45;
    -[AXUIBannerView platterToTextHorizontalSpacing](v4, "platterToTextHorizontalSpacing");
    v48 = v47;
    objc_msgSend(v21, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, v48);
    v51 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, v48);
    v54 = objc_claimAutoreleasedReturnValue();

    v100 = v19;
    objc_msgSend(v19, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v21;
    objc_msgSend(v21, "lastBaselineAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, v44);
    v58 = objc_claimAutoreleasedReturnValue();

    v98 = (void *)v54;
    v99 = (void *)v51;
    v114[0] = v51;
    v114[1] = v54;
    v97 = (void *)v58;
    v114[2] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "text");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "length");

    if (v61)
    {
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v62 = v59;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      if (v63)
      {
        v65 = v63;
        v66 = *(_QWORD *)v107;
        do
        {
          v67 = 0;
          do
          {
            if (*(_QWORD *)v107 != v66)
              objc_enumerationMutation(v62);
            LODWORD(v64) = 1144733696;
            objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v67++), "setPriority:", v64);
          }
          while (v65 != v67);
          v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
        }
        while (v65);
      }

    }
    v96 = v31;
    objc_msgSend(v31, "addObjectsFromArray:", v59);
    objc_msgSend(v22, "firstBaselineAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v56;
    objc_msgSend(v56, "lastBaselineAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, v39);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:constant:", v71, v48);
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v104, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:constant:", v73, v48);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v104, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastBaselineAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, v44);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "centerXAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "centerXAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v77);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v112[0] = v95;
    v112[1] = v94;
    v112[2] = v93;
    v112[3] = v91;
    v112[4] = v90;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 5);
    v78 = objc_claimAutoreleasedReturnValue();
    withSecondaryTextConstraints = v4->_withSecondaryTextConstraints;
    v4->_withSecondaryTextConstraints = (NSArray *)v78;

    objc_msgSend(v56, "firstBaselineAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "topAnchor");
    v89 = v59;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v81, v46);
    v92 = v22;
    v82 = v4;
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = v83;
    objc_msgSend(v56, "centerXAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "centerXAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v111[1] = v86;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "addObjectsFromArray:", v87);

    v4 = v82;
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v96);

  }
  return v4;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXUIBannerView textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[AXUIBannerView textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AXUIBannerView secondaryTextLabel](self, "secondaryTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[AXUIBannerView _updateSecondaryTextVisibility](self, "_updateSecondaryTextVisibility");
}

- (void)_updateSecondaryTextVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[AXUIBannerView secondaryTextLabel](self, "secondaryTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[AXUIBannerView secondaryTextLabel](self, "secondaryTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden");

  if (v5)
  {
    if (v7)
    {
      -[AXUIBannerView secondaryTextLabel](self, "secondaryTextLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 0);

      v9 = (void *)MEMORY[0x1E0CB3718];
      -[AXUIBannerView withSecondaryTextConstraints](self, "withSecondaryTextConstraints");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activateConstraints:");
LABEL_7:

    }
  }
  else if ((v7 & 1) == 0)
  {
    -[AXUIBannerView secondaryTextLabel](self, "secondaryTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[AXUIBannerView withSecondaryTextConstraints](self, "withSecondaryTextConstraints");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deactivateConstraints:");
    goto LABEL_7;
  }
}

- (double)platterWidth
{
  return 0.0;
}

- (double)defaultPlatterToTextVerticalSpacing
{
  return 27.0;
}

- (double)platterToTextHorizontalSpacing
{
  return 40.0;
}

- (double)defaultTitleToSubtitleVerticalSpacing
{
  return 18.0;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UILabel)secondaryTextLabel
{
  return self->_secondaryTextLabel;
}

- (void)setSecondaryTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextLabel, a3);
}

- (NSArray)withSecondaryTextConstraints
{
  return self->_withSecondaryTextConstraints;
}

- (void)setWithSecondaryTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_withSecondaryTextConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_withSecondaryTextConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
}

@end
