@implementation GKGridLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (GKGridLayout)init
{
  GKGridLayout *v2;
  uint64_t v3;
  NSPointerArray *sectionToMetricData;
  uint64_t v5;
  NSPointerArray *sectionToPresentationData;
  NSMutableDictionary *v7;
  NSMutableDictionary *keyToMetricData;
  NSMutableArray *v9;
  NSMutableArray *laidOutAttributes;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *laidOutPinnableAttributes;
  NSMutableIndexSet *v13;
  NSMutableIndexSet *sectionsWithPinnedHeaders;
  NSMutableDictionary *v15;
  NSMutableDictionary *indexPathToSupplementary;
  NSMutableDictionary *v17;
  NSMutableDictionary *indexPathToDecoration;
  NSMutableDictionary *v19;
  NSMutableDictionary *indexPathToItem;
  NSMutableDictionary *v21;
  NSMutableDictionary *oldIndexPathToSupplementary;
  NSMutableDictionary *v23;
  NSMutableDictionary *oldIndexPathToDecoration;
  NSMutableDictionary *v25;
  NSMutableDictionary *oldIndexPathToItem;
  NSMutableSet *v27;
  NSMutableSet *revealedIndexPaths;
  NSMutableDictionary *v29;
  NSMutableDictionary *indexPathToMetrics;
  NSMutableSet *v31;
  NSMutableSet *knownSupplementaryKinds;
  NSMutableDictionary *v33;
  NSMutableDictionary *oldSectionToMetricKeys;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)GKGridLayout;
  v2 = -[GKGridLayout init](&v36, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 0);
    sectionToMetricData = v2->_sectionToMetricData;
    v2->_sectionToMetricData = (NSPointerArray *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 0);
    sectionToPresentationData = v2->_sectionToPresentationData;
    v2->_sectionToPresentationData = (NSPointerArray *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyToMetricData = v2->_keyToMetricData;
    v2->_keyToMetricData = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    laidOutAttributes = v2->_laidOutAttributes;
    v2->_laidOutAttributes = v9;

    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    laidOutPinnableAttributes = v2->_laidOutPinnableAttributes;
    v2->_laidOutPinnableAttributes = v11;

    v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    sectionsWithPinnedHeaders = v2->_sectionsWithPinnedHeaders;
    v2->_sectionsWithPinnedHeaders = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indexPathToSupplementary = v2->_indexPathToSupplementary;
    v2->_indexPathToSupplementary = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indexPathToDecoration = v2->_indexPathToDecoration;
    v2->_indexPathToDecoration = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indexPathToItem = v2->_indexPathToItem;
    v2->_indexPathToItem = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    oldIndexPathToSupplementary = v2->_oldIndexPathToSupplementary;
    v2->_oldIndexPathToSupplementary = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    oldIndexPathToDecoration = v2->_oldIndexPathToDecoration;
    v2->_oldIndexPathToDecoration = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    oldIndexPathToItem = v2->_oldIndexPathToItem;
    v2->_oldIndexPathToItem = v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    revealedIndexPaths = v2->_revealedIndexPaths;
    v2->_revealedIndexPaths = v27;

    v2->_portraitInterleavedSectionsCount = 1;
    v2->_landscapeInterleavedSectionsCount = 1;
    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indexPathToMetrics = v2->_indexPathToMetrics;
    v2->_indexPathToMetrics = v29;

    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    knownSupplementaryKinds = v2->_knownSupplementaryKinds;
    v2->_knownSupplementaryKinds = v31;

    v2->_updateType = 6;
    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    oldSectionToMetricKeys = v2->_oldSectionToMetricKeys;
    v2->_oldSectionToMetricKeys = v33;

    v2->_bottomContentPadding = 21.0;
    v2->_shouldLayoutRTL = GKShouldLayoutRTL();
  }
  return v2;
}

- (double)scale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (CGRect)layoutBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[GKGridLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = GKShouldLayoutRTL();
  if (v4 < 0.0)
    v12 = v11;
  else
    v12 = 0;
  v13 = 0.0;
  if ((v12 & (v8 + v4 == 0.0)) == 0)
    v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setUpdateType:(unint64_t)a3
{
  unint64_t updateType;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  updateType = self->_updateType;
  if (updateType != a3)
  {
    if (updateType != 6 && a3 != 3 && a3 != 6)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_updateType);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("Multiple update types attempted for the same collection view update loop (%@ vs %@)"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (_updateType == GKGridLayoutUpdateInvalid || updateType == GKGridLayoutUpdateInvalid || updateType == GKGridLayoutUpdateRotation)\n[%s (%s:%d)]"), v11, "-[GKGridLayout setUpdateType:]", objc_msgSend(v13, "UTF8String"), 378);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
    }
    self->_updateType = a3;
  }
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  GKDataSourceMetrics *dataSourceMetrics;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  _gkTabStringForTabLevel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)GKGridLayout;
  -[GKGridLayout description](&v28, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@%@ {\n"), v5, v7);

  dataSourceMetrics = self->_dataSourceMetrics;
  if (dataSourceMetrics)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[GKDataSourceMetrics _gkDescriptionWithChildren:](dataSourceMetrics, "_gkDescriptionWithChildren:", a3 + 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("    %@dataSourceMetrics: {\n%@"), v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v11);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@    }\n"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v12);

  }
  -[GKGridLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "numberOfSections");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("    %@----------\n"), v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("    %@metricData: {\n"), v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v16);

    v17 = 0;
    v18 = a3 + 2;
    do
    {
      -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_gkDescriptionWithChildren:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layoutKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("        %@%@ - %@ - %@"), v5, v23, v24, v22);

      ++v17;
    }
    while (v14 != v17);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("    %@}\n"), v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v25);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@}\n"), v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v26);

  return v6;
}

- (id)metricDataForKey:(id)a3
{
  id v4;
  GKMetricData *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_keyToMetricData, "objectForKeyedSubscript:", v4);
  v5 = (GKMetricData *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(GKMetricData);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyToMetricData, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)metricDataForSection:(int64_t)a3
{
  unint64_t v4;
  NSUInteger v5;
  void *v6;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = a3 + 1;
  v5 = -[NSPointerArray count](self->_sectionToMetricData, "count");
  v6 = 0;
  if (v4 < v5)
  {
    -[NSPointerArray pointerAtIndex:](self->_sectionToMetricData, "pointerAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (unint64_t)filteredTotalItemCountForSection:(int64_t)a3
{
  NSSet *visibleIndexPathsFilter;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  visibleIndexPathsFilter = self->_visibleIndexPathsFilter;
  if (!visibleIndexPathsFilter)
    return -1;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = visibleIndexPathsFilter;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "section", (_QWORD)v12) == a3)
          ++v8;
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setMetricData:(id)a3 forSection:(int64_t)a4
{
  int64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setFilteredTotalItemCount:", -[GKGridLayout filteredTotalItemCountForSection:](self, "filteredTotalItemCountForSection:", a4));
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = a4 + 1;
  if ((int64_t)-[NSPointerArray count](self->_sectionToMetricData, "count") <= v6)
    -[NSPointerArray setCount:](self->_sectionToMetricData, "setCount:", v6 + 1);
  -[NSPointerArray replacePointerAtIndex:withPointer:](self->_sectionToMetricData, "replacePointerAtIndex:withPointer:", v6, v7);

}

- (id)attributesForSupplementaryIndexPath:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToSupplementary, "objectForKeyedSubscript:", a3);
}

- (void)setPortraitInterleavedSectionsCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (portraitInterleavedSectionsCount > 0)\n[%s (%s:%d)]"), v6, "-[GKGridLayout setPortraitInterleavedSectionsCount:]", objc_msgSend(v8, "UTF8String"), 472);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  self->_portraitInterleavedSectionsCount = a3;
}

- (void)setLandscapeInterleavedSectionsCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (landscapeInterleavedSectionsCount > 0)\n[%s (%s:%d)]"), v6, "-[GKGridLayout setLandscapeInterleavedSectionsCount:]", objc_msgSend(v8, "UTF8String"), 478);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  self->_landscapeInterleavedSectionsCount = a3;
}

- (GKSectionMetrics)defaultSectionMetricsInternal
{
  GKSectionMetrics *defaultSectionMetricsInternal;
  void *v4;

  defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  if (!defaultSectionMetricsInternal)
  {
    +[GKGridLayoutMetrics metrics](GKSectionMetrics, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGridLayout setDefaultSectionMetricsInternal:](self, "setDefaultSectionMetricsInternal:", v4);

    defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  }
  return defaultSectionMetricsInternal;
}

- (id)metricsForSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)searchResultsCount
{
  NSSet *visibleIndexPathsFilter;

  visibleIndexPathsFilter = self->_visibleIndexPathsFilter;
  if (visibleIndexPathsFilter)
    return -[NSSet count](visibleIndexPathsFilter, "count");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)updatePlaceholderVisibility
{
  BOOL v3;

  v3 = self->_showPlaceholder || -[GKGridLayout searchResultsCount](self, "searchResultsCount") == 0;
  self->_displayingOverlay = v3;
}

- (void)setVisibleIndexPathsFilter:(id)a3
{
  NSSet *v5;
  NSSet *v6;
  char v7;
  NSSet *v8;

  v5 = (NSSet *)a3;
  v6 = v5;
  if (self->_visibleIndexPathsFilter != v5)
  {
    v8 = v5;
    v7 = -[NSSet isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_visibleIndexPathsFilter, a3);
      -[GKGridLayout updatePlaceholderVisibility](self, "updatePlaceholderVisibility");
      -[GKGridLayout invalidateLayout](self, "invalidateLayout");
      v6 = v8;
    }
  }

}

