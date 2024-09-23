@implementation CertInfoTrustSummaryController

- (CertInfoTrustSummaryController)initWithTrustDescription:(id)a3
{
  id v6;
  CertInfoTrustSummaryController *v7;
  CertInfoTrustSummaryController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CertInfoTrustSummaryController.m"), 108, CFSTR("trust must be non-NULL"));

  }
  v14.receiver = self;
  v14.super_class = (Class)CertInfoTrustSummaryController;
  v7 = -[CertInfoTrustSummaryController initWithStyle:](&v14, sel_initWithStyle_, 1);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_description, a3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CERTIFICATE"), &stru_24C813780, CFSTR("CertInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoTrustSummaryController navigationItem](v8, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v10);

  }
  return v8;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  int v4;
  void *v5;
  UIBarButtonItem *v6;
  _BOOL4 v7;
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  void *v11;
  UIBarButtonItem *v12;
  id v13;

  v4 = *((_BYTE *)self + 1056) & 0xFE | a3;
  *((_BYTE *)self + 1056) = *((_BYTE *)self + 1056) & 0xFE | a3;
  if (self->_doneButton)
  {
    -[CertInfoTrustSummaryController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v6 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != self->_doneButton;

    v4 = *((unsigned __int8 *)self + 1056);
    if ((v4 & 1) == 0)
      goto LABEL_9;
  }
  else
  {
    v7 = 1;
    if ((v4 & 1) == 0)
      goto LABEL_9;
  }
  if (v7)
  {
    doneButton = self->_doneButton;
    if (!doneButton)
    {
      v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonPressed_);
      v10 = self->_doneButton;
      self->_doneButton = v9;

      doneButton = self->_doneButton;
    }
    -[CertInfoTrustSummaryController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v12 = doneButton;
    goto LABEL_11;
  }
LABEL_9:
  if (((v4 | v7) & 1) != 0)
    return;
  -[CertInfoTrustSummaryController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v12 = 0;
LABEL_11:
  objc_msgSend(v11, "setRightBarButtonItem:", v12);

}

- (BOOL)showsDoneButton
{
  return *((_BYTE *)self + 1056) & 1;
}

- (void)setActionButtonTitle:(id)a3 destructive:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[CertInfoTrustSummaryController _cellForReuseIdentifier:](self, "_cellForReuseIdentifier:", CFSTR("kCertInfoTrustSummaryHeaderIdentifier"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActionButtonTitle:destructive:animated:", v8, v6, v5);

}

- (void)_doneButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CertInfoTrustSummaryController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CertInfoTrustSummaryController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trustSummaryControllerDidFinish:", self);

  }
}

