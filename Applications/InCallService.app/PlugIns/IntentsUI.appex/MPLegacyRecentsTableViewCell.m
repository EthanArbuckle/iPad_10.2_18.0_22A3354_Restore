@implementation MPLegacyRecentsTableViewCell

+ (double)minimumRowHeight
{
  return 60.0;
}

+ (double)largestCallTypeIconWidth
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage recentsOutgoingAudioCallGlyphImage](UIImage, "recentsOutgoingAudioCallGlyphImage"));
  v20[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage recentsOutgoingVideoCallGlyphImage](UIImage, "recentsOutgoingVideoCallGlyphImage"));
  v20[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage recentsTTYRelayGlyphImage](UIImage, "recentsTTYRelayGlyphImage"));
  v20[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage recentsTTYDirectGlyphImage](UIImage, "recentsTTYDirectGlyphImage"));
  v20[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "size", (_QWORD)v15);
        if (v11 < v13)
          v11 = v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

+ (double)leftTitleSeparatorInsetForContentSizeCategory:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a1, "callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v4);
  v6 = v5;
  objc_msgSend(a1, "callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:", v4);
  v8 = v6 + v7;
  objc_msgSend(a1, "titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v4);
  v10 = v9;

  return v8 + v10;
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3 isEditing:(BOOL)a4
{
  _BOOL4 v4;
  NSString *v6;
  id v7;
  _BOOL4 IsAccessibilityCategory;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  v4 = a4;
  v6 = (NSString *)a3;
  v7 = objc_alloc_init((Class)TUFeatureFlags);
  if (objc_msgSend(v7, "phoneRecentsAvatarsEnabled"))
  {
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);
    v9 = 55.0;
    if (IsAccessibilityCategory)
      v9 = 0.0;
  }
  else
  {
    objc_msgSend(a1, "callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v6);
    v11 = v10;
    objc_msgSend(a1, "callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:", v6);
    v13 = v11 + v12;
    objc_msgSend(a1, "titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v6);
    v9 = v13 + v14;
  }
  if (v4)
    v15 = v9 + 50.0;
  else
    v15 = v9;

  v16 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  v19 = v15;
  result.right = v18;
  result.bottom = v17;
  result.left = v19;
  result.top = v16;
  return result;
}

- (void)commonInit
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPLegacyRecentsTableViewCell;
  -[PHTableViewCell commonInit](&v4, "commonInit");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (TUFeatureFlags)featureFlags
{
  TUFeatureFlags *featureFlags;
  TUFeatureFlags *v4;
  TUFeatureFlags *v5;

  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }
  return featureFlags;
}

- (id)loadRootViewAndContentViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  double y;
  double width;
  double height;
  UIImageView *v12;
  UIImageView *outgoingIndicator;
  void *v14;
  void *v15;
  UIImageView *callTypeIconView;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIView *v22;
  UIView *callTypeIconSizingView;
  double v24;
  double v25;
  UILabel *v26;
  UILabel *callerCountLabel;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  UIDateLabel *v33;
  UIDateLabel *callerDateLabel;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NUIContainerStackView *v40;
  NUIContainerStackView *titleStackView;
  NUIContainerStackView *v42;
  NUIContainerStackView *subtitleStackView;
  NUIContainerGridView *v44;
  NUIContainerGridView *gridView;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  double v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)MPLegacyRecentsTableViewCell;
  v3 = -[PHDoubleLineTableViewCell loadRootViewAndContentViews](&v52, "loadRootViewAndContentViews");
  -[MPLegacyRecentsTableViewCell setAccessoryType:](self, "setAccessoryType:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setLineBreakMode:", 4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v5, "setLineBreakMode:", 4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell featureFlags](self, "featureFlags"));
  v7 = objc_msgSend(v6, "phoneRecentsAvatarsEnabled");

  v8 = objc_alloc((Class)UIImageView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if ((v7 & 1) != 0)
  {
    outgoingIndicator = self->_outgoingIndicator;
    self->_outgoingIndicator = v12;

    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_outgoingIndicator, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v14, "setTintColor:", v15);

  }
  else
  {
    callTypeIconView = self->_callTypeIconView;
    self->_callTypeIconView = v12;

    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_callTypeIconView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicTertiaryLabelColor](UIColor, "dynamicTertiaryLabelColor"));
    -[UIImageView setTintColor:](self->_callTypeIconView, "setTintColor:", v17);

    LODWORD(v18) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_callTypeIconView, "setContentHuggingPriority:forAxis:", 1, v18);
    LODWORD(v19) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](self->_callTypeIconView, "setContentHuggingPriority:forAxis:", 0, v19);
    LODWORD(v20) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_callTypeIconView, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    LODWORD(v21) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_callTypeIconView, "setContentCompressionResistancePriority:forAxis:", 0, v21);
  }
  -[MPLegacyRecentsTableViewCell setMaximumColumnsWithoutAccessibility:](self, "setMaximumColumnsWithoutAccessibility:", 3);
  -[MPLegacyRecentsTableViewCell setMaximumColumnsWithAccessibility:](self, "setMaximumColumnsWithAccessibility:", 2);
  v22 = (UIView *)objc_alloc_init((Class)UIView);
  callTypeIconSizingView = self->_callTypeIconSizingView;
  self->_callTypeIconSizingView = v22;

  objc_msgSend((id)objc_opt_class(self), "largestCallTypeIconWidth");
  v25 = v24;
  -[UIView setMinimumLayoutSize:](self->_callTypeIconSizingView, "setMinimumLayoutSize:");
  -[UIView setMaximumLayoutSize:](self->_callTypeIconSizingView, "setMaximumLayoutSize:", v25, 1.0);
  v26 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  callerCountLabel = self->_callerCountLabel;
  self->_callerCountLabel = v26;

  -[UILabel setAccessibilityIdentifier:](self->_callerCountLabel, "setAccessibilityIdentifier:", CFSTR("MPRecentsTableViewCell_CallerCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_callerCountLabel, "setBackgroundColor:", v28);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_callerCountLabel, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v29) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_callerCountLabel, "setContentHuggingPriority:forAxis:", 1, v29);
  LODWORD(v30) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_callerCountLabel, "setContentHuggingPriority:forAxis:", 0, v30);
  LODWORD(v31) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_callerCountLabel, "setContentCompressionResistancePriority:forAxis:", 1, v31);
  LODWORD(v32) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_callerCountLabel, "setContentCompressionResistancePriority:forAxis:", 0, v32);
  v33 = (UIDateLabel *)objc_msgSend(objc_alloc((Class)UIDateLabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  callerDateLabel = self->_callerDateLabel;
  self->_callerDateLabel = v33;

  -[UIDateLabel setAccessibilityIdentifier:](self->_callerDateLabel, "setAccessibilityIdentifier:", CFSTR("MPRecentsTableViewCell_CallerDate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIDateLabel setBackgroundColor:](self->_callerDateLabel, "setBackgroundColor:", v35);

  -[UIDateLabel setAdjustsFontForContentSizeCategory:](self->_callerDateLabel, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v36) = 1148846080;
  -[UIDateLabel setContentCompressionResistancePriority:forAxis:](self->_callerDateLabel, "setContentCompressionResistancePriority:forAxis:", 0, v36);
  LODWORD(v37) = 1148846080;
  -[UIDateLabel setContentCompressionResistancePriority:forAxis:](self->_callerDateLabel, "setContentCompressionResistancePriority:forAxis:", 1, v37);
  LODWORD(v38) = 1148846080;
  -[UIDateLabel setContentHuggingPriority:forAxis:](self->_callerDateLabel, "setContentHuggingPriority:forAxis:", 0, v38);
  LODWORD(v39) = 1148846080;
  -[UIDateLabel setContentHuggingPriority:forAxis:](self->_callerDateLabel, "setContentHuggingPriority:forAxis:", 1, v39);
  v40 = (NUIContainerStackView *)objc_alloc_init((Class)NUIContainerStackView);
  titleStackView = self->_titleStackView;
  self->_titleStackView = v40;

  v42 = (NUIContainerStackView *)objc_alloc_init((Class)NUIContainerStackView);
  subtitleStackView = self->_subtitleStackView;
  self->_subtitleStackView = v42;

  v44 = (NUIContainerGridView *)objc_alloc_init((Class)NUIContainerGridView);
  gridView = self->_gridView;
  self->_gridView = v44;

  -[MPLegacyRecentsTableViewCell updateFonts](self, "updateFonts");
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v46, "effectiveFirstBaselineOffsetFromTop");
  -[NUIContainerStackView setCustomFirstBaselineOffsetFromTop:](self->_titleStackView, "setCustomFirstBaselineOffsetFromTop:");

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v47, "effectiveFirstBaselineOffsetFromTop");
  -[NUIContainerStackView setCustomFirstBaselineOffsetFromTop:](self->_subtitleStackView, "setCustomFirstBaselineOffsetFromTop:");

  -[NUIContainerStackView setSpacing:](self->_subtitleStackView, "setSpacing:", 4.0);
  -[NUIContainerStackView setSpacing:](self->_titleStackView, "setSpacing:", 4.0);
  -[NUIContainerGridView setHorizontalAlignment:](self->_gridView, "setHorizontalAlignment:", 1);
  -[NUIContainerGridView setLayoutMarginsRelativeArrangement:](self->_gridView, "setLayoutMarginsRelativeArrangement:", 1);
  -[NUIContainerGridView setBaselineRelativeArrangement:](self->_gridView, "setBaselineRelativeArrangement:", 1);
  -[PHDoubleLineTableViewCell subtitleLabelFirstBaselineLayoutConstraintConstant](self, "subtitleLabelFirstBaselineLayoutConstraintConstant");
  -[NUIContainerGridView setRowSpacing:](self->_gridView, "setRowSpacing:");
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell featureFlags](self, "featureFlags"));
  v49 = objc_msgSend(v48, "phoneRecentsAvatarsEnabled");

  v50 = 10.0;
  if ((v49 & 1) == 0)
    -[PHTableViewCell titleLabelLeadingLayoutConstraintConstant](self, "titleLabelLeadingLayoutConstraintConstant", 10.0);
  -[NUIContainerGridView setColumnSpacing:](self->_gridView, "setColumnSpacing:", v50);
  -[MPLegacyRecentsTableViewCell configureGridViewArrangedSubviews](self, "configureGridViewArrangedSubviews");
  return self->_gridView;
}

