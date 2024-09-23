@implementation DADocumentHelper

- (DADocumentHelper)initWithConsentHandles:(id)a3
{
  id v4;
  DADocumentHelper *v5;
  id v6;
  void *v7;
  WKWebView *v8;
  WKWebView *webView;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DADocumentHelper *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DADocumentHelper;
  v5 = -[DADocumentHelper init](&v27, "init");
  if (v5)
  {
    v6 = objc_alloc((Class)WKWebView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v7, "bounds");
    v8 = (WKWebView *)objc_msgSend(v6, "initWithFrame:");
    webView = v5->webView;
    v5->webView = v8;

    v20 = v5;
    -[WKWebView setNavigationDelegate:](v5->webView, "setNavigationDelegate:", v5);
    v11 = (void *)objc_opt_new(NSMutableArray, v10);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v21 = v4;
    obj = v4;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(obj);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ELS_HEALTH_CONSENT_%@_CONTENT"), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15)));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v16, &stru_10013CDC8, 0));

          objc_msgSend(v11, "addObject:", v18);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v13);
    }

    v5 = v20;
    -[DADocumentHelper setContentsText:](v20, "setContentsText:", v11);

    v4 = v21;
  }

  return v5;
}

- (id)generatePDFData
{
  double x;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableData *v11;
  uint64_t v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect PDFContextBounds;

  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = 595.200012;
  v14.size.height = 841.799988;
  v15 = CGRectInset(v14, 24.0, 24.0);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  v7 = objc_alloc_init((Class)UIPrintPageRenderer);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WKWebView viewPrintFormatter](self->webView, "viewPrintFormatter"));
  objc_msgSend(v7, "addPrintFormatter:startingAtPageAtIndex:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, 0.0, 595.200012, 841.799988));
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("paperRect"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height));
  objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("printableRect"));

  v11 = (NSMutableData *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = 595.200012;
  v16.size.height = 841.799988;
  UIGraphicsBeginPDFContextToData(v11, v16, 0);
  if ((uint64_t)objc_msgSend(v7, "numberOfPages") >= 1)
  {
    v12 = 0;
    do
    {
      UIGraphicsBeginPDFPage();
      PDFContextBounds = UIGraphicsGetPDFContextBounds();
      objc_msgSend(v7, "drawPageAtIndex:inRect:", v12++, PDFContextBounds.origin.x, PDFContextBounds.origin.y, PDFContextBounds.size.width, PDFContextBounds.size.height);
    }
    while (v12 < (uint64_t)objc_msgSend(v7, "numberOfPages"));
  }
  UIGraphicsEndPDFContext();

  return v11;
}

- (void)saveConsentDocument:(id)a3
{
  id v4;
  NSTimer *saveDataTimer;
  id v6;
  id onSavePDFData;
  NSTimer *v8;
  NSTimer *v9;
  WKWebView *webView;
  void *v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  saveDataTimer = self->saveDataTimer;
  if (saveDataTimer)
    -[NSTimer invalidate](saveDataTimer, "invalidate");
  v6 = objc_msgSend(v4, "copy");
  onSavePDFData = self->onSavePDFData;
  self->onSavePDFData = v6;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000257A4;
  v13[3] = &unk_1001336A8;
  v13[4] = self;
  v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, 3.0));
  v9 = self->saveDataTimer;
  self->saveDataTimer = v8;

  webView = self->webView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADocumentHelper consentBody](self, "consentBody"));
  v12 = -[WKWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v11, 0);

}

- (id)base64String:(id)a3
{
  NSData *v3;
  void *v4;
  void *v5;

  v3 = UIImagePNGRepresentation((UIImage *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 1));

  return v5;
}

- (id)currentDate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v2, "setDateStyle:", 4);
  objc_msgSend(v2, "setTimeStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringFromDate:", v4));

  return v5;
}

- (id)consentBody
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADocumentHelper imageSignature](self, "imageSignature"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DADocumentHelper base64String:](self, "base64String:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = &stru_10013CDC8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ELS_HEALTH_CONSENT_DOCUMENT_TITLE"), &stru_10013CDC8, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<center><h3>%@</h3></center>"), v6));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADocumentHelper contentsText](self, "contentsText"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      v12 = v5;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<p>%@</p>"), *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11)));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v12, "stringByAppendingString:", v13));

        v11 = (char *)v11 + 1;
        v12 = v5;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ELS_HEALTH_CONSENT_DOCUMENT_NAME"), &stru_10013CDC8, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADocumentHelper fullName](self, "fullName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ELS_HEALTH_CONSENT_DOCUMENT_SIGN"), &stru_10013CDC8, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ELS_HEALTH_CONSENT_DOCUMENT_DATE"), &stru_10013CDC8, 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DADocumentHelper currentDate](self, "currentDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<h3>%@</h3><p>%@</p><h3>%@</h3><img src=\"data:image/png;base64,%@\" /><h3>%@</h3><p>%@</p>"),
                    v14,
                    v15,
                    v17,
                    v26,
                    v19,
                    v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@%@</body></html>"), CFSTR("<html dir=\"ltr\">"), CFSTR("<head><style>body { font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, Helvetica, Arial, sans-serif, \"Apple Color Emoji\", \"Segoe UI Emoji\", \"Segoe UI Symbol\";font-size:14px;}</style></head><body>"),
                    v25,
                    v5,
                    v21));

  return v22;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager", a3, a4));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025C6C;
  v7[3] = &unk_100133048;
  v7[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DADocumentHelper generatePDFData](self, "generatePDFData"));
  v6 = v8;
  objc_msgSend(v5, "transactionWithBlock:", v7);

}

- (NSArray)contentsText
{
  return self->_contentsText;
}

- (void)setContentsText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIImage)imageSignature
{
  return self->_imageSignature;
}

- (void)setImageSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSignature, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_contentsText, 0);
  objc_storeStrong((id *)&self->saveDataTimer, 0);
  objc_storeStrong(&self->onSavePDFData, 0);
  objc_storeStrong((id *)&self->webView, 0);
}

@end
