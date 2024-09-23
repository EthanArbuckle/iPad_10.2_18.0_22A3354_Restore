@implementation SUUIChartsDocumentViewController

- (SUUIChartsDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5;
  SUUIChartsDocumentViewController *v6;
  SUUIChartsDocumentViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIChartsDocumentViewController;
  v6 = -[SUUIChartsDocumentViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_templateElement, a3);

  return v7;
}

- (void)documentDidUpdate:(id)a3
{
  SUUIChartsTemplateViewElement *v4;
  SUUIChartsTemplateViewElement *templateElement;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *columnViewControllers;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SUUIChartColumnsView *chartsView;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "templateElement");
  v4 = (SUUIChartsTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  v6 = self->_columnViewControllers;
  v7 = -[SUUIChartsDocumentViewController _newColumnViewControllersWithReusableViewControllers:](self, "_newColumnViewControllersWithReusableViewControllers:", v6);
  columnViewControllers = self->_columnViewControllers;
  self->_columnViewControllers = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_columnViewControllers, "containsObject:", v14, (_QWORD)v16) & 1) == 0)
          objc_msgSend(v14, "removeFromParentViewController");
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  chartsView = self->_chartsView;
  if (chartsView)
    -[SUUIChartColumnsView setChartViewControllers:](chartsView, "setChartViewControllers:", self->_columnViewControllers);
  if (-[SUUIResourceLoader isIdleForReason:](self->_resourceLoader, "isIdleForReason:", 1, (_QWORD)v16))
    -[SUUIChartsDocumentViewController resourceLoader:didLoadAllForReason:](self, "resourceLoader:didLoadAllForReason:", self->_resourceLoader, 1);

}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_columnViewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateAndReload", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)suui_viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_columnViewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "suui_viewWillAppear:", v3);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUUIChartsDocumentViewController;
  -[SUUIViewController suui_viewWillAppear:](&v10, sel_suui_viewWillAppear_, v3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (id)contentScrollView
{
  objc_super v3;

  if (self->_chartsView)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)SUUIChartsDocumentViewController;
  -[SUUIChartsDocumentViewController contentScrollView](&v3, sel_contentScrollView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIChartsDocumentViewController;
  -[SUUIChartsDocumentViewController loadView](&v5, sel_loadView);
  -[SUUIChartsDocumentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height;
  float v5;
  double v6;
  double v7;
  CGSize result;

  height = a4.height;
  v5 = a4.width
     / (double)-[SUUIChartsDocumentViewController _visibleColumnCountForWidth:](self, "_visibleColumnCountForWidth:", a3);
  v6 = floorf(v5);
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[SUUIChartColumnsView effectView](self->_chartsView, "effectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIChartsDocumentViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_backdropViewLayerGroupName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setGroupName:", v8);

  v9.receiver = self;
  v9.super_class = (Class)SUUIChartsDocumentViewController;
  -[SUUIViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
}

- (void)viewWillLayoutSubviews
{
  SUUIChartColumnsView *chartsView;
  double v4;
  void *v5;
  SUUIChartColumnsView *v6;
  SUUIChartColumnsView *v7;
  SUUIChartColumnsView *v8;
  SUUIChartColumnsView *v9;
  void *v10;
  SUUIChartColumnsView *v11;
  SUUIChartColumnsView *v12;
  double v13;
  SUUIChartColumnsView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  chartsView = self->_chartsView;
  if (chartsView)
  {
    -[SUUIChartColumnsView frame](self->_chartsView, "frame");
    -[SUUIChartColumnsView setNumberOfVisibleColumns:](chartsView, "setNumberOfVisibleColumns:", -[SUUIChartsDocumentViewController _visibleColumnCountForWidth:](self, "_visibleColumnCountForWidth:", v4));
  }
  else
  {
    -[SUUIChartsDocumentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SUUIChartColumnsView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[SUUIChartColumnsView initWithFrame:](v6, "initWithFrame:");
    v8 = self->_chartsView;
    self->_chartsView = v7;

    -[SUUIChartColumnsView setAutoresizingMask:](self->_chartsView, "setAutoresizingMask:", 18);
    v9 = self->_chartsView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIChartColumnsView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = self->_chartsView;
    -[SUUIChartsDocumentViewController _chartInsets](self, "_chartInsets");
    -[SUUIChartColumnsView setContentInset:](v11, "setContentInset:");
    v12 = self->_chartsView;
    -[SUUIChartColumnsView frame](v12, "frame");
    -[SUUIChartColumnsView setNumberOfVisibleColumns:](v12, "setNumberOfVisibleColumns:", -[SUUIChartsDocumentViewController _visibleColumnCountForWidth:](self, "_visibleColumnCountForWidth:", v13));
    v14 = self->_chartsView;
    -[SUUIChartsDocumentViewController _columnViewControllers](self, "_columnViewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIChartColumnsView setChartViewControllers:](v14, "setChartViewControllers:", v15);

    -[SUUIChartColumnsView effectView](self->_chartsView, "effectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIChartsDocumentViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_backdropViewLayerGroupName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setGroupName:", v19);

    objc_msgSend(v5, "addSubview:", self->_chartsView);
  }
  v20.receiver = self;
  v20.super_class = (Class)SUUIChartsDocumentViewController;
  -[SUUIChartsDocumentViewController viewWillLayoutSubviews](&v20, sel_viewWillLayoutSubviews);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  height = a3.height;
  width = a3.width;
  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = -[SUUIChartsDocumentViewController _visibleColumnCountForWidth:](self, "_visibleColumnCountForWidth:", width);
  -[SUUIChartColumnsView beginColumnChangeAnimationToNumberOfVisibleColumns:](self->_chartsView, "beginColumnChangeAnimationToNumberOfVisibleColumns:", v8);
  -[SUUIChartColumnsView setNumberOfVisibleColumns:](self->_chartsView, "setNumberOfVisibleColumns:", v8);
  v21[4] = self;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __87__SUUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v22[3] = &unk_2511F4640;
  v22[4] = self;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__SUUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v21[3] = &unk_2511F4640;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v22, v21);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_columnViewControllers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = width / (double)v8;
    v13 = floorf(v12);
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setPreferredContentSize:", v13, height);
      }
      while (v11 != v15);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v11);
  }

  v16.receiver = self;
  v16.super_class = (Class)SUUIChartsDocumentViewController;
  -[SUUIChartsDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __87__SUUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[130];
  objc_msgSend(v1, "_chartInsets");
  return objc_msgSend(v2, "setContentInset:");
}

void __87__SUUIChartsDocumentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "endColumnChangeAnimation");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)resourceLoaderDidBeginLoading:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SUUIChartsDocumentViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2571AF260) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "resourceLoaderDidBeginLoading:", v5);

}

