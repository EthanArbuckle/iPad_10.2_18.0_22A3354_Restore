@implementation CPSRouteEstimatesView

- (CPSRouteEstimatesView)initWithStyle:(unint64_t)a3
{
  CPSTravelEstimatesStringFormatter *v3;
  CPSTravelEstimatesStringFormatter *travelEstimatesStringFormatter;
  CPSLabeledValueView *v5;
  CPSLabeledValueView *arrivalTimeView;
  CPSLabeledValueView *v7;
  CPSLabeledValueView *timeRemainingView;
  CPSLabeledValueView *v9;
  CPSLabeledValueView *distanceRemainingView;
  CPSRouteEstimatesView *v12;
  void *v13;
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
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;
  unint64_t v50;
  SEL v51;
  CPSRouteEstimatesView *v52;
  _QWORD v53[12];

  v53[11] = *MEMORY[0x24BDAC8D0];
  v51 = a2;
  v50 = a3;
  v52 = 0;
  v49.receiver = self;
  v49.super_class = (Class)CPSRouteEstimatesView;
  v52 = -[CPSRouteEstimatesView init](&v49, sel_init);
  objc_storeStrong((id *)&v52, v52);
  if (v52)
  {
    v3 = objc_alloc_init(CPSTravelEstimatesStringFormatter);
    travelEstimatesStringFormatter = v52->_travelEstimatesStringFormatter;
    v52->_travelEstimatesStringFormatter = v3;

    -[CPSRouteEstimatesView setTripEstimateStyle:](v52, "setTripEstimateStyle:", v50);
    -[CPSRouteEstimatesView setTranslatesAutoresizingMaskIntoConstraints:](v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_alloc_init(CPSLabeledValueView);
    arrivalTimeView = v52->_arrivalTimeView;
    v52->_arrivalTimeView = v5;

    -[CPSRouteEstimatesView addSubview:](v52, "addSubview:", v52->_arrivalTimeView);
    v7 = objc_alloc_init(CPSLabeledValueView);
    timeRemainingView = v52->_timeRemainingView;
    v52->_timeRemainingView = v7;

    -[CPSRouteEstimatesView addSubview:](v52, "addSubview:", v52->_timeRemainingView);
    v9 = objc_alloc_init(CPSLabeledValueView);
    distanceRemainingView = v52->_distanceRemainingView;
    v52->_distanceRemainingView = v9;

    -[CPSRouteEstimatesView addSubview:](v52, "addSubview:", v52->_distanceRemainingView);
    v48 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    -[CPSRouteEstimatesView addLayoutGuide:](v52, "addLayoutGuide:", v48);
    v47 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    -[CPSRouteEstimatesView addLayoutGuide:](v52, "addLayoutGuide:", v47);
    v13 = (void *)MEMORY[0x24BDD1628];
    v46 = (id)objc_msgSend(v48, "leftAnchor");
    v45 = (id)-[CPSRouteEstimatesView leftAnchor](v52, "leftAnchor");
    v44 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
    v53[0] = v44;
    v43 = (id)objc_msgSend(v48, "rightAnchor");
    v42 = (id)-[CPSRouteEstimatesView centerXAnchor](v52, "centerXAnchor");
    v41 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v53[1] = v41;
    v40 = (id)objc_msgSend(v47, "leftAnchor");
    v39 = (id)-[CPSRouteEstimatesView centerXAnchor](v52, "centerXAnchor");
    v38 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
    v53[2] = v38;
    v37 = (id)objc_msgSend(v47, "rightAnchor");
    v36 = (id)-[CPSRouteEstimatesView rightAnchor](v52, "rightAnchor");
    v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v53[3] = v35;
    v34 = (id)-[CPSLabeledValueView centerXAnchor](v52->_timeRemainingView, "centerXAnchor");
    v33 = (id)-[CPSRouteEstimatesView centerXAnchor](v52, "centerXAnchor");
    v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
    v53[4] = v32;
    v31 = (id)-[CPSLabeledValueView centerXAnchor](v52->_arrivalTimeView, "centerXAnchor");
    v30 = (id)objc_msgSend(v48, "centerXAnchor");
    v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:", -7.0);
    v53[5] = v29;
    v28 = (id)-[CPSLabeledValueView centerXAnchor](v52->_distanceRemainingView, "centerXAnchor");
    v27 = (id)objc_msgSend(v47, "centerXAnchor");
    v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:constant:", 7.0);
    v53[6] = v26;
    v25 = (id)-[CPSLabeledValueView centerYAnchor](v52->_timeRemainingView, "centerYAnchor");
    v24 = (id)-[CPSRouteEstimatesView centerYAnchor](v52, "centerYAnchor");
    v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v53[7] = v23;
    v22 = (id)-[CPSLabeledValueView centerYAnchor](v52->_arrivalTimeView, "centerYAnchor");
    v21 = (id)-[CPSRouteEstimatesView centerYAnchor](v52, "centerYAnchor");
    v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
    v53[8] = v20;
    v19 = (id)-[CPSLabeledValueView centerYAnchor](v52->_distanceRemainingView, "centerYAnchor");
    v18 = (id)-[CPSRouteEstimatesView centerYAnchor](v52, "centerYAnchor");
    v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v53[9] = v17;
    v16 = (id)-[CPSRouteEstimatesView heightAnchor](v52, "heightAnchor");
    v15 = (id)objc_msgSend(v16, "constraintEqualToConstant:", 28.0);
    v53[10] = v15;
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 11);
    objc_msgSend(v13, "activateConstraints:");

    -[CPSRouteEstimatesView _updateTextColors](v52, "_updateTextColors");
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
  }
  v12 = v52;
  objc_storeStrong((id *)&v52, 0);
  return v12;
}

