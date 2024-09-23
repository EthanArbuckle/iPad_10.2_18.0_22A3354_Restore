@implementation HUGridBannerCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___HUGridBannerCellLayoutOptions;
  objc_msgSendSuper2(&v29, sel_defaultOptionsForCellSizeSubclass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDismissButtonTrailingInset:", 12.0);
  objc_msgSend(v4, "setDismissButtonTopInset:", 12.0);
  objc_msgSend(v4, "setDismissButtonHeightAndWidth:", 32.0);
  v54[0] = &unk_1E7041A10;
  v54[1] = &unk_1E70419F8;
  v55[0] = &unk_1E7043768;
  v55[1] = &unk_1E7043828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadingInset:", HUConstantForCellSizeSubclass(a3, v5));

  v52[0] = &unk_1E7041A10;
  v52[1] = &unk_1E70419F8;
  v53[0] = &unk_1E7043768;
  v53[1] = &unk_1E7043828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconTopInset:", HUConstantForCellSizeSubclass(a3, v6));

  v50[0] = &unk_1E7041A10;
  v50[1] = &unk_1E70419F8;
  v51[0] = &unk_1E7043898;
  v51[1] = &unk_1E7043898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconWidth:", HUConstantForCellSizeSubclass(a3, v7));

  v48[0] = &unk_1E7041A10;
  v48[1] = &unk_1E70419F8;
  v49[0] = &unk_1E7043898;
  v49[1] = &unk_1E7043898;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconHeight:", HUConstantForCellSizeSubclass(a3, v8));

  v46[0] = &unk_1E7041A10;
  v46[1] = &unk_1E70419F8;
  v47[0] = &unk_1E7043768;
  v47[1] = &unk_1E7043748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconTrailingInset:", HUConstantForCellSizeSubclass(a3, v9));

  objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5B8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0CEB510];
  v42 = *MEMORY[0x1E0CEB608];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5D0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptorByAddingAttributes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptorWithDesign:", *MEMORY[0x1E0CEB4F8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v28, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconDescriptionFont:", v15);

  objc_msgSend(v4, "setIconDescriptionInset:", 6.0);
  v40[0] = &unk_1E7041A10;
  v40[1] = &unk_1E70419F8;
  v41[0] = &unk_1E7043748;
  v41[1] = &unk_1E7043748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleTopInset:", HUConstantForCellSizeSubclass(a3, v16));

  v38[0] = &unk_1E7041A10;
  v38[1] = &unk_1E70419F8;
  v39[0] = &unk_1E7043828;
  v39[1] = &unk_1E7043828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingInset:", HUConstantForCellSizeSubclass(a3, v17));

  v36[0] = &unk_1E7041A10;
  v36[1] = &unk_1E70419F8;
  v37[0] = &unk_1E7043738;
  v37[1] = &unk_1E7043748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHorizontalItemSpacing:", HUConstantForCellSizeSubclass(a3, v18));

  objc_msgSend(v4, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lineHeight");
  objc_msgSend(v4, "setTitleInterLineSpacing:");

  v20 = *MEMORY[0x1E0CEB538];
  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB538], 32770);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v21);

  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB588], 0x8000);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionFont:", v22);

  v34[0] = &unk_1E7041A10;
  v34[1] = &unk_1E70419F8;
  v35[0] = &unk_1E70436D8;
  v35[1] = &unk_1E70438A8;
  v34[2] = &unk_1E7041A88;
  v34[3] = &unk_1E7041A40;
  v35[2] = &unk_1E7043818;
  v35[3] = &unk_1E70438A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellHeight:", HUConstantForCellSizeSubclass(a3, v23));

  objc_msgSend(v4, "setVerticalLabelSpacing:", 0.0);
  v32[0] = &unk_1E7041A10;
  v32[1] = &unk_1E70419F8;
  v33[0] = &unk_1E7043748;
  v33[1] = &unk_1E7043748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVerticalSpacingForLineView:", HUConstantForCellSizeSubclass(a3, v24));

  v30[0] = &unk_1E7041A10;
  v30[1] = &unk_1E70419F8;
  v31[0] = &unk_1E7043828;
  v31[1] = &unk_1E7043828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVerticalSpacingForLipElements:", HUConstantForCellSizeSubclass(a3, v25));

  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", v20, 0x8000);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFooterViewLabelFont:", v26);

  objc_msgSend(v4, "setMaxNumberOfTitleLines:", 0);
  objc_msgSend(v4, "setMaxNumberOfDescriptionLines:", 0);

  return v4;
}

