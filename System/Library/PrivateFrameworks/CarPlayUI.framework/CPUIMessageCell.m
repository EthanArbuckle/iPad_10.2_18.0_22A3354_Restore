@implementation CPUIMessageCell

+ (double)minimumHeight
{
  return 44.0;
}

+ (double)rowHeight
{
  return 56.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "minimumHeight");
  v6 = v5;
  -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "rowHeight");
    v6 = v10;
  }
  v11 = width;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_updateTintColors
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CPUIMessageCell;
  -[_CPUIBaseTableCell _updateTintColors](&v35, sel__updateTintColors);
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  else
    +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  else
    +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CPUIBaseTableCell itemEnabled](self, "itemEnabled");
  v6 = v3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CPUIMessageCell primaryLabel](self, "primaryLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  if (v5)
  -[CPUIMessageCell primaryLabel](self, "primaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlightedTextColor:", v4);

  v9 = -[_CPUIBaseTableCell itemEnabled](self, "itemEnabled");
  v10 = v3;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  if (v9)
  -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlightedTextColor:", v4);

  -[CPUIMessageCell leadingGlyph](self, "leadingGlyph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell leadingGlyph](self, "leadingGlyph");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageWithTintColor:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v16);

    -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell leadingGlyph](self, "leadingGlyph");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithTintColor:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHighlightedImage:", v19);

  }
  -[CPUIMessageCell trailingGlyph](self, "trailingGlyph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CPUIMessageCell trailingGlyphView](self, "trailingGlyphView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell trailingGlyph](self, "trailingGlyph");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageWithTintColor:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:", v23);

    -[CPUIMessageCell trailingGlyphView](self, "trailingGlyphView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell trailingGlyph](self, "trailingGlyph");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageWithTintColor:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHighlightedImage:", v26);

  }
  -[CPUIMessageCell accessoryView](self, "accessoryView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[CPUIMessageCell accessoryView](self, "accessoryView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CPUIMessageCell isHighlighted](self, "isHighlighted"))
      v29 = v4;
    else
      v29 = v3;
    objc_msgSend(v28, "setTintColor:", v29);

  }
  -[CPUIMessageCell unreadImageView](self, "unreadImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[CPUIMessageCell unreadImageView](self, "unreadImageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage _flatImageWithColor:](self->_unreadIndicatorImage, "_flatImageWithColor:", v3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setImage:", v32);

    -[CPUIMessageCell unreadImageView](self, "unreadImageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage _flatImageWithColor:](self->_unreadIndicatorImage, "_flatImageWithColor:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHighlightedImage:", v34);

  }
}

