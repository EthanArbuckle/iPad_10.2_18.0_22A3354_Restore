@implementation TrustCertificateViewController

- (TrustCertificateViewController)initWithTrustCertificateDelegate:(id)a3
{
  return -[TrustCertificateViewController initWithTrustCertificateDelegate:allowTrust:](self, "initWithTrustCertificateDelegate:allowTrust:", a3, 1);
}

- (TrustCertificateViewController)initWithTrustCertificateDelegate:(id)a3 allowTrust:(BOOL)a4
{
  id v6;
  CertificateViewController *v7;
  TrustCertificateViewController *v8;
  TrustCertificateViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = -[CertificateViewController initWithStyle:]([CertificateViewController alloc], "initWithStyle:", 1);
  v11.receiver = self;
  v11.super_class = (Class)TrustCertificateViewController;
  v8 = -[TrustCertificateViewController initWithRootViewController:](&v11, sel_initWithRootViewController_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_allowCertificateTrust = a4;
    objc_storeWeak((id *)&v8->_trustCertificateDelegate, v6);
    objc_storeStrong((id *)&v9->_certificateViewController, v7);
    -[TrustCertificateViewController _setupNavItem](v9, "_setupNavItem");
  }

  return v9;
}

- (TrustCertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4 delegate:(id)a5
{
  return -[TrustCertificateViewController initWithTrust:action:delegate:allowTrust:](self, "initWithTrust:action:delegate:allowTrust:", a3, *(_QWORD *)&a4, a5, 1);
}

- (TrustCertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4 delegate:(id)a5 allowTrust:(BOOL)a6
{
  uint64_t v7;
  id v10;
  CertificateViewController *v11;
  TrustCertificateViewController *v12;
  TrustCertificateViewController *v13;
  objc_super v15;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = -[CertificateViewController initWithTrust:action:]([CertificateViewController alloc], "initWithTrust:action:", a3, v7);
  v15.receiver = self;
  v15.super_class = (Class)TrustCertificateViewController;
  v12 = -[TrustCertificateViewController initWithRootViewController:](&v15, sel_initWithRootViewController_, v11);
  v13 = v12;
  if (v12)
  {
    v12->_allowCertificateTrust = a6;
    objc_storeWeak((id *)&v12->_trustCertificateDelegate, v10);
    objc_storeStrong((id *)&v13->_certificateViewController, v11);
    -[TrustCertificateViewController _setupNavItem](v13, "_setupNavItem");
  }

  return v13;
}

- (void)_setupNavItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[TrustCertificateViewController certificateViewController](self, "certificateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CERTIFICATE"), &stru_24C813780, CFSTR("CertInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel);
  objc_msgSend(v11, "setLeftBarButtonItem:", v6);
  if (self->_allowCertificateTrust)
  {
    v7 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TRUST"), &stru_24C813780, CFSTR("CertInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 2, self, sel__accept);

    objc_msgSend(v11, "setRightBarButtonItem:", v10);
  }

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TrustCertificateViewController;
  -[TrustCertificateViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)_dismissWithResult:(int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_trustCertificateDelegate);
  objc_msgSend(WeakRetained, "trustCertificateViewController:finishedWithReturnCode:", self, v3);

}

- (void)_cancel
{
  -[TrustCertificateViewController _dismissWithResult:](self, "_dismissWithResult:", 0);
}

- (void)_accept
{
  -[TrustCertificateViewController _dismissWithResult:](self, "_dismissWithResult:", 1);
}

- (void)setCertificateInfo:(id)a3 issuer:(id)a4 purpose:(id)a5 expiration:(id)a6 isRoot:(BOOL)a7 properties:(id)a8 action:(int)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v9 = a7;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[TrustCertificateViewController certificateViewController](self, "certificateViewController");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = a9;
  objc_msgSend(v21, "setCertificateTitle:issuer:purpose:expiration:properties:isRoot:action:", v19, v18, v17, v16, v15, v9, v20);

}

- (void)setShowCertificateButton:(BOOL)a3 localizedTitle:(id)a4 localizedDescription:(id)a5 destructive:(BOOL)a6 handler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v10 = a3;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  -[TrustCertificateViewController certificateViewController](self, "certificateViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShowCertificateButton:localizedTitle:localizedDescription:destructive:handler:", v10, v14, v13, v7, v12);

}

- (TrustCertificateViewControllerDelegate)trustCertificateDelegate
{
  return (TrustCertificateViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_trustCertificateDelegate);
}

- (void)setTrustCertificateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_trustCertificateDelegate, a3);
}

- (BOOL)allowCertificateTrust
{
  return self->_allowCertificateTrust;
}

- (void)setAllowCertificateTrust:(BOOL)a3
{
  self->_allowCertificateTrust = a3;
}

- (CertificateViewController)certificateViewController
{
  return self->_certificateViewController;
}

- (void)setCertificateViewController:(id)a3
{
  objc_storeStrong((id *)&self->_certificateViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateViewController, 0);
  objc_destroyWeak((id *)&self->_trustCertificateDelegate);
}

@end
