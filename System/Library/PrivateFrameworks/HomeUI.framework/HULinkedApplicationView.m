@implementation HULinkedApplicationView

- (HULinkedApplicationView)initWithFrame:(CGRect)a3
{
  HULinkedApplicationView *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
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
  HULinkedApplicationRatingView *v30;
  HULinkedApplicationRatingView *v31;
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
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)HULinkedApplicationView;
  v3 = -[HULinkedApplicationView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[HULinkedApplicationView setIconView:](v3, "setIconView:", v4);

    -[HULinkedApplicationView iconView](v3, "iconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULinkedApplicationView iconView](v3, "iconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v7);

    -[HULinkedApplicationView iconView](v3, "iconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1148846080;
    objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v9);

    -[HULinkedApplicationView iconView](v3, "iconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView addSubview:](v3, "addSubview:", v10);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView setViewButton:](v3, "setViewButton:", v11);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 18.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView viewButton](v3, "viewButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v12);

    -[HULinkedApplicationView viewButton](v3, "viewButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HULinkedApplicationViewButtonTitle"), CFSTR("HULinkedApplicationViewButtonTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v16, 0);

    -[HULinkedApplicationView viewButton](v3, "viewButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", v3, sel__viewButtonTapped_, 64);

    -[HULinkedApplicationView viewButton](v3, "viewButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULinkedApplicationView viewButton](v3, "viewButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView addSubview:](v3, "addSubview:", v19);

    v20 = (void *)objc_opt_new();
    -[HULinkedApplicationView setNameLabel:](v3, "setNameLabel:", v20);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 12.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView nameLabel](v3, "nameLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v21);

    -[HULinkedApplicationView nameLabel](v3, "nameLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULinkedApplicationView nameLabel](v3, "nameLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView addSubview:](v3, "addSubview:", v24);

    v25 = (void *)objc_opt_new();
    -[HULinkedApplicationView setPublisherLabel:](v3, "setPublisherLabel:", v25);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView publisherLabel](v3, "publisherLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFont:", v26);

    -[HULinkedApplicationView publisherLabel](v3, "publisherLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULinkedApplicationView publisherLabel](v3, "publisherLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView addSubview:](v3, "addSubview:", v29);

    v30 = [HULinkedApplicationRatingView alloc];
    v31 = -[HULinkedApplicationRatingView initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HULinkedApplicationView setRatingView:](v3, "setRatingView:", v31);

    -[HULinkedApplicationView ratingView](v3, "ratingView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULinkedApplicationView ratingView](v3, "ratingView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView addSubview:](v3, "addSubview:", v33);

    v34 = (void *)objc_opt_new();
    -[HULinkedApplicationView setPriceLabel:](v3, "setPriceLabel:", v34);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView priceLabel](v3, "priceLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFont:", v35);

    -[HULinkedApplicationView priceLabel](v3, "priceLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULinkedApplicationView priceLabel](v3, "priceLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView addSubview:](v3, "addSubview:", v38);

    v39 = (void *)objc_opt_new();
    -[HULinkedApplicationView setInstalledLabel:](v3, "setInstalledLabel:", v39);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView installedLabel](v3, "installedLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFont:", v40);

    _HULocalizedStringWithDefaultValue(CFSTR("HULinkedApplicationInstalled"), CFSTR("HULinkedApplicationInstalled"), 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView installedLabel](v3, "installedLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v42);

    -[HULinkedApplicationView installedLabel](v3, "installedLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HULinkedApplicationView installedLabel](v3, "installedLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView addSubview:](v3, "addSubview:", v45);

    -[HULinkedApplicationView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
  }
  return v3;
}