- (void)updateFontsAndLayoutMetrics
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPLegacyRecentsTableViewCell;
  -[PHTableViewCell updateFontsAndLayoutMetrics](&v10, "updateFontsAndLayoutMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend((id)objc_opt_class(self), "largestCallTypeIconWidth");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconSizingView](self, "callTypeIconSizingView"));
  objc_msgSend(v8, "setMinimumLayoutSize:", v7, 1.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconSizingView](self, "callTypeIconSizingView"));
  objc_msgSend(v9, "setMaximumLayoutSize:", v7, 1.0);

  -[MPLegacyRecentsTableViewCell configureGridViewArrangedSubviews](self, "configureGridViewArrangedSubviews");
  -[MPLegacyRecentsTableViewCell updateFonts](self, "updateFonts");
}

- (BOOL)isAccessibilityConstraintsEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "isPreferredContentSizeCategoryAccessible");

  return v3;
}

- (void)updateDateLabelAlignment
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = -[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
  if (v3)
    v6 = 4;
  else
    v6 = 3;
  objc_msgSend(v4, "setAlignment:forView:inAxis:", v6, v5, 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
  objc_msgSend(v8, "setAlignment:forView:inAxis:", 1, v7, 0);

}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  unsigned int v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  NSDirectionalEdgeInsets result;

  v21.receiver = self;
  v21.super_class = (Class)MPLegacyRecentsTableViewCell;
  -[PHDoubleLineTableViewCell rootViewLayoutMargins](&v21, "rootViewLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell featureFlags](self, "featureFlags"));
  v10 = objc_msgSend(v9, "phoneRecentsAvatarsEnabled");

  if (v10)
  {
    -[MPLegacyRecentsTableViewCell dateLabelTrailingLayoutConstraintConstant](self, "dateLabelTrailingLayoutConstraintConstant");
    v8 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell contentView](self, "contentView"));
    objc_msgSend(v12, "directionalLayoutMargins");
    v14 = v13;

    v6 = 12.0;
    v4 = 12.0;
  }
  else
  {
    -[MPLegacyRecentsTableViewCell callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant](self, "callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant");
    v14 = v15;
    if (-[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    {
      -[MPLegacyRecentsTableViewCell dateLabelTrailingLayoutConstraintConstant](self, "dateLabelTrailingLayoutConstraintConstant");
      v8 = v16;
    }
  }
  v17 = v4;
  v18 = v14;
  v19 = v6;
  v20 = v8;
  result.trailing = v20;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (void)setItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  PHRecentsItem *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIImageView *callTypeIconView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  PHRecentsItem *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  unsigned __int8 v90;
  void *v91;
  void *v92;
  void *v93;
  unsigned int v94;
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
  double v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  PHRecentsItem *v113;

  v113 = (PHRecentsItem *)a3;
  if (self->_item != v113)
  {
    objc_storeStrong((id *)&self->_item, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedCount](v113, "localizedCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
    objc_msgSend(v6, "setText:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem date](v113, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
    objc_msgSend(v8, "setDate:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedSubtitle](v113, "localizedSubtitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v10, "setText:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedValidHandlesTitle](v113, "localizedValidHandlesTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v12, "setText:", v11);

    v13 = -[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled");
    v14 = v113;
    if ((v13 & 1) != 0)
      goto LABEL_7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell traitCollection](self, "traitCollection"));
    if (objc_msgSend(v15, "preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedCount](v113, "localizedCount"));
      v17 = objc_msgSend(v16, "length");

      v14 = v113;
      if (!v17)
        goto LABEL_7;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedValidHandlesTitle](v113, "localizedValidHandlesTitle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedCount](v113, "localizedCount"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v18, v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
      objc_msgSend(v21, "setText:", v20);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
      objc_msgSend(v15, "setText:", 0);
    }

    v14 = v113;
LABEL_7:
    callTypeIconView = self->_callTypeIconView;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem image](v14, "image"));

    if (callTypeIconView)
    {
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem image](v113, "image"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
        objc_msgSend(v25, "setImage:", v24);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
LABEL_12:
        v29 = v26;
        v30 = 0;
LABEL_16:
        objc_msgSend(v26, "setHidden:", v30);

        goto LABEL_17;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
    }
    else
    {
      if (v23)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem image](v113, "image"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
        objc_msgSend(v28, "setImage:", v27);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
        goto LABEL_12;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    }
    v29 = v26;
    v30 = 1;
    goto LABEL_16;
  }
LABEL_17:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "text"));
  v33 = objc_msgSend(v32, "length");

  v34 = v113;
  if (v33)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedCount](v113, "localizedCount"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
    objc_msgSend(v36, "setText:", v35);

    v34 = v113;
  }
  v37 = -[PHRecentsItem verified](v34, "verified");
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
  v39 = v38;
  if ((v37 & 1) != 0)
  {

    if (!v39)
    {
      v40 = objc_alloc((Class)UIImageView);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage recentsVerifiedCheckmarkImage](UIImage, "recentsVerifiedCheckmarkImage"));
      v42 = objc_msgSend(v40, "initWithImage:", v41);
      -[MPLegacyRecentsTableViewCell setVerifiedBadgeView:](self, "setVerifiedBadgeView:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicTertiaryLabelColor](UIColor, "dynamicTertiaryLabelColor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      objc_msgSend(v44, "setTintColor:", v43);

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "arrangedSubviews"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
    v48 = objc_msgSend(v46, "containsObject:", v47);

    if ((v48 & 1) == 0)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "arrangedSubviews"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
      objc_msgSend(v49, "insertArrangedSubview:atIndex:", v50, objc_msgSend(v52, "indexOfObject:", v53));

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      objc_msgSend(v54, "setAlignment:forView:inAxis:", 3, v55, 1);

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      LODWORD(v57) = 1148846080;
      objc_msgSend(v56, "setContentHuggingPriority:forAxis:", 1, v57);

      v58 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      LODWORD(v59) = 1148846080;
      objc_msgSend(v58, "setContentHuggingPriority:forAxis:", 0, v59);

      v60 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      LODWORD(v61) = 1148846080;
      objc_msgSend(v60, "setContentCompressionResistancePriority:forAxis:", 1, v61);

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      LODWORD(v63) = 1148846080;
      objc_msgSend(v62, "setContentCompressionResistancePriority:forAxis:", 0, v63);

      v64 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      objc_msgSend(v64, "setNeedsLayout");

    }
  }
  else if (v38)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "arrangedSubviews"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
    v68 = objc_msgSend(v66, "containsObject:", v67);

    if (v68)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      objc_msgSend(v69, "removeArrangedSubview:", v70);

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell verifiedBadgeView](self, "verifiedBadgeView"));
      objc_msgSend(v71, "removeFromSuperview");

      -[MPLegacyRecentsTableViewCell setVerifiedBadgeView:](self, "setVerifiedBadgeView:", 0);
    }
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedSenderIdentityTitle](v113, "localizedSenderIdentityTitle"));
  v73 = objc_msgSend(v72, "length");

  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));

    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedSenderIdentityTitle](v113, "localizedSenderIdentityTitle"));
      objc_msgSend(v75, "setTitle:", v76);
    }
    else
    {
      v84 = objc_alloc((Class)TPBadgeView);
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsItem localizedSenderIdentityTitle](v113, "localizedSenderIdentityTitle"));
      v86 = objc_msgSend(v84, "initWithTitle:", v85);
      -[MPLegacyRecentsTableViewCell setBadgeView:](self, "setBadgeView:", v86);

      v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicTertiaryLabelColor](UIColor, "dynamicTertiaryLabelColor"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      objc_msgSend(v76, "setTintColor:", v75);
    }

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "arrangedSubviews"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
    v90 = objc_msgSend(v88, "containsObject:", v89);

    if ((v90 & 1) == 0)
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "arrangedSubviews"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
      v94 = objc_msgSend(v92, "containsObject:", v93);

      v95 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      if (v94)
      {
        v97 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
        v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "arrangedSubviews"));
        v99 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
        objc_msgSend(v95, "insertArrangedSubview:atIndex:", v96, (char *)objc_msgSend(v98, "indexOfObject:", v99) + 1);

      }
      else
      {
        objc_msgSend(v95, "insertArrangedSubview:atIndex:", v96, 0);
      }

      v100 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      objc_msgSend(v100, "setAlignment:forView:inAxis:", 3, v101, 0);

      v102 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      objc_msgSend(v102, "setAlignment:forView:inAxis:", 3, v103, 1);

      v104 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      LODWORD(v105) = 1148846080;
      objc_msgSend(v104, "setContentHuggingPriority:forAxis:", 1, v105);

      v106 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      LODWORD(v107) = 1148846080;
      objc_msgSend(v106, "setContentHuggingPriority:forAxis:", 0, v107);

      v108 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      LODWORD(v109) = 1148846080;
      objc_msgSend(v108, "setContentCompressionResistancePriority:forAxis:", 1, v109);

      v110 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      LODWORD(v111) = 1148846080;
      objc_msgSend(v110, "setContentCompressionResistancePriority:forAxis:", 0, v111);

      v112 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      objc_msgSend(v112, "setNeedsLayout");

    }
  }
  else
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "arrangedSubviews"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
    v80 = objc_msgSend(v78, "containsObject:", v79);

    if (v80)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      objc_msgSend(v81, "removeArrangedSubview:", v82);

      v83 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell badgeView](self, "badgeView"));
      objc_msgSend(v83, "removeFromSuperview");

      -[MPLegacyRecentsTableViewCell setBadgeView:](self, "setBadgeView:", 0);
    }
  }

}

