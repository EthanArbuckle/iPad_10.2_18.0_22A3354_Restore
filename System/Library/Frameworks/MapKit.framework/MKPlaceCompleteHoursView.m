@implementation MKPlaceCompleteHoursView

- (MKPlaceCompleteHoursView)initWithLinkedService:(id)a3 showTodaysHoursOnly:(BOOL)a4
{
  id v7;
  MKPlaceCompleteHoursView *v8;
  MKPlaceCompleteHoursView *v9;
  void *v10;
  uint64_t v11;
  NSArray *sortedBusinessHours;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MKPlaceServiceHoursView *v18;
  uint64_t v19;
  NSArray *placeHoursViews;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MKPlaceCompleteHoursView;
  v8 = -[MKPlaceCompleteHoursView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    v22 = v7;
    objc_storeStrong((id *)&v8->_linkedService, a3);
    v10 = (void *)objc_opt_new();
    -[GEOLinkedService businessHours](v9->_linkedService, "businessHours");
    v11 = objc_claimAutoreleasedReturnValue();
    sortedBusinessHours = v9->_sortedBusinessHours;
    v9->_sortedBusinessHours = (NSArray *)v11;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v9->_sortedBusinessHours;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = -[MKPlaceHoursView initWithBusinessHours:]([MKPlaceServiceHoursView alloc], "initWithBusinessHours:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17));
        -[MKPlaceHoursView setHoursDelegate:](v18, "setHoursDelegate:", v9);
        objc_msgSend(v10, "addObject:", v18);

        if (a4)
          break;
        if (v15 == ++v17)
        {
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v15)
            goto LABEL_4;
          break;
        }
      }
    }

    +[MKPlaceHoursViewHelper determineExtraRulesForPlaceHoursViews:withBusinessHours:](MKPlaceHoursViewHelper, "determineExtraRulesForPlaceHoursViews:withBusinessHours:", v10, v9->_sortedBusinessHours);
    v19 = objc_msgSend(v10, "copy");
    placeHoursViews = v9->_placeHoursViews;
    v9->_placeHoursViews = (NSArray *)v19;

    -[MKPlaceCompleteHoursView commonInit](v9, "commonInit");
    v7 = v22;
  }

  return v9;
}

- (void)commonInit
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *containerViewForHoursAndCategoryName;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _MKUILabel *v16;
  _MKUILabel *localizedCategoryNameLabel;
  _MKUILabel *v18;
  void *v19;
  void *v20;
  _MKUILabel *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIImageView *v31;
  UIImageView *categoryIconView;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[MKPlaceCompleteHoursView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  containerViewForHoursAndCategoryName = self->_containerViewForHoursAndCategoryName;
  self->_containerViewForHoursAndCategoryName = v8;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerViewForHoursAndCategoryName, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKPlaceCompleteHoursView addSubview:](self, "addSubview:", self->_containerViewForHoursAndCategoryName);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = self->_placeHoursViews;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (_QWORD)v34);
        -[UIView addSubview:](self->_containerViewForHoursAndCategoryName, "addSubview:", v15);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }

  v16 = -[_MKUILabel initWithFrame:]([_MKUILabel alloc], "initWithFrame:", v4, v5, v6, v7);
  localizedCategoryNameLabel = self->_localizedCategoryNameLabel;
  self->_localizedCategoryNameLabel = v16;

  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_localizedCategoryNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel set_mapkit_themeColorProvider:](self->_localizedCategoryNameLabel, "set_mapkit_themeColorProvider:", &__block_literal_global_109);
  v18 = self->_localizedCategoryNameLabel;
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "boldBodyFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](v18, "setFont:", v20);

  v21 = self->_localizedCategoryNameLabel;
  -[GEOLinkedService localizedCategoryName](self->_linkedService, "localizedCategoryName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setText:](v21, "setText:", v22);

  -[_MKUILabel setNumberOfLines:](self->_localizedCategoryNameLabel, "setNumberOfLines:", 1);
  -[UIView addSubview:](self->_containerViewForHoursAndCategoryName, "addSubview:", self->_localizedCategoryNameLabel);
  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "screenScale");
  v25 = v24;

  -[GEOLinkedService styleAttributes](self->_linkedService, "styleAttributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompleteHoursView traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKIconManager imageForStyle:size:forScale:format:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:nightMode:", v26, 3, 0, objc_msgSend(v27, "userInterfaceStyle") == 2, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0D270A8], "genericServiceStyleAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCompleteHoursView traitCollection](self, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKIconManager imageForStyle:size:forScale:format:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:nightMode:", v29, 3, 0, objc_msgSend(v30, "userInterfaceStyle") == 2, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v31 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v28);
  categoryIconView = self->_categoryIconView;
  self->_categoryIconView = v31;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_categoryIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKPlaceCompleteHoursView addSubview:](self, "addSubview:", self->_categoryIconView);
  -[MKPlaceCompleteHoursView _setUpConstraints](self, "_setUpConstraints");
  -[MKPlaceCompleteHoursView setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

}

uint64_t __38__MKPlaceCompleteHoursView_commonInit__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

- (void)_contentSizeDidChange
{
  void *v3;
  id v4;

  if (-[NSArray count](self->_placeHoursViews, "count"))
  {
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boldBodyFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_mapkit_scaledValueForValue:", 22.0);
    -[NSLayoutConstraint setConstant:](self->_hoursTopLabelBaselineToCategoryName, "setConstant:");

  }
}

