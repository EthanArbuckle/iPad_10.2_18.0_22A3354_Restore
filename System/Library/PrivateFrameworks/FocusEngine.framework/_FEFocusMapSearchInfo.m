@implementation _FEFocusMapSearchInfo

- (_FEFocusMapSearchInfo)init
{
  _FEFocusMapSearchInfo *v2;
  NSMutableArray *v3;
  NSMutableArray *mutableSnapshots;
  NSMutableArray *v5;
  NSMutableArray *mutableDestinationRegions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_FEFocusMapSearchInfo;
  v2 = -[_FEFocusMapSearchInfo init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableSnapshots = v2->_mutableSnapshots;
    v2->_mutableSnapshots = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableDestinationRegions = v2->_mutableDestinationRegions;
    v2->_mutableDestinationRegions = v5;

    v2->_hasOnlyStaticContent = 1;
  }
  return v2;
}

- (NSArray)snapshots
{
  void *v2;
  void *v3;

  -[_FEFocusMapSearchInfo mutableSnapshots](self, "mutableSnapshots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)destinationRegions
{
  void *v2;
  void *v3;

  -[_FEFocusMapSearchInfo mutableDestinationRegions](self, "mutableDestinationRegions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addSnapshot:(id)a3
{
  void *v4;
  char v5;
  BOOL v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[_FEFocusMapSearchInfo mutableSnapshots](self, "mutableSnapshots");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    if (self->_hasOnlyStaticContent)
    {
      v5 = objc_msgSend(v7, "hasOnlyStaticContent");
      if (self->_hasOnlyStaticContent)
        v6 = v5;
      else
        v6 = 0;
      self->_hasOnlyStaticContent = v6;
    }
  }

}

- (void)addDestinationRegion:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[_FEFocusMapSearchInfo mutableDestinationRegions](self, "mutableDestinationRegions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (BOOL)didFindFocusBlockingBoundary
{
  return self->_didFindFocusBlockingBoundary;
}

- (void)setDidFindFocusBlockingBoundary:(BOOL)a3
{
  self->_didFindFocusBlockingBoundary = a3;
}

- (NSArray)linearSortedFocusItems
{
  return self->_linearSortedFocusItems;
}

- (void)setLinearSortedFocusItems:(id)a3
{
  objc_storeStrong((id *)&self->_linearSortedFocusItems, a3);
}

- (_FEFocusGroupMap)focusGroupMap
{
  return self->_focusGroupMap;
}

- (void)setFocusGroupMap:(id)a3
{
  objc_storeStrong((id *)&self->_focusGroupMap, a3);
}

- (BOOL)hasOnlyStaticContent
{
  return self->_hasOnlyStaticContent;
}

- (NSMutableArray)mutableSnapshots
{
  return self->_mutableSnapshots;
}

- (void)setMutableSnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSnapshots, a3);
}

- (NSMutableArray)mutableDestinationRegions
{
  return self->_mutableDestinationRegions;
}

- (void)setMutableDestinationRegions:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDestinationRegions, a3);
}

- (_FEFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_mutableDestinationRegions, 0);
  objc_storeStrong((id *)&self->_mutableSnapshots, 0);
  objc_storeStrong((id *)&self->_focusGroupMap, 0);
  objc_storeStrong((id *)&self->_linearSortedFocusItems, 0);
}

@end
