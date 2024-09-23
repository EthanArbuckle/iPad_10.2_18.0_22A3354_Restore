@implementation HUMosaicCameraCellLayoutOptions

- (double)mosaicInterItemSpacing
{
  return self->_mosaicInterItemSpacing;
}

- (double)cameraCellHeight
{
  double v2;

  -[HUMosaicCameraCellLayoutOptions cameraCellWidth](self, "cameraCellWidth");
  return v2 / 1.77777778;
}

- (double)cameraCellWidth
{
  unint64_t v3;
  double v4;
  double v5;

  v3 = -[HUMosaicCameraCellLayoutOptions viewSizeSubclass](self, "viewSizeSubclass") - 1;
  if (v3 > 9)
    v4 = 320.0;
  else
    v4 = dbl_1B9442EF8[v3];
  -[HUMosaicCameraCellLayoutOptions maxWidth](self, "maxWidth");
  if (v4 < v5)
    v5 = v4;
  return v5 + -40.0;
}

- (int64_t)viewSizeSubclass
{
  return self->_viewSizeSubclass;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3 viewSizeSubclass:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  objc_super v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___HUMosaicCameraCellLayoutOptions;
  objc_msgSendSuper2(&v18, sel_defaultOptionsForCellSizeSubclass_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setViewSizeSubclass:", a4);
  v7 = *MEMORY[0x1E0CEB590];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0CEB590], 1024);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v8);

  v9 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
  objc_msgSend(v9, "monospacedDigitSystemFontOfSize:weight:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scaledFontForFont:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingLabelFont:", v12);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryLabelFont:", v13);

  objc_msgSend(v6, "setDescriptionInset:", 10.0);
  v19[0] = &unk_1E7041A10;
  v19[1] = &unk_1E70419F8;
  v20[0] = &unk_1E70438B8;
  v20[1] = &unk_1E70438C8;
  v19[2] = &unk_1E7041A28;
  v19[3] = &unk_1E7041A88;
  v20[2] = &unk_1E70438D8;
  v20[3] = &unk_1E7043738;
  v19[4] = &unk_1E7041A40;
  v20[4] = &unk_1E70438C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterItemSpacing:", HUConstantForCellSizeSubclass(a3, v14));

  objc_msgSend(v6, "setExpandedFormatAspectRatio:", 0.98);
  if (a3 == 3)
  {
    objc_msgSend(v6, "setMaxWidth:", 359.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v6, "setMaxWidth:", v16);

  }
  objc_msgSend(v6, "setMosaicInterItemSpacing:", 2.0);

  return v6;
}

- (void)setViewSizeSubclass:(int64_t)a3
{
  self->_viewSizeSubclass = a3;
}

- (void)setTimingLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_timingLabelFont, a3);
}

- (void)setSecondaryLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelFont, a3);
}

- (void)setMosaicInterItemSpacing:(double)a3
{
  self->_mosaicInterItemSpacing = a3;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void)setInterItemSpacing:(double)a3
{
  self->_interItemSpacing = a3;
}

- (void)setExpandedFormatAspectRatio:(double)a3
{
  self->_expandedFormatAspectRatio = a3;
}

- (void)setDescriptionInset:(double)a3
{
  self->_descriptionInset = a3;
}

- (void)setIsMosaicCell:(BOOL)a3
{
  self->_isMosaicCell = a3;
}

- (UIFont)timingLabelFont
{
  return self->_timingLabelFont;
}

- (double)cornerRadiusForCellSize:(CGSize)a3
{
  double result;

  if (!-[HUMosaicCameraCellLayoutOptions isSingleCell](self, "isSingleCell", a3.width, a3.height))
    return 0.0;
  -[HUGridCellLayoutOptions cellCornerRadius](self, "cellCornerRadius");
  return result;
}

- (BOOL)isSingleCell
{
  return !-[HUMosaicCameraCellLayoutOptions isMosaicCell](self, "isMosaicCell");
}

- (BOOL)isMosaicCell
{
  return self->_isMosaicCell;
}

- (double)descriptionInset
{
  return self->_descriptionInset;
}

- (UIFont)secondaryLabelFont
{
  return self->_secondaryLabelFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabelFont, 0);
  objc_storeStrong((id *)&self->_timingLabelFont, 0);
}

- (unint64_t)numColumnsForContainerWidth:(double)a3 minimumCameraCellWidth:(double)a4 padding:(double)a5
{
  if (-[HUGridCellLayoutOptions cellSizeSubclass](self, "cellSizeSubclass") == 3
    && a4 + a4 + a5 - a3 < 0.00000011920929)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

+ (double)columnWidthForContainerWidth:(double)a3 numberOfColumns:(unint64_t)a4 padding:(double)a5
{
  return (a3 - a5 * (double)(a4 - 1)) / (double)a4;
}

+ (double)heightForWidth:(double)a3
{
  return a3 / 1.77777778;
}

+ (double)widthForHeight:(double)a3
{
  return a3 * 1.77777778;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUMosaicCameraCellLayoutOptions;
  v4 = -[HUGridCellLayoutOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[HUMosaicCameraCellLayoutOptions descriptionInset](self, "descriptionInset");
  objc_msgSend(v4, "setDescriptionInset:");
  return v4;
}

- (double)interItemSpacing
{
  return self->_interItemSpacing;
}

- (double)minimumCameraCellWidth
{
  return self->_minimumCameraCellWidth;
}

- (double)expandedFormatAspectRatio
{
  return self->_expandedFormatAspectRatio;
}

@end
