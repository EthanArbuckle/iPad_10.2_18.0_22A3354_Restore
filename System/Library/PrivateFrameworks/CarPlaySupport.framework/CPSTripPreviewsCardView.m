@implementation CPSTripPreviewsCardView

- (CPSTripPreviewsCardView)initWithTripDelegate:(id)a3 trips:(id)a4 textConfiguration:(id)a5
{
  CPSTripPreviewsCardView *v5;
  CPSTripPreviewsCardView *v7;
  void *v8;
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
  CPSCardPlatterView *v24;
  objc_super v25;
  id v26;
  id v27;
  id location[2];
  CPSTripPreviewsCardView *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v5 = v29;
  v29 = 0;
  v25.receiver = v5;
  v25.super_class = (Class)CPSTripPreviewsCardView;
  v29 = -[CPSTripPreviewsCardView init](&v25, sel_init);
  objc_storeStrong((id *)&v29, v29);
  if (v29)
  {
    objc_storeWeak((id *)&v29->_tripDelegate, location[0]);
    objc_storeStrong((id *)&v29->_trips, v27);
    objc_storeStrong((id *)&v29->_textConfiguration, v26);
    -[CPSTripPreviewsCardView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = objc_alloc_init(CPSCardPlatterView);
    -[CPSTripPreviewsCardView addSubview:](v29, "addSubview:", v24);
    objc_storeStrong((id *)&v29->_platterView, v24);
    v8 = (void *)MEMORY[0x24BDD1628];
    v21 = (id)-[CPSCardPlatterView leadingAnchor](v24, "leadingAnchor");
    v20 = (id)-[CPSTripPreviewsCardView leadingAnchor](v29, "leadingAnchor");
    v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
    v30[0] = v19;
    v18 = (id)-[CPSCardPlatterView topAnchor](v24, "topAnchor");
    v17 = (id)-[CPSTripPreviewsCardView topAnchor](v29, "topAnchor");
    v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
    v30[1] = v16;
    v15 = (id)-[CPSCardPlatterView trailingAnchor](v24, "trailingAnchor");
    v14 = (id)-[CPSTripPreviewsCardView trailingAnchor](v29, "trailingAnchor");
    v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
    v30[2] = v13;
    v12 = (id)-[CPSCardPlatterView bottomAnchor](v24, "bottomAnchor");
    v11 = (id)-[CPSTripPreviewsCardView bottomAnchor](v29, "bottomAnchor");
    v10 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
    v30[3] = v10;
    v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    objc_msgSend(v8, "activateConstraints:");

    -[CPSCardPlatterView setClipsToBounds:](v24, "setClipsToBounds:", 1);
    objc_storeStrong((id *)&v24, 0);
  }
  v7 = v29;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v29, 0);
  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSTripPreviewsCardView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSTripPreviewsCardView;
  -[CPSTripPreviewsCardView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSTripPreviewsCardView _updateButtonColors](v5, "_updateButtonColors");
  objc_storeStrong(location, 0);
}

- (void)_updateButtonColors
{
  id v2;
  UIButton *v3;
  id v4;
  UIButton *v5;

  v3 = -[CPSTripPreviewsCardView goButton](self, "goButton");
  v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "externalSystemGreenColor");
  -[UIButton cps_setBackgroundColor:forState:](v3, "cps_setBackgroundColor:forState:");

  v5 = -[CPSTripPreviewsCardView goButton](self, "goButton");
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  -[UIButton cps_setBackgroundColor:forState:](v5, "cps_setBackgroundColor:forState:");

}

- (id)setupGoButton
{
  double v2;
  NSString *v3;
  NSString *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  NSString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSString *v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25;
  NSString *v26;
  id v27[2];
  CPSTripPreviewsCardView *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v28 = self;
  v27[1] = (id)a2;
  v27[0] = (id)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  objc_msgSend(v27[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v2) = 1148846080;
  objc_msgSend(v27[0], "setContentHuggingPriority:forAxis:", 1, v2);
  v20 = -[CPTripPreviewTextConfiguration startButtonTitle](v28->_textConfiguration, "startButtonTitle");
  v24 = 0;
  if (v20)
  {
    v3 = v20;
  }
  else
  {
    v25 = CPSLocalizedStringForKey(CFSTR("GO"));
    v24 = 1;
    v3 = (NSString *)v25;
  }
  v26 = v3;
  if ((v24 & 1) != 0)

  v23 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
  v6 = objc_alloc(MEMORY[0x24BDD1458]);
  v5 = v26;
  v9 = (_QWORD *)MEMORY[0x24BDF65F8];
  v31[0] = *MEMORY[0x24BDF65F8];
  v32[0] = v23;
  v10 = (_QWORD *)MEMORY[0x24BDF6600];
  v31[1] = *MEMORY[0x24BDF6600];
  v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "externalSystemGreenColor");
  v32[1] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31);
  v22 = (id)objc_msgSend(v6, "initWithString:attributes:", v5);

  objc_msgSend(v27[0], "setAttributedTitle:forState:", v22);
  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  v11 = v26;
  v29[0] = *v9;
  v30[0] = v23;
  v29[1] = *v10;
  v14 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  v30[1] = v14;
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v21 = (id)objc_msgSend(v12, "initWithString:attributes:", v11);

  objc_msgSend(v27[0], "setAttributedTitle:forState:", v21);
  v15 = v27[0];
  v16 = (id)objc_msgSend(MEMORY[0x24BDF6950], "externalSystemGreenColor");
  objc_msgSend(v15, "cps_setBackgroundColor:forState:");

  v17 = v27[0];
  v18 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  objc_msgSend(v17, "cps_setBackgroundColor:forState:");

  objc_msgSend(v27[0], "addTarget:action:forControlEvents:", v28, sel_startTripButtonPressed_, 0x2000);
  objc_storeStrong((id *)&v28->_goButton, v27[0]);
  v19 = v27[0];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v26, 0);
  objc_storeStrong(v27, 0);
  return v19;
}

