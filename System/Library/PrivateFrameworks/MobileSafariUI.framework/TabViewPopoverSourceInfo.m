@implementation TabViewPopoverSourceInfo

- (TabViewPopoverSourceInfo)initWithBrowserController:(id)a3 barItem:(int64_t)a4
{
  id v7;
  TabViewPopoverSourceInfo *v8;
  TabViewPopoverSourceInfo *v9;
  TabViewPopoverSourceInfo *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TabViewPopoverSourceInfo;
  v8 = -[TabViewPopoverSourceInfo init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_barItem = a4;
    objc_storeStrong((id *)&v8->_browserController, a3);
    v10 = v9;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SFStringForBarItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; barItem = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)_tabOverviewBarButton
{
  int64_t barItem;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  barItem = self->_barItem;
  if (barItem == 7)
    return 1;
  if (barItem != 8)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[TabViewPopoverSourceInfo _tabOverviewBarButton].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  }
  return 2;
}

- (CGRect)popoverSourceRect
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[BrowserController tabCollectionViewProvider](self->_browserController, "tabCollectionViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabThumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectForBarButton:", -[TabViewPopoverSourceInfo _tabOverviewBarButton](self, "_tabOverviewBarButton"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIView)popoverSourceView
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[BrowserController tabCollectionViewProvider](self->_browserController, "tabCollectionViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabThumbnailCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[TabViewPopoverSourceInfo popoverSourceView].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  }
  return (UIView *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserController, 0);
}

- (void)_tabOverviewBarButton
{
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, a2, a3, "%{public}@: unhandled bar item", a5, a6, a7, a8, 2u);
}

- (void)popoverSourceView
{
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, a2, a3, "%{public}@: tab overview toolbar is nil", a5, a6, a7, a8, 2u);
}

@end