- (void)setLeftLayoutGuideOffset:(double)a3
{
  if (self->_leftLayoutGuideOffset != a3)
  {
    self->_leftLayoutGuideOffset = a3;
    -[GKGridLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setRightLayoutGuideOffset:(double)a3
{
  if (self->_rightLayoutGuideOffset != a3)
  {
    self->_rightLayoutGuideOffset = a3;
    -[GKGridLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setShowPlaceholder:(BOOL)a3
{
  GKGridLayoutInvalidationContext *v4;

  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    -[GKGridLayout updatePlaceholderVisibility](self, "updatePlaceholderVisibility");
    v4 = objc_alloc_init(GKGridLayoutInvalidationContext);
    -[GKGridLayoutInvalidationContext setInvalidatePlaceholderVisibility:](v4, "setInvalidatePlaceholderVisibility:", 1);
    -[GKGridLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (CGSize)_sizeAdjustedForTabBarSettingsBasedOnSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double hiddenSearchBarOffset;
  double v14;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v7 = v6;
  -[GKGridLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v10 = v9;
  v12 = v11;

  hiddenSearchBarOffset = self->_hiddenSearchBarOffset;
  if (hiddenSearchBarOffset < self->_segmentedHeaderPinningOffset)
    hiddenSearchBarOffset = self->_segmentedHeaderPinningOffset;
  v14 = v7 - v10 - v12 + hiddenSearchBarOffset;
  if (height + self->_bottomContentPadding >= v14 || self->_ignoreBoundsForSizeCalculation)
    v14 = height + self->_bottomContentPadding;
  v16 = width;
  result.height = v14;
  result.width = v16;
  return result;
}

- (void)calculateCollectionViewContentSize
{
  CGFloat *v3;
  double height;
  double width;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat x;
  CGFloat y;
  uint64_t v11;
  uint64_t i;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = (CGFloat *)MEMORY[0x1E0C9D648];
  v25 = *MEMORY[0x1E0C80C00];
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_laidOutAttributes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    x = *v3;
    y = v3[1];
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isHidden", (_QWORD)v20) & 1) == 0)
        {
          objc_msgSend(v13, "frame");
          v28.origin.x = v14;
          v28.origin.y = v15;
          v28.size.width = v16;
          v28.size.height = v17;
          v26.origin.x = x;
          v26.origin.y = y;
          v26.size.width = width;
          v26.size.height = height;
          v27 = CGRectUnion(v26, v28);
          x = v27.origin.x;
          y = v27.origin.y;
          width = v27.size.width;
          height = v27.size.height;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  self->_oldLaidOutContentSize = self->_laidOutContentSize;
  self->_minimumLaidOutContentSize.width = width;
  self->_minimumLaidOutContentSize.height = height;
  -[GKGridLayout _sizeAdjustedForTabBarSettingsBasedOnSize:](self, "_sizeAdjustedForTabBarSettingsBasedOnSize:", width, height);
  self->_laidOutContentSize.width = v18;
  self->_laidOutContentSize.height = v19;
}

- (CGSize)collectionViewContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_laidOutContentSize.width;
  height = self->_laidOutContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result
{
  CGFloat x;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  x = result.x;
  if (self->_hideSearchBarOnAppear || self->_hideAboveSegmentOnAppear)
  {
    -[GKGridLayout layoutBounds](self, "layoutBounds", result.x, result.y);
    v6 = v5;
    -[GKGridLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentInset");
    v9 = v8;

    v10 = v6;
    if (self->_hideSearchBarOnAppear)
      v10 = self->_hiddenSearchBarOffset - v9;
    v11 = v6;
    if (self->_hideAboveSegmentOnAppear)
      v11 = self->_segmentedHeaderPinningOffset - v9;
    if (v10 < v11)
      v10 = v11;
    if (v10 >= v6)
      result.y = v10;
    else
      result.y = v6;
  }
  v12 = x;
  result.x = v12;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result withScrollingVelocity:(CGPoint)a4
{
  self->_hideSearchBarOnAppear = 0;
  self->_hideAboveSegmentOnAppear = 0;
  return result;
}

- (void)refreshMetrics
{
  void *v3;
  void *v4;
  id v5;

  -[GKGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!self->_metricsInvalidationCount)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      ++self->_metricsInvalidationCount;
      objc_msgSend(v5, "createMetricsTreeWithGridLayout:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKGridLayout setDataSourceMetrics:](self, "setDataSourceMetrics:", v4);
      --self->_metricsInvalidationCount;

    }
  }

}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  int v8;
  int v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "invalidateDataSourceCounts");
  v6 = objc_msgSend(v4, "invalidateEverything");
  v7 = objc_msgSend(v4, "invalidateBoundsChange");
  v8 = objc_msgSend(v4, "invalidatePlaceholderVisibility");
  v9 = objc_msgSend(v4, "invalidatePinnableAreas");
  if ((v5 & 1) == 0 && (v6 & 1) == 0 && (v7 & 1) == 0 && (v8 & 1) == 0 && !v9)
  {
    v10 = 0xFFFFFFFFFFFFLL;
LABEL_16:
    self->_invalidationFlags |= v10;
    goto LABEL_17;
  }
  if (v5)
  {
    self->_invalidationFlags |= 0xFFFFFFFFFFFFuLL;
    if (!v6)
    {
LABEL_9:
      if (!v8)
        goto LABEL_10;
LABEL_14:
      self->_invalidationFlags |= 4uLL;
      if (!v9)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  else if (!v6)
  {
    goto LABEL_9;
  }
  self->_invalidationFlags |= 0xFFFFFFFFFFFFuLL;
  if (v8)
    goto LABEL_14;
LABEL_10:
  if (v9)
  {
LABEL_15:
    v10 = 8;
    goto LABEL_16;
  }
LABEL_17:
  v11.receiver = self;
  v11.super_class = (Class)GKGridLayout;
  -[GKGridLayout invalidateLayoutWithContext:](&v11, sel_invalidateLayoutWithContext_, v4);

  if ((self->_invalidationFlags & 5) != 0)
    -[GKGridLayout refreshMetrics](self, "refreshMetrics");
}

- (void)updatePinnableAreas
{
  GKGridLayoutInvalidationContext *v3;

  -[GKGridLayout _filterPinnedAttributes](self, "_filterPinnedAttributes");
  v3 = objc_alloc_init(GKGridLayoutInvalidationContext);
  -[GKGridLayoutInvalidationContext setInvalidatePinnableAreas:](v3, "setInvalidatePinnableAreas:", 1);
  -[GKGridLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)enableClipView
{
  self->_displayClipView = 1;
  -[UICollectionViewLayoutAttributes setHidden:](self->_clipViewAttributes, "setHidden:", 0);
}

- (void)disableClipView
{
  self->_displayClipView = 0;
  -[UICollectionViewLayoutAttributes setHidden:](self->_clipViewAttributes, "setHidden:", 1);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)shouldUpdateVisibleCellLayoutAttributes
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  if (v9 != width || v8 != height)
    self->_invalidationFlags |= 2uLL;
  v13.receiver = self;
  v13.super_class = (Class)GKGridLayout;
  -[GKGridLayout invalidationContextForBoundsChange:](&v13, sel_invalidationContextForBoundsChange_, x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInvalidateBoundsChange:", 1);
  return v11;
}

- (void)forceFullInvalidate
{
  id v2;

  self->_invalidationFlags |= 0xFFFFFFFFFFFFuLL;
  -[GKGridLayout collectionView](self, "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (double)calculatedBottomPaddingForSection:(int64_t)a3
{
  double v3;
  void *v6;
  double v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;

  v3 = 0.0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GKGridLayout metricsForSection:](self, "metricsForSection:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "padding");
    v3 = v7;
    if (objc_msgSend(v6, "incrementalRevealConsumesPadding"))
    {
      objc_msgSend(v6, "listForLocation:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[GKGridLayout indexOfSupplementaryMetricsOfKind:inList:](self, "indexOfSupplementaryMetricsOfKind:inList:", CFSTR("IncrementalReveal"), v8);
      -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKGridLayout collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "numberOfItemsInSection:", a3);

      v13 = objc_msgSend(v10, "filteredTotalItemCount");
      if (v12 >= v13)
        v12 = v13;
      if (v12 > objc_msgSend(v10, "currentMaxVisibleItemCount")
        && objc_msgSend(v6, "incrementalRevealItemCount")
        && v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "desiredHeight");
        v3 = (double)((int)(v3 - v15) & ~((int)(v3 - v15) >> 31));

      }
    }

  }
  return v3;
}

- (void)updatePresentationDataForLastInterleavedSections
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  void *v12;

  v3 = -[GKGridLayout sectionsPerRow](self, "sectionsPerRow");
  -[GKGridLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  if (v3)
  {
    v6 = v5 - 1;
    v7 = 0.0;
    v8 = v6;
    v9 = v3;
    do
    {
      -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "maxY");
      if (v7 < v11)
        v7 = v11;

      --v8;
      --v9;
    }
    while (v9);
    do
    {
      -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMaxY:", v7);

      --v6;
      --v3;
    }
    while (v3);
  }
}

- (void)updatePresentationDataInSection:(int64_t)a3 withAttributes:(id)a4 supplementaryLocation:(unint64_t)a5
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a4;
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v14)
  {
    objc_msgSend(v8, "updateWithLayoutAttributes:supplementaryLocation:", v14, a5);
  }
  else if (a3 != 0x7FFFFFFFFFFFFFFFLL && a5)
  {
    -[GKGridLayout calculatedBottomPaddingForSection:](self, "calculatedBottomPaddingForSection:", a3);
    v11 = v10;
    objc_msgSend(v9, "showMoreMaxY");
    objc_msgSend(v9, "setShowMoreMaxY:", v11 + v12);
    objc_msgSend(v9, "maxY");
    objc_msgSend(v9, "setMaxY:", v11 + v13);
  }

}

- (void)finalizeGlobalPresentationDataWithSectionRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  length = a3.length;
  location = a3.location;
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", 0x7FFFFFFFFFFFFFFFLL);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", location);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", length + location - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "numItems"))
  {
    objc_msgSend(v6, "showMoreMaxY");
    objc_msgSend(v11, "setItemsMinY:");
    objc_msgSend(v7, "minY");
    objc_msgSend(v11, "setItemsMaxY:");
  }
  if (!objc_msgSend(v11, "numFooters"))
  {
    objc_msgSend(v7, "showMoreMaxY");
    objc_msgSend(v11, "setItemsMaxY:");
    objc_msgSend(v11, "itemsMaxY");
    objc_msgSend(v11, "setFooterMinY:");
    objc_msgSend(v11, "itemsMaxY");
    objc_msgSend(v11, "setFooterMaxY:");
    objc_msgSend(v11, "itemsMaxY");
    objc_msgSend(v11, "setShowMoreMaxY:");
  }
  if (self->_segmentedHeaderPinningOffset != 0.0)
  {
    -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", 0x7FFFFFFFFFFFFFFFLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerMaxY");
    self->_segmentedHeaderPinningOffset = v9;
    objc_msgSend(v8, "headerPinnableAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__GKGridLayout_finalizeGlobalPresentationDataWithSectionRange___block_invoke;
    v12[3] = &unk_1E59C4E48;
    v12[4] = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  }
}

uint64_t __63__GKGridLayout_finalizeGlobalPresentationDataWithSectionRange___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;
  double v6;

  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 552);
  result = objc_msgSend(a2, "frame");
  if (v3 <= v5)
    v6 = v3;
  else
    v6 = v5;
  *(double *)(*(_QWORD *)(a1 + 32) + 552) = v6;
  return result;
}

- (id)_existingPresentationDataForSection:(int64_t)a3
{
  int64_t v4;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = a3 + 1;
  if ((int64_t)-[NSPointerArray count](self->_sectionToPresentationData, "count") <= v4)
    -[NSPointerArray setCount:](self->_sectionToPresentationData, "setCount:", v4 + 1);
  return -[NSPointerArray pointerAtIndex:](self->_sectionToPresentationData, "pointerAtIndex:", v4);
}

- (id)presentationDataForSection:(int64_t)a3
{
  GKSectionPresentationData *v5;
  void *v6;
  int64_t v7;
  int64_t v8;

  -[GKGridLayout _existingPresentationDataForSection:](self, "_existingPresentationDataForSection:");
  v5 = (GKSectionPresentationData *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      if (a3)
        v7 = a3 - 1;
      else
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      -[GKGridLayout _existingPresentationDataForSection:](self, "_existingPresentationDataForSection:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = -[GKSectionPresentationData initWithSection:presentationData:]([GKSectionPresentationData alloc], "initWithSection:presentationData:", a3, v6);
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = a3 + 1;
    -[NSPointerArray replacePointerAtIndex:withPointer:](self->_sectionToPresentationData, "replacePointerAtIndex:withPointer:", v8, v5);

  }
  return v5;
}

- (BOOL)_areWePortrait
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v2, "statusBarOrientation") - 1) < 2;

  return v3;
}

- (unint64_t)sectionsPerRow
{
  _BOOL4 v3;
  int *v4;

  v3 = -[GKGridLayout _areWePortrait](self, "_areWePortrait");
  v4 = &OBJC_IVAR___GKGridLayout__landscapeInterleavedSectionsCount;
  if (v3)
    v4 = &OBJC_IVAR___GKGridLayout__portraitInterleavedSectionsCount;
  return *(unint64_t *)((char *)&self->super.super.isa + *v4);
}

- (double)yOffsetForSection:(int64_t)a3
{
  double v3;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;

  v3 = 0.0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[GKGridLayout sectionsPerRow](self, "sectionsPerRow");
    if (a3 >= v6)
      v7 = a3 - v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxY");
    v3 = fmax(v9, 0.0);

  }
  return v3;
}

- (void)enumerateSectionsIndexesOverlappingYOffset:(double)a3 block:(id)a4
{
  NSUInteger v6;
  NSUInteger v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void (**v14)(id, uint64_t);

  v14 = (void (**)(id, uint64_t))a4;
  v6 = -[NSPointerArray count](self->_sectionToPresentationData, "count");
  if (v6 >= 2)
  {
    v7 = v6;
    for (i = 1; i != v7; ++i)
    {
      -[NSPointerArray pointerAtIndex:](self->_sectionToPresentationData, "pointerAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "minY");
      if (v10 <= a3 && (objc_msgSend(v9, "maxY"), v11 >= a3)
        || (-[GKGridLayout sectionsWithPinnedHeaders](self, "sectionsWithPinnedHeaders"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "containsIndex:", i),
            v12,
            v13))
      {
        v14[2](v14, i - 1);
      }

    }
  }

}

- (int64_t)indexOfSupplementaryMetricsOfKind:(id)a3 inList:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "kind");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v5);

      if ((v12 & 1) != 0)
        break;
      if (v8 == ++v9)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (int64_t)_prepareSupplementaryLayoutForSection:(int64_t)a3 atLocation:(unint64_t)a4 offset:(int64_t)a5 globalOffset:(int64_t *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  GKDataSourceMetrics *dataSourceMetrics;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double v34;
  unint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  unint64_t v41;
  _BOOL4 v42;
  _BOOL4 v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  int v49;
  void *v50;
  _BOOL4 v51;
  unsigned int v52;
  uint64_t v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  char v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  double MaxX;
  double v69;
  double v70;
  uint64_t v71;
  double v72;
  NSMutableDictionary *indexPathToSupplementary;
  void *v74;
  NSMutableSet *knownSupplementaryKinds;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  BOOL v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  NSMutableDictionary *v97;
  void *v98;
  NSMutableDictionary *v99;
  void *v101;
  GKDataSourceMetrics *v102;
  char v103;
  void *v104;
  double v105;
  double v106;
  unint64_t v107;
  unint64_t v108;
  _BOOL4 v109;
  unint64_t v110;
  void *v111;
  _BOOL4 v112;
  _BOOL4 v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  double v119;
  double v120;
  double v121;
  unint64_t v122;
  void *v123;
  void *v124;
  unint64_t v126;
  void *v127;
  void *v128;
  GKDataSourceMetrics *v130;
  _QWORD v131[3];
  CGRect v132;

  v131[1] = *MEMORY[0x1E0C80C00];
  -[GKGridLayout collectionView](self, "collectionView");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4)
  {
    if (a4 != 1)
      goto LABEL_6;
    objc_msgSend(v9, "footerPinnableAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "headerPinnableAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(v11, "removeAllObjects");

LABEL_6:
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0.0;
    v119 = -0.0;
  }
  else
  {
    -[GKGridLayoutMetrics supplementaryMetricsForKey:](self->_dataSourceMetrics, "supplementaryMetricsForKey:", CFSTR("SegmentedBoxMetricKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = 40.0;
    else
      v14 = 0.0;
    v119 = v14;
  }
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v117 = v16;
  v118 = v15;
  v121 = v17;
  v116 = v18;
  objc_msgSend(v128, "dataSource");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v130 = 0;
    dataSourceMetrics = self->_dataSourceMetrics;
  }
  else
  {
    -[GKGridLayout metricsForSection:](self, "metricsForSection:", a3);
    v130 = (GKDataSourceMetrics *)objc_claimAutoreleasedReturnValue();
    dataSourceMetrics = v130;
  }
  v102 = dataSourceMetrics;
  -[GKGridLayoutMetrics listForLocation:](v102, "listForLocation:", a4);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v10, "filteredTotalItemCount");
    v126 = 0;
    v115 = 0;
    v122 = 0;
  }
  else
  {
    v20 = objc_msgSend(v128, "numberOfItemsInSection:", a3);
    v21 = objc_msgSend(v10, "filteredTotalItemCount");
    v115 = v20;
    if (v20 >= v21)
      v20 = v21;
    v22 = objc_msgSend(v10, "currentMaxVisibleItemCount");
    v126 = v20;
    if (v20 >= v22)
      v23 = v22;
    else
      v23 = v20;
    v122 = v23;
  }
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
    v110 = -[GKGridLayout indexOfSupplementaryMetricsOfKind:inList:](self, "indexOfSupplementaryMetricsOfKind:inList:", CFSTR("IncrementalReveal"), v127);
  else
    v110 = 0x7FFFFFFFFFFFFFFFLL;
  if (v126 == v122 || a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v109 = 0;
    if (a4)
    {
LABEL_31:
      objc_msgSend(v24, "itemsMaxY");
      goto LABEL_34;
    }
  }
  else
  {
    v109 = -[GKDataSourceMetrics incrementalRevealItemCount](v130, "incrementalRevealItemCount") != 0;
    if (a4)
      goto LABEL_31;
  }
  -[GKGridLayout yOffsetForSection:](self, "yOffsetForSection:", a3);
