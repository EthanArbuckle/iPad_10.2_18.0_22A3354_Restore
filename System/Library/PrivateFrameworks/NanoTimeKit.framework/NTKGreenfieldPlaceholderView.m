@implementation NTKGreenfieldPlaceholderView

- (NTKGreenfieldPlaceholderView)initWithFrame:(CGRect)a3
{
  NTKGreenfieldPlaceholderView *v3;
  UIImageView *v4;
  UIImageView *iconView;
  _NTKPieChartView *v6;
  _NTKPieChartView *uncompletedPieChartView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKGreenfieldPlaceholderView;
  v3 = -[NTKGreenfieldPlaceholderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconView = v3->_iconView;
    v3->_iconView = v4;

    -[UIImageView setContentMode:](v3->_iconView, "setContentMode:", 1);
    -[NTKGreenfieldPlaceholderView addSubview:](v3, "addSubview:", v3->_iconView);
    v6 = objc_alloc_init(_NTKPieChartView);
    uncompletedPieChartView = v3->_uncompletedPieChartView;
    v3->_uncompletedPieChartView = v6;

    -[NTKGreenfieldPlaceholderView addSubview:](v3, "addSubview:", v3->_uncompletedPieChartView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKGreenfieldPlaceholderView;
  -[NTKGreenfieldPlaceholderView layoutSubviews](&v13, sel_layoutSubviews);
  -[NTKGreenfieldPlaceholderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKGreenfieldPlaceholderView bounds](self, "bounds");
  v12 = v11 * 0.75;
  -[UIImageView setFrame:](self->_iconView, "setFrame:", v4, v6, v8, v10);
  -[_NTKPieChartView setFrame:](self->_uncompletedPieChartView, "setFrame:", v8 * 0.25 * 0.5, v8 * 0.25 * 0.5, v12, v12);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  -[_NTKPieChartView setProgress:animated:](self->_uncompletedPieChartView, "setProgress:animated:", a4, a3);
}

- (void)setAppIcon:(id)a3
{
  -[UIImageView setImage:](self->_iconView, "setImage:", a3);
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return a3 == 1;
}

- (void)setImageProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v6;
    objc_msgSend(v4, "progress");
    -[NTKGreenfieldPlaceholderView setProgress:animated:](self, "setProgress:animated:", 1);
    objc_msgSend(v4, "appIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKGreenfieldPlaceholderView setAppIcon:](self, "setAppIcon:", v5);
  }

}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKGreenfieldPlaceholderView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  void *v6;
  _BOOL8 v7;
  float v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "metadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NTKGreenfieldPlaceholderTimelineEntryModelProgressKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKGreenfieldPlaceholderView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", a4);
  objc_msgSend(v6, "floatValue");
  -[NTKGreenfieldPlaceholderView setProgress:animated:](self, "setProgress:animated:", v7, v8);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NTKGreenfieldPlaceholderTimelineEntryModelIconKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NTKGreenfieldPlaceholderView setAppIcon:](self, "setAppIcon:", v9);

}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_uncompletedPieChartView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
