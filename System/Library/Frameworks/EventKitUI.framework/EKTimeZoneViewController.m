@implementation EKTimeZoneViewController

- (EKTimeZoneViewController)initWithChooserStyle:(int)a3
{
  EKTimeZoneViewController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKTimeZoneViewController;
  v4 = -[EKTimeZoneViewController initWithStyle:](&v8, sel_initWithStyle_, 0);
  if (v4)
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Time Zone"), &stru_1E601DFA8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTimeZoneViewController setTitle:](v4, "setTitle:", v6);

    v4->_style = a3;
  }
  return v4;
}

- (void)viewDidLoad
{
  EKTimeZoneSearchResultsController *v3;
  void *v4;
  void *v5;
  UISearchController *v6;
  UISearchController *searchController;
  void *v8;
  UISearchController *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EKTimeZoneViewController;
  -[EKTimeZoneViewController viewDidLoad](&v18, sel_viewDidLoad);
  v3 = -[EKTimeZoneViewController initWithChooserStyle:]([EKTimeZoneSearchResultsController alloc], "initWithChooserStyle:", -[EKTimeZoneViewController chooserStyle](self, "chooserStyle"));
  -[EKTimeZoneViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTimeZoneViewController setDelegate:](v3, "setDelegate:", v4);

  -[EKTimeZoneViewController timeZone](self, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTimeZoneViewController setTimeZone:](v3, "setTimeZone:", v5);

  v6 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", v3);
  searchController = self->_searchController;
  self->_searchController = v6;

  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", v3);
  -[EKTimeZoneViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredSearchBarPlacement:", 2);

  v9 = self->_searchController;
  -[EKTimeZoneViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSearchController:", v9);

  -[EKTimeZoneViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidesSearchBarWhenScrolling:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lineHeight");
  v14 = v13;
  -[EKTimeZoneViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEstimatedRowHeight:", v14);

  v16 = *MEMORY[0x1E0DC53D8];
  -[EKTimeZoneViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRowHeight:", v16);

  -[EKTimeZoneViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  NSTimeZone *timeZone;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *cities;
  NSArray *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKTimeZoneViewController;
  -[EKTimeZoneViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  timeZone = self->_timeZone;
  if (timeZone)
  {
    -[NSTimeZone cityName](timeZone, "cityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "citiesMatchingName:", v5);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cities = self->_cities;
    self->_cities = v8;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allCities");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cities;
    self->_cities = v10;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v8;

  v3 = a3;
  -[EKTimeZoneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!EKUICurrentHeightSizeClassIsRegular(v5))
    goto LABEL_6;
  -[EKTimeZoneViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v6))
  {

LABEL_6:
    goto LABEL_7;
  }
  v7 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");

  if (!v7)
  {
    -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
    -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
  }
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)EKTimeZoneViewController;
  -[EKTimeZoneViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = EKUIContainedControllerIdealWidth();
  v3 = 600.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_cities, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  EKUITableViewCell *v6;
  NSArray *cities;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("TimeZone"));
  cities = self->_cities;
  v8 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndexedSubscript:](cities, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayNameIncludingCountry:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v6, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[NSArray objectAtIndexedSubscript:](self->_cities, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v11, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeZoneWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCityName:", v9);

    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "timeZoneViewController:didSelectTimeZone:", self, v8);

  }
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *cities;
  id v7;

  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCities");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cities = self->_cities;
  self->_cities = v5;

  -[EKTimeZoneViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (EKTimeZoneViewControllerDelegate)delegate
{
  return (EKTimeZoneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (int)chooserStyle
{
  return self->_chooserStyle;
}

- (NSArray)cities
{
  return self->_cities;
}

- (void)setCities:(id)a3
{
  objc_storeStrong((id *)&self->_cities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