- (void)resourceLoader:(id)a3 didLoadAllForReason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (a4 == 1)
    -[SUUIChartsTemplateViewElement dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:](self->_templateElement, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", CFSTR("visibleimagesloaded"), CFSTR("onvisibleimagesloaded"), 1, 1, 0, 0);
  -[SUUIChartsDocumentViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_2571AF260) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "resourceLoader:didLoadAllForReason:", v7, a4);

}

- (UIEdgeInsets)_chartInsets
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[SUUIChartsDocumentViewController topLayoutGuide](self, "topLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  v5 = v4;
  -[SUUIChartsDocumentViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  v8 = v7;

  v9 = 0.0;
  v10 = 0.0;
  v11 = v5;
  v12 = v8;
  result.right = v10;
  result.bottom = v12;
  result.left = v9;
  result.top = v11;
  return result;
}

- (id)_columnViewControllers
{
  NSMutableArray *columnViewControllers;
  NSMutableArray *v4;
  NSMutableArray *v5;

  columnViewControllers = self->_columnViewControllers;
  if (!columnViewControllers)
  {
    v4 = -[SUUIChartsDocumentViewController _newColumnViewControllersWithReusableViewControllers:](self, "_newColumnViewControllersWithReusableViewControllers:", 0);
    v5 = self->_columnViewControllers;
    self->_columnViewControllers = v4;

    columnViewControllers = self->_columnViewControllers;
  }
  return columnViewControllers;
}

- (id)_newColumnViewControllersWithReusableViewControllers:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  float v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  SUUIChartsDocumentViewController *v27;
  SUUIStorePageSectionsViewController *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  SUUIMetricsImpressionSession *v32;
  void *v33;
  void *v35;
  id obj;
  SUUIChartsDocumentViewController *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SUUIViewController clientContext](self, "clientContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIChartColumnsView bounds](self->_chartsView, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = -[SUUIChartsDocumentViewController _visibleColumnCountForWidth:](self, "_visibleColumnCountForWidth:", v4);
  -[SUUIChartsTemplateViewElement columns](self->_templateElement, "columns");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v41)
  {
    v9 = v5 / (double)v8;
    v10 = floorf(v9);
    v40 = *(_QWORD *)v48;
    v37 = self;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(objc_alloc((Class)SUUIPageComponentClassForComponentType(objc_msgSend(v12, "pageComponentType"))), "initWithViewElement:", v12);
        if (v13)
        {
          objc_msgSend(v12, "headerElement");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "titleLabels");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = v16;
          objc_msgSend(v16, "text");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "string");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v19 = v38;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v44;