- (void)setVerticalSpacingForLineView:(double)a3
{
  self->_verticalSpacingForLineView = a3;
}

- (void)setTrailingInset:(double)a3
{
  self->_trailingInset = a3;
}

- (void)setFooterViewLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_footerViewLabelFont, a3);
}

- (void)setDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionFont, a3);
}

- (void)setVerticalSpacingForLipElements:(double)a3
{
  self->_verticalSpacingForLipElements = a3;
}

- (void)setVerticalLabelSpacing:(double)a3
{
  self->_verticalLabelSpacing = a3;
}

- (void)setTitleInterLineSpacing:(double)a3
{
  self->_titleInterLineSpacing = a3;
}

- (void)setMaxNumberOfTitleLines:(unint64_t)a3
{
  self->_maxNumberOfTitleLines = a3;
}

- (void)setMaxNumberOfDescriptionLines:(unint64_t)a3
{
  self->_maxNumberOfDescriptionLines = a3;
}

- (void)setLeadingInset:(double)a3
{
  self->_leadingInset = a3;
}

- (void)setIconWidth:(double)a3
{
  self->_iconWidth = a3;
}

- (void)setIconTrailingInset:(double)a3
{
  self->_iconTrailingInset = a3;
}

- (void)setIconTopInset:(double)a3
{
  self->_iconTopInset = a3;
}

- (void)setIconHeight:(double)a3
{
  self->_iconHeight = a3;
}

- (void)setIconDescriptionInset:(double)a3
{
  self->_iconDescriptionInset = a3;
}

- (void)setIconDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptionFont, a3);
}

- (void)setHorizontalItemSpacing:(double)a3
{
  self->_horizontalItemSpacing = a3;
}

- (void)setDismissButtonTrailingInset:(double)a3
{
  self->_dismissButtonTrailingInset = a3;
}

- (void)setDismissButtonTopInset:(double)a3
{
  self->_dismissButtonTopInset = a3;
}

