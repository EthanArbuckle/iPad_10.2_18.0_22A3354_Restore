@implementation WFContentAttributionSetDebuggerViewController

- (void)setContentItems:(id)a3
{
  NSArray *v4;
  NSArray *contentItems;
  id v6;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  contentItems = self->_contentItems;
  self->_contentItems = v4;

  if (-[WFContentAttributionSetDebuggerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WFContentAttributionSetDebuggerViewController tableView](self, "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFContentAttributionSetDebuggerViewController;
  -[WFContentAttributionSetDebuggerViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[WFContentAttributionSetDebuggerViewController setTitle:](self, "setTitle:", CFSTR("Content Source"));
  -[WFContentAttributionSetDebuggerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WFContentAttributionCellIdentifier"));

  v4 = *MEMORY[0x24BEBE770];
  -[WFContentAttributionSetDebuggerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRowHeight:", v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFContentAttributionSetDebuggerViewController contentItems](self, "contentItems", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[WFContentAttributionSetDebuggerViewController contentItems](self, "contentItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WFContentAttributionCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentAttributionSetDebuggerViewController contentItems](self, "contentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "updateCellWithContentAttribution:", v13);
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WFContentAttributionSetDebuggerViewController contentItems](self, "contentItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
}

@end
