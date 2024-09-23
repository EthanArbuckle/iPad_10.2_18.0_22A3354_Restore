@implementation EKTimeZoneSearchResultsController

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v4 = (void *)MEMORY[0x1E0CFA978];
  v5 = a3;
  objc_msgSend(v4, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "citiesMatchingName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTimeZoneViewController setCities:](self, "setCities:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineHeight");
  v12 = v11;
  -[EKTimeZoneSearchResultsController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEstimatedRowHeight:", v12);

  v14 = *MEMORY[0x1E0DC53D8];
  -[EKTimeZoneSearchResultsController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRowHeight:", v14);

  -[EKTimeZoneSearchResultsController tableView](self, "tableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

}

@end