- (void)configureWithRecentsItem:(id)a3 recentCall:(id)a4 messageIndicatorViewModel:(id)a5
{
  unsigned int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a4;
  -[MPLegacyRecentsTableViewCell setItem:](self, "setItem:", a3);
  v7 = objc_msgSend(v24, "callStatus");
  v8 = kCHCallStatusMissed;
  if (v7 == kCHCallStatusMissed)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v9));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicLabelColor](UIColor, "dynamicLabelColor"));
  }
  -[MPLegacyRecentsTableViewCell setIsMissedCall:](self, "setIsMissedCall:", objc_msgSend(v24, "callStatus") == v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v11, "setTextColor:", v10);

  -[MPLegacyRecentsTableViewCell updateTextColor](self, "updateTextColor");
  if (-[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
  objc_msgSend(v15, "setTextColor:", v14);

  if (!-[MPLegacyRecentsTableViewCell tapTargets](self, "tapTargets"))
    goto LABEL_17;
  v16 = objc_msgSend(v24, "mediaType");
  if (v16 == (id)2)
  {
    v17 = CFSTR("video.fill");
  }
  else
  {
    if (v16 != (id)1)
    {
      if (!v16)
        -[MPLegacyRecentsTableViewCell setCallButtonImage:](self, "setCallButtonImage:", 0);
      goto LABEL_15;
    }
    v17 = CFSTR("phone.fill");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v17));
  -[MPLegacyRecentsTableViewCell setCallButtonImage:](self, "setCallButtonImage:", v18);

LABEL_15:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButtonImage](self, "callButtonImage"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButton](self, "callButton"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButtonImage](self, "callButtonImage"));
    objc_msgSend(v20, "configureForImage:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButton](self, "callButton"));
    objc_msgSend(v22, "sizeToFit");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButton](self, "callButton"));
    -[MPLegacyRecentsTableViewCell setAccessoryView:](self, "setAccessoryView:", v23);

  }
