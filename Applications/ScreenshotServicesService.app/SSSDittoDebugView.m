@implementation SSSDittoDebugView

- (SSSDittoDebugView)initWithFrame:(CGRect)a3
{
  SSSDittoDebugView *v3;
  void *v4;
  uint64_t v5;
  UIButton *addScreenshotsButton;
  UIButton *v7;
  void *v8;
  UIStepper *v9;
  UIStepper *numberOfScreenshotsToAddStepper;
  UIStepper *v11;
  void *v12;
  UISwitch *v13;
  UISwitch *snapshotPDFSwitch;
  UISwitch *v15;
  void *v16;
  UILabel *v17;
  UILabel *snapshotPDFLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UISwitch *v23;
  UISwitch *multipagePDFSwitch;
  UISwitch *v25;
  void *v26;
  UILabel *v27;
  UILabel *multipagePDFLabel;
  UILabel *v29;
  void *v30;
  UILabel *v31;
  void *v32;
  uint64_t v33;
  UIButton *uiCatalogButton;
  void *v35;
  objc_class *v36;
  WKWebView *v37;
  WKWebView *webView;
  WKWebView *v39;
  void *v40;
  void *v41;
  id v42;
  objc_super v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v44.receiver = self;
  v44.super_class = (Class)SSSDittoDebugView;
  v3 = -[SSSDittoDebugView initWithFrame:](&v44, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
  -[SSSDittoDebugView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  v5 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  addScreenshotsButton = v3->_addScreenshotsButton;
  v3->_addScreenshotsButton = (UIButton *)v5;

  -[UIButton addTarget:action:forControlEvents:](v3->_addScreenshotsButton, "addTarget:action:forControlEvents:", v3, "_addScreenshotPushed", 64);
  v7 = v3->_addScreenshotsButton;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  -[UIButton setTintColor:](v7, "setTintColor:", v8);

  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_addScreenshotsButton);
  v9 = (UIStepper *)objc_alloc_init((Class)UIStepper);
  numberOfScreenshotsToAddStepper = v3->_numberOfScreenshotsToAddStepper;
  v3->_numberOfScreenshotsToAddStepper = v9;

  -[UIStepper setMinimumValue:](v3->_numberOfScreenshotsToAddStepper, "setMinimumValue:", 1.0);
  -[UIStepper setMaximumValue:](v3->_numberOfScreenshotsToAddStepper, "setMaximumValue:", 10.0);
  -[UIStepper setValue:](v3->_numberOfScreenshotsToAddStepper, "setValue:", 1.0);
  v11 = v3->_numberOfScreenshotsToAddStepper;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  -[UIStepper setTintColor:](v11, "setTintColor:", v12);

  -[UIStepper addTarget:action:forControlEvents:](v3->_numberOfScreenshotsToAddStepper, "addTarget:action:forControlEvents:", v3, "_updateScreenshotCount", 4096);
  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_numberOfScreenshotsToAddStepper);
  -[SSSDittoDebugView _updateScreenshotCount](v3, "_updateScreenshotCount");
  v13 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  snapshotPDFSwitch = v3->_snapshotPDFSwitch;
  v3->_snapshotPDFSwitch = v13;

  v15 = v3->_snapshotPDFSwitch;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  -[UISwitch setTintColor:](v15, "setTintColor:", v16);

  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_snapshotPDFSwitch);
  v17 = (UILabel *)objc_alloc_init((Class)UILabel);
  snapshotPDFLabel = v3->_snapshotPDFLabel;
  v3->_snapshotPDFLabel = v17;

  -[UILabel setText:](v3->_snapshotPDFLabel, "setText:", CFSTR("Include PDF"));
  v19 = v3->_snapshotPDFLabel;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  -[UILabel setFont:](v19, "setFont:", v20);

  v21 = v3->_snapshotPDFLabel;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  -[UILabel setTextColor:](v21, "setTextColor:", v22);

  -[UILabel sizeToFit](v3->_snapshotPDFLabel, "sizeToFit");
  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_snapshotPDFLabel);
  v23 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  multipagePDFSwitch = v3->_multipagePDFSwitch;
  v3->_multipagePDFSwitch = v23;

  v25 = v3->_multipagePDFSwitch;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  -[UISwitch setTintColor:](v25, "setTintColor:", v26);

  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_multipagePDFSwitch);
  v27 = (UILabel *)objc_alloc_init((Class)UILabel);
  multipagePDFLabel = v3->_multipagePDFLabel;
  v3->_multipagePDFLabel = v27;

  -[UILabel setText:](v3->_multipagePDFLabel, "setText:", CFSTR("Multipage"));
  v29 = v3->_multipagePDFLabel;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  -[UILabel setFont:](v29, "setFont:", v30);

  v31 = v3->_multipagePDFLabel;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
  -[UILabel setTextColor:](v31, "setTextColor:", v32);

  -[UILabel sizeToFit](v3->_multipagePDFLabel, "sizeToFit");
  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_multipagePDFLabel);
  v33 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 3));
  uiCatalogButton = v3->_uiCatalogButton;
  v3->_uiCatalogButton = (UIButton *)v33;

  -[UIButton addTarget:action:forControlEvents:](v3->_uiCatalogButton, "addTarget:action:forControlEvents:", v3, "_uiCatalogButtonPushed", 64);
  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_uiCatalogButton);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v35 = (void *)qword_1000AD730;
  v49 = qword_1000AD730;
  if (!qword_1000AD730)
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100017940;
    v45[3] = &unk_100091848;
    v45[4] = &v46;
    sub_100017940((uint64_t)v45);
    v35 = (void *)v47[3];
  }
  v36 = objc_retainAutorelease(v35);
  _Block_object_dispose(&v46, 8);
  v37 = (WKWebView *)objc_alloc_init(v36);
  webView = v3->_webView;
  v3->_webView = v37;

  v39 = v3->_webView;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://apple.com")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v40));
  v42 = -[WKWebView loadRequest:](v39, "loadRequest:", v41);

  -[SSSDittoDebugView addSubview:](v3, "addSubview:", v3->_webView);
  return v3;
}

