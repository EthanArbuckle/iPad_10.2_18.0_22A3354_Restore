@implementation CertInfoCertificateSummaryDescriptionCell

- (CertInfoCertificateSummaryDescriptionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CertInfoCertificateSummaryDescriptionCell *v4;
  CertInfoCertificateSummaryDescriptionCell *v5;
  void *v6;
  CertInfoDescriptionCellContentView *v7;
  uint64_t v8;
  CertInfoDescriptionCellContentView *customContentView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CertInfoCertificateSummaryDescriptionCell;
  v4 = -[CertInfoCertificateSummaryDescriptionCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CertInfoCertificateSummaryDescriptionCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [CertInfoDescriptionCellContentView alloc];
    objc_msgSend(v6, "bounds");
    v8 = -[CertInfoDescriptionCellContentView initWithFrame:](v7, "initWithFrame:");
    customContentView = v5->_customContentView;
    v5->_customContentView = (CertInfoDescriptionCellContentView *)v8;

    -[CertInfoDescriptionCellContentView setOpaque:](v5->_customContentView, "setOpaque:", 0);
    -[CertInfoDescriptionCellContentView setAutoresizingMask:](v5->_customContentView, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", v5->_customContentView);

  }
  return v5;
}

- (void)setLabelsAndValues:(id)a3
{
  -[CertInfoDescriptionCellContentView setLabelsAndValues:](self->_customContentView, "setLabelsAndValues:", a3);
}

- (double)rowHeight
{
  double result;

  -[CertInfoDescriptionCellContentView rowHeight](self->_customContentView, "rowHeight");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContentView, 0);
}

@end