LABEL_17:

}

- (void)enableCallButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButton](self, "callButton"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setTapTargets:(BOOL)a3
{
  void *v4;
  TPAccessoryButton *v5;
  TPAccessoryButton *callButton;

  if (self->_tapTargets != a3)
  {
    self->_tapTargets = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButton](self, "callButton"));

      if (!v4)
      {
        v5 = (TPAccessoryButton *)objc_alloc_init((Class)TPAccessoryButton);
        callButton = self->_callButton;
        self->_callButton = v5;

        -[TPAccessoryButton addTarget:action:forControlEvents:](self->_callButton, "addTarget:action:forControlEvents:", self, "callButtonTapped:", 64);
      }
    }
    else
    {
      -[MPLegacyRecentsTableViewCell setAccessoryView:](self, "setAccessoryView:", 0);
    }
  }
}

- (void)configureGridViewArrangedSubviews
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
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
  UIImageView *callTypeIconView;
  uint64_t v26;
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
  uint64_t v40;
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
  uint64_t v79;
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
  double v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _QWORD *v108;
  _QWORD v109[5];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[2];
  void *v116;
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[3];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[3];
  _QWORD v126[2];
  void *v127;

  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = sub_1000103C4;
  v109[3] = &unk_10007D440;
  v109[4] = self;
  v3 = objc_retainBlock(v109);
  if (-[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    v5 = objc_msgSend(v4, "numberOfColumns");
    if (v5 == (id)-[MPLegacyRecentsTableViewCell maximumColumnsWithAccessibility](self, "maximumColumnsWithAccessibility"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      v7 = objc_msgSend(v6, "numberOfRows");

      if (v7 == (id)3)
        goto LABEL_4;
    }
    else
    {

    }
    v108 = v3;
    ((void (*)(_QWORD *))v3[2])(v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v12, "setNumberOfLines:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v13, "setNumberOfLines:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
    v127 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v127, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    objc_msgSend(v16, "setArrangedSubviews:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    objc_msgSend(v17, "setAxis:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    objc_msgSend(v18, "setAlignment:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    v126[0] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
    v126[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v126, 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    objc_msgSend(v22, "setArrangedSubviews:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    objc_msgSend(v23, "setAxis:", 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    objc_msgSend(v24, "setAlignment:", 1);

    callTypeIconView = self->_callTypeIconView;
    v26 = objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    v27 = (void *)v26;
    if (callTypeIconView)
    {
      v124[0] = v26;
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
      v124[1] = v105;
      v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v124, 2));
      v125[0] = v103;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v123[0] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v123[1] = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 2));
      v125[1] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
      v122[0] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
      v122[1] = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v122, 2));
      v125[2] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v125, 3));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      objc_msgSend(v35, "setArrangedSubviewRows:", v34);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
      objc_msgSend(v36, "setAlignment:forView:inAxis:", 4, v37, 0);

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
      objc_msgSend(v27, "setAlignment:forView:inAxis:", 3, v38, 1);
    }
    else
    {
      v120[0] = v26;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
      v120[1] = v38;
      v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v120, 2));
      v121[0] = v107;
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v119[0] = v104;
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v119[1] = v69;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 2));
      v121[1] = v70;
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
      v118[0] = v71;
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconSizingView](self, "callTypeIconSizingView"));
      v118[1] = v72;
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v118, 2));
      v121[2] = v73;
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v121, 3));
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      objc_msgSend(v75, "setArrangedSubviewRows:", v74);

    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
    v78 = v76;
    v79 = 1;
    goto LABEL_18;
  }
