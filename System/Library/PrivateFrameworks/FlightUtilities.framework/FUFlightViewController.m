@implementation FUFlightViewController

- (FUFlightViewController)init
{
  return -[FUFlightViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (FUFlightViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  FUFlightViewController *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)FUFlightViewController;
  v6 = -[FUFlightViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, CFSTR("FUFlightViewController"), v5);

  if (v6)
  {
    v6->_displayStyle = 2;
    -[FUFlightViewController commonInit](v6, "commonInit");
  }
  return v6;
}

- (FUFlightViewController)initWithFlights:(id)a3
{
  id v4;
  FUFlightViewController *v5;
  FUFlightViewController *v6;

  v4 = a3;
  v5 = -[FUFlightViewController init](self, "init");
  v6 = v5;
  if (v5)
  {
    v5->_displayStyle = 2;
    if (v4)
      -[FUFlightViewController setFlights:](v5, "setFlights:", v4);
    -[FUFlightViewController commonInit](v6, "commonInit");
  }

  return v6;
}

- (FUFlightViewController)initWithSFFlights:(id)a3
{
  id v4;
  FUFlightViewController *v5;
  FUFlightViewController *v6;
  void *v7;

  v4 = a3;
  v5 = -[FUFlightViewController init](self, "init");
  v6 = v5;
  if (v5)
  {
    v5->_displayStyle = 2;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BE37EA8], "convertFlightModel:withError:", v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightViewController setFlights:](v6, "setFlights:", v7);

    }
    -[FUFlightViewController commonInit](v6, "commonInit");
  }

  return v6;
}

- (FUFlightViewController)initWithSFFlight:(id)a3 leg:(int64_t)a4 style:(unint64_t)a5 delegate:(id)a6
{
  id v10;
  id v11;
  FUFlightViewController *v12;
  FUFlightViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = -[FUFlightViewController init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_displayStyle = a5;
    objc_storeWeak((id *)&v12->_delegate, v11);
    if (v10)
    {
      v14 = (void *)MEMORY[0x24BE37EA8];
      v18[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "convertFlightModel:withError:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightViewController setFlights:selectedFlight:selectedLeg:](v13, "setFlights:selectedFlight:selectedLeg:", v16, 0, a4);

    }
    -[FUFlightViewController commonInit](v13, "commonInit");
  }

  return v13;
}

- (FUFlightViewController)initWithFlightCode:(unint64_t)a3 airlineCode:(id)a4
{
  id v6;
  FUFlightViewController *v7;
  FUFlightViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = -[FUFlightViewController init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_displayStyle = 2;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightViewController setFlightCode:](v8, "setFlightCode:", v9);

    -[FUFlightViewController setAirlineCode:](v8, "setAirlineCode:", v6);
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "FU_uppercaseStringUsingCurrentLocale:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%ld"), v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightViewController setTitle:](v8, "setTitle:", v12);

    -[FUFlightViewController commonInit](v8, "commonInit");
    -[FUFlightViewController flightCode](v8, "flightCode");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[FUFlightViewController airlineCode](v8, "airlineCode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v8->_requiresDataLoad = 1;
    }
    if (v8->_viewLoaded && v8->_requiresDataLoad)
    {
      v8->_requiresDataLoad = 0;
      -[FUFlightViewController flightCode](v8, "flightCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightViewController airlineCode](v8, "airlineCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightViewController loadFlightWithFlightCode:airlineCode:date:](v8, "loadFlightWithFlightCode:airlineCode:date:", v16, v17, v18);

    }
  }

  return v8;
}

- (void)commonInit
{
  unint64_t displayStyle;
  id v4;

  -[FUFlightViewController setHighlightCurrentFlightLeg:](self, "setHighlightCurrentFlightLeg:", 1);
  -[FUFlightViewController setShowInfoPanel:](self, "setShowInfoPanel:", 1);
  displayStyle = self->_displayStyle;
  -[FUFlightViewController flightView](self, "flightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayStyle:", displayStyle);

}

