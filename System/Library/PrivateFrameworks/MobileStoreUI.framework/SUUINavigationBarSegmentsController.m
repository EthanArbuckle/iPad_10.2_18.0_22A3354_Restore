@implementation SUUINavigationBarSegmentsController

- (SUUINavigationBarSegmentsController)initWithViewElement:(id)a3
{
  id v4;
  SUUINavigationBarSegmentsController *v5;
  SUUISegmentedControlViewElementController *v6;
  SUUISegmentedControlViewElementController *underlyingController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUINavigationBarSegmentsController;
  v5 = -[SUUINavigationBarSegmentsController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SUUISegmentedControlViewElementController initWithViewElement:]([SUUISegmentedControlViewElementController alloc], "initWithViewElement:", v4);
    underlyingController = v5->_underlyingController;
    v5->_underlyingController = v6;

    -[SUUISegmentedControlViewElementController setDesiredSegmentWidth:](v5->_underlyingController, "setDesiredSegmentWidth:", 0.0);
  }

  return v5;
}

- (void)reloadAfterDocumentUpdateWithNavigationItem:(id)a3
{
  SUUISegmentedControlViewElementController *underlyingController;
  id v5;
  objc_super v6;

  underlyingController = self->_underlyingController;
  v5 = a3;
  -[SUUISegmentedControlViewElementController reloadAfterDocumentUpdate](underlyingController, "reloadAfterDocumentUpdate");
  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationBarSegmentsController;
  -[SUUINavigationBarSectionController reloadAfterDocumentUpdateWithNavigationItem:](&v6, sel_reloadAfterDocumentUpdateWithNavigationItem_, v5);

}

- (id)view
{
  return -[SUUISegmentedControlViewElementController segmentedControlView](self->_underlyingController, "segmentedControlView");
}

- (void)willAppearInNavigationBar
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  objc_super v10;

  -[SUUINavigationBarSectionController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumNavigationBarWidth");
  v5 = v4;
  objc_msgSend(v3, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isViewLoaded"))
  {
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v5 = v8;

  }
  if (v5 <= 320.0)
    v9 = 3;
  else
    v9 = 5;
  -[SUUISegmentedControlViewElementController setDefaultMaximumNumberOfVisibleItems:](self->_underlyingController, "setDefaultMaximumNumberOfVisibleItems:", v9);
  v10.receiver = self;
  v10.super_class = (Class)SUUINavigationBarSegmentsController;
  -[SUUINavigationBarSectionController willAppearInNavigationBar](&v10, sel_willAppearInNavigationBar);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingController, 0);
}

@end