- (void)setDismissButtonHeightAndWidth:(double)a3
{
  self->_dismissButtonHeightAndWidth = a3;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUGridBannerCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[HUGridBannerCellLayoutOptions dismissButtonTrailingInset](self, "dismissButtonTrailingInset");
  objc_msgSend(v4, "setDismissButtonTrailingInset:");
  -[HUGridBannerCellLayoutOptions dismissButtonTopInset](self, "dismissButtonTopInset");
  objc_msgSend(v4, "setDismissButtonTopInset:");
  -[HUGridBannerCellLayoutOptions dismissButtonHeightAndWidth](self, "dismissButtonHeightAndWidth");
  objc_msgSend(v4, "setDismissButtonHeightAndWidth:");
  -[HUGridBannerCellLayoutOptions titleInterLineSpacing](self, "titleInterLineSpacing");
  objc_msgSend(v4, "setTitleInterLineSpacing:");
  -[HUGridBannerCellLayoutOptions titleTopInset](self, "titleTopInset");
  objc_msgSend(v4, "setTitleTopInset:");
  -[HUGridBannerCellLayoutOptions trailingInset](self, "trailingInset");
  objc_msgSend(v4, "setTrailingInset:");
  -[HUGridBannerCellLayoutOptions iconTopInset](self, "iconTopInset");
  objc_msgSend(v4, "setIconTopInset:");
  -[HUGridBannerCellLayoutOptions iconTrailingInset](self, "iconTrailingInset");
  objc_msgSend(v4, "setIconTrailingInset:");
  -[HUGridBannerCellLayoutOptions iconHeight](self, "iconHeight");
  objc_msgSend(v4, "setIconHeight:");
  -[HUGridBannerCellLayoutOptions iconWidth](self, "iconWidth");
  objc_msgSend(v4, "setIconWidth:");
  -[HUGridBannerCellLayoutOptions iconDescriptionFont](self, "iconDescriptionFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconDescriptionFont:", v5);

  -[HUGridBannerCellLayoutOptions iconDescriptionInset](self, "iconDescriptionInset");
  objc_msgSend(v4, "setIconDescriptionInset:");
  -[HUGridBannerCellLayoutOptions leadingInset](self, "leadingInset");
  objc_msgSend(v4, "setLeadingInset:");
  -[HUGridBannerCellLayoutOptions titleTopInset](self, "titleTopInset");
  objc_msgSend(v4, "setTitleTopInset:");
  -[HUGridBannerCellLayoutOptions descriptionFont](self, "descriptionFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionFont:", v6);

  -[HUGridBannerCellLayoutOptions cellHeight](self, "cellHeight");
  objc_msgSend(v4, "setCellHeight:");
  objc_msgSend(v4, "setMaxNumberOfDescriptionLines:", -[HUGridBannerCellLayoutOptions maxNumberOfDescriptionLines](self, "maxNumberOfDescriptionLines"));
  objc_msgSend(v4, "setMaxNumberOfTitleLines:", -[HUGridBannerCellLayoutOptions maxNumberOfTitleLines](self, "maxNumberOfTitleLines"));
  -[HUGridBannerCellLayoutOptions horizontalItemSpacing](self, "horizontalItemSpacing");
  objc_msgSend(v4, "setHorizontalItemSpacing:");
  -[HUGridBannerCellLayoutOptions verticalLabelSpacing](self, "verticalLabelSpacing");
  objc_msgSend(v4, "setVerticalLabelSpacing:");
  -[HUGridBannerCellLayoutOptions verticalSpacingForLineView](self, "verticalSpacingForLineView");
  objc_msgSend(v4, "setVerticalSpacingForLineView:");
  -[HUGridBannerCellLayoutOptions verticalSpacingForLipElements](self, "verticalSpacingForLipElements");
  objc_msgSend(v4, "setVerticalSpacingForLipElements:");
  -[HUGridBannerCellLayoutOptions footerViewLabelFont](self, "footerViewLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFooterViewLabelFont:", v7);

  return v4;
}

- (void)setTitleTopInset:(double)a3
{
  self->_titleTopInset = a3;
}

- (double)titleTopInset
{
  return self->_titleTopInset;
}

- (double)verticalSpacingForLipElements
{
  return self->_verticalSpacingForLipElements;
}

- (double)verticalSpacingForLineView
{
  return self->_verticalSpacingForLineView;
}

- (double)verticalLabelSpacing
{
  return self->_verticalLabelSpacing;
}

- (double)trailingInset
{
  return self->_trailingInset;
}

- (double)titleInterLineSpacing
{
  return self->_titleInterLineSpacing;
}

- (unint64_t)maxNumberOfTitleLines
{
  return self->_maxNumberOfTitleLines;
}

- (unint64_t)maxNumberOfDescriptionLines
{
  return self->_maxNumberOfDescriptionLines;
}

- (double)leadingInset
{
  return self->_leadingInset;
}

- (double)iconWidth
{
  return self->_iconWidth;
}

- (double)iconTrailingInset
{
  return self->_iconTrailingInset;
}

- (double)iconTopInset
{
  return self->_iconTopInset;
}

- (double)iconHeight
{
  return self->_iconHeight;
}

- (double)iconDescriptionInset
{
  return self->_iconDescriptionInset;
}

- (UIFont)iconDescriptionFont
{
  return self->_iconDescriptionFont;
}

