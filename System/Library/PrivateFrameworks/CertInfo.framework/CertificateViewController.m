@implementation CertificateViewController

- (CertificateViewController)init
{
  CertificateViewController *v2;
  CertificateViewController *v3;
  id certificateTrust;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CertificateViewController;
  v2 = -[CertificateViewController initWithStyle:](&v7, sel_initWithStyle_, 1);
  v3 = v2;
  if (v2)
  {
    certificateTrust = v2->_certificateTrust;
    v2->_certificateTrust = 0;

    v3->_certUIAction = 2;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_preferredContentSizeChanged_, *MEMORY[0x24BDF7670], 0);

  }
  return v3;
}

- (CertificateViewController)initWithTrust:(__SecTrust *)a3 action:(int)a4
{
  CertificateViewController *v6;
  CertificateViewController *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CertificateViewController;
  v6 = -[CertificateViewController initWithStyle:](&v10, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_certificateTrust, a3);
    v7->_certUIAction = a4;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_preferredContentSizeChanged_, *MEMORY[0x24BDF7670], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CertificateViewController;
  -[CertificateViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CertificateViewController;
  -[CertificateViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CertificateViewController;
  -[CertificateViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CertificateViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertificateViewController;
  -[CertificateViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("kCertInfoSheetViewControllerDismissedNotification"), 0);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CertificateViewController;
  -[CertificateViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)setCertificateTitle:(id)a3 issuer:(id)a4 purpose:(id)a5 expiration:(id)a6 properties:(id)a7 isRoot:(BOOL)a8 action:(int)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  -[CertificateViewController setCertificateTitle:](self, "setCertificateTitle:", a3);
  -[CertificateViewController setCertificateIssuer:](self, "setCertificateIssuer:", v18);

  -[CertificateViewController setCertificatePurpose:](self, "setCertificatePurpose:", v17);
  -[CertificateViewController setCertificateExpiration:](self, "setCertificateExpiration:", v16);

  -[CertificateViewController setCertificateProperties:](self, "setCertificateProperties:", v15);
  -[CertificateViewController setCertificateIsRoot:](self, "setCertificateIsRoot:", v9);
  -[CertificateViewController setCertUIAction:](self, "setCertUIAction:", a9);
  -[CertificateViewController tableView](self, "tableView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reloadData");

}

- (void)setShowCertificateButton:(BOOL)a3 localizedTitle:(id)a4 localizedDescription:(id)a5 destructive:(BOOL)a6 handler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;

  v8 = a6;
  v10 = a3;
  v15 = a4;
  v12 = a5;
  v13 = a7;
  -[CertificateViewController setShowCertificateButton:](self, "setShowCertificateButton:", v10);
  if (v10)
  {
    -[CertificateViewController setCertificateButtonTitle:](self, "setCertificateButtonTitle:", v15);
    -[CertificateViewController setCertificateButtonDescription:](self, "setCertificateButtonDescription:", v12);
    -[CertificateViewController setCertificateButtonActionHandler:](self, "setCertificateButtonActionHandler:", v13);
    -[CertificateViewController setCertificateButtonIsDestructiveAction:](self, "setCertificateButtonIsDestructiveAction:", v8);
  }
  else
  {
    -[CertificateViewController setCertificateButtonTitle:](self, "setCertificateButtonTitle:", 0);
    -[CertificateViewController setCertificateButtonDescription:](self, "setCertificateButtonDescription:", 0);
    -[CertificateViewController setCertificateButtonActionHandler:](self, "setCertificateButtonActionHandler:", 0);
  }
  -[CertificateViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[CertificateViewController showCertificateButton](self, "showCertificateButton", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return a4 == 1;
  else
    return 3;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  _BOOL4 v6;
  void *v7;

  v6 = -[CertificateViewController showCertificateButton](self, "showCertificateButton", a3);
  v7 = 0;
  if (!a4 && v6)
  {
    -[CertificateViewController certificateButtonDescription](self, "certificateButtonDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  CertificateDetailsSummaryCell *v8;
  CertificateSummaryTableViewCell *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CertificateSummaryTableViewCell *v16;
  id certificateTrust;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "section") && !objc_msgSend(v7, "row"))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CertificateTableCell"));
    v16 = (CertificateSummaryTableViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      v16 = -[CertUIItemSummaryCell initWithStyle:reuseIdentifier:]([CertificateSummaryTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("CertificateTableCell"));
    certificateTrust = self->_certificateTrust;
    v9 = v16;
    if (certificateTrust)
    {
      -[CertificateViewController certificateTrust](self, "certificateTrust");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CertificateSummaryTableViewCell updateWithCertificateTrust:](v9, "updateWithCertificateTrust:", v18);
      v19 = v9;
    }
    else
    {
      -[CertificateViewController certificateTitle](self, "certificateTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CertificateViewController certificateIssuer](self, "certificateIssuer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CertificateSummaryTableViewCell setCertificateName:issuer:isRoot:](v9, "setCertificateName:issuer:isRoot:", v18, v19, -[CertificateViewController certificateIsRoot](self, "certificateIsRoot"));

    }
    goto LABEL_27;
  }
  if (!objc_msgSend(v7, "section") && objc_msgSend(v7, "row") == 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CertificateDetailsTableCell"));
    v8 = (CertificateDetailsSummaryCell *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = -[CertificateDetailsSummaryCell initWithStyle:reuseIdentifier:]([CertificateDetailsSummaryCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("CertificateDetailsTableCell"));
    v9 = v8;
    v10 = -[CertificateViewController certUIAction](self, "certUIAction") == 1;
    -[CertificateViewController certificateTrust](self, "certificateTrust");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CertificateViewController certificateExpiration](self, "certificateExpiration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertificateSummaryTableViewCell setCertificateTrust:certificateExpiration:certificateIsTrusted:](v9, "setCertificateTrust:certificateExpiration:certificateIsTrusted:", v11, v12, v10);

    goto LABEL_28;
  }
  if (objc_msgSend(v7, "section") || objc_msgSend(v7, "row") != 2)
  {
    if (objc_msgSend(v7, "section") != 1 || objc_msgSend(v7, "row"))
    {
      v9 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CertificateInstallTableCell"));
    v9 = (CertificateSummaryTableViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      v9 = (CertificateSummaryTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("CertificateInstallTableCell"));
    -[CertificateViewController certificateButtonTitle](self, "certificateButtonTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertificateSummaryTableViewCell textLabel](v9, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    -[CertificateSummaryTableViewCell textLabel](v9, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextAlignment:", 1);

    if (-[CertificateViewController certificateButtonIsDestructiveAction](self, "certificateButtonIsDestructiveAction"))
      objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertificateSummaryTableViewCell textLabel](v9, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", v18);
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("CertificateMoreDetailsTableCell"));
  v9 = (CertificateSummaryTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (CertificateSummaryTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("CertificateMoreDetailsTableCell"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MORE_DETAILS"), &stru_24C813780, CFSTR("CertInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertificateSummaryTableViewCell textLabel](v9, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[CertificateSummaryTableViewCell setAccessoryType:](v9, "setAccessoryType:", 1);
LABEL_28:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id certificateTrust;
  CertificateDetailsViewController *v8;
  CertificateDetailsViewController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section") && objc_msgSend(v6, "row") == 2)
  {
    certificateTrust = self->_certificateTrust;
    v8 = [CertificateDetailsViewController alloc];
    if (certificateTrust)
    {
      v9 = -[CertificateDetailsViewController initWithTrust:](v8, "initWithTrust:", self->_certificateTrust);
    }
    else
    {
      v9 = -[CertificateDetailsViewController initWithStyle:](v8, "initWithStyle:", 1);
      -[CertificateViewController certificateProperties](self, "certificateProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CertificateDetailsViewController setCertificateProperties:](v9, "setCertificateProperties:", v11);

    }
    -[CertificateViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v9, 1);

LABEL_11:
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "section") == 1 && !objc_msgSend(v6, "row"))
  {
    -[CertificateViewController certificateButtonActionHandler](self, "certificateButtonActionHandler");
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = (CertificateDetailsViewController *)v10;
    if (v10)
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  v5 = !objc_msgSend(v4, "section") && objc_msgSend(v4, "row") == 2
    || objc_msgSend(v4, "section") == 1 && !objc_msgSend(v4, "row");

  return v5;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id v3;

  -[CertificateViewController tableView](self, "tableView", a3);
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

- (int)certUIAction
{
  return self->_certUIAction;
}

- (void)setCertUIAction:(int)a3
{
  self->_certUIAction = a3;
}

- (NSString)certificateTitle
{
  return self->_certificateTitle;
}

- (void)setCertificateTitle:(id)a3
{
  objc_storeStrong((id *)&self->_certificateTitle, a3);
}

- (NSString)certificateIssuer
{
  return self->_certificateIssuer;
}

- (void)setCertificateIssuer:(id)a3
{
  objc_storeStrong((id *)&self->_certificateIssuer, a3);
}

- (NSString)certificatePurpose
{
  return self->_certificatePurpose;
}

- (void)setCertificatePurpose:(id)a3
{
  objc_storeStrong((id *)&self->_certificatePurpose, a3);
}

- (NSDate)certificateExpiration
{
  return self->_certificateExpiration;
}

- (void)setCertificateExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_certificateExpiration, a3);
}

- (NSArray)certificateProperties
{
  return self->_certificateProperties;
}

- (void)setCertificateProperties:(id)a3
{
  objc_storeStrong((id *)&self->_certificateProperties, a3);
}

- (BOOL)certificateIsRoot
{
  return self->_certificateIsRoot;
}

- (void)setCertificateIsRoot:(BOOL)a3
{
  self->_certificateIsRoot = a3;
}

- (BOOL)showCertificateButton
{
  return self->_showCertificateButton;
}

- (void)setShowCertificateButton:(BOOL)a3
{
  self->_showCertificateButton = a3;
}

- (NSString)certificateButtonTitle
{
  return self->_certificateButtonTitle;
}

- (void)setCertificateButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_certificateButtonTitle, a3);
}

- (NSString)certificateButtonDescription
{
  return self->_certificateButtonDescription;
}

- (void)setCertificateButtonDescription:(id)a3
{
  objc_storeStrong((id *)&self->_certificateButtonDescription, a3);
}

- (BOOL)certificateButtonIsDestructiveAction
{
  return self->_certificateButtonIsDestructiveAction;
}

- (void)setCertificateButtonIsDestructiveAction:(BOOL)a3
{
  self->_certificateButtonIsDestructiveAction = a3;
}

- (id)certificateButtonActionHandler
{
  return self->_certificateButtonActionHandler;
}

- (void)setCertificateButtonActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_certificateButtonActionHandler, 0);
  objc_storeStrong((id *)&self->_certificateButtonDescription, 0);
  objc_storeStrong((id *)&self->_certificateButtonTitle, 0);
  objc_storeStrong((id *)&self->_certificateProperties, 0);
  objc_storeStrong((id *)&self->_certificateExpiration, 0);
  objc_storeStrong((id *)&self->_certificatePurpose, 0);
  objc_storeStrong((id *)&self->_certificateIssuer, 0);
  objc_storeStrong((id *)&self->_certificateTitle, 0);
  objc_storeStrong(&self->_certificateTrust, 0);
}

@end
