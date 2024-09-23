@implementation MFRecipientTableViewCell

+ (id)identifier
{
  return CFSTR("MFRecipientTableViewCellIdentifier");
}

+ (id)cellForRecipient:(id)a3
{
  id v3;
  MFRecipientTableViewCell *v4;
  void *v5;
  MFRecipientTableViewCell *v6;

  v3 = a3;
  v4 = [MFRecipientTableViewCell alloc];
  +[MFRecipientTableViewCell identifier](MFRecipientTableViewCell, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFRecipientTableViewCell initWithStyle:reuseIdentifier:](v4, "initWithStyle:reuseIdentifier:", 0, v5);

  if (v6)
    -[MFRecipientTableViewCell setRecipient:](v6, "setRecipient:", v3);

  return v6;
}

- (MFRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MFRecipientTableViewCell *v4;
  int v5;
  UILabel *v6;
  uint64_t v7;
  UILabel *detailLabel;
  double v9;
  double v10;
  void *v11;
  UILabel *v12;
  UILabel *titleLabel;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MFRecipientTableViewCell;
  v4 = -[MFRecipientTableViewCell initWithStyle:reuseIdentifier:](&v20, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad");
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = v5 ^ 1u;
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v6;

    -[UILabel setOpaque:](v4->_detailLabel, "setOpaque:", v7);
    LODWORD(v9) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_detailLabel, "setContentHuggingPriority:forAxis:", 1, v9);
    LODWORD(v10) = 1112014848;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_detailLabel, "setContentHuggingPriority:forAxis:", 0, v10);
    -[MFRecipientTableViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_detailLabel);

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    -[UILabel setOpaque:](v4->_titleLabel, "setOpaque:", v7);
    LODWORD(v14) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v14);
    LODWORD(v15) = 1112014848;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v15);
    -[MFRecipientTableViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_titleLabel);

    if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge())
    {
      -[UILabel setNumberOfLines:](v4->_detailLabel, "setNumberOfLines:", 0);
      LODWORD(v17) = 1.0;
      -[UILabel _setHyphenationFactor:](v4->_detailLabel, "_setHyphenationFactor:", v17);
      -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
      LODWORD(v18) = 1.0;
      -[UILabel _setHyphenationFactor:](v4->_titleLabel, "_setHyphenationFactor:", v18);
    }
    -[MFRecipientTableViewCell setOpaque:](v4, "setOpaque:", v7);
    -[MFRecipientTableViewCell setShouldHighlightCompleteMatches:](v4, "setShouldHighlightCompleteMatches:", 1);
    -[MFRecipientTableViewCell setShouldDimIrrelevantInformation:](v4, "setShouldDimIrrelevantInformation:", 1);
    v4->_shouldHideDetailLabel = 0;
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v4;
}

- (void)updateActiveConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
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
  id v69;
  id v70;
  id v71;

  -[MFRecipientTableViewCell activeConstraints](self, "activeConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[MFRecipientTableViewCell activeConstraints](self, "activeConstraints");
    v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:");

  }
  if (-[MFRecipientTableViewCell accessoryType](self, "accessoryType") == 4)
  {
    objc_msgSend((id)objc_opt_class(), "_realDetailButtonAccessoryMargin");
    v6 = v5 + 0.0;
  }
  else if (-[MFRecipientTableViewCell accessoryType](self, "accessoryType") == 1)
  {
    v6 = 16.0;
  }
  else
  {
    v6 = 0.0;
  }
  v7 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v70 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "_bodyLeading");
  v9 = v8;
  -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ascender");
  v13 = v12;
  -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "capHeight");
  v17 = v16;

  v18 = (void *)objc_opt_class();
  -[MFRecipientTableViewCell bounds](self, "bounds");
  objc_msgSend(v18, "_constrainedWidthForTitleViewWithAccessoryWidth:containerWidth:", v6, v19);
  v21 = v20;
  v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFRecipientTableViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, round(-(v13 - v17 - v9 * 0.6)));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addObject:", v26);

  -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFRecipientTableViewCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFRecipientTableViewCell separatorInset](self, "separatorInset");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addObject:", v32);

  -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addObject:", v35);

  v36 = (void *)objc_opt_class();
  -[MFRecipientTableViewCell bounds](self, "bounds");
  objc_msgSend(v36, "_constrainedWidthForDetailViewWithAccessoryWidth:containerWidth:", v6, v37);
  v39 = v38;
  -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "font");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "descender");
  v43 = v42;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_bodyLeading");
  v46 = v45;

  -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v40) = objc_msgSend(v47, "isHidden");
  v48 = round(v43 + v46 * 0.6);

  if ((_DWORD)v40)
  {
    -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRecipientTableViewCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, -v48);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v53);

  }
  else
  {
    -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, 0.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v58);

    -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v63);

    -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFRecipientTableViewCell contentView](self, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v67, -v48);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v68);

    -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToConstant:", v39);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObject:", v51);
  }

  -[MFRecipientTableViewCell setActiveConstraints:](self, "setActiveConstraints:", v71);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v71);

}

