@implementation GKCollectionDataSource

- (GKCollectionDataSource)init
{
  GKCollectionDataSource *v2;
  GKCollectionDataSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKCollectionDataSource;
  v2 = -[GKCollectionDataSource init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GKCollectionDataSource setBreakSearchInputTextIntoMultipleTerms:](v2, "setBreakSearchInputTextIntoMultipleTerms:", 1);
  return v3;
}

- (void)setupCollectionView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_useStandardHeaders)
  {
    +[NSObject _gkNib](GKDashboardSectionHeaderView, "_gkNib");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerNib:forSupplementaryViewOfKind:withReuseIdentifier:", v4, *MEMORY[0x1E0DC48A8], CFSTR("GKCollectionDataSourceHeader"));

  }
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)loadDataWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (int64_t)itemCount
{
  return 0;
}

- (double)preferredCollectionHeight
{
  return 0.0;
}

- (NSString)sectionHeaderText
{
  return 0;
}

- (id)itemForIndexPath:(id)a3
{
  return 0;
}

- (void)showViewController:(id)a3 popoverSourceView:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkShowViewController:", v5);

}

- (void)dismissViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKCollectionDataSource presentationViewController](self, "presentationViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkDismissViewController:animated:", v4, 1);

}

- (BOOL)isSearching
{
  return -[NSString length](self->_searchText, "length") != 0;
}

- (void)setSearchText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *searchText;
  void *v7;
  NSString *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_searchText, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    searchText = self->_searchText;
    self->_searchText = v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[GKCollectionDataSource breakSearchInputTextIntoMultipleTerms](self, "breakSearchInputTextIntoMultipleTerms"))
    {
      v8 = self->_searchText;
      v9 = -[NSString length](v8, "length");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __40__GKCollectionDataSource_setSearchText___block_invoke;
      v10[3] = &unk_1E59C5758;
      v11 = v7;
      -[NSString enumerateSubstringsInRange:options:usingBlock:](v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, v10);

    }
    else if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v7, "addObject:", v4);
    }
    -[GKCollectionDataSource setSearchTerms:](self, "setSearchTerms:", v7);
    -[GKCollectionDataSource searchTextHasChanged](self, "searchTextHasChanged");

  }
}

uint64_t __40__GKCollectionDataSource_setSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (BOOL)searchMatchesItem:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSArray count](self->_searchTerms, "count"))
  {
    -[GKCollectionDataSource searchKeyForSection:](self, "searchKeyForSection:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionDataSource alternateSearchKeyForSection:](self, "alternateSearchKeyForSection:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "valueForKeyPath:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v6, "valueForKeyPath:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      if (objc_msgSend(v9, "length") || objc_msgSend(v10, "length"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v13 = self->_searchTerms;
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
        {
          v15 = v14;
          v20 = v8;
          v16 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              if (objc_msgSend(v18, "length")
                && (objc_msgSend(v9, "length")
                 && objc_msgSend(v9, "rangeOfString:options:", v18, 897) != 0x7FFFFFFFFFFFFFFFLL
                 || objc_msgSend(v10, "length")
                 && objc_msgSend(v10, "rangeOfString:options:", v18, 897) != 0x7FFFFFFFFFFFFFFFLL))
              {
                v12 = 1;
                goto LABEL_24;
              }
            }
            v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v15)
              continue;
            break;
          }
          v12 = 0;
LABEL_24:
          v8 = v20;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

    v11 = v12 != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)searchKeyForSection:(int64_t)a3
{
  return 0;
}

- (id)alternateSearchKeyForSection:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subclass needs to override collectionView:cellForItemAtIndexPath:"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionDataSource.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v5, "-[GKCollectionDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v7, "UTF8String"), 199);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  return 0;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_useStandardHeaders
    && (v11 = *MEMORY[0x1E0DC48A8], objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8])))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v11, CFSTR("GKCollectionDataSourceHeader"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionDataSource headerTextForSection:](self, "headerTextForSection:", objc_msgSend(v10, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v13);

    objc_msgSend(v12, "setOnDarkBackground:", -[GKCollectionDataSource onDarkBackground](self, "onDarkBackground"));
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subclass needs to override collectionView:viewForSupplementaryElementOfKind:atIndexPath:"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKCollectionDataSource.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v15, "-[GKCollectionDataSource collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", objc_msgSend(v17, "UTF8String"), 218);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v18);
    v12 = 0;
  }

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v8 = a3;
  v9 = a4;
  if (self->_useStandardHeaders && -[GKCollectionDataSource itemCount](self, "itemCount"))
  {
    -[GKCollectionDataSource headerTextForSection:](self, "headerTextForSection:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDashboardSectionHeaderView platformSizeForTitle:withFont:](GKDashboardSectionHeaderView, "platformSizeForTitle:withFont:", v10, 0);
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didUnfocusItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "_gkFocusingLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "focusedIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v9);

    if (v8)
      objc_msgSend(v6, "setFocusedIndexPath:", 0);
  }

}

- (void)collectionView:(id)a3 didFocusItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "_gkFocusingLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "focusedIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v9);

    if ((v8 & 1) == 0)
      objc_msgSend(v6, "setFocusedIndexPath:", v9);
  }

}

- (BOOL)isValidAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[GKCollectionDataSource analyticsEvent](self, "analyticsEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKCollectionDataSource analyticsEvent](self, "analyticsEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[GKCollectionDataSource analyticsEventType](self, "analyticsEventType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[GKCollectionDataSource analyticsEventType](self, "analyticsEventType");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length") != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentationViewController);
}

- (void)setPresentationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentationViewController, a3);
}

- (BOOL)onDarkBackground
{
  return self->_onDarkBackground;
}

- (void)setOnDarkBackground:(BOOL)a3
{
  self->_onDarkBackground = a3;
}

- (BOOL)useStandardHeaders
{
  return self->_useStandardHeaders;
}

- (void)setUseStandardHeaders:(BOOL)a3
{
  self->_useStandardHeaders = a3;
}

- (NSString)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  self->_analyticsEvent = (NSString *)a3;
}

- (NSString)analyticsEventType
{
  return self->_analyticsEventType;
}

- (void)setAnalyticsEventType:(id)a3
{
  self->_analyticsEventType = (NSString *)a3;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (BOOL)breakSearchInputTextIntoMultipleTerms
{
  return self->_breakSearchInputTextIntoMultipleTerms;
}

- (void)setBreakSearchInputTextIntoMultipleTerms:(BOOL)a3
{
  self->_breakSearchInputTextIntoMultipleTerms = a3;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_destroyWeak((id *)&self->_presentationViewController);
}

@end
