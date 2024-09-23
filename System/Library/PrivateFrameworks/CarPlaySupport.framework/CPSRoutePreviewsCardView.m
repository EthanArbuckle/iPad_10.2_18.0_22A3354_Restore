@implementation CPSRoutePreviewsCardView

- (CPSRoutePreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5
{
  CPSRoutePreviewsCardView *v5;
  id v6;
  id v7;
  CPSHairlineBorderedView *v8;
  CPSRoutePreviewsCardView *v10;
  CPSCardPlatterView *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CPSCardPlatterView *v22;
  void *v23;
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
  CPSRoutePreviewsCardView *v38;
  id v39;
  CPSHairlineBorderedView *v42;
  id v43;
  CPSAlternateRoutesView *v44;
  id v45;
  objc_super v46;
  id v47;
  id v48;
  id location[2];
  CPSRoutePreviewsCardView *v50;
  _QWORD v51[5];
  _QWORD v52[4];

  v52[3] = *MEMORY[0x24BDAC8D0];
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = 0;
  objc_storeStrong(&v48, a4);
  v47 = 0;
  objc_storeStrong(&v47, a5);
  v5 = v50;
  v50 = 0;
  v46.receiver = v5;
  v46.super_class = (Class)CPSRoutePreviewsCardView;
  v50 = -[CPSTripPreviewsCardView initWithTripDelegate:trips:textConfiguration:](&v46, sel_initWithTripDelegate_trips_textConfiguration_, location[0], v48, v47);
  objc_storeStrong((id *)&v50, v50);
  if (v50)
  {
    v45 = (id)-[CPSRoutePreviewsCardView topAnchor](v50, "topAnchor");
    v44 = objc_alloc_init(CPSAlternateRoutesView);
    -[CPSAlternateRoutesView setSelectionDelegate:](v44, "setSelectionDelegate:", v50);
    objc_storeStrong((id *)&v50->_alternatesView, v44);
    v11 = -[CPSTripPreviewsCardView platterView](v50, "platterView");
    -[CPSCardPlatterView addSubview:](v11, "addSubview:", v44);

    v12 = (void *)MEMORY[0x24BDD1628];
    v21 = (id)-[CPSAlternateRoutesView leadingAnchor](v44, "leadingAnchor");
    v20 = (id)-[CPSRoutePreviewsCardView leadingAnchor](v50, "leadingAnchor");
    v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    v52[0] = v19;
    v18 = (id)-[CPSAlternateRoutesView trailingAnchor](v44, "trailingAnchor");
    v17 = (id)-[CPSRoutePreviewsCardView trailingAnchor](v50, "trailingAnchor");
    v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v52[1] = v16;
    v15 = (id)-[CPSAlternateRoutesView topAnchor](v44, "topAnchor");
    v14 = (id)objc_msgSend(v15, "constraintEqualToAnchor:", v45);
    v52[2] = v14;
    v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 3);
    objc_msgSend(v12, "activateConstraints:");

    v6 = (id)-[CPSAlternateRoutesView bottomAnchor](v44, "bottomAnchor");
    v7 = v45;
    v45 = v6;

    v43 = -[CPSTripPreviewsCardView setupGoButton](v50, "setupGoButton");
    v8 = [CPSHairlineBorderedView alloc];
    v42 = -[CPSHairlineBorderedView initWithContentView:borderEdges:](v8, "initWithContentView:borderEdges:", v43, 1);
    v22 = -[CPSTripPreviewsCardView platterView](v50, "platterView");
    -[CPSCardPlatterView addSubview:](v22, "addSubview:", v42);

    v23 = (void *)MEMORY[0x24BDD1628];
    v37 = (id)-[CPSHairlineBorderedView leadingAnchor](v42, "leadingAnchor");
    v36 = (id)-[CPSRoutePreviewsCardView leadingAnchor](v50, "leadingAnchor");
    v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v51[0] = v35;
    v34 = (id)-[CPSHairlineBorderedView trailingAnchor](v42, "trailingAnchor");
    v33 = (id)-[CPSRoutePreviewsCardView trailingAnchor](v50, "trailingAnchor");
    v32 = (id)objc_msgSend(v34, "constraintEqualToAnchor:");
    v51[1] = v32;
    v31 = (id)-[CPSHairlineBorderedView topAnchor](v42, "topAnchor");
    v30 = (id)objc_msgSend(v31, "constraintEqualToAnchor:", v45);
    v51[2] = v30;
    v29 = (id)-[CPSHairlineBorderedView heightAnchor](v42, "heightAnchor");
    v28 = (id)objc_msgSend(v29, "constraintEqualToConstant:", 29.0);
    v51[3] = v28;
    v27 = (id)-[CPSHairlineBorderedView bottomAnchor](v42, "bottomAnchor");
    v26 = (id)-[CPSRoutePreviewsCardView bottomAnchor](v50, "bottomAnchor");
    v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
    v51[4] = v25;
    v24 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 5);
    objc_msgSend(v23, "activateConstraints:");

    v38 = v50;
    v39 = (id)objc_msgSend(v48, "firstObject");
    -[CPSRoutePreviewsCardView setSelectedTrip:](v38, "setSelectedTrip:");

    objc_storeStrong((id *)&v42, 0);
    objc_storeStrong(&v43, 0);
    objc_storeStrong((id *)&v44, 0);
    objc_storeStrong(&v45, 0);
  }
  v10 = v50;
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v50, 0);
  return v10;
}

