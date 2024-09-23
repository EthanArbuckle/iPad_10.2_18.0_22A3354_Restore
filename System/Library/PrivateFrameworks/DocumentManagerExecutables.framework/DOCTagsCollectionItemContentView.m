@implementation DOCTagsCollectionItemContentView

- (id)_tagCollectionAppearance
{
  return +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
}

- (DOCTagsCollectionItemContentView)initWithFrame:(CGRect)a3
{
  DOCTagsCollectionItemContentView *v3;
  void *v4;
  UILabel *v5;
  UILabel *tagNameLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DOCTagsCollectionItemContentView;
  v3 = -[DOCTagsCollectionItemContentView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellCornerRadius");
    -[DOCTagsCollectionItemContentView setCornerRadius:](v3, "setCornerRadius:");
    -[DOCTagsCollectionItemContentView cornerRadius](v3, "cornerRadius");
    -[DOCTagsCollectionItemContentView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:");
    v3->_maxWidth = -1.0;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    tagNameLabel = v3->_tagNameLabel;
    v3->_tagNameLabel = v5;

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_tagNameLabel, "setTextColor:", v7);

    v8 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v4, "labelFontStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionItemContentView traitCollection](v3, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_tagNameLabel, "setFont:", v11);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_tagNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[DOCTagsCollectionItemContentView addSubview:](v3, "addSubview:", v3->_tagNameLabel);
    objc_msgSend(MEMORY[0x24BEBDAB0], "doc_traitsAffectingFonts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)-[DOCTagsCollectionItemContentView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v12, sel_updateForChangedTraitsAffectingFonts);

  }
  return v3;
}

- (void)removeTag:(id)a3
{
  DOCTagsCollectionItemContentViewDelegate **p_delegate;
  id WeakRetained;
  DOCTag *tagValue;
  BOOL v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  tagValue = self->_tagValue;

  if (WeakRetained)
    v7 = tagValue == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "tagsCollectionItem:didDeleteTag:", self, self->_tagValue);

  }
}

- (void)setTagValue:(id)a3
{
  DOCTag *v5;
  DOCTag *v6;

  v5 = (DOCTag *)a3;
  if (self->_tagValue != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tagValue, a3);
    -[DOCTagsCollectionItemContentView updateColors](self, "updateColors");
    -[DOCTagsCollectionItemContentView updateAttributedString](self, "updateAttributedString");
    -[DOCTagsCollectionItemContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v6;
  }

}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    -[DOCTagsCollectionItemContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  void *v20;
  objc_super v21;

  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagsCollectionItemContentView updateColors](self, "updateColors");
  v21.receiver = self;
  v21.super_class = (Class)DOCTagsCollectionItemContentView;
  -[DOCTagsCollectionItemContentView layoutSubviews](&v21, sel_layoutSubviews);
  -[DOCTagsCollectionItemContentView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "cellContentInsets");
  v13 = v5 + v12;
  v15 = v9 - (v12 + v14);
  v17 = v7 + v16;
  v19 = v11 - (v16 + v18);
  -[DOCTagsCollectionItemContentView tagNameLabel](self, "tagNameLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v17, v15, v19);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double maxWidth;
  double v20;
  CGSize result;

  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellContentInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[DOCTagsCollectionItemContentView tagNameLabel](self, "tagNameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intrinsicContentSize");
  v14 = v13;
  v16 = v15;

  v17 = v7 + v11 + v14;
  maxWidth = self->_maxWidth;
  if (v17 > maxWidth && maxWidth > -1.0)
    v17 = self->_maxWidth;
  v20 = v5 + v9 + v16;
  result.height = v20;
  result.width = v17;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double maxWidth;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellContentInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[DOCTagsCollectionItemContentView tagNameLabel](self, "tagNameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemLayoutSizeFittingSize:", width, height);
  v17 = v16;
  v19 = v18;

  v20 = v10 + v14 + v17;
  maxWidth = self->_maxWidth;
  if (v20 > maxWidth && maxWidth > -1.0)
    v20 = self->_maxWidth;
  v23 = v8 + v12 + v19;
  result.height = v23;
  result.width = v20;
  return result;
}

