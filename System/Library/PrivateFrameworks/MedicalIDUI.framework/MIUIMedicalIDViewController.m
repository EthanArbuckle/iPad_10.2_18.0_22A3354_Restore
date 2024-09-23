@implementation MIUIMedicalIDViewController

- (MIUIMedicalIDViewController)initWithHealthStore:(id)a3 displayConfiguration:(id)a4
{
  id v7;
  id v8;
  MIUIMedicalIDViewController *v9;
  MIUIMedicalIDViewController *v10;
  _HKMedicalIDData *medicalIDData;
  _TtC11MedicalIDUI20MedicalIDViewFactory *v12;
  _TtC11MedicalIDUI20MedicalIDViewFactory *factory;
  uint64_t v14;
  UIViewController *hostedController;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MIUIMedicalIDViewController;
  v9 = -[MIUIMedicalIDViewController init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayConfiguration, a4);
    objc_storeStrong((id *)&v10->_healthStore, a3);
    medicalIDData = v10->_medicalIDData;
    v10->_medicalIDData = 0;

    v12 = objc_alloc_init(_TtC11MedicalIDUI20MedicalIDViewFactory);
    factory = v10->_factory;
    v10->_factory = v12;

    -[MedicalIDViewFactory makeHostingControllerWithHealthStore:medicalIDData:displayConfiguration:](v10->_factory, "makeHostingControllerWithHealthStore:medicalIDData:displayConfiguration:", v10->_healthStore, v10->_medicalIDData, v10->_displayConfiguration);
    v14 = objc_claimAutoreleasedReturnValue();
    hostedController = v10->_hostedController;
    v10->_hostedController = (UIViewController *)v14;

  }
  return v10;
}

- (MIUIMedicalIDViewController)initWithHealthStore:(id)a3 medicalIDData:(id)a4 displayConfiguration:(id)a5
{
  id v9;
  id v10;
  id v11;
  MIUIMedicalIDViewController *v12;
  MIUIMedicalIDViewController *v13;
  _TtC11MedicalIDUI20MedicalIDViewFactory *v14;
  _TtC11MedicalIDUI20MedicalIDViewFactory *factory;
  uint64_t v16;
  UIViewController *hostedController;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MIUIMedicalIDViewController;
  v12 = -[MIUIMedicalIDViewController init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_medicalIDData, a4);
    objc_storeStrong((id *)&v13->_displayConfiguration, a5);
    v14 = objc_alloc_init(_TtC11MedicalIDUI20MedicalIDViewFactory);
    factory = v13->_factory;
    v13->_factory = v14;

    -[MedicalIDViewFactory makeHostingControllerWithHealthStore:medicalIDData:displayConfiguration:](v13->_factory, "makeHostingControllerWithHealthStore:medicalIDData:displayConfiguration:", v13->_healthStore, v13->_medicalIDData, v13->_displayConfiguration);
    v16 = objc_claimAutoreleasedReturnValue();
    hostedController = v13->_hostedController;
    v13->_hostedController = (UIViewController *)v16;

  }
  return v13;
}

- (MIUIMedicalIDViewController)initWithCoder:(id)a3
{
  MIUIMedicalIDViewController *v3;
  uint64_t v4;
  MIUIDisplayConfiguration *displayConfiguration;
  HKHealthStore *v6;
  HKHealthStore *healthStore;
  _HKMedicalIDData *medicalIDData;
  _TtC11MedicalIDUI20MedicalIDViewFactory *v9;
  _TtC11MedicalIDUI20MedicalIDViewFactory *factory;
  uint64_t v11;
  UIViewController *hostedController;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MIUIMedicalIDViewController;
  v3 = -[MIUIMedicalIDViewController initWithCoder:](&v14, sel_initWithCoder_, a3);
  if (v3)
  {
    +[MIUIDisplayConfiguration standardConfiguration](MIUIDisplayConfiguration, "standardConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
    displayConfiguration = v3->_displayConfiguration;
    v3->_displayConfiguration = (MIUIDisplayConfiguration *)v4;

    v6 = (HKHealthStore *)objc_alloc_init(MEMORY[0x24BDD3C40]);
    healthStore = v3->_healthStore;
    v3->_healthStore = v6;

    medicalIDData = v3->_medicalIDData;
    v3->_medicalIDData = 0;

    v9 = objc_alloc_init(_TtC11MedicalIDUI20MedicalIDViewFactory);
    factory = v3->_factory;
    v3->_factory = v9;

    -[MedicalIDViewFactory makeHostingControllerWithHealthStore:medicalIDData:displayConfiguration:](v3->_factory, "makeHostingControllerWithHealthStore:medicalIDData:displayConfiguration:", v3->_healthStore, v3->_medicalIDData, v3->_displayConfiguration);
    v11 = objc_claimAutoreleasedReturnValue();
    hostedController = v3->_hostedController;
    v3->_hostedController = (UIViewController *)v11;

  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersHomeIndicatorHidden
{
  return -[MIUIDisplayConfiguration isHomeIndicatorHidden](self->_displayConfiguration, "isHomeIndicatorHidden");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  MIUIMedicalIDNavigationBarView *v5;
  HKHealthStore *healthStore;
  _HKMedicalIDData *medicalIDData;
  _BOOL8 v8;
  void *v9;
  MIUIMedicalIDNavigationBarView *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MIUIMedicalIDViewController;
  -[MIUIMedicalIDViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[MIUIMedicalIDViewController addChildViewController:](self, "addChildViewController:", self->_hostedController);
  -[MIUIMedicalIDViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_hostedController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[UIViewController didMoveToParentViewController:](self->_hostedController, "didMoveToParentViewController:", self);
  v5 = [MIUIMedicalIDNavigationBarView alloc];
  healthStore = self->_healthStore;
  medicalIDData = self->_medicalIDData;
  v8 = -[MIUIDisplayConfiguration isLockScreen](self->_displayConfiguration, "isLockScreen");
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MIUIMedicalIDNavigationBarView initWithHealthStore:medicalIDData:showDateUpdated:locale:](v5, "initWithHealthStore:medicalIDData:showDateUpdated:locale:", healthStore, medicalIDData, v8, v9);
  -[MIUIMedicalIDViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleView:", v10);

  if (-[MIUIDisplayConfiguration shouldShowDoneButton](self->_displayConfiguration, "shouldShowDoneButton"))
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x24BEBD388];
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __42__MIUIMedicalIDViewController_viewDidLoad__block_invoke;
    v20 = &unk_251193828;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v12, "actionWithHandler:", &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x24BEBD410]);
    v15 = (void *)objc_msgSend(v14, "initWithBarButtonSystemItem:primaryAction:", 0, v13, v17, v18, v19, v20);
    -[MIUIMedicalIDViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", v15);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __42__MIUIMedicalIDViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIUIMedicalIDViewController;
  -[MIUIMedicalIDViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[MedicalIDViewFactory scrollView](self->_factory, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIUIMedicalIDViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v4, 15);

}

- (void)viewDidLayoutSubviews
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
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MIUIMedicalIDViewController;
  -[MIUIMedicalIDViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[MIUIMedicalIDViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIViewController view](self->_hostedController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_hostedController, 0);
}

@end
