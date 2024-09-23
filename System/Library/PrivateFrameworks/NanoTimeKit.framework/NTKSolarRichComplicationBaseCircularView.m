@implementation NTKSolarRichComplicationBaseCircularView

- (NTKSolarRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  NTKSolarRichComplicationBaseCircularView *v4;
  NTKSolarRichComplicationFullColorImageView *v5;
  void *v6;
  uint64_t v7;
  NTKSolarRichComplicationFullColorImageView *solarImageView;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKSolarRichComplicationBaseCircularView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v13, sel_initWithFamily_);
  if (v4)
  {
    v5 = [NTKSolarRichComplicationFullColorImageView alloc];
    -[CDRichComplicationView device](v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NTKSolarRichComplicationFullColorImageView initFullColorImageViewWithDevice:family:](v5, "initFullColorImageViewWithDevice:family:", v6, a3);
    solarImageView = v4->_solarImageView;
    v4->_solarImageView = (NTKSolarRichComplicationFullColorImageView *)v7;

    -[NTKSolarRichComplicationFullColorImageView setFilterProvider:](v4->_solarImageView, "setFilterProvider:", v4);
    -[NTKSolarRichComplicationFullColorImageView setClipsToBounds:](v4->_solarImageView, "setClipsToBounds:", 0);
    -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_solarImageView);

    -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", 1);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  double Height;
  double MidX;
  double MidY;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v16.receiver = self;
  v16.super_class = (Class)NTKSolarRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v16, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  Width = CGRectGetWidth(v17);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  Height = CGRectGetHeight(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  MidX = CGRectGetMidX(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  MidY = CGRectGetMidY(v20);
  -[NTKSolarRichComplicationFullColorImageView setBounds:](self->_solarImageView, "setBounds:", 0.0, 0.0, Width, Height);
  -[NTKSolarRichComplicationFullColorImageView setCenter:](self->_solarImageView, "setCenter:", MidX, MidY);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a3, "metadata");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NTKSolarComplicationEntryLocationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NTKSolarComplicationUseIdealizedTimeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[NTKSolarRichComplicationBaseCircularView _updateWithLocation:useIdealizedTime:forceUpdate:animated:](self, "_updateWithLocation:useIdealizedTime:forceUpdate:animated:", v6, v8, 0, -[NTKSolarRichComplicationBaseCircularView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", a4));
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[NTKSolarRichComplicationFullColorImageView transitionToMonochromeWithFraction:](self->_solarImageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[NTKSolarRichComplicationFullColorImageView updateMonochromeColor](self->_solarImageView, "updateMonochromeColor");
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NTKSolarRichComplicationFullColorImageView *solarImageView;
  id v7;
  objc_super v8;

  v4 = a4;
  solarImageView = self->_solarImageView;
  v7 = a3;
  -[NTKSolarRichComplicationFullColorImageView setTimeTravelDate:](solarImageView, "setTimeTravelDate:", v7);
  v8.receiver = self;
  v8.super_class = (Class)NTKSolarRichComplicationBaseCircularView;
  -[CDRichComplicationTemplateView setTimeTravelDate:animated:](&v8, sel_setTimeTravelDate_animated_, v7, v4);

}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_updateWithLocation:(id)a3 useIdealizedTime:(BOOL)a4 forceUpdate:(BOOL)a5 animated:(BOOL)a6
{
  -[NTKSolarRichComplicationFullColorImageView updateWithLocation:useIdealizedTime:forceUpdate:animated:](self->_solarImageView, "updateWithLocation:useIdealizedTime:forceUpdate:animated:", a3, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarImageView, 0);
}

@end
