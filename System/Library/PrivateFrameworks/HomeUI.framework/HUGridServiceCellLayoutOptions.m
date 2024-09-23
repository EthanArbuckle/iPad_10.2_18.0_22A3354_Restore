@implementation HUGridServiceCellLayoutOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[HUGridServiceCellLayoutOptions lineSpacing](self, "lineSpacing");
  objc_msgSend(v4, "setLineSpacing:");
  -[HUGridServiceCellLayoutOptions iconToTitleSpacing](self, "iconToTitleSpacing");
  objc_msgSend(v4, "setIconToTitleSpacing:");
  objc_msgSend(v4, "setShowIconOnly:", -[HUGridServiceCellLayoutOptions shouldShowIconOnly](self, "shouldShowIconOnly"));
  objc_msgSend(v4, "setShowDescription:", -[HUGridServiceCellLayoutOptions shouldShowDescription](self, "shouldShowDescription"));
  objc_msgSend(v4, "setShowAccessoryView:", -[HUGridServiceCellLayoutOptions shouldShowAccessoryView](self, "shouldShowAccessoryView"));
  return v4;
}

- (BOOL)shouldShowIconOnly
{
  return self->_showIconOnly;
}

- (BOOL)shouldShowDescription
{
  return self->_showDescription;
}

- (BOOL)shouldShowAccessoryView
{
  return self->_showAccessoryView;
}

- (void)setShowIconOnly:(BOOL)a3
{
  self->_showIconOnly = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (double)iconToTitleSpacing
{
  return self->_iconToTitleSpacing;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[7];

  v22[5] = *MEMORY[0x1E0C80C00];
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___HUGridServiceCellLayoutOptions;
  objc_msgSendSuper2(&v14, sel_defaultOptionsForCellSizeSubclass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = &unk_1E7041A10;
  v21[1] = &unk_1E70419F8;
  v22[0] = &unk_1E7043748;
  v22[1] = &unk_1E7043768;
  v21[2] = &unk_1E7041A28;
  v21[3] = &unk_1E7041A88;
  v22[2] = &unk_1E7043868;
  v22[3] = &unk_1E7043758;
  v21[4] = &unk_1E7041A40;
  v22[4] = &unk_1E7043748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HUConstantForCellSizeSubclass(a3, v5);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v6, *MEMORY[0x1E0CEB5D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v7);

  v19[0] = &unk_1E7041A10;
  v19[1] = &unk_1E70419F8;
  v20[0] = &unk_1E7043868;
  v20[1] = &unk_1E7043828;
  v19[2] = &unk_1E7041A28;
  v19[3] = &unk_1E7041A88;
  v20[2] = &unk_1E7043878;
  v20[3] = &unk_1E7043888;
  v19[4] = &unk_1E7041A40;
  v20[4] = &unk_1E7043828;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineSpacing:", HUConstantForCellSizeSubclass(a3, v8));

  objc_msgSend(v4, "setIconToTitleSpacing:", 6.0);
  objc_msgSend(v4, "setShowDescription:", 1);
  objc_msgSend(v4, "setShowAccessoryView:", 1);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB548]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v10);

    v17[0] = &unk_1E7041A10;
    v17[1] = &unk_1E70419F8;
    v18[0] = &unk_1E7043868;
    v18[1] = &unk_1E7043758;
    v17[2] = &unk_1E7041A28;
    v17[3] = &unk_1E7041A88;
    v18[2] = &unk_1E7043828;
    v18[3] = &unk_1E7043838;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLineSpacing:", HUConstantForCellSizeSubclass(a3, v11));

    v15[0] = &unk_1E7041A10;
    v15[1] = &unk_1E70419F8;
    v16[0] = &unk_1E7043738;
    v16[1] = &unk_1E7043748;
    v15[2] = &unk_1E7041A28;
    v15[3] = &unk_1E7041A88;
    v16[2] = &unk_1E7043768;
    v16[3] = &unk_1E7043738;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCellInnerMargin:", HUConstantForCellSizeSubclass(a3, v12));

  }
  return v4;
}

- (void)setShowDescription:(BOOL)a3
{
  self->_showDescription = a3;
}

- (void)setShowAccessoryView:(BOOL)a3
{
  self->_showAccessoryView = a3;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (void)setIconToTitleSpacing:(double)a3
{
  self->_iconToTitleSpacing = a3;
}

@end