- (void)awakeFromNib
{
  unint64_t displayStyle;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FUFlightViewController;
  -[FUFlightViewController awakeFromNib](&v5, sel_awakeFromNib);
  displayStyle = self->_displayStyle;
  -[FUFlightViewController flightView](self, "flightView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayStyle:", displayStyle);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadFlightWithFlightCode:(id)a3 airlineCode:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_time_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FUFlightViewController setAirlineCode:](self, "setAirlineCode:", v9);
  -[FUFlightViewController setFlightCode:](self, "setFlightCode:", v8);
  self->_loadingFlight = 1;
  v11 = dispatch_time(0, 750000000);
  v12 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke;
  block[3] = &unk_24ED16058;
  block[4] = self;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
  objc_initWeak(&location, self);
  v13 = (void *)objc_msgSend(MEMORY[0x24BE37EA0], "flightFactoryClassWithProvider:", *MEMORY[0x24BE37E98]);
  -[FUFlightViewController flightCode](self, "flightCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  -[FUFlightViewController airlineCode](self, "airlineCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_2;
  v18[3] = &unk_24ED160A8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v13, "loadFlightsWithNumber:airlineCode:date:dateType:completionHandler:", v15, v16, v17, 1, v18);
  if (!v10)

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[968])
  {
    objc_msgSend(v2, "showLoadingView");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 976);
    *(_QWORD *)(v4 + 976) = v3;

  }
}

void __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double v10;
  double v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 968) = 0;
    v9 = (void *)*((_QWORD *)WeakRetained + 122);
    v10 = 0.5;
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceNow", 0.5);
      v10 = -v11;
    }
    v12 = dispatch_time(0, (uint64_t)((0.5 - v10) * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_3;
    block[3] = &unk_24ED16080;
    v14 = v6;
    v15 = v8;
    v16 = v5;
    dispatch_after(v12, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __68__FUFlightViewController_loadFlightWithFlightCode_airlineCode_date___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "showErrorView");
  else
    return objc_msgSend(*(id *)(a1 + 40), "setFlights:", *(_QWORD *)(a1 + 48));
}

- (void)setHighlightCurrentFlightLeg:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_highlightCurrentFlightLeg = a3;
  -[FUFlightViewController flightView](self, "flightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FUFlightViewController flightView](self, "flightView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlightCurrentFlightLeg:", v3);

  }
}

- (void)setShowInfoPanel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_showInfoPanel = a3;
  -[FUFlightViewController flightView](self, "flightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FUFlightViewController flightView](self, "flightView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShowInfoPanel:", v3);

  }
}

- (void)setDisplayStyle:(unint64_t)a3
{
  id v4;

  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    -[FUFlightViewController flightView](self, "flightView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayStyle:", a3);

  }
}

