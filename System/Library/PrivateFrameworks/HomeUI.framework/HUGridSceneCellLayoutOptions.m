@implementation HUGridSceneCellLayoutOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionFont, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUGridSceneCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[HUGridSceneCellLayoutOptions iconInnerHorizontalMargin](self, "iconInnerHorizontalMargin");
  objc_msgSend(v4, "setIconInnerHorizontalMargin:");
  -[HUGridSceneCellLayoutOptions descriptionFont](self, "descriptionFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionFont:", v5);

  -[HUGridSceneCellLayoutOptions titleInterLineSpacing](self, "titleInterLineSpacing");
  objc_msgSend(v4, "setTitleInterLineSpacing:");
  -[HUGridSceneCellLayoutOptions titleDescriptionLineSpacing](self, "titleDescriptionLineSpacing");
  objc_msgSend(v4, "setTitleDescriptionLineSpacing:");
  -[HUGridSceneCellLayoutOptions cellHeight](self, "cellHeight");
  objc_msgSend(v4, "setCellHeight:");
  objc_msgSend(v4, "setNumberOfTitleLines:", -[HUGridSceneCellLayoutOptions numberOfTitleLines](self, "numberOfTitleLines"));
  return v4;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

- (double)titleInterLineSpacing
{
  return self->_titleInterLineSpacing;
}

- (double)titleDescriptionLineSpacing
{
  return self->_titleDescriptionLineSpacing;
}

- (void)setTitleDescriptionLineSpacing:(double)a3
{
  self->_titleDescriptionLineSpacing = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (double)iconInnerHorizontalMargin
{
  return self->_iconInnerHorizontalMargin;
}

- (UIFont)descriptionFont
{
  return self->_descriptionFont;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v31.receiver = a1;
  v31.super_class = (Class)&OBJC_METACLASS___HUGridSceneCellLayoutOptions;
  objc_msgSendSuper2(&v31, sel_defaultOptionsForCellSizeSubclass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = &unk_1E7041A10;
  v42[1] = &unk_1E70419F8;
  v43[0] = &unk_1E7043738;
  v43[1] = &unk_1E7043748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconInnerHorizontalMargin:", HUConstantForCellSizeSubclass(a3, v5));

  v40[0] = &unk_1E7041A10;
  v40[1] = &unk_1E70419F8;
  v41[0] = &unk_1E7043828;
  v41[1] = &unk_1E7043838;
  v40[2] = &unk_1E7041A40;
  v41[2] = &unk_1E7043768;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HUConstantForCellSizeSubclass(a3, v6);

  v8 = *MEMORY[0x1E0CEB568];
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB568]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", v8, *MEMORY[0x1E0CEB5D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaledValueForValue:", v7);
  objc_msgSend(v10, "fontWithSize:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v11);

  v38[0] = &unk_1E7041A10;
  v38[1] = &unk_1E70419F8;
  v39[0] = &unk_1E7043748;
  v39[1] = &unk_1E7043768;
  v38[2] = &unk_1E7041A40;
  v39[2] = &unk_1E7043848;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HUConstantForCellSizeSubclass(a3, v12);

  v14 = *MEMORY[0x1E0CEB558];
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB558]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", v14, *MEMORY[0x1E0CEB5F8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scaledValueForValue:", v13);
  objc_msgSend(v16, "fontWithSize:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescriptionFont:", v17);

  objc_msgSend(v4, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lineHeight");
  objc_msgSend(v4, "setTitleInterLineSpacing:");

  v36[0] = &unk_1E7041A10;
  v36[1] = &unk_1E70419F8;
  v37[0] = &unk_1E70436D8;
  v37[1] = &unk_1E70437A8;
  v36[2] = &unk_1E7041A88;
  v36[3] = &unk_1E7041A40;
  v37[2] = &unk_1E7043818;
  v37[3] = &unk_1E7043858;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellHeight:", HUConstantForCellSizeSubclass(a3, v19));

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    MEMORY[0x1BCCC0A64]();
    objc_msgSend(v4, "setCellHeight:");
    v34[0] = &unk_1E7041A10;
    v34[1] = &unk_1E70419F8;
    v35[0] = &unk_1E7043748;
    v35[1] = &unk_1E7043768;
    v34[2] = &unk_1E7041A28;
    v34[3] = &unk_1E7041A88;
    v35[2] = &unk_1E7043868;
    v35[3] = &unk_1E7043758;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HUConstantForCellSizeSubclass(a3, v20);

    v22 = *MEMORY[0x1E0CEB548];
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB548]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v23, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v24);

    objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v25, "scaledValueForValue:", v13);
    objc_msgSend(v26, "systemFontOfSize:weight:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDescriptionFont:", v27);

    objc_msgSend(v4, "font");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lineHeight");
    objc_msgSend(v4, "setTitleInterLineSpacing:");

    v32[0] = &unk_1E7041A10;
    v32[1] = &unk_1E70419F8;
    v33[0] = &unk_1E7043828;
    v33[1] = &unk_1E7043838;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleDescriptionLineSpacing:", HUConstantForCellSizeSubclass(a3, v29));

    objc_msgSend(v4, "setIconSize:", 38.0);
    objc_msgSend(v4, "setIconInnerHorizontalMargin:", 20.0);
    objc_msgSend(v4, "setCellInnerMargin:", 20.0);

  }
  objc_msgSend(v4, "setNumberOfTitleLines:", 2);

  return v4;
}

- (void)setTitleInterLineSpacing:(double)a3
{
  self->_titleInterLineSpacing = a3;
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  self->_numberOfTitleLines = a3;
}

- (void)setIconInnerHorizontalMargin:(double)a3
{
  self->_iconInnerHorizontalMargin = a3;
}

- (void)setDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionFont, a3);
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

@end