- (void)_actionButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CertInfoTrustSummaryController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CertInfoTrustSummaryController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trustSummaryControllerPerformAction:", self);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CertInfoTrustSummaryController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CertInfoTrustSummaryController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 1);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "row") > 2)
    v8 = 0;
  else
    v8 = *sOrderedCellIdentifiers_0[objc_msgSend(v7, "row")];
  v9 = v8;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[CertInfoTrustSummaryController _cellForReuseIdentifier:](self, "_cellForReuseIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  unint64_t v7;
  CertInfoCertificateListController *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if ((unint64_t)objc_msgSend(v11, "row") > 2)
    v5 = 0;
  else
    v5 = *sOrderedCellIdentifiers_0[objc_msgSend(v11, "row")];
  v6 = v5;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kCertInfoTrustSummaryMoreDetailsIdentifier")))
  {
    v7 = -[CertInfoTrustDescription certificateCount](self->_description, "certificateCount");
    if (v7 >= 2)
    {
      v8 = -[CertInfoCertificateListController initWithTrustDescription:]([CertInfoCertificateListController alloc], "initWithTrustDescription:", self->_description);
      if (!v8)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v7 == 1)
    {
      -[CertInfoTrustDescription certificatePropertiesAtIndex:](self->_description, "certificatePropertiesAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CertInfoCertificateDetailsController initWithCertificateProperties:]([CertInfoCertificateDetailsController alloc], "initWithCertificateProperties:", v9);

      if (v8)
      {
LABEL_10:
        -[CertInfoTrustSummaryController navigationController](self, "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pushViewController:animated:", v8, 1);

      }
    }
  }
LABEL_11:

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;

  v6 = a4;
  objc_msgSend(a3, "rowHeight");
  v8 = v7;
  if ((unint64_t)objc_msgSend(v6, "row") > 2)
    v9 = 0;
  else
    v9 = *sOrderedCellIdentifiers_0[objc_msgSend(v6, "row")];
  v10 = v9;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("kCertInfoTrustSummaryHeaderIdentifier")))
  {
    -[CertInfoTrustSummaryController _headerCell](self, "_headerCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = v11;
    objc_msgSend(v11, "rowHeight");
    v8 = v13;

    goto LABEL_9;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("kCertInfoTrustSummaryDescriptionIdentifier")))
  {
    -[CertInfoTrustSummaryController _descriptionCell](self, "_descriptionCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (id)_cellForReuseIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoTrustSummaryHeaderIdentifier")))
  {
    -[CertInfoTrustSummaryController _headerCell](self, "_headerCell");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoTrustSummaryDescriptionIdentifier")))
  {
    -[CertInfoTrustSummaryController _descriptionCell](self, "_descriptionCell");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoTrustSummaryMoreDetailsIdentifier")))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, v4);
    objc_msgSend(v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MORE_DETAILS"), &stru_24C813780, CFSTR("CertInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    objc_msgSend(v6, "setAccessoryType:", 1);
  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

- (id)_headerCell
{
  UITableViewCell *headerCell;
  _CertInfoTrustSummaryHeaderCell *v4;
  void *v5;
  void *v6;
  void *v7;
  UITableViewCell *v8;

  headerCell = self->_headerCell;
  if (!headerCell)
  {
    v4 = -[_CertInfoTrustSummaryHeaderCell initWithStyle:reuseIdentifier:]([_CertInfoTrustSummaryHeaderCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kCertInfoTrustSummaryHeaderIdentifier"));
    -[CertInfoTrustDescription summaryTitle](self->_description, "summaryTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CertInfoTrustSummaryHeaderCell setTrustTitle:](v4, "setTrustTitle:", v5);

    -[CertInfoTrustDescription summarySubtitle](self->_description, "summarySubtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CertInfoTrustSummaryHeaderCell setTrustSubtitle:](v4, "setTrustSubtitle:", v6);

    -[_CertInfoTrustSummaryHeaderCell setTrusted:](v4, "setTrusted:", -[CertInfoTrustDescription isTrusted](self->_description, "isTrusted"));
    -[_CertInfoTrustSummaryHeaderCell setExpired:](v4, "setExpired:", 0);
    -[_CertInfoTrustSummaryHeaderCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[_CertInfoTrustSummaryHeaderCell actionButton](v4, "actionButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__actionButtonPressed_, 64);
    v8 = self->_headerCell;
    self->_headerCell = &v4->super;

    headerCell = self->_headerCell;
  }
  return headerCell;
}

- (id)_descriptionCell
{
  UITableViewCell *descriptionCell;
  CertInfoCertificateSummaryDescriptionCell *v4;
  void *v5;
  UITableViewCell *v6;

  descriptionCell = self->_descriptionCell;
  if (!descriptionCell)
  {
    v4 = -[CertInfoCertificateSummaryDescriptionCell initWithStyle:reuseIdentifier:]([CertInfoCertificateSummaryDescriptionCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kCertInfoTrustSummaryDescriptionIdentifier"));
    -[CertInfoTrustDescription summaryDescriptionItems](self->_description, "summaryDescriptionItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoCertificateSummaryDescriptionCell setLabelsAndValues:](v4, "setLabelsAndValues:", v5);

    -[CertInfoCertificateSummaryDescriptionCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = self->_descriptionCell;
    self->_descriptionCell = &v4->super;

    descriptionCell = self->_descriptionCell;
  }
  return descriptionCell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (CertInfoTrustSummaryControllerDelegate)delegate
{
  return (CertInfoTrustSummaryControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionCell, 0);
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
