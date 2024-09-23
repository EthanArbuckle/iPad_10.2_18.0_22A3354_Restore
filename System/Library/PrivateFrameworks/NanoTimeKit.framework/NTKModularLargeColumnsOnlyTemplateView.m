@implementation NTKModularLargeColumnsOnlyTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NTKModularLargeColumnsOnlyTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularLargeColumnsOnlyTemplateView *v3;
  NTKModularLargeColumnsOnlyTemplateView *v4;
  uint64_t v5;
  CLKUIColoringLabel *row1Column1Label;
  uint64_t v7;
  CLKUIColoringLabel *row2Column1Label;
  uint64_t v9;
  CLKUIColoringLabel *row3Column1Label;
  uint64_t v11;
  CLKUIColoringLabel *row1Column2Label;
  uint64_t v13;
  CLKUIColoringLabel *row2Column2Label;
  uint64_t v15;
  CLKUIColoringLabel *row3Column2Label;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKModularLargeColumnsOnlyTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[NTKModularLargeColumnTemplateView _newHeaderLabelSubview](v3, "_newHeaderLabelSubview");
    row1Column1Label = v4->_row1Column1Label;
    v4->_row1Column1Label = (CLKUIColoringLabel *)v5;

    v7 = -[NTKModularLargeColumnTemplateView _newHeaderLabelSubview](v4, "_newHeaderLabelSubview");
    row2Column1Label = v4->_row2Column1Label;
    v4->_row2Column1Label = (CLKUIColoringLabel *)v7;

    v9 = -[NTKModularLargeColumnTemplateView _newHeaderLabelSubview](v4, "_newHeaderLabelSubview");
    row3Column1Label = v4->_row3Column1Label;
    v4->_row3Column1Label = (CLKUIColoringLabel *)v9;

    v11 = -[NTKModularLargeColumnTemplateView _newBodyLabelSubview](v4, "_newBodyLabelSubview");
    row1Column2Label = v4->_row1Column2Label;
    v4->_row1Column2Label = (CLKUIColoringLabel *)v11;

    v13 = -[NTKModularLargeColumnTemplateView _newBodyLabelSubview](v4, "_newBodyLabelSubview");
    row2Column2Label = v4->_row2Column2Label;
    v4->_row2Column2Label = (CLKUIColoringLabel *)v13;

    v15 = -[NTKModularLargeColumnTemplateView _newBodyLabelSubview](v4, "_newBodyLabelSubview");
    row3Column2Label = v4->_row3Column2Label;
    v4->_row3Column2Label = (CLKUIColoringLabel *)v15;

  }
  return v4;
}

- (void)_layoutContentView
{
  id v3;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKModularLargeColumnTemplateView _layoutRowsOfColumnsWithAlignment:](self, "_layoutRowsOfColumnsWithAlignment:", objc_msgSend(v3, "column2Alignment"));

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_row2ImageView);
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_row3ImageView);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row1Column1Label);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row2Column1Label);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row3Column1Label);

}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row2Column2Label);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_row3Column2Label);

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
  void (**v12)(id, CDComplicationImageView *, CLKUIColoringLabel *, CLKUIColoringLabel *, double);

  v12 = (void (**)(id, CDComplicationImageView *, CLKUIColoringLabel *, CLKUIColoringLabel *, double))a3;
  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _LargeModularLayoutConstants(v4);

  v12[2](v12, self->_row1ImageView, self->_row1Column1Label, self->_row1Column2Label, v5);
  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _LargeModularLayoutConstants(v6);
  v8 = v5 + v7;

  v12[2](v12, self->_row2ImageView, self->_row2Column1Label, self->_row2Column2Label, v8);
  -[NTKModuleView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _LargeModularLayoutConstants(v9);
  v11 = v8 + v10;

  v12[2](v12, self->_row3ImageView, self->_row3Column1Label, self->_row3Column2Label, v11);
}