LABEL_4:
  if (-[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    goto LABEL_19;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
  v9 = objc_msgSend(v8, "numberOfColumns");
  if (v9 != (id)-[MPLegacyRecentsTableViewCell maximumColumnsWithoutAccessibility](self, "maximumColumnsWithoutAccessibility"))
  {

    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
  v11 = objc_msgSend(v10, "numberOfRows");

  if (v11 != (id)2)
  {
LABEL_12:
    v108 = v3;
    ((void (*)(_QWORD *))v3[2])(v3);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell traitCollection](self, "traitCollection"));
    v40 = objc_msgSend(v39, "preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells") ^ 1;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v41, "setNumberOfLines:", v40);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v42, "setNumberOfLines:", 1);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
    v117[0] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
    v117[1] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 2));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    objc_msgSend(v46, "setArrangedSubviews:", v45);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    objc_msgSend(v47, "setAxis:", 0);

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    objc_msgSend(v48, "setAlignment:", 5);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
    objc_msgSend(v49, "setAlignment:forView:inAxis:", 4, v50, 0);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
    v116 = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v116, 1));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    objc_msgSend(v53, "setArrangedSubviews:", v52);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    objc_msgSend(v54, "setAxis:", 0);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    objc_msgSend(v55, "setAlignment:", 1);

    if (self->_callTypeIconView)
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
      v114[0] = v106;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
      v114[1] = v56;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
      v114[2] = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 3));
      v115[0] = v58;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconSizingView](self, "callTypeIconSizingView"));
      v113[0] = v59;
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v113[1] = v60;
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
      v113[2] = v61;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 3));
      v115[1] = v62;
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v115, 2));
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      objc_msgSend(v64, "setArrangedSubviewRows:", v63);

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
      objc_msgSend(v65, "setAlignment:forView:inAxis:", 3, v66, 0);

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callTypeIconView](self, "callTypeIconView"));
      objc_msgSend(v67, "setAlignment:forView:inAxis:", 3, v68, 1);
    }
    else
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
      v111[0] = v67;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
      v111[1] = v68;
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v111, 2));
      v112[0] = v80;
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
      v110[0] = v81;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
      v110[1] = v82;
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v110, 2));
      v112[1] = v83;
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 2));
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
      objc_msgSend(v85, "setArrangedSubviewRows:", v84);

    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
    v78 = v76;
    v79 = 4;