LABEL_34:
  v27 = v26;
  -[GKGridLayout leftLayoutGuideOffset](self, "leftLayoutGuideOffset");
  v29 = v28;
  -[GKGridLayout rightLayoutGuideOffset](self, "rightLayoutGuideOffset");
  v31 = v30;
  v32 = GKShouldLayoutRTL();
  if (v32)
    v33 = v29;
  else
    v33 = v31;
  if (v32)
    v34 = v31;
  else
    v34 = v29;
  v120 = v34;
  v35 = -[GKGridLayout sectionsPerRow](self, "sectionsPerRow");
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GKDataSourceMetrics marginBetweenItems](v130, "marginBetweenItems");
    if (a3 % v35)
    {
      v37 = v36 * 0.5;
      v120 = v37;
      if (a3 % v35 != v35 - 1)
        v33 = v37;
    }
    else
    {
      v33 = v36 * 0.5;
    }
  }
  v101 = v24;
  v124 = v10;
  v38 = objc_msgSend(v127, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout scale](self, "scale");
  v40 = v39;
  v114 = v38;
  if (v38)
  {
    v107 = a3 / v35;
    v108 = v35;
    v103 = 0;
    v111 = 0;
    v41 = 0;
    v42 = a3 != 0x7FFFFFFFFFFFFFFFLL;
    if (v126)
      v43 = 0;
    else
      v43 = a3 != 0x7FFFFFFFFFFFFFFFLL;
    if (v35 <= 1)
      v42 = 0;
    v112 = v42;
    v113 = v43;
    v105 = (v121 + v14 * 2.0) / (double)v35;
    v106 = (double)v35;
    do
    {
      objc_msgSend(v127, "objectAtIndexedSubscript:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sizeForCollectionView:", v128);
      v46 = v45;
      v48 = v47;
      v49 = objc_msgSend(v44, "isHidden");
      if (v113)
      {
        if (-[GKDataSourceMetrics shouldShowSectionHeadersWhenNoItems](v130, "shouldShowSectionHeadersWhenNoItems"))
        {
          objc_msgSend(v44, "kind");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v50, "isEqualToString:", CFSTR("SectionHeader")))
            v51 = -[GKGridLayout sectionsPerRow](self, "sectionsPerRow") == 1;
          else
            v51 = 1;

        }
        else
        {
          v51 = 1;
        }
      }
      else
      {
        v51 = 0;
      }
      v52 = v51 | v49;
      if (v48 == 0.0)
        v52 = 1;
      if (v46 == 0.0)
        v53 = 1;
      else
        v53 = v52;
      objc_msgSend(v44, "kind");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "isEqualToString:", CFSTR("IncrementalReveal")))
      {
        v55 = -[GKDataSourceMetrics shouldAlwaysIncludeShowMore](v130, "shouldAlwaysIncludeShowMore");

        v53 = v53 | (v55 | v109) ^ 1;
      }
      else
      {

      }
      if (objc_msgSend(v44, "shouldUseGlobalIndexing") && a6)
      {
        if (!v111)
        {
          -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", 0x7FFFFFFFFFFFFFFFLL);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v56 = *a6++;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:");
        else
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        ++a5;
      }
      if (self->_displayingOverlay)
      {
        if ((unint64_t)objc_msgSend(v57, "length") > 1)
          v53 = 1;
        else
          v53 = v53;
      }
      objc_msgSend(v44, "kind");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](GKCollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v58, v57);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 == 1)
      {
        v60 = v110 == 0x7FFFFFFFFFFFFFFFLL || v41 > v110;
        v61 = v60 ? v53 : 1;
        if ((v61 & 1) == 0)
        {
          -[GKGridLayout calculatedBottomPaddingForSection:](self, "calculatedBottomPaddingForSection:", a3);
          v27 = v27 + v62;
          v103 = 1;
        }
      }
      v63 = v118;
      v64 = v121;
      if (v112)
      {
        v64 = v105;
        v46 = (v46 + v14 * 2.0) / v106;
        v63 = (v46 + v14 * -2.0) * (double)(a3 - v107 * v108);
      }
      v65 = round(v63 + (v64 - v46) * 0.5);
      v67 = v116;
      v66 = v117;
      MaxX = CGRectGetMaxX(*(CGRect *)&v63);
      v132.origin.x = v65;
      v132.origin.y = v27;
      v132.size.width = v46;
      v132.size.height = v48;
      if (CGRectGetMaxX(v132) <= MaxX)
        v69 = v46;
      else
        v69 = MaxX - v65;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        v70 = v69;
      else
        v70 = v69 + v14 * -2.0;
      objc_msgSend(v59, "setFrame:", floor(v40 * (v119 + v65)) / v40, floor(v40 * v27) / v40, floor(v40 * v70) / v40, floor(v40 * v48) / v40);
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v44, "shouldPin"))
          v71 = 0x7FFFFFFFFFFFFFFELL;
        else
          v71 = 0x7FFFFFFFFFFFF82ELL;
      }
      else
      {
        v71 = 1;
      }
      objc_msgSend(v59, "setZIndex:", v71);
      objc_msgSend(v59, "setDataSource:", v123);
      objc_msgSend(v59, "setSectionMetrics:", v130);
      objc_msgSend(v59, "setSupplementaryMetrics:", v44);
      objc_msgSend(v59, "setAllSectionItemsVisible:", v126 == v122);
      objc_msgSend(v59, "setUnpinnedY:", v27);
      objc_msgSend(v59, "setCurrentTotalItemCount:", v126);
      objc_msgSend(v59, "setMaxTotalItemCount:", v115);
      objc_msgSend(v59, "setCurrentVisibleItemCount:", objc_msgSend(v124, "currentMaxVisibleItemCount"));
      objc_msgSend(v59, "setGridLayoutLocation:", a4);
      objc_msgSend(v59, "setLeadingMargin:", v120);
      objc_msgSend(v59, "setTrailingMargin:", v33);
      objc_msgSend(v59, "setHidden:", v53);
      v72 = 1.0;
      if ((_DWORD)v53)
        v72 = 0.0;
      objc_msgSend(v59, "setAlpha:", v72);
      indexPathToSupplementary = self->_indexPathToSupplementary;
      objc_msgSend(v59, "indexPath");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](indexPathToSupplementary, "setObject:forKeyedSubscript:", v59, v74);

      -[NSMutableArray addObject:](self->_laidOutAttributes, "addObject:", v59);
      knownSupplementaryKinds = self->_knownSupplementaryKinds;
      objc_msgSend(v44, "kind");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](knownSupplementaryKinds, "addObject:", v76);

      if (((objc_msgSend(v44, "shouldPinGlobal") ^ 1 | v53) & 1) != 0)
      {
        if (((objc_msgSend(v44, "shouldPin") ^ 1 | v53) & 1) == 0)
        {
          if (a3 == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v59, "setIsPartOfGlobalPinningGroup:", 1);
          objc_msgSend(v104, "addObject:", v59);
          -[NSMutableOrderedSet addObject:](self->_laidOutPinnableAttributes, "addObject:", v59);
        }
      }
      else
      {
        objc_msgSend(v59, "setIsPartOfGlobalPinningGroup:", 1);
        -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", 0x7FFFFFFFFFFFFFFFLL);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v131[0] = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "addAttributes:forLocation:", v78, a4);

        -[NSMutableOrderedSet addObject:](self->_laidOutPinnableAttributes, "addObject:", v59);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_indexPathToMetrics, "setObject:forKeyedSubscript:", v44, v57);
      if ((v53 & 1) == 0)
      {
        -[GKGridLayout updatePresentationDataInSection:withAttributes:supplementaryLocation:](self, "updatePresentationDataInSection:withAttributes:supplementaryLocation:", a3, v59, a4);
        objc_msgSend(v59, "frame");
        v27 = v27 + v79;
      }
      objc_msgSend(v44, "kind");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("SearchBar"));

      if (!a4 && (v81 & ~(_DWORD)v53 & (a3 == 0x7FFFFFFFFFFFFFFFLL)) != 0 && self->_hiddenSearchBarOffset == 0.0)
        self->_hiddenSearchBarOffset = v27;

      ++v41;
    }
    while (v114 != v41);
  }
  else
  {
    v111 = 0;
    v103 = 0;
  }
  v82 = v104;
  v83 = v124;
  if (objc_msgSend(v104, "count"))
    objc_msgSend(v124, "addAttributes:forLocation:", v104, a4);
  if ((a4 != 1) | v103 & 1)
  {
    v84 = a3 != 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
      v84 = 1;
    if (!v84)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](GKCollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("ClipArea"), v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v86, "setZIndex:", 0x7FFFFFFFFFFFFFFFLL);
      v87 = *MEMORY[0x1E0C9D538];
      v88 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[GKGridLayout collectionView](self, "collectionView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "bounds");
      v91 = v90;
      -[GKGridLayout collectionView](self, "collectionView");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "contentOffset");
      v94 = v93;
      -[GKGridLayout collectionView](self, "collectionView");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "contentInset");
      objc_msgSend(v86, "setFrame:", floor(v40 * v87) / v40, floor(v40 * v88) / v40, floor(v40 * v91) / v40, floor(v40 * (v94 + v96)) / v40);

      objc_msgSend(v86, "setHidden:", !self->_displayClipView);
      -[NSMutableArray addObject:](self->_laidOutAttributes, "addObject:", v86);
      v97 = self->_indexPathToSupplementary;
      objc_msgSend(v86, "indexPath");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v97;
      v82 = v104;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v99, "setObject:forKeyedSubscript:", v86, v98);

      -[GKGridLayout setClipViewAttributes:](self, "setClipViewAttributes:", v86);
      ++a5;
      v83 = v124;
    }
  }
  else
  {
    -[GKGridLayout updatePresentationDataInSection:withAttributes:supplementaryLocation:](self, "updatePresentationDataInSection:withAttributes:supplementaryLocation:", a3, 0, 1);
  }

  return a5;
}

- (int64_t)_prepareOverlayLayoutForSection:(int64_t)a3 offset:(int64_t)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  GKDataSourceMetrics *dataSourceMetrics;
  GKDataSourceMetrics *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  int64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSMutableDictionary *indexPathToSupplementary;
  void *v46;
  NSMutableSet *knownSupplementaryKinds;
  void *v48;
  void *v50;
  GKDataSourceMetrics *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  GKDataSourceMetrics *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  -[GKGridLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", a3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v9 = v8;
  -[GKGridLayout scale](self, "scale");
  v11 = v10;
  objc_msgSend(v7, "contentInset");
  v13 = v12;
  v15 = v14;
  v57 = v7;
  objc_msgSend(v7, "dataSource");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v55 = 0;
    dataSourceMetrics = self->_dataSourceMetrics;
  }
  else
  {
    -[GKGridLayout metricsForSection:](self, "metricsForSection:", a3);
    v55 = (GKDataSourceMetrics *)objc_claimAutoreleasedReturnValue();
    dataSourceMetrics = v55;
  }
  v17 = dataSourceMetrics;
  -[GKGridLayoutMetrics listForLocation:](v17, "listForLocation:", 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v18 = 0;
  else
    v18 = objc_msgSend(v57, "numberOfItemsInSection:", a3);
  v19 = objc_msgSend(v59, "filteredTotalItemCount");
  if (v18 >= v19)
    v20 = v19;
  else
    v20 = v18;
  v54 = v20;
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "headerMaxY");
  v23 = v22;
  v53 = objc_msgSend(v58, "count");
  if (v53)
  {
    v50 = v21;
    v51 = v17;
    v52 = v18;
    v24 = 0;
    if (v9 - (v13 + v15) - v23 >= 200.0)
      v25 = v9 - (v13 + v15) - v23;
    else
      v25 = 200.0;
    v26 = a4;
    do
    {
      objc_msgSend(v58, "objectAtIndexedSubscript:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sizeForCollectionView:", v57);
      v29 = v28 == 0.0 || v25 == 0.0;
      if (v25 > 0.0 && v28 > 0.0)
      {
        if (self->_displayingOverlay)
          v29 = v29;
        else
          v29 = 1;
        if (self->_showPlaceholder
          && (objc_msgSend(v27, "kind"),
              v30 = (void *)objc_claimAutoreleasedReturnValue(),
              v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("SearchPlaceholderMetricKey")),
              v30,
              !v31))
        {
          v29 = 0;
        }
        else
        {
          objc_msgSend(v27, "kind");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("SearchPlaceholderMetricKey"));

          if (v33)
            v29 = self->_showPlaceholder || -[GKGridLayout searchResultsCount](self, "searchResultsCount") != 0;
        }
      }
      v34 = a4 + v24;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0x7FFFFFFFFFFFFFFELL;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v34, a3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 1;
      }
      objc_msgSend(v27, "kind");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](GKCollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v37, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      UIRectCenteredXInRect();
      v40 = v39;
      objc_msgSend(v38, "setFrame:", floor(v11 * v41) / v11, floor(v11 * v39) / v11, floor(v11 * v42) / v11, floor(v11 * v43) / v11);
      objc_msgSend(v38, "setZIndex:", v36);
      objc_msgSend(v38, "setDataSource:", v56);
      objc_msgSend(v38, "setSectionMetrics:", v55);
      objc_msgSend(v38, "setSupplementaryMetrics:", v27);
      objc_msgSend(v38, "setAllSectionItemsVisible:", 1);
      objc_msgSend(v38, "setUnpinnedY:", v40);
      objc_msgSend(v38, "setCurrentTotalItemCount:", v54);
      objc_msgSend(v38, "setMaxTotalItemCount:", v52);
      objc_msgSend(v38, "setCurrentVisibleItemCount:", objc_msgSend(v59, "currentMaxVisibleItemCount"));
      objc_msgSend(v38, "setGridLayoutLocation:", 2);
      objc_msgSend(v38, "setHidden:", v29);
      v44 = 1.0;
      if ((_DWORD)v29)
        v44 = 0.0;
      objc_msgSend(v38, "setAlpha:", v44);
      indexPathToSupplementary = self->_indexPathToSupplementary;
      objc_msgSend(v38, "indexPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](indexPathToSupplementary, "setObject:forKeyedSubscript:", v38, v46);

      -[NSMutableArray addObject:](self->_laidOutAttributes, "addObject:", v38);
      knownSupplementaryKinds = self->_knownSupplementaryKinds;
      objc_msgSend(v27, "kind");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](knownSupplementaryKinds, "addObject:", v48);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_indexPathToMetrics, "setObject:forKeyedSubscript:", v27, v35);
      ++v24;
      a4 = v26;
    }
    while (v53 != v24);
    a4 = v26 + v24;
    v21 = v50;
    v17 = v51;
  }

  return a4;
}

