@implementation HUGridCellLayoutOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCellSizeSubclass:", -[HUGridCellLayoutOptions cellSizeSubclass](self, "cellSizeSubclass"));
  -[HUGridCellLayoutOptions backgroundDisplayOptions](self, "backgroundDisplayOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundDisplayOptions:", v5);

  -[HUGridCellLayoutOptions vibrancyEffect](self, "vibrancyEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVibrancyEffect:", v6);

  -[HUGridCellLayoutOptions secondaryVibrancyEffect](self, "secondaryVibrancyEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryVibrancyEffect:", v7);

  -[HUGridCellLayoutOptions iconVibrancyEffect](self, "iconVibrancyEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconVibrancyEffect:", v8);

  -[HUGridCellLayoutOptions secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
  objc_msgSend(v4, "setSecondaryContentDimmingFactor:");
  objc_msgSend(v4, "setContentColorStyle:", -[HUGridCellLayoutOptions contentColorStyle](self, "contentColorStyle"));
  -[HUGridCellLayoutOptions contentSizeCategory](self, "contentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentSizeCategory:", v9);

  -[HUGridCellLayoutOptions font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v10);

  -[HUGridCellLayoutOptions iconSize](self, "iconSize");
  objc_msgSend(v4, "setIconSize:");
  -[HUGridCellLayoutOptions cellInnerMargin](self, "cellInnerMargin");
  objc_msgSend(v4, "setCellInnerMargin:");
  -[HUGridCellLayoutOptions cellCornerRadius](self, "cellCornerRadius");
  objc_msgSend(v4, "setCellCornerRadius:");
  objc_msgSend(v4, "setOnStateBorderStyle:", -[HUGridCellLayoutOptions onStateBorderStyle](self, "onStateBorderStyle"));
  return v4;
}

- (void)setContentColorStyle:(unint64_t)a3
{
  id v4;

  self->_contentColorStyle = a3;
  -[HUGridCellLayoutOptions backgroundDisplayOptions](self, "backgroundDisplayOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentColorStyle:", a3);

}

- (HUGridCellBackgroundDisplayOptions)backgroundDisplayOptions
{
  return self->_backgroundDisplayOptions;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (double)iconSize
{
  return self->_iconSize;
}

- (double)cellCornerRadius
{
  return self->_cellCornerRadius;
}

- (UIVisualEffect)vibrancyEffect
{
  return self->_vibrancyEffect;
}

- (UIVisualEffect)secondaryVibrancyEffect
{
  return self->_secondaryVibrancyEffect;
}

- (double)secondaryContentDimmingFactor
{
  return self->_secondaryContentDimmingFactor;
}

- (unint64_t)contentColorStyle
{
  return self->_contentColorStyle;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
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
  _QWORD v20[2];
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_10 != -1)
    dispatch_once(&_MergedGlobals_10, &__block_literal_global_244);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    a3 = 4;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCellSizeSubclass:", a3);
  +[HUGridCellBackgroundDisplayOptions defaultOptions](HUGridCellBackgroundDisplayOptions, "defaultOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundDisplayOptions:", v6);

  objc_msgSend(v5, "setVibrancyEffect:", qword_1ED580E38);
  objc_msgSend(v5, "setSecondaryVibrancyEffect:", 0);
  objc_msgSend(v5, "setSecondaryContentDimmingFactor:", 0.67);
  objc_msgSend(v5, "setContentColorStyle:", 0);
  objc_msgSend(v5, "setContentSizeCategory:", *MEMORY[0x1E0CEB440]);
  HUDefaultSizeForIconSize();
  objc_msgSend(v5, "setIconSize:", v7);
  v21[0] = &unk_1E7041A10;
  v21[1] = &unk_1E70419F8;
  v22[0] = &unk_1E7043728;
  v22[1] = &unk_1E7043738;
  v21[2] = &unk_1E7041A28;
  v21[3] = &unk_1E7041A88;
  v22[2] = &unk_1E7043748;
  v22[3] = &unk_1E7043758;
  v21[4] = &unk_1E7041A40;
  v22[4] = &unk_1E7043738;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCellInnerMargin:", HUConstantForCellSizeSubclass(a3, v8));

  objc_msgSend(v5, "setCellCornerRadius:", 16.0);
  objc_msgSend(v5, "setCellScaleFactor:", 1.0);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(v5, "backgroundDisplayOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisplayStyle:", 2);

    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterPrimaryVibrancyEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVibrancyEffect:", v10);

    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecondaryVibrancyEffect:", v11);

    if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService"))
    {
      v12 = (void *)MEMORY[0x1E0CEA480];
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "colorEffectMonochromeTint:blendingAmount:brightnessAdjustment:", v13, 1.0, 0.45);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0CEABE0];
      v20[0] = v14;
      objc_msgSend(v5, "vibrancyEffect");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "effectCombiningEffects:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIconVibrancyEffect:", v18);

    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard"))
        objc_msgSend(v5, "secondaryVibrancyEffect");
      else
        objc_msgSend(v5, "vibrancyEffect");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setIconVibrancyEffect:", v14);
    }

    CCUICompactModuleContinuousCornerRadius();
    objc_msgSend(v5, "setCellCornerRadius:");
    objc_msgSend(v5, "setSecondaryContentDimmingFactor:", 0.25);
  }
  return v5;
}

- (void)setVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyEffect, a3);
}

- (void)setIconSize:(double)a3
{
  self->_iconSize = a3;
}

- (void)setCellCornerRadius:(double)a3
{
  self->_cellCornerRadius = a3;
}

- (void)setSecondaryVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryVibrancyEffect, a3);
}

- (void)setSecondaryContentDimmingFactor:(double)a3
{
  self->_secondaryContentDimmingFactor = a3;
}

- (void)setCellInnerMargin:(double)a3
{
  self->_cellInnerMargin = a3;
}

- (void)setBackgroundDisplayOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HUGridCellLayoutOptions)initWithCellSizeSubclass:(int64_t)a3
{
  HUGridCellLayoutOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUGridCellLayoutOptions;
  result = -[HUGridCellLayoutOptions init](&v5, sel_init);
  if (result)
    result->_cellSizeSubclass = a3;
  return result;
}

- (void)setCellScaleFactor:(double)a3
{
  self->_cellScaleFactor = a3;
}

- (unint64_t)onStateBorderStyle
{
  return self->_onStateBorderStyle;
}

- (int64_t)cellSizeSubclass
{
  return self->_cellSizeSubclass;
}

- (void)setOnStateBorderStyle:(unint64_t)a3
{
  self->_onStateBorderStyle = a3;
}

- (void)setIconVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_iconVibrancyEffect, a3);
}

- (UIVisualEffect)iconVibrancyEffect
{
  return self->_iconVibrancyEffect;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (double)cellInnerMargin
{
  return self->_cellInnerMargin;
}

- (void)setContentSizeCategory:(id)a3
{
  self->_contentSizeCategory = (NSString *)a3;
}

- (double)gutter
{
  -[HUGridCellLayoutOptions cellSizeSubclass](self, "cellSizeSubclass");
  return 10.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_iconVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_secondaryVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
  objc_storeStrong((id *)&self->_backgroundDisplayOptions, 0);
}

void __61__HUGridCellLayoutOptions_defaultOptionsForCellSizeSubclass___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580E38;
  qword_1ED580E38 = v0;

}

- (int64_t)iconContentMode
{
  return self->_iconContentMode;
}

- (void)setIconContentMode:(int64_t)a3
{
  self->_iconContentMode = a3;
}

- (double)cellScaleFactor
{
  return self->_cellScaleFactor;
}

@end
