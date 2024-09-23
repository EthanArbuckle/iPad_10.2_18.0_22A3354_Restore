@implementation CPSNavigationETAView

- (CPSNavigationETAView)initWithTrip:(id)a3 style:(unint64_t)a4
{
  CPSNavigationETAView *v4;
  CPSRouteEstimatesView *v5;
  uint64_t v6;
  CPSRouteEstimatesView *routeEstimatesView;
  CPSNavigationETAView *v9;
  CPSNavigationETAView *v10;
  CPSRouteEstimatesView *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CPSRouteEstimatesView *v17;
  id v18;
  id v19;
  id v20;
  CPSRouteEstimatesView *v21;
  id v22;
  id v23;
  id v24;
  CPSRouteEstimatesView *v25;
  CPSRouteEstimatesView *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  CPSNavigationETAView *v33;
  id v34;
  id v35;
  objc_super v36;
  unint64_t v37;
  id location[2];
  CPSNavigationETAView *v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = a4;
  v4 = v39;
  v39 = 0;
  v36.receiver = v4;
  v36.super_class = (Class)CPSNavigationETAView;
  v33 = -[CPSNavigationETAView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v39 = v33;
  objc_storeStrong((id *)&v39, v33);
  if (v33)
  {
    objc_storeStrong((id *)&v39->_trip, location[0]);
    v39->_tripEstimateStyle = v37;
    if (v37 == 1)
    {
      v31 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      -[CPSNavigationETAView setBackgroundColor:](v39, "setBackgroundColor:");

    }
    else
    {
      v30 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      -[CPSNavigationETAView setBackgroundColor:](v39, "setBackgroundColor:");

    }
    -[CPSNavigationETAView setTranslatesAutoresizingMaskIntoConstraints:](v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = (id)-[CPSNavigationETAView layer](v39, "layer");
    objc_msgSend(v27, "setCornerRadius:", 5.0);

    v28 = (id)-[CPSNavigationETAView layer](v39, "layer");
    objc_msgSend(v28, "setContinuousCorners:", 1);

    v29 = (id)-[CPSNavigationETAView layer](v39, "layer");
    objc_msgSend(v29, "setMaskedCorners:", 3);

    v35 = (id)objc_msgSend(location[0], "destination");
    v5 = [CPSRouteEstimatesView alloc];
    v6 = -[CPSRouteEstimatesView initWithStyle:](v5, "initWithStyle:", v37);
    routeEstimatesView = v39->_routeEstimatesView;
    v39->_routeEstimatesView = (CPSRouteEstimatesView *)v6;

    v34 = (id)objc_msgSend(v35, "timeZone");
    if (v34)
    {
      v26 = -[CPSNavigationETAView routeEstimatesView](v39, "routeEstimatesView");
      -[CPSRouteEstimatesView setArrivalTimeZone:](v26, "setArrivalTimeZone:", v34);

    }
    v10 = v39;
    v11 = -[CPSNavigationETAView routeEstimatesView](v39, "routeEstimatesView");
    -[CPSNavigationETAView addSubview:](v10, "addSubview:");

    v12 = (void *)MEMORY[0x24BDD1628];
    v25 = -[CPSNavigationETAView routeEstimatesView](v39, "routeEstimatesView");
    v24 = (id)-[CPSRouteEstimatesView leadingAnchor](v25, "leadingAnchor");
    v23 = (id)-[CPSNavigationETAView leadingAnchor](v39, "leadingAnchor");
    v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v40[0] = v22;
    v21 = -[CPSNavigationETAView routeEstimatesView](v39, "routeEstimatesView");
    v20 = (id)-[CPSRouteEstimatesView trailingAnchor](v21, "trailingAnchor");
    v19 = (id)-[CPSNavigationETAView trailingAnchor](v39, "trailingAnchor");
    v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v40[1] = v18;
    v17 = -[CPSNavigationETAView routeEstimatesView](v39, "routeEstimatesView");
    v16 = (id)-[CPSRouteEstimatesView centerYAnchor](v17, "centerYAnchor");
    v15 = (id)-[CPSNavigationETAView centerYAnchor](v39, "centerYAnchor");
    v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v40[2] = v14;
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 3);
    objc_msgSend(v12, "activateConstraints:");

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  v9 = v39;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v39, 0);
  return v9;
}

- (void)setHidden:(BOOL)a3
{
  UIView *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  CPSNavigationETAView *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSNavigationETAView;
  -[CPSNavigationETAView setHidden:](&v4, sel_setHidden_, a3);
  v3 = -[CPSNavigationETAView borderView](v7, "borderView");
  -[UIView setHidden:](v3, "setHidden:", v5);

}

- (void)removeFromSuperview
{
  UIView *v2;
  objc_super v3;
  SEL v4;
  CPSNavigationETAView *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSNavigationETAView;
  -[CPSNavigationETAView removeFromSuperview](&v3, sel_removeFromSuperview);
  v2 = -[CPSNavigationETAView borderView](v5, "borderView");
  -[UIView removeFromSuperview](v2, "removeFromSuperview");

}

- (void)setTripEstimateStyle:(unint64_t)a3
{
  if (self->_tripEstimateStyle != a3)
  {
    self->_tripEstimateStyle = a3;
    -[CPSNavigationETAView _updateStyle](self, "_updateStyle");
  }
}

- (void)_updateStyle
{
  uint64_t v2;
  CPSRouteEstimatesView *v3;
  id v4;
  UIView *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25[2];
  CPSNavigationETAView *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v26 = self;
  v25[1] = (id)a2;
  if (-[CPSNavigationETAView tripEstimateStyle](self, "tripEstimateStyle"))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    -[CPSNavigationETAView setBackgroundColor:](v26, "setBackgroundColor:");

    v5 = -[CPSNavigationETAView borderView](v26, "borderView");
    -[UIView removeFromSuperview](v5, "removeFromSuperview");

  }
  else
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    -[CPSNavigationETAView setBackgroundColor:](v26, "setBackgroundColor:");

    v25[0] = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v25[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = (id)objc_msgSend(v25[0], "layer");
    objc_msgSend(v24, "setCornerRadius:", 6.0);
    objc_msgSend(v24, "setContinuousCorners:", 1);
    objc_msgSend(v24, "setMaskedCorners:", 3);
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v7 = (id)objc_msgSend(v8, "colorWithAlphaComponent:", 0.15);
    v2 = objc_msgSend(objc_retainAutorelease(v7), "CGColor");
    objc_msgSend(v24, "setBackgroundColor:", v2);

    v9 = (id)-[CPSNavigationETAView superview](v26, "superview");
    objc_msgSend(v9, "insertSubview:below:", v25[0], v26);

    v23 = (id)-[CPSNavigationETAView superview](v26, "superview");
    v22 = (id)objc_msgSend(v25[0], "leftAnchor");
    v21 = (id)-[CPSNavigationETAView leftAnchor](v26, "leftAnchor");
    v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:");
    v27[0] = v20;
    v19 = (id)objc_msgSend(v25[0], "topAnchor");
    v18 = (id)-[CPSNavigationETAView topAnchor](v26, "topAnchor");
    v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", -1.0);
    v27[1] = v17;
    v16 = (id)objc_msgSend(v25[0], "rightAnchor");
    v15 = (id)-[CPSNavigationETAView rightAnchor](v26, "rightAnchor");
    v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:constant:", 1.0);
    v27[2] = v14;
    v13 = (id)objc_msgSend(v25[0], "bottomAnchor");
    v12 = (id)-[CPSNavigationETAView bottomAnchor](v26, "bottomAnchor");
    v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", 0.0);
    v27[3] = v11;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    objc_msgSend(v23, "addConstraints:");

    -[CPSNavigationETAView setBorderView:](v26, "setBorderView:", v25[0]);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(v25, 0);
  }
  v3 = -[CPSNavigationETAView routeEstimatesView](v26, "routeEstimatesView");
  -[CPSRouteEstimatesView setTripEstimateStyle:](v3, "setTripEstimateStyle:", -[CPSNavigationETAView tripEstimateStyle](v26, "tripEstimateStyle"));

}

- (void)didMoveToSuperview
{
  objc_super v2;
  SEL v3;
  CPSNavigationETAView *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSNavigationETAView;
  -[CPSNavigationETAView didMoveToSuperview](&v2, sel_didMoveToSuperview);
  -[CPSNavigationETAView _updateStyle](v4, "_updateStyle");
}

- (void)showManeuvers:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forManeuver:(id)a4
{
  CPSRouteEstimatesView *v5;
  id v6;
  id location[2];
  CPSNavigationETAView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[CPSNavigationETAView routeEstimatesView](v8, "routeEstimatesView");
  -[CPSRouteEstimatesView setCurrentTravelEstimates:](v5, "setCurrentTravelEstimates:", location[0]);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (CPTrip)trip
{
  return self->_trip;
}

- (CPSRouteEstimatesView)routeEstimatesView
{
  return self->_routeEstimatesView;
}

- (unint64_t)tripEstimateStyle
{
  return self->_tripEstimateStyle;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_routeEstimatesView, 0);
  objc_storeStrong((id *)&self->_trip, 0);
}

@end