+ (double)_deviceSpecificLayoutMargin
{
  void *v2;
  void *v3;
  double v4;
  CGRect v6;

  if (_deviceSpecificLayoutMargin_onceToken != -1)
    dispatch_once(&_deviceSpecificLayoutMargin_onceToken, &__block_literal_global_31);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (_deviceSpecificLayoutMargin_wantsWideContentMargins)
  {
    objc_msgSend(v2, "bounds");
    if (CGRectGetWidth(v6) <= 320.0)
      v4 = 16.0;
    else
      v4 = 20.0;
  }
  else
  {
    v4 = 15.0;
  }

  return v4;
}

void __55__MFRecipientTableViewCell__deviceSpecificLayoutMargin__block_invoke()
{
  const __CFBoolean *v0;
  uint64_t v1;
  const __CFBoolean *v2;
  int Value;
  BOOL v4;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  v1 = MGCopyAnswer();
  v2 = (const __CFBoolean *)v1;
  if (v0)
  {
    Value = CFBooleanGetValue(v0);
    v4 = 0;
    if (Value)
    {
      if (v2)
        v4 = CFBooleanGetValue(v2) != 0;
    }
    _deviceSpecificLayoutMargin_wantsWideContentMargins = v4;
    CFRelease(v0);
    if (v2)
      goto LABEL_6;
  }
  else
  {
    _deviceSpecificLayoutMargin_wantsWideContentMargins = 0;
    if (v1)
LABEL_6:
      CFRelease(v2);
  }
}

+ (double)_constrainedWidthForTitleViewWithAccessoryWidth:(double)a3 containerWidth:(double)a4
{
  double v6;

  objc_msgSend(a1, "_deviceSpecificLayoutMargin");
  return a4 + v6 * -2.0 - a3;
}

+ (double)_constrainedWidthForDetailViewWithAccessoryWidth:(double)a3 containerWidth:(double)a4
{
  double v6;

  objc_msgSend(a1, "_deviceSpecificLayoutMargin");
  return a4 + v6 * -2.0 - a3;
}

+ (double)_realDetailButtonAccessoryMargin
{
  if (_realDetailButtonAccessoryMargin_onceToken != -1)
    dispatch_once(&_realDetailButtonAccessoryMargin_onceToken, &__block_literal_global_26);
  return *(double *)&_realDetailButtonAccessoryMargin_realAccessoryMargin + 4.0;
}

void __60__MFRecipientTableViewCell__realDetailButtonAccessoryMargin__block_invoke()
{
  void *v0;
  double MaxX;
  double Width;
  id v3;
  CGRect v4;
  CGRect v5;
  CGRect v6;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v3, "setAccessoryType:", 4);
  objc_msgSend(v3, "layoutSubviews");
  objc_msgSend(v3, "_defaultAccessoryView");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_shouldReverseLayoutDirection") & 1) != 0)
  {
    objc_msgSend(v0, "frame");
    MaxX = CGRectGetMaxX(v4);
  }
  else
  {
    objc_msgSend(v3, "frame");
    Width = CGRectGetWidth(v5);
    objc_msgSend(v0, "frame");
    MaxX = Width - CGRectGetMinX(v6);
  }
  _realDetailButtonAccessoryMargin_realAccessoryMargin = *(_QWORD *)&MaxX;

}