- (void)_prepareSegmentedBoxLayoutWithOffset:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double x;
  double y;
  double width;
  double height;
  double v24;
  NSMutableDictionary *indexPathToSupplementary;
  void *v26;
  NSMutableSet *knownSupplementaryKinds;
  void *v28;
  void *v29;
  int64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  NSMutableDictionary *v51;
  void *v52;
  NSMutableSet *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  id v57;
  CGRect v58;

  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self->_dataSourceMetrics, "supplementaryMetricsForKey:", CFSTR("SegmentedBoxMetricKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v57 = v5;
    -[GKGridLayout collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGridLayout scale](self, "scale");
    v8 = v7;
    -[GKGridLayout layoutBounds](self, "layoutBounds");
    v10 = v9;
    objc_msgSend(v6, "contentInset");
    v13 = v10 - (v11 + v12);
    objc_msgSend(v6, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13 == 0.0 || self->_laidOutContentSize.height == 0.0;
    -[GKGridLayoutMetrics supplementaryMetricsForKey:](self->_dataSourceMetrics, "supplementaryMetricsForKey:", CFSTR("SegmentedControlMetricKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "desiredHeight");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "kind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](GKCollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    UIRectCenteredXInRect();
    x = v58.origin.x;
    y = v58.origin.y;
    width = v58.size.width;
    height = v58.size.height;
    CGRectGetMaxY(v58);
    objc_msgSend(v19, "setFrame:", floor(v8 * x) / v8, floor(v8 * y) / v8, floor(v8 * width) / v8, floor(v8 * height) / v8);
    objc_msgSend(v19, "setDataSource:", v14);
    objc_msgSend(v19, "setSupplementaryMetrics:", v57);
    objc_msgSend(v19, "setUnpinnedY:", y);
    objc_msgSend(v19, "setGridLayoutLocation:", 3);
    objc_msgSend(v19, "setHidden:", v15);
    v56 = v15;
    v24 = 1.0;
    if (v15)
      v24 = 0.0;
    objc_msgSend(v19, "setAlpha:", v24);
    objc_msgSend(v19, "setZIndex:", -3000);
    indexPathToSupplementary = self->_indexPathToSupplementary;
    objc_msgSend(v19, "indexPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](indexPathToSupplementary, "setObject:forKeyedSubscript:", v19, v26);

    -[NSMutableArray addObject:](self->_laidOutAttributes, "addObject:", v19);
    knownSupplementaryKinds = self->_knownSupplementaryKinds;
    objc_msgSend(v57, "kind");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](knownSupplementaryKinds, "addObject:", v28);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_indexPathToMetrics, "setObject:forKeyedSubscript:", v57, v17);
    -[GKGridLayoutMetrics supplementaryMetricsForKey:](self->_dataSourceMetrics, "supplementaryMetricsForKey:", CFSTR("ContentBoxMetricKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v55 = v16;
      v30 = a3 + 1;
      v31 = objc_msgSend(v6, "numberOfSections");
      if (v31)
      {
        v32 = v14;
        v33 = v6;
        v34 = 0;
        v35 = v31 - 1;
        do
        {
          -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "headerMaxY");
          v38 = v37;

        }
        while (v38 <= 0.0 && v35 != v34++);
        v40 = v38 + -32.0;
        v6 = v33;
        v14 = v32;
      }
      else
      {
        v40 = -32.0;
      }
      v41 = v40 <= 0.0 || v56;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v30);
      v42 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "kind");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](GKCollectionViewLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v43, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      UIRectCenteredXInRect();
      v46 = v45;
      objc_msgSend(v44, "setFrame:", floor(v8 * v47) / v8, floor(v8 * v45) / v8, floor(v8 * v48) / v8, floor(v8 * v49) / v8);
      objc_msgSend(v44, "setDataSource:", v14);
      objc_msgSend(v44, "setSupplementaryMetrics:", v29);
      objc_msgSend(v44, "setUnpinnedY:", v46);
      objc_msgSend(v44, "setGridLayoutLocation:", 4);
      objc_msgSend(v44, "setHidden:", v41);
      v50 = 1.0;
      if ((_DWORD)v41)
        v50 = 0.0;
      objc_msgSend(v44, "setAlpha:", v50);
      objc_msgSend(v44, "setZIndex:", -2999);
      v51 = self->_indexPathToSupplementary;
      objc_msgSend(v44, "indexPath");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v51, "setObject:forKeyedSubscript:", v44, v52);

      -[NSMutableArray addObject:](self->_laidOutAttributes, "addObject:", v44);
      v53 = self->_knownSupplementaryKinds;
      objc_msgSend(v29, "kind");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v53, "addObject:", v54);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_indexPathToMetrics, "setObject:forKeyedSubscript:", v29, v42);
      v19 = v44;
      v17 = (void *)v42;
      v16 = v55;
    }

    v5 = v57;
  }

}

- (id)firstVisibleIndexAtOrAfterItem:(int64_t)a3 itemCount:(int64_t)a4 inSection:(int64_t)a5
{
  int64_t v6;
  void *v9;

  v6 = a3;
  if (self->_visibleIndexPathsFilter)
  {
    if (a3 >= a4)
    {
LABEL_5:
      v9 = 0;
    }
    else
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, a5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSSet containsObject:](self->_visibleIndexPathsFilter, "containsObject:", v9))
          break;
        ++v6;

        if (a4 == v6)
          goto LABEL_5;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (unint64_t)_prepareItemLayoutForSection:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  double v41;
  unint64_t v42;
  unint64_t v43;
  float v44;
  unint64_t v45;
  void *v46;
  double MaxY;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  double v54;
  double v55;
  float v56;
  float v57;
  int64_t v58;
  double v59;
  uint64_t v60;
  BOOL v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  unint64_t v66;
  float v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  void *v73;
  void *v74;
  double MinX;
  double MaxX;
  CGFloat v77;
  double v78;
  BOOL v79;
  double v80;
  double v81;
  double v82;
  double v83;
  _BOOL8 v84;
  double v85;
  unint64_t v86;
  _BOOL4 v87;
  double v88;
  BOOL v89;
  double v90;
  NSMutableDictionary *indexPathToItem;
  void *v92;
  double v93;
  void *v95;
  unint64_t v96;
  void *v97;
  float v98;
  double v99;
  double v100;
  double v101;
  double v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  unint64_t v110;
  double v111;
  double v112;
  void *v113;
  unint64_t v115;
  void *v116;
  double v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;

  v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (sectionIdx != GKGlobalSection)\n[%s (%s:%d)]"), v6, "-[GKGridLayout _prepareItemLayoutForSection:]", objc_msgSend(v8, "UTF8String"), 1305);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);

  }
  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self->_dataSourceMetrics, "supplementaryMetricsForKey:", CFSTR("SegmentedBoxMetricKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = 40.0;
  else
    v11 = 0.0;
  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", v3);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout metricsForSection:](self, "metricsForSection:", v3);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  v13 = -[GKGridLayout sectionsPerRow](self, "sectionsPerRow");
  -[GKGridLayout collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v119 = v18;
  v120 = v17;
  v19 = (v16 + v11 * -2.0) / (double)v13;
  v20 = v12 % v13;
  if (v13 >= 2)
    v15 = v11 + (double)(v12 % v13) * v19;
  else
    v19 = v16;
  v122 = v15;
  v123 = v19;
  objc_msgSend(v14, "dataSource");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    v21 = 0;
  else
    v21 = objc_msgSend(v14, "numberOfItemsInSection:", v12);
  v22 = objc_msgSend(v116, "filteredTotalItemCount");
  if (v21 >= v22)
    v23 = v22;
  else
    v23 = v21;
  v115 = v23;
  objc_msgSend(v124, "lineSpacing");
  v25 = v24;
  objc_msgSend(v124, "interitemSpacing");
  v27 = v26;
  objc_msgSend(v124, "padding");
  v29 = v28;
  v108 = v31;
  v109 = v30;
  v32 = v123 - (v30 + v31);
  objc_msgSend(v124, "itemSizeForCollectionView:", v14);
  v121 = v34;
  if (v13 >= 2)
    v35 = (v33 + v11 * 2.0) / (double)v13;
  else
    v35 = v33;
  if (v35 == 0.0)
  {
    v37 = 1;
  }
  else
  {
    v36 = (v32 - v35) / (v27 + v35);
    v37 = (unint64_t)(float)(floorf(v36) + 1.0);
  }
  if (v37 <= 1)
    v38 = 1;
  else
    v38 = v37;
  v39 = objc_msgSend(v116, "currentMaxVisibleItemCount");
  if (v115 >= v39)
    v40 = v39;
  else
    v40 = v115;
  if (v37 >= 2 && v40 % v38)
  {
    if (v40 + v38 - v40 % v38 >= v115)
      v40 = v115;
    else
      v40 = v40 + v38 - v40 % v38;
  }
  if (v11 <= 0.0)
    v41 = v35;
  else
    v41 = v35 - (v11 + v11) / (double)v38;
  v42 = v40 % v38;
  if (v40 >= v38)
    v43 = v38;
  else
    v43 = v40;
  if (!v42)
    v42 = v43;
  v103 = v43;
  v104 = v42;
  v44 = (double)v40 / (double)v38;
  v45 = vcvtps_u32_f32(v44);
  -[NSMutableArray lastObject](self->_laidOutAttributes, "lastObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  MaxY = CGRectGetMaxY(v126);
  if (self->_shouldLayoutRTL)
    -[GKGridLayout rightLayoutGuideOffset](self, "rightLayoutGuideOffset");
  else
    -[GKGridLayout leftLayoutGuideOffset](self, "leftLayoutGuideOffset");
  v112 = v48;
  if (self->_shouldLayoutRTL)
    -[GKGridLayout leftLayoutGuideOffset](self, "leftLayoutGuideOffset");
  else
    -[GKGridLayout rightLayoutGuideOffset](self, "rightLayoutGuideOffset");
  v111 = v49;
  if (v45)
  {
    v95 = v46;
    v96 = v40;
    v97 = v14;
    v50 = 0;
    v51 = 0;
    v52 = v45;
    v53 = 0;
    v54 = v32 - (v27 * (double)(v38 - 1) + v41 * (double)v38);
    v55 = v32 - (v27 * (double)(v104 - 1) + v41 * (double)v104) - v54;
    v56 = v54 * 0.5;
    v57 = v55 * 0.5;
    v125 = v29 + MaxY;
    v101 = floorf(v56);
    v102 = v54;
    v100 = -v54;
    v106 = v52;
    v105 = v52 - 1;
    v99 = floorf(v57);
    *(float *)&v55 = v55;
    v98 = floorf(*(float *)&v55);
    v110 = v13 - 1;
    v58 = a3;
    while (1)
    {
      v59 = v122 + v109;
      if (self->_shouldLayoutRTL)
      {
        v127.origin.x = v122;
        v127.size.width = v123;
        v127.size.height = v119;
        v127.origin.y = v120;
        v59 = CGRectGetMaxX(v127) - v109 - v41;
      }
      v60 = objc_msgSend(v124, "alignment");
      if (v60 == 2)
      {
        v61 = !self->_shouldLayoutRTL;
        v62 = v102;
        v63 = v100;
      }
      else
      {
        if (v60 != 1)
          goto LABEL_57;
        v61 = !self->_shouldLayoutRTL;
        v63 = -v101;
        v62 = v101;
      }
      if (!v61)
        v62 = v63;
      v59 = v59 + v62;
LABEL_57:
      if (v50 == v105)
      {
        v64 = objc_msgSend(v124, "lastLineItemAlignment");
        if (v64 == 2)
        {
          v67 = v98;
          if (self->_shouldLayoutRTL)
            v67 = -v98;
          v65 = v67;
LABEL_67:
          v59 = v59 + v65;
        }
        else if (v64 == 1)
        {
          v65 = v99;
          if (self->_shouldLayoutRTL)
            v65 = -v99;
          goto LABEL_67;
        }
        v66 = v104;
        goto LABEL_69;
      }
      v66 = v103;
LABEL_69:
      objc_msgSend(v124, "marginBetweenItems");
      v69 = v68;
      -[GKGridLayout scale](self, "scale");
      v107 = v50;
      if (v66)
      {
        v71 = v70;
        v72 = 0;
        v118 = floor(v125 * v70) / v70;
        v117 = floor(v121 * v70) / v70;
        do
        {
          v73 = v53;
          -[GKGridLayout firstVisibleIndexAtOrAfterItem:itemCount:inSection:](self, "firstVisibleIndexAtOrAfterItem:itemCount:inSection:", v51, v21, v58);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](GKCollectionViewLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v53);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v128.origin.x = v122;
            v128.origin.y = v120;
            v128.size.width = v123;
            v128.size.height = v119;
            MinX = CGRectGetMinX(v128);
            v129.origin.x = v122;
            v129.origin.y = v120;
            v129.size.width = v123;
            v129.size.height = v119;
            MaxX = CGRectGetMaxX(v129);
            if (self->_shouldLayoutRTL)
            {
              v130.origin.x = v59;
              v130.origin.y = v125;
              v130.size.width = v41;
              v130.size.height = v121;
              v77 = CGRectGetMinX(v130);
              v78 = MinX - v77;
              v79 = v77 < MinX;
              v80 = -0.0;
              if (v79)
                v80 = v78;
              v81 = v59 + v80;
              if (!v79)
                v78 = 0.0;
              v82 = v41 - v78;
            }
            else
            {
              v83 = MaxX;
              v131.origin.x = v59;
              v131.origin.y = v125;
              v131.size.width = v41;
              v131.size.height = v121;
              if (CGRectGetMaxX(v131) > v83)
                v82 = v83 - v59;
              else
                v82 = v41;
              v81 = v59;
            }
            objc_msgSend(v74, "setFrame:", floor(v71 * v81) / v71, v118, floor(v71 * v82) / v71, v117);
            objc_msgSend(v74, "setDataSource:", v113);
            objc_msgSend(v74, "setSectionMetrics:", v124);
            objc_msgSend(v74, "setCurrentTotalItemCount:", v115);
            objc_msgSend(v74, "setMaxTotalItemCount:", v21);
            objc_msgSend(v74, "setCurrentVisibleItemCount:", objc_msgSend(v116, "currentMaxVisibleItemCount"));
            if (v20 | v72)
            {
              v84 = 0;
            }
            else
            {
              v85 = v109;
              if (self->_shouldLayoutRTL)
                v85 = v108;
              v84 = v85 == 0.0;
            }
            objc_msgSend(v74, "setDoesAbutLeftOfCollectionView:", v84);
            if (v66 - 1 == v72)
            {
              v86 = v110;
              v87 = v20 == v110;
              if (self->_shouldLayoutRTL)
                v87 = v20 == 0;
            }
            else
            {
              v87 = 0;
              v86 = v110;
            }
            if (v87)
              v88 = v111;
            else
              v88 = v69 * 0.5;
            if (self->_shouldLayoutRTL)
              v89 = v20 == v86;
            else
              v89 = v20 == 0;
            v90 = v112;
            if (v72 != 0 || !v89)
              v90 = v69 * 0.5;
            objc_msgSend(v74, "setLeadingMargin:", v90);
            objc_msgSend(v74, "setTrailingMargin:", v88);
            objc_msgSend(v74, "setHidden:", self->_displayingOverlay);
            indexPathToItem = self->_indexPathToItem;
            objc_msgSend(v74, "indexPath");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](indexPathToItem, "setObject:forKeyedSubscript:", v74, v92);

            -[NSMutableArray addObject:](self->_laidOutAttributes, "addObject:", v74);
            -[GKGridLayout updatePresentationDataInSection:withAttributes:supplementaryLocation:](self, "updatePresentationDataInSection:withAttributes:supplementaryLocation:", a3, v74, -1);
            v93 = -v41;
            if (!self->_shouldLayoutRTL)
              v93 = v41;
            v59 = v59 + v93;

            v58 = a3;
          }
          v51 = objc_msgSend(v53, "item") + 1;
          ++v72;
        }
        while (v66 != v72);
      }
      v125 = v25 + v121 + v125;
      v50 = v107 + 1;
      if (v107 + 1 == v106)
      {

        v40 = v96;
        v14 = v97;
        v46 = v95;
        break;
      }
    }
  }

  return v40;
}

