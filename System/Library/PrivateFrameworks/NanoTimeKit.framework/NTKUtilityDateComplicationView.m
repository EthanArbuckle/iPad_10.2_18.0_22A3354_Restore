@implementation NTKUtilityDateComplicationView

- (NTKUtilityDateComplicationView)initWithFrame:(CGRect)a3
{
  NTKUtilityDateComplicationView *v3;
  NTKDateComplicationLabel *v4;
  void *v5;
  uint64_t v6;
  NTKDateComplicationLabel *label;
  NTKDateComplicationLabel *v8;
  void *v9;
  NTKDateComplicationLabel *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKUtilityDateComplicationView;
  v3 = -[NTKUtilityComplicationView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [NTKDateComplicationLabel alloc];
    -[NTKUtilityComplicationView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKDateComplicationLabel initWithSizeStyle:accentType:forDevice:](v4, "initWithSizeStyle:accentType:forDevice:", 1, 0, v5);
    label = v3->_label;
    v3->_label = (NTKDateComplicationLabel *)v6;

    v8 = v3->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDateComplicationLabel setTextColor:](v8, "setTextColor:", v9);

    v10 = v3->_label;
    -[NTKUtilityComplicationView device](v3, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDateComplicationLabel setAlpha:](v10, "setAlpha:", 1.0);

    -[NTKUtilityDateComplicationView addSubview:](v3, "addSubview:", v3->_label);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKUtilityDateComplicationView;
  -[NTKUtilityComplicationView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKDateComplicationLabel frame](self->_label, "frame");
  -[NTKUtilityDateComplicationView bounds](self, "bounds");
  -[NTKUtilityComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredIntegralRectForDevice();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[NTKDateComplicationLabel setFrame:](self->_label, "setFrame:", v5, v7, v9, v11);
}

- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5
{
  -[NTKDateComplicationLabel setDateComplicationText:withDayRange:forDateStyle:](self->_label, "setDateComplicationText:withDayRange:forDateStyle:", a3, a4.location, a4.length);
  self->_dateStyle = a5;
  -[NTKUtilityDateComplicationView _invalidateLabelSize](self, "_invalidateLabelSize");
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[NTKUtilityComplicationView font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = NTKEqualObjects(v4, v5);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKUtilityDateComplicationView;
    -[NTKUtilityComplicationView setFont:](&v7, sel_setFont_, v4);
    -[NTKDateComplicationLabel setFont:](self->_label, "setFont:", v4);
    -[NTKUtilityDateComplicationView _invalidateLabelSize](self, "_invalidateLabelSize");
  }

}

- (void)_invalidateLabelSize
{
  id v3;

  -[NTKDateComplicationLabel sizeToFit](self->_label, "sizeToFit");
  -[NTKUtilityComplicationView displayObserver](self, "displayObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationDisplayNeedsResize:", self);

}

- (void)setAccentColor:(id)a3
{
  -[NTKDateComplicationLabel setAccentColor:](self->_label, "setAccentColor:", a3);
}

- (id)accentColor
{
  return -[NTKDateComplicationLabel accentColor](self->_label, "accentColor");
}

- (void)setForegroundColor:(id)a3
{
  NTKDateComplicationLabel *label;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKUtilityDateComplicationView;
  -[NTKUtilityComplicationView setForegroundColor:](&v6, sel_setForegroundColor_, a3);
  label = self->_label;
  -[NTKUtilityComplicationView _computedForegroundColor](self, "_computedForegroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDateComplicationLabel setTextColor:](label, "setTextColor:", v5);

}

- (id)foregroundColor
{
  return -[NTKDateComplicationLabel textColor](self->_label, "textColor");
}

- (unint64_t)dateStyle
{
  return self->_dateStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