- (void)_updateTextColors
{
  UILabel *v2;
  CPSLabeledValueView *v3;
  UILabel *v4;
  CPSLabeledValueView *v5;
  CPSLabeledValueView *v6;
  CPSLabeledValueView *v7;
  id v8;
  id v9[2];
  CPSRouteEstimatesView *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)objc_msgSend(MEMORY[0x24BDB7A88], "timeRemainingColorForColor:", -[CPSRouteEstimatesView timeRemainingColor](self, "timeRemainingColor"));
  v3 = -[CPSRouteEstimatesView timeRemainingView](v10, "timeRemainingView");
  v2 = -[CPSLabeledValueView label](v3, "label");
  -[UILabel setTextColor:](v2, "setTextColor:", v9[0]);

  v5 = -[CPSRouteEstimatesView timeRemainingView](v10, "timeRemainingView");
  v4 = -[CPSLabeledValueView valueText](v5, "valueText");
  -[UILabel setTextColor:](v4, "setTextColor:", v9[0]);

  v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = -[CPSRouteEstimatesView distanceRemainingView](v10, "distanceRemainingView");
  -[CPSLabeledValueView setTextColor:](v6, "setTextColor:", v8);

  v7 = -[CPSRouteEstimatesView arrivalTimeView](v10, "arrivalTimeView");
  -[CPSLabeledValueView setTextColor:](v7, "setTextColor:", v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
}

- (void)setTripEstimateStyle:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 2;
  else
    v3 = 1;
  -[CPSRouteEstimatesView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v3);
  -[CPSRouteEstimatesView _updateTextColors](self, "_updateTextColors");
}

- (NSTimeZone)arrivalTimeZone
{
  NSDateFormatter *v3;
  CPSTravelEstimatesStringFormatter *v4;
  NSTimeZone *v5;

  v4 = -[CPSRouteEstimatesView travelEstimatesStringFormatter](self, "travelEstimatesStringFormatter");
  v3 = -[CPSTravelEstimatesStringFormatter arrivalTimeFormatter](v4, "arrivalTimeFormatter");
  v5 = -[NSDateFormatter timeZone](v3, "timeZone");

  return v5;
}