- (void)configureCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UILabel *v13;
  UILabel *primaryLabel;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  UILabel *secondaryLabel;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UILabel *v37;
  void *v38;
  UILabel *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  void *v43;
  UILabel *v44;
  UILabel *trailingLabel;
  UILabel *v46;
  void *v47;
  UILabel *v48;
  void *v49;
  UILabel *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  UIImageView *v55;
  UIImageView *primaryImageView;
  double v57;
  double v58;
  void *v59;
  UIImageView *v60;
  UIImageView *trailingImageView;
  double v62;
  double v63;
  void *v64;
  UIImageView *v65;
  UIImageView *trailingGlyphView;
  double v67;
  double v68;
  void *v69;
  UIImageView *v70;
  UIImageView *leadingGlyphView;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD v83[2];

  v83[1] = *MEMORY[0x24BDAC8D0];
  v77.receiver = self;
  v77.super_class = (Class)CPUIMessageCell;
  -[_CPUIBaseTableCell configureCell](&v77, sel_configureCell);
  -[CPUIMessageCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CPUIChevronRightGlyph();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v76);
  -[CPUIMessageCell setAccessoryView:](self, "setAccessoryView:", v5);

  v82 = *MEMORY[0x24BDF78A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7888]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BDF6B68]);
  v9 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v13 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], v10, v11, v12);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v13;

  v15 = (void *)MEMORY[0x24BDF6A78];
  v16 = *MEMORY[0x24BDF77B8];
  -[CPUIMessageCell traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = *MEMORY[0x24BDF7770];
  v19 = v80;
  v81 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fontDescriptorByAddingAttributes:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = self->_primaryLabel;
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v21, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v22, "setFont:", v23);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_primaryLabel, "setAdjustsFontForContentSizeCategory:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = self->_primaryLabel;
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v24, "setTextColor:", v25);

  v26 = self->_primaryLabel;
  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHighlightedTextColor:](v26, "setHighlightedTextColor:", v27);

  -[CPUIMessageCell primaryLabel](self, "primaryLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell addSubview:](self, "addSubview:", v28);

  v29 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v29;

  v31 = (void *)MEMORY[0x24BDF6A78];
  v32 = *MEMORY[0x24BDF77C0];
  -[CPUIMessageCell traitCollection](self, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v19;
  v79 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "fontDescriptorByAddingAttributes:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = self->_secondaryLabel;
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v36, 0.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v37, "setFont:", v38);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_secondaryLabel, "setAdjustsFontForContentSizeCategory:", 0);
  v39 = self->_secondaryLabel;
  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v39, "setTextColor:", v40);

  v41 = self->_secondaryLabel;
  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHighlightedTextColor:](v41, "setHighlightedTextColor:", v42);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell addSubview:](self, "addSubview:", v43);

  v44 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v44;

  v46 = self->_trailingLabel;
  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v46, "setTextColor:", v47);

  v48 = self->_trailingLabel;
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v36, 0.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v48, "setFont:", v49);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_trailingLabel, "setAdjustsFontForContentSizeCategory:", 0);
  v50 = self->_trailingLabel;
  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHighlightedTextColor:](v50, "setHighlightedTextColor:", v51);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_trailingLabel, "setTextAlignment:", 2 * (-[CPUIMessageCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != 1));
  LODWORD(v52) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_trailingLabel, "setContentCompressionResistancePriority:forAxis:", 0, v52);
  LODWORD(v53) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_trailingLabel, "setContentHuggingPriority:forAxis:", 0, v53);
  -[CPUIMessageCell trailingLabel](self, "trailingLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell addSubview:](self, "addSubview:", v54);

  v55 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v9, v10, v11, v12);
  primaryImageView = self->_primaryImageView;
  self->_primaryImageView = v55;

  -[UIImageView setContentMode:](self->_primaryImageView, "setContentMode:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v57) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_primaryImageView, "setContentHuggingPriority:forAxis:", 0, v57);
  LODWORD(v58) = 1144750080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_primaryImageView, "setContentCompressionResistancePriority:forAxis:", 0, v58);
  -[CPUIMessageCell primaryImageView](self, "primaryImageView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell addSubview:](self, "addSubview:", v59);

  v60 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v9, v10, v11, v12);
  trailingImageView = self->_trailingImageView;
  self->_trailingImageView = v60;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v62) = 1144750080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_trailingImageView, "setContentCompressionResistancePriority:forAxis:", 0, v62);
  LODWORD(v63) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_trailingImageView, "setContentHuggingPriority:forAxis:", 0, v63);
  -[CPUIMessageCell trailingImageView](self, "trailingImageView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell addSubview:](self, "addSubview:", v64);

  v65 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v9, v10, v11, v12);
  trailingGlyphView = self->_trailingGlyphView;
  self->_trailingGlyphView = v65;

  LODWORD(v67) = 1144750080;
  -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_trailingGlyphView, "setContentCompressionResistancePriority:forAxis:", 0, v67);
  LODWORD(v68) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_trailingGlyphView, "setContentHuggingPriority:forAxis:", 0, v68);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingGlyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPUIMessageCell trailingGlyphView](self, "trailingGlyphView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell addSubview:](self, "addSubview:", v69);

  v70 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v9, v10, v11, v12);
  leadingGlyphView = self->_leadingGlyphView;
  self->_leadingGlyphView = v70;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_leadingGlyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell addSubview:](self, "addSubview:", v72);

  -[CPUIMessageCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CPMessageListItem"));
  -[CPUIMessageCell primaryLabel](self, "primaryLabel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setAccessibilityIdentifier:", CFSTR("CPListItemTitle"));

  -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setAccessibilityIdentifier:", CFSTR("CPListItemSubtitle"));

  -[CPUIMessageCell trailingLabel](self, "trailingLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setAccessibilityIdentifier:", CFSTR("CPListItemTrailingLabel"));

}