- (double)horizontalItemSpacing
{
  return self->_horizontalItemSpacing;
}

- (UIFont)footerViewLabelFont
{
  return self->_footerViewLabelFont;
}

- (double)dismissButtonTrailingInset
{
  return self->_dismissButtonTrailingInset;
}

- (double)dismissButtonTopInset
{
  return self->_dismissButtonTopInset;
}

- (double)dismissButtonHeightAndWidth
{
  return self->_dismissButtonHeightAndWidth;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerViewLabelFont, 0);
  objc_storeStrong((id *)&self->_descriptionFont, 0);
  objc_storeStrong((id *)&self->_iconDescriptionFont, 0);
}

- (double)bannerCellHeightForWidth:(double)a3 title:(id)a4 description:(id)a5 footer:(id)a6 forContentSizeCategory:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = *MEMORY[0x1E0CEB3D0];
  -[HUGridBannerCellLayoutOptions leadingInset](self, "leadingInset");
  v18 = v17;
  if (v16 > (unint64_t)v15)
  {
    -[HUGridBannerCellLayoutOptions iconWidth](self, "iconWidth");
    v20 = v18 + v19;
    -[HUGridBannerCellLayoutOptions horizontalItemSpacing](self, "horizontalItemSpacing");
    v18 = v20 + v21;
  }
  -[HUGridBannerCellLayoutOptions trailingInset](self, "trailingInset");
  v23 = a3 - (v18 + v22);
  v56 = *MEMORY[0x1E0CEA098];
  v24 = v56;
  -[HUGridCellLayoutOptions font](self, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 1, v26, 0, v23, 3.40282347e38);
  v28 = v27;

  -[HUGridBannerCellLayoutOptions verticalLabelSpacing](self, "verticalLabelSpacing");
  v30 = v29 + ceil(v28) + 0.0;
  v54 = v24;
  -[HUGridBannerCellLayoutOptions descriptionFont](self, "descriptionFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 1, v32, 0, v23, 3.40282347e38);
  v34 = v33;

  v35 = v30 + ceil(v34);
  if (v16 <= (unint64_t)v15)
  {
    -[HUGridBannerCellLayoutOptions titleTopInset](self, "titleTopInset");
    v43 = v35 + v42;
    -[HUGridBannerCellLayoutOptions iconHeight](self, "iconHeight");
    v45 = v44;
    -[HUGridBannerCellLayoutOptions verticalSpacingForLipElements](self, "verticalSpacingForLipElements");
    v39 = v43 + v45 + v46;
    if (!objc_msgSend(v14, "length"))
      goto LABEL_12;
LABEL_11:
    -[HUGridBannerCellLayoutOptions verticalSpacingForLineView](self, "verticalSpacingForLineView");
    v48 = v39 + v47 + 1.0;
    -[HUGridBannerCellLayoutOptions verticalSpacingForLipElements](self, "verticalSpacingForLipElements");
    v50 = v49;
    -[HUGridBannerCellLayoutOptions footerViewLabelFont](self, "footerViewLabelFont");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "lineHeight");
    v39 = v48 + ceil(v52) + v50 * 2.0;

    goto LABEL_12;
  }
  if (!objc_msgSend(v14, "length"))
  {
    -[HUGridBannerCellLayoutOptions iconHeight](self, "iconHeight");
    if (v36 > v35)
    {
      -[HUGridBannerCellLayoutOptions iconHeight](self, "iconHeight");
      v35 = v37;
    }
  }
  -[HUGridBannerCellLayoutOptions titleTopInset](self, "titleTopInset");
  v39 = v35 + v38;
  if (objc_msgSend(v14, "length"))
    goto LABEL_11;
  -[HUGridBannerCellLayoutOptions iconHeight](self, "iconHeight");
  if (v35 >= v40)
  {
    -[HUGridBannerCellLayoutOptions verticalSpacingForLineView](self, "verticalSpacingForLineView");
    v39 = v39 + v41 + 1.0;
  }
LABEL_12:

  return v39;
}

@end