- (void)setArrivalTimeZone:(id)a3
{
  NSDateFormatter *v3;
  CPSTravelEstimatesStringFormatter *v4;
  id location[2];
  CPSRouteEstimatesView *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSRouteEstimatesView travelEstimatesStringFormatter](v6, "travelEstimatesStringFormatter");
  v3 = -[CPSTravelEstimatesStringFormatter arrivalTimeFormatter](v4, "arrivalTimeFormatter");
  -[NSDateFormatter setTimeZone:](v3, "setTimeZone:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)setTimeRemainingColor:(unint64_t)a3
{
  if (a3 != self->_timeRemainingColor)
  {
    self->_timeRemainingColor = a3;
    -[CPSRouteEstimatesView _updateTextColors](self, "_updateTextColors");
  }
}

- (void)setCurrentTravelEstimates:(id)a3
{
  CPSTravelEstimatesStringFormatter *v3;
  id v4;
  UILabel *v5;
  CPSLabeledValueView *v6;
  id v7;
  UILabel *v8;
  CPSLabeledValueView *v9;
  id v10;
  UILabel *v11;
  CPSLabeledValueView *v12;
  id v13;
  UILabel *v14;
  CPSLabeledValueView *v15;
  id v16;
  UILabel *v17;
  CPSLabeledValueView *v18;
  id v19;
  UILabel *v20;
  CPSLabeledValueView *v21;
  id v22;
  id location[2];
  CPSRouteEstimatesView *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSRouteEstimatesView travelEstimatesStringFormatter](v24, "travelEstimatesStringFormatter");
  v22 = -[CPSTravelEstimatesStringFormatter generateTravelEstimatesStringsForTravelEstimates:](v3, "generateTravelEstimatesStringsForTravelEstimates:", location[0]);

  v6 = -[CPSRouteEstimatesView arrivalTimeView](v24, "arrivalTimeView");
  v5 = -[CPSLabeledValueView valueText](v6, "valueText");
  v4 = (id)objc_msgSend(v22, "arrivalTimeString");
  -[UILabel setText:](v5, "setText:");

  v9 = -[CPSRouteEstimatesView arrivalTimeView](v24, "arrivalTimeView");
  v8 = -[CPSLabeledValueView label](v9, "label");
  v7 = (id)objc_msgSend(v22, "localizedArrivalString");
  -[UILabel setText:](v8, "setText:");

  v12 = -[CPSRouteEstimatesView timeRemainingView](v24, "timeRemainingView");
  v11 = -[CPSLabeledValueView valueText](v12, "valueText");
  v10 = (id)objc_msgSend(v22, "timeRemainingString");
  -[UILabel setText:](v11, "setText:");

  v15 = -[CPSRouteEstimatesView timeRemainingView](v24, "timeRemainingView");
  v14 = -[CPSLabeledValueView label](v15, "label");
  v13 = (id)objc_msgSend(v22, "localizedTimeRemainingUnit");
  -[UILabel setText:](v14, "setText:");

  v18 = -[CPSRouteEstimatesView distanceRemainingView](v24, "distanceRemainingView");
  v17 = -[CPSLabeledValueView valueText](v18, "valueText");
  v16 = (id)objc_msgSend(v22, "distanceRemainingString");
  -[UILabel setText:](v17, "setText:");

  v21 = -[CPSRouteEstimatesView distanceRemainingView](v24, "distanceRemainingView");
  v20 = -[CPSLabeledValueView label](v21, "label");
  v19 = (id)objc_msgSend(v22, "localizedDistanceRemainingUnit");
  -[UILabel setText:](v20, "setText:");

  -[CPSRouteEstimatesView setTimeRemainingColor:](v24, "setTimeRemainingColor:", objc_msgSend(location[0], "timeRemainingColor"));
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (CPSLabeledValueView)timeRemainingView
{
  return self->_timeRemainingView;
}

- (CPSLabeledValueView)arrivalTimeView
{
  return self->_arrivalTimeView;
}

- (CPSLabeledValueView)distanceRemainingView
{
  return self->_distanceRemainingView;
}

- (CPSTravelEstimatesStringFormatter)travelEstimatesStringFormatter
{
  return self->_travelEstimatesStringFormatter;
}

- (unint64_t)timeRemainingColor
{
  return self->_timeRemainingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelEstimatesStringFormatter, 0);
  objc_storeStrong((id *)&self->_distanceRemainingView, 0);
  objc_storeStrong((id *)&self->_arrivalTimeView, 0);
  objc_storeStrong((id *)&self->_timeRemainingView, 0);
}

@end
