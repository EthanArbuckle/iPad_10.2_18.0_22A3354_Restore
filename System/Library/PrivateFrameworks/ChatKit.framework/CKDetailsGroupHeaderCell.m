@implementation CKDetailsGroupHeaderCell

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsGroupHeaderContactsCell_reuseIdentifier");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsGroupHeaderCell;
  -[CKDetailsCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (CKDetailsGroupHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 participants:(id)a5
{
  id v8;
  CKDetailsGroupHeaderCell *v9;
  CKDetailsGroupHeaderCell *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  uint64_t v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
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
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  uint64_t v80;
  CKDetailsAvatarPancakeView *v81;
  CKDetailsAvatarPancakeView *v82;
  double v83;
  double v84;
  void *v85;
  CKDetailsAvatarPancakeView *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  objc_super v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v101.receiver = self;
  v101.super_class = (Class)CKDetailsGroupHeaderCell;
  v9 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v101, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[CKDetailsGroupHeaderCell setSelectionStyle:](v9, "setSelectionStyle:", 2);
    v11 = objc_alloc(MEMORY[0x1E0CEA700]);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    -[CKDetailsGroupHeaderCell setTitleLabel:](v10, "setTitleLabel:", v16);

    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detailsGroupHeaderCellTitleFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v19);

    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "theme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "detailsContactCellTitleColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v23);

    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("GROUP_PEOPLE_COUNT"), &stru_1E276D870, CFSTR("ChatKit"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v28, objc_msgSend(v8, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceLayoutDirection");

    if (v31 == 1)
      v32 = CFSTR("\u200F");
    else
      v32 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v32, "stringByAppendingString:", v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setText:", v33);
    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setContentMode:", 4);

    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setNumberOfLines:", 0);

    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setLineBreakMode:", 0);

    v37 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v38 = MEMORY[0x1E0C9AA60];
    v39 = (void *)objc_msgSend(v37, "initWithArray:", MEMORY[0x1E0C9AA60]);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v38);
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v96 = v8;
    v41 = v8;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v98;
      v45 = MEMORY[0x1E0C9AA60];
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v98 != v44)
            objc_enumerationMutation(v41);
          v47 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          objc_msgSend(v47, "abbreviatedDisplayName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v48);

          objc_msgSend(v47, "defaultIMHandle");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "cnContactWithKeys:", v45);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97468]), "initWithContact:", v50);
          objc_msgSend(v40, "addObject:", v51);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
      }
      while (v43);
    }

    v52 = objc_msgSend(v40, "count");
    if (v52 >= 3)
      v53 = 3;
    else
      v53 = v52;
    objc_msgSend(v40, "subarrayWithRange:", 0, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsGroupHeaderCell setAvatarViews:](v10, "setAvatarViews:", v54);

    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v12, v13, v14, v15);
    -[CKDetailsGroupHeaderCell setSubTitleLabel:](v10, "setSubTitleLabel:", v55);

    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "detailsGroupHeaderCellSubtitleFont");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFont:", v58);

    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "theme");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "detailsContactCellSubTitleColor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setTextColor:", v62);

    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v64 = objc_msgSend(v39, "count");
    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v66 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v39, "valueForKey:", CFSTR("description"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "componentsJoinedByString:", CFSTR(", "));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringWithFormat:", CFSTR("%@"), v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setText:", v69);

    }
    else
    {
      CKFrameworkBundle();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("CONTACT_DETAILS_SUBTITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setText:", v68);
    }

    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setClipsToBounds:", 0);

    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setLineBreakMode:", 4);

    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setNumberOfLines:", 1);

    -[CKDetailsGroupHeaderCell configureCellIconForCollapsedState:](v10, "configureCellIconForCollapsedState:", 1);
    -[CKDetailsGroupHeaderCell avatarViews](v10, "avatarViews");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "count");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v74 == 3)
      objc_msgSend(v75, "detailsAvatarPancakeViewWidth3Avatars");
    else
      objc_msgSend(v75, "detailsAvatarPancakeViewWidth2Avatars");
    v78 = v77;

    -[CKDetailsGroupHeaderCell avatarViews](v10, "avatarViews");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "count");

    if (v80)
    {
      v81 = [CKDetailsAvatarPancakeView alloc];
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v82 = (CKDetailsAvatarPancakeView *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsAvatarPancakeView detailsAvatarCutoutDiameter](v82, "detailsAvatarCutoutDiameter");
      v84 = v83;
      -[CKDetailsGroupHeaderCell avatarViews](v10, "avatarViews");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = -[CKDetailsAvatarPancakeView initWithSize:avatarViews:](v81, "initWithSize:avatarViews:", v85, v78, v84);
      -[CKDetailsGroupHeaderCell setAvatarView:](v10, "setAvatarView:", v86);

    }
    else
    {
      v82 = objc_alloc_init(CKDetailsAvatarPancakeView);
      -[CKDetailsGroupHeaderCell setAvatarView:](v10, "setAvatarView:", v82);
    }
    v8 = v96;

    -[CKDetailsGroupHeaderCell avatarView](v10, "avatarView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CKDetailsGroupHeaderCell contentView](v10, "contentView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsGroupHeaderCell titleLabel](v10, "titleLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addSubview:", v89);

    -[CKDetailsGroupHeaderCell contentView](v10, "contentView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsGroupHeaderCell subTitleLabel](v10, "subTitleLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addSubview:", v91);

    -[CKDetailsGroupHeaderCell contentView](v10, "contentView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsGroupHeaderCell avatarView](v10, "avatarView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addSubview:", v93);

    -[CKDetailsGroupHeaderCell contentView](v10, "contentView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setBackgroundColor:", 0);

    -[CKDetailsGroupHeaderCell addConstraints](v10, "addConstraints");
  }

  return v10;
}

