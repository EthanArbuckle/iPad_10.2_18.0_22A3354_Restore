@implementation SUUIStorePageSectionContext

- (SUUIStorePageSectionContext)init
{
  SUUIStorePageSectionContext *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIStorePageSectionContext;
  v2 = -[SUUIStorePageSectionContext init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    v2->_portraitPageWidth = v5;
    v2->_activePageWidth = v5;
    v2->_landscapePageWidth = v7;
  }
  return v2;
}

- (SUUIClientContext)clientContext
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  objc_msgSend(WeakRetained, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUIClientContext *)v3;
}

- (double)horizontalPadding
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double Height;
  double result;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(MEMORY[0x24BEBDB58], "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SUUIStorePageSectionContext activePageWidth](self, "activePageWidth");
  v13 = v12;
  if (v12 < 1024.0
    || (v16.origin.x = v5,
        v16.origin.y = v7,
        v16.size.width = v9,
        v16.size.height = v11,
        Height = CGRectGetHeight(v16),
        result = 20.0,
        Height <= 768.0))
  {
    if (-[SUUIStorePageSectionContext layoutStyle](self, "layoutStyle") != 1)
      return 15.0;
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    if (CGRectGetHeight(v17) >= 1024.0)
    {
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      if (CGRectGetWidth(v18) >= 1024.0)
        return 35.0;
    }
    result = 20.0;
    if (v13 != 414.0)
      return 15.0;
  }
  return result;
}

- (SUUIItemOfferButtonAppearance)itemOfferButtonAppearance
{
  SUUIItemOfferButtonAppearance *itemOfferButtonAppearance;
  SUUIItemOfferButtonAppearance *v4;
  SUUIItemOfferButtonAppearance *v5;

  itemOfferButtonAppearance = self->_itemOfferButtonAppearance;
  if (!itemOfferButtonAppearance)
  {
    v4 = -[SUUIItemOfferButtonAppearance initWithColorScheme:]([SUUIItemOfferButtonAppearance alloc], "initWithColorScheme:", self->_colorScheme);
    v5 = self->_itemOfferButtonAppearance;
    self->_itemOfferButtonAppearance = v4;

    itemOfferButtonAppearance = self->_itemOfferButtonAppearance;
  }
  return itemOfferButtonAppearance;
}

- (UIColor)placeholderColor
{
  UIColor *placeholderColor;
  void *v4;
  void *v5;
  float v6;
  UIColor *v7;
  UIColor *v8;

  placeholderColor = self->_placeholderColor;
  if (!placeholderColor)
  {
    -[UICollectionView backgroundColor](self->_collectionView, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      switch(SUUIColorSchemeStyleForColor(v4))
      {
        case 0:
        case 2:
          v6 = -0.15;
          goto LABEL_7;
        case 1:
        case 3:
          v6 = 0.25;
LABEL_7:
          SUUIColorByAdjustingBrightness(v5, v6);
          v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        default:
          goto LABEL_9;
      }
    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.85, 1.0);
    v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = self->_placeholderColor;
    self->_placeholderColor = v7;

LABEL_9:
    placeholderColor = self->_placeholderColor;
  }
  return placeholderColor;
}

- (void)_setActiveMetricsImpressionSession:(id)a3
{
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, a3);
}

- (void)_setActivePageWidth:(double)a3
{
  if (self->_activePageWidth != a3)
  {
    self->_portraitPageWidth = a3;
    self->_activePageWidth = a3;
  }
}

- (void)_setCollectionView:(id)a3
{
  UICollectionView *v5;
  UIColor *placeholderColor;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  if (self->_collectionView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_collectionView, a3);
    placeholderColor = self->_placeholderColor;
    self->_placeholderColor = 0;

    v5 = v7;
  }

}

- (void)_setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  UIColor *placeholderColor;
  SUUIColorScheme *v7;

  v5 = (SUUIColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    placeholderColor = self->_placeholderColor;
    self->_placeholderColor = 0;

    v5 = v7;
  }

}

- (void)_setDefaultPinningTransitionStyle:(int64_t)a3
{
  self->_defaultPinningTransitionStyle = a3;
}

- (void)_setLandscapePageWidth:(double)a3
{
  self->_landscapePageWidth = a3;
}

- (void)_setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (void)_setMetricsController:(id)a3
{
  SUUIMetricsController *v5;
  SUUIMetricsController **p_metricsController;
  SUUIMetricsController *metricsController;
  SUUIMetricsController *v8;

  v5 = (SUUIMetricsController *)a3;
  metricsController = self->_metricsController;
  p_metricsController = &self->_metricsController;
  if (metricsController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_metricsController, a3);
    v5 = v8;
  }

}

- (void)_setParentViewController:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_parentViewController, v4);

}

- (void)_setPortraitPageWidth:(double)a3
{
  self->_portraitPageWidth = a3;
}

- (void)_setResourceLoader:(id)a3
{
  SUUIResourceLoader *v5;
  SUUIResourceLoader **p_resourceLoader;
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v8;

  v5 = (SUUIResourceLoader *)a3;
  resourceLoader = self->_resourceLoader;
  p_resourceLoader = &self->_resourceLoader;
  if (resourceLoader != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_resourceLoader, a3);
    v5 = v8;
  }

}

- (void)_setTextLayoutCache:(id)a3
{
  SUUILayoutCache *v5;
  SUUILayoutCache **p_textLayoutCache;
  SUUILayoutCache *textLayoutCache;
  SUUILayoutCache *v8;

  v5 = (SUUILayoutCache *)a3;
  textLayoutCache = self->_textLayoutCache;
  p_textLayoutCache = &self->_textLayoutCache;
  if (textLayoutCache != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_textLayoutCache, a3);
    v5 = v8;
  }

}

- (SUUIMetricsImpressionSession)activeMetricsImpressionSession
{
  return self->_activeMetricsImpressionSession;
}

- (double)activePageWidth
{
  return self->_activePageWidth;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)defaultPinningTransitionStyle
{
  return self->_defaultPinningTransitionStyle;
}

- (double)landscapePageWidth
{
  return self->_landscapePageWidth;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (SUUIMetricsController)metricsController
{
  return self->_metricsController;
}

- (SUUIStorePageSectionsViewController)parentViewController
{
  return (SUUIStorePageSectionsViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (double)portraitPageWidth
{
  return self->_portraitPageWidth;
}

- (SUUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (SUUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonAppearance, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_activeMetricsImpressionSession, 0);
}

@end
