@implementation NTKRichComplicationRectangularLargeHeadlineBaseView

- (NTKRichComplicationRectangularLargeHeadlineBaseView)init
{
  NTKRichComplicationRectangularLargeHeadlineBaseView *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CDRichComplicationImageView *headerImageView;
  uint64_t v7;
  CDComplicationHostingView *headerSwiftUIView;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  CLKUIColoringLabel *headerLabel;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, double, double);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  v2 = -[NTKRichComplicationRectangularBaseView init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](v2, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithDevice:useAccentColor:", v4, 1);
    headerImageView = v2->_headerImageView;
    v2->_headerImageView = (CDRichComplicationImageView *)v5;

    -[CDRichComplicationImageView setPaused:](v2->_headerImageView, "setPaused:", -[CDRichComplicationView paused](v2, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](v2->_headerImageView, "setFilterProvider:", v2);
    objc_msgSend(off_1E6BCA170, "async");
    v7 = objc_claimAutoreleasedReturnValue();
    headerSwiftUIView = v2->_headerSwiftUIView;
    v2->_headerSwiftUIView = (CDComplicationHostingView *)v7;

    -[CDComplicationHostingView setFilterProvider:](v2->_headerSwiftUIView, "setFilterProvider:", v2);
    -[CDComplicationHostingView setShouldAccentDesaturatedView:](v2->_headerSwiftUIView, "setShouldAccentDesaturatedView:", 1);
    objc_initWeak(&location, v2);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __59__NTKRichComplicationRectangularLargeHeadlineBaseView_init__block_invoke;
    v18 = &unk_1E6BCFEF8;
    objc_copyWeak(&v19, &location);
    -[CDComplicationHostingView setRenderStatsHandler:](v2->_headerSwiftUIView, "setRenderStatsHandler:", &v15);
    -[CDRichComplicationView device](v2, "device", v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_29(v9);
    v11 = v10;

    -[NTKRichComplicationRectangularBaseView _createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:](v2, "_createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:", 1, v11, *MEMORY[0x1E0DC1448]);
    v12 = objc_claimAutoreleasedReturnValue();
    headerLabel = v2->_headerLabel;
    v2->_headerLabel = (CLKUIColoringLabel *)v12;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __59__NTKRichComplicationRectangularLargeHeadlineBaseView_init__block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "displayObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationDisplay:renderStatsWithTime:cost:", WeakRetained, a2, a3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  char IsRTL;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  CGFloat v25;
  double MinY;
  double v27;
  void *v28;
  void *v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat MaxX;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat rect;
  double v58;
  objc_super v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v59.receiver = self;
  v59.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView layoutSubviews](&v59, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LayoutConstants_29(v3);
  v6 = v5;
  v58 = v7;

  IsRTL = CLKLayoutIsRTL();
  -[NTKRichComplicationRectangularLargeHeadlineBaseView bounds](self, "bounds");
  v55 = v9;
  v56 = v10;
  v12 = v11;
  rect = v13;
  -[NTKRichComplicationRectangularBaseView contentMargin](self, "contentMargin");
  v15 = v14;
  -[CLKUIColoringLabel font](self->_headerLabel, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ascender");
  v18 = v4 - v17;

  -[CLKUIColoringLabel sizeToFit](self->_headerLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_headerLabel, "frame");
  v20 = v19;
  v22 = v21;
  -[CLKUIColoringLabel font](self->_headerLabel, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lineHeight");
  v25 = v24;

  v60.origin.x = v20;
  v60.origin.y = v18;
  v60.size.width = v22;
  v60.size.height = v25;
  MinY = CGRectGetMinY(v60);
  v61.origin.x = v20;
  v61.origin.y = v18;
  v61.size.width = v22;
  v61.size.height = v25;
  v27 = MinY + (CGRectGetHeight(v61) - v6) * 0.5;
  -[CDRichComplicationImageView superview](self->_headerImageView, "superview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {

  }
  else
  {
    -[CDComplicationHostingView superview](self->_headerSwiftUIView, "superview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      goto LABEL_8;
  }
  if ((IsRTL & 1) != 0)
  {
    v62.origin.x = v55;
    v62.origin.y = v56;
    v62.size.width = v12;
    v62.size.height = rect;
    v30 = CGRectGetWidth(v62) - v15;
    v63.origin.x = 0.0;
    v63.origin.y = v27;
    v63.size.width = v6;
    v63.size.height = v6;
    v31 = v30 - CGRectGetWidth(v63);
    v32 = v27;
    v33 = v6;
    v34 = v6;
  }
  else
  {
    v64.origin.x = v15;
    v64.origin.y = v27;
    v64.size.width = v6;
    v64.size.height = v6;
    MaxX = CGRectGetMaxX(v64);
    v65.size.height = rect;
    v36 = v58 + MaxX;
    v65.origin.x = v55;
    v65.origin.y = v56;
    v65.size.width = v12;
    CGRectGetWidth(v65);
    v31 = v36;
    v32 = v18;
    v33 = v22;
    v34 = v25;
  }
  CGRectGetMinX(*(CGRect *)&v31);
LABEL_8:
  -[CDRichComplicationView device](self, "device");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  -[CLKUIColoringLabel setFrame:](self->_headerLabel, "setFrame:", v39, v41, v43, v45);
  v66.origin.x = v39;
  v66.origin.y = v41;
  v66.size.width = v43;
  v66.size.height = v45;
  -[CLKUIColoringLabel setMaxWidth:](self->_headerLabel, "setMaxWidth:", CGRectGetWidth(v66));
  -[CDRichComplicationView device](self, "device");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;

  -[CDRichComplicationImageView setFrame:](self->_headerImageView, "setFrame:", v48, v50, v52, v54);
  -[CDComplicationHostingView setFrame:](self->_headerSwiftUIView, "setFrame:", v48, v50, v52, v54);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (void)_updateTemplateHeaderWithTextProvider:(id)a3 imageProvider:(id)a4 viewData:(id)a5 reason:(int64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(void);
  void (**v15)(void);
  void (**v16)(void);
  void (**v17)(void);
  _QWORD v18[6];
  _QWORD aBlock[5];

  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke;
  aBlock[3] = &unk_1E6BCD5F0;
  aBlock[4] = self;
  v13 = a3;
  v14 = (void (**)(void))_Block_copy(aBlock);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke_2;
  v18[3] = &unk_1E6BD09B0;
  v18[4] = self;
  v18[5] = a6;
  v15 = (void (**)(void))_Block_copy(v18);
  v16 = v15;
  if (v11)
  {
    -[CDComplicationHostingView setViewData:](self->_headerSwiftUIView, "setViewData:", v11);
    -[NTKRichComplicationRectangularLargeHeadlineBaseView addSubview:](self, "addSubview:", self->_headerSwiftUIView);
    v17 = v16;
  }
  else
  {
    if (v10)
    {
      -[CDRichComplicationImageView setImageProvider:reason:](self->_headerImageView, "setImageProvider:reason:", v10, a6);
      -[NTKRichComplicationRectangularLargeHeadlineBaseView addSubview:](self, "addSubview:", self->_headerImageView);
    }
    else
    {
      ((void (*)(void (**)(void)))v15[2])(v15);
    }
    v17 = v14;
  }
  v17[2]();
  -[CLKUIColoringLabel setTextProvider:](self->_headerLabel, "setTextProvider:", v13);

}

uint64_t __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setViewData:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "removeFromSuperview");
}

uint64_t __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "setImageProvider:reason:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "removeFromSuperview");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDRichComplicationImageView setPaused:](self->_headerImageView, "setPaused:", v3);
  -[CDComplicationHostingView setPaused:](self->_headerSwiftUIView, "setPaused:", v3);
}

- (int64_t)tritiumUpdateMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;
  objc_super v8;

  -[CDRichComplicationImageView tritiumUpdateMode](self->_headerImageView, "tritiumUpdateMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5 >= 2)
      v6 = 2;
    else
      v6 = v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  -[CDRichComplicationView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_headerLabel);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_headerLabel, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_headerLabel, "transitionToMonochromeWithFraction:style:", 2);
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_headerImageView, "transitionToMonochromeWithFraction:", a3);
  -[CDComplicationHostingView transitionToMonochromeWithFraction:](self->_headerSwiftUIView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_headerLabel, "updateMonochromeColorWithStyle:", 2);
  -[CDRichComplicationImageView updateMonochromeColor](self->_headerImageView, "updateMonochromeColor");
  -[CDComplicationHostingView updateMonochromeColor](self->_headerSwiftUIView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_headerSwiftUIView, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end
