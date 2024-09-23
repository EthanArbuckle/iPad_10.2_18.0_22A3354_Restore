@implementation CertInfoSheetViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)_dismissWithResult:(int)a3
{
  uint64_t v3;
  CertInfoSheetViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "sheetViewController:finishedWithReturnCode:", self, v3);

  }
}

- (void)_cancel
{
  -[CertInfoSheetViewController _dismissWithResult:](self, "_dismissWithResult:", 3);
}

- (void)_accept
{
  -[CertInfoSheetViewController _dismissWithResult:](self, "_dismissWithResult:", 1);
}

- (void)_setupNavItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CertInfoSheetViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CertInfoSheetViewController serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel);
  v5 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_24C813780, CFSTR("CertInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 1, self, sel__accept);

  objc_msgSend(v9, "setLeftBarButtonItem:", v4);
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

}

- (void)_pushDetailsView
{
  void *v3;
  void *v4;
  CertInfoTrustDetailsViewController *v5;

  v5 = -[CertInfoTrustDetailsViewController initWithNibName:bundle:]([CertInfoTrustDetailsViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[CertInfoSheetViewController trustProperties](self, "trustProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoTrustDetailsViewController setTrustProperties:](v5, "setTrustProperties:", v3);

  -[CertInfoSheetViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)loadView
{
  CertInfoCertificateSummaryView *v3;
  CertInfoCertificateSummaryView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = [CertInfoCertificateSummaryView alloc];
  v4 = -[CertInfoCertificateSummaryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CertInfoSheetViewController trustTitle](self, "trustTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateSummaryView setTrustTitle:](v4, "setTrustTitle:", v5);

  -[CertInfoSheetViewController trustSubtitle](self, "trustSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateSummaryView setTrustSubtitle:](v4, "setTrustSubtitle:", v6);

  -[CertInfoSheetViewController trustPurpose](self, "trustPurpose");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateSummaryView setPurpose:](v4, "setPurpose:", v7);

  -[CertInfoSheetViewController trustExpiration](self, "trustExpiration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateSummaryView setExpirationDate:](v4, "setExpirationDate:", v8);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__CertInfoSheetViewController_loadView__block_invoke;
  v9[3] = &unk_24C8135A8;
  v9[4] = self;
  -[CertInfoCertificateSummaryView setMoreDetailsSelectedBlock:](v4, "setMoreDetailsSelectedBlock:", v9);
  -[CertInfoSheetViewController setView:](self, "setView:", v4);

}

uint64_t __39__CertInfoSheetViewController_loadView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushDetailsView");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CertInfoSheetViewController;
  -[CertInfoSheetViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[CertInfoSheetViewController _setupNavItem](self, "_setupNavItem");
  -[CertInfoSheetViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertInfoSheetViewController;
  -[CertInfoSheetViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("kCertInfoSheetViewControllerDismissedNotification"), 0);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)trustTitle
{
  return self->_trustTitle;
}

- (void)setTrustTitle:(id)a3
{
  objc_storeStrong((id *)&self->_trustTitle, a3);
}

- (NSString)trustSubtitle
{
  return self->_trustSubtitle;
}

- (void)setTrustSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_trustSubtitle, a3);
}

- (NSString)trustPurpose
{
  return self->_trustPurpose;
}

- (void)setTrustPurpose:(id)a3
{
  objc_storeStrong((id *)&self->_trustPurpose, a3);
}

- (NSDate)trustExpiration
{
  return self->_trustExpiration;
}

- (void)setTrustExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_trustExpiration, a3);
}

- (NSArray)trustProperties
{
  return self->_trustProperties;
}

- (void)setTrustProperties:(id)a3
{
  objc_storeStrong((id *)&self->_trustProperties, a3);
}

- (CertInfoSheetViewControllerDelegate)delegate
{
  return (CertInfoSheetViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trustProperties, 0);
  objc_storeStrong((id *)&self->_trustExpiration, 0);
  objc_storeStrong((id *)&self->_trustPurpose, 0);
  objc_storeStrong((id *)&self->_trustSubtitle, 0);
  objc_storeStrong((id *)&self->_trustTitle, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
