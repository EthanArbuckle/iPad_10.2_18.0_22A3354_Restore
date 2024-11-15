@implementation IAMWebView

- (IAMWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  IAMWebView *v4;
  IAMWebView *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IAMWebView;
  v4 = -[IAMWebView initWithFrame:configuration:](&v9, sel_initWithFrame_configuration_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[IAMWebView scrollView](v4, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScrollEnabled:", 0);

    -[IAMWebView scrollView](v5, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentInsetAdjustmentBehavior:", 2);

    -[IAMWebView setAllowsLinkPreview:](v5, "setAllowsLinkPreview:", 0);
  }
  return v5;
}

@end
