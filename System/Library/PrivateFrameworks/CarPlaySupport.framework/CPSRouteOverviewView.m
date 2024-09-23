@implementation CPSRouteOverviewView

+ (id)_multilineLabel
{
  id v3;
  id v4[3];

  v4[2] = a1;
  v4[1] = (id)a2;
  v4[0] = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v4[0], "setNumberOfLines:", 0);
  objc_msgSend(v4[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

+ (void)_applyBoldText:(id)a3 fontSize:(double)a4 color:(id)a5 toLabel:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v13;
  id v14;
  id v15;
  double v16;
  id location[3];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  if (location[0])
  {
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    v6 = location[0];
    v18[0] = *MEMORY[0x24BDF65F8];
    v9 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", v16);
    v19[0] = v9;
    v18[1] = *MEMORY[0x24BDF6600];
    v19[1] = v15;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (id)objc_msgSend(v7, "initWithString:attributes:", v6);

    objc_msgSend(v14, "setAttributedText:", v13);
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (void)_applyText:(id)a3 fontSize:(double)a4 color:(id)a5 toLabel:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v13;
  id v14;
  id v15;
  double v16;
  id location[3];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v14 = 0;
  objc_storeStrong(&v14, a6);
  if (location[0])
  {
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    v6 = location[0];
    v18[0] = *MEMORY[0x24BDF65F8];
    v9 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", v16);
    v19[0] = v9;
    v18[1] = *MEMORY[0x24BDF6600];
    v19[1] = v15;
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (id)objc_msgSend(v7, "initWithString:attributes:", v6);

    objc_msgSend(v14, "setAttributedText:", v13);
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (id)_shortenedAddressForAddress:(id)a3
{
  id v4;
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(location[0], "mutableCopy");
  objc_msgSend(v5, "setSubAdministrativeArea:");
  objc_msgSend(v5, "setState:", &stru_24E271FF0);
  objc_msgSend(v5, "setPostalCode:", &stru_24E271FF0);
  objc_msgSend(v5, "setCountry:", &stru_24E271FF0);
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)_nameForMapItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(location[0], "name");

  if (!v6)
  {
    v5 = (id)objc_msgSend(location[0], "placemark");
    v6 = (id)objc_msgSend(v5, "name");

  }
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (CPSRouteOverviewView)initWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  CPSRouteEstimatesView *v5;
  double v6;
  CPSRouteOverviewView *v8;
  void *v9;
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
  id v49;
  CPSRouteEstimatesView *v50;
  CPSHidingLabel *v51;
  CPSHidingLabel *v52;
  id v53;
  objc_super v54;
  SEL v55;
  CPSRouteOverviewView *v56;
  CGRect v57;
  _QWORD v58[14];

  v58[13] = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v55 = a2;
  v56 = 0;
  v54.receiver = self;
  v54.super_class = (Class)CPSRouteOverviewView;
  v56 = -[CPSRouteOverviewView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v56, v56);
  if (v56)
  {
    -[CPSRouteOverviewView setTranslatesAutoresizingMaskIntoConstraints:](v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v53 = (id)objc_msgSend((id)objc_opt_class(), "_multilineLabel");
    -[CPSRouteOverviewView addSubview:](v56, "addSubview:", v53);
    objc_msgSend(v53, "setContentCompressionResistancePriority:forAxis:");
    objc_storeStrong((id *)&v56->_destinationName, v53);
    v52 = objc_alloc_init(CPSHidingLabel);
    -[CPSHidingLabel setNumberOfLines:](v52, "setNumberOfLines:");
    -[CPSHidingLabel setTranslatesAutoresizingMaskIntoConstraints:](v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v3) = 1132134400;
    -[CPSHidingLabel setContentCompressionResistancePriority:forAxis:](v52, "setContentCompressionResistancePriority:forAxis:", 1, v3);
    -[CPSRouteOverviewView addSubview:](v56, "addSubview:", v52);
    objc_storeStrong((id *)&v56->_destinationAddress, v52);
    v51 = objc_alloc_init(CPSHidingLabel);
    -[CPSHidingLabel setNumberOfLines:](v51, "setNumberOfLines:", 0);
    -[CPSHidingLabel setTranslatesAutoresizingMaskIntoConstraints:](v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v4) = 1132068864;
    -[CPSHidingLabel setContentCompressionResistancePriority:forAxis:](v51, "setContentCompressionResistancePriority:forAxis:", 1, v4);
    -[CPSRouteOverviewView addSubview:](v56, "addSubview:", v51);
    objc_storeStrong((id *)&v56->_routeNoteLabel, v51);
    v5 = -[CPSRouteEstimatesView initWithStyle:]([CPSRouteEstimatesView alloc], "initWithStyle:", 1);
    LODWORD(v6) = 1148846080;
    v50 = v5;
    -[CPSRouteEstimatesView setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    -[CPSRouteOverviewView addSubview:](v56, "addSubview:", v50);
    objc_storeStrong((id *)&v56->_estimatesView, v50);
    -[CPSRouteOverviewView _updateTripEstimateStyle](v56, "_updateTripEstimateStyle");
    v9 = (void *)MEMORY[0x24BDD1628];
    v49 = (id)objc_msgSend(v53, "leadingAnchor");
    v48 = (id)-[CPSRouteOverviewView leadingAnchor](v56, "leadingAnchor");
    v47 = (id)objc_msgSend(v49, "constraintEqualToSystemSpacingAfterAnchor:multiplier:");
    v58[0] = v47;
    v46 = (id)-[CPSRouteOverviewView trailingAnchor](v56, "trailingAnchor");
    v45 = (id)objc_msgSend(v53, "trailingAnchor");
    v44 = (id)objc_msgSend(v46, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[1] = v44;
    v43 = (id)-[CPSHidingLabel leadingAnchor](v52, "leadingAnchor");
    v42 = (id)-[CPSRouteOverviewView leadingAnchor](v56, "leadingAnchor");
    v41 = (id)objc_msgSend(v43, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[2] = v41;
    v40 = (id)-[CPSRouteOverviewView trailingAnchor](v56, "trailingAnchor");
    v39 = (id)-[CPSHidingLabel trailingAnchor](v52, "trailingAnchor");
    v38 = (id)objc_msgSend(v40, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[3] = v38;
    v37 = (id)-[CPSHidingLabel leadingAnchor](v51, "leadingAnchor");
    v36 = (id)-[CPSRouteOverviewView leadingAnchor](v56, "leadingAnchor");
    v35 = (id)objc_msgSend(v37, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[4] = v35;
    v34 = (id)-[CPSRouteOverviewView trailingAnchor](v56, "trailingAnchor");
    v33 = (id)-[CPSHidingLabel trailingAnchor](v51, "trailingAnchor");
    v32 = (id)objc_msgSend(v34, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", 1.0);
    v58[5] = v32;
    v31 = (id)-[CPSRouteEstimatesView leadingAnchor](v50, "leadingAnchor");
    v30 = (id)-[CPSRouteOverviewView leadingAnchor](v56, "leadingAnchor");
    v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v58[6] = v29;
    v28 = (id)-[CPSRouteOverviewView trailingAnchor](v56, "trailingAnchor");
    v27 = (id)-[CPSRouteEstimatesView trailingAnchor](v50, "trailingAnchor");
    v26 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
    v58[7] = v26;
    v25 = (id)objc_msgSend(v53, "topAnchor");
    v24 = (id)-[CPSRouteOverviewView topAnchor](v56, "topAnchor");
    v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
    v58[8] = v23;
    v22 = (id)-[CPSHidingLabel topAnchor](v52, "topAnchor");
    v21 = (id)objc_msgSend(v53, "bottomAnchor");
    v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", 1.0);
    v58[9] = v20;
    v19 = (id)-[CPSHidingLabel topAnchor](v51, "topAnchor");
    v18 = (id)-[CPSHidingLabel bottomAnchor](v52, "bottomAnchor");
    v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 1.0);
    v58[10] = v17;
    v16 = (id)-[CPSRouteEstimatesView topAnchor](v50, "topAnchor");
    v15 = (id)-[CPSHidingLabel bottomAnchor](v51, "bottomAnchor");
    v14 = (id)objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:");
    v58[11] = v14;
    v13 = (id)-[CPSRouteOverviewView bottomAnchor](v56, "bottomAnchor");
    v12 = (id)-[CPSRouteEstimatesView bottomAnchor](v50, "bottomAnchor");
    v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", 2.0);
    v58[12] = v11;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 13);
    objc_msgSend(v9, "activateConstraints:");

    objc_storeStrong((id *)&v50, 0);
    objc_storeStrong((id *)&v51, 0);
    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v53, 0);
  }
  v8 = v56;
  objc_storeStrong((id *)&v56, 0);
  return v8;
}

- (void)_updateTripEstimateStyle
{
  CPSRouteEstimatesView *v2;
  CPSRouteEstimatesView *v3;
  id v4;
  BOOL v5;

  v4 = (id)-[CPSRouteOverviewView traitCollection](self, "traitCollection");
  v5 = objc_msgSend(v4, "userInterfaceStyle") != 1;

  if (v5)
  {
    v2 = -[CPSRouteOverviewView estimatesView](self, "estimatesView");
    -[CPSRouteEstimatesView setTripEstimateStyle:](v2, "setTripEstimateStyle:", 1);

  }
  else
  {
    v3 = -[CPSRouteOverviewView estimatesView](self, "estimatesView");
    -[CPSRouteEstimatesView setTripEstimateStyle:](v3, "setTripEstimateStyle:", 0);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSRouteOverviewView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSRouteOverviewView;
  -[CPSRouteOverviewView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSRouteOverviewView _updateTripEstimateStyle](v5, "_updateTripEstimateStyle");
  objc_storeStrong(location, 0);
}

- (void)setRepresentedTrip:(id)a3
{
  id v3;
  void *v4;
  UILabel *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  CPSHidingLabel *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  CPSRouteOverviewView *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v19->_representedTrip, location[0]);
  v17 = (id)objc_msgSend(location[0], "destination");
  v16 = (id)objc_msgSend((id)objc_opt_class(), "_nameForMapItem:", v17);
  v4 = (void *)objc_opt_class();
  v3 = v16;
  v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v5 = -[CPSRouteOverviewView destinationName](v19, "destinationName");
  objc_msgSend(v4, "_applyBoldText:fontSize:color:toLabel:", v3, v6, 16.0);

  v7 = (void *)objc_opt_class();
  v9 = (id)objc_msgSend(v17, "placemark");
  v8 = (id)objc_msgSend(v9, "postalAddress");
  v15 = (id)objc_msgSend(v7, "_shortenedAddressForAddress:");

  v14 = (id)objc_msgSend(MEMORY[0x24BDBAD98], "stringFromPostalAddress:style:", v15, 0);
  v11 = (void *)objc_opt_class();
  v10 = v14;
  v13 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v12 = -[CPSRouteOverviewView destinationAddress](v19, "destinationAddress");
  objc_msgSend(v11, "_applyText:fontSize:color:toLabel:", v10, v13, 12.0);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)setRouteNote:(id)a3
{
  CPSHidingLabel *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  CPSHidingLabel *v9;
  id v10;
  id location[2];
  CPSRouteOverviewView *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_routeNote, location[0]);
  if (location[0])
  {
    v5 = objc_alloc(MEMORY[0x24BDD1458]);
    v4 = location[0];
    v13[0] = *MEMORY[0x24BDF65F8];
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
    v14[0] = v8;
    v13[1] = *MEMORY[0x24BDF6600];
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v14[1] = v7;
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (id)objc_msgSend(v5, "initWithString:attributes:", v4);

    v9 = -[CPSRouteOverviewView routeNoteLabel](v12, "routeNoteLabel");
    -[CPSHidingLabel setAttributedText:](v9, "setAttributedText:", v10);

    objc_storeStrong(&v10, 0);
  }
  else
  {
    v3 = -[CPSRouteOverviewView routeNoteLabel](v12, "routeNoteLabel");
    -[CPSHidingLabel setAttributedText:](v3, "setAttributedText:", 0);

  }
  objc_storeStrong(location, 0);
}

- (void)setCurrentTravelEstimates:(id)a3
{
  CPSRouteEstimatesView *v3;
  CPSRouteEstimatesView *v4;
  MKMapItem *v5;
  CPTrip *v6;
  id v7;
  id location[2];
  CPSRouteOverviewView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v9->_currentTravelEstimates, location[0]);
  v6 = -[CPSRouteOverviewView representedTrip](v9, "representedTrip");
  v5 = -[CPTrip destination](v6, "destination");
  v7 = -[MKMapItem timeZone](v5, "timeZone");

  if (v7)
  {
    v4 = -[CPSRouteOverviewView estimatesView](v9, "estimatesView");
    -[CPSRouteEstimatesView setArrivalTimeZone:](v4, "setArrivalTimeZone:", v7);

  }
  v3 = -[CPSRouteOverviewView estimatesView](v9, "estimatesView");
  -[CPSRouteEstimatesView setCurrentTravelEstimates:](v3, "setCurrentTravelEstimates:", location[0]);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPTrip)representedTrip
{
  return self->_representedTrip;
}

- (UILabel)destinationName
{
  return self->_destinationName;
}

- (CPSHidingLabel)destinationAddress
{
  return self->_destinationAddress;
}

- (CPSHidingLabel)routeNoteLabel
{
  return self->_routeNoteLabel;
}

- (NSString)routeNote
{
  return self->_routeNote;
}

- (CPTravelEstimates)currentTravelEstimates
{
  return self->_currentTravelEstimates;
}

- (CPSRouteEstimatesView)estimatesView
{
  return self->_estimatesView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatesView, 0);
  objc_storeStrong((id *)&self->_currentTravelEstimates, 0);
  objc_storeStrong((id *)&self->_routeNote, 0);
  objc_storeStrong((id *)&self->_routeNoteLabel, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_representedTrip, 0);
}

@end