- (void)updateConstraints
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
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HULinkedApplicationView *v32;
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
  void *v87;
  void *v88;
  id obj;
  void *v90;
  objc_super v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[HULinkedApplicationView iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[HULinkedApplicationView iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 60.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[HULinkedApplicationView iconView](self, "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView leadingAnchor](self, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 15.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  -[HULinkedApplicationView iconView](self, "iconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView centerYAnchor](self, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v3;
  objc_msgSend(v3, "addObject:", v17);

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[HULinkedApplicationView nameLabel](self, "nameLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v18;
  -[HULinkedApplicationView publisherLabel](self, "publisherLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v19;
  -[HULinkedApplicationView priceLabel](self, "priceLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v20;
  -[HULinkedApplicationView installedLabel](self, "installedLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v96[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v22;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v93 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        LODWORD(v24) = 1132003328;
        objc_msgSend(v28, "setContentHuggingPriority:forAxis:", 0, v24);
        objc_msgSend(v28, "leadingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[HULinkedApplicationView iconView](self, "iconView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "trailingAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 15.0);
        v32 = self;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "addObject:", v33);

        self = v32;
        objc_msgSend(v28, "trailingAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HULinkedApplicationView viewButton](v32, "viewButton");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "leadingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -15.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "addObject:", v37);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
    }
    while (v25);
  }

  -[HULinkedApplicationView viewButton](self, "viewButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView trailingAnchor](self, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -15.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObject:", v41);

  -[HULinkedApplicationView viewButton](self, "viewButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView centerYAnchor](self, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObject:", v45);

  -[HULinkedApplicationView ratingView](self, "ratingView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView iconView](self, "iconView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, 15.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObject:", v50);

  -[HULinkedApplicationView bottomAnchor](self, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView nameLabel](self, "nameLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "firstBaselineAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView topAnchor](self, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 35.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObject:", v55);

  -[HULinkedApplicationView publisherLabel](self, "publisherLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "firstBaselineAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView nameLabel](self, "nameLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstBaselineAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v59, 15.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObject:", v60);

  LODWORD(v57) = -[HULinkedApplicationView isInstalled](self, "isInstalled");
  -[HULinkedApplicationView priceLabel](self, "priceLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if ((_DWORD)v57)
  {
    objc_msgSend(v61, "setHidden:", 1);

    -[HULinkedApplicationView ratingView](self, "ratingView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setHidden:", 1);

    -[HULinkedApplicationView installedLabel](self, "installedLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setHidden:", 0);

    -[HULinkedApplicationView installedLabel](self, "installedLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "firstBaselineAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView publisherLabel](self, "publisherLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "firstBaselineAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68, 15.0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObject:", v69);

    -[HULinkedApplicationView installedLabel](self, "installedLabel");
  }
  else
  {
    objc_msgSend(v61, "setHidden:", 0);

    -[HULinkedApplicationView ratingView](self, "ratingView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setHidden:", 0);

    -[HULinkedApplicationView installedLabel](self, "installedLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setHidden:", 1);

    -[HULinkedApplicationView ratingView](self, "ratingView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView publisherLabel](self, "publisherLabel");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObject:", v76);

    -[HULinkedApplicationView priceLabel](self, "priceLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationView ratingView](self, "ratingView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "bottomAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObject:", v81);

    -[HULinkedApplicationView priceLabel](self, "priceLabel");
  }
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "firstBaselineAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:constant:", v51, -25.0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "addObject:", v84);

  v85 = (void *)MEMORY[0x1E0CB3718];
  -[HULinkedApplicationView currentConstraints](self, "currentConstraints");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "deactivateConstraints:", v86);

  -[HULinkedApplicationView setCurrentConstraints:](self, "setCurrentConstraints:", v90);
  v87 = (void *)MEMORY[0x1E0CB3718];
  -[HULinkedApplicationView currentConstraints](self, "currentConstraints");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "activateConstraints:", v88);

  v91.receiver = self;
  v91.super_class = (Class)HULinkedApplicationView;
  -[HULinkedApplicationView updateConstraints](&v91, sel_updateConstraints);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[HULinkedApplicationView item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C70]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HFResultApplicationPublisher"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HFResultApplicationAverageRating"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HFResultApplicationPrice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HFResultApplicationIsInstalled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  -[HULinkedApplicationView iconView](self, "iconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:", v5);

  -[HULinkedApplicationView nameLabel](self, "nameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v6);

  -[HULinkedApplicationView publisherLabel](self, "publisherLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v7);

  -[HULinkedApplicationView ratingView](self, "ratingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRating:", v10);

  -[HULinkedApplicationView priceLabel](self, "priceLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v11);

  v19 = CFSTR("HULinkedApplicationViewButtonTitle");
  if ((_DWORD)v13)
    v19 = CFSTR("HULinkedApplicationOpenButtonTitle");
  v20 = v19;
  -[HULinkedApplicationView viewButton](self, "viewButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v20, v20, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setTitle:forState:", v22, 0);
  -[HULinkedApplicationView viewButton](self, "viewButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeToFit");

  -[HULinkedApplicationView setIsInstalled:](self, "setIsInstalled:", v13);
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HFResultApplicationBundleIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView setBundleID:](self, "setBundleID:", v24);

  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HFResultApplicationStoreURL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView setStoreURL:](self, "setStoreURL:", v25);

  -[HULinkedApplicationView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_viewButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = objc_alloc(MEMORY[0x1E0D31178]);
  -[HULinkedApplicationView nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULinkedApplicationView storeURL](self, "storeURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "initWithName:bundleID:payloadURL:storeURL:", v6, v7, 0, v8);

  v9 = (id)objc_msgSend(MEMORY[0x1E0D31178], "handleRequest:", v10);
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)publisherLabel
{
  return self->_publisherLabel;
}

- (void)setPublisherLabel:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLabel, a3);
}

- (HULinkedApplicationRatingView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_ratingView, a3);
}

- (UILabel)priceLabel
{
  return self->_priceLabel;
}

- (void)setPriceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_priceLabel, a3);
}

- (UILabel)installedLabel
{
  return self->_installedLabel;
}

- (void)setInstalledLabel:(id)a3
{
  objc_storeStrong((id *)&self->_installedLabel, a3);
}

- (UIButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
  objc_storeStrong((id *)&self->_viewButton, a3);
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (void)setIsInstalled:(BOOL)a3
{
  self->_isInstalled = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_storeURL, a3);
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
  objc_storeStrong((id *)&self->_installedLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_publisherLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
