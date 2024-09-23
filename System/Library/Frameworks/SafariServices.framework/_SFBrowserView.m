@implementation _SFBrowserView

- (_SFBrowserView)initWithFrame:(CGRect)a3
{
  _SFBrowserView *v3;
  id v4;
  uint64_t v5;
  UIView *contentContainerView;
  _SFBrowserView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFBrowserView;
  v3 = -[_SFBrowserView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentContainerView = v3->_contentContainerView;
    v3->_contentContainerView = (UIView *)v5;

    -[_SFBrowserView addSubview:](v3, "addSubview:", v3->_contentContainerView);
    v3->_topBarHeight = 44.0;
    v3->_contentReadyForDisplay = 0;
    -[_SFBrowserView setHidden:](v3, "setHidden:", 1);
    v7 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double Height;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  unint64_t navigationBarBehavior;
  double v19;
  double topBarHeight;
  double minimalUITopOffset;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat MaxY;
  double v30;
  double v31;
  double v32;
  _BOOL8 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id WeakRetained;
  void *v48;
  double v49;
  double v50;
  double v51;
  __int128 v52;
  id v53;
  void *v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double x;
  CGFloat v63;
  double rect;
  CGFloat recta;
  CGFloat v66;
  CGFloat v67;
  double v68;
  _OWORD v69[3];
  CGAffineTransform v70;
  CGAffineTransform v71;
  objc_super v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v72.receiver = self;
  v72.super_class = (Class)_SFBrowserView;
  -[_SFBrowserView layoutSubviews](&v72, sel_layoutSubviews);
  -[_SFBrowserView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_contentContainerView, "setFrame:");
  if (-[_SFToolbar placement](self->_toolbar, "placement") == 1)
  {
    -[_SFToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v12 = v11;
    -[_SFBrowserView _sf_bottomUnsafeAreaFrameForToolbar](self, "_sf_bottomUnsafeAreaFrameForToolbar");
    Height = CGRectGetHeight(v73);
    v74.origin.x = v4;
    v74.origin.y = v6;
    v74.size.width = v8;
    v74.size.height = v10;
    v14 = CGRectGetHeight(v74) - v12 - Height + self->_bottomBarOffset;
    v75.origin.x = v4;
    v75.origin.y = v6;
    v75.size.width = v8;
    v75.size.height = v10;
    -[_SFToolbar setFrame:](self->_toolbar, "setFrame:", 0.0, v14, CGRectGetWidth(v75), v12);
  }
  -[_SFBrowserView safeAreaInsets](self, "safeAreaInsets");
  v16 = v15;
  -[_SFNavigationBar defaultHeight](self->_navigationBar, "defaultHeight");
  navigationBarBehavior = self->_navigationBarBehavior;
  if (navigationBarBehavior == 1)
  {
    v19 = v6;
    v6 = self->_topBarHeight - v17;
    topBarHeight = v17;
  }
  else
  {
    v19 = v6;
    topBarHeight = v10;
    if (!navigationBarBehavior)
    {
      topBarHeight = self->_topBarHeight;
      v6 = v16;
    }
  }
  -[_SFNavigationBar setMaximumHeight:](self->_navigationBar, "setMaximumHeight:");
  -[_SFNavigationBar setContentUnderStatusBarHeight:](self->_navigationBar, "setContentUnderStatusBarHeight:", v16);
  -[_SFNavigationBar setFrame:](self->_navigationBar, "setFrame:", v4, v6, v8, topBarHeight);
  -[_SFBrowserView safeAreaInsets](self, "safeAreaInsets");
  rect = v16;
  v76.origin.x = v4;
  v76.origin.y = v19;
  v76.size.width = v8;
  v76.size.height = v10;
  CGRectGetWidth(v76);
  v68 = 0.0;
  -[SFNanoDomainContainerView setFrame:](self->_nanoDomainContainerView, "setFrame:");
  minimalUITopOffset = self->_minimalUITopOffset;
  -[_SFLinkPreviewHeader systemLayoutSizeFittingSize:](self->_previewHeader, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v66 = v22;
  v67 = minimalUITopOffset;
  -[_SFLinkPreviewHeader setFrame:](self->_previewHeader, "setFrame:", v4, minimalUITopOffset, v8);
  -[SFPinnableBanner sizeThatFits:](self->_pinnableBanner, "sizeThatFits:", v8, v10);
  -[SFPinnableBanner setFrame:](self->_pinnableBanner, "setFrame:", self->_pinnableBannerOffset.x, self->_pinnableBannerOffset.y, v23, v24);
  -[SFCrashBanner sizeThatFits:](self->_crashBanner, "sizeThatFits:", v8, topBarHeight);
  v26 = v25;
  v28 = v27;
  v77.origin.x = v4;
  v77.origin.y = v6;
  v77.size.width = v8;
  v77.size.height = topBarHeight;
  MaxY = CGRectGetMaxY(v77);
  v30 = v26;
  v31 = v19;
  -[SFCrashBanner setFrame:](self->_crashBanner, "setFrame:", v4, MaxY + self->_crashBannerOffset, v30, v28);
  -[UIView setFrame:](self->_statusBarBackgroundView, "setFrame:", v4, v19, v8, rect);
  v78.origin.x = v4;
  v78.origin.y = v19;
  v78.size.width = v8;
  v78.size.height = v10;
  -[UIView setFrame:](self->_scrollToTopView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v78), 20.0);
  if (self->_scrollToTopView)
  {
    v79.origin.x = v4;
    v79.origin.y = v6;
    v79.size.width = v8;
    v79.size.height = topBarHeight;
    v32 = CGRectGetMaxY(v79);
    -[_SFBrowserView bounds](self, "bounds");
    v33 = v32 <= CGRectGetMinY(v80);
  }
  else
  {
    v33 = 0;
  }
  v34 = v6;
  -[_SFNavigationBar setHidden:](self->_navigationBar, "setHidden:", v33, *(_QWORD *)&rect);
  -[_SFBrowserView setHidden:](self, "setHidden:", !self->_contentReadyForDisplay);
  if (-[_SFToolbar placement](self->_toolbar, "placement") == 1)
  {
    v81.origin.x = v4;
    v81.origin.y = v31;
    v81.size.width = v8;
    v81.size.height = v10;
    v35 = CGRectGetHeight(v81);
    -[_SFToolbar frame](self->_toolbar, "frame");
    v68 = v35 - CGRectGetMinY(v82);
  }
  v83.origin.x = v4;
  v83.origin.y = v6;
  v83.size.width = v8;
  v83.size.height = topBarHeight;
  v36 = CGRectGetMaxY(v83);
  v84.origin.x = v4;
  v84.size.height = v66;
  v84.origin.y = v67;
  v84.size.width = v8;
  v37 = CGRectGetMaxY(v84);
  if (v36 <= v37)
    v38 = v37;
  else
    v38 = v36;
  -[UIView setFrame:](self->_quickLookDocumentView, "setFrame:", v4 + 0.0, v31 + v38, v8, v10 - (v68 + v38), *(_QWORD *)&topBarHeight);
  -[UIView bounds](self->_contentContainerView, "bounds");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebViewContainerView);
  v48 = WeakRetained;
  if (self->_unscaledWebViewWidth == 0.0)
  {
    v52 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v69[0] = *MEMORY[0x1E0C9BAA8];
    v69[1] = v52;
    v69[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(WeakRetained, "setTransform:", v69);
    objc_msgSend(v48, "setFrame:", v40, v42, v44, v46);
  }
  else
  {
    -[_SFBrowserView previewScaleFactor](self, "previewScaleFactor");
    v50 = v49;
    objc_msgSend(v48, "setFrame:", v40, v42, v44, v46);
    -[_SFBrowserView unscaledWebViewBounds](self, "unscaledWebViewBounds");
    objc_msgSend(v48, "setBounds:");
    UIRectGetCenter();
    objc_msgSend(v48, "setCenter:", v51 + v50 * self->_obscuredInsets.left * -0.5);
    CGAffineTransformMakeScale(&v71, v50, v50);
    v70 = v71;
    objc_msgSend(v48, "setTransform:", &v70);
    -[_SFBrowserView _scaleContentInset](self, "_scaleContentInset");
  }
  v53 = objc_loadWeakRetained((id *)&self->_currentWebView);
  objc_msgSend(v53, "scrollView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v34;
  objc_msgSend(v54, "bounds");
  v57 = v56;
  v59 = v58;
  v61 = v60;

  x = self->_pinnableBannerOffset.x;
  v85.origin.x = v4;
  v85.origin.y = v55;
  v85.size.width = v8;
  v85.size.height = recta;
  v63 = CGRectGetMaxY(v85);
  -[UIView setFrame:](self->_appInfoOverlay, "setFrame:", x + 0.0, v57 + v63 + self->_pinnableBannerOffset.y, v59, v61 - (v68 + v63 + self->_pinnableBannerOffset.y));

}

- (void)setContentReadyForDisplay
{
  if (!self->_contentReadyForDisplay)
  {
    self->_contentReadyForDisplay = 1;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPreviewHeader:(id)a3
{
  _SFLinkPreviewHeader *v5;
  _SFLinkPreviewHeader *previewHeader;
  _SFLinkPreviewHeader *v7;

  v5 = (_SFLinkPreviewHeader *)a3;
  previewHeader = self->_previewHeader;
  v7 = v5;
  if (previewHeader != v5)
  {
    -[_SFLinkPreviewHeader removeFromSuperview](previewHeader, "removeFromSuperview");
    objc_storeStrong((id *)&self->_previewHeader, a3);
    -[_SFBrowserView addSubview:](self, "addSubview:", self->_previewHeader);
  }

}

- (void)setStatusBarBackgroundView:(id)a3
{
  UIView *v5;
  UIView *statusBarBackgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  statusBarBackgroundView = self->_statusBarBackgroundView;
  v7 = v5;
  if (statusBarBackgroundView != v5)
  {
    -[UIView removeFromSuperview](statusBarBackgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_statusBarBackgroundView, a3);
    -[_SFBrowserView addSubview:](self, "addSubview:", self->_statusBarBackgroundView);
  }

}

- (void)setToolbar:(id)a3
{
  id v5;

  v5 = a3;
  -[_SFToolbar removeFromSuperview](self->_toolbar, "removeFromSuperview");
  objc_storeStrong((id *)&self->_toolbar, a3);
  -[_SFBrowserView addSubview:](self, "addSubview:", self->_toolbar);

}

- (void)setNavigationBar:(id)a3
{
  id v5;

  v5 = a3;
  -[_SFNavigationBar removeFromSuperview](self->_navigationBar, "removeFromSuperview");
  objc_storeStrong((id *)&self->_navigationBar, a3);
  -[_SFBrowserView addSubview:](self, "addSubview:", self->_navigationBar);

}

- (void)updateDismissButtonStyle:(int64_t)a3
{
  id v5;

  -[_SFBrowserView navigationBar](self, "navigationBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDismissButtonStyle:animated:", a3, self->_contentReadyForDisplay);

}

- (void)setBottomBarOffset:(double)a3
{
  if (self->_bottomBarOffset != a3)
  {
    self->_bottomBarOffset = a3;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTopBarHeight:(double)a3
{
  if (self->_topBarHeight != a3)
  {
    self->_topBarHeight = a3;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)addWebView:(id)a3
{
  -[_SFBrowserView _addWebView:webViewContainerView:](self, "_addWebView:webViewContainerView:", a3, a3);
}

- (void)addWebViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserView _addWebView:webViewContainerView:](self, "_addWebView:webViewContainerView:", v4, v5);

}

- (void)_addWebView:(id)a3 webViewContainerView:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id obj;

  obj = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  objc_msgSend(WeakRetained, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", 0);

  v9 = objc_loadWeakRetained((id *)&self->_currentWebViewContainerView);
  objc_msgSend(v9, "removeFromSuperview");

  objc_storeWeak((id *)&self->_currentWebView, obj);
  objc_storeWeak((id *)&self->_currentWebViewContainerView, v6);
  -[UIView bounds](self->_contentContainerView, "bounds");
  objc_msgSend(v6, "setFrame:");
  -[UIView addSubview:](self->_contentContainerView, "addSubview:", v6);
  if (self->_pinnableBanner)
  {
    objc_msgSend(obj, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_pinnableBanner);

  }
}

- (double)previewScaleFactor
{
  double unscaledWebViewWidth;
  double left;
  double right;
  double Width;
  double result;
  CGRect v8;

  unscaledWebViewWidth = self->_unscaledWebViewWidth;
  left = self->_obscuredInsets.left;
  right = self->_obscuredInsets.right;
  -[UIView bounds](self->_contentContainerView, "bounds");
  Width = CGRectGetWidth(v8);
  result = 1.0;
  if (Width != 0.0 && self->_unscaledWebViewWidth != 0.0)
  {
    result = Width / (unscaledWebViewWidth - left - right);
    if (result > 1.0)
      return 1.0;
  }
  return result;
}

- (CGRect)unscaledWebViewBounds
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double unscaledWebViewWidth;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  -[UIView bounds](self->_contentContainerView, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  if (CGRectGetWidth(v14) == 0.0
    || (unscaledWebViewWidth = self->_unscaledWebViewWidth,
        unscaledWebViewWidth - self->_obscuredInsets.left - self->_obscuredInsets.right == 0.0))
  {
    -[_SFBrowserView bounds](self, "bounds");
    unscaledWebViewWidth = v12;
  }
  else
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    CGRectGetHeight(v15);
    _SFCeilingFloatToPixels();
    v9 = v8;
    v10 = 0.0;
    v11 = 0.0;
  }
  v13 = unscaledWebViewWidth;
  result.size.height = v9;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)_scaleContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double left;
  double right;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  -[_SFLinkPreviewHeader bounds](self->_previewHeader, "bounds");
  v4 = v3;
  -[_SFBrowserView previewScaleFactor](self, "previewScaleFactor");
  v6 = v5;
  left = self->_obscuredInsets.left;
  right = self->_obscuredInsets.right;
  objc_msgSend(WeakRetained, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4 / v6;
  objc_msgSend(v9, "_sf_setContentInsetAdjustments:", v10, left, 0.0, right);
  objc_msgSend(v9, "setScrollIndicatorInsets:", v10, left, 0.0, right);
  objc_msgSend(WeakRetained, "_setObscuredInsets:", v10, left, 0.0, right);
  objc_msgSend(WeakRetained, "bounds");
  v12 = v11;
  v14 = v13 - (left + right);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "bounds");
    objc_msgSend(WeakRetained, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v14, v12 - (v10 + 0.0), v14, v12 - (v10 + 0.0), v15, v16);
  }
  else
  {
    objc_msgSend(WeakRetained, "bounds");
    objc_msgSend(WeakRetained, "_overrideLayoutParametersWithMinimumLayoutSize:maximumUnobscuredSizeOverride:", v14, v12 - (v10 + 0.0));
  }

}

- (void)updatePreviewHeaderWithURLString:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_SFBrowserView previewHeader](self, "previewHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDomain:", v5);

  }
}