- (void)applyConfiguration:(id)a3
{
  id v4;
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
  __CFString *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  int v29;
  void *v30;
  void *v31;
  UIImageView *unreadImageView;
  void *v33;
  uint64_t v34;
  void *v35;
  UIImageView *v36;
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
  UIImageView *leadingGlyphView;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  UILabel *primaryLabel;
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
  uint64_t v92;
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
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  NSArray *v146;
  NSArray *constraints;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  _QWORD v182[2];
  _QWORD v183[4];
  void *v184;
  _QWORD v185[5];
  _QWORD v186[4];
  _QWORD v187[4];
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  uint64_t v196;

  v196 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1628];
  -[CPUIMessageCell constraints](self, "constraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPUIBaseTableCell setItemEnabled:](self, "setItemEnabled:", objc_msgSend(v4, "enabled"));
  objc_msgSend(v4, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell primaryLabel](self, "primaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v4, "detailText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v4, "trailingText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell trailingLabel](self, "trailingLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v4, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell primaryImageView](self, "primaryImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v14);

  objc_msgSend(v4, "trailingImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell trailingImageView](self, "trailingImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v16);

  -[CPUIMessageCell setUnread:](self, "setUnread:", objc_msgSend(v4, "isUnread"));
  if (objc_msgSend(v4, "showsStar"))
  {
    -[CPUIMessageCell traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("star.fill");
    v20 = 11.0;
LABEL_5:
    _CPUIGlyphFactoryWithTraitCollection(v19, 4, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageWithRenderingMode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell setLeadingGlyph:](self, "setLeadingGlyph:", v22);

    -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell leadingGlyph](self, "leadingGlyph");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImage:", v24);

    goto LABEL_7;
  }
  if (objc_msgSend(v4, "showsPin"))
  {
    -[CPUIMessageCell traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("pin.fill");
    v20 = 10.0;
    goto LABEL_5;
  }
  -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:", 0);

  -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHighlightedImage:", 0);

  -[CPUIMessageCell setLeadingGlyph:](self, "setLeadingGlyph:", 0);
LABEL_7:
  objc_msgSend(v4, "detailText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v27, "length");

  if (objc_msgSend(v4, "showsStar"))
    v28 = 11.0;
  else
    v28 = 10.0;
  v29 = objc_msgSend(v4, "isUnread");
  -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "image");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v178 = v4;
  v179 = v7;
  if (v29)
  {
    unreadImageView = self->_unreadImageView;
    if (v31)
    {
      -[UIImageView centerXAnchor](unreadImageView, "centerXAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "centerXAnchor");
      v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v188 = objc_claimAutoreleasedReturnValue();
      -[UIImageView heightAnchor](self->_unreadImageView, "heightAnchor");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "constraintEqualToConstant:", 8.0);
      v189 = objc_claimAutoreleasedReturnValue();
      -[UIImageView widthAnchor](self->_unreadImageView, "widthAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView heightAnchor](self->_unreadImageView, "heightAnchor");
      v157 = objc_claimAutoreleasedReturnValue();
      v158 = v35;
      objc_msgSend(v35, "constraintEqualToAnchor:");
      v156 = objc_claimAutoreleasedReturnValue();
      v190 = v156;
      v36 = self->_unreadImageView;
      v160 = (void *)v189;
      v162 = v33;
      v168 = (void *)v188;
      v171 = (void *)v34;
      if (v176)
      {
        -[UIImageView centerYAnchor](v36, "centerYAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel centerYAnchor](self->_primaryLabel, "centerYAnchor");
        v154 = objc_claimAutoreleasedReturnValue();
        v155 = v37;
        objc_msgSend(v37, "constraintEqualToAnchor:");
        v153 = objc_claimAutoreleasedReturnValue();
        v191 = v153;
        -[UIImageView centerYAnchor](self->_leadingGlyphView, "centerYAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel centerYAnchor](self->_secondaryLabel, "centerYAnchor");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v38;
        objc_msgSend(v38, "constraintEqualToAnchor:");
      }
      else
      {
        -[UIImageView topAnchor](v36, "topAnchor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPUIMessageCell topAnchor](self, "topAnchor");
        v154 = objc_claimAutoreleasedReturnValue();
        v155 = v51;
        objc_msgSend(v51, "constraintEqualToAnchor:constant:", 10.0);
        v153 = objc_claimAutoreleasedReturnValue();
        v191 = v153;
        -[UIImageView bottomAnchor](self->_leadingGlyphView, "bottomAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPUIMessageCell bottomAnchor](self, "bottomAnchor");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v52;
        objc_msgSend(v52, "constraintEqualToAnchor:constant:", -10.0);
      }
      v192 = objc_claimAutoreleasedReturnValue();
      -[UIImageView leadingAnchor](self->_leadingGlyphView, "leadingAnchor", v192);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIMessageCell leadingAnchor](self, "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 6.0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = v55;
      -[UIImageView heightAnchor](self->_leadingGlyphView, "heightAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToConstant:", v28);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = v57;
      -[UIImageView widthAnchor](self->_leadingGlyphView, "widthAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView heightAnchor](self->_leadingGlyphView, "heightAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v195 = v60;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v188, 8);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "addObjectsFromArray:", v61);

      v4 = v178;
      v41 = v160;
      v49 = v162;
      v43 = (void *)v157;
      v42 = v158;
      v45 = v155;
      v44 = (void *)v156;
      v47 = (void *)v153;
      v46 = (void *)v154;
      goto LABEL_20;
    }
    -[UIImageView leadingAnchor](unreadImageView, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell leadingAnchor](self, "leadingAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", 6.0);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v187[0] = v171;
    -[UIImageView centerYAnchor](self->_unreadImageView, "centerYAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell centerYAnchor](self, "centerYAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = v50;
    objc_msgSend(v50, "constraintEqualToAnchor:", v165);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v187[1] = v41;
    -[UIImageView heightAnchor](self->_unreadImageView, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 8.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v187[2] = v43;
    -[UIImageView widthAnchor](self->_unreadImageView, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_unreadImageView, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v187[3] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v187, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v179;
  }
  else
  {
    if (!v31)
      goto LABEL_21;
    -[UIImageView leadingAnchor](self->_leadingGlyphView, "leadingAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell leadingAnchor](self, "leadingAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "constraintEqualToAnchor:constant:", 6.0);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v186[0] = v171;
    -[UIImageView centerYAnchor](self->_leadingGlyphView, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell centerYAnchor](self, "centerYAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = v39;
    objc_msgSend(v39, "constraintEqualToAnchor:");
    v40 = v7;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v186[1] = v41;
    -[UIImageView heightAnchor](self->_leadingGlyphView, "heightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", v28);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v186[2] = v43;
    -[UIImageView widthAnchor](self->_leadingGlyphView, "widthAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_leadingGlyphView, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v186[3] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v186, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v40;
    v49 = v163;
  }
  objc_msgSend(v48, "addObjectsFromArray:", v47);
LABEL_20:

  v7 = v179;
LABEL_21:
  objc_msgSend(v4, "image");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
  {
    -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell leadingAnchor](self, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 30.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v66;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v184, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v67);
    goto LABEL_29;
  }
  if (objc_msgSend(v4, "isUnread"))
  {
    leadingGlyphView = self->_unreadImageView;
  }
  else
  {
    -[UIImageView image](self->_leadingGlyphView, "image");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
    {
      -[CPUIMessageCell leadingAnchor](self, "leadingAnchor");
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = 20.0;
      goto LABEL_28;
    }
    leadingGlyphView = self->_leadingGlyphView;
  }
  -[UIImageView trailingAnchor](leadingGlyphView, "trailingAnchor");
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = 6.0;
LABEL_28:
  v175 = (void *)v69;
  -[UIImageView centerYAnchor](self->_primaryImageView, "centerYAnchor");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell centerYAnchor](self, "centerYAnchor");
  v164 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "constraintEqualToAnchor:", v164);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v185[0] = v67;
  -[UIImageView leadingAnchor](self->_primaryImageView, "leadingAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "constraintEqualToAnchor:constant:", v69, v70);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v185[1] = v166;
  -[UIImageView widthAnchor](self->_primaryImageView, "widthAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "constraintEqualToConstant:", 30.0);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v185[2] = v159;
  -[UIImageView heightAnchor](self->_primaryImageView, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_primaryImageView, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v185[3] = v73;
  -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_primaryImageView, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 8.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v185[4] = v76;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v185, 5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "addObjectsFromArray:", v77);

  v66 = (void *)v164;
  v65 = v169;

  v64 = v175;
LABEL_29:

  primaryLabel = self->_primaryLabel;
  if (v176)
  {
    -[UILabel firstBaselineAnchor](primaryLabel, "firstBaselineAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell topAnchor](self, "topAnchor");
    v167 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "constraintEqualToAnchor:constant:", v167, 20.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v183[0] = v79;
    -[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "constraintEqualToAnchor:", v170);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v183[1] = v80;
    -[UILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v183[2] = v83;
    -[UILabel topAnchor](self->_secondaryLabel, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_primaryLabel, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v183[3] = v86;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v183, 4);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "addObjectsFromArray:", v87);

    v88 = (void *)v167;
    v89 = v177;

  }
  else
  {
    -[UILabel centerYAnchor](primaryLabel, "centerYAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell centerYAnchor](self, "centerYAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "addObject:", v79);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "trailingText");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "length");

  if (v92)
  {
    -[UILabel centerYAnchor](self->_trailingLabel, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell centerYAnchor](self, "centerYAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v182[0] = v95;
    -[UILabel trailingAnchor](self->_trailingLabel, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell trailingAnchor](self, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, -28.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v182[1] = v98;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v182, 2);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "addObjectsFromArray:", v99);

    -[CPUIMessageCell trailingLabel](self, "trailingLabel");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "insertObject:atIndex:", v100, 0);

  }
  objc_msgSend(v178, "trailingImage");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
  {
    -[UIImageView centerYAnchor](self->_trailingImageView, "centerYAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell centerYAnchor](self, "centerYAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = v104;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v181, 1);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v179;
    objc_msgSend(v179, "addObjectsFromArray:", v105);

    v107 = objc_msgSend(v90, "count");
    -[UIImageView trailingAnchor](self->_trailingImageView, "trailingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "leadingAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "constraintEqualToAnchor:constant:", v110, -8.0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "addObject:", v111);

    }
    else
    {
      -[CPUIMessageCell trailingAnchor](self, "trailingAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, -28.0);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "addObject:", v110);
    }

    -[CPUIMessageCell trailingImageView](self, "trailingImageView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "insertObject:atIndex:", v112, 0);
  }
  else
  {
    -[CPUIMessageCell trailingImageView](self, "trailingImageView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setImage:", 0);
    v106 = v179;
  }

  if (objc_msgSend(v178, "showsMute"))
  {
    -[CPUIMessageCell traitCollection](self, "traitCollection");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    _CPUIGlyphFactoryWithTraitCollection(CFSTR("speaker.slash.fill"), 4, v113, 20.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell setTrailingGlyph:](self, "setTrailingGlyph:", v114);

    -[UIImageView centerYAnchor](self->_trailingGlyphView, "centerYAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell centerYAnchor](self, "centerYAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = v117;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v180, 1);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObjectsFromArray:", v118);

    v119 = objc_msgSend(v90, "count");
    -[UIImageView trailingAnchor](self->_trailingGlyphView, "trailingAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
    {
      objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "leadingAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "constraintEqualToAnchor:constant:", v122, -8.0);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "addObject:", v123);

    }
    else
    {
      -[CPUIMessageCell trailingAnchor](self, "trailingAnchor");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "constraintEqualToAnchor:constant:", v121, -28.0);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "addObject:", v122);
    }

    -[CPUIMessageCell trailingGlyphView](self, "trailingGlyphView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "insertObject:atIndex:", v126, 0);

  }
  else
  {
    -[CPUIMessageCell trailingGlyphView](self, "trailingGlyphView");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setImage:", 0);

    -[CPUIMessageCell trailingGlyphView](self, "trailingGlyphView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "setHighlightedImage:", 0);

    -[CPUIMessageCell setTrailingGlyph:](self, "setTrailingGlyph:", 0);
  }
  v127 = objc_msgSend(v90, "count");
  -[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  if (v127)
  {
    objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "leadingAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:constant:", v130, -8.0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObject:", v131);

  }
  else
  {
    -[CPUIMessageCell trailingAnchor](self, "trailingAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:constant:", v129, -28.0);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObject:", v130);
  }

  v132 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CPUIMessageCell primaryLabel](self, "primaryLabel");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "text");
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (v134)
  {
    -[CPUIMessageCell primaryLabel](self, "primaryLabel");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "text");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addObject:", v136);

  }
  -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "text");
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  if (v138)
  {
    -[CPUIMessageCell secondaryLabel](self, "secondaryLabel");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "text");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addObject:", v140);

  }
  -[CPUIMessageCell trailingLabel](self, "trailingLabel");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "text");
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  if (v142)
  {
    -[CPUIMessageCell trailingLabel](self, "trailingLabel");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "text");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "addObject:", v144);

  }
  v145 = (void *)objc_msgSend(v132, "copy");
  -[CPUIMessageCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", v145);

  -[CPUIMessageCell _updateTintColors](self, "_updateTintColors");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v106);
  v146 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v146;

  v148 = (void *)MEMORY[0x24BDD1628];
  -[CPUIMessageCell constraints](self, "constraints");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "activateConstraints:", v149);

  -[CPUIMessageCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUnread:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[CPUIMessageCell unreadImageView](self, "unreadImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      UIImageGetUnreadIndicator();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIMessageCell setUnreadIndicatorImage:](self, "setUnreadIndicatorImage:", v7);

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", self->_unreadIndicatorImage);
      -[CPUIMessageCell setUnreadImageView:](self, "setUnreadImageView:", v8);

      -[CPUIMessageCell unreadImageView](self, "unreadImageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CPUIMessageCell unreadImageView](self, "unreadImageView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[CPUIMessageCell addSubview:](self, "addSubview:", v10);

    }
  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[CPUIMessageCell setUnreadImageView:](self, "setUnreadImageView:", 0);
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPUIMessageCell *v5;

  objc_msgSend(a3, "nextFocusedItem");
  v5 = (CPUIMessageCell *)objc_claimAutoreleasedReturnValue();
  -[CPUIMessageCell setHighlighted:animated:](self, "setHighlighted:animated:", v5 == self, 0);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CPUIMessageCell;
  -[CPUIMessageCell setHighlighted:animated:](&v11, sel_setHighlighted_animated_, a3, a4);
  -[CPUIMessageCell _updateTintColors](self, "_updateTintColors");
  if (-[_CPUIBaseTableCell itemEnabled](self, "itemEnabled"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIMessageCell accessoryView](self, "accessoryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPUIMessageCell accessoryView](self, "accessoryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

  }
  else
  {
    if (a3)
      +[_CPUIBaseTableCell disabledHighlightedColor](_CPUIBaseTableCell, "disabledHighlightedColor");
    else
      +[_CPUIBaseTableCell disabledColor](_CPUIBaseTableCell, "disabledColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIMessageCell accessoryView](self, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);
  }

  -[CPUIMessageCell leadingGlyphView](self, "leadingGlyphView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v6);

  -[CPUIMessageCell trailingGlyphView](self, "trailingGlyphView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v6);

}

- (UIImageView)unreadImageView
{
  return self->_unreadImageView;
}

- (void)setUnreadImageView:(id)a3
{
  objc_storeStrong((id *)&self->_unreadImageView, a3);
}

- (UIImageView)leadingGlyphView
{
  return self->_leadingGlyphView;
}

- (void)setLeadingGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingGlyphView, a3);
}

- (UIImageView)primaryImageView
{
  return self->_primaryImageView;
}

- (void)setPrimaryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryImageView, a3);
}

- (UIImage)leadingGlyph
{
  return self->_leadingGlyph;
}

- (void)setLeadingGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_leadingGlyph, a3);
}

- (UIImage)unreadIndicatorImage
{
  return self->_unreadIndicatorImage;
}

- (void)setUnreadIndicatorImage:(id)a3
{
  objc_storeStrong((id *)&self->_unreadIndicatorImage, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UILabel)trailingLabel
{
  return self->_trailingLabel;
}

- (void)setTrailingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingLabel, a3);
}

- (UIImageView)trailingImageView
{
  return self->_trailingImageView;
}

- (void)setTrailingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingImageView, a3);
}

- (UIImageView)trailingGlyphView
{
  return self->_trailingGlyphView;
}

- (void)setTrailingGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingGlyphView, a3);
}

- (UIImage)trailingGlyph
{
  return self->_trailingGlyph;
}

- (void)setTrailingGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_trailingGlyph, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trailingGlyph, 0);
  objc_storeStrong((id *)&self->_trailingGlyphView, 0);
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImage, 0);
  objc_storeStrong((id *)&self->_leadingGlyph, 0);
  objc_storeStrong((id *)&self->_primaryImageView, 0);
  objc_storeStrong((id *)&self->_leadingGlyphView, 0);
  objc_storeStrong((id *)&self->_unreadImageView, 0);
}

@end
