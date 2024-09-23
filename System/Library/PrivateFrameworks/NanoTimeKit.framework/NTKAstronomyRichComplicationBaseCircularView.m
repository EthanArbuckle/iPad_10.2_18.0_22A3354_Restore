@implementation NTKAstronomyRichComplicationBaseCircularView

- (NTKAstronomyRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  NTKAstronomyRichComplicationBaseCircularView *v4;
  NTKAstronomyRichComplicationBaseCircularView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyRichComplicationBaseCircularView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v7, sel_initWithFamily_);
  v5 = v4;
  if (v4)
    -[NTKAstronomyRichComplicationBaseCircularView _setupContentViewForFamily:](v4, "_setupContentViewForFamily:", a3);
  return v5;
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
  v12.super_class = (Class)NTKAstronomyRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v12, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[NTKAstronomyRichComplicationContentView setFrame:](self->_astronomyContentView, "setFrame:", v5, v7, v9, v11);
}

- (void)_applyPausedUpdate
{
  -[NTKAstronomyRichComplicationContentView applyPausedUpdate:](self->_astronomyContentView, "applyPausedUpdate:", -[CDRichComplicationView paused](self, "paused"));
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  NTKAstronomyRichComplicationContentView *astronomyContentView;
  id v6;

  astronomyContentView = self->_astronomyContentView;
  objc_msgSend(a3, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKAstronomyRichComplicationContentView handleTemplateMetadata:reason:](astronomyContentView, "handleTemplateMetadata:reason:", v6, a4);

}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  -[NTKAstronomyRichComplicationContentView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_astronomyContentView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", a3, a4);
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  -[NTKAstronomyRichComplicationContentView setTimeTravelDate:animated:](self->_astronomyContentView, "setTimeTravelDate:animated:", a3, a4);
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyRichComplicationBaseCircularView;
  -[CDRichComplicationView setEditing:](&v5, sel_setEditing_);
  -[NTKAstronomyRichComplicationContentView setEditing:](self->_astronomyContentView, "setEditing:", v3);
}

- (int64_t)_desaturatedFilterStyle
{
  void *v2;
  int v3;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKShowGossamerUI(v2);

  if (v3)
    return 5;
  else
    return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKAstronomyRichComplicationBaseCircularView _desaturatedFilterStyle](self, "_desaturatedFilterStyle"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NTKAstronomyRichComplicationContentView layer](self->_astronomyContentView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v7);

  }
}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  id v5;

  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, -[NTKAstronomyRichComplicationBaseCircularView _desaturatedFilterStyle](self, "_desaturatedFilterStyle"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTKAstronomyRichComplicationContentView layer](self->_astronomyContentView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilters:", v5);

  }
}

- (void)_setupContentViewForFamily:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  NTKAstronomyRichComplicationContentView *v9;
  void *v10;
  NTKAstronomyRichComplicationContentView *v11;
  NTKAstronomyRichComplicationContentView *astronomyContentView;
  void *v13;

  -[CDRichComplicationView device](self, "device");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3 == 12)
    v7 = NTKGraphicExtraLargeComplicationContentDiameter(v5);
  else
    v7 = NTKWhistlerSubdialComplicationContentDiameter(v5);
  v8 = v7;

  v9 = [NTKAstronomyRichComplicationContentView alloc];
  -[CDRichComplicationView device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKAstronomyRichComplicationContentView initForDevice:family:diameter:](v9, "initForDevice:family:diameter:", v10, a3, v8);
  astronomyContentView = self->_astronomyContentView;
  self->_astronomyContentView = v11;

  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_astronomyContentView);

  -[NTKAstronomyRichComplicationBaseCircularView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_astronomyContentView, 0);
}

@end
