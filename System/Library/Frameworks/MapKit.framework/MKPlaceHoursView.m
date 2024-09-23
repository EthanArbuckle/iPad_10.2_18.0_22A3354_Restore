@implementation MKPlaceHoursView

- (MKPlaceHoursView)initWithBusinessHours:(id)a3
{
  id v5;
  MKPlaceHoursView *v6;
  MKPlaceHoursView *v7;
  uint64_t v8;
  NSArray *placeDailyHours;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceHoursView;
  v6 = -[MKPlaceHoursView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_businessHours, a3);
    -[GEOBusinessHours placeDailyHours](v7->_businessHours, "placeDailyHours");
    v8 = objc_claimAutoreleasedReturnValue();
    placeDailyHours = v7->_placeDailyHours;
    v7->_placeDailyHours = (NSArray *)v8;

    -[MKPlaceHoursView _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (void)_commonInit
{
  void *v3;
  _MKUILabel *v4;
  _MKUILabel *topMessageLabel;
  _MKUILabel *v6;
  void *v7;
  _MKUILabel *v8;
  _MKUILabel *bottomMessageLabel;
  _MKUILabel *v10;
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
  NSArray *v29;
  NSArray *topAndBottomLabelConstraints;
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
  _QWORD v43[3];
  _QWORD v44[6];

  v44[4] = *MEMORY[0x1E0C80C00];
  -[MKPlaceHoursView setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  -[MKPlaceHoursView setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

  -[MKPlaceHoursView _standardLabel](self, "_standardLabel");
  v4 = (_MKUILabel *)objc_claimAutoreleasedReturnValue();
  topMessageLabel = self->_topMessageLabel;
  self->_topMessageLabel = v4;

  -[_MKUILabel set_mapkit_themeColorProvider:](self->_topMessageLabel, "set_mapkit_themeColorProvider:", 0);
  v6 = self->_topMessageLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setTextColor:](v6, "setTextColor:", v7);

  -[MKPlaceHoursView _standardLabel](self, "_standardLabel");
  v8 = (_MKUILabel *)objc_claimAutoreleasedReturnValue();
  bottomMessageLabel = self->_bottomMessageLabel;
  self->_bottomMessageLabel = v8;

  -[_MKUILabel set_mapkit_themeColorProvider:](self->_bottomMessageLabel, "set_mapkit_themeColorProvider:", 0);
  v10 = self->_bottomMessageLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setTextColor:](v10, "setTextColor:", v11);

  v33 = (void *)MEMORY[0x1E0CB3718];
  -[MKPlaceHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel leadingAnchor](self->_topMessageLabel, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v37;
  -[MKPlaceHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel trailingAnchor](self->_topMessageLabel, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v32;
  -[MKPlaceHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel leadingAnchor](self->_bottomMessageLabel, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v14;
  -[MKPlaceHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel trailingAnchor](self->_bottomMessageLabel, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v19);

  -[MKPlaceHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel topAnchor](self->_topMessageLabel, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v21;
  -[_MKUILabel bottomAnchor](self->_topMessageLabel, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel topAnchor](self->_bottomMessageLabel, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v24;
  -[MKPlaceHoursView layoutMarginsGuide](self, "layoutMarginsGuide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel bottomAnchor](self->_bottomMessageLabel, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  topAndBottomLabelConstraints = self->_topAndBottomLabelConstraints;
  self->_topAndBottomLabelConstraints = v29;

}

- (id)hoursGrayColor
{
  if (MapKitIdiomIsMacCatalyst())
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bodyFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_baselineToTop, "setConstant:");

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_mapkit_scaledValueForValue:", 22.0);
  v8 = v7;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = self->_baselineToBaselineConstraints;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13++), "setConstant:", v8);
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bodyFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_mapkit_scaledValueForValue:", 17.0);
  v17 = v16;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self->_baselineToBottomConstraints;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "setConstant:", v17, (_QWORD)v23);
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

- (_MKUILabel)topLabel
{
  _MKUILabel *topMessageLabel;
  _MKUILabel *v4;
  _MKUILabel *topLabel;

  if (!-[MKPlaceHoursView _shouldCollapseTopMessageLabel](self, "_shouldCollapseTopMessageLabel")
    || (topMessageLabel = self->_topDayOrHourLabel) == 0)
  {
    topMessageLabel = self->_topMessageLabel;
  }
  v4 = topMessageLabel;
  topLabel = self->_topLabel;
  self->_topLabel = v4;

  return self->_topLabel;
}

- (void)setTopLabel:(id)a3
{
  _MKUILabel *v5;
  _MKUILabel *v6;

  v5 = (_MKUILabel *)a3;
  if (self->_topLabel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_topLabel, a3);
    v5 = v6;
  }

}

- (NSDictionary)formattedHoursData
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *formattedHoursData;

  if (self->_placeHoursViewOptions)
  {
    -[MKPlaceHoursView hoursBuilder](self, "hoursBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formatData:", self->_placeDailyHours);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    formattedHoursData = self->_formattedHoursData;
    self->_formattedHoursData = v4;

  }
  return self->_formattedHoursData;
}

- (void)setHoursBuilder:(id)a3
{
  _MKLocalizedHoursBuilder *v5;
  _MKLocalizedHoursBuilder *v6;

  v5 = (_MKLocalizedHoursBuilder *)a3;
  if (self->_hoursBuilder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_hoursBuilder, a3);
    -[MKPlaceHoursView _updateHoursView](self, "_updateHoursView");
    v5 = v6;
  }

}

- (void)setPlaceHoursViewOptions:(unint64_t)a3
{
  if (self->_placeHoursViewOptions != a3)
  {
    self->_placeHoursViewOptions = a3;
    -[MKPlaceHoursView _updateHoursView](self, "_updateHoursView");
  }
}

- (void)applyRulesForTopAndBottomLabel
{
  uint64_t v3;
  _MKUILabel *topMessageLabel;
  void *v5;
  _MKUILabel *bottomMessageLabel;
  void *v7;
  unint64_t placeHoursViewOptions;
  uint64_t v9;
  _MKUILabel *v10;
  void *v11;
  _MKUILabel *v12;
  void *v13;
  _MKUILabel *v14;
  void *v15;
  _MKUILabel *v16;
  _MKUILabel *topLabel;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = 432;
  -[_MKUILabel setText:](self->_topMessageLabel, "setText:", &stru_1E20DFC00);
  topMessageLabel = self->_topMessageLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setTextColor:](topMessageLabel, "setTextColor:", v5);

  -[_MKUILabel setText:](self->_bottomMessageLabel, "setText:", &stru_1E20DFC00);
  bottomMessageLabel = self->_bottomMessageLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setTextColor:](bottomMessageLabel, "setTextColor:", v7);

  placeHoursViewOptions = self->_placeHoursViewOptions;
  v9 = -[GEOBusinessHours hoursType](self->_businessHours, "hoursType");
  if ((placeHoursViewOptions & 8) != 0)
  {
    switch(v9)
    {
      case 1:
LABEL_5:
        v3 = 424;
        topLabel = self->_topLabel;
        -[GEOBusinessHours localizedMessage](self->_businessHours, "localizedMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          goto LABEL_9;
        +[_MKLocalizedHoursBuilder localizedHoursStringNormalHours](_MKLocalizedHoursBuilder, "localizedHoursStringNormalHours");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2:
        v3 = 424;
LABEL_8:
        topLabel = *(_MKUILabel **)((char *)&self->super.super.super.isa + v3);
        -[GEOBusinessHours localizedMessage](self->_businessHours, "localizedMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
LABEL_9:
          -[_MKUILabel setText:](topLabel, "setText:", v18);
        }
        else
        {
          +[_MKLocalizedHoursBuilder localizedHoursDayRangeString:](_MKLocalizedHoursBuilder, "localizedHoursDayRangeString:", self->_businessHours);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
LABEL_11:
            -[_MKUILabel setText:](topLabel, "setText:", v19);
          }
          else
          {
            +[_MKLocalizedHoursBuilder localizedHoursStringSpecialHours](_MKLocalizedHoursBuilder, "localizedHoursStringSpecialHours");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MKUILabel setText:](topLabel, "setText:", v20);

          }
        }

        v16 = *(_MKUILabel **)((char *)&self->super.super.super.isa + v3);
        goto LABEL_14;
      case 3:
      case 4:
LABEL_4:
        v10 = self->_topMessageLabel;
        -[_MKLocalizedHoursBuilder localizedOpenState](self->_hoursBuilder, "localizedOpenState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKUILabel setText:](v10, "setText:", v11);

        v12 = self->_topMessageLabel;
        -[_MKLocalizedHoursBuilder hoursStateLabelColor](self->_hoursBuilder, "hoursStateLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKUILabel setTextColor:](v12, "setTextColor:", v13);

        v14 = self->_bottomMessageLabel;
        -[GEOBusinessHours localizedMessage](self->_businessHours, "localizedMessage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MKUILabel setText:](v14, "setText:", v15);

        v16 = self->_bottomMessageLabel;
LABEL_14:
        -[MKPlaceHoursView hoursGrayColor](self, "hoursGrayColor");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        -[_MKUILabel setTextColor:](v16, "setTextColor:", v21);

        break;
      default:
        return;
    }
  }
  else
  {
    switch(v9)
    {
      case 1:
        goto LABEL_5;
      case 2:
        goto LABEL_8;
      case 3:
      case 4:
        goto LABEL_4;
      default:
        return;
    }
  }
}

- (BOOL)wantsDefaultClipping
{
  return 0;
}

- (void)infoCardThemeChanged
{
  void *v3;
  _MKUILabel *collapsableOpenStateLabel;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceHoursView;
  -[UIView infoCardThemeChanged](&v7, sel_infoCardThemeChanged);
  -[MKPlaceHoursView hoursBuilder](self, "hoursBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateHoursLabelColor");

  collapsableOpenStateLabel = self->_collapsableOpenStateLabel;
  -[MKPlaceHoursView hoursBuilder](self, "hoursBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hoursStateLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setTextColor:](collapsableOpenStateLabel, "setTextColor:", v6);

}

- (id)_standardLabel
{
  _MKUILabel *v3;
  _MKUILabel *v4;
  void *v5;
  void *v6;

  v3 = [_MKUILabel alloc];
  v4 = -[_MKUILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel set_mapkit_themeColorProvider:](v4, "set_mapkit_themeColorProvider:", &__block_literal_global_95);
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bodyFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setFont:](v4, "setFont:", v6);

  -[_MKUILabel setNumberOfLines:](v4, "setNumberOfLines:", 4);
  -[MKPlaceHoursView addSubview:](self, "addSubview:", v4);
  return v4;
}

uint64_t __34__MKPlaceHoursView__standardLabel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "textColor");
}

