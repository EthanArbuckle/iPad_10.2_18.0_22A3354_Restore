@implementation HUGridMediaPlatterCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUGridMediaPlatterCellLayoutOptions;
  objc_msgSendSuper2(&v8, sel_defaultOptionsForCellSizeSubclass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = &unk_1E7041A10;
  v11[1] = &unk_1E70419F8;
  v12[0] = &unk_1E70436D8;
  v12[1] = &unk_1E70438A8;
  v11[2] = &unk_1E7041A88;
  v11[3] = &unk_1E7041A40;
  v12[2] = &unk_1E7043818;
  v12[3] = &unk_1E70438A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellHeight:", HUConstantForCellSizeSubclass(a3, v5));

  v9[0] = &unk_1E7041A10;
  v9[1] = &unk_1E70419F8;
  v10[0] = &unk_1E70437F8;
  v10[1] = &unk_1E70437F8;
  v9[2] = &unk_1E7041A88;
  v9[3] = &unk_1E7041A40;
  v10[2] = &unk_1E70437F8;
  v10[3] = &unk_1E70437F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterPlatterSpacing:", HUConstantForCellSizeSubclass(a3, v6));

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridMediaPlatterCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[HUGridMediaPlatterCellLayoutOptions cellHeight](self, "cellHeight");
  objc_msgSend(v4, "setCellHeight:");
  -[HUGridMediaPlatterCellLayoutOptions interPlatterSpacing](self, "interPlatterSpacing");
  objc_msgSend(v4, "setInterPlatterSpacing:");
  return v4;
}

- (void)setInterPlatterSpacing:(double)a3
{
  self->_interPlatterSpacing = a3;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (double)interPlatterSpacing
{
  return self->_interPlatterSpacing;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

@end