LABEL_18:
    objc_msgSend(v78, "setAlignment:forView:inAxis:", v79, v77, 0);

    v86 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
    objc_msgSend(v86, "setAlignment:forView:inAxis:", 3, v87, 1);
    v3 = v108;

  }
LABEL_19:
  if (self->_outgoingIndicator)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    objc_msgSend(v88, "insertArrangedSubview:atIndex:", v89, 0);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    objc_msgSend(v90, "setAlignment:forView:inAxis:", 3, v91, 0);

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    objc_msgSend(v92, "setAlignment:forView:inAxis:", 3, v93, 1);

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    LODWORD(v95) = 1148846080;
    objc_msgSend(v94, "setContentHuggingPriority:forAxis:", 0, v95);

    v96 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    LODWORD(v97) = 1148846080;
    objc_msgSend(v96, "setContentHuggingPriority:forAxis:", 1, v97);

    v98 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    LODWORD(v99) = 1148846080;
    objc_msgSend(v98, "setContentCompressionResistancePriority:forAxis:", 0, v99);

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell outgoingIndicator](self, "outgoingIndicator"));
    LODWORD(v101) = 1148846080;
    objc_msgSend(v100, "setContentCompressionResistancePriority:forAxis:", 1, v101);

    v102 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    objc_msgSend(v102, "setNeedsLayout");

  }
}

