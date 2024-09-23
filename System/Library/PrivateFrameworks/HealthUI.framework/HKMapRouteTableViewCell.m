@implementation HKMapRouteTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)CFSTR("HKMapRouteTableViewCell");
}

- (HKMapRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMapRouteTableViewCell *v4;
  HKMapRouteTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMapRouteTableViewCell;
  v4 = -[HKMapRouteTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKMapRouteTableViewCell setupSubviews](v4, "setupSubviews");
    -[HKMapRouteTableViewCell setUpConstraints](v5, "setUpConstraints");
  }
  return v5;
}

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_opt_new();
  -[HKMapRouteTableViewCell setMapView:](self, "setMapView:", v3);

  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKMapRouteTableViewCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

}

- (void)setUpConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  id v26;

  -[HKMapRouteTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[HKMapRouteTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HKMapRouteTableViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leftAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[HKMapRouteTableViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HKMapRouteTableViewCell mapView](self, "mapView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 300.0);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v25) = 1132068864;
  objc_msgSend(v26, "setPriority:", v25);
  objc_msgSend(v26, "setActive:", 1);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CC18B0];
  v5 = a4;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAnnotation:reuseIdentifier:", v5, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPinTintColor:", v7);

  return v6;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CC1930];
  v5 = a4;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithOverlay:", v5);

  objc_msgSend(v6, "setLineWidth:", 5.0);
  objc_msgSend(MEMORY[0x1E0CC18B0], "greenPinColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStrokeColor:", v7);

  return v6;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setMapView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