- (void)_resetState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSMutableDictionary *oldSectionToMetricKeys;
  void *v9;
  void *v10;
  void *v11;

  -[NSMutableDictionary removeAllObjects](self->_oldSectionToMetricKeys, "removeAllObjects");
  v3 = -[NSPointerArray count](self->_sectionToMetricData, "count");
  v4 = v3 - 1;
  if (v3 >= 1)
  {
    if (v3 != 1)
    {
      v5 = 0;
      do
      {
        -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "layoutKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        oldSectionToMetricKeys = self->_oldSectionToMetricKeys;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](oldSectionToMetricKeys, "setObject:forKeyedSubscript:", v7, v9);

        ++v5;
      }
      while (v4 != v5);
    }
    -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", 0x7FFFFFFFFFFFFFFFLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_oldSectionToMetricKeys, "setObject:forKeyedSubscript:", v11, &unk_1E5A5DD40);

  }
  -[NSPointerArray setCount:](self->_sectionToMetricData, "setCount:", 0);
  -[NSPointerArray setCount:](self->_sectionToPresentationData, "setCount:", 0);
  -[NSMutableArray removeAllObjects](self->_laidOutAttributes, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_laidOutPinnableAttributes, "removeAllObjects");
  -[NSMutableIndexSet removeAllIndexes](self->_sectionsWithPinnedHeaders, "removeAllIndexes");
  -[NSMutableDictionary removeAllObjects](self->_oldIndexPathToDecoration, "removeAllObjects");
  -[NSMutableDictionary setValuesForKeysWithDictionary:](self->_oldIndexPathToDecoration, "setValuesForKeysWithDictionary:", self->_indexPathToDecoration);
  -[NSMutableDictionary removeAllObjects](self->_indexPathToDecoration, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_oldIndexPathToSupplementary, "removeAllObjects");
  -[NSMutableDictionary setValuesForKeysWithDictionary:](self->_oldIndexPathToSupplementary, "setValuesForKeysWithDictionary:", self->_indexPathToSupplementary);
  -[NSMutableDictionary removeAllObjects](self->_indexPathToSupplementary, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_oldIndexPathToItem, "removeAllObjects");
  -[NSMutableDictionary setValuesForKeysWithDictionary:](self->_oldIndexPathToItem, "setValuesForKeysWithDictionary:", self->_indexPathToItem);
  -[NSMutableDictionary removeAllObjects](self->_indexPathToItem, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_indexPathToMetrics, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_knownSupplementaryKinds, "removeAllObjects");
  self->_hiddenSearchBarOffset = 0.0;
  self->_segmentedHeaderPinningOffset = 0.0;
  self->_segmentedBoxY = 0.0;
}

- (void)prepareLayout
{
  if ((self->_invalidationFlags & 6) != 0)
    -[GKGridLayout fullyRebuildLayout](self, "fullyRebuildLayout");
  self->_invalidationFlags = 0;
}

- (void)fullyRebuildLayout
{
  void *v3;
  uint64_t v4;
  GKDataSourceMetrics *dataSourceMetrics;
  void *v6;
  int64_t v7;
  uint64_t i;
  void *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;

  -[GKGridLayout _resetState](self, "_resetState");
  -[GKGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  dataSourceMetrics = self->_dataSourceMetrics;
  if (!dataSourceMetrics)
  {
    -[GKGridLayout refreshMetrics](self, "refreshMetrics");
    dataSourceMetrics = self->_dataSourceMetrics;
  }
  -[GKDataSourceMetrics prepareLayout:](dataSourceMetrics, "prepareLayout:", self);
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", 0x7FFFFFFFFFFFFFFFLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKGridLayout _prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:](self, "_prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:", 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
  objc_msgSend(v6, "setNumHeaders:", v7 - 1);
  objc_msgSend(v6, "setOverlayOffset:", v7);
  v12 = -[GKGridLayout _prepareOverlayLayoutForSection:offset:](self, "_prepareOverlayLayoutForSection:offset:", 0x7FFFFFFFFFFFFFFFLL, v7);
  objc_msgSend(v6, "setNumOverlays:", v12 + ~objc_msgSend(v6, "numHeaders"));
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GKGridLayout _prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:](self, "_prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:", i, 0, 0, &v12);
      objc_msgSend(v9, "setNumHeaders:", v10);
      objc_msgSend(v9, "setNumItems:", -[GKGridLayout _prepareItemLayoutForSection:](self, "_prepareItemLayoutForSection:", i));
      objc_msgSend(v9, "setNumFooters:", -[GKGridLayout _prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:](self, "_prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:", i, 1, v10, &v12)- objc_msgSend(v9, "numHeaders"));

    }
  }
  if (-[GKGridLayout sectionsPerRow](self, "sectionsPerRow") > 1)
    -[GKGridLayout updatePresentationDataForLastInterleavedSections](self, "updatePresentationDataForLastInterleavedSections");
  -[GKGridLayout finalizeGlobalPresentationDataWithSectionRange:](self, "finalizeGlobalPresentationDataWithSectionRange:", 0, v4);
  v11 = v12;
  v12 = -[GKGridLayout _prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:](self, "_prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:", 0x7FFFFFFFFFFFFFFFLL, 1, v12, 0);
  objc_msgSend(v6, "setNumFooters:", v11 - v12);
  -[GKGridLayout calculateCollectionViewContentSize](self, "calculateCollectionViewContentSize");
  -[GKGridLayout _prepareSegmentedBoxLayoutWithOffset:](self, "_prepareSegmentedBoxLayoutWithOffset:", v12);
  -[GKGridLayout _filterPinnedAttributes](self, "_filterPinnedAttributes");

}

- (double)applyBottomPinningToAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double MaxY;
  double v19;
  CGRect v21;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v7 >= 1)
  {
    v8 = v7 + 1;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8 - 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v9, "unpinnedY");
      v17 = v16;
      v21.origin.x = v11;
      v21.origin.y = v17;
      v21.size.width = v13;
      v21.size.height = v15;
      MaxY = CGRectGetMaxY(v21);
      if (MaxY <= a5)
        v19 = v17;
      else
        v19 = a5 - v15;
      if (MaxY > a5)
        a5 = a5 - v15;
      objc_msgSend(v9, "setFrame:", v11, v19, v13, v15);

      --v8;
    }
    while (v8 > 1);
  }

  return a5;
}

- (double)applyTopPinningToAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat MaxY;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;

  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (v8 < 1)
  {
    MaxY = a4;
  }
  else
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v11, "unpinnedY");
      if (v18 >= a4)
      {
        v20 = v18;
        MaxY = a4;
      }
      else
      {
        v23.origin.x = v13;
        v23.origin.y = a4;
        v23.size.width = v15;
        v23.size.height = v17;
        MaxY = CGRectGetMaxY(v23);
        if (MaxY - a5 <= 0.0)
        {
          v20 = a4;
        }
        else
        {
          if (MaxY - a5 >= v17)
          {
            objc_msgSend(v11, "unpinnedY");
            v20 = v21;
          }
          else
          {
            v24.origin.x = v13;
            v24.origin.y = a4;
            v24.size.width = v15;
            v24.size.height = v17;
            v20 = a5 - CGRectGetHeight(v24);
          }
          MaxY = a5;
        }
      }
      objc_msgSend(v11, "setFrame:", v13, v20, v15, v17);

      a4 = MaxY;
    }
  }

  return MaxY;
}

- (double)layoutBottomPinningAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  id v8;
  double v9;
  double v10;

  v8 = a3;
  -[GKGridLayout applyBottomPinningToAttributes:minY:maxY:](self, "applyBottomPinningToAttributes:minY:maxY:", v8, a4, a5);
  v10 = v9;
  if (v9 < a4)
  {
    -[GKGridLayout applyTopPinningToAttributes:minY:maxY:](self, "applyTopPinningToAttributes:minY:maxY:", v8, a4, 1.79769313e308);
    v10 = a4;
  }

  return v10;
}

- (double)layoutTopPinningAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  double result;

  -[GKGridLayout applyTopPinningToAttributes:minY:maxY:](self, "applyTopPinningToAttributes:minY:maxY:", a3, a4);
  if (result > a5)
    return a5;
  return result;
}

- (void)finalizePinnedAttributes:(id)a3 forSection:(int64_t)a4 footer:(BOOL)a5
{
  id v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  _QWORD v12[6];
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v8 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = objc_msgSend(v8, "count");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__GKGridLayout_finalizePinnedAttributes_forSection_footer___block_invoke;
  v12[3] = &unk_1E59C4E70;
  v13 = a5;
  v12[4] = &v14;
  v12[5] = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  if (!a5)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0;
    else
      v10 = a4 + 1;
    if (*((_BYTE *)v15 + 24))
    {
      -[GKGridLayout sectionsWithPinnedHeaders](self, "sectionsWithPinnedHeaders");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addIndex:", v10);
    }
    else
    {
      -[GKGridLayout sectionsWithPinnedHeaders](self, "sectionsWithPinnedHeaders");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeIndex:", v10);
    }

  }
  _Block_object_dispose(&v14, 8);

}

void __59__GKGridLayout_finalizePinnedAttributes_forSection_footer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "frame");
  v6 = v5;
  objc_msgSend(v13, "unpinnedY");
  v8 = v6 != v7;
  objc_msgSend(v13, "setIsPinned:", v6 != v7);
  v9 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v8;
  v10 = a3 - v9;
  v11 = objc_msgSend(v13, "isPartOfGlobalPinningGroup");
  v12 = 0x7FFFFFFFFFFFFC16;
  if (v11)
    v12 = 0x7FFFFFFFFFFFFFFELL;
  objc_msgSend(v13, "setZIndex:", v10 + v12);

}

