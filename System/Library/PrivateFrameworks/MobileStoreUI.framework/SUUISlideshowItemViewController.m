@implementation SUUISlideshowItemViewController

- (SUUISlideshowItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUISlideshowItemViewController *v4;
  SUUISlideshowItemViewController *v5;
  SUUISlideshowImageScrollView *v6;
  SUUISlideshowImageScrollView *imageScrollView;
  SUUISlideshowImageScrollView *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUISlideshowItemViewController;
  v4 = -[SUUISlideshowItemViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_indexInCollection = 0;
    v6 = objc_alloc_init(SUUISlideshowImageScrollView);
    imageScrollView = v5->_imageScrollView;
    v5->_imageScrollView = v6;

    -[SUUISlideshowImageScrollView setDelegate:](v5->_imageScrollView, "setDelegate:", v5);
    -[SUUISlideshowImageScrollView setAutoresizingMask:](v5->_imageScrollView, "setAutoresizingMask:", 18);
    v8 = v5->_imageScrollView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISlideshowImageScrollView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v5->_zoomingGestureThresholdBroken = 0;
    v5->_lastContentOffset = (CGPoint)*MEMORY[0x24BDBEFB0];
    v5->_lastZoomScale = 0.0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUISlideshowImageScrollView setDelegate:](self->_imageScrollView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUISlideshowItemViewController;
  -[SUUISlideshowItemViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  SUUISlideshowImageScrollView *imageScrollView;
  void *v5;
  UIView *loadingView;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUISlideshowItemViewController;
  -[SUUISlideshowItemViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[SUUISlideshowItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  imageScrollView = self->_imageScrollView;
  objc_msgSend(v3, "bounds");
  -[SUUISlideshowImageScrollView setFrame:](imageScrollView, "setFrame:");
  objc_msgSend(v3, "addSubview:", self->_imageScrollView);
  -[SUUISlideshowItemViewController itemImage](self, "itemImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    loadingView = self->_loadingView;
    if (!loadingView)
    {
      v7 = -[SUUISlideshowItemViewController _newLoadingView](self, "_newLoadingView");
      v8 = self->_loadingView;
      self->_loadingView = v7;

      v9 = self->_loadingView;
      objc_msgSend(v3, "center");
      -[UIView setCenter:](v9, "setCenter:");
      loadingView = self->_loadingView;
    }
    objc_msgSend(v3, "addSubview:", loadingView);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD808]), "initWithTarget:action:", self, sel__pinchGestureAction_);
  objc_msgSend(v10, "setDelegate:", self);
  -[SUUISlideshowImageScrollView addGestureRecognizer:](self->_imageScrollView, "addGestureRecognizer:", v10);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUISlideshowItemViewController;
  -[SUUISlideshowItemViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUISlideshowImageScrollView resetZoomScale](self->_imageScrollView, "resetZoomScale");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (UIImage)itemImage
{
  return -[SUUISlideshowImageScrollView image](self->_imageScrollView, "image");
}

- (void)setItemImage:(id)a3
{
  UIView *loadingView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  id v9;

  -[SUUISlideshowImageScrollView setImage:](self->_imageScrollView, "setImage:");
  loadingView = self->_loadingView;
  if (a3)
  {
    if (loadingView)
    {
      -[UIView removeFromSuperview](loadingView, "removeFromSuperview");
      v6 = self->_loadingView;
      self->_loadingView = 0;

    }
  }
  else
  {
    if (!loadingView)
    {
      v7 = -[SUUISlideshowItemViewController _newLoadingView](self, "_newLoadingView");
      v8 = self->_loadingView;
      self->_loadingView = v7;

    }
    -[SUUISlideshowItemViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_loadingView);

  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return -[SUUISlideshowImageScrollView imageView](self->_imageScrollView, "imageView", a3);
}

- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (id)_newLoadingView
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  SUUIClientContext *clientContext;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double MaxX;
  double MaxY;
  double v24;
  double v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 1);
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(v5, "startAnimating");
  v6 = objc_alloc_init(MEMORY[0x24BEBD708]);
  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SCREENSHOTS_LOADING"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SCREENSHOTS_LOADING"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v11);

  objc_msgSend(v6, "sizeToFit");
  objc_msgSend(v5, "bounds");
  v13 = v12 + 5.0;
  objc_msgSend(v5, "bounds");
  v15 = v14 * 0.5;
  objc_msgSend(v6, "bounds");
  v17 = v15 - v16 * 0.5;
  objc_msgSend(v6, "bounds");
  v19 = v18;
  objc_msgSend(v6, "bounds");
  v21 = v20;
  objc_msgSend(v6, "setFrame:", v13, v17, v19);
  objc_msgSend(v3, "addSubview:", v6);
  v27.origin.x = v13;
  v27.origin.y = v17;
  v27.size.width = v19;
  v27.size.height = v21;
  MaxX = CGRectGetMaxX(v27);
  objc_msgSend(v5, "frame");
  MaxY = CGRectGetMaxY(v28);
  v29.origin.x = v13;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  v24 = CGRectGetMaxY(v29);
  if (MaxY >= v24)
    v25 = MaxY;
  else
    v25 = v24;
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, MaxX, v25);

  return v3;
}

- (void)_pinchGestureAction:(id)a3
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  -[SUUISlideshowImageScrollView contentOffset](self->_imageScrollView, "contentOffset");
  self->_lastContentOffset.x = v4;
  self->_lastContentOffset.y = v5;
  -[SUUISlideshowImageScrollView zoomScale](self->_imageScrollView, "zoomScale");
  self->_lastZoomScale = v6;
  if (objc_msgSend(v12, "state") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "slideshowItemViewControllerDidBeginPinchGesture:", self);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v12, "state") == 2)
  {
    -[SUUISlideshowImageScrollView zoomScale](self->_imageScrollView, "zoomScale");
    v9 = v8;
    -[SUUISlideshowImageScrollView minimumZoomScale](self->_imageScrollView, "minimumZoomScale");
    v11 = v9 / v10;
    if (v9 / v10 != 1.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "slideshowItemViewControllerDidDismissWithPinchGesture:ratio:", self, (v11 + -0.550000012) / -0.0999999642 + 1.0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUISlideshowItemViewControllerDelegate)delegate
{
  return (SUUISlideshowItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUISlideshowImageScrollView)imageScrollView
{
  return self->_imageScrollView;
}

- (int64_t)indexInCollection
{
  return self->_indexInCollection;
}

- (void)setIndexInCollection:(int64_t)a3
{
  self->_indexInCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
