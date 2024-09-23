@implementation CertInfoCertificateListTableViewCell

- (CertInfoCertificateListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CertInfoCertificateListTableViewCell *v4;
  CertInfoCertificateListTableViewCell *v5;
  id *v6;
  void *v7;
  CertInfoCertificateListCellContentView *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CertInfoCertificateListTableViewCell;
  v4 = -[CertInfoCertificateListTableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__CertInfoCertificateListTableViewCell_initWithStyle_reuseIdentifier___block_invoke;
    block[3] = &unk_24C8135A8;
    v6 = v4;
    v14 = v6;
    if (initWithStyle_reuseIdentifier__onceToken != -1)
      dispatch_once(&initWithStyle_reuseIdentifier__onceToken, block);
    objc_msgSend(v6, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", initWithStyle_reuseIdentifier__sBlobImage);

    v8 = [CertInfoCertificateListCellContentView alloc];
    v9 = -[CertInfoCertificateListCellContentView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v10 = v6[128];
    v6[128] = (id)v9;

    objc_msgSend(v6[128], "setUserInteractionEnabled:", 0);
    objc_msgSend(v6, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v6[128]);

  }
  return v5;
}

void __70__CertInfoCertificateListTableViewCell_initWithStyle_reuseIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("profiles-list-icon"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithStyle_reuseIdentifier__sBlobImage;
  initWithStyle_reuseIdentifier__sBlobImage = v0;

}

- (void)updateWithTrustDescription:(id)a3 certificateIndex:(unint64_t)a4
{
  CertInfoCertificateListCellContentView *certificateContentView;
  id v7;
  void *v8;
  CertInfoCertificateListCellContentView *v9;
  void *v10;
  CertInfoCertificateListCellContentView *v11;
  id v12;

  certificateContentView = self->_certificateContentView;
  v7 = a3;
  objc_msgSend(v7, "certificateSubjectSummaryAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateListCellContentView setTitle:](certificateContentView, "setTitle:", v8);

  v9 = self->_certificateContentView;
  objc_msgSend(v7, "certificateIssuerSummaryAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateListCellContentView setSubtitle:](v9, "setSubtitle:", v10);

  v11 = self->_certificateContentView;
  objc_msgSend(v7, "certificateExpirationDateAtIndex:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CertInfoCertificateListCellContentView setExpiration:](v11, "setExpiration:", v12);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23.receiver = self;
  v23.super_class = (Class)CertInfoCertificateListTableViewCell;
  -[CertInfoCertificateListTableViewCell layoutSubviews](&v23, sel_layoutSubviews);
  -[CertInfoCertificateListTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CertInfoCertificateListTableViewCell imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  v17 = (v11 - v16) * 0.5;
  v18 = roundf(v17);
  -[CertInfoCertificateListTableViewCell imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 8.0, v18, v14, v16);

  -[CertInfoCertificateListCellContentView frame](self->_certificateContentView, "frame");
  v24.origin.x = 8.0;
  v24.origin.y = v18;
  v24.size.width = v14;
  v24.size.height = v16;
  v20 = CGRectGetMaxX(v24) + 8.0;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v21 = CGRectGetMinY(v25) + 1.0;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v22 = CGRectGetMaxX(v26) - v20 + -9.0;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  -[CertInfoCertificateListCellContentView setFrame:](self->_certificateContentView, "setFrame:", v20, v21, v22, CGRectGetHeight(v27) + -1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateContentView, 0);
}

@end