LABEL_9:
            v23 = 0;
            while (1)
            {
              if (*(_QWORD *)v44 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v23);
              objc_msgSend(v24, "title");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isEqualToString:", v18);

              if ((v26 & 1) != 0)
                break;
              if (v21 == ++v23)
              {
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
                if (v21)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v28 = v24;

            v27 = v37;
            if (v28)
              goto LABEL_21;
          }
          else
          {
LABEL_15:

            v27 = v37;
          }
          v28 = -[SUUIStorePageSectionsViewController initWithLayoutStyle:]([SUUIStorePageSectionsViewController alloc], "initWithLayoutStyle:", 0);
          -[SUUIViewController setClientContext:](v28, "setClientContext:", v35);
          -[SUUIViewController operationQueue](v27, "operationQueue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIViewController setOperationQueue:](v28, "setOperationQueue:", v29);

          -[SUUIChartsDocumentViewController _resourceLoader](v27, "_resourceLoader");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIStorePageSectionsViewController setResourceLoader:](v28, "setResourceLoader:", v30);

          if (v18)
            v31 = v18;
          else
            v31 = &stru_2511FF0C8;
          -[SUUIStorePageSectionsViewController setTitle:](v28, "setTitle:", v31);
          v32 = objc_alloc_init(SUUIMetricsImpressionSession);
          -[SUUIStorePageSectionsViewController setActiveMetricsImpressionSession:](v28, "setActiveMetricsImpressionSession:", v32);

LABEL_21:
          -[SUUIStorePageSectionsViewController setPreferredContentSize:](v28, "setPreferredContentSize:", v10, v7);
          v51 = v13;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIStorePageSectionsViewController setSectionsWithPageComponents:](v28, "setSectionsWithPageComponents:", v33);

          -[SUUIChartsDocumentViewController addChildViewController:](v27, "addChildViewController:", v28);
          objc_msgSend(v39, "addObject:", v28);

        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v41);
  }

  return v39;
}

- (int64_t)_visibleColumnCountForWidth:(double)a3
{
  int64_t v3;

  v3 = 3;
  if (a3 < 1023.0)
    v3 = 2;
  if (a3 < 682.0)
    return 1;
  else
    return v3;
}

- (id)_resourceLoader
{
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v4;
  void *v5;
  SUUIResourceLoader *v6;
  SUUIResourceLoader *v7;
  SUUIResourceLoader *v8;
  void *v9;

  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    v4 = [SUUIResourceLoader alloc];
    -[SUUIViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIResourceLoader initWithClientContext:](v4, "initWithClientContext:", v5);
    v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    v8 = self->_resourceLoader;
    SUUIResourceLoaderGetNameForObject(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIResourceLoader setName:](v8, "setName:", v9);

    -[SUUIResourceLoader setDelegate:](self->_resourceLoader, "setDelegate:", self);
    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_columnViewControllers, 0);
  objc_storeStrong((id *)&self->_chartsView, 0);
}

@end