- (void)_updateOptionsForCollapsingToSingleLineAndColor
{
  _BOOL4 v3;
  _BOOL4 v4;

  self->_placeHoursViewOptions &= ~4uLL;
  v3 = (-[_MKLocalizedHoursBuilder geoMapItemOpeningHourOptions](self->_hoursBuilder, "geoMapItemOpeningHourOptions") & 8) != 0
    && (self->_placeHoursViewOptions & 8) == 0;
  v4 = (-[_MKLocalizedHoursBuilder geoMapItemOpeningHourOptions](self->_hoursBuilder, "geoMapItemOpeningHourOptions") & 0x10) != 0
    && (self->_placeHoursViewOptions & 8) == 0;
  if (v3 || v4)
    self->_placeHoursViewOptions |= 4uLL;
}

- (void)_updateHoursView
{
  MKPlaceHoursView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double Width;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _MKUILabel *collapsableOpenStateLabel;
  void *v40;
  void *v41;
  uint64_t v42;
  NSLayoutConstraint *baselineToTop;
  void *v44;
  unint64_t v45;
  _MKUILabel *v46;
  _MKUILabel *v47;
  _MKUILabel *v48;
  _MKUILabel *v49;
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
  _MKUILabel *topMessageLabel;
  void *v67;
  void *v68;
  id v69;
  id v70;
  unint64_t v71;
  _MKUILabel *v72;
  _MKUILabel *v73;
  _MKUILabel *v74;
  uint64_t v75;
  _MKUILabel *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  _MKUILabel *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unint64_t placeHoursViewOptions;
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
  _MKUILabel *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id WeakRetained;
  void *v110;
  id *location;
  void *v112;
  void *v113;
  void *v114;
  unint64_t v115;
  MKPlaceHoursView *v116;
  void *v117;
  _MKUILabel *v118;
  _MKUILabel *obj;
  uint64_t v120;
  id v121;
  uint64_t v122;
  void *v123;
  _MKUILabel *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  void *v130;
  void *v131;
  _QWORD v132[3];
  CGRect v133;

  v2 = self;
  v132[1] = *MEMORY[0x1E0C80C00];
  -[MKPlaceHoursView applyRulesForTopAndBottomLabel](self, "applyRulesForTopAndBottomLabel");
  if (!v2->_hoursBuilder
    || (v2->_placeHoursViewOptions | 0x40) == 0x40
    || !-[GEOBusinessHours hoursType](v2->_businessHours, "hoursType")
    || -[GEOBusinessHours hoursType](v2->_businessHours, "hoursType") == 4
    || -[GEOBusinessHours hoursType](v2->_businessHours, "hoursType") == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v2->_topAndBottomLabelConstraints);
    -[MKPlaceHoursView _collapseAllLabelsFromOptions](v2, "_collapseAllLabelsFromOptions");
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v2->_topAndBottomLabelConstraints);
  -[MKPlaceHoursView formattedHoursData](v2, "formattedHoursData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKPlaceHoursView _updateOptionsForCollapsingToSingleLineAndColor](v2, "_updateOptionsForCollapsingToSingleLineAndColor");
    if ((v2->_placeHoursViewOptions & 8) == 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("CurrentHours"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v132[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("CurrentOpenState"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
      location = (id *)&v2->_labels;
      -[NSArray makeObjectsPerformSelector:](v2->_labels, "makeObjectsPerformSelector:", sel_removeFromSuperview, v8);
      v36 = (void *)MEMORY[0x1E0C9AA60];
      v37 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v114 = (void *)objc_msgSend(v36, "mutableCopy");
      v38 = (void *)objc_msgSend(v36, "mutableCopy");
      v121 = (id)objc_msgSend(v36, "mutableCopy");
      collapsableOpenStateLabel = v2->_collapsableOpenStateLabel;
      v2->_collapsableOpenStateLabel = 0;

      -[_MKUILabel firstBaselineAnchor](v2->_topMessageLabel, "firstBaselineAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceHoursView topAnchor](v2, "topAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 22.0);
      v42 = objc_claimAutoreleasedReturnValue();
      baselineToTop = v2->_baselineToTop;
      v2->_baselineToTop = (NSLayoutConstraint *)v42;

      objc_msgSend(v38, "addObject:", v2->_baselineToTop);
      v113 = v5;
      if (objc_msgSend(v5, "count"))
      {
        v44 = v5;
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v48 = 0;
        v117 = v37;
        v116 = v2;
        v123 = v38;
        do
        {
          v49 = v48;
          -[MKPlaceHoursView _standardLabel](v2, "_standardLabel");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", v45);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setText:", v51);

          objc_msgSend(v121, "addObject:", v50);
          v115 = v45;
          if (!v45)
          {
            objc_storeStrong((id *)&v2->_topDayOrHourLabel, v50);
            -[MKPlaceHoursView setTopLabel:](v2, "setTopLabel:", v2->_topDayOrHourLabel);
          }
          objc_msgSend(v50, "leadingAnchor");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKPlaceHoursView layoutMarginsGuide](v2, "layoutMarginsGuide");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "leadingAnchor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "constraintEqualToAnchor:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "addObject:", v55);

          -[MKPlaceHoursView bottomAnchor](v2, "bottomAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lastBaselineAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "addObject:", v58);

          if ((v2->_placeHoursViewOptions & 1) != 0)
          {
            objc_msgSend(v50, "trailingAnchor");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKPlaceHoursView layoutMarginsGuide](v2, "layoutMarginsGuide");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "trailingAnchor");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "constraintEqualToAnchor:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "addObject:", v62);

          }
          objc_msgSend(v50, "firstBaselineAnchor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49 && v47)
          {
            -[_MKUILabel lastBaselineAnchor](v49, "lastBaselineAnchor");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v65);

            objc_msgSend(v50, "firstBaselineAnchor");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            topMessageLabel = v47;
          }
          else
          {
            topMessageLabel = v2->_topMessageLabel;
          }
          -[_MKUILabel lastBaselineAnchor](topMessageLabel, "lastBaselineAnchor");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v68);

          v69 = v50;
          v70 = v69;

          v48 = (_MKUILabel *)v70;
          v118 = v48;
          v71 = v115;
          if ((v2->_placeHoursViewOptions & 4) != 0 || v115 >= objc_msgSend(v112, "count"))
          {
            -[_MKUILabel set_mapkit_themeColorProvider:](v48, "set_mapkit_themeColorProvider:", 0);
            -[MKPlaceHoursView hoursBuilder](v2, "hoursBuilder");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "hoursStateLabelColor");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MKUILabel setTextColor:](v118, "setTextColor:", v100);

            v48 = v118;
            v46 = v118;
            v101 = v2->_collapsableOpenStateLabel;
            v2->_collapsableOpenStateLabel = v46;
            v74 = v46;
            v44 = v113;
          }
          else
          {
            objc_msgSend(v112, "objectAtIndexedSubscript:", v115);
            v72 = (_MKUILabel *)objc_claimAutoreleasedReturnValue();
            v125 = 0u;
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            obj = v72;
            v122 = -[_MKUILabel countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v125, v129, 16);
            if (v122)
            {
              v120 = *(_QWORD *)v126;
              v73 = v48;
              v74 = v48;
              do
              {
                v75 = 0;
                v76 = v47;
                do
                {
                  if (*(_QWORD *)v126 != v120)
                    objc_enumerationMutation(obj);
                  v77 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v75);
                  -[MKPlaceHoursView _standardLabel](v2, "_standardLabel");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "setText:", v77);
                  objc_msgSend(v121, "addObject:", v78);
                  v124 = v73;
                  if ((v2->_placeHoursViewOptions & 8) != 0)
                  {
                    -[MKPlaceHoursView layoutMarginsGuide](v2, "layoutMarginsGuide");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "trailingAnchor");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "trailingAnchor");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "constraintEqualToAnchor:", v84);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v123, "addObject:", v85);

                  }
                  else
                  {
                    objc_msgSend(v78, "set_mapkit_themeColorProvider:", 0);
                    -[MKPlaceHoursView hoursBuilder](v2, "hoursBuilder");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "hoursStateLabelColor");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "setTextColor:", v80);

                    v81 = v78;
                    v82 = v2->_collapsableOpenStateLabel;
                    v2->_collapsableOpenStateLabel = v81;
                  }

                  placeHoursViewOptions = v2->_placeHoursViewOptions;
                  objc_msgSend(v78, "firstBaselineAnchor");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((placeHoursViewOptions & 1) != 0 || !v74)
                  {
                    -[_MKUILabel lastBaselineAnchor](v48, "lastBaselineAnchor");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "constraintGreaterThanOrEqualToAnchor:constant:", v93, 22.0);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v117, "addObject:", v94);

                    if (v76)
                    {
                      objc_msgSend(v78, "firstBaselineAnchor");
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      -[_MKUILabel lastBaselineAnchor](v76, "lastBaselineAnchor");
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v95, "constraintGreaterThanOrEqualToAnchor:constant:", v96, 22.0);
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v117, "addObject:", v97);

                    }
                    -[MKPlaceHoursView layoutMarginsGuide](v116, "layoutMarginsGuide");
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v90, "leadingAnchor");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "leadingAnchor");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "constraintLessThanOrEqualToAnchor:", v92);
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v123, "addObject:", v98);

                    v2 = v116;
                    v48 = v118;
                  }
                  else
                  {
                    -[_MKUILabel firstBaselineAnchor](v48, "firstBaselineAnchor");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "constraintEqualToAnchor:", v88);
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v123, "addObject:", v89);

                    objc_msgSend(v78, "leadingAnchor");
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_MKUILabel trailingAnchor](v48, "trailingAnchor");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v90, "constraintGreaterThanOrEqualToAnchor:constant:", v91, 8.0);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v123, "addObject:", v92);
                  }

                  v47 = v78;
                  v74 = 0;
                  ++v75;
                  v76 = v47;
                  v73 = v47;
                }
                while (v122 != v75);
                v74 = 0;
                v73 = v47;
                v122 = -[_MKUILabel countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v125, v129, 16);
              }
              while (v122);
              v46 = v47;
              v44 = v113;
              v71 = v115;
            }
            else
            {
              v46 = v48;
              v74 = v48;
              v44 = v113;
            }
            v101 = obj;
          }

          v45 = v71 + 1;
          v37 = v117;
        }
        while (v45 < objc_msgSend(v44, "count"));
        if (v46)
        {
          -[_MKUILabel firstBaselineAnchor](v2->_bottomMessageLabel, "firstBaselineAnchor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MKUILabel lastBaselineAnchor](v46, "lastBaselineAnchor");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, 22.0);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v123;
          objc_msgSend(v123, "addObject:", v104);

        }
        else
        {
          v105 = v123;
        }
      }
      else
      {
        v46 = 0;
        v47 = 0;
        v118 = 0;
        v105 = v38;
      }
      -[MKPlaceHoursView bottomAnchor](v2, "bottomAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKUILabel lastBaselineAnchor](v2->_bottomMessageLabel, "lastBaselineAnchor");
      v107 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintEqualToAnchor:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "addObject:", v108);

      objc_storeStrong((id *)&v2->_baselineToBaselineConstraints, v37);
      objc_msgSend(v105, "addObjectsFromArray:", v2->_baselineToBaselineConstraints);
      objc_storeStrong((id *)&v2->_baselineToBottomConstraints, v114);
      objc_msgSend(v105, "addObjectsFromArray:", v2->_baselineToBottomConstraints);
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v105);
      -[MKPlaceHoursView _collapseAllLabelsFromOptions](v2, "_collapseAllLabelsFromOptions");
      objc_storeStrong(location, v121);
      -[MKPlaceHoursView _contentSizeDidChange](v2, "_contentSizeDidChange");
      WeakRetained = objc_loadWeakRetained((id *)&v2->_hoursDelegate);
      LOBYTE(v107) = objc_opt_respondsToSelector();

      if ((v107 & 1) != 0)
      {
        -[MKPlaceHoursView hoursDelegate](v2, "hoursDelegate");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "hoursViewDidUpdate:", v2);

      }
      return;
    }
    -[MKPlaceHoursView bounds](v2, "bounds");
    Width = CGRectGetWidth(v133);
    if (Width == 0.0)
    {
      +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "screenSize");
      v12 = v11;
      v14 = v13;

      if (v12 >= v14)
        v12 = v14;
    }
    else
    {
      v12 = Width;
    }
    -[MKPlaceHoursView layoutMargins](v2, "layoutMargins");
    v17 = v15 == 0.0;
    if (v16 == 0.0)
      v17 = 1;
    v18 = 320.0;
    if (v17)
      v15 = 16.0;
    else
      v18 = v16;
    v19 = v12 - v15 - v18 + -32.0;
    -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("DaysFullWidth"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;

    -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("DaysShortWidth"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v25 = v24;

    -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("HoursFullWidth"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v28 = v27;

    -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("HoursShortWidth"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    v31 = v30;

    if ((v2->_placeHoursViewOptions & 0x80) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("DaysShort"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("HoursShort"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = v28;
      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("DaysFull"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("HoursFull"));
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      v8 = v22 + v32;
      if (v8 <= v19)
      {
        v112 = (void *)v34;
        v5 = v33;
        goto LABEL_29;
      }
      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("DaysShort"), v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v25 + v32;
      if (v25 + v32 <= v19)
      {
        v112 = v35;
        goto LABEL_29;
      }
      -[NSDictionary objectForKeyedSubscript:](v2->_formattedHoursData, "objectForKeyedSubscript:", CFSTR("HoursShort"), v8);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v8 = v25 + v31;
    if (v25 + v31 > v19)
      v2->_placeHoursViewOptions |= 1uLL;
    goto LABEL_29;
  }
}

- (void)_collapseAllLabelsFromOptions
{
  void *v3;
  void *v4;
  unint64_t placeHoursViewOptions;
  void *v6;
  void *v7;
  _MKUILabel *collapsableOpenStateLabel;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_opt_new();
  if (-[MKPlaceHoursView _shouldCollapseTopMessageLabel](self, "_shouldCollapseTopMessageLabel"))
  {
    -[_MKUILabel heightAnchor](self->_topMessageLabel, "heightAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "constraintEqualToConstant:", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v4);

    if (-[NSArray count](self->_labels, "count"))
      -[MKPlaceHoursView setTopLabel:](self, "setTopLabel:", self->_topDayOrHourLabel);
  }
  placeHoursViewOptions = self->_placeHoursViewOptions;
  if ((placeHoursViewOptions & 0x20) != 0)
  {
    -[_MKUILabel heightAnchor](self->_bottomMessageLabel, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v7);

    placeHoursViewOptions = self->_placeHoursViewOptions;
  }
  if ((placeHoursViewOptions & 0x104) == 0x100)
  {
    collapsableOpenStateLabel = self->_collapsableOpenStateLabel;
    if (collapsableOpenStateLabel)
    {
      -[_MKUILabel heightAnchor](collapsableOpenStateLabel, "heightAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v11);

}

- (BOOL)_shouldCollapseTopMessageLabel
{
  void *v2;
  BOOL v3;

  if ((self->_placeHoursViewOptions & 0x10) != 0)
    return 1;
  -[_MKUILabel text](self->_topMessageLabel, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (unint64_t)placeHoursViewOptions
{
  return self->_placeHoursViewOptions;
}

- (_MKLocalizedHoursBuilder)hoursBuilder
{
  return self->_hoursBuilder;
}

- (void)setFormattedHoursData:(id)a3
{
  objc_storeStrong((id *)&self->_formattedHoursData, a3);
}

- (GEOBusinessHours)businessHours
{
  return self->_businessHours;
}

- (void)setBusinessHours:(id)a3
{
  objc_storeStrong((id *)&self->_businessHours, a3);
}

- (MKPlaceHoursViewDelegate)hoursDelegate
{
  return (MKPlaceHoursViewDelegate *)objc_loadWeakRetained((id *)&self->_hoursDelegate);
}

- (void)setHoursDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hoursDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hoursDelegate);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_formattedHoursData, 0);
  objc_storeStrong((id *)&self->_hoursBuilder, 0);
  objc_storeStrong((id *)&self->_placeDailyHours, 0);
  objc_storeStrong((id *)&self->_topAndBottomLabelConstraints, 0);
  objc_storeStrong((id *)&self->_baselineToBottomConstraints, 0);
  objc_storeStrong((id *)&self->_baselineToBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_baselineToTop, 0);
  objc_storeStrong((id *)&self->_collapsableOpenStateLabel, 0);
  objc_storeStrong((id *)&self->_bottomMessageLabel, 0);
  objc_storeStrong((id *)&self->_topDayOrHourLabel, 0);
  objc_storeStrong((id *)&self->_topMessageLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
