@implementation NTKRichComplicationBaseCircularStackImageView

- (id)line1View
{
  CDRichComplicationImageView *line1ImageView;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  CDRichComplicationImageView *v8;
  CDRichComplicationImageView *v9;

  line1ImageView = self->_line1ImageView;
  if (!line1ImageView)
  {
    -[CDRichComplicationView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = NTKShowGossamerUI(v4);

    v6 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (CDRichComplicationImageView *)objc_msgSend(v6, "initWithDevice:useAccentColor:", v7, v5);
    v9 = self->_line1ImageView;
    self->_line1ImageView = v8;

    -[CDRichComplicationImageView setPaused:](self->_line1ImageView, "setPaused:", -[CDRichComplicationView paused](self, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](self->_line1ImageView, "setFilterProvider:", self);
    line1ImageView = self->_line1ImageView;
  }
  return line1ImageView;
}

- (id)line2TextProviderFromTemplate:(id)a3
{
  return (id)objc_msgSend(a3, "line2TextProvider");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  -[CDRichComplicationImageView setPaused:](self->_line1ImageView, "setPaused:", v3);
}

- (int64_t)tritiumUpdateMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;
  objc_super v8;

  -[CDRichComplicationImageView tritiumUpdateMode](self->_line1ImageView, "tritiumUpdateMode");
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
    v8.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
  -[NTKRichComplicationCircularStackContentTextView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self->_line1ImageView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
  -[NTKRichComplicationCircularStackContentTextView updateMonochromeColor](&v3, sel_updateMonochromeColor);
  -[CDRichComplicationImageView updateMonochromeColor](self->_line1ImageView, "updateMonochromeColor");
}

- (CDRichComplicationImageView)line1ImageView
{
  return self->_line1ImageView;
}

- (void)setLine1ImageView:(id)a3
{
  objc_storeStrong((id *)&self->_line1ImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line1ImageView, 0);
}

@end