- (double)_additionalHeightToAccommodateInterTextVerticalSpacing
{
  void *v3;
  char v4;
  double result;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessibilityPreferredContentSizeCategory");

  result = 0.0;
  if ((v4 & 1) == 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailsGroupHeaderCellInterTextVerticalSpacing");
    v8 = v7;
    -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointSize");
    v12 = v8 + v11 * 0.5;

    -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_scaledValueForValue:useLanguageAwareScaling:", 1, v12);
    v16 = v15;

    v17 = v16 - v12;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "detailsGroupHeaderCellInterTextVerticalSpacing");
    v20 = v19;
    -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pointSize");
    v24 = v20 + v23 * 0.5;

    -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_scaledValueForValue:useLanguageAwareScaling:", 1, v24);
    v28 = v27;

    return v17 + v28 - v24;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAccessibilityPreferredContentSizeCategory");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "detailsAvatarCutoutDiameter");
    v11 = v10;

    -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeThatFits:", width, height);
    v14 = v13;

    -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeThatFits:", width, height);
    v17 = v16;

    -[CKDetailsGroupHeaderCell layoutMargins](self, "layoutMargins");
    v19 = v18;
    -[CKDetailsGroupHeaderCell layoutMargins](self, "layoutMargins");
    v21 = v11 + v14 + v17 + v19 + v20;
  }
  else
  {
    objc_msgSend(v8, "detailsContactCellMinimumHeight");
    v21 = v22;

  }
  -[CKDetailsGroupHeaderCell _additionalHeightToAccommodateInterTextVerticalSpacing](self, "_additionalHeightToAccommodateInterTextVerticalSpacing");
  v24 = v21 + v23;
  v25 = width;
  result.height = v24;
  result.width = v25;
  return result;
}

- (void)addConstraints
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
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
  void *v35;
  void *v36;
  _QWORD v37[7];

  v37[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell avatarViews](self, "avatarViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 >= 3)
    objc_msgSend(v5, "detailsAvatarPancakeViewWidth3Avatars");
  else
    objc_msgSend(v5, "detailsAvatarPancakeViewWidth2Avatars");
  v8 = v7;

  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "detailsAvatarCutoutDiameter");
  objc_msgSend(v30, "constraintEqualToConstant:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v29;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pointSize");
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v24;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v10;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutMargins");
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v18);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v19, "isAccessibilityPreferredContentSizeCategory");

  if ((_DWORD)v11)
    -[CKDetailsGroupHeaderCell constraintsForAccessibility](self, "constraintsForAccessibility");
  else
    -[CKDetailsGroupHeaderCell standardConstraints](self, "standardConstraints");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v36);
}

- (id)constraintsForAccessibility
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v18;
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
  _QWORD v49[9];

  v49[7] = *MEMORY[0x1E0C80C00];
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutMargins");
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v43;
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutMargins");
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v38, v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v37;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutMargins");
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v32, v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v31;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v26;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutMargins");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v21, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v20;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v9;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutMargins");
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 7);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)standardConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  id v37;
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
  _QWORD v68[9];

  v68[7] = *MEMORY[0x1E0C80C00];
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsGroupHeaderCellInterTextVerticalSpacing");
  v7 = v6;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pointSize");
  objc_msgSend(v4, "_scaledValueForValue:useLanguageAwareScaling:", 1, v7 + v10 * 0.5);
  v12 = v11;

  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detailsGroupHeaderCellInterTextVerticalSpacing");
  v17 = v16;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pointSize");
  objc_msgSend(v14, "_scaledValueForValue:useLanguageAwareScaling:", 1, v17 + v20 * 0.5);
  v22 = v21;

  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v62;
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "centerYAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "layoutMarginsGuide");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "centerYAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v56;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "detailsGroupHeaderCellAvatarViewRightMargin");
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v50;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, -v12);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v68[3] = v45;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v68[4] = v40;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v24, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[5] = v25;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutMargins");
  v32 = v31;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "detailsGroupHeaderCellSubtitleViewRightMargin");
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -(v32 + v34));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v68[6] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 7);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)standardWolfConstraints
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
  id v14;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[9];

  v43[7] = *MEMORY[0x1E0C80C00];
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutMarginsGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v37;
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutMarginsGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v31;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell avatarView](self, "avatarView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "detailsGroupHeaderCellAvatarViewRightMargin");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v25;
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v20;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v15;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v7;
  -[CKDetailsGroupHeaderCell subTitleLabel](self, "subTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsGroupHeaderCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)configureCellIconForCollapsedState:(BOOL)a3
{
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
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    objc_msgSend(v5, "detailsGroupHeaderCellChevronForwardName");
  else
    objc_msgSend(v5, "detailsGroupHeaderCellChevronDownName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA650];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailsGroupHeaderCellChevronFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationWithFont:scale:", v10, objc_msgSend(v11, "detailsGroupChevronImageScale"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithConfiguration:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CEA650];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "theme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "detailsGroupHeaderCellChevronColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configurationWithPaletteColors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageByApplyingSymbolConfiguration:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v21);
  -[CKDetailsGroupHeaderCell setAccessoryView:](self, "setAccessoryView:", v22);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsGroupHeaderCell;
  -[CKDetailsCell layoutSubviews](&v4, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleLabel, a3);
}

- (NSArray)avatarViews
{
  return self->_avatarViews;
}

- (void)setAvatarViews:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViews, a3);
}

- (CKDetailsAvatarPancakeView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarViews, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