+ (id)_attributedStringRepresentationOfCompleteMatchesForRecipient:(id)a3 constrainedToWidth:(double)a4 overflowRecipients:(id *)a5 useHighlighting:(BOOL)a6
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t i;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  __CFString *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  _BOOL4 v75;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  id v81;
  id obj;
  id obja;
  void *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  id v95;
  _BYTE v96[128];
  uint64_t v97;

  v79 = a6;
  v97 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  objc_msgSend(v81, "displayString");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v81, "isGroup") & 1) == 0 && (!v80 || !objc_msgSend(v80, "length")))
  {
    objc_msgSend(v81, "placeholderName");
    v7 = objc_claimAutoreleasedReturnValue();

    v80 = (void *)v7;
  }
  if (objc_msgSend(v81, "isGroup") && (objc_msgSend(v81, "wasCompleteMatch") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RECENT_GROUP"), &stru_1E5A6A588, CFSTR("Main"));
    v9 = objc_claimAutoreleasedReturnValue();

    v80 = (void *)v9;
  }
  if (v79)
    objc_msgSend((id)objc_opt_class(), "defaultTitleStringAttributes");
  else
    objc_msgSend((id)objc_opt_class(), "highlightedTitleStringAttributes");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v80, v77);
  else
    v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v11 = v10;
  if (objc_msgSend(v81, "isGroup") && objc_msgSend(v81, "wasCompleteMatch"))
  {
    objc_msgSend(v81, "childrenWithCompleteMatches");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v12;
    objc_msgSend(v81, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") == 2)
    {
      objc_msgSend(v81, "children");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      v75 = v15 - objc_msgSend(v12, "count") == 1;

    }
    else
    {
      v75 = 0;
    }

    v16 = (unint64_t)objc_msgSend(v12, "count") > 1 || v75;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    MFLocalizedAddressSeparator();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "highlightedTitleStringAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeWithAttributes:", v18);
    v20 = v19;

    v21 = 0;
    v22 = 0;
    v23 = 0.0;
    while (v22 < objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _displayNameForRecipient(v24, v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "highlightedTitleStringAttributes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sizeWithAttributes:", v26);
      v28 = v27;

      v23 = v23 + v20 + v28;
      if (a4 <= 0.0 || v23 <= a4)
      {
        objc_msgSend(v84, "addObject:", v25);
      }
      else
      {
        v29 = v21;
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v21 = v29;
        objc_msgSend(v29, "addObject:", v24);
      }

      ++v22;
    }
    if (objc_msgSend(v21, "count"))
      *a5 = objc_retainAutorelease(v21);
    if (objc_msgSend(v84, "count"))
    {
      if (objc_msgSend(v84, "count") != 2
        || (v30 = objc_msgSend(v84, "count"),
            objc_msgSend(v81, "children"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = objc_msgSend(v31, "count"),
            v31,
            v30 != v32))
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        obj = (id)objc_claimAutoreleasedReturnValue();
        for (i = 0; objc_msgSend(v84, "count") > i; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (i)
            objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("GROUP_NON_FINAL_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
          else
            objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("GROUP_INITIAL_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v84, "objectAtIndexedSubscript:", i);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "appendFormat:", v40, v41);

        }
        v42 = objc_msgSend(v84, "count");
        objc_msgSend(v81, "children");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

        if (v42 < v44)
        {
          MFLocalizedAddressSeparator();
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_48;
        }
LABEL_47:
        v45 = &stru_1E5A6A588;
LABEL_48:
        if (v75)
        {
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          objc_msgSend(v81, "children");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
          if (v47)
          {
            v48 = 0;
            v49 = *(_QWORD *)v91;
LABEL_51:
            v50 = 0;
            v51 = v48;
            while (1)
            {
              if (*(_QWORD *)v91 != v49)
                objc_enumerationMutation(v46);
              v48 = *(id *)(*((_QWORD *)&v90 + 1) + 8 * v50);

              if ((objc_msgSend(v78, "containsObject:", v48) & 1) == 0)
                break;
              ++v50;
              v51 = v48;
              if (v47 == v50)
              {
                v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                if (v47)
                  goto LABEL_51;
                break;
              }
            }

            if (!v48)
              goto LABEL_66;
            _displayNameForRecipient(v48, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "sizeWithAttributes:", v77);
            if (v23 + v53 >= a4)
            {
              if (v21)
              {
                objc_msgSend(v21, "addObject:", v48);
              }
              else
              {
                v95 = v48;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("SHORT_BINARY_RECIPIENT_SEPARATOR"), &stru_1E5A6A588, CFSTR("Main"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v55, obj, v52);
              v56 = objc_claimAutoreleasedReturnValue();

              v45 = &stru_1E5A6A588;
              obj = (id)v56;
            }

          }
          else
          {
            v48 = v46;
          }

        }
LABEL_66:
        objc_msgSend(obj, "stringByAppendingString:", v45);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v57, v77);
        objc_msgSend(v11, "setAttributedString:", v58);

        goto LABEL_67;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SHORT_BINARY_RECIPIENT_SEPARATOR"), &stru_1E5A6A588, CFSTR("Main"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v84, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", v34, v36, v37);
      obj = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("RECENT_GROUP"), &stru_1E5A6A588, CFSTR("Main"));
      obj = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_47;
  }
LABEL_67:
  if (v79)
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v81, "completelyMatchedAttributedStrings");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    if (v59)
    {
      v85 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v87 != v85)
            objc_enumerationMutation(obja);
          v61 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_msgSend(v11, "string");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "string");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v62, "rangeOfString:", v63);
          v66 = v65;

          while (v64 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend((id)objc_opt_class(), "highlightedTitleStringAttributes");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addAttributes:range:", v67, v64, v66);

            objc_msgSend(v11, "string");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "length");

            objc_msgSend(v11, "string");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "string");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v70, "rangeOfString:options:range:", v71, 0, v64 + 1, v69 + ~v64);
            v66 = v72;

          }
        }
        v59 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      }
      while (v59);
    }
    v73 = obja;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "regularTitleStringAttributes");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributes:range:", v73, 0, objc_msgSend(v11, "length"));
  }

  return v11;
}