- (void)_setUpConstraints
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
  _MKUILabel *v43;
  uint64_t v44;
  _MKUILabel *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSLayoutConstraint *v54;
  NSLayoutConstraint *hoursTopLabelBaselineToCategoryName;
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
  uint64_t v70;
  void *v71;
  NSArray *obj;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[UIImageView heightAnchor](self->_categoryIconView, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToConstant:", 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[UIImageView widthAnchor](self->_categoryIconView, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[UIImageView topAnchor](self->_categoryIconView, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompleteHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[UIImageView bottomAnchor](self->_categoryIconView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompleteHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[UIImageView leadingAnchor](self->_categoryIconView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompleteHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  -[MKPlaceCompleteHoursView heightAnchor](self, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](self->_categoryIconView, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v23 = 432;
  -[UIView leadingAnchor](self->_containerViewForHoursAndCategoryName, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_categoryIconView, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  -[UIView topAnchor](self->_containerViewForHoursAndCategoryName, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView topAnchor](self->_categoryIconView, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  -[UIView trailingAnchor](self->_containerViewForHoursAndCategoryName, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompleteHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  -[UIView bottomAnchor](self->_containerViewForHoursAndCategoryName, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompleteHoursView bottomAnchor](self, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  -[_MKUILabel topAnchor](self->_localizedCategoryNameLabel, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_containerViewForHoursAndCategoryName, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v39);

  -[_MKUILabel trailingAnchor](self->_localizedCategoryNameLabel, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_containerViewForHoursAndCategoryName, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v42);

  v43 = self->_localizedCategoryNameLabel;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = self->_placeHoursViews;
  v75 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v75)
  {
    v74 = *(_QWORD *)v77;
    v70 = 432;
    v71 = v3;
    do
    {
      v44 = 0;
      v45 = v43;
      do
      {
        if (*(_QWORD *)v77 != v74)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v44);
        if (v45 == self->_localizedCategoryNameLabel)
        {
          objc_msgSend(v46, "topLabel");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "firstBaselineAnchor");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKUILabel lastBaselineAnchor](self->_localizedCategoryNameLabel, "lastBaselineAnchor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKFontManager sharedManager](MKFontManager, "sharedManager");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "boldBodyFont");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "_mapkit_scaledValueForValue:", 22.0);
          objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51);
          v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
          hoursTopLabelBaselineToCategoryName = self->_hoursTopLabelBaselineToCategoryName;
          self->_hoursTopLabelBaselineToCategoryName = v54;

          v23 = v70;
          v3 = v71;

          objc_msgSend(v71, "addObject:", self->_hoursTopLabelBaselineToCategoryName);
        }
        else
        {
          objc_msgSend(v46, "topAnchor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKUILabel bottomAnchor](v45, "bottomAnchor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "constraintEqualToAnchor:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v49);

        }
        objc_msgSend(v46, "leadingAnchor", v70);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v23), "leadingAnchor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToAnchor:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v58);

        objc_msgSend(v46, "trailingAnchor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v23), "trailingAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "constraintEqualToAnchor:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v61);

        v43 = v46;
        ++v44;
        v45 = v43;
      }
      while (v75 != v44);
      v75 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v75);
  }

  -[_MKUILabel bottomAnchor](v43, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v23), "layoutMarginsGuide");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v65);

  -[_MKUILabel leadingAnchor](self->_localizedCategoryNameLabel, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v23), "layoutMarginsGuide");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v69);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (void)hoursViewDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *hoursTopLabelBaselineToCategoryName;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hoursTopLabelBaselineToCategoryName)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    v18[0] = self->_hoursTopLabelBaselineToCategoryName;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v6);

  }
  -[NSArray firstObject](self->_placeHoursViews, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v4)
  {
    objc_msgSend(v4, "topLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstBaselineAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel lastBaselineAnchor](self->_localizedCategoryNameLabel, "lastBaselineAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boldBodyFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_mapkit_scaledValueForValue:", 22.0);
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    hoursTopLabelBaselineToCategoryName = self->_hoursTopLabelBaselineToCategoryName;
    self->_hoursTopLabelBaselineToCategoryName = v13;

    v15 = (void *)MEMORY[0x1E0CB3718];
    v17 = self->_hoursTopLabelBaselineToCategoryName;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

  }
  -[MKPlaceCompleteHoursView _contentSizeDidChange](self, "_contentSizeDidChange");

}

- (NSArray)placeHoursViews
{
  return self->_placeHoursViews;
}

- (void)setPlaceHoursViews:(id)a3
{
  objc_storeStrong((id *)&self->_placeHoursViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHoursViews, 0);
  objc_storeStrong((id *)&self->_hoursTopLabelBaselineToCategoryName, 0);
  objc_storeStrong((id *)&self->_localizedCategoryNameLabel, 0);
  objc_storeStrong((id *)&self->_categoryIconView, 0);
  objc_storeStrong((id *)&self->_containerViewForHoursAndCategoryName, 0);
  objc_storeStrong((id *)&self->_sortedBusinessHours, 0);
  objc_storeStrong((id *)&self->_linkedService, 0);
}

@end