- (void)setAvatarViewController:(id)a3
{
  CNAvatarViewController *v5;
  CNAvatarViewController *v6;

  v5 = (CNAvatarViewController *)a3;
  if (self->_avatarViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_avatarViewController, a3);
    -[MPLegacyRecentsTableViewCell updateRootView](self, "updateRootView");
    -[MPLegacyRecentsTableViewCell configureGridViewArrangedSubviews](self, "configureGridViewArrangedSubviews");
    v5 = v6;
  }

}

- (void)updateRootView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell avatarViewController](self, "avatarViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell avatarViewController](self, "avatarViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "setMinimumLayoutSize:", 45.0, 45.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell avatarViewController](self, "avatarViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "setMaximumLayoutSize:", 45.0, 45.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell avatarViewController](self, "avatarViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

    LODWORD(v10) = 1148846080;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    v19 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v16 = objc_msgSend(v14, "insertColumnAtIndex:withArrangedSubviews:", 0, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    objc_msgSend(v17, "setAlignment:forView:inAxis:", 1, v9, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
    objc_msgSend(v18, "setAlignment:forView:inAxis:", 3, v9, 1);

    -[MPLegacyRecentsTableViewCell setPreservesSuperviewLayoutMargins:](self, "setPreservesSuperviewLayoutMargins:", 1);
  }
}

- (void)callButtonTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButtonTappedHandler](self, "callButtonTappedHandler", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callButtonTappedHandler](self, "callButtonTappedHandler"));
    v5[2]();

  }
}

- (void)setCallButtonTappedHandler:(id)a3
{
  id v4;
  id callButtonTappedHandler;

  v4 = objc_retainBlock(a3);
  callButtonTappedHandler = self->_callButtonTappedHandler;
  self->_callButtonTappedHandler = v4;

}

- (void)updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIBodyShortEmphasizedFont](UIFont, "telephonyUIBodyShortEmphasizedFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUISubheadlineShortFont](UIFont, "telephonyUISubheadlineShortFont"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "font"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
  objc_msgSend(v9, "setFont:", v8);

  v10 = NUIContainerViewLengthUseDefault;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v11, "setCustomBaselineOffsetFromBottom:", v10);

  -[MPLegacyRecentsTableViewCell effectiveBaselineOffsetFromBottom](self, "effectiveBaselineOffsetFromBottom");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v14, "setCustomBaselineOffsetFromBottom:", v13);

  if (-[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  else
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell titleLabel](self, "titleLabel"));
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "font"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerCountLabel](self, "callerCountLabel"));
  objc_msgSend(v18, "setFont:", v17);

  -[MPLegacyRecentsTableViewCell updateTextColor](self, "updateTextColor");
}

- (void)updateTextColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHTableViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell callerDateLabel](self, "callerDateLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

}

- (void)showContainerViewDebugBoundingBox
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell gridView](self, "gridView"));
  objc_msgSend(v3, "setDebugBoundingBoxesEnabled:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell titleStackView](self, "titleStackView"));
  objc_msgSend(v4, "setDebugBoundingBoxesEnabled:", 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell subtitleStackView](self, "subtitleStackView"));
  objc_msgSend(v5, "setDebugBoundingBoxesEnabled:", 1);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPLegacyRecentsTableViewCell;
  -[MPLegacyRecentsTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[MPLegacyRecentsTableViewCell configureGridViewArrangedSubviews](self, "configureGridViewArrangedSubviews");
}

- (double)titleLabelLeadingAnchorLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v5);
  v7 = v6;

  return v7;
}

- (double)callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPLegacyRecentsTableViewCell traitCollection](self, "traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  objc_msgSend(v3, "callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:", v5);
  v7 = v6;

  return v7;
}