+ (id)_copyAttributedStringRepresentationOfGroupRecipient:(id)a3 withSortedRecipientList:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v35 = v5;
  v36 = v6;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v5, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "count");

    }
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "children");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        _displayNameForRecipient(*(void **)(*((_QWORD *)&v37 + 1) + 8 * i), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v12);
  }

  if ((unint64_t)objc_msgSend(v10, "count") >= 8)
  {
    v16 = objc_msgSend(v10, "count") - 7;
    objc_msgSend(v10, "removeObjectsInRange:", 7, v16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("N_MORE"), &stru_1E5A6A588, CFSTR("Main"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v20, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v21);

  }
  v22 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("GROUP_FINAL_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "mutableString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendFormat:", v24, v26);

  }
  else
  {
    for (j = 0; objc_msgSend(v10, "count") > j; ++j)
    {
      if (j)
      {
        if (objc_msgSend(v10, "count") - 1 <= j)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("GROUP_FINAL_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("GROUP_NON_FINAL_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
        }
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("GROUP_INITIAL_ITEM"), &stru_1E5A6A588, CFSTR("Main"));
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v32 = (void *)v31;

      objc_msgSend(v22, "mutableString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", j);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "appendFormat:", v32, v34);

    }
  }
  objc_msgSend((id)objc_opt_class(), "groupDetailStringAttributes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAttributes:range:", v27, 0, objc_msgSend(v22, "length"));

  return v22;
}

+ (id)_attributedStringRepresentationOfPartialEmailMatchForSingleRecipient:(id)a3 useHighlighting:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "isGroup") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v5, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultDetailStringAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v9);

    if (v4)
    {
      objc_msgSend(v5, "originContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "searchTerm");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(v6, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "rangeOfString:", v11);
        v15 = v14;

        if (!v13)
        {
          objc_msgSend((id)objc_opt_class(), "highlightedDetailStringAttributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setAttributes:range:", v16, 0, v15);

        }
      }

    }
  }

  return v6;
}

+ (id)_tintedAttributedString:(id)a3 toColor:(id)a4 shouldDim:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  CGColorSpace *ColorSpace;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  v10 = v9;
  if (v5)
  {
    v11 = objc_retainAutorelease(v8);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v11, "CGColor"));
    if (CGColorSpaceGetModel(ColorSpace))
    {
      v25 = NAN;
      v26 = NAN;
      v23 = NAN;
      v24 = NAN;
      objc_msgSend(v11, "getHue:saturation:brightness:alpha:", &v25, &v24, &v23, &v26);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v25, v24 * 0.5, v23 * 0.75, v26);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.44);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v13;
    v16 = objc_msgSend(v7, "length");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__MFRecipientTableViewCell__tintedAttributedString_toColor_shouldDim___block_invoke;
    v19[3] = &unk_1E5A69B60;
    v20 = v11;
    v17 = v15;
    v21 = v17;
    v22 = v10;
    objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v16, 0x100000, v19);

  }
  else
  {
    v14 = objc_msgSend(v9, "length");
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v8, 0, v14);
  }

  return v10;
}

