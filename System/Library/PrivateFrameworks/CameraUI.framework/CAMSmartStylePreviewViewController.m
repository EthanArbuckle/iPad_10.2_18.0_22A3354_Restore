@implementation CAMSmartStylePreviewViewController

- (CAMSmartStylePreviewViewController)initWithDelegate:(id)a3 gridLayout:(unint64_t)a4 pageIndex:(int64_t)a5
{
  id v8;
  CAMSmartStylePreviewViewController *v9;
  CAMSmartStylePreviewViewController *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMSmartStylePreviewViewController;
  v9 = -[CAMSmartStylePreviewViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_pageIndex = a5;
    v10->_gridLayout = a4;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStylePreviewViewController;
  -[CAMSmartStylePreviewViewController description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %ld"), v4, -[CAMSmartStylePreviewViewController pageIndex](self, "pageIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)loadView
{
  CAMSmartStylePreviewGridView *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMSmartStylePreviewViewController;
  -[CAMSmartStylePreviewViewController loadView](&v5, sel_loadView);
  v3 = -[CAMSmartStylePreviewGridView initWithLayout:]([CAMSmartStylePreviewGridView alloc], "initWithLayout:", -[CAMSmartStylePreviewViewController gridLayout](self, "gridLayout"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("page=%lu"), -[CAMSmartStylePreviewViewController pageIndex](self, "pageIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStylePreviewGridView setLogIdentifier:](v3, "setLogIdentifier:", v4);

  -[CAMSmartStylePreviewGridView setDelegate:](v3, "setDelegate:", self);
  -[CAMSmartStylePreviewViewController setView:](self, "setView:", v3);
  -[CAMSmartStylePreviewViewController updateViewsWithLoadResults](self, "updateViewsWithLoadResults");

}

- (void)updateViewsWithLoadResults
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;

  v3 = +[CAMSmartStylePreviewGridView gridItemCountForLayout:](CAMSmartStylePreviewGridView, "gridItemCountForLayout:", -[CAMSmartStylePreviewViewController gridLayout](self, "gridLayout"));
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[CAMSmartStylePreviewViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewViewController:requestsLoadResultForGridIndex:", self, i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[CAMSmartStylePreviewViewController _previewView](self, "_previewView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateGridIndex:withResourceLoadResult:", i, v7);

    }
  }
}

- (unint64_t)expandedItemIndex
{
  void *v2;
  unint64_t v3;

  -[CAMSmartStylePreviewViewController _previewView](self, "_previewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expandedItemIndex");

  return v3;
}

- (void)setExpandedItemIndex:(unint64_t)a3
{
  -[CAMSmartStylePreviewViewController setExpandedItemIndex:animated:](self, "setExpandedItemIndex:animated:", a3, 0);
}

- (void)setExpandedItemIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CAMSmartStylePreviewViewController _previewView](self, "_previewView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpandedItemIndex:animated:", a3, v4);

}

- (void)updateWithStyle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMSmartStylePreviewViewController _previewView](self, "_previewView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyle:", v4);

}

+ (double)desiredCarouselRatio
{
  return 1.0;
}

- (void)smartStylePreviewGridView:(id)a3 didTapItemAtIndex:(unint64_t)a4
{
  unint64_t v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "expandedItemIndex") == a4)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = a4;
  objc_msgSend(v6, "setExpandedItemIndex:animated:", v5, 1);

}

- (void)smartStylePreviewGridView:(id)a3 didChangeAnimatingGrid:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CAMSmartStylePreviewViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewViewController:didChangeAnimatingGrid:", self, v4);

}

- (CAMSmartStylePreviewViewControllerDelegate)delegate
{
  return (CAMSmartStylePreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)gridLayout
{
  return self->_gridLayout;
}

- (int64_t)pageIndex
{
  return self->_pageIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
