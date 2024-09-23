@implementation CertInfoCertificateListController

- (CertInfoCertificateListController)initWithTrustDescription:(id)a3
{
  id v5;
  CertInfoCertificateListController *v6;
  CertInfoCertificateListController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CertInfoCertificateListController;
  v6 = -[CertInfoCertificateListController initWithStyle:](&v11, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_description, a3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CERTIFICATES"), &stru_24C813780, CFSTR("CertInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoCertificateListController setTitle:](v7, "setTitle:", v9);

  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[CertInfoTrustDescription certificateCount](self->_description, "certificateCount", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 69.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  CertInfoCertificateListTableViewCell *v7;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("CertInfoCertificateListControllerTableCell"));
  v7 = (CertInfoCertificateListTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[CertInfoCertificateListTableViewCell initWithStyle:reuseIdentifier:]([CertInfoCertificateListTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("CertInfoCertificateListControllerTableCell"));
    -[CertInfoCertificateListTableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
  }
  -[CertInfoCertificateListTableViewCell updateWithTrustDescription:certificateIndex:](v7, "updateWithTrustDescription:certificateIndex:", self->_description, objc_msgSend(v6, "section"));

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  CertInfoCertificateDetailsController *v5;
  void *v6;
  id v7;

  -[CertInfoTrustDescription certificatePropertiesAtIndex:](self->_description, "certificatePropertiesAtIndex:", objc_msgSend(a4, "section", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CertInfoCertificateDetailsController initWithCertificateProperties:]([CertInfoCertificateDetailsController alloc], "initWithCertificateProperties:", v7);
  -[CertInfoCertificateListController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

@end