- (void)setShouldUseScrollToTopView:(BOOL)a3
{
  UIView *scrollToTopView;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  if (self->_shouldUseScrollToTopView != a3)
  {
    self->_shouldUseScrollToTopView = a3;
    scrollToTopView = self->_scrollToTopView;
    if (a3)
    {
      if (!scrollToTopView)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v6 = self->_scrollToTopView;
        self->_scrollToTopView = v5;

        -[_SFBrowserView addSubview:](self, "addSubview:", self->_scrollToTopView);
      }
    }
    else if (scrollToTopView)
    {
      -[UIView removeFromSuperview](scrollToTopView, "removeFromSuperview");
      v7 = self->_scrollToTopView;
      self->_scrollToTopView = 0;

    }
    -[_SFBrowserView bounds](self, "bounds");
    -[UIView setFrame:](self->_scrollToTopView, "setFrame:", 0.0, 0.0);
  }
}

- (void)setCrashBanner:(id)a3
{
  id v5;

  v5 = a3;
  -[SFCrashBanner removeFromSuperview](self->_crashBanner, "removeFromSuperview");
  objc_storeStrong((id *)&self->_crashBanner, a3);
  -[_SFBrowserView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_crashBanner, self->_navigationBar);
  -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setCrashBannerOffset:(double)a3
{
  if (self->_crashBannerOffset != a3)
  {
    self->_crashBannerOffset = a3;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPinnableBanner:(id)a3
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  -[SFPinnableBanner removeFromSuperview](self->_pinnableBanner, "removeFromSuperview");
  objc_storeStrong((id *)&self->_pinnableBanner, a3);
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
    objc_msgSend(WeakRetained, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPinnableBannerOffset:(CGPoint)a3
{
  if (self->_pinnableBannerOffset.x != a3.x || self->_pinnableBannerOffset.y != a3.y)
  {
    self->_pinnableBannerOffset = a3;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAppInfoOverlay:(id)a3
{
  UIView *v5;
  UIView **p_appInfoOverlay;
  UIView *appInfoOverlay;
  id WeakRetained;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_appInfoOverlay = &self->_appInfoOverlay;
  appInfoOverlay = self->_appInfoOverlay;
  v10 = v5;
  if (appInfoOverlay != v5)
  {
    -[UIView removeFromSuperview](appInfoOverlay, "removeFromSuperview");
    objc_storeStrong((id *)&self->_appInfoOverlay, a3);
    -[SFPinnableBanner setHidden:](self->_pinnableBanner, "setHidden:", *p_appInfoOverlay != 0);
    if (v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
      objc_msgSend(WeakRetained, "scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", *p_appInfoOverlay);

    }
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  _SFLinkPreviewHeader *previewHeader;
  uint64_t v10;
  void *v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!objc_msgSend(v7, "type"))
  {
    if (!self->_hasReceivedTouchEvents)
      self->_hasReceivedTouchEvents = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "browserViewDidReceiveTouchEvent:", self);

  }
  previewHeader = self->_previewHeader;
  if (previewHeader)
  {
    -[_SFLinkPreviewHeader frame](previewHeader, "frame");
    v14.x = x;
    v14.y = y;
    if (!CGRectContainsPoint(v15, v14))
    {
      v11 = 0;
      goto LABEL_13;
    }
    -[_SFLinkPreviewHeader hitTest:withEvent:](self->_previewHeader, "hitTest:withEvent:", v7, x, y);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFBrowserView;
    -[_SFBrowserView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_13:

  return v11;
}

- (void)setQuickLookDocumentView:(id)a3
{
  UIView *quickLookDocumentView;
  id v6;

  v6 = a3;
  quickLookDocumentView = self->_quickLookDocumentView;
  if (quickLookDocumentView)
    -[UIView removeFromSuperview](quickLookDocumentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_quickLookDocumentView, a3);
  if (self->_quickLookDocumentView)
  {
    -[UIView addSubview:](self->_contentContainerView, "addSubview:", v6);
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMinimalUITopOffset:(double)a3
{
  if (self->_minimalUITopOffset != a3)
  {
    self->_minimalUITopOffset = a3;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNanoDomainContainerView:(id)a3
{
  SFNanoDomainContainerView *v5;
  SFNanoDomainContainerView *nanoDomainContainerView;
  SFNanoDomainContainerView *v7;

  v5 = (SFNanoDomainContainerView *)a3;
  nanoDomainContainerView = self->_nanoDomainContainerView;
  v7 = v5;
  if (nanoDomainContainerView != v5)
  {
    -[SFNanoDomainContainerView removeFromSuperview](nanoDomainContainerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_nanoDomainContainerView, a3);
    -[_SFBrowserView addSubview:](self, "addSubview:", self->_nanoDomainContainerView);
  }

}

- (void)setUnscaledWebViewWidth:(double)a3
{
  if (self->_unscaledWebViewWidth != a3)
  {
    self->_unscaledWebViewWidth = a3;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setObscuredInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_obscuredInsets.left
    || a3.top != self->_obscuredInsets.top
    || a3.right != self->_obscuredInsets.right
    || a3.bottom != self->_obscuredInsets.bottom)
  {
    self->_obscuredInsets = a3;
    -[_SFBrowserView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)accessibilityIdentifier
{
  id WeakRetained;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentWebView);
  v4 = WeakRetained;
  if (self->_contentReadyForDisplay)
    v5 = CFSTR("true");
  else
    v5 = CFSTR("false");
  v10[0] = CFSTR("IsPageLoaded");
  v10[1] = CFSTR("WebViewProcessID");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), (int)objc_msgSend(WeakRetained, "_webProcessIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isContentReadyForDisplay
{
  return self->_contentReadyForDisplay;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (_SFToolbar)toolbar
{
  return self->_toolbar;
}

- (_SFNavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (double)bottomBarOffset
{
  return self->_bottomBarOffset;
}

- (double)topBarHeight
{
  return self->_topBarHeight;
}

- (WKWebView)currentWebView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_currentWebView);
}

- (unint64_t)navigationBarBehavior
{
  return self->_navigationBarBehavior;
}

- (void)setNavigationBarBehavior:(unint64_t)a3
{
  self->_navigationBarBehavior = a3;
}

- (_SFLinkPreviewHeader)previewHeader
{
  return self->_previewHeader;
}

- (UIView)statusBarBackgroundView
{
  return self->_statusBarBackgroundView;
}

- (UIView)scrollToTopView
{
  return self->_scrollToTopView;
}

- (BOOL)shouldUseScrollToTopView
{
  return self->_shouldUseScrollToTopView;
}

- (SFCrashBanner)crashBanner
{
  return self->_crashBanner;
}

- (double)crashBannerOffset
{
  return self->_crashBannerOffset;
}

- (SFPinnableBanner)pinnableBanner
{
  return self->_pinnableBanner;
}

- (CGPoint)pinnableBannerOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_pinnableBannerOffset.x;
  y = self->_pinnableBannerOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (SFPinnableBanner)appBannerPendingFirstPaint
{
  return self->_appBannerPendingFirstPaint;
}

- (void)setAppBannerPendingFirstPaint:(id)a3
{
  objc_storeStrong((id *)&self->_appBannerPendingFirstPaint, a3);
}

- (BOOL)hasReceivedTouchEvents
{
  return self->_hasReceivedTouchEvents;
}

- (UIView)quickLookDocumentView
{
  return self->_quickLookDocumentView;
}

- (double)minimalUITopOffset
{
  return self->_minimalUITopOffset;
}

- (SFBrowserViewDelegate)delegate
{
  return (SFBrowserViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)unscaledWebViewWidth
{
  return self->_unscaledWebViewWidth;
}

- (UIEdgeInsets)obscuredInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_obscuredInsets.top;
  left = self->_obscuredInsets.left;
  bottom = self->_obscuredInsets.bottom;
  right = self->_obscuredInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)appInfoOverlay
{
  return self->_appInfoOverlay;
}

- (SFNanoDomainContainerView)nanoDomainContainerView
{
  return self->_nanoDomainContainerView;
}

- (UIView)currentWebViewContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_currentWebViewContainerView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentWebViewContainerView);
  objc_storeStrong((id *)&self->_nanoDomainContainerView, 0);
  objc_storeStrong((id *)&self->_appInfoOverlay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quickLookDocumentView, 0);
  objc_storeStrong((id *)&self->_appBannerPendingFirstPaint, 0);
  objc_storeStrong((id *)&self->_pinnableBanner, 0);
  objc_storeStrong((id *)&self->_crashBanner, 0);
  objc_storeStrong((id *)&self->_scrollToTopView, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_previewHeader, 0);
  objc_destroyWeak((id *)&self->_currentWebView);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end