void __70__MFRecipientTableViewCell__tintedAttributedString_toColor_shouldDim___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  __CFString *v7;
  __CFString *v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectForKey:", CFSTR("mf_tintType"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7 == CFSTR("mf_ttstrong"))
  {
    v10 = a1 + 4;
  }
  else
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("mf_tintType"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v8 != CFSTR("mf_ttdimmed"))
    {
      v9 = 0;
      goto LABEL_8;
    }
    v10 = a1 + 5;
  }
  v9 = *v10;
  if (v9)
  {
    v11 = *MEMORY[0x1E0DC1140];
    objc_msgSend(a1[6], "removeAttribute:range:", *MEMORY[0x1E0DC1140], a3, a4);
    objc_msgSend(a1[6], "addAttribute:value:range:", v11, v9, a3, a4);
  }
LABEL_8:

}

- (id)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  MFComposeRecipient *v5;
  MFComposeRecipient *v6;
  id *p_recipient;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v19;
  BOOL v20;
  BOOL v21;
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
  BOOL v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = (MFComposeRecipient *)a3;
  v6 = v5;
  if (v5)
  {
    p_recipient = (id *)&self->_recipient;
    if (self->_recipient != v5)
    {
      objc_storeStrong((id *)&self->_recipient, a3);
      self->_shouldHideDetailLabel = 0;
      -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;

      v11 = (void *)objc_opt_class();
      v12 = *p_recipient;
      v64 = 0;
      objc_msgSend(v11, "_attributedStringRepresentationOfCompleteMatchesForRecipient:constrainedToWidth:overflowRecipients:useHighlighting:", v12, &v64, -[MFRecipientTableViewCell shouldHighlightCompleteMatches](self, "shouldHighlightCompleteMatches"), v10);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v64;
      -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFRecipientTableViewCell tintColor](self, "tintColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFRecipientTableViewCell _tintedAttributedString:toColor:shouldDim:](MFRecipientTableViewCell, "_tintedAttributedString:toColor:shouldDim:", v58, v14, self->_shouldDimIrrelevantInformation);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAttributedText:", v15);

      if (-[MFComposeRecipient isGroup](v6, "isGroup"))
      {
        -[MFComposeRecipient childrenWithCompleteMatches](v6, "childrenWithCompleteMatches");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        self->_shouldHideDetailLabel = objc_msgSend(v16, "count") != 0;

        -[MFComposeRecipient children](v6, "children");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (unint64_t)objc_msgSend(v17, "count") < 3 && self->_shouldHideDetailLabel;
        self->_shouldHideDetailLabel = v19;

        if (objc_msgSend(v59, "count"))
          v20 = 1;
        else
          v20 = !self->_shouldHideDetailLabel;
        v21 = !v20;
        self->_shouldHideDetailLabel = v21;
        -[MFComposeRecipient childrenWithCompleteMatches](v6, "childrenWithCompleteMatches");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v59, "count"))
        {
          objc_msgSend(v22, "arrayByExcludingObjectsInArray:", v59);
          v23 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v23;
        }
        -[MFComposeRecipient sortedChildren](v6, "sortedChildren");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrayByExcludingObjectsInArray:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)objc_msgSend((id)objc_opt_class(), "_copyAttributedStringRepresentationOfGroupRecipient:withSortedRecipientList:", v6, v25);
        -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFRecipientTableViewCell tintColor](self, "tintColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFRecipientTableViewCell _tintedAttributedString:toColor:shouldDim:](MFRecipientTableViewCell, "_tintedAttributedString:toColor:shouldDim:", v26, v28, self->_shouldDimIrrelevantInformation);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAttributedText:", v29);

        -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setNumberOfLines:", 0);

        goto LABEL_41;
      }
      -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHidden:", 0);

      -[MFComposeRecipient address](v6, "address");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "length"))
      {
        v33 = -[MFComposeRecipient kind](v6, "kind") == 4;

        if (!v33)
        {
          if (-[MFRecipientTableViewCell shouldHighlightCompleteMatches](self, "shouldHighlightCompleteMatches"))
          {
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            objc_msgSend(*p_recipient, "completelyMatchedAttributedStrings");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
            if (v35)
            {
              obj = v34;
              v36 = *(_QWORD *)v61;
              while (2)
              {
                for (i = 0; i != v35; ++i)
                {
                  if (*(_QWORD *)v61 != v36)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "attributesAtIndex:effectiveRange:", 0, 0);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "objectForKey:", CFSTR("MFComposeRecipientStringMatchType"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("MFComposeRecipientStringMatchAddress"));

                  if ((v40 & 1) == 0)
                  {
                    v41 = 0;
                    goto LABEL_35;
                  }
                }
                v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
                if (v35)
                  continue;
                break;
              }
              v41 = 1;
LABEL_35:
              v34 = obj;
            }
            else
            {
              v41 = 1;
            }

          }
          else
          {
            v41 = 0;
          }
          -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setNumberOfLines:", !MFModernUIApplicationPreferredContentSizeIsLargerThanLarge());

          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E5A6A588);
          -[MFComposeRecipient label](v6, "label");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "length");

          if (v46)
          {
            v47 = objc_alloc(MEMORY[0x1E0CB3498]);
            -[MFComposeRecipient label](v6, "label");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "labelDetailStringAttributes");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (void *)objc_msgSend(v47, "initWithString:attributes:", v48, v49);

            -[MFRecipientTableViewCell tintColor](self, "tintColor");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[MFRecipientTableViewCell _tintedAttributedString:toColor:shouldDim:](MFRecipientTableViewCell, "_tintedAttributedString:toColor:shouldDim:", v50, v51, self->_shouldDimIrrelevantInformation);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "appendAttributedString:", v52);

            v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("  "));
            objc_msgSend(v22, "appendAttributedString:", v53);

          }
          objc_msgSend((id)objc_opt_class(), "_attributedStringRepresentationOfPartialEmailMatchForSingleRecipient:useHighlighting:", v6, v41);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFRecipientTableViewCell tintColor](self, "tintColor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFRecipientTableViewCell _tintedAttributedString:toColor:shouldDim:](MFRecipientTableViewCell, "_tintedAttributedString:toColor:shouldDim:", v25, v54, self->_shouldDimIrrelevantInformation);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "appendAttributedString:", v55);

          -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAttributedText:", v22);
LABEL_41:

          if (!self->_shouldHideDetailLabel)
          {
            -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setHidden:", 0);
            goto LABEL_44;
          }
LABEL_42:
          -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setHidden:", 1);
LABEL_44:

          -[MFRecipientTableViewCell updateActiveConstraints](self, "updateActiveConstraints");
          goto LABEL_45;
        }
      }
      else
      {

      }
      -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E5A6A588);
      objc_msgSend(v42, "setAttributedText:", v43);

      self->_shouldHideDetailLabel = 1;
      goto LABEL_42;
    }
  }
