@implementation HLPHelpSearchResultTableViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HLPHelpSearchResultTableViewController;
  -[HLPHelpSearchResultTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[HLPHelpSearchResultTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 0);

  -[HLPHelpSearchResultTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SearchResultTableViewIdentifier"));

}

- (UIView)footerView
{
  UIView *footerView;
  UIView *v4;
  UIView *v5;
  UILabel *v6;
  UILabel *footerLabel;
  uint64_t v8;
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

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    v5 = self->_footerView;
    self->_footerView = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    footerLabel = self->_footerLabel;
    self->_footerLabel = v6;

    v8 = *MEMORY[0x24BDF7850];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_footerLabel, "setFont:", v9);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_footerLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_footerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("No results found"), &stru_24D32F538, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_footerLabel, "setText:", v11);

    if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.309803922, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_footerLabel, "setTextColor:", v12);

    -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_footerLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_footerLabel, "setFont:", v13);

    -[UIView addSubview:](self->_footerView, "addSubview:", self->_footerLabel);
    -[UILabel leadingAnchor](self->_footerLabel, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_footerView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 12.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UILabel trailingAnchor](self->_footerLabel, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_footerView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -12.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[UILabel topAnchor](self->_footerLabel, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_footerView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 50.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    footerView = self->_footerView;
  }
  return footerView;
}

- (void)updateWithSearchText:(id)a3 searchResults:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_storeStrong((id *)&self->_searchResults, a4);
  v7 = a3;
  -[HLPHelpSearchResultTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

  v9 = objc_msgSend(v7, "length");
  if (!v9)
    goto LABEL_4;
  if (objc_msgSend(v12, "count"))
  {
    LODWORD(v9) = 0;
LABEL_4:
    v10 = 0;
    goto LABEL_6;
  }
  -[HLPHelpSearchResultTableViewController footerView](self, "footerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1;
LABEL_6:
  -[HLPHelpSearchResultTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTableFooterView:", v10);

  if ((_DWORD)v9)
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_searchResults, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *searchResults;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("SearchResultTableViewIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSearchResult:", 1);
  objc_msgSend(v7, "setShowFirstLevelIcon:", 0);
  if (!-[HLPHelpSearchResultTableViewController fullBookView](self, "fullBookView"))
    objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v7, "setIgnoreLevels:", 1);
  searchResults = self->_searchResults;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](searchResults, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHelpItem:", v10);

  return v7;
}

- (void)preferSeparatorValue:(double)a3
{
  double v3;
  id v4;

  if (a3 >= 24.0)
    v3 = a3;
  else
    v3 = 24.0;
  if (self->_separatorValue != v3)
  {
    self->_separatorValue = v3;
    -[HLPHelpSearchResultTableViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSeparatorInset:", 0.0, v3, 0.0, 0.0);

  }
}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (void)setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (void)setFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_footerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
}

@end
