@implementation SFContactAutoFillDetailViewController

- (SFContactAutoFillDetailViewController)initWithPropertyValues:(id)a3
{
  id v5;
  SFContactAutoFillDetailViewController *v6;
  SFContactAutoFillDetailViewController *v7;
  SFContactAutoFillDetailViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFContactAutoFillDetailViewController;
  v6 = -[SFContactAutoFillDetailViewController initWithStyle:](&v10, sel_initWithStyle_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_propertyValues, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFContactAutoFillDetailViewController;
  -[SFContactAutoFillDetailViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SFContactAutoFillDetailViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "setTableFooterView:", v4);

  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 100.0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SFContactAutoFillPropertyValues values](self->_propertyValues, "values", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsesDetailAppearance:", 1);
  v8 = -[SFContactAutoFillPropertyValues selectedIndex](self->_propertyValues, "selectedIndex");
  if (v8 == objc_msgSend(v6, "row"))
    v9 = 3;
  else
    v9 = 0;
  objc_msgSend(v7, "setAccessoryType:", v9);
  -[SFContactAutoFillPropertyValues values](self->_propertyValues, "values");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContactAutoFillPropertyValues property](self->_propertyValues, "property");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:property:", v12, v13);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "row");

  -[SFContactAutoFillPropertyValues setSelectedIndex:](self->_propertyValues, "setSelectedIndex:", v7);
  -[SFContactAutoFillDetailViewController navigationController](self, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyValues, 0);
}

@end
