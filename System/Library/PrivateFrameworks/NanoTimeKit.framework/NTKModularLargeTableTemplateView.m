@implementation NTKModularLargeTableTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NTKModularLargeTableTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularLargeTableTemplateView *v3;
  NTKModularLargeTableTemplateView *v4;
  uint64_t v5;
  CLKUIColoringLabel *headerLabel;
  uint64_t v7;
  CLKUIColoringLabel *row1Column1Label;
  uint64_t v9;
  CLKUIColoringLabel *row1Column2Label;
  uint64_t v11;
  CLKUIColoringLabel *row2Column1Label;
  uint64_t v13;
  CLKUIColoringLabel *row2Column2Label;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKModularLargeTableTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[NTKModularLargeColumnTemplateView _newHeaderLabelSubview](v3, "_newHeaderLabelSubview");
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (CLKUIColoringLabel *)v5;

    v7 = -[NTKModularLargeColumnTemplateView _newBodyLabelSubview](v4, "_newBodyLabelSubview");
    row1Column1Label = v4->_row1Column1Label;
    v4->_row1Column1Label = (CLKUIColoringLabel *)v7;

    v9 = -[NTKModularLargeColumnTemplateView _newBodyLabelSubview](v4, "_newBodyLabelSubview");
    row1Column2Label = v4->_row1Column2Label;
    v4->_row1Column2Label = (CLKUIColoringLabel *)v9;

    v11 = -[NTKModularLargeColumnTemplateView _newBodyLabelSubview](v4, "_newBodyLabelSubview");
    row2Column1Label = v4->_row2Column1Label;
    v4->_row2Column1Label = (CLKUIColoringLabel *)v11;

    v13 = -[NTKModularLargeColumnTemplateView _newBodyLabelSubview](v4, "_newBodyLabelSubview");
    row2Column2Label = v4->_row2Column2Label;
    v4->_row2Column2Label = (CLKUIColoringLabel *)v13;

  }
  return v4;
}

- (void)_layoutContentView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CDComplicationImageView *headerImageView;
  CLKUIColoringLabel *headerLabel;
  void *v16;
  id v17;
  __int128 v18;
  double v19;
  __int128 v20;
  double v21;
  __int128 v22;

  -[NTKModuleView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v6, &v22);
  v7 = *((double *)&v22 + 1);

  -[NTKModuleView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_38(v8, &v20);
  v9 = v21;

  -[CDComplicationImageView sizeToFit](self->_headerImageView, "sizeToFit");
  -[CDComplicationImageView frame](self->_headerImageView, "frame");
  v11 = v5 - v7 - v9;
  if (v10 > 0.0)
  {
    v12 = v10;
    -[NTKModuleView device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_38(v13, &v18);
    v11 = v11 - (v12 + v19);

  }
  -[CLKUIColoringLabel setMaxWidth:](self->_headerLabel, "setMaxWidth:", v11);
  -[CLKUIColoringLabel sizeToFit](self->_headerLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_headerLabel, "frame");
  -[CLKUIColoringLabel setFrame:](self->_headerLabel, "setFrame:");
  headerImageView = self->_headerImageView;
  headerLabel = self->_headerLabel;
  -[NTKModuleView device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModularLargeColumnTemplateView _positionLeadingAlignedImageView:label:withBaselineOffset:](self, "_positionLeadingAlignedImageView:label:withBaselineOffset:", headerImageView, headerLabel, _LargeModularLayoutConstants(v16));

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKModularLargeColumnTemplateView _layoutRowsOfColumnsWithAlignment:](self, "_layoutRowsOfColumnsWithAlignment:", objc_msgSend(v17, "column2Alignment"));

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_headerLabel);

}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row1Column2Label);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row2Column1Label);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row2Column2Label);

}

- (void)_enumerateColumnRowsWithBlock:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void (**v12)(id, _QWORD, CLKUIColoringLabel *, CLKUIColoringLabel *, double);

  v12 = (void (**)(id, _QWORD, CLKUIColoringLabel *, CLKUIColoringLabel *, double))a3;
  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _LargeModularLayoutConstants(v4);

  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LargeModularLayoutConstants(v6);
  v8 = v5 + v7;

  v12[2](v12, 0, self->_row1Column1Label, self->_row1Column2Label, v8);
  -[NTKModuleView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _LargeModularLayoutConstants(v9);
  v11 = v8 + v10;

  v12[2](v12, 0, self->_row2Column1Label, self->_row2Column2Label, v11);
}

- (void)_update
{
  void *v3;
  char v4;
  CDComplicationImageView *headerImageView;
  CDComplicationImageView *v6;
  CDComplicationImageView *v7;
  void *v8;
  CDComplicationImageView *v9;
  void *v10;
  CLKUIColoringLabel *headerLabel;
  void *v12;
  CLKUIColoringLabel *row1Column1Label;
  void *v14;
  CLKUIColoringLabel *row1Column2Label;
  void *v16;
  CLKUIColoringLabel *row2Column1Label;
  void *v18;
  CLKUIColoringLabel *row2Column2Label;
  void *v20;
  void *v21;
  id v22;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "headerImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_headerImageView, v3);
  headerImageView = self->_headerImageView;
  if ((v4 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](headerImageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v3);
    v6 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v7 = self->_headerImageView;
    self->_headerImageView = v6;

    if (self->_headerImageView)
    {
      -[NTKModuleView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_headerImageView);

      v9 = self->_headerImageView;
      -[NTKModuleView foregroundColor](self, "foregroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDComplicationImageView setColor:](v9, "setColor:", v10);

      headerImageView = self->_headerImageView;
    }
    else
    {
      headerImageView = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](headerImageView, "setImageProvider:", v3);
  -[CDComplicationImageView setHidden:](self->_headerImageView, "setHidden:", v3 == 0);
  headerLabel = self->_headerLabel;
  objc_msgSend(v22, "headerTextProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLabel, "setTextProvider:", v12);

  row1Column1Label = self->_row1Column1Label;
  objc_msgSend(v22, "row1Column1TextProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row1Column1Label, "setTextProvider:", v14);

  row1Column2Label = self->_row1Column2Label;
  objc_msgSend(v22, "row1Column2TextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row1Column2Label, "setTextProvider:", v16);

  row2Column1Label = self->_row2Column1Label;
  objc_msgSend(v22, "row2Column1TextProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row2Column1Label, "setTextProvider:", v18);

  row2Column2Label = self->_row2Column2Label;
  objc_msgSend(v22, "row2Column2TextProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row2Column2Label, "setTextProvider:", v20);

  -[NTKModularLargeColumnTemplateView setUseNoColumnPadding:](self, "setUseNoColumnPadding:", objc_msgSend(v22, "useNoColumnPadding"));
  -[NTKModuleView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row2Column2Label, 0);
  objc_storeStrong((id *)&self->_row2Column1Label, 0);
  objc_storeStrong((id *)&self->_row1Column2Label, 0);
  objc_storeStrong((id *)&self->_row1Column1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end