- (double)dateLabelTrailingLayoutConstraintConstant
{
  double v3;

  v3 = 0.0;
  if (!-[MPLegacyRecentsTableViewCell isAccessibilityConstraintsEnabled](self, "isAccessibilityConstraintsEnabled"))
  {
    if (-[MPLegacyRecentsTableViewCell accessoryType](self, "accessoryType"))
    {
      if (-[MPLegacyRecentsTableViewCell accessoryType](self, "accessoryType") == (id)4)
      {
        if (-[MPLegacyRecentsTableViewCell tapTargets](self, "tapTargets"))
          return 16.0;
        else
          return 6.0;
      }
    }
    else
    {
      return 15.0;
    }
  }
  return v3;
}

+ (double)callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant:(id)a3
{
  NSString *v4;
  double v5;
  double v6;
  double result;

  v4 = (NSString *)a3;
  objc_msgSend((id)objc_opt_class(a1), "largestCallTypeIconWidth");
  v6 = v5;
  LODWORD(a1) = UIContentSizeCategoryIsAccessibilityCategory(v4);

  result = 0.0;
  if (!(_DWORD)a1)
    return v6;
  return result;
}

+ (double)callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  double result;

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  result = 10.0;
  if (IsAccessibilityCategory)
    return 15.0;
  return result;
}

+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  double result;

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  result = 12.0;
  if (IsAccessibilityCategory)
    return 0.0;
  return result;
}

- (PHRecentsItem)item
{
  return self->_item;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (id)callButtonTappedHandler
{
  return self->_callButtonTappedHandler;
}

- (BOOL)tapTargets
{
  return self->_tapTargets;
}

- (UILabel)callerCountLabel
{
  return self->_callerCountLabel;
}

- (UIDateLabel)callerDateLabel
{
  return self->_callerDateLabel;
}

- (UIImageView)callTypeIconView
{
  return self->_callTypeIconView;
}

- (int64_t)callerDateColumnIndex
{
  return self->_callerDateColumnIndex;
}

- (void)setCallerDateColumnIndex:(int64_t)a3
{
  self->_callerDateColumnIndex = a3;
}

- (BOOL)hasCallTypeIcon
{
  return self->_hasCallTypeIcon;
}

- (void)setHasCallTypeIcon:(BOOL)a3
{
  self->_hasCallTypeIcon = a3;
}

- (BOOL)isMissedCall
{
  return self->_isMissedCall;
}

- (void)setIsMissedCall:(BOOL)a3
{
  self->_isMissedCall = a3;
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UIView)callTypeIconSizingView
{
  return self->_callTypeIconSizingView;
}

- (void)setCallTypeIconSizingView:(id)a3
{
  objc_storeStrong((id *)&self->_callTypeIconSizingView, a3);
}

- (UIImageView)verifiedBadgeView
{
  return self->_verifiedBadgeView;
}

- (void)setVerifiedBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedBadgeView, a3);
}

- (UIImageView)outgoingIndicator
{
  return self->_outgoingIndicator;
}

- (NUIContainerStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_titleStackView, a3);
}

- (NUIContainerStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleStackView, a3);
}

- (NUIContainerGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
  objc_storeStrong((id *)&self->_gridView, a3);
}

- (TPAccessoryButton)callButton
{
  return self->_callButton;
}

- (void)setCallButton:(id)a3
{
  objc_storeStrong((id *)&self->_callButton, a3);
}

- (UIImage)callButtonImage
{
  return self->_callButtonImage;
}

- (void)setCallButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_callButtonImage, a3);
}

- (int64_t)maximumColumnsWithoutAccessibility
{
  return self->_maximumColumnsWithoutAccessibility;
}

- (void)setMaximumColumnsWithoutAccessibility:(int64_t)a3
{
  self->_maximumColumnsWithoutAccessibility = a3;
}

- (int64_t)maximumColumnsWithAccessibility
{
  return self->_maximumColumnsWithAccessibility;
}

- (void)setMaximumColumnsWithAccessibility:(int64_t)a3
{
  self->_maximumColumnsWithAccessibility = a3;
}

- (int64_t)callButtonColumnWithoutAccessibility
{
  return self->_callButtonColumnWithoutAccessibility;
}

- (void)setCallButtonColumnWithoutAccessibility:(int64_t)a3
{
  self->_callButtonColumnWithoutAccessibility = a3;
}

- (int64_t)callButtonColumnWithAccessibility
{
  return self->_callButtonColumnWithAccessibility;
}

- (void)setCallButtonColumnWithAccessibility:(int64_t)a3
{
  self->_callButtonColumnWithAccessibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callButtonImage, 0);
  objc_storeStrong((id *)&self->_callButton, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_outgoingIndicator, 0);
  objc_storeStrong((id *)&self->_verifiedBadgeView, 0);
  objc_storeStrong((id *)&self->_callTypeIconSizingView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_callTypeIconView, 0);
  objc_storeStrong((id *)&self->_callerDateLabel, 0);
  objc_storeStrong((id *)&self->_callerCountLabel, 0);
  objc_storeStrong(&self->_callButtonTappedHandler, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