- (void)_addScreenshotPushed
{
  void (**v2)(void);
  void (**v3)(void);

  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SSSDittoDebugView blockToRunForAddScreenshotsButton](self, "blockToRunForAddScreenshotsButton"));
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (BOOL)shouldIncludePDF
{
  return -[UISwitch isOn](self->_snapshotPDFSwitch, "isOn");
}

- (id)generatePDF:(CGRect *)a3
{
  void *v5;
  DebugPrintPageRenderer *v6;
  double y;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CGPDFDocument *v13;
  CGPDFPage *Page;
  CGFloat x;
  CGFloat v16;
  CGFloat width;
  double height;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGContext *CurrentContext;
  CGContext *v25;
  CGContext *v26;
  CGContext *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  const __CFURL *v34;
  const __CFURL *v35;
  void *v36;
  CGRect BoxRect;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect PDFContextBounds;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _webViewPrintFormatter](self->_webView, "_webViewPrintFormatter"));
  objc_msgSend(v5, "setSnapshotFirstPage:", 1);
  v6 = objc_alloc_init(DebugPrintPageRenderer);
  y = CGPointZero.y;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView"));
  objc_msgSend(v8, "contentSize");
  -[DebugPrintPageRenderer setPaperRect:](v6, "setPaperRect:", CGPointZero.x, y, v9, v10);

  -[DebugPrintPageRenderer paperRect](v6, "paperRect");
  -[DebugPrintPageRenderer setPrintableRect:](v6, "setPrintableRect:");
  v36 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  -[DebugPrintPageRenderer setPrintFormatters:](v6, "setPrintFormatters:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView _printProvider](self->_webView, "_printProvider"));
  objc_msgSend(v12, "_wk_requestDocumentForPrintFormatter:", v5);
  if (!objc_msgSend(v12, "_wk_pageCountForPrintFormatter:", v5))
  {
    v13 = 0;
    if (!a3)
      goto LABEL_13;
    goto LABEL_11;
  }
  v13 = (CGPDFDocument *)objc_msgSend(v5, "_printedDocument");
  if (!v13)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "URLForResource:withExtension:", CFSTR("ApplePDFForTestingRemoveBeforeMerging"), CFSTR("pdf")));
    if (!v34)
    {
      v13 = 0;
      goto LABEL_12;
    }
    v35 = v34;
    v13 = CGPDFDocumentCreateWithURL(v34);

    if (!v13)
      goto LABEL_13;
  }
  Page = CGPDFDocumentGetPage(v13, 1uLL);
  BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
  x = BoxRect.origin.x;
  v16 = BoxRect.origin.y;
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  v19 = BoxRect.size.height;
  if (-[UISwitch isOn](self->_multipagePDFSwitch, "isOn"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v20, "bounds");
    v19 = v21;

  }
  v13 = (CGPDFDocument *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v38.origin.x = x;
  v38.origin.y = v16;
  v38.size.width = width;
  v38.size.height = v19;
  UIGraphicsBeginPDFContextToData((NSMutableData *)v13, v38, 0);
  v39.origin.x = x;
  v39.origin.y = v16;
  v39.size.width = width;
  v39.size.height = height;
  v44.origin.x = x;
  v44.origin.y = v16;
  v44.size.width = width;
  v44.size.height = v19;
  if (CGRectIntersectsRect(v39, v44))
  {
    v22 = v16;
    do
    {
      v40.origin.x = x;
      v40.origin.y = v22;
      v40.size.width = width;
      v40.size.height = v19;
      v45.origin.x = x;
      v45.origin.y = v16;
      v45.size.width = width;
      v45.size.height = height;
      v41 = CGRectIntersection(v40, v45);
      v23 = v41.size.height;
      v41.origin.y = 0.0;
      UIGraphicsBeginPDFPageWithInfo(v41, 0);
      CurrentContext = UIGraphicsGetCurrentContext();
      v22 = v19 + v22;
      CGContextTranslateCTM(CurrentContext, 0.0, height - v22 + v19 - v23);
      v25 = UIGraphicsGetCurrentContext();
      PDFContextBounds = UIGraphicsGetPDFContextBounds();
      CGContextTranslateCTM(v25, 0.0, PDFContextBounds.size.height);
      v26 = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(v26, 1.0, -1.0);
      v27 = UIGraphicsGetCurrentContext();
      CGContextDrawPDFPage(v27, Page);
      v43.origin.x = x;
      v43.origin.y = v16;
      v43.size.width = width;
      v43.size.height = height;
      v46.origin.x = x;
      v46.origin.y = v22;
      v46.size.width = width;
      v46.size.height = v19;
    }
    while (CGRectIntersectsRect(v43, v46));
  }
  UIGraphicsEndPDFContext();
  if (a3)
  {
LABEL_11:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView"));
    objc_msgSend(v28, "bounds");
    a3->origin.x = v29;
    a3->origin.y = v30;
    a3->size.width = v31;
    a3->size.height = v32;
LABEL_12:

  }
LABEL_13:

  return v13;
}

