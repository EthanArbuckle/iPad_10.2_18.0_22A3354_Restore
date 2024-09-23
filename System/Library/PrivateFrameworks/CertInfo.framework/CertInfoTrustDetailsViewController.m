@implementation CertInfoTrustDetailsViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)loadView
{
  CertInfoTrustDetailsView *v3;
  void *v4;
  CertInfoTrustDetailsView *v5;

  v3 = [CertInfoTrustDetailsView alloc];
  -[CertInfoTrustDetailsViewController trustProperties](self, "trustProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CertInfoTrustDetailsView initWithFrame:trustProperties:](v3, "initWithFrame:trustProperties:", v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  -[CertInfoTrustDetailsViewController setView:](self, "setView:", v5);
}

- (void)_setupNavItem
{
  void *v2;
  void *v3;
  id v4;

  -[CertInfoTrustDetailsViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_24C813780, CFSTR("CertInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertInfoTrustDetailsViewController;
  -[CertInfoTrustDetailsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CertInfoTrustDetailsViewController _setupNavItem](self, "_setupNavItem");
}

- (NSArray)trustProperties
{
  return self->_trustProperties;
}

- (void)setTrustProperties:(id)a3
{
  objc_storeStrong((id *)&self->_trustProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustProperties, 0);
}

@end