- (void)setNoBackground
{
  void *v3;
  id v4;

  -[FUFlightViewController flightView](self, "flightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeMapBackground");

  -[FUFlightViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", 0);

}

- (void)setFlights:(id)a3
{
  -[FUFlightViewController setFlights:selectedFlight:selectedLeg:](self, "setFlights:selectedFlight:selectedLeg:", a3, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)setFlights:(id)a3 selectedFlight:(int64_t)a4 selectedLeg:(int64_t)a5
{
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  self->_loadingFlight = 0;
  objc_storeStrong((id *)&self->_flights, a3);
  v9 = (id)-[FUFlightViewController view](self, "view");
  if (v11 && objc_msgSend(v11, "count"))
  {
    -[FUFlightViewController flightView](self, "flightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIgnoreMapUpdate:", 1);
    objc_msgSend(v10, "setDisplayStyle:", self->_displayStyle);
    -[FUFlightViewController showFlightView](self, "showFlightView");
    if (objc_msgSend(v10, "setFlights:selectedFlight:selectedLeg:", v11, a4, a5))
      objc_msgSend(v10, "layoutSubviews");
    objc_msgSend(v10, "setIgnoreMapUpdate:", 0);
    objc_msgSend(v10, "updateMapCamera");

  }
  else
  {
    -[FUFlightViewController showErrorView](self, "showErrorView");
  }

}

- (void)setSelectedLeg:(int64_t)a3
{
  id v4;

  -[FUFlightViewController flightView](self, "flightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedLeg:", a3);

}

- (void)setSelectedFlight:(int64_t)a3
{
  id v4;

  -[FUFlightViewController flightView](self, "flightView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedFlight:", a3);

}

- (int64_t)selectedLeg
{
  void *v2;
  int64_t v3;

  -[FUFlightViewController flightView](self, "flightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedLeg");

  return v3;
}

- (int64_t)selectedFlight
{
  void *v2;
  int64_t v3;

  -[FUFlightViewController flightView](self, "flightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedFlight");

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FUFlightViewController;
  -[FUFlightViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[FUFlightViewController flightView](self, "flightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayStyle");

  if (!v4)
  {
    -[FUFlightViewController flightView](self, "flightView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayStyle:", 2);

  }
  v6 = -[FUFlightViewController highlightCurrentFlightLeg](self, "highlightCurrentFlightLeg");
  -[FUFlightViewController flightView](self, "flightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHighlightCurrentFlightLeg:", v6);

  v8 = -[FUFlightViewController showInfoPanel](self, "showInfoPanel");
  -[FUFlightViewController flightView](self, "flightView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowInfoPanel:", v8);

  if (self->_requiresDataLoad)
  {
    self->_requiresDataLoad = 0;
    -[FUFlightViewController flightCode](self, "flightCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightViewController airlineCode](self, "airlineCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightViewController loadFlightWithFlightCode:airlineCode:date:](self, "loadFlightWithFlightCode:airlineCode:date:", v10, v11, v12);

  }
  v13 = objc_alloc_init(MEMORY[0x24BDF6BE8]);
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1100);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundEffect:", v14);

  -[FUFlightViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScrollEdgeAppearance:", v13);

  -[FUFlightViewController flightView](self, "flightView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightViewController showView:](self, "showView:", v16);

  -[FUFlightViewController flightView](self, "flightView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  self->_viewLoaded = 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__FUFlightViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_24ED160F0;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", &__block_literal_global, v4);
}

void __77__FUFlightViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "flightView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateMapCamera");

}

- (void)showLoadingView
{
  id v2;

  -[FUFlightViewController flightView](self, "flightView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showLoading");

}

- (void)showErrorView
{
  id v2;

  -[FUFlightViewController flightView](self, "flightView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showError");

}

- (void)showFlightView
{
  id v2;

  -[FUFlightViewController flightView](self, "flightView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showInfo");

}

- (void)showView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (!v5)
    {
      -[FUFlightViewController addFittingView:](self, "addFittingView:", v7);
      objc_msgSend(v7, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightViewController fadeLayer:visible:completionBlock:](self, "fadeLayer:visible:completionBlock:", v6, 1, 0);

      v4 = v7;
    }
  }

}

- (void)hideView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__FUFlightViewController_hideView___block_invoke;
    v7[3] = &unk_24ED16058;
    v8 = v4;
    -[FUFlightViewController fadeLayer:visible:completionBlock:](self, "fadeLayer:visible:completionBlock:", v6, 0, v7);

  }
}

uint64_t __35__FUFlightViewController_hideView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)addFittingView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FUFlightViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[FUFlightViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1628];
  v16 = CFSTR("view");
  v17[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[view]|"), 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v9);

  -[FUFlightViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1628];
  v14 = CFSTR("view");
  v15 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addConstraints:", v13);
}