- (void)setSelectedTrip:(id)a3
{
  CPSAlternateRoutesView *v3;
  id v4;
  CPSAlternateRoutesView *v5;
  objc_super v6;
  id location[2];
  CPSRoutePreviewsCardView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)CPSRoutePreviewsCardView;
  -[CPSTripPreviewsCardView setSelectedTrip:](&v6, sel_setSelectedTrip_, location[0]);
  v3 = -[CPSRoutePreviewsCardView alternatesView](v8, "alternatesView");
  -[CPSAlternateRoutesView setIndexForSelectedRoute:](v3, "setIndexForSelectedRoute:", 0);

  v5 = -[CPSRoutePreviewsCardView alternatesView](v8, "alternatesView");
  v4 = (id)objc_msgSend(location[0], "routeChoices");
  -[CPSAlternateRoutesView setAvailableRouteChoices:](v5, "setAvailableRouteChoices:");

  objc_storeStrong(location, 0);
}

- (void)alternateRoutesView:(id)a3 didSelectRouteChoice:(id)a4
{
  id v5;
  id location[2];
  CPSRoutePreviewsCardView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSTripPreviewsCardView setSelectedRouteChoice:](v7, "setSelectedRouteChoice:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  id v3;
  UIButton *v4;
  UIButton *v5;
  CPSAlternateRoutesView *v6;
  CPSAlternateRoutesView *v7;
  id v8[2];
  CPSRoutePreviewsCardView *v9;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = -[CPSRoutePreviewsCardView alternatesView](v9, "alternatesView");

  if (v7)
  {
    v6 = -[CPSRoutePreviewsCardView alternatesView](v9, "alternatesView");
    objc_msgSend(v8[0], "addObject:");

  }
  v5 = -[CPSTripPreviewsCardView goButton](v9, "goButton");

  if (v5)
  {
    v4 = -[CPSTripPreviewsCardView goButton](v9, "goButton");
    objc_msgSend(v8[0], "addObject:");

  }
  v3 = v8[0];
  objc_storeStrong(v8, 0);
  return v3;
}

- (id)_linearFocusItems
{
  id v3;
  UIButton *v4;
  UIButton *v5;
  int v6;
  id v7;
  CPSAlternateRoutesView *v8;
  CPSAlternateRoutesView *v9;
  char v10;
  UIButton *v11;
  id v12[2];
  CPSRoutePreviewsCardView *v13;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = -[CPSRoutePreviewsCardView alternatesView](v13, "alternatesView");

  if (v9)
  {
    v8 = -[CPSRoutePreviewsCardView alternatesView](v13, "alternatesView");
    v7 = -[CPSAlternateRoutesView _linearFocusItems](v8, "_linearFocusItems");
    objc_msgSend(v12[0], "addObjectsFromArray:");

  }
  v5 = -[CPSTripPreviewsCardView goButton](v13, "goButton");
  v10 = 0;
  LOBYTE(v6) = 0;
  if (v5)
  {
    v11 = -[CPSTripPreviewsCardView goButton](v13, "goButton");
    v10 = 1;
    v6 = -[UIButton isHidden](v11, "isHidden") ^ 1;
  }
  if ((v10 & 1) != 0)

  if ((v6 & 1) != 0)
  {
    v4 = -[CPSTripPreviewsCardView goButton](v13, "goButton");
    objc_msgSend(v12[0], "addObject:");

  }
  v3 = v12[0];
  objc_storeStrong(v12, 0);
  return v3;
}

- (CPSAlternateRoutesView)alternatesView
{
  return self->_alternatesView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternatesView, 0);
}

@end
