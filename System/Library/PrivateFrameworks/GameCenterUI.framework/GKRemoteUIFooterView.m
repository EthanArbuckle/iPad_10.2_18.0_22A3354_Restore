@implementation GKRemoteUIFooterView

- (GKRemoteUIFooterView)initWithAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  GKRemoteUIFooterView *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t layoutStyle;
  double v21;
  double v22;
  GKLabel *v23;
  GKLabel *textLabel;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double bottomMargin;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  GKLabel *v39;
  double v40;
  void *v41;
  void *v42;
  GKLabel *v43;
  double v44;
  void *v45;
  GKRemoteUIFooterView *v46;
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)GKRemoteUIFooterView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[GKRemoteUIFooterView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (!v9)
    goto LABEL_14;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GKApplyTheme"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_shouldApplyGameCenterTheme = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GKLayoutStyle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_layoutStyle = objc_msgSend(v11, "integerValue");

  if (v9->_shouldApplyGameCenterTheme)
    v12 = CFSTR("remoteUISectionFooter");
  else
    v12 = CFSTR("settingsFooter");
  v13 = (void *)MEMORY[0x1E0D25B28];
  v14 = v12;
  objc_msgSend(v13, "textStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footerStyle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v15;
  objc_msgSend(v15, "styleWithName:fallback:layoutMode:", v16, v14, v9->_layoutStyle);
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("addBullets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (!v9->_shouldApplyGameCenterTheme)
  {
    v9->_leftMargin = 15.0;
    v9->_rightMargin = 15.0;
    v22 = 22.0;
    v21 = 18.0;
    goto LABEL_9;
  }
  v9->_leftMargin = 0.0;
  v9->_rightMargin = 0.0;
  layoutStyle = v9->_layoutStyle;
  if (layoutStyle < 3)
  {
    v21 = dbl_1AB7F7F28[layoutStyle];
    v22 = dbl_1AB7F7F40[layoutStyle];
LABEL_9:
    v9->_paragraphMargin = v21;
    v9->_bottomMargin = v22;
  }
  v23 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v5, v6, v7, v8);
  textLabel = v9->_textLabel;
  v9->_textLabel = v23;

  -[GKRemoteUIFooterView addSubview:](v9, "addSubview:", v9->_textLabel);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("footer"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLabel setNumberOfLines:](v9->_textLabel, "setNumberOfLines:", 0);
  -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v48 = (void *)v17;
  if (v19)
    -[GKRemoteUIFooterView attributedStringForString:withStyle:](v9, "attributedStringForString:withStyle:", v26, v17);
  else
    objc_msgSend(v26, "_gkAttributedStringByApplyingStyle:", v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLabel setAttributedText:](v9->_textLabel, "setAttributedText:", v27);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("_textLabel"), v9->_textLabel, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = CFSTR("top");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9->_paragraphMargin);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = CFSTR("bottom");
  v52[0] = v30;
  v31 = (void *)MEMORY[0x1E0CB37E8];
  bottomMargin = v9->_bottomMargin;
  -[GKLabel font](v9->_textLabel, "font");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "descender");
  objc_msgSend(v31, "numberWithDouble:", bottomMargin - fabs(v34));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(top)-[_textLabel]-(bottom)-|"), 0, v36, v29);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObjectsFromArray:", v37);

  v38 = (void *)MEMORY[0x1E0CB3718];
  v39 = v9->_textLabel;
  -[GKRemoteUIFooterView leftMargin](v9, "leftMargin");
  objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 1, 0, v9, 1, 1.0, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v41);

  v42 = (void *)MEMORY[0x1E0CB3718];
  v43 = v9->_textLabel;
  -[GKRemoteUIFooterView rightMargin](v9, "rightMargin");
  objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 2, 0, v9, 2, 1.0, -v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v45);

  -[GKRemoteUIFooterView addConstraints:](v9, "addConstraints:", v28);
  v46 = v9;

LABEL_14:
  return v9;
}

- (double)footerHeightForWidth:(double)a3 inTableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v5 = a4;
  -[GKRemoteUIFooterView layoutIfNeeded](self, "layoutIfNeeded");
  -[GKRemoteUIFooterView textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "frame");
  v9 = v8;

  -[GKRemoteUIFooterView leftMargin](self, "leftMargin");
  v11 = v9 - v10;
  -[GKRemoteUIFooterView rightMargin](self, "rightMargin");
  v13 = v11 - v12;
  -[GKRemoteUIFooterView textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreferredMaxLayoutWidth:", v13);

  -[GKRemoteUIFooterView textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intrinsicContentSize");
  v17 = v16;

  v18 = v17 + self->_paragraphMargin + self->_bottomMargin;
  objc_msgSend(v7, "descender");
  v20 = v18 - fabs(v19);

  return v20;
}

- (id)attributedStringForString:(id)a3 withStyle:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  Class *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;

  v6 = (void *)MEMORY[0x1E0DC3708];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = (Class *)0x1E0D25B38;
  if (v10 == 1)
  {
    if (*MEMORY[0x1E0D25B68])
      v12 = 1;
    else
      v12 = *MEMORY[0x1E0D253F8] == 0;
    if (v12)
      v11 = (Class *)0x1E0D25B30;
  }
  v13 = objc_alloc_init(*v11);
  objc_msgSend(v7, "replayOnBaseStyle:systemContentSizeDidChange:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v14, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", CFSTR("•  "), v18);

  objc_msgSend(v19, "size");
  objc_msgSend(v16, "setHeadIndent:");
  objc_msgSend(v16, "setFirstLineHeadIndent:", 0.0);
  objc_msgSend(v16, "setParagraphSpacing:", self->_paragraphMargin);
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), CFSTR("•  "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("•  "), "stringByAppendingString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v14, "attributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v23, v25);

  objc_msgSend(v26, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v16, 0, objc_msgSend(v23, "length"));
  return v26;
}

- (GKLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (double)leftMargin
{
  return self->_leftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->_leftMargin = a3;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->_rightMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)paragraphMargin
{
  return self->_paragraphMargin;
}

- (void)setParagraphMargin:(double)a3
{
  self->_paragraphMargin = a3;
}

- (BOOL)shouldApplyGameCenterTheme
{
  return self->_shouldApplyGameCenterTheme;
}

- (void)setShouldApplyGameCenterTheme:(BOOL)a3
{
  self->_shouldApplyGameCenterTheme = a3;
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
