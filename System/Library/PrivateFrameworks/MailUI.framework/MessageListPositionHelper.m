@implementation MessageListPositionHelper

void ___ef_log_MessageListPositionHelper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MessageListPositionHelper");
  v1 = (void *)_ef_log_MessageListPositionHelper_log;
  _ef_log_MessageListPositionHelper_log = (uint64_t)v0;

}

- (MessageListPositionHelper)initWithCollectionView:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  MessageListPositionHelper *v9;
  MessageListPositionHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MessageListPositionHelper;
  v9 = -[MessageListPositionHelper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collectionView, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    -[MessageListPositionHelper _calculateStartingPositionForCollectionView:dataSource:](v10, "_calculateStartingPositionForCollectionView:dataSource:", v7, v8);
  }

  return v10;
}

- (void)setUserIsScrolling:(BOOL)a3
{
  if (self->_userIsScrolling != a3)
  {
    self->_userIsScrolling = a3;
    if (!a3)
      -[MessageListPositionHelper recalculateFirstVisibleIndex](self, "recalculateFirstVisibleIndex");
  }
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  double v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  uint64_t v41;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v41 = *MEMORY[0x1E0C80C00];
  if (!-[MessageListPositionHelper userIsScrolling](self, "userIsScrolling"))
  {
    -[MessageListPositionHelper firstVisibleItemID](self, "firstVisibleItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MessageListPositionHelper dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListPositionHelper firstVisibleItemID](self, "firstVisibleItemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indexPathForItemIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        _ef_log_MessageListPositionHelper();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          v13 = "Item no longer present in list. Not adjusting content offset.";
          v14 = v12;
          v15 = 2;
          goto LABEL_10;
        }
LABEL_19:

        goto LABEL_20;
      }
      v10 = objc_msgSend(v9, "item");
      v11 = -[MessageListPositionHelper firstVisibleIndex](self, "firstVisibleIndex");
      if (v10 == v11)
      {
        _ef_log_MessageListPositionHelper();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v31 = 134217984;
          v32 = v10;
          v13 = "First visible index (%ld) unchanged. Not adjusting content offset.";
          v14 = v12;
          v15 = 12;
LABEL_10:
          _os_log_impl(&dword_1D5522000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v31, v15);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      v16 = v11;
      -[MessageListPositionHelper collectionView](self, "collectionView");
      v17 = objc_claimAutoreleasedReturnValue();
      v12 = v17;
      if (v16 > 2)
      {
        -[NSObject cellForItemAtIndexPath:](v17, "cellForItemAtIndexPath:", v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "frame");
        v25 = v24;

        -[MessageListPositionHelper firstVisibleCellOrigin](self, "firstVisibleCellOrigin");
        v27 = v25 - v26;
        -[MessageListPositionHelper startingContentOffset](self, "startingContentOffset");
        y = v28 + v27;
        _ef_log_MessageListPositionHelper();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 134219010;
          v32 = v10;
          v33 = 2114;
          v34 = v9;
          v35 = 2048;
          v36 = v25;
          v37 = 2048;
          v38 = v27;
          v39 = 2048;
          v40 = y;
          v20 = "targetContentOffsetForProposedContentOffset - index:%ld indexPath:%{public}@ cellOrigin:%f cellDelta:%f offset:%f";
          v21 = v19;
          v22 = 52;
          goto LABEL_17;
        }
      }
      else
      {
        if (v10 <= v16)
          goto LABEL_19;
        -[NSObject adjustedContentInset](v17, "adjustedContentInset");
        y = -v18;
        _ef_log_MessageListPositionHelper();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 134217984;
          v32 = v10;
          v20 = "Pinning to top - new first visible index %ld";
          v21 = v19;
          v22 = 12;
LABEL_17:
          _os_log_impl(&dword_1D5522000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v31, v22);
        }
      }

      x = 0.0;
      goto LABEL_19;
    }
    -[MessageListPositionHelper recalculateFirstVisibleIndex](self, "recalculateFirstVisibleIndex");
  }
LABEL_20:
  v29 = x;
  v30 = y;
  result.y = v30;
  result.x = v29;
  return result;
}

- (void)recalculateFirstVisibleIndex
{
  void *v3;
  id v4;

  -[MessageListPositionHelper collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MessageListPositionHelper dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListPositionHelper _calculateStartingPositionForCollectionView:dataSource:](self, "_calculateStartingPositionForCollectionView:dataSource:", v4, v3);

}

