@implementation DMCPayloadDetailsViewController

- (DMCPayloadDetailsViewController)initWithPayload:(id)a3
{
  id v5;
  DMCPayloadDetailsViewController *v6;
  DMCPayloadDetailsViewController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMCPayloadDetailsViewController;
  v6 = -[DMCProfileTableViewController initWithStyle:](&v11, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payload, a3);
    objc_msgSend(v5, "friendlyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payloadDescriptionKeyValueSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCPayloadDetailsViewController _setTitle:keyValueSections:](v7, "_setTitle:keyValueSections:", v8, v9);

    -[DMCPayloadDetailsViewController _setup](v7, "_setup");
  }

  return v7;
}

- (DMCPayloadDetailsViewController)initWithPayloadViewModel:(id)a3
{
  id v5;
  DMCPayloadDetailsViewController *v6;
  DMCPayloadDetailsViewController *v7;
  id *p_payloadViewModel;
  void *v9;
  void *v10;
  uint64_t v11;
  DMCCertificateProperties *v12;
  void *v13;
  DMCCertificateProperties *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMCPayloadDetailsViewController;
  v6 = -[DMCProfileTableViewController initWithStyle:](&v19, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    p_payloadViewModel = (id *)&v6->_payloadViewModel;
    objc_storeStrong((id *)&v6->_payloadViewModel, a3);
    v9 = (void *)objc_opt_new();
    objc_msgSend(*p_payloadViewModel, "certificateProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = [DMCCertificateProperties alloc];
      objc_msgSend(*p_payloadViewModel, "certificateProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[DMCCertificateProperties initWithCertificateProperties:](v12, "initWithCertificateProperties:", v13);

      -[DMCCertificateProperties keyValueSections](v14, "keyValueSections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v15);

    }
    objc_msgSend(v5, "payloadDescriptionKeyValueSections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v16);

    objc_msgSend(v5, "friendlyName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCPayloadDetailsViewController _setTitle:keyValueSections:](v7, "_setTitle:keyValueSections:", v17, v9);

    -[DMCPayloadDetailsViewController _setup](v7, "_setup");
  }

  return v7;
}

- (void)_setup
{
  void *v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMCPayloadDetailsViewController;
  -[DMCProfileTableViewController updateExtendedLayoutIncludesOpaqueBars](&v5, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[DMCPayloadDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PayloadDetailsCell"));

  v4.receiver = self;
  v4.super_class = (Class)DMCPayloadDetailsViewController;
  -[DMCProfileTableViewController reloadTableOnContentSizeCategoryChange](&v4, sel_reloadTableOnContentSizeCategoryChange);
}

- (void)_setTitle:(id)a3 keyValueSections:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[DMCPayloadDetailsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  -[DMCPayloadDetailsViewController setKeyValueSections:](self, "setKeyValueSections:", v8);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[DMCPayloadDetailsViewController keyValueSections](self, "keyValueSections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[DMCPayloadDetailsViewController _keyValueSectionForSection:](self, "_keyValueSectionForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionKeyValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "count");
  else
    v6 = 0;

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[DMCPayloadDetailsViewController _keyValueSectionForSection:](self, "_keyValueSectionForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[DMCPayloadDetailsViewController _keyValueSectionForSection:](self, "_keyValueSectionForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_keyValueSectionForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[DMCPayloadDetailsViewController keyValueSections](self, "keyValueSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= (unint64_t)a3)
  {
    v7 = 0;
  }
  else
  {
    -[DMCPayloadDetailsViewController keyValueSections](self, "keyValueSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[DMCPayloadDetailsViewController keyValueSections](self, "keyValueSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sectionKeyValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PayloadDetailsCell"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDetail:value:", v13, v14);

  return v12;
}

- (MCPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (DMCPayloadViewModel)payloadViewModel
{
  return self->_payloadViewModel;
}

- (void)setPayloadViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_payloadViewModel, a3);
}

- (NSArray)keyValueSections
{
  return self->_keyValueSections;
}

- (void)setKeyValueSections:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueSections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueSections, 0);
  objc_storeStrong((id *)&self->_payloadViewModel, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