- (void)_update
{
  void *v3;
  char v4;
  CDComplicationImageView *row1ImageView;
  CDComplicationImageView *v6;
  CDComplicationImageView *v7;
  CDComplicationImageView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  CDComplicationImageView *row2ImageView;
  CDComplicationImageView *v15;
  CDComplicationImageView *v16;
  CDComplicationImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  CDComplicationImageView *row3ImageView;
  CDComplicationImageView *v23;
  CDComplicationImageView *v24;
  CDComplicationImageView *v25;
  void *v26;
  void *v27;
  CLKUIColoringLabel *row1Column1Label;
  void *v29;
  CLKUIColoringLabel *row1Column2Label;
  void *v31;
  CLKUIColoringLabel *row2Column1Label;
  void *v33;
  CLKUIColoringLabel *row2Column2Label;
  void *v35;
  CLKUIColoringLabel *row3Column1Label;
  void *v37;
  CLKUIColoringLabel *row3Column2Label;
  void *v39;
  void *v40;
  id v41;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "row1ImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_row1ImageView, v3);
  row1ImageView = self->_row1ImageView;
  if ((v4 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](self->_row1ImageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v3);
    v6 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v7 = self->_row1ImageView;
    self->_row1ImageView = v6;

    v8 = self->_row1ImageView;
    -[NTKModuleView foregroundColor](self, "foregroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDComplicationImageView setColor:](v8, "setColor:", v9);

    if (self->_row1ImageView)
    {
      -[NTKModuleView contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_row1ImageView);

      row1ImageView = self->_row1ImageView;
    }
    else
    {
      row1ImageView = 0;
    }
  }
  objc_msgSend(v41, "row1ImageProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDComplicationImageView setImageProvider:](row1ImageView, "setImageProvider:", v11);

  -[CDComplicationImageView setHidden:](self->_row1ImageView, "setHidden:", v3 == 0);
  objc_msgSend(v41, "row2ImageProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_row2ImageView, v12);
  row2ImageView = self->_row2ImageView;
  if ((v13 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](row2ImageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v12);
    v15 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v16 = self->_row2ImageView;
    self->_row2ImageView = v15;

    v17 = self->_row2ImageView;
    -[NTKModuleView foregroundColor](self, "foregroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDComplicationImageView setColor:](v17, "setColor:", v18);

    if (self->_row2ImageView)
    {
      -[NTKModuleView contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", self->_row2ImageView);

      row2ImageView = self->_row2ImageView;
    }
    else
    {
      row2ImageView = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](row2ImageView, "setImageProvider:", v12);
  -[CDComplicationImageView setHidden:](self->_row2ImageView, "setHidden:", v12 == 0);
  objc_msgSend(v41, "row3ImageProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_row3ImageView, v20);
  row3ImageView = self->_row3ImageView;
  if ((v21 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](row3ImageView, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v20);
    v23 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v24 = self->_row3ImageView;
    self->_row3ImageView = v23;

    v25 = self->_row3ImageView;
    -[NTKModuleView foregroundColor](self, "foregroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDComplicationImageView setColor:](v25, "setColor:", v26);

    if (self->_row3ImageView)
    {
      -[NTKModuleView contentView](self, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubview:", self->_row3ImageView);

      row3ImageView = self->_row3ImageView;
    }
    else
    {
      row3ImageView = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](row3ImageView, "setImageProvider:", v20);
  -[CDComplicationImageView setHidden:](self->_row3ImageView, "setHidden:", v20 == 0);
  row1Column1Label = self->_row1Column1Label;
  objc_msgSend(v41, "row1Column1TextProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row1Column1Label, "setTextProvider:", v29);

  row1Column2Label = self->_row1Column2Label;
  objc_msgSend(v41, "row1Column2TextProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row1Column2Label, "setTextProvider:", v31);

  row2Column1Label = self->_row2Column1Label;
  objc_msgSend(v41, "row2Column1TextProvider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row2Column1Label, "setTextProvider:", v33);

  row2Column2Label = self->_row2Column2Label;
  objc_msgSend(v41, "row2Column2TextProvider");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row2Column2Label, "setTextProvider:", v35);

  row3Column1Label = self->_row3Column1Label;
  objc_msgSend(v41, "row3Column1TextProvider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row3Column1Label, "setTextProvider:", v37);

  row3Column2Label = self->_row3Column2Label;
  objc_msgSend(v41, "row3Column2TextProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](row3Column2Label, "setTextProvider:", v39);

  -[NTKModularLargeColumnTemplateView setUseNoColumnPadding:](self, "setUseNoColumnPadding:", objc_msgSend(v41, "useNoColumnPadding"));
  -[NTKModuleView contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row3ImageView, 0);
  objc_storeStrong((id *)&self->_row2ImageView, 0);
  objc_storeStrong((id *)&self->_row1ImageView, 0);
  objc_storeStrong((id *)&self->_row3Column2Label, 0);
  objc_storeStrong((id *)&self->_row3Column1Label, 0);
  objc_storeStrong((id *)&self->_row2Column2Label, 0);
  objc_storeStrong((id *)&self->_row2Column1Label, 0);
  objc_storeStrong((id *)&self->_row1Column2Label, 0);
  objc_storeStrong((id *)&self->_row1Column1Label, 0);
}

@end
