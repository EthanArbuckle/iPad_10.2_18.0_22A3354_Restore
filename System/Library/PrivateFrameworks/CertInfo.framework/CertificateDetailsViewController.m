@implementation CertificateDetailsViewController

- (CertificateDetailsViewController)init
{
  CertificateDetailsViewController *v2;
  CertificateDetailsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CertificateDetailsViewController;
  v2 = -[CertificateDetailsViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CertificateDetailsViewController _setup](v2, "_setup");
  return v3;
}

- (CertificateDetailsViewController)initWithStyle:(int64_t)a3
{
  CertificateDetailsViewController *v3;
  CertificateDetailsViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CertificateDetailsViewController;
  v3 = -[CertificateDetailsViewController initWithStyle:](&v6, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
    -[CertificateDetailsViewController _setup](v3, "_setup");
  return v4;
}

- (CertificateDetailsViewController)initWithCertificate:(__SecCertificate *)a3
{
  CertificateDetailsViewController *v4;
  CertUICertificatePropertiesInfo *v5;
  void *v6;
  uint64_t v7;
  NSArray *keyValueSectionTitles;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CertificateDetailsViewController;
  v4 = -[CertificateDetailsViewController initWithStyle:](&v10, sel_initWithStyle_, 1);
  if (v4)
  {
    v5 = -[CertUICertificatePropertiesInfo initWithCertificate:]([CertUICertificatePropertiesInfo alloc], "initWithCertificate:", a3);
    -[CertUICertificatePropertiesInfo sections](v5, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_storeStrong((id *)&v4->_keyValueSections, v6);
      -[CertUICertificatePropertiesInfo sectionTitles](v5, "sectionTitles");
      v7 = objc_claimAutoreleasedReturnValue();
      keyValueSectionTitles = v4->_keyValueSectionTitles;
      v4->_keyValueSectionTitles = (NSArray *)v7;

    }
    -[CertificateDetailsViewController _setup](v4, "_setup");

  }
  return v4;
}

- (CertificateDetailsViewController)initWithCertificateProperties:(id)a3
{
  id v4;
  CertificateDetailsViewController *v5;
  CertUICertificatePropertiesInfo *v6;
  void *v7;
  uint64_t v8;
  NSArray *keyValueSectionTitles;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CertificateDetailsViewController;
  v5 = -[CertificateDetailsViewController initWithStyle:](&v11, sel_initWithStyle_, 1);
  if (v5)
  {
    v6 = -[CertUICertificatePropertiesInfo initWithCertificateProperties:]([CertUICertificatePropertiesInfo alloc], "initWithCertificateProperties:", v4);
    -[CertUICertificatePropertiesInfo sections](v6, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      -[CertUICertificatePropertiesInfo sectionTitles](v6, "sectionTitles");
      v8 = objc_claimAutoreleasedReturnValue();
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;

    }
    -[CertificateDetailsViewController _setup](v5, "_setup");

  }
  return v5;
}

- (CertificateDetailsViewController)initWithTrust:(__SecTrust *)a3
{
  CertificateDetailsViewController *v4;
  CertificateDetailsViewController *v5;
  CertUICertificatePropertiesInfo *v6;
  void *v7;
  uint64_t v8;
  NSArray *keyValueSectionTitles;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CertificateDetailsViewController;
  v4 = -[CertificateDetailsViewController initWithStyle:](&v11, sel_initWithStyle_, 1);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(&v4->_certificateTrust, a3);
    v6 = -[CertUICertificatePropertiesInfo initWithTrust:]([CertUICertificatePropertiesInfo alloc], "initWithTrust:", a3);
    -[CertUICertificatePropertiesInfo sections](v6, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_storeStrong((id *)&v5->_keyValueSections, v7);
      -[CertUICertificatePropertiesInfo sectionTitles](v6, "sectionTitles");
      v8 = objc_claimAutoreleasedReturnValue();
      keyValueSectionTitles = v5->_keyValueSectionTitles;
      v5->_keyValueSectionTitles = (NSArray *)v8;

    }
    -[CertificateDetailsViewController _setup](v5, "_setup");

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CertificateDetailsViewController;
  -[CertificateDetailsViewController dealloc](&v4, sel_dealloc);
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CertificateDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CertificateDetailsKeyDataCell"));

  -[CertificateDetailsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CertificateDetailsKeyValueCell"));

  -[CertificateDetailsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCellLayoutMarginsFollowReadableWidth:", 0);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_24C813780, CFSTR("CertInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertificateDetailsViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_preferredContentSizeChanged_, *MEMORY[0x24BDF7670], 0);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CertificateDetailsViewController;
  -[CertificateDetailsViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CertificateDetailsViewController;
  -[CertificateDetailsViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)setCertificateProperties:(id)a3
{
  CertUICertificatePropertiesInfo *v4;
  void *v5;
  NSArray *v6;
  NSArray *keyValueSectionTitles;
  void *v8;
  id v9;

  objc_msgSend(a3, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CertUICertificatePropertiesInfo initWithSendableCertificateProperties:]([CertUICertificatePropertiesInfo alloc], "initWithSendableCertificateProperties:", v9);
  -[CertUICertificatePropertiesInfo sections](v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_storeStrong((id *)&self->_keyValueSections, v5);
    -[CertUICertificatePropertiesInfo sectionTitles](v4, "sectionTitles");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    keyValueSectionTitles = self->_keyValueSectionTitles;
    self->_keyValueSectionTitles = v6;

  }
  -[CertificateDetailsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CertificateDetailsViewController keyValueSections](self, "keyValueSections", a3);
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

  -[CertificateDetailsViewController keyValueSections](self, "keyValueSections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
    return 0;
  -[CertificateDetailsViewController keyValueSections](self, "keyValueSections");
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

  -[CertificateDetailsViewController keyValueSectionTitles](self, "keyValueSectionTitles", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v9 = 0;
  }
  else
  {
    -[CertificateDetailsViewController keyValueSectionTitles](self, "keyValueSectionTitles");
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
  const __CFString *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[CertificateDetailsViewController keyValueSections](self, "keyValueSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndex:", 2 * objc_msgSend(v7, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", (2 * objc_msgSend(v7, "row")) | 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = CFSTR("CertificateDetailsKeyDataCell");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v12 = CFSTR("CertificateDetailsKeyValueCell");
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v11, v10);

  return v13;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id v3;

  -[CertificateDetailsViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

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