LABEL_45:

}

+ (double)height
{
  double result;

  +[MFRecipientTableViewCell heightWithRecipient:width:](MFRecipientTableViewCell, "heightWithRecipient:width:", 0, 0.0);
  return result;
}

+ (double)heightWithRecipient:(id)a3 width:(double)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v29;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultTitleStringAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC1138]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "capHeight");

  objc_msgSend((id)objc_opt_class(), "defaultDetailStringAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "capHeight");

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cachedFloat:forKey:", &__block_literal_global_58, CFSTR("MFRecipientTableViewCellSpaceBtwnTitleAndDetail"));

  v12 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_bodyLeading");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_bodyLeading");

  if (v5 && objc_msgSend(v5, "isGroup"))
  {
    objc_msgSend(v5, "sortedChildren");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "childrenWithCompleteMatches");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(a1, "_realDetailButtonAccessoryMargin");
      objc_msgSend(a1, "_constrainedWidthForTitleViewWithAccessoryWidth:containerWidth:");
      v29 = 0;
      v17 = (id)objc_msgSend(a1, "_attributedStringRepresentationOfCompleteMatchesForRecipient:constrainedToWidth:overflowRecipients:useHighlighting:", v5, &v29, 0);
      v18 = v29;
      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v16, "arrayByExcludingObjectsInArray:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v19;
      }
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v15, "arrayByExcludingObjectsInArray:", v16);
        v20 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v20;
      }

    }
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(a1, "_realDetailButtonAccessoryMargin");
      objc_msgSend(a1, "_constrainedWidthForDetailViewWithAccessoryWidth:containerWidth:");
      v22 = v21;
      v23 = (void *)objc_msgSend(a1, "_copyAttributedStringRepresentationOfGroupRecipient:withSortedRecipientList:", v5, v15);
      objc_msgSend(v23, "boundingRectWithSize:options:context:", 1, 0, v22, 1.79769313e308);
      objc_msgSend(v23, "attribute:atIndex:effectiveRange:", v7, 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lineHeight");

    }
  }
  objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v27 = v26;

  return v27;
}