- (void)fadeLayer:(id)a3 visible:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[FUFlightViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v6)
      *(float *)&v12 = 0.0;
    else
      *(float *)&v12 = 1.0;
    if (v6)
      v13 = 1.0;
    else
      v13 = 0.0;
    if (v6)
      v14 = &unk_24ED1A5D8;
    else
      v14 = &unk_24ED1A5E8;
    if (v6)
      v15 = &unk_24ED1A5E8;
    else
      v15 = &unk_24ED1A5D8;
    objc_msgSend(v8, "setOpacity:", v12);
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v16 = (void *)MEMORY[0x24BDE57D8];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __60__FUFlightViewController_fadeLayer_visible_completionBlock___block_invoke;
    v19[3] = &unk_24ED16118;
    v20 = v9;
    objc_msgSend(v16, "setCompletionBlock:", v19);
    *(float *)&v17 = v13;
    objc_msgSend(v8, "setOpacity:", v17);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDuration:", 0.3);
    objc_msgSend(v18, "setFromValue:", v14);
    objc_msgSend(v18, "setToValue:", v15);
    objc_msgSend(v8, "addAnimation:forKey:", v18, CFSTR("fade"));

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  else
  {
    LODWORD(v12) = 0;
    if (v6)
      *(float *)&v12 = 1.0;
    objc_msgSend(v8, "setOpacity:", v12);
    if (v9)
      v9[2](v9);
  }

}

uint64_t __60__FUFlightViewController_fadeLayer_visible_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (CGSize)preferredContentSize
{
  void *v2;
  unint64_t v3;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 > 6 || ((1 << v3) & 0x62) == 0)
  {
    v5 = 370.0;
    v6 = 696.0;
  }
  else
  {
    v5 = 550.0;
    v6 = 320.0;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)flightView:(id)a3 didSelectLeg:(int64_t)a4 ofFlight:(int64_t)a5
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
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
  void *v25;
  void *v26;
  uint64_t v27;
  id WeakRetained;
  uint64_t v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "flights");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v30, "flights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v9 < 2)
  {
    if (v13 < 2)
    {
      objc_msgSend(v30, "flights");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "displayFlightCode");
      v27 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v18 = (void *)v27;
      -[FUFlightViewController setTitle:](self, "setTitle:", v27);
      goto LABEL_13;
    }
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Leg %lu of %@"), CFSTR("Leg %lu of %@"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "flights");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayFlightCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v16, a4 + 1, v20);
  }
  else
  {
    if (v13 >= 2)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Leg %lu of flight %lu"), CFSTR("Leg %lu of flight %lu"), CFSTR("Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v16, a4 + 1, a5 + 1);
LABEL_11:
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    objc_msgSend(v30, "flights");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayFlightCode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;
    if (!v23)
    {
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Flight %lu"), CFSTR("Flight %lu"), CFSTR("Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v16, a5 + 1, v29);
      goto LABEL_11;
    }
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Flight %@"), CFSTR("Flight %@"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "flights");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayFlightCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v16, v20, v29);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightViewController setTitle:](self, "setTitle:", v26);

LABEL_13:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "flightController:didSelectLeg:ofFlight:", self, a4, a5);

}

- (FUFlightView)flightView
{
  return self->_regularFlightView;
}

- (NSArray)flights
{
  return self->_flights;
}

- (BOOL)highlightCurrentFlightLeg
{
  return self->_highlightCurrentFlightLeg;
}

- (BOOL)showInfoPanel
{
  return self->_showInfoPanel;
}

- (FUFlightView)regularFlightView
{
  return (FUFlightView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setRegularFlightView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (FUFlightView)previewFlightView
{
  return (FUFlightView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setPreviewFlightView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (NSNumber)flightCode
{
  return (NSNumber *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setFlightCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSString)airlineCode
{
  return (NSString *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setAirlineCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airlineCode, 0);
  objc_storeStrong((id *)&self->_flightCode, 0);
  objc_storeStrong((id *)&self->_flights, 0);
  objc_storeStrong((id *)&self->_savedAppearance, 0);
  objc_storeStrong((id *)&self->_previewFlightView, 0);
  objc_storeStrong((id *)&self->_regularFlightView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startLoadingDate, 0);
}

@end
