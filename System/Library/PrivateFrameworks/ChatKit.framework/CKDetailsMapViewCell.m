@implementation CKDetailsMapViewCell

- (CKDetailsMapViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsMapViewCell *v4;
  CKDetailsMapViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDetailsMapViewCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CKDetailsMapViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  return v5;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsMapViewCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 1;
}

- (void)setMapView:(id)a3
{
  UIView **p_mapView;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;

  p_mapView = &self->_mapView;
  v9 = (UIView *)a3;
  if (*p_mapView != v9)
  {
    objc_storeStrong((id *)&self->_mapView, a3);
    -[CKDetailsMapViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", *p_mapView);

    if (CKIsRunningInMacCatalyst())
    {
      -[UIView layer](*p_mapView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCornerRadius:", 4.0);

      -[UIView layer](*p_mapView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMasksToBounds:", 1);

    }
  }

}

- (void)setLocationStringView:(id)a3
{
  CKDetailsLocationStringCell *v5;
  CKDetailsLocationStringCell *v6;

  v5 = (CKDetailsLocationStringCell *)a3;
  if (self->_locationStringView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_locationStringView, a3);
    -[CKDetailsMapViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CKDetailsMapViewCell;
  -[CKDetailsCell layoutSubviews](&v26, sel_layoutSubviews);
  -[CKDetailsCell topSeperator](self, "topSeperator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[CKDetailsMapViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CKDetailsCell bottomSeperator](self, "bottomSeperator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 1);

  -[CKDetailsMapViewCell mapView](self, "mapView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

  if (self->_shouldShowLocationString)
  {
    -[CKDetailsMapViewCell locationStringView](self, "locationStringView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");

    -[CKDetailsMapViewCell bounds](self, "bounds");
    v18 = v17;
    -[CKDetailsMapViewCell bounds](self, "bounds");
    v20 = v19 + -44.0;
    if (CKMainScreenScale_once_31 != -1)
      dispatch_once(&CKMainScreenScale_once_31, &__block_literal_global_70);
    v21 = *(double *)&CKMainScreenScale_sMainScreenScale_31;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_31 == 0.0)
      v21 = 1.0;
    v22 = floor(v18 * v21) / v21;
    v23 = floor(v20 * v21) / v21;
    -[CKDetailsMapViewCell bounds](self, "bounds");
    -[CKDetailsLocationStringCell setFrame:](self->_locationStringView, "setFrame:", v22, v23);
    -[CKDetailsMapViewCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", self->_locationStringView);

    -[CKDetailsMapViewCell contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bringSubviewToFront:", self->_locationStringView);

  }
}

- (UIView)mapView
{
  return self->_mapView;
}

- (BOOL)shouldShowLocationString
{
  return self->_shouldShowLocationString;
}

- (void)setShouldShowLocationString:(BOOL)a3
{
  self->_shouldShowLocationString = a3;
}

- (CKDetailsLocationStringCell)locationStringView
{
  return self->_locationStringView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStringView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
