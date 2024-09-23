@implementation HUQuickControlCollectionViewControllerLayoutOptions

+ (id)defaultOptions
{
  return (id)objc_msgSend(a1, "defaultOptionsForViewSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

+ (id)defaultOptionsForViewSize:(CGSize)a3
{
  HUQuickControlCollectionViewControllerLayoutOptions *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = -[HUQuickControlCollectionViewControllerLayoutOptions initWithViewSize:]([HUQuickControlCollectionViewControllerLayoutOptions alloc], "initWithViewSize:", a3.width, a3.height);
  v4 = -[HUQuickControlCollectionViewControllerLayoutOptions viewSizeSubclass](v3, "viewSizeSubclass");
  -[HUQuickControlCollectionViewControllerLayoutOptions setPreferredLayoutStyle:](v3, "setPreferredLayoutStyle:", 1);
  -[HUQuickControlCollectionViewControllerLayoutOptions setRowSpacing:](v3, "setRowSpacing:", 33.0);
  v16[0] = &unk_1E7041068;
  v16[1] = &unk_1E7041080;
  v17[0] = &unk_1E7043508;
  v17[1] = &unk_1E7043518;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewControllerLayoutOptions setMinimumSectionSpacing:](v3, "setMinimumSectionSpacing:", HUConstantFloatForViewSizeSubclass(v4, v5));

  v14[0] = &unk_1E7041068;
  v14[1] = &unk_1E7041080;
  v15[0] = &unk_1E7043528;
  v15[1] = &unk_1E7043538;
  v14[2] = &unk_1E7041098;
  v15[2] = &unk_1E7043548;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewControllerLayoutOptions setMinimumNavBarToControlsSpacing:](v3, "setMinimumNavBarToControlsSpacing:", HUConstantFloatForViewSizeSubclass(v4, v6));

  v12[0] = &unk_1E7041068;
  v12[1] = &unk_1E7041080;
  v13[0] = &unk_1E7043558;
  v13[1] = &unk_1E7043568;
  v12[2] = &unk_1E7041098;
  v13[2] = &unk_1E7043578;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewControllerLayoutOptions setMinimumSectionToSensorSectionSpacing:](v3, "setMinimumSectionToSensorSectionSpacing:", HUConstantFloatForViewSizeSubclass(v4, v7));

  v10[0] = &unk_1E7041068;
  v10[1] = &unk_1E7041080;
  v11[0] = &unk_1E7043588;
  v11[1] = &unk_1E7043598;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCollectionViewControllerLayoutOptions setThermostatSectionSpacingOverride:](v3, "setThermostatSectionSpacingOverride:", HUConstantFloatForViewSizeSubclass(v4, v8));

  -[HUQuickControlCollectionViewControllerLayoutOptions setInteritemSpacingForExtraSmallControlSize:](v3, "setInteritemSpacingForExtraSmallControlSize:", 31.0);
  -[HUQuickControlCollectionViewControllerLayoutOptions setInteritemSpacingForSmallControlSize:](v3, "setInteritemSpacingForSmallControlSize:", 31.0);
  -[HUQuickControlCollectionViewControllerLayoutOptions setInteritemSpacingForRegularControlSize:](v3, "setInteritemSpacingForRegularControlSize:", 31.0);
  -[HUQuickControlCollectionViewControllerLayoutOptions setInteritemSpacingForLargeControlSize:](v3, "setInteritemSpacingForLargeControlSize:", 31.0);
  return v3;
}

- (HUQuickControlCollectionViewControllerLayoutOptions)initWithViewSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  HUQuickControlCollectionViewControllerLayoutOptions *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlCollectionViewControllerLayoutOptions;
  result = -[HUQuickControlCollectionViewControllerLayoutOptions init](&v6, sel_init);
  if (result)
  {
    result->_viewSize.width = width;
    result->_viewSize.height = height;
  }
  return result;
}

- (int64_t)viewSizeSubclass
{
  double v2;
  double v3;

  -[HUQuickControlCollectionViewControllerLayoutOptions viewSize](self, "viewSize");
  return HUViewSizeSubclassForViewSize(v2, v3);
}

- (double)rowSpacing
{
  return self->_rowSpacing;
}

- (void)setRowSpacing:(double)a3
{
  self->_rowSpacing = a3;
}

- (double)interitemSpacingForExtraSmallControlSize
{
  return self->_interitemSpacingForExtraSmallControlSize;
}

- (void)setInteritemSpacingForExtraSmallControlSize:(double)a3
{
  self->_interitemSpacingForExtraSmallControlSize = a3;
}

- (double)interitemSpacingForSmallControlSize
{
  return self->_interitemSpacingForSmallControlSize;
}

- (void)setInteritemSpacingForSmallControlSize:(double)a3
{
  self->_interitemSpacingForSmallControlSize = a3;
}

- (double)interitemSpacingForRegularControlSize
{
  return self->_interitemSpacingForRegularControlSize;
}

- (void)setInteritemSpacingForRegularControlSize:(double)a3
{
  self->_interitemSpacingForRegularControlSize = a3;
}

- (double)interitemSpacingForLargeControlSize
{
  return self->_interitemSpacingForLargeControlSize;
}

- (void)setInteritemSpacingForLargeControlSize:(double)a3
{
  self->_interitemSpacingForLargeControlSize = a3;
}

- (double)minimumSectionSpacing
{
  return self->_minimumSectionSpacing;
}

- (void)setMinimumSectionSpacing:(double)a3
{
  self->_minimumSectionSpacing = a3;
}

- (double)minimumNavBarToControlsSpacing
{
  return self->_minimumNavBarToControlsSpacing;
}

- (void)setMinimumNavBarToControlsSpacing:(double)a3
{
  self->_minimumNavBarToControlsSpacing = a3;
}

- (double)minimumSectionToSensorSectionSpacing
{
  return self->_minimumSectionToSensorSectionSpacing;
}

- (void)setMinimumSectionToSensorSectionSpacing:(double)a3
{
  self->_minimumSectionToSensorSectionSpacing = a3;
}

- (double)thermostatSectionSpacingOverride
{
  return self->_thermostatSectionSpacingOverride;
}

- (void)setThermostatSectionSpacingOverride:(double)a3
{
  self->_thermostatSectionSpacingOverride = a3;
}

- (unint64_t)preferredLayoutStyle
{
  return self->_preferredLayoutStyle;
}

- (void)setPreferredLayoutStyle:(unint64_t)a3
{
  self->_preferredLayoutStyle = a3;
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (void)setTitlePosition:(unint64_t)a3
{
  self->_titlePosition = a3;
}

- (CGSize)viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewSize.width;
  height = self->_viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSNumber)overrideSizeSubclass
{
  return self->_overrideSizeSubclass;
}

- (void)setOverrideSizeSubclass:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSizeSubclass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSizeSubclass, 0);
}

@end
