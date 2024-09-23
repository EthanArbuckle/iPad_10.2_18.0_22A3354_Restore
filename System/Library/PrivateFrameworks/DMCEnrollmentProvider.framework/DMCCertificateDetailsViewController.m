@implementation DMCCertificateDetailsViewController

- (DMCCertificateDetailsViewController)init
{
  DMCCertificateDetailsViewController *v2;
  DMCCertificateDetailsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMCCertificateDetailsViewController;
  v2 = -[DMCProfileTableViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DMCCertificateDetailsViewController _setup](v2, "_setup");
  return v3;
}

- (DMCCertificateDetailsViewController)initWithStyle:(int64_t)a3
{
  DMCCertificateDetailsViewController *v3;
  DMCCertificateDetailsViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCCertificateDetailsViewController;
  v3 = -[DMCProfileTableViewController initWithStyle:](&v6, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
    -[DMCCertificateDetailsViewController _setup](v3, "_setup");
  return v4;
}

- (DMCCertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3
{
  DMCCertificateDetailsViewController *v4;
  DMCCertificateProperties *v5;
  void *v6;
  uint64_t v7;
  NSArray *keyValueSectionTitles;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMCCertificateDetailsViewController;
  v4 = -[DMCProfileTableViewController initWithStyle:](&v10, sel_initWithStyle_, 2);
  if (v4)
  {
    v5 = -[DMCCertificateProperties initWithCertificate:]([DMCCertificateProperties alloc], "initWithCertificate:", a3);
    -[DMCCertificateProperties sections](v5, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_storeStrong((id *)&v4->_keyValueSections, v6);
      -[DMCCertificateProperties sectionTitles](v5, "sectionTitles");
      v7 = objc_claimAutoreleasedReturnValue();
      keyValueSectionTitles = v4->_keyValueSectionTitles;
      v4->_keyValueSectionTitles = (NSArray *)v7;

    }
    -[DMCCertificateDetailsViewController _setup](v4, "_setup");

  }
  return v4;
}

- (DMCCertificateDetailsViewController)initWithCertificateProperties:(id)a3
{
  id v4;
  DMCCertificateDetailsViewController *v5;
  DMCCertificateProperties *v6;
  void *v7;
  uint64_t v8;
  NSArray *keyValueSectionTitles;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMCCertificateDetailsViewController;
  v5 = -[DMCProfileTableViewController initWithStyle:](&v11, sel_initWithStyle_, 2);
  if (v5)
  {
    v6 = -[DMCCertificateProperties initWithCertificateProperties:]([DMCCertificateProperties alloc], "initWithCertificateProperties:", v4);
    -[DMCCertificateProperties sections](v6, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      -[DMCCertificateProperties sectionTitles](v6, "sectionTitles");
      v8 = objc_claimAutoreleasedReturnValue();
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;

    }
    -[DMCCertificateDetailsViewController _setup](v5, "_setup");

  }
  return v5;
}

- (DMCCertificateDetailsViewController)initWithTrust:(__SecTrust *)a3
{
  DMCCertificateDetailsViewController *v4;
  DMCCertificateDetailsViewController *v5;
  DMCCertificateProperties *v6;
  void *v7;
  uint64_t v8;
  NSArray *keyValueSectionTitles;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DMCCertificateDetailsViewController;
  v4 = -[DMCProfileTableViewController initWithStyle:](&v11, sel_initWithStyle_, 2);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(&v4->_certificateTrust, a3);
    v6 = -[DMCCertificateProperties initWithTrust:]([DMCCertificateProperties alloc], "initWithTrust:", a3);
    -[DMCCertificateProperties sections](v6, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      -[DMCCertificateProperties sectionTitles](v6, "sectionTitles");
      v8 = objc_claimAutoreleasedReturnValue();
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;

    }
    -[DMCCertificateDetailsViewController _setup](v5, "_setup");

  }
  return v5;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMCCertificateDetailsViewController;
  -[DMCProfileTableViewController updateExtendedLayoutIncludesOpaqueBars](&v7, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[DMCCertificateDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CertificateDetailsCell"));

  DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_DETAILS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCCertificateDetailsViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  v6.receiver = self;
  v6.super_class = (Class)DMCCertificateDetailsViewController;
  -[DMCProfileTableViewController reloadTableOnContentSizeCategoryChange](&v6, sel_reloadTableOnContentSizeCategoryChange);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[DMCCertificateDetailsViewController keyValueSections](self, "keyValueSections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[DMCCertificateDetailsViewController keyValueSections](self, "keyValueSections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
    return 0;
  -[DMCCertificateDetailsViewController keyValueSections](self, "keyValueSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (uint64_t)(double)((unint64_t)objc_msgSend(v9, "count") >> 1);
  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[DMCCertificateDetailsViewController keyValueSectionTitles](self, "keyValueSectionTitles", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v9 = 0;
  }
  else
  {
    -[DMCCertificateDetailsViewController keyValueSectionTitles](self, "keyValueSectionTitles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
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

  v6 = a4;
  v7 = a3;
  -[DMCCertificateDetailsViewController keyValueSections](self, "keyValueSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndex:", 2 * objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", (2 * objc_msgSend(v6, "row")) | 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CertificateDetailsCell"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDetail:value:", v10, v11);
  return v12;
}

- (id)certificateTrust
{
  return self->_certificateTrust;
}

- (void)setCertificateTrust:(id)a3
{
  objc_storeStrong(&self->_certificateTrust, a3);
}

- (NSArray)keyValueSections
{
  return self->_keyValueSections;
}

- (void)setKeyValueSections:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueSections, a3);
}

- (NSArray)keyValueSectionTitles
{
  return self->_keyValueSectionTitles;
}

- (void)setKeyValueSectionTitles:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueSectionTitles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueSectionTitles, 0);
  objc_storeStrong((id *)&self->_keyValueSections, 0);
  objc_storeStrong(&self->_certificateTrust, 0);
}

@end
