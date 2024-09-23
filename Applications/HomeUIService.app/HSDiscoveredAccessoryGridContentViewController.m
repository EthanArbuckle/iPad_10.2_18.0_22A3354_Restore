@implementation HSDiscoveredAccessoryGridContentViewController

- (HSDiscoveredAccessoryGridContentViewController)initWithItemManager:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithAccessoryBrowsingManager:discoveredAccessoryFilter:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSDiscoveredAccessoryGridContentViewController.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSDiscoveredAccessoryGridContentViewController initWithItemManager:]",
    v7);

  return 0;
}

- (HSDiscoveredAccessoryGridContentViewController)initWithAccessoryBrowsingManager:(id)a3 discoveredAccessoryFilter:(id)a4
{
  id v6;
  id v7;
  HSDiscoveredAccessoryGridContentItemManager *v8;
  HSDiscoveredAccessoryGridContentViewController *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  v8 = -[HSDiscoveredAccessoryGridContentItemManager initWithAccessoryBrowsingManager:delegate:discoveredAccessoryFilter:]([HSDiscoveredAccessoryGridContentItemManager alloc], "initWithAccessoryBrowsingManager:delegate:discoveredAccessoryFilter:", v7, self, v6);

  v11.receiver = self;
  v11.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v9 = -[HSDiscoveredAccessoryGridContentViewController initWithItemManager:](&v11, "initWithItemManager:", v8);

  return v9;
}

- (id)_defaultLayoutOptionsForViewSize:(CGSize)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double width;
  double height;
  double v33;
  double v34;
  void *v35;
  void *v36;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v38.receiver = self;
  v38.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v4 = -[HSDiscoveredAccessoryGridContentViewController _defaultLayoutOptionsForViewSize:](&v38, "_defaultLayoutOptionsForViewSize:", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = objc_opt_class(HUGridServiceCell, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleCells"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  if ((objc_opt_isKindOfClass(v10, v7) & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iconView"));
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serviceTextView"));
    objc_msgSend(v22, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v39.origin.x = v15;
    v39.origin.y = v17;
    v39.size.width = v19;
    v39.size.height = v21;
    v41.origin.x = v24;
    v41.origin.y = v26;
    v41.size.width = v28;
    v41.size.height = v30;
    v40 = CGRectIntersection(v39, v41);
    width = v40.size.width;
    height = v40.size.height;
    if (!objc_msgSend(v5, "cellSizeSubclass", v40.origin.x, v40.origin.y) && width * height / (v19 * v21) > 0.1)
    {
      HUDefaultSizeForIconSize(2);
      v34 = v33;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceCellOptions"));
      objc_msgSend(v35, "setIconSize:", v34);

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceCellOptions"));
      objc_msgSend(v36, "setIconContentMode:", 1);

    }
  }
  else
  {
    objc_msgSend(v5, "cellSizeSubclass");
  }

  return v5;
}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController itemManager](self, "itemManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessoryBrowsingManager"));

  return (HFAccessoryBrowsingManager *)v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  -[HSDiscoveredAccessoryGridContentViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setAlwaysBounceVertical:", 0);

  v9 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_identifyAccessory:");
  objc_msgSend(v9, "setDelaysTouchesBegan:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "addGestureRecognizer:", v9);

  -[HSDiscoveredAccessoryGridContentViewController _updateScrollingAttributes](self, "_updateScrollingAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController itemManager](self, "itemManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "home"));
  if (v12)
  {

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController itemManager](self, "itemManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemProviders"));
    v15 = objc_msgSend(v14, "count");

    if (v15)
      goto LABEL_5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController itemManager](self, "itemManager"));
    objc_msgSend(v11, "resetItemProvidersAndModules");
  }

LABEL_5:
}

- (void)setScrollDirection:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  -[HSDiscoveredAccessoryGridContentViewController setScrollDirection:](&v4, "setScrollDirection:", a3);
  -[HSDiscoveredAccessoryGridContentViewController _updateScrollingAttributes](self, "_updateScrollingAttributes");
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController itemManager](self, "itemManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "displayedItemAtIndexPath:", v5));

  v9 = objc_opt_class(HFDiscoveredAccessoryItem, v8);
  LOBYTE(v6) = objc_opt_isKindOfClass(v7, v9);

  return v6 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v6 = a4;
  -[HSDiscoveredAccessoryGridContentViewController collectionView:didSelectItemAtIndexPath:](&v23, "collectionView:didSelectItemAtIndexPath:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController itemManager](self, "itemManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayedItemAtIndexPath:", v6));

  v10 = objc_opt_class(HFDiscoveredAccessoryItem, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v12 = objc_opt_class(HFDiscoveredAccessoryItem, v11);
    v13 = v8;
    v14 = v13;
    if (v13)
    {
      if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;
      if (!v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        v20 = objc_opt_class(v14, v19);
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, v20, v23.receiver, v23.super_class);

      }
    }
    else
    {
      v16 = 0;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController delegate](self, "delegate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "discoveredAccessory"));
    objc_msgSend(v21, "discoveredAccessoryGrid:didSelectDiscoveredAccessory:", self, v22);

  }
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  -[HSDiscoveredAccessoryGridContentViewController configureCell:forItem:](&v18, "configureCell:forItem:", v6, a4);
  v8 = objc_opt_class(HUGridServiceCell, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v10 = objc_opt_class(HUGridServiceCell, v9);
    v11 = v6;
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController cellContentViewBackgroundColor](self, "cellContentViewBackgroundColor"));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      objc_msgSend(v13, "setDefaultNameTextColor:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController cellContentViewBackgroundColor](self, "cellContentViewBackgroundColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "gridBackgroundView"));
      objc_msgSend(v17, "setBackgroundTintColor:", v16);

    }
  }

}

- (id)layoutOptionsForSection:(int64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v3 = -[HSDiscoveredAccessoryGridContentViewController layoutOptionsForSection:](&v7, "layoutOptionsForSection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceCellOptions"));
  objc_msgSend(v5, "setShowDescription:", 0);

  return v4;
}

- (void)itemManagerDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSDiscoveredAccessoryGridContentViewController;
  v4 = a3;
  -[HSDiscoveredAccessoryGridContentViewController itemManagerDidUpdate:](&v7, "itemManagerDidUpdate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController delegate](self, "delegate", v7.receiver, v7.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allItems"));

  objc_msgSend(v5, "discoveredAccessoryGrid:didUpdateNumberOfDiscoveredAccessories:", self, objc_msgSend(v6, "count"));
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (void)_identifyAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(v16, "state") == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "locationInView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForItemAtPoint:"));

    if (v6)
    {
      v8 = objc_opt_class(HFDiscoveredAccessoryItem, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController itemManager](self, "itemManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayedItemAtIndexPath:", v6));
      if ((objc_opt_isKindOfClass(v10, v8) & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "discoveredAccessory"));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "discoveredAccessory"));
        v15 = objc_msgSend(v14, "identify");

      }
    }

  }
}

- (void)_updateScrollingAttributes
{
  _BOOL8 v3;
  id v4;

  v3 = -[HSDiscoveredAccessoryGridContentViewController scrollDirection](self, "scrollDirection") == (id)1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (HSDiscoveredAccessoryGridContentViewControllerDelegate)delegate
{
  return (HSDiscoveredAccessoryGridContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)cellContentViewBackgroundColor
{
  return self->_cellContentViewBackgroundColor;
}

- (void)setCellContentViewBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellContentViewBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellContentViewBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
