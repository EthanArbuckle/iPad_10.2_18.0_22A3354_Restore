@implementation CertInfoCertificateSummaryView

- (CertInfoCertificateSummaryView)initWithFrame:(CGRect)a3
{
  CertInfoCertificateSummaryView *v3;
  CertInfoCertificateSummaryView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UITableView *tableView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CertInfoCertificateSummaryView;
  v3 = -[CertInfoCertificateSummaryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CertInfoCertificateSummaryView bounds](v3, "bounds");
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6E58]), "initWithFrame:style:", 1, v5, v6, v7, v8);
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v9;

    -[UITableView setAutoresizingMask:](v4->_tableView, "setAutoresizingMask:", 18);
    -[UITableView setDelegate:](v4->_tableView, "setDelegate:", v4);
    -[UITableView setDataSource:](v4->_tableView, "setDataSource:", v4);
    -[UITableView setSeparatorInset:](v4->_tableView, "setSeparatorInset:", 0.0, 15.0, 0.0, 0.0);
    -[CertInfoCertificateSummaryView addSubview:](v4, "addSubview:", v4->_tableView);
  }
  return v4;
}

- (void)setMoreDetailsSelectedBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id moreDetailsSelectedBlock;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
    v5 = (void *)objc_msgSend(v4, "copy");
  else
    v5 = 0;
  v6 = (void *)MEMORY[0x212BAF074](v5);
  moreDetailsSelectedBlock = self->_moreDetailsSelectedBlock;
  self->_moreDetailsSelectedBlock = v6;

  v8 = v9;
  if (v9)
  {

    v8 = v9;
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return 3;
}

- (id)_cellForReuseIdentifier:(id)a3
{
  id v4;
  void *headerCell;
  CertInfoCertificateHeaderCell *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryHeaderIdentifier")))
  {
    headerCell = self->_headerCell;
    if (!headerCell)
    {
      v6 = -[CertInfoCertificateHeaderCell initWithStyle:reuseIdentifier:]([CertInfoCertificateHeaderCell alloc], "initWithStyle:reuseIdentifier:", 0, v4);
      -[CertInfoCertificateHeaderCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
      -[CertInfoCertificateSummaryView setHeaderCell:](self, "setHeaderCell:", v6);
      goto LABEL_11;
    }
LABEL_6:
    v6 = headerCell;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryDescriptionIdentifier")))
  {
    headerCell = self->_descriptionCell;
    if (!headerCell)
    {
      v6 = -[CertInfoCertificateSummaryDescriptionCell initWithStyle:reuseIdentifier:]([CertInfoCertificateSummaryDescriptionCell alloc], "initWithStyle:reuseIdentifier:", 0, v4);
      -[CertInfoCertificateHeaderCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
      -[CertInfoCertificateSummaryView setDescriptionCell:](self, "setDescriptionCell:", v6);
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryMoreDetailsIdentifier")))
  {
    v6 = (CertInfoCertificateHeaderCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, v4);
    -[CertInfoCertificateHeaderCell textLabel](v6, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MORE_DETAILS"), &stru_24C813780, CFSTR("CertInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    -[CertInfoCertificateHeaderCell setAccessoryType:](v6, "setAccessoryType:", 1);
  }
  else
  {
    v6 = 0;
  }
LABEL_11:

  return v6;
}

- (void)_configureCell:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryHeaderIdentifier")))
  {
    v5 = v17;
    -[CertInfoCertificateSummaryView trustTitle](self, "trustTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTrustTitle:", v6);

    -[CertInfoCertificateSummaryView trustSubtitle](self, "trustSubtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTrustSubtitle:", v7);

    -[CertInfoCertificateSummaryView expirationDate](self, "expirationDate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceNow");
    objc_msgSend(v5, "setExpired:", v9 < 0.0);
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryDescriptionIdentifier")))
  {
    v8 = v17;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CertInfoCertificateSummaryView purpose](self, "purpose");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DESCRIPTION"), &stru_24C813780, CFSTR("CertInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      objc_msgSend(v5, "addObject:", v10);
    }
    -[CertInfoCertificateSummaryView expirationDate](self, "expirationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v13, 2, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EXPIRES"), &stru_24C813780, CFSTR("CertInfo"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v16);

        objc_msgSend(v5, "addObject:", v14);
      }

    }
    objc_msgSend(v8, "setLabelsAndValues:", v5);

    goto LABEL_11;
  }
LABEL_12:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v8 = 0;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v7, "row") > 2)
      v9 = 0;
    else
      v9 = *sOrderedCellIdentifiers[objc_msgSend(v7, "row")];
    v10 = v9;
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CertInfoCertificateSummaryView _cellForReuseIdentifier:](self, "_cellForReuseIdentifier:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CertInfoCertificateSummaryView _configureCell:](self, "_configureCell:", v8);

  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  void (**moreDetailsSelectedBlock)(void);
  id v8;

  v8 = a4;
  if ((unint64_t)objc_msgSend(v8, "row") > 2)
    v5 = 0;
  else
    v5 = *sOrderedCellIdentifiers[objc_msgSend(v8, "row")];
  v6 = v5;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryMoreDetailsIdentifier")))
  {
    moreDetailsSelectedBlock = (void (**)(void))self->_moreDetailsSelectedBlock;
    if (moreDetailsSelectedBlock)
      moreDetailsSelectedBlock[2]();
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  void **v12;
  void *v13;
  void *v14;
  double v15;

  v6 = a4;
  objc_msgSend(a3, "rowHeight");
  v8 = v7;
  if ((unint64_t)objc_msgSend(v6, "row") > 2)
    v9 = 0;
  else
    v9 = *sOrderedCellIdentifiers[objc_msgSend(v6, "row")];
  v10 = v9;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryHeaderIdentifier")))
  {
    v11 = 464;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("kCertInfoCertificateSummaryDescriptionIdentifier")))
      goto LABEL_11;
    v11 = 472;
  }
  v12 = (void **)((char *)&self->super.super.super.isa + v11);
  v13 = *(Class *)((char *)&self->super.super.super.isa + v11);
  if (!v13)
  {
    -[CertInfoCertificateSummaryView _cellForReuseIdentifier:](self, "_cellForReuseIdentifier:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoCertificateSummaryView _configureCell:](self, "_configureCell:", v14);

    v13 = *v12;
  }
  objc_msgSend(v13, "rowHeight");
  v8 = v15;
LABEL_11:

  return v8;
}

- (UITableView)tableView
{
  return self->_tableView;
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

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
  objc_storeStrong((id *)&self->_purpose, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (CertInfoCertificateHeaderCell)headerCell
{
  return self->_headerCell;
}

- (void)setHeaderCell:(id)a3
{
  objc_storeStrong((id *)&self->_headerCell, a3);
}

- (CertInfoCertificateSummaryDescriptionCell)descriptionCell
{
  return self->_descriptionCell;
}

- (void)setDescriptionCell:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionCell, 0);
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong(&self->_moreDetailsSelectedBlock, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_trustSubtitle, 0);
  objc_storeStrong((id *)&self->_trustTitle, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
