@implementation CRKCardSectionViewConfiguration

- (void)_setDebugOverlayView:(id)a3
{
  _CRKDebugOverlayView *v5;
  _CRKDebugOverlayView *debugOverlayView;
  void *v7;
  _CRKDebugOverlayView *v8;

  v5 = (_CRKDebugOverlayView *)a3;
  debugOverlayView = self->_debugOverlayView;
  v8 = v5;
  if (debugOverlayView != v5)
  {
    -[_CRKDebugOverlayView removeFromSuperview](debugOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_debugOverlayView, a3);
    -[CRKCardSectionViewConfiguration cardSectionView](self, "cardSectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

  }
}

- (void)setCardSectionView:(id)a3
{
  CRKCardSectionView *v5;

  v5 = (CRKCardSectionView *)a3;
  if (self->_cardSectionView != v5)
  {
    -[_CRKDebugOverlayView removeFromSuperview](self->_debugOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_cardSectionView, a3);
    -[CRKCardSectionView addSubview:](v5, "addSubview:", self->_debugOverlayView);
  }

}

- (void)_setDebugModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _CRKDebugOverlayView *v6;
  void *v7;
  _CRKDebugOverlayView *debugOverlayView;
  id v9;

  if (self->_debugModeEnabled != a3)
  {
    v3 = a3;
    -[_CRKDebugOverlayView removeFromSuperview](self->_debugOverlayView, "removeFromSuperview");
    self->_debugModeEnabled = v3;
    if (self->_debugOverlayView)
    {
      if (!v3)
      {
LABEL_5:
        -[CRKCardSectionViewConfiguration cardSectionView](self, "cardSectionView");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNeedsLayout");

        return;
      }
    }
    else
    {
      v6 = objc_alloc_init(_CRKDebugOverlayView);
      -[CRKCardSectionViewConfiguration _updateDebugOverlayViewText:](self, "_updateDebugOverlayViewText:", v6);
      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CRKDebugOverlayView setColor:](v6, "setColor:", v7);

      debugOverlayView = self->_debugOverlayView;
      self->_debugOverlayView = v6;

      if (!v3)
        goto LABEL_5;
    }
    -[CRKCardSectionViewConfiguration cardSectionView](self, "cardSectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_debugOverlayView);

    goto LABEL_5;
  }
}

- (void)setCardSection:(id)a3
{
  CRCardSection *v5;
  void *v6;
  void *v7;
  CRCardSection *v8;

  v5 = (CRCardSection *)a3;
  if (self->_cardSection != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_cardSection, a3);
    -[CRKCardSectionViewConfiguration _debugOverlayView](self, "_debugOverlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewConfiguration _updateDebugOverlayViewText:](self, "_updateDebugOverlayViewText:", v6);

    -[CRKCardSectionViewConfiguration cardSectionView](self, "cardSectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    v5 = v8;
  }

}

- (void)_setProviderIdentifier:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_providerIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_providerIdentifier, a3);
    -[CRKCardSectionViewConfiguration _debugOverlayView](self, "_debugOverlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewConfiguration _updateDebugOverlayViewText:](self, "_updateDebugOverlayViewText:", v5);

    -[CRKCardSectionViewConfiguration cardSectionView](self, "cardSectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)_updateDebugOverlayViewText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[CRKCardSectionViewConfiguration cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCardSectionViewConfiguration _providerIdentifier](self, "_providerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\n%@"), v8, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDebugText:", v12);
}

- (CRCardSection)cardSection
{
  return self->_cardSection;
}

- (CRKCardSectionView)cardSectionView
{
  return self->_cardSectionView;
}

- (CRKFeedbackDelegateProxying)feedbackDelegateProxy
{
  return self->_feedbackDelegateProxy;
}

- (void)setFeedbackDelegateProxy:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackDelegateProxy, a3);
}

- (CRKCardSectionViewControlling)cardSectionViewController
{
  return self->_cardSectionViewController;
}

- (void)setCardSectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardSectionViewController, a3);
}

- (NSString)_providerIdentifier
{
  return self->_providerIdentifier;
}

- (_CRKDebugOverlayView)_debugOverlayView
{
  return self->_debugOverlayView;
}

- (BOOL)_debugModeEnabled
{
  return self->_debugModeEnabled;
}

- (CRKCardSectionViewController)_cardKitCardSectionViewController
{
  return self->_cardKitCardSectionViewController;
}

- (void)_setCardKitCardSectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardKitCardSectionViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardKitCardSectionViewController, 0);
  objc_storeStrong((id *)&self->_debugOverlayView, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_cardSectionViewController, 0);
  objc_storeStrong((id *)&self->_feedbackDelegateProxy, 0);
  objc_storeStrong((id *)&self->_cardSectionView, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
}

@end