- (void)reset
{
  -[MessageListPositionHelper setFirstVisibleItemID:](self, "setFirstVisibleItemID:", 0);
}

- (NSArray)actuallyVisibleItemIDs
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[9];

  -[MessageListPositionHelper _visibleRectInMessageList](self, "_visibleRectInMessageList");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MessageListPositionHelper collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListPositionHelper _sortedIndexPathsForVisibleItemsInCollectionView:](self, "_sortedIndexPathsForVisibleItemsInCollectionView:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__MessageListPositionHelper_actuallyVisibleItemIDs__block_invoke;
  v15[3] = &unk_1E99E18E0;
  v15[4] = self;
  v15[5] = v4;
  v15[6] = v6;
  v15[7] = v8;
  v15[8] = v10;
  objc_msgSend(v12, "ef_compactMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v13;
}

id __51__MessageListPositionHelper_actuallyVisibleItemIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CGFloat MidX;
  void *v7;
  void *v8;
  CGPoint v10;
  CGRect v11;
  CGRect v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "frame");
  MidX = CGRectGetMidX(v11);
  objc_msgSend(v5, "frame");
  v10.y = CGRectGetMidY(v12);
  v10.x = MidX;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 40), v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifierForIndexPath:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)_visibleRectInMessageList
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
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double Width;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[MessageListPositionHelper collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[MessageListPositionHelper collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentOffset");
  v14 = v13;

  -[MessageListPositionHelper collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "adjustedContentInset");
  v17 = v16;
  v19 = v18;

  v20 = v14 + v17;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v21 = CGRectGetHeight(v26) - v17 - v19;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  Width = CGRectGetWidth(v27);
  v23 = 0.0;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = Width;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)_firstVisibleIndexPathForCollectionView:(id)a3
{
  void *v3;
  void *v4;

  -[MessageListPositionHelper _sortedIndexPathsForVisibleItemsInCollectionView:](self, "_sortedIndexPathsForVisibleItemsInCollectionView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sortedIndexPathsForVisibleItemsInCollectionView:(id)a3
{
  return (id)objc_msgSend(a3, "mui_sortedIndexPathsForVisibleItems");
}

- (void)_calculateStartingPositionForCollectionView:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MessageListPositionHelper _firstVisibleIndexPathForCollectionView:](self, "_firstVisibleIndexPathForCollectionView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "itemIdentifierForIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListPositionHelper setFirstVisibleItemID:](self, "setFirstVisibleItemID:", v9);

    -[MessageListPositionHelper setFirstVisibleIndex:](self, "setFirstVisibleIndex:", objc_msgSend(v8, "item"));
    objc_msgSend(v6, "contentOffset");
    -[MessageListPositionHelper setStartingContentOffset:](self, "setStartingContentOffset:", v10);
    objc_msgSend(v6, "cellForItemAtIndexPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    -[MessageListPositionHelper setFirstVisibleCellOrigin:](self, "setFirstVisibleCellOrigin:", v12);

  }
  _ef_log_MessageListPositionHelper();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[MessageListPositionHelper firstVisibleItemID](self, "firstVisibleItemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v8;
    v17 = 2114;
    v18 = v14;
    v19 = 2048;
    v20 = -[MessageListPositionHelper firstVisibleIndex](self, "firstVisibleIndex");
    _os_log_impl(&dword_1D5522000, v13, OS_LOG_TYPE_INFO, "Updating starting position for first visible indexpath:%{public}@ itemID:%{public}@ index:%ld", (uint8_t *)&v15, 0x20u);

  }
}

- (BOOL)userIsScrolling
{
  return self->_userIsScrolling;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (double)startingContentOffset
{
  return self->_startingContentOffset;
}

- (void)setStartingContentOffset:(double)a3
{
  self->_startingContentOffset = a3;
}

- (EMCollectionItemID)firstVisibleItemID
{
  return self->_firstVisibleItemID;
}

- (void)setFirstVisibleItemID:(id)a3
{
  objc_storeStrong((id *)&self->_firstVisibleItemID, a3);
}

- (int64_t)firstVisibleIndex
{
  return self->_firstVisibleIndex;
}

- (void)setFirstVisibleIndex:(int64_t)a3
{
  self->_firstVisibleIndex = a3;
}

- (double)firstVisibleCellOrigin
{
  return self->_firstVisibleCellOrigin;
}

- (void)setFirstVisibleCellOrigin:(double)a3
{
  self->_firstVisibleCellOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstVisibleItemID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