double __54__MFRecipientTableViewCell_heightWithRecipient_width___block_invoke()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_bodyLeading");
  v2 = v1 * 0.475;

  return v2;
}

- (void)setOpaque:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFRecipientTableViewCell;
  -[MFRecipientTableViewCell setOpaque:](&v8, sel_setOpaque_);
  if (a3)
    -[MFRecipientTableViewCell backgroundColor](self, "backgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);
  -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFRecipientTableViewCell;
  -[MFRecipientTableViewCell setBackgroundColor:](&v9, sel_setBackgroundColor_, v4);
  if (-[MFRecipientTableViewCell isOpaque](self, "isOpaque"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);
  -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v6);

}

+ (id)_defaultTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "mailComposeSuggestionsListTintColor");
}

- (id)tintColor
{
  UIColor *tintColor;
  UIColor *v4;
  UIColor *v5;

  tintColor = self->_tintColor;
  if (!tintColor)
  {
    +[MFRecipientTableViewCell _defaultTintColor](MFRecipientTableViewCell, "_defaultTintColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }
  return tintColor;
}

- (void)setTintColor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIColor *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD aBlock[5];

  v4 = a4;
  v7 = (UIColor *)a3;
  if (v7 && self->_tintColor != v7)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke;
    aBlock[3] = &unk_1E5A65480;
    aBlock[4] = self;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke_2;
    v13[3] = &unk_1E5A65480;
    v13[4] = self;
    v10 = (void (**)(_QWORD))_Block_copy(v13);
    if (v4)
    {
      -[MFRecipientTableViewCell titleLabel](self, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFRecipientTableViewCell animateSnapshotOfLabel:withBlock:](self, "animateSnapshotOfLabel:withBlock:", v11, v9);

      -[MFRecipientTableViewCell detailLabel](self, "detailLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFRecipientTableViewCell animateSnapshotOfLabel:withBlock:](self, "animateSnapshotOfLabel:withBlock:", v12, v10);

    }
    else
    {
      v9[2](v9);
      v10[2](v10);
    }

  }
}

void __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFRecipientTableViewCell _tintedAttributedString:toColor:shouldDim:](MFRecipientTableViewCell, "_tintedAttributedString:toColor:shouldDim:", v2, v3, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1042));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

void __50__MFRecipientTableViewCell_setTintColor_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "detailLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFRecipientTableViewCell _tintedAttributedString:toColor:shouldDim:](MFRecipientTableViewCell, "_tintedAttributedString:toColor:shouldDim:", v2, v3, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1042));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "detailLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (void)animateSnapshotOfLabel:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_alloc(MEMORY[0x1E0DC3C88]);
  objc_msgSend(v6, "frame");
  v9 = (void *)objc_msgSend(v8, "initWithFrame:");
  objc_msgSend(v9, "captureSnapshotOfView:withSnapshotType:", v6, 1);
  -[MFRecipientTableViewCell addSubview:](self, "addSubview:", v9);
  objc_msgSend(v6, "setAlpha:", 0.0);
  v7[2](v7);
  v10 = (void *)MEMORY[0x1E0DC3F10];
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke;
  v16[3] = &unk_1E5A65430;
  v17 = v9;
  v12 = v6;
  v18 = v12;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke_2;
  v14[3] = &unk_1E5A66750;
  v13 = v17;
  v15 = v13;
  objc_msgSend(v10, "animateWithDuration:animations:completion:", v16, v14, 0.3);

}

uint64_t __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __61__MFRecipientTableViewCell_animateSnapshotOfLabel_withBlock___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  return result;
}