- (void)_filterPinnedAttributes
{
  void *v3;
  double v4;
  double v5;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  uint64_t v23;
  _QWORD v24[7];
  _QWORD v25[7];

  -[GKGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v3, "numberOfSections") - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    objc_msgSend(v3, "contentOffset");
    v5 = v4;
    height = self->_laidOutContentSize.height;
    objc_msgSend(v3, "contentInset");
    v8 = v7;
    v10 = v9;
    -[GKGridLayout layoutBounds](self, "layoutBounds");
    if (v5 + v8 >= 0.0)
      v15 = v5 + v8;
    else
      v15 = 0.0;
    v16 = CGRectGetMaxY(*(CGRect *)&v11) - v10;
    if (v16 <= v5 + height + v10)
      v17 = v16;
    else
      v17 = v5 + height + v10;
    -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", 0x7FFFFFFFFFFFFFFFLL);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "headerPinnableAttributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[GKGridLayout layoutTopPinningAttributes:minY:maxY:](self, "layoutTopPinningAttributes:minY:maxY:", v19, v15, v17);
      v15 = v20;
      -[GKGridLayout finalizePinnedAttributes:forSection:footer:](self, "finalizePinnedAttributes:forSection:footer:", v19, 0x7FFFFFFFFFFFFFFFLL, 0);
    }
    objc_msgSend(v18, "footerPinnableAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[GKGridLayout layoutBottomPinningAttributes:minY:maxY:](self, "layoutBottomPinningAttributes:minY:maxY:", v21, v15, v17);
      v17 = v22;
      -[GKGridLayout finalizePinnedAttributes:forSection:footer:](self, "finalizePinnedAttributes:forSection:footer:", v21, 0x7FFFFFFFFFFFFFFFLL, 1);
    }
    v23 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __39__GKGridLayout__filterPinnedAttributes__block_invoke;
    v25[3] = &unk_1E59C4E98;
    v25[4] = self;
    *(double *)&v25[5] = v15;
    *(double *)&v25[6] = v17;
    -[GKGridLayout enumerateSectionsIndexesOverlappingYOffset:block:](self, "enumerateSectionsIndexesOverlappingYOffset:block:", v25, v15);
    v24[0] = v23;
    v24[1] = 3221225472;
    v24[2] = __39__GKGridLayout__filterPinnedAttributes__block_invoke_2;
    v24[3] = &unk_1E59C4E98;
    v24[4] = self;
    *(double *)&v24[5] = v15;
    *(double *)&v24[6] = v17;
    -[GKGridLayout enumerateSectionsIndexesOverlappingYOffset:block:](self, "enumerateSectionsIndexesOverlappingYOffset:block:", v24, v17);

  }
}

void __39__GKGridLayout__filterPinnedAttributes__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "metricDataForSection:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "headerPinnableAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentationDataForSection:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(double *)(a1 + 40);
    v8 = *(double *)(a1 + 48);
    objc_msgSend(v5, "maxY");
    if (v8 <= v9)
      v10 = v8;
    else
      v10 = v9;
    objc_msgSend(v6, "layoutTopPinningAttributes:minY:maxY:", v4, v7, v10);
    objc_msgSend(*(id *)(a1 + 32), "finalizePinnedAttributes:forSection:footer:", v4, a2, 0);

  }
}

void __39__GKGridLayout__filterPinnedAttributes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "metricDataForSection:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "footerPinnableAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentationDataForSection:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(double *)(a1 + 40);
    objc_msgSend(v5, "headerMaxY");
    if (v7 >= v8)
      v8 = v7;
    objc_msgSend(v6, "layoutBottomPinningAttributes:minY:maxY:", v4, v8, *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "finalizePinnedAttributes:forSection:footer:", v4, a2, 1);

  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout _filterPinnedAttributes](self, "_filterPinnedAttributes");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_laidOutAttributes;
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
        objc_msgSend(v14, "frame", (_QWORD)v16);
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        if (CGRectIntersectsRect(v22, v23))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToItem, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGridLayout metricsForSection:](self, "metricsForSection:", objc_msgSend(v4, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[GKGridLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemSizeForCollectionView:", v9);
    objc_msgSend(v5, "setFrame:", v7, v8, v10, v11);

    objc_msgSend(v5, "setAlpha:", 0.0);
    objc_msgSend(v5, "setHidden:", 1);

  }
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToSupplementary, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);
    -[NSMutableSet addObject:](self->_knownSupplementaryKinds, "addObject:", v6);
  }

  return v8;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToDecoration, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForDecorationViewOfKind:withIndexPath:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);
    -[NSMutableSet addObject:](self->_knownSupplementaryKinds, "addObject:", v6);
  }

  return v8;
}

- (unint64_t)currentMaxVisibleItemCountForSection:(int64_t)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "currentMaxVisibleItemCount");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)revealMoreForSectionIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (section != GKGlobalSection)\n[%s (%s:%d)]"), v6, "-[GKGridLayout revealMoreForSectionIndex:]", objc_msgSend(v8, "UTF8String"), 1834);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout revealMoreForSectionIndex:revealCount:andDeleteItemCount:](self, "revealMoreForSectionIndex:revealCount:andDeleteItemCount:", a3, objc_msgSend(v11, "incrementalRevealItemCount"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)revealMoreForSectionIndex:(int64_t)a3 revealCount:(unint64_t)a4 andDeleteItemCount:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v24;
  void *v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;

  if (!a4)
    return 0;
  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v32, "numberOfItemsInSection:", a3);
  v12 = objc_msgSend(v9, "currentMaxVisibleItemCount");
  if (v11 >= v12)
    v13 = v12;
  else
    v13 = v11;
  if (a4 >= v11 - v13)
    v14 = v11 - v13;
  else
    v14 = a4;
  v15 = v14 - a5 + objc_msgSend(v9, "currentMaxVisibleItemCount");
  v16 = objc_msgSend(v10, "maximumVisibleItemCount");
  if (v15 <= v16)
    v17 = v16;
  else
    v17 = v15;
  objc_msgSend(v9, "setCurrentMaxVisibleItemCount:", v17);
  if (v11 == a5)
    objc_msgSend(v9, "setCurrentMaxVisibleItemCount:", -1);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v19 = -(uint64_t)a5;
    do
    {
      if (v13 < v11)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v19 + v13, a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v20);

      }
      ++v13;
      --v14;
    }
    while (v14);
  }
  if (objc_msgSend(v9, "currentMaxVisibleItemCount") >= v11)
  {
    v22 = v10;
    v21 = objc_msgSend(v10, "shouldAlwaysIncludeShowMore") ^ 1;
  }
  else
  {
    LOBYTE(v21) = 0;
    v22 = v10;
  }
  self->_noMoreShowMore = v21;
  objc_msgSend(v22, "listForLocation:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout presentationDataForSection:](self, "presentationDataForSection:", a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[GKGridLayout indexOfSupplementaryMetricsOfKind:inList:](self, "indexOfSupplementaryMetricsOfKind:inList:", CFSTR("IncrementalReveal"), v24);
  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = v26;
    v28 = objc_msgSend(v25, "numHeaders");
    v29 = objc_msgSend(v25, "numOverlays");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v28 + v29 + v27, a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGridLayout setIndexPathOfTouchedShowMore:](self, "setIndexPathOfTouchedShowMore:", v30);

  }
  -[GKGridLayout setRevealedIndexPaths:](self, "setRevealedIndexPaths:", v18);
  objc_msgSend(v18, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)initialLayoutAttributesForSlidingInItemAtIndexPath:(id)a3
{
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

  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToItem, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v15 = -v14;
  if (self->_updateType == 1)
    v15 = v14;
  v16 = v7 + v15;
  -[GKGridLayout yOffsetForSlidingUpdate](self, "yOffsetForSlidingUpdate");
  objc_msgSend(v5, "setFrame:", v16, v9 + v17, v11, v13);
  return v5;
}

- (id)finalLayoutAttributesForSlidingAwayItemAtIndexPath:(id)a3
{
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

  -[NSMutableDictionary objectForKeyedSubscript:](self->_oldIndexPathToItem, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v15 = -v14;
  if (self->_updateType != 1)
    v15 = v14;
  v16 = v7 + v15;
  -[GKGridLayout yOffsetForSlidingUpdate](self, "yOffsetForSlidingUpdate");
  objc_msgSend(v5, "setFrame:", v16, v9 - v17, v11, v13);
  return v5;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GKCollectionViewDataSource *dataSourceForUpdate;
  void *v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSMutableDictionary *oldSectionToMetricKeys;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  NSMutableDictionary *oldIndexPathToItem;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  NSArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  char v59;
  GKGridLayout *v61;
  id obj;
  NSArray *obja;
  id objb;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61 = self;
  if (-[NSMutableSet containsObject:](self->_revealedIndexPaths, "containsObject:", v4))
  {
    -[GKGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v6, "setAlpha:", 0.0);
    if (v6)
      goto LABEL_74;
    goto LABEL_56;
  }
  if (self->_updateType - 1 <= 1)
  {
    -[GKGridLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      dataSourceForUpdate = self->_dataSourceForUpdate;
      objc_msgSend(v8, "dataSourceForSection:", objc_msgSend(v4, "section"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(dataSourceForUpdate) = -[GKCollectionViewDataSource containsDataSource:](dataSourceForUpdate, "containsDataSource:", v10);

      if ((_DWORD)dataSourceForUpdate)
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v11 = self->_currentUpdateItems;
        v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
        if (v6)
        {
          obj = v8;
          v12 = v4;
          v13 = *(_QWORD *)v74;
          while (2)
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(_QWORD *)v74 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
              if (!objc_msgSend(v15, "updateAction", v61))
              {
                objc_msgSend(v15, "indexPathAfterUpdate");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "isEqual:", v12))
                {

LABEL_52:
                  v4 = v12;
                  -[GKGridLayout initialLayoutAttributesForSlidingInItemAtIndexPath:](v61, "initialLayoutAttributesForSlidingInItemAtIndexPath:", v12);
                  v6 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_53;
                }
                objc_msgSend(v15, "indexPathAfterUpdate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "section");
                if (v18 == objc_msgSend(v12, "section"))
                {
                  objc_msgSend(v15, "indexPathAfterUpdate");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "item");

                  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_52;
                }
                else
                {

                }
              }
            }
            v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
            if (v6)
              continue;
            break;
          }
          v4 = v12;
LABEL_53:
          v8 = obj;
        }

LABEL_55:
        if (v6)
          goto LABEL_74;
        goto LABEL_56;
      }
      oldSectionToMetricKeys = self->_oldSectionToMetricKeys;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "section"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](oldSectionToMetricKeys, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", objc_msgSend(v4, "section"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isEqual:", v39);

      if ((v40 & 1) == 0)
      {
        -[GKGridLayout initialLayoutAttributesForSlidingInItemAtIndexPath:](self, "initialLayoutAttributesForSlidingInItemAtIndexPath:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_55;
      }
    }
    v6 = 0;
    goto LABEL_55;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obja = self->_currentUpdateItems;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v70;
LABEL_23:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v23)
        objc_enumerationMutation(obja);
      v25 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v24);
      if (!objc_msgSend(v25, "updateAction", v61))
      {
        objc_msgSend(v25, "indexPathAfterUpdate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqual:", v4))
        {

LABEL_46:
          -[NSMutableDictionary objectForKeyedSubscript:](v61->_indexPathToItem, "objectForKeyedSubscript:", v4);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (void *)objc_msgSend(v48, "copy");

          v47 = 0.0;
          goto LABEL_47;
        }
        objc_msgSend(v25, "indexPathAfterUpdate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "item") == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v25, "indexPathAfterUpdate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "section");
          v30 = objc_msgSend(v4, "section");

          if (v29 == v30)
            goto LABEL_46;
        }
        else
        {

        }
      }
      if (objc_msgSend(v25, "updateAction") == 3)
      {
        objc_msgSend(v25, "indexPathAfterUpdate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqual:", v4))
        {

LABEL_44:
          oldIndexPathToItem = v61->_oldIndexPathToItem;
          v42 = (void *)MEMORY[0x1E0CB36B0];
          v43 = objc_msgSend(v4, "item");
          objc_msgSend(v25, "indexPathBeforeUpdate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "indexPathForItem:inSection:", v43, objc_msgSend(v44, "section"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](oldIndexPathToItem, "objectForKeyedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (void *)objc_msgSend(v46, "copy");

          v47 = 1.0;
LABEL_47:
          objc_msgSend(v6, "setAlpha:", v47);
          goto LABEL_48;
        }
        objc_msgSend(v25, "indexPathAfterUpdate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "item") == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v25, "indexPathAfterUpdate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "section");
          v35 = objc_msgSend(v4, "section");

          if (v34 == v35)
            goto LABEL_44;
        }
        else
        {

        }
      }
      if (v22 == ++v24)
      {
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (v22)
          goto LABEL_23;
        break;
      }
    }
  }
  v6 = 0;
LABEL_48:

  if (!v6)
  {
LABEL_56:
    objb = v4;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v49 = v61->_currentUpdateItems;
    v50 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v66;
      while (2)
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v66 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          if (objc_msgSend(v54, "updateAction", v61) != 4 && objc_msgSend(v54, "updateAction") != 2)
          {
            objc_msgSend(v54, "indexPathAfterUpdate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "item");
            if (v56 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v54, "indexPathAfterUpdate");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v6, "section");
              if (v57 == objc_msgSend(objb, "section"))
              {

LABEL_72:
                v6 = 0;
                v4 = objb;
                goto LABEL_73;
              }
            }
            objc_msgSend(v54, "indexPathAfterUpdate");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "isEqual:", objb);

            if (v56 == 0x7FFFFFFFFFFFFFFFLL)
            if ((v59 & 1) != 0)
              goto LABEL_72;
          }
        }
        v51 = -[NSArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
        if (v51)
          continue;
        break;
      }
    }

    v4 = objb;
    -[NSMutableDictionary objectForKeyedSubscript:](v61->_indexPathToItem, "objectForKeyedSubscript:", objb);
    v49 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)-[NSArray copy](v49, "copy");
LABEL_73:

  }