- (void)setIsMixed:(BOOL)a3
{
  if (self->_isMixed != a3)
  {
    self->_isMixed = a3;
    -[DOCTagsCollectionItemContentView updateColors](self, "updateColors");
    -[DOCTagsCollectionItemContentView updateAttributedString](self, "updateAttributedString");
  }
}

- (void)updateColors
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  if (-[DOCTagsCollectionItemContentView isMixed](self, "isMixed"))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionItemContentView setBackgroundColor:](self, "setBackgroundColor:", v3);

    -[DOCTagsCollectionItemContentView tagValue](self, "tagValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tagBackgroundColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[DOCTagsCollectionItemContentView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v6);

    -[DOCTagsCollectionItemContentView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1.0;
  }
  else
  {
    -[DOCTagsCollectionItemContentView tagValue](self, "tagValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tagBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagsCollectionItemContentView setBackgroundColor:](self, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[DOCTagsCollectionItemContentView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderColor:", v13);

    -[DOCTagsCollectionItemContentView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
  }
  v15 = v8;
  objc_msgSend(v8, "setBorderWidth:", v9);

}

- (id)fontForTagSizing
{
  void *v2;
  void *v3;
  void *v4;

  -[DOCTagsCollectionItemContentView tagNameLabel](self, "tagNameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fontAdjustedForCurrentContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18 = *MEMORY[0x24BEBB360];
  -[DOCTagsCollectionItemContentView fontForTagSizing](self, "fontForTagSizing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[DOCTagsCollectionItemContentView isMixed](self, "isMixed"))
  {
    +[DOCTagAppearance renderingAppearance](DOCTagAppearance, "renderingAppearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v5, "outlineTagsToIndicateMixedState");

    v6 = v6;
  }
  else
  {
    v6 = 0;
  }
  -[DOCTagsCollectionItemContentView fontForTagSizing](self, "fontForTagSizing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capHeight");
  v9 = v8 + 0.0;

  -[DOCTagsCollectionItemContentView tagValue](self, "tagValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DOCTagsCollectionItemContentView tagValue](self, "tagValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DOCTagStringRenderingRequest requestForTag:tagDimension:text:textAttributes:variant:](DOCTagStringRenderingRequest, "requestForTag:tagDimension:text:textAttributes:variant:", v12, v11, v4, v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAllowUnsizedSymbolImages:", 1);
  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tagToLabelSpacing");
  objc_msgSend(v13, "setTagToTitleSpacing:");

  objc_msgSend(v13, "setLayoutDirection:", -[DOCTagsCollectionItemContentView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"));
  objc_msgSend(v13, "setClearTagRenderingMode:", 1);
  -[DOCTagsCollectionItemContentView tagNameLabel](self, "tagNameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[DOCTagRenderer shared](DOCTagRenderer, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "renderAttributedStringWithRequest:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAttributedText:", v17);

}

- (void)updateForChangedTraitsAffectingFonts
{
  -[DOCTagsCollectionItemContentView updateAttributedString](self, "updateAttributedString");
  -[DOCTagsCollectionItemContentView setNeedsLayout](self, "setNeedsLayout");
}

- (UIMenu)menuForContextMenuPresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("tag.slash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBD388];
  _DocumentManagerBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Remove Tag"), CFSTR("Remove Tag"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __66__DOCTagsCollectionItemContentView_menuForContextMenuPresentation__block_invoke;
  v14 = &unk_24E327D50;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v5, v2, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttributes:", 2, v11, v12, v13, v14);
  v7 = (void *)MEMORY[0x24BEBD748];
  v17[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "menuWithTitle:image:identifier:options:children:", &stru_24E330BE0, 0, 0, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return (UIMenu *)v9;
}

void __66__DOCTagsCollectionItemContentView_menuForContextMenuPresentation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeTag:", 0);

}

- (DOCTag)tagValue
{
  return self->_tagValue;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (BOOL)isMixed
{
  return self->_isMixed;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (DOCTagsCollectionItemContentViewDelegate)delegate
{
  return (DOCTagsCollectionItemContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)tagNameLabel
{
  return self->_tagNameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagNameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tagValue, 0);
}

@end
