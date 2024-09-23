@implementation CertificateDetailsSummaryCell

- (CertificateDetailsSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CertificateDetailsSummaryCell *v4;
  CertificateDetailsSummaryCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CertificateDetailsSummaryCell;
  v4 = -[CertUIItemDetailsSummaryCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CertificateDetailsSummaryCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
  return v5;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertificateDetailsSummaryCell;
  -[CertUIItemDetailsSummaryCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (void)setDetails:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_details != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_details, a3);
    -[CertUIItemDetailsSummaryCell createViewWithItemDetailArray:](self, "createViewWithItemDetailArray:", self->_details);
    -[CertificateDetailsSummaryCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setDetailsWithCertificateTrust:(__SecTrust *)a3 certificateExpiration:(id)a4 certificateIsTrusted:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  CFIndex CertificateCount;
  CFIndex v18;
  CFIndex v19;
  int v20;
  double v21;
  double v22;
  int v23;
  CFDateRef v24;
  id v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  CertificateDetailsSummaryCell *v36;
  id v37;

  v5 = a5;
  v37 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
    v11 = CFSTR("TRUSTED");
  else
    v11 = CFSTR("NOT_TRUSTED");
  v12 = &stru_24C813780;
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24C813780, CFSTR("CertInfo"));
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = (__CFString *)v13;
  else
    v14 = &stru_24C813780;
  if (v5)
    objc_msgSend(MEMORY[0x24BDF6950], "CertUIVerifiedColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = v5;
  +[CertUIItemDetail itemDetailWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:](CertUIItemDetail, "itemDetailWithDetailTitle:detail:detailHighlightColor:showCheckmarkView:checkmarkText:checkmarkHighlightColor:showCheckmark:", 0, 0, 0, 1, v14, v15, v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v16);
  v36 = self;
  if (a3)
  {
    CertificateCount = SecTrustGetCertificateCount(a3);
    if (CertificateCount < 1)
    {
      v24 = 0;
    }
    else
    {
      v18 = CertificateCount;
      v19 = 0;
      v20 = 0;
      v21 = *MEMORY[0x24BDBD230];
      do
      {
        if (SecTrustGetCertificateAtIndex(a3, v19))
        {
          SecCertificateNotValidAfter();
          v23 = v20 ^ 1 | (v22 < v21);
          v20 |= v23;
          if ((v23 & 1) != 0)
            v21 = v22;
        }
        ++v19;
      }
      while (v18 != v19);
      if ((v20 & 1) != 0)
        v24 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v21);
      else
        v24 = 0;
    }
  }
  else
  {
    v24 = (CFDateRef)v37;
  }
  v25 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v25, "setDateStyle:", 1);
  objc_msgSend(v25, "setTimeStyle:", 2);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLocale:", v26);

  objc_msgSend(v25, "stringFromDate:", v24);
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
    v12 = (__CFString *)v27;
  -[__CFDate timeIntervalSinceNow](v24, "timeIntervalSinceNow");
  v29 = v28;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29 >= 0.0)
  {
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("EXPIRES"), &stru_24C813780, CFSTR("CertInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[CertUIItemDetail itemDetailWithDetailTitle:detail:detailHighlightColor:](CertUIItemDetail, "itemDetailWithDetailTitle:detail:detailHighlightColor:", v32, v12, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("EXPIRED"), &stru_24C813780, CFSTR("CertInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[CertUIItemDetail itemDetailWithDetailTitle:detail:detailHighlightColor:](CertUIItemDetail, "itemDetailWithDetailTitle:detail:detailHighlightColor:", v32, v12, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "addObject:", v34);
  -[CertificateDetailsSummaryCell setDetails:](v36, "setDetails:", v8);
  -[CertificateDetailsSummaryCell setNeedsLayout](v36, "setNeedsLayout");

}

- (NSArray)details
{
  return self->_details;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
}

@end