LABEL_74:

  return v6;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  GKCollectionViewDataSource *dataSourceForUpdate;
  void *v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *v29;
  id v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSMutableDictionary *indexPathToItem;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSMutableDictionary *oldSectionToMetricKeys;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  unint64_t updateType;
  void *v53;
  uint64_t v54;
  GKGridLayout *v56;
  GKGridLayout *v57;
  NSArray *v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_updateType - 1 > 1)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v6 = self->_currentUpdateItems;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v19)
    {
      v20 = v19;
      v57 = self;
      v21 = *(_QWORD *)v61;
      while (2)
      {
        v22 = 0;
        v59 = v20;
        do
        {
          if (*(_QWORD *)v61 != v21)
            objc_enumerationMutation(v6);
          v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v22);
          if (objc_msgSend(v23, "updateAction") == 3)
          {
            objc_msgSend(v23, "indexPathBeforeUpdate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "isEqual:", v4))
            {

LABEL_39:
              objc_msgSend(v23, "indexPathAfterUpdate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "item");

              self = v57;
              indexPathToItem = v57->_indexPathToItem;
              if (v38 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v40 = (void *)MEMORY[0x1E0CB36B0];
                v41 = objc_msgSend(v4, "item");
                objc_msgSend(v23, "indexPathAfterUpdate");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "indexPathForItem:inSection:", v41, objc_msgSend(v42, "section"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](indexPathToItem, "objectForKeyedSubscript:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v10 = (void *)objc_msgSend(v44, "copy");

              }
              else
              {
                objc_msgSend(v23, "indexPathAfterUpdate");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](indexPathToItem, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v10 = (void *)objc_msgSend(v43, "copy");
              }

              objc_msgSend(v10, "setAlpha:", 1.0);
              goto LABEL_51;
            }
            objc_msgSend(v23, "indexPathBeforeUpdate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "item") == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v23, "indexPathBeforeUpdate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "section");
              v28 = v21;
              v29 = v6;
              v30 = v4;
              v31 = objc_msgSend(v4, "section");

              v32 = v27 == v31;
              v20 = v59;
              v4 = v30;
              v6 = v29;
              v21 = v28;
              if (v32)
                goto LABEL_39;
            }
            else
            {

            }
          }
          if (objc_msgSend(v23, "updateAction") == 1)
          {
            objc_msgSend(v23, "indexPathBeforeUpdate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "item") == 0x7FFFFFFFFFFFFFFFLL)
            {

            }
            else
            {
              objc_msgSend(v23, "indexPathBeforeUpdate");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "section");
              v36 = objc_msgSend(v4, "section");

              if (v35 != v36)
              {
                self = v57;
                -[NSMutableDictionary objectForKeyedSubscript:](v57->_indexPathToItem, "objectForKeyedSubscript:", v4);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v10 = (void *)objc_msgSend(v51, "copy");

                goto LABEL_51;
              }
            }
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        if (v20)
          continue;
        break;
      }
      v10 = 0;
      self = v57;
      goto LABEL_51;
    }
LABEL_37:
    v10 = 0;
    goto LABEL_51;
  }
  -[GKGridLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_37;
  dataSourceForUpdate = self->_dataSourceForUpdate;
  -[NSArray dataSourceForSection:](v6, "dataSourceForSection:", objc_msgSend(v4, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(dataSourceForUpdate) = -[GKCollectionViewDataSource containsDataSource:](dataSourceForUpdate, "containsDataSource:", v8);

  if ((_DWORD)dataSourceForUpdate)
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v9 = self->_currentUpdateItems;
    v10 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    if (v10)
    {
      v56 = self;
      v58 = v6;
      v11 = *(_QWORD *)v65;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v65 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "updateAction") == 1)
          {
            objc_msgSend(v13, "indexPathBeforeUpdate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqual:", v4))
            {

LABEL_48:
              self = v56;
              -[GKGridLayout finalLayoutAttributesForSlidingAwayItemAtIndexPath:](v56, "finalLayoutAttributesForSlidingAwayItemAtIndexPath:", v4);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            }
            objc_msgSend(v13, "indexPathBeforeUpdate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "section");
            if (v16 == objc_msgSend(v4, "section"))
            {
              objc_msgSend(v13, "indexPathBeforeUpdate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "item");

              if (v18 == 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_48;
            }
            else
            {

            }
          }
        }
        v10 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
        if (v10)
          continue;
        break;
      }
      self = v56;
LABEL_49:
      v6 = v58;
    }
    goto LABEL_50;
  }
  oldSectionToMetricKeys = self->_oldSectionToMetricKeys;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "section"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](oldSectionToMetricKeys, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", objc_msgSend(v4, "section"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layoutKey");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v47, "isEqual:", v49);

  if ((v50 & 1) != 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToItem, "objectForKeyedSubscript:", v4);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)-[NSArray copy](v9, "copy");
LABEL_50:

    goto LABEL_51;
  }
  -[GKGridLayout finalLayoutAttributesForSlidingAwayItemAtIndexPath:](self, "finalLayoutAttributesForSlidingAwayItemAtIndexPath:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

  if (v10 || -[NSArray count](self->_currentUpdateItems, "count"))
  {
    updateType = self->_updateType;
  }
  else
  {
    updateType = self->_updateType;
    if (updateType == 3)
      goto LABEL_55;
  }
  if (updateType == 4)
  {
LABEL_55:
    -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToItem, "objectForKeyedSubscript:", v4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "copy");

    v10 = (void *)v54;
  }

  return v10;
}

- (BOOL)shouldSlideInSupplementaryElementOfKind:(id)a3 forUpdateItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "updateAction") && (objc_msgSend(v8, "isEqualToString:", CFSTR("SegmentedBox")) & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(v10, "length") < 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToMetrics, "objectForKeyedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathAfterUpdate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "section") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = objc_msgSend(v13, "animateWithSection");
        objc_msgSend(v9, "indexPathAfterUpdate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15 == objc_msgSend(v16, "section");
LABEL_12:
        v11 = v17;

        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v9, "indexPathAfterUpdate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v10) & 1) != 0)
      {
        v11 = 1;
LABEL_18:

        goto LABEL_4;
      }
      objc_msgSend(v9, "indexPathAfterUpdate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "section");
      if (v18 == objc_msgSend(v10, "section"))
      {
        objc_msgSend(v9, "indexPathAfterUpdate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "item") == 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_12;
      }
    }
    v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v11 = 0;
LABEL_4:

  return v11;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSMutableDictionary *oldIndexPathToSupplementary;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  NSArray *obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v6 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_currentUpdateItems;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v7)
  {
LABEL_25:

    v20 = 0x1EEBE0000;
    goto LABEL_31;
  }
  v8 = v7;
  v9 = *(_QWORD *)v47;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v47 != v9)
      objc_enumerationMutation(obj);
    v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
    if (self->_updateType - 1 <= 1)
    {
      if (-[GKGridLayout shouldSlideInSupplementaryElementOfKind:forUpdateItem:atIndexPath:](self, "shouldSlideInSupplementaryElementOfKind:forUpdateItem:atIndexPath:", v44, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v10), v6))
      {
        break;
      }
    }
    if (objc_msgSend(v11, "updateAction", v44))
      goto LABEL_15;
    objc_msgSend(v11, "indexPathBeforeUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "item") != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
    objc_msgSend(v11, "indexPathAfterUpdate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "section");
    if (v14 != objc_msgSend(v6, "section"))
    {

LABEL_14:
      goto LABEL_15;
    }
    v15 = objc_msgSend(v6, "length");

    if (v15 >= 2)
    {
      -[GKGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v44, v6);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v40, "copy");

      objc_msgSend(v41, "setAlpha:", 1.0);
LABEL_29:
      v20 = 0x1EEBE0000uLL;
      goto LABEL_30;
    }
LABEL_15:
    if (objc_msgSend(v11, "updateAction") == 3)
    {
      objc_msgSend(v11, "indexPathAfterUpdate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "item") != 0x7FFFFFFFFFFFFFFFLL && !self->_movedItemsInUpdateCarrySections)
        goto LABEL_22;
      objc_msgSend(v11, "indexPathAfterUpdate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "section");
      if (v18 != objc_msgSend(v6, "section"))
      {

LABEL_22:
        goto LABEL_23;
      }
      v19 = objc_msgSend(v6, "length");

      if (v19 >= 2)
      {
        oldIndexPathToSupplementary = self->_oldIndexPathToSupplementary;
        v35 = (void *)MEMORY[0x1E0CB36B0];
        v36 = objc_msgSend(v6, "item");
        objc_msgSend(v11, "indexPathBeforeUpdate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "indexPathForItem:inSection:", v36, objc_msgSend(v37, "section"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](oldIndexPathToSupplementary, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v39, "copy");

        objc_msgSend(v41, "setIndexPath:", v6);
        goto LABEL_29;
      }
    }
LABEL_23:
    if (v8 == ++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_25;
    }
  }
  v20 = 0x1EEBE0000uLL;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToSupplementary, "objectForKeyedSubscript:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v21, "copy");

  objc_msgSend(v41, "frame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v31 = -v30;
  if (self->_updateType == 1)
    v31 = v30;
  v32 = v23 + v31;
  -[GKGridLayout yOffsetForSlidingUpdate](self, "yOffsetForSlidingUpdate", v44);
  objc_msgSend(v41, "setFrame:", v32, v25 + v33, v27, v29);
LABEL_30:

  if (v41)
    goto LABEL_32;
LABEL_31:
  objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v20 + 1748)), "objectForKeyedSubscript:", v6, v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v42, "copy");

LABEL_32:
  return v41;
}

- (double)yOffsetForSlidingUpdate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double height;
  double v11;

  -[GKGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  objc_msgSend(v3, "frame");
  v7 = v6;
  objc_msgSend(v3, "contentInset");
  v9 = v5 + v7 - v8;
  height = self->_laidOutContentSize.height;
  if (v9 <= height)
    v11 = 0.0;
  else
    v11 = v9 - height;

  return v11;
}

- (BOOL)shouldSlideOutSupplementaryElementOfKind:(id)a3 forUpdateItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "updateAction") == 1 && (objc_msgSend(v8, "isEqualToString:", CFSTR("SegmentedBox")) & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(v10, "length") < 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToMetrics, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathBeforeUpdate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "section") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = objc_msgSend(v12, "animateWithSection");
        objc_msgSend(v9, "indexPathBeforeUpdate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14 == objc_msgSend(v15, "section");
LABEL_11:
        v11 = v16;

        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v9, "indexPathBeforeUpdate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqual:", v10) & 1) != 0)
      {
        v11 = 1;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v9, "indexPathBeforeUpdate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "section");
      if (v17 == objc_msgSend(v10, "section"))
      {
        objc_msgSend(v9, "indexPathBeforeUpdate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "item") == 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_11;
      }
    }
    v11 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSMutableDictionary *indexPathToSupplementary;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  NSArray *obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v6 = a4;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = self->_currentUpdateItems;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v7)
  {
LABEL_25:

    goto LABEL_30;
  }
  v8 = v7;
  v9 = *(_QWORD *)v45;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v9)
      objc_enumerationMutation(obj);
    v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
    if (self->_updateType - 1 <= 1)
    {
      if (-[GKGridLayout shouldSlideOutSupplementaryElementOfKind:forUpdateItem:atIndexPath:](self, "shouldSlideOutSupplementaryElementOfKind:forUpdateItem:atIndexPath:", v42, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v10), v6))
      {
        break;
      }
    }
    if (objc_msgSend(v11, "updateAction", v42) != 1)
      goto LABEL_15;
    objc_msgSend(v11, "indexPathBeforeUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "item") != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
    objc_msgSend(v11, "indexPathBeforeUpdate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "section");
    if (v14 != objc_msgSend(v6, "section"))
    {

LABEL_14:
      goto LABEL_15;
    }
    v15 = objc_msgSend(v6, "length");

    if (v15 >= 2)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_oldIndexPathToSupplementary, "objectForKeyedSubscript:", v6);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setAlpha:", 0.0);
      goto LABEL_29;
    }