- (void)advanceScrollOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView"));
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  -[SSSDittoDebugView bounds](self, "bounds");
  v9 = v7 + v8 + -20.0;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView"));
  objc_msgSend(v10, "setContentOffset:animated:", 1, v5, v9);

}

- (void)resetScrollOffset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[WKWebView scrollView](self->_webView, "scrollView"));
  objc_msgSend(v2, "setContentOffset:animated:", 1, CGPointZero.x, CGPointZero.y);

}

- (int64_t)numberOfScreenshotsToAdd
{
  double v2;

  -[UIStepper value](self->_numberOfScreenshotsToAddStepper, "value");
  return (uint64_t)v2;
}

- (void)_uiCatalogButtonPushed
{
  void *v3;
  SSSDebugUICatalogViewController *v4;

  v4 = objc_alloc_init(SSSDebugUICatalogViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDittoDebugView delegate](self, "delegate"));
  objc_msgSend(v3, "dittoDebugView:requestsPresentationOfViewController:", self, v4);

}

- (void)_updateScreenshotCount
{
  double v3;
  UIButton *addScreenshotsButton;
  const __CFString *v5;
  id v6;

  -[UIStepper value](self->_numberOfScreenshotsToAddStepper, "value");
  addScreenshotsButton = self->_addScreenshotsButton;
  v5 = &stru_1000937C8;
  if ((uint64_t)v3 > 1)
    v5 = CFSTR("s");
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Snapshot %d Image%@"), (uint64_t)v3, v5));
  -[UIButton setTitle:forState:](addScreenshotsButton, "setTitle:forState:", v6, 0);

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  -[UIButton setTitle:forState:](self->_addScreenshotsButton, "setTitle:forState:", CFSTR("Snapshot 10 Images"), 0);
  -[UIButton intrinsicContentSize](self->_addScreenshotsButton, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v7 = (100.0 - v5) * 0.5;
  -[UIButton setFrame:](self->_addScreenshotsButton, "setFrame:", 8.0, v7, v3, v5);
  -[SSSDittoDebugView _updateScreenshotCount](self, "_updateScreenshotCount");
  -[UIStepper intrinsicContentSize](self->_numberOfScreenshotsToAddStepper, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;
  v44.origin.x = 8.0;
  v44.origin.y = v7;
  v44.size.width = v4;
  v44.size.height = v6;
  v12 = CGRectGetMaxX(v44) + 8.0;
  -[UIStepper setFrame:](self->_numberOfScreenshotsToAddStepper, "setFrame:", v12, (100.0 - v11) * 0.5, v9, v11);
  -[UILabel frame](self->_snapshotPDFLabel, "frame");
  v14 = v13;
  v16 = v15;
  v45.origin.x = v12;
  v45.origin.y = (100.0 - v11) * 0.5;
  v45.size.width = v9;
  v45.size.height = v11;
  v17 = CGRectGetMaxX(v45) + 32.0;
  -[UILabel setFrame:](self->_snapshotPDFLabel, "setFrame:", v17, (100.0 - v16) * 0.5, v14, v16);
  -[UISwitch frame](self->_snapshotPDFSwitch, "frame");
  v19 = v18;
  v21 = v20;
  v46.origin.x = v17;
  v46.origin.y = (100.0 - v16) * 0.5;
  v46.size.width = v14;
  v46.size.height = v16;
  v22 = CGRectGetMaxX(v46) + 8.0;
  -[UISwitch setFrame:](self->_snapshotPDFSwitch, "setFrame:", v22, (100.0 - v21) * 0.5, v19, v21);
  -[UILabel frame](self->_multipagePDFLabel, "frame");
  v24 = v23;
  v26 = v25;
  v47.origin.x = v22;
  v47.origin.y = (100.0 - v21) * 0.5;
  v47.size.width = v19;
  v47.size.height = v21;
  v27 = CGRectGetMaxX(v47) + 22.0;
  -[UILabel setFrame:](self->_multipagePDFLabel, "setFrame:", v27, (100.0 - v26) * 0.5, v24, v26);
  -[UISwitch frame](self->_multipagePDFSwitch, "frame");
  v29 = v28;
  v31 = v30;
  v48.origin.x = v27;
  v48.origin.y = (100.0 - v26) * 0.5;
  v48.size.width = v24;
  v48.size.height = v26;
  -[UISwitch setFrame:](self->_multipagePDFSwitch, "setFrame:", CGRectGetMaxX(v48) + 8.0, (100.0 - v31) * 0.5, v29, v31);
  -[UIButton bounds](self->_uiCatalogButton, "bounds");
  v33 = v32;
  v35 = v34;
  -[SSSDittoDebugView bounds](self, "bounds");
  -[UIButton setFrame:](self->_uiCatalogButton, "setFrame:", v36 + v37 - v33 + -24.0, (100.0 - v35) * 0.5, v33, v35);
  -[SSSDittoDebugView bounds](self, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[SSSDittoDebugView bounds](self, "bounds");
  v51.origin.x = v39;
  v51.origin.y = 100.0;
  v51.size.width = v41;
  v51.size.height = v43;
  v50 = CGRectIntersection(v49, v51);
  -[WKWebView setFrame:](self->_webView, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
}

- (id)blockToRunForAddScreenshotsButton
{
  return self->_blockToRunForAddScreenshotsButton;
}

- (void)setBlockToRunForAddScreenshotsButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SSSDittoDebugViewDelegate)delegate
{
  return (SSSDittoDebugViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_blockToRunForAddScreenshotsButton, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_uiCatalogButton, 0);
  objc_storeStrong((id *)&self->_multipagePDFLabel, 0);
  objc_storeStrong((id *)&self->_multipagePDFSwitch, 0);
  objc_storeStrong((id *)&self->_snapshotPDFLabel, 0);
  objc_storeStrong((id *)&self->_snapshotPDFSwitch, 0);
  objc_storeStrong((id *)&self->_numberOfScreenshotsToAddStepper, 0);
  objc_storeStrong((id *)&self->_addScreenshotsButton, 0);
}

@end