- (void)setSelectedTrip:(id)a3
{
  CPSTripPreviewsCardView *v3;
  id v4;
  id v5;
  id location[2];
  CPSTripPreviewsCardView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v7->_selectedTrip, location[0]);
  v5 = (id)objc_msgSend(location[0], "routeChoices");
  v3 = v7;
  v4 = (id)objc_msgSend(v5, "firstObject");
  -[CPSTripPreviewsCardView setSelectedRouteChoice:](v3, "setSelectedRouteChoice:");

  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setSelectedRouteChoice:(id)a3
{
  id location[2];
  CPSTripPreviewsCardView *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_selectedRouteChoice, location[0]);
  -[CPSTripPreviewsCardView notifyDidSelectRouteChoice:](v4, "notifyDidSelectRouteChoice:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)updateEstimates:(id)a3 forTripIdentifier:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)startTripButtonPressed:(id)a3
{
  id v3;
  os_log_type_t type;
  os_log_t oslog;
  id v6;
  id v7;
  id location[2];
  CPSTripPreviewsCardView *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[CPSTripPreviewsCardView selectedTrip](v9, "selectedTrip");
  v6 = -[CPSTripPreviewsCardView selectedRouteChoice](v9, "selectedRouteChoice");
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v7, (uint64_t)v6);
    _os_log_impl(&dword_21E389000, oslog, type, "start selected trip: %@ route: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v3 = -[CPSTripPreviewsCardView tripDelegate](v9, "tripDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "tripView:startedTrip:routeChoice:", v9, v7, v6);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)notifyDidSelectRouteChoice:(id)a3
{
  CPSTripPreviewsCardView *v3;
  CPTrip *v4;
  id v5;
  os_log_type_t v6;
  id v7;
  id location[2];
  CPSTripPreviewsCardView *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = CarPlaySupportGeneralLogging();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)location[0]);
    _os_log_impl(&dword_21E389000, (os_log_t)v7, v6, "route selected: %@", v10, 0xCu);
  }
  objc_storeStrong(&v7, 0);
  v5 = -[CPSTripPreviewsCardView tripDelegate](v9, "tripDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = v9;
    v4 = -[CPSTripPreviewsCardView selectedTrip](v9, "selectedTrip");
    objc_msgSend(v5, "tripView:selectedTrip:routeChoice:", v3);

  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)_linearFocusItems
{
  return MEMORY[0x24BDBD1A8];
}

- (NSArray)trips
{
  return self->_trips;
}

- (CPTripPreviewTextConfiguration)textConfiguration
{
  return self->_textConfiguration;
}

- (void)setTextConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_textConfiguration, a3);
}

- (CPTrip)selectedTrip
{
  return (CPTrip *)objc_loadWeakRetained((id *)&self->_selectedTrip);
}

- (CPRouteChoice)selectedRouteChoice
{
  return (CPRouteChoice *)objc_loadWeakRetained((id *)&self->_selectedRouteChoice);
}

- (CPSCardPlatterView)platterView
{
  return self->_platterView;
}

- (CPSTripInitiating)tripDelegate
{
  return (CPSTripInitiating *)objc_loadWeakRetained((id *)&self->_tripDelegate);
}

- (UIButton)goButton
{
  return self->_goButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goButton, 0);
  objc_destroyWeak((id *)&self->_tripDelegate);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_selectedRouteChoice);
  objc_destroyWeak((id *)&self->_selectedTrip);
  objc_storeStrong((id *)&self->_textConfiguration, 0);
  objc_storeStrong((id *)&self->_trips, 0);
}

@end