LABEL_15:
    if (objc_msgSend(v11, "updateAction") == 3)
    {
      objc_msgSend(v11, "indexPathBeforeUpdate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "item") != 0x7FFFFFFFFFFFFFFFLL && !self->_movedItemsInUpdateCarrySections)
        goto LABEL_22;
      objc_msgSend(v11, "indexPathBeforeUpdate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "section");
      if (v18 != objc_msgSend(v6, "section"))
      {

LABEL_22:
        goto LABEL_23;
      }
      v19 = objc_msgSend(v6, "length");

      if (v19 >= 2)
      {
        indexPathToSupplementary = self->_indexPathToSupplementary;
        v34 = (void *)MEMORY[0x1E0CB36B0];
        v35 = objc_msgSend(v6, "item");
        objc_msgSend(v11, "indexPathAfterUpdate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "indexPathForItem:inSection:", v35, objc_msgSend(v36, "section"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](indexPathToSupplementary, "objectForKeyedSubscript:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v38, "copy");

        objc_msgSend(v39, "setIndexPath:", v6);
        goto LABEL_29;
      }
    }
LABEL_23:
    if (v8 == ++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_25;
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_oldIndexPathToSupplementary, "objectForKeyedSubscript:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v20, "copy");

  objc_msgSend(v39, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[GKGridLayout layoutBounds](self, "layoutBounds");
  v30 = -v29;
  if (self->_updateType != 1)
    v30 = v29;
  v31 = v22 + v30;
  -[GKGridLayout yOffsetForSlidingUpdate](self, "yOffsetForSlidingUpdate", v42);
  objc_msgSend(v39, "setFrame:", v31, v24 - v32, v26, v28);
LABEL_29:

  if (v39)
    goto LABEL_31;
LABEL_30:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToSupplementary, "objectForKeyedSubscript:", v6, v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v40, "copy");

LABEL_31:
  return v39;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_noMoreShowMore && self->_indexPathOfTouchedShowMore)
    objc_msgSend(v4, "addObject:");
  return v5;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[GKGridLayout setCurrentUpdateItems:](self, "setCurrentUpdateItems:", v4);
  v5.receiver = self;
  v5.super_class = (Class)GKGridLayout;
  -[GKGridLayout prepareForCollectionViewUpdates:](&v5, sel_prepareForCollectionViewUpdates_, v4);

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKGridLayout;
  -[GKGridLayout finalizeCollectionViewUpdates](&v3, sel_finalizeCollectionViewUpdates);
  -[NSMutableSet removeAllObjects](self->_revealedIndexPaths, "removeAllObjects");
  -[GKGridLayout setCurrentUpdateItems:](self, "setCurrentUpdateItems:", 0);
  -[GKGridLayout setIndexPathOfTouchedShowMore:](self, "setIndexPathOfTouchedShowMore:", 0);
  -[GKGridLayout setUpdateType:](self, "setUpdateType:", 6);
  -[GKGridLayout setDataSourceForUpdate:](self, "setDataSourceForUpdate:", 0);
  -[GKGridLayout setMovedItemsInUpdateCarrySections:](self, "setMovedItemsInUpdateCarrySections:", 0);
  self->_oldLaidOutContentSize = self->_laidOutContentSize;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKGridLayout;
  -[GKGridLayout prepareForAnimatedBoundsChange:](&v6, sel_prepareForAnimatedBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[GKGridLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  -[GKGridLayout prepareForUpdate:inDataSource:](self, "prepareForUpdate:inDataSource:", 3, v5);

}

- (void)finalizeAnimatedBoundsChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKGridLayout;
  -[GKGridLayout finalizeAnimatedBoundsChange](&v3, sel_finalizeAnimatedBoundsChange);
  -[GKGridLayout setUpdateType:](self, "setUpdateType:", 6);
  -[GKGridLayout setDataSourceForUpdate:](self, "setDataSourceForUpdate:", 0);
}

- (void)prepareForUpdate:(unint64_t)a3 inDataSource:(id)a4
{
  id v6;

  v6 = a4;
  -[GKGridLayout setUpdateType:](self, "setUpdateType:", a3);
  -[GKGridLayout setDataSourceForUpdate:](self, "setDataSourceForUpdate:", v6);

}

- (void)prepareForMovingItemsCarryingSections
{
  self->_movedItemsInUpdateCarrySections = 1;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSArray *v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  NSArray *v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5 != 2
    || self->_updateType
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v9, "representedElementCategory"))
  {
    v10 = 0;
    goto LABEL_6;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = self->_currentUpdateItems;
  v10 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v10)
    goto LABEL_26;
  v27 = v8;
  v28 = v13;
  v14 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v14)
        objc_enumerationMutation(v13);
      v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v16, "updateAction") == 1)
      {
        objc_msgSend(v9, "indexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "indexPathBeforeUpdate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isEqual:", v18) & 1) != 0)
        {
          objc_msgSend(v9, "alpha");
          v20 = v19;

          if (v20 == 0.0)
            goto LABEL_25;
        }
        else
        {
          objc_msgSend(v9, "indexPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "section");
          objc_msgSend(v16, "indexPathBeforeUpdate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 != objc_msgSend(v23, "section"))
            goto LABEL_21;
          objc_msgSend(v16, "indexPathBeforeUpdate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "item") != 0x7FFFFFFFFFFFFFFFLL)
          {

LABEL_21:
            v13 = v28;
            continue;
          }
          objc_msgSend(v9, "alpha");
          v26 = v25;

          v13 = v28;
          if (v26 == 0.0)
          {
LABEL_25:
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
            v29[3] = &unk_1E59C4EC0;
            v8 = v27;
            v30 = v27;
            v10 = (void *)objc_msgSend(v29, "copy");

            goto LABEL_26;
          }
        }
      }
    }
    v10 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v10)
      continue;
    break;
  }
  v8 = v27;
LABEL_26:

LABEL_6:
  v11 = _Block_copy(v10);

  return v11;
}

void __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  v9[3] = &unk_1E59C4148;
  v10 = *(id *)(a1 + 32);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  v7[3] = &unk_1E59C4458;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v9, v7, 0.2);

}

uint64_t __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeForDelete");
}

uint64_t __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (unint64_t)portraitInterleavedSectionsCount
{
  return self->_portraitInterleavedSectionsCount;
}

- (unint64_t)landscapeInterleavedSectionsCount
{
  return self->_landscapeInterleavedSectionsCount;
}

- (double)leftLayoutGuideOffset
{
  return self->_leftLayoutGuideOffset;
}

- (double)rightLayoutGuideOffset
{
  return self->_rightLayoutGuideOffset;
}

- (BOOL)hideSearchBarOnAppear
{
  return self->_hideSearchBarOnAppear;
}

- (void)setHideSearchBarOnAppear:(BOOL)a3
{
  self->_hideSearchBarOnAppear = a3;
}

- (BOOL)hideAboveSegmentOnAppear
{
  return self->_hideAboveSegmentOnAppear;
}

- (void)setHideAboveSegmentOnAppear:(BOOL)a3
{
  self->_hideAboveSegmentOnAppear = a3;
}

- (CGSize)laidOutContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_laidOutContentSize.width;
  height = self->_laidOutContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLaidOutContentSize:(CGSize)a3
{
  self->_laidOutContentSize = a3;
}

- (CGSize)minimumLaidOutContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumLaidOutContentSize.width;
  height = self->_minimumLaidOutContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumLaidOutContentSize:(CGSize)a3
{
  self->_minimumLaidOutContentSize = a3;
}

- (double)bottomContentPadding
{
  return self->_bottomContentPadding;
}

- (void)setBottomContentPadding:(double)a3
{
  self->_bottomContentPadding = a3;
}

- (BOOL)ignoreBoundsForSizeCalculation
{
  return self->_ignoreBoundsForSizeCalculation;
}

- (void)setIgnoreBoundsForSizeCalculation:(BOOL)a3
{
  self->_ignoreBoundsForSizeCalculation = a3;
}

- (NSPointerArray)sectionToPresentationData
{
  return self->_sectionToPresentationData;
}

- (void)setSectionToPresentationData:(id)a3
{
  objc_storeStrong((id *)&self->_sectionToPresentationData, a3);
}

- (NSPointerArray)sectionToMetricData
{
  return self->_sectionToMetricData;
}

- (void)setSectionToMetricData:(id)a3
{
  objc_storeStrong((id *)&self->_sectionToMetricData, a3);
}

- (NSMutableArray)laidOutAttributes
{
  return self->_laidOutAttributes;
}

- (void)setLaidOutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_laidOutAttributes, a3);
}

- (NSMutableOrderedSet)laidOutPinnableAttributes
{
  return self->_laidOutPinnableAttributes;
}

- (void)setLaidOutPinnableAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_laidOutPinnableAttributes, a3);
}

- (CGSize)oldLaidOutContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_oldLaidOutContentSize.width;
  height = self->_oldLaidOutContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOldLaidOutContentSize:(CGSize)a3
{
  self->_oldLaidOutContentSize = a3;
}

- (NSMutableDictionary)indexPathToSupplementary
{
  return self->_indexPathToSupplementary;
}

- (void)setIndexPathToSupplementary:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToSupplementary, a3);
}

- (NSMutableDictionary)indexPathToDecoration
{
  return self->_indexPathToDecoration;
}

- (void)setIndexPathToDecoration:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToDecoration, a3);
}

- (NSMutableDictionary)indexPathToItem
{
  return self->_indexPathToItem;
}

- (void)setIndexPathToItem:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToItem, a3);
}

- (NSMutableDictionary)oldIndexPathToSupplementary
{
  return self->_oldIndexPathToSupplementary;
}

- (void)setOldIndexPathToSupplementary:(id)a3
{
  objc_storeStrong((id *)&self->_oldIndexPathToSupplementary, a3);
}

- (NSMutableDictionary)oldIndexPathToDecoration
{
  return self->_oldIndexPathToDecoration;
}

- (void)setOldIndexPathToDecoration:(id)a3
{
  objc_storeStrong((id *)&self->_oldIndexPathToDecoration, a3);
}

- (NSMutableDictionary)oldIndexPathToItem
{
  return self->_oldIndexPathToItem;
}

- (void)setOldIndexPathToItem:(id)a3
{
  objc_storeStrong((id *)&self->_oldIndexPathToItem, a3);
}

- (NSMutableDictionary)indexPathToMetrics
{
  return self->_indexPathToMetrics;
}

- (void)setIndexPathToMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToMetrics, a3);
}

- (NSMutableIndexSet)sectionsWithPinnedHeaders
{
  return self->_sectionsWithPinnedHeaders;
}

- (void)setSectionsWithPinnedHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_sectionsWithPinnedHeaders, a3);
}

- (NSMutableSet)revealedIndexPaths
{
  return self->_revealedIndexPaths;
}

- (void)setRevealedIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_revealedIndexPaths, a3);
}

- (NSIndexPath)indexPathOfTouchedShowMore
{
  return self->_indexPathOfTouchedShowMore;
}

- (void)setIndexPathOfTouchedShowMore:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathOfTouchedShowMore, a3);
}

- (BOOL)noMoreShowMore
{
  return self->_noMoreShowMore;
}

- (void)setNoMoreShowMore:(BOOL)a3
{
  self->_noMoreShowMore = a3;
}

- (NSMutableDictionary)keyToMetricData
{
  return self->_keyToMetricData;
}

- (void)setKeyToMetricData:(id)a3
{
  objc_storeStrong((id *)&self->_keyToMetricData, a3);
}

- (NSMutableDictionary)oldSectionToMetricKeys
{
  return self->_oldSectionToMetricKeys;
}

- (void)setOldSectionToMetricKeys:(id)a3
{
  objc_storeStrong((id *)&self->_oldSectionToMetricKeys, a3);
}

- (int64_t)metricsInvalidationCount
{
  return self->_metricsInvalidationCount;
}

- (void)setMetricsInvalidationCount:(int64_t)a3
{
  self->_metricsInvalidationCount = a3;
}

- (NSArray)currentUpdateItems
{
  return self->_currentUpdateItems;
}

- (void)setCurrentUpdateItems:(id)a3
{
  objc_storeStrong((id *)&self->_currentUpdateItems, a3);
}

- (NSMutableSet)knownSupplementaryKinds
{
  return self->_knownSupplementaryKinds;
}

- (void)setKnownSupplementaryKinds:(id)a3
{
  objc_storeStrong((id *)&self->_knownSupplementaryKinds, a3);
}

- (GKCollectionViewDataSource)dataSourceForUpdate
{
  return self->_dataSourceForUpdate;
}

- (void)setDataSourceForUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceForUpdate, a3);
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (BOOL)movedItemsInUpdateCarrySections
{
  return self->_movedItemsInUpdateCarrySections;
}

- (void)setMovedItemsInUpdateCarrySections:(BOOL)a3
{
  self->_movedItemsInUpdateCarrySections = a3;
}

- (BOOL)displayClipView
{
  return self->_displayClipView;
}

- (void)setDisplayClipView:(BOOL)a3
{
  self->_displayClipView = a3;
}

- (GKCollectionViewLayoutAttributes)clipViewAttributes
{
  return self->_clipViewAttributes;
}

- (void)setClipViewAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_clipViewAttributes, a3);
}

- (unint64_t)invalidationFlags
{
  return self->_invalidationFlags;
}

- (void)setInvalidationFlags:(unint64_t)a3
{
  self->_invalidationFlags = a3;
}

- (BOOL)displayingOverlay
{
  return self->_displayingOverlay;
}

- (void)setDisplayingOverlay:(BOOL)a3
{
  self->_displayingOverlay = a3;
}

- (double)segmentedBoxY
{
  return self->_segmentedBoxY;
}

- (void)setSegmentedBoxY:(double)a3
{
  self->_segmentedBoxY = a3;
}

- (BOOL)shouldLayoutRTL
{
  return self->_shouldLayoutRTL;
}

- (void)setShouldLayoutRTL:(BOOL)a3
{
  self->_shouldLayoutRTL = a3;
}

- (NSSet)visibleIndexPathsFilter
{
  return self->_visibleIndexPathsFilter;
}

- (void)setDefaultSectionMetricsInternal:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSectionMetricsInternal, a3);
}

- (GKDataSourceMetrics)dataSourceMetrics
{
  return self->_dataSourceMetrics;
}

- (void)setDataSourceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceMetrics, a3);
}

- (double)hiddenSearchBarOffset
{
  return self->_hiddenSearchBarOffset;
}

- (void)setHiddenSearchBarOffset:(double)a3
{
  self->_hiddenSearchBarOffset = a3;
}

- (double)segmentedHeaderPinningOffset
{
  return self->_segmentedHeaderPinningOffset;
}

- (void)setSegmentedHeaderPinningOffset:(double)a3
{
  self->_segmentedHeaderPinningOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceMetrics, 0);
  objc_storeStrong((id *)&self->_defaultSectionMetricsInternal, 0);
  objc_storeStrong((id *)&self->_visibleIndexPathsFilter, 0);
  objc_storeStrong((id *)&self->_clipViewAttributes, 0);
  objc_storeStrong((id *)&self->_dataSourceForUpdate, 0);
  objc_storeStrong((id *)&self->_knownSupplementaryKinds, 0);
  objc_storeStrong((id *)&self->_currentUpdateItems, 0);
  objc_storeStrong((id *)&self->_oldSectionToMetricKeys, 0);
  objc_storeStrong((id *)&self->_keyToMetricData, 0);
  objc_storeStrong((id *)&self->_indexPathOfTouchedShowMore, 0);
  objc_storeStrong((id *)&self->_revealedIndexPaths, 0);
  objc_storeStrong((id *)&self->_sectionsWithPinnedHeaders, 0);
  objc_storeStrong((id *)&self->_indexPathToMetrics, 0);
  objc_storeStrong((id *)&self->_oldIndexPathToItem, 0);
  objc_storeStrong((id *)&self->_oldIndexPathToDecoration, 0);
  objc_storeStrong((id *)&self->_oldIndexPathToSupplementary, 0);
  objc_storeStrong((id *)&self->_indexPathToItem, 0);
  objc_storeStrong((id *)&self->_indexPathToDecoration, 0);
  objc_storeStrong((id *)&self->_indexPathToSupplementary, 0);
  objc_storeStrong((id *)&self->_laidOutPinnableAttributes, 0);
  objc_storeStrong((id *)&self->_laidOutAttributes, 0);
  objc_storeStrong((id *)&self->_sectionToMetricData, 0);
  objc_storeStrong((id *)&self->_sectionToPresentationData, 0);
}

@end
