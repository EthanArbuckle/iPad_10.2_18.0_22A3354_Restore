@implementation WebViewSnapshotContentProvider

- (WebViewSnapshotContentProvider)initWithWebView:(id)a3 contentFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  WebViewSnapshotContentProvider *v11;
  WebViewSnapshotContentProvider *v12;
  WebViewSnapshotContentProvider *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WebViewSnapshotContentProvider;
  v11 = -[WebViewSnapshotContentProvider init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_webView, a3);
    v12->_contentFrame.origin.x = x;
    v12->_contentFrame.origin.y = y;
    v12->_contentFrame.size.width = width;
    v12->_contentFrame.size.height = height;
    v13 = v12;
  }

  return v12;
}

- (UIView)snapshotContentView
{
  return (UIView *)self->_webView;
}

- (UIImage)snapshotContentImage
{
  return self->_snapshotImage;
}

- (UIColor)snapshotBackgroundColor
{
  void *v2;
  void *v3;

  -[WKWebView scrollView](self->_webView, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (BOOL)snapshotContentShouldUnderlapTopBackdrop
{
  void *v2;
  double v3;
  BOOL v4;

  -[WKWebView scrollView](self->_webView, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInset");
  v4 = v3 != 0.0;

  return v4;
}

- (CGRect)snapshotContentRectInBounds:(CGRect)a3
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!self->_snapshotImage)
  {
    -[WKWebView bounds](self->_webView, "bounds");
    v7 = v17.origin.x;
    v8 = v17.origin.y;
    v9 = v17.size.width;
    v10 = v17.size.height;
    v16 = CGRectGetHeight(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v11 = v16 * CGRectGetWidth(v18);
    v19.origin.x = v7;
    v19.origin.y = v8;
    v19.size.width = v9;
    v19.size.height = v10;
    height = v11 / CGRectGetWidth(v19);
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)prepareForSnapshotOfSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  void *v13;
  WKWebView *webView;
  _QWORD v15[5];
  void (**v16)(id, _QWORD);

  height = a3.height;
  width = a3.width;
  v7 = (void (**)(id, _QWORD))a4;
  -[WKWebView window](self->_webView, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "activationState");

  if (v10 == 2)
  {
    v7[2](v7, 0);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CEF600]);
    v12 = CGRectGetWidth(self->_contentFrame);
    objc_msgSend(v11, "setRect:", CGRectGetMinX(self->_contentFrame), 0.0, v12, height * v12 / width);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetWidth(self->_contentFrame));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSnapshotWidth:", v13);

    if (-[WKWebView _isDisplayingPDF](self->_webView, "_isDisplayingPDF"))
      objc_msgSend(v11, "setAfterScreenUpdates:", 0);
    webView = self->_webView;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__WebViewSnapshotContentProvider_prepareForSnapshotOfSize_completion___block_invoke;
    v15[3] = &unk_1E9CFB0C0;
    v15[4] = self;
    v16 = v7;
    -[WKWebView takeSnapshotWithConfiguration:completionHandler:](webView, "takeSnapshotWithConfiguration:completionHandler:", v11, v15);

  }
}

void __70__WebViewSnapshotContentProvider_prepareForSnapshotOfSize_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  v4 = a2;
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) != 0);

}

- (WKWebView)webView
{
  return self->_webView;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_snapshotImage, 0);
}

@end