+ (id)defaultTitleStringAttributes
{
  void *v2;
  void *v3;

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("defaultTitle"), &__block_literal_global_73);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __56__MFRecipientTableViewCell_defaultTitleStringAttributes__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge())
    v1 = 0;
  else
    v1 = 4;
  objc_msgSend(v0, "setLineBreakMode:", v1);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC1138];
  v7[0] = CFSTR("mf_tintType");
  v7[1] = v4;
  v8[0] = CFSTR("mf_ttdimmed");
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E0DC1178];
  v8[2] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)regularTitleStringAttributes
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__MFRecipientTableViewCell_regularTitleStringAttributes__block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v6[4] = a1;
  objc_msgSend(v3, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("regularTitle"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __56__MFRecipientTableViewCell_regularTitleStringAttributes__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "defaultTitleStringAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "setObject:forKey:", CFSTR("mf_ttstrong"), CFSTR("mf_tintType"));
  return v1;
}

+ (id)highlightedTitleStringAttributes
{
  void *v2;
  void *v3;

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("emphasizedTitle"), &__block_literal_global_81);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __60__MFRecipientTableViewCell_highlightedTitleStringAttributes__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge())
    v1 = 0;
  else
    v1 = 4;
  objc_msgSend(v0, "setLineBreakMode:", v1);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32770, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC1138];
  v7[0] = CFSTR("mf_tintType");
  v7[1] = v4;
  v8[0] = CFSTR("mf_ttstrong");
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E0DC1178];
  v8[2] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultDetailStringAttributes
{
  void *v2;
  void *v3;

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("detailDefault"), &__block_literal_global_84);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __57__MFRecipientTableViewCell_defaultDetailStringAttributes__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  if (MFModernUIApplicationPreferredContentSizeIsLargerThanLarge())
    v1 = 0;
  else
    v1 = 4;
  objc_msgSend(v0, "setLineBreakMode:", v1);
  _baseDetailAttributes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v0, *MEMORY[0x1E0DC1178]);
  return v3;
}

+ (id)highlightedDetailStringAttributes
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__MFRecipientTableViewCell_highlightedDetailStringAttributes__block_invoke;
  v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v6[4] = a1;
  objc_msgSend(v3, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("detailHigh"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__MFRecipientTableViewCell_highlightedDetailStringAttributes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "defaultDetailStringAttributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1138]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("mf_ttstrong"), CFSTR("mf_tintType"));
  return v2;
}

+ (id)groupDetailStringAttributes
{
  void *v2;
  void *v3;

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("detailGroup"), &__block_literal_global_89);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__MFRecipientTableViewCell_groupDetailStringAttributes__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v0, "setLineBreakMode:", 0);
  objc_msgSend(v0, "setLineSpacing:", 3.0);
  _baseDetailAttributes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v0, *MEMORY[0x1E0DC1178]);
  return v2;
}

+ (id)labelDetailStringAttributes
{
  void *v2;
  void *v3;

  +[_MFTableCellAttributesCache sharedInstance](_MFTableCellAttributesCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedAttributesForIdentifier:constructionBlock:", CFSTR("detailLabelLabel"), &__block_literal_global_92);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__MFRecipientTableViewCell_labelDetailStringAttributes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 2, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  v8[1] = *MEMORY[0x1E0DC1140];
  v2 = (void *)_colorForLabelType__labelColors_0;
  if (!_colorForLabelType__labelColors_0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_colorForLabelType__labelColors_0;
    _colorForLabelType__labelColors_0 = v3;

    v2 = (void *)_colorForLabelType__labelColors_0;
  }
  v5 = v2;
  v8[2] = CFSTR("mf_tintType");
  v9[1] = v5;
  v9[2] = CFSTR("mf_ttdimmed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (double)detailLineHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  _baseDetailAttributes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DC1138]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4;

  return v5;
}

- (BOOL)shouldHighlightCompleteMatches
{
  return self->_shouldHighlightCompleteMatches;
}

- (void)setShouldHighlightCompleteMatches:(BOOL)a3
{
  self->_shouldHighlightCompleteMatches = a3;
}

- (BOOL)shouldDimIrrelevantInformation
{
  return self->_shouldDimIrrelevantInformation;
}

- (void)setShouldDimIrrelevantInformation:(BOOL)a3
{
  self->_shouldDimIrrelevantInformation = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
