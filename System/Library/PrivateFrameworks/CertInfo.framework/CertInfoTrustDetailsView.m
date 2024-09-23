@implementation CertInfoTrustDetailsView

- (void)_appendRemainingCertificates
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  CertInfoCertificateDetailsView *currentCertView;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_certificateViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        currentCertView = self->_currentCertView;
        if (*(CertInfoCertificateDetailsView **)(*((_QWORD *)&v9 + 1) + 8 * i) != currentCertView)
          -[CertInfoCertificateDetailsView appendInfoFromCertView:](currentCertView, "appendInfoFromCertView:", (_QWORD)v9);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (CertInfoTrustDetailsView)initWithFrame:(CGRect)a3 trustProperties:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CertInfoTrustDetailsView *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CertInfoCertificateDetailsView *v18;
  CertInfoCertificateDetailsView *v19;
  uint64_t v20;
  CertInfoCertificateDetailsView *currentCertView;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CertInfoTrustDetailsView;
  v10 = -[CertInfoTrustDetailsView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
          v18 = [CertInfoCertificateDetailsView alloc];
          v19 = -[CertInfoCertificateDetailsView initWithFrame:certificateProperties:](v18, "initWithFrame:certificateProperties:", v17, x, y, width, height, (_QWORD)v24);
          objc_msgSend(v11, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
      objc_storeStrong((id *)&v10->_certificateViews, v11);
    -[NSArray objectAtIndex:](v10->_certificateViews, "objectAtIndex:", 0, (_QWORD)v24);
    v20 = objc_claimAutoreleasedReturnValue();
    currentCertView = v10->_currentCertView;
    v10->_currentCertView = (CertInfoCertificateDetailsView *)v20;

    -[CertInfoTrustDetailsView addSubview:](v10, "addSubview:", v10->_currentCertView);
    -[CertInfoTrustDetailsView _appendRemainingCertificates](v10, "_appendRemainingCertificates");
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertInfoTrustDetailsView setBackgroundColor:](v10, "setBackgroundColor:", v22);

  }
  return v10;
}

- (void)layoutSubviews
{
  -[CertInfoTrustDetailsView bounds](self, "bounds");
  -[CertInfoCertificateDetailsView setFrame:](self->_currentCertView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCertView, 0);
  objc_storeStrong((id *)&self->_certificateViews, 0);
}

@end
