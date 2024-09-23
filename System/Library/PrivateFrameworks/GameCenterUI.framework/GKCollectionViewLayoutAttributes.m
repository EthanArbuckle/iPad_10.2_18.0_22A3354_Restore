@implementation GKCollectionViewLayoutAttributes

- (GKCollectionViewLayoutAttributes)init
{
  GKCollectionViewLayoutAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewLayoutAttributes;
  result = -[UICollectionViewLayoutAttributes init](&v3, sel_init);
  if (result)
    result->_allSectionItemsVisible = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKCollectionViewLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setAllSectionItemsVisible:", self->_allSectionItemsVisible);
    objc_msgSend(v5, "setIsPinned:", self->_isPinned);
    objc_msgSend(v5, "setIsPartOfGlobalPinningGroup:", self->_isPartOfGlobalPinningGroup);
    objc_msgSend(v5, "setUnpinnedY:", self->_unpinnedY);
    objc_msgSend(v5, "setDataSource:", self->_dataSource);
    objc_msgSend(v5, "setSectionMetrics:", self->_sectionMetrics);
    objc_msgSend(v5, "setSupplementaryMetrics:", self->_supplementaryMetrics);
    objc_msgSend(v5, "setCurrentVisibleItemCount:", self->_currentVisibleItemCount);
    objc_msgSend(v5, "setCurrentTotalItemCount:", self->_currentTotalItemCount);
    objc_msgSend(v5, "setMaxTotalItemCount:", self->_maxTotalItemCount);
    objc_msgSend(v5, "setGridLayoutLocation:", self->_gridLayoutLocation);
    objc_msgSend(v5, "setDoesAbutLeftOfCollectionView:", self->_doesAbutLeftOfCollectionView);
    objc_msgSend(v5, "setLeadingMargin:", self->_leadingMargin);
    objc_msgSend(v5, "setTrailingMargin:", self->_trailingMargin);
  }
  return v5;
}

- (id)description
{
  double leadingMargin;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  UICollectionViewDataSource *dataSource;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  objc_super v31;

  v28 = (void *)MEMORY[0x1E0CB3940];
  v31.receiver = self;
  v31.super_class = (Class)GKCollectionViewLayoutAttributes;
  -[UICollectionViewLayoutAttributes description](&v31, sel_description);
  v30 = objc_claimAutoreleasedReturnValue();
  leadingMargin = self->_leadingMargin;
  if (leadingMargin == 0.0)
  {
    v29 = &stru_1E59EB978;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leadingMargin);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v5;
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@: %@"), v5, v26);
    v29 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_isPinned)
    v6 = CFSTR("pinned");
  else
    v6 = &stru_1E59EB978;
  if (self->_allSectionItemsVisible)
    v7 = CFSTR("allvis");
  else
    v7 = &stru_1E59EB978;
  dataSource = self->_dataSource;
  if (dataSource)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self->_dataSource);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v10;
    objc_msgSend(v9, "stringWithFormat:", CFSTR(" %@: %@"), v10, v24);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E59EB978;
  }
  if (self->_sectionMetrics)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    _gkBeautifyVariableName();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self->_sectionMetrics);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@: %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v7;
    v16 = (__CFString *)v29;
    v20 = v6;
    v17 = (void *)v30;
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@"), v30, v29, v20, v22, &stru_1E59EB978, v11, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!dataSource)
      goto LABEL_16;
    goto LABEL_15;
  }
  v23 = v7;
  v16 = (__CFString *)v29;
  v21 = v6;
  v17 = (void *)v30;
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@"), v30, v29, v21, v23, &stru_1E59EB978, v11, &stru_1E59EB978);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (dataSource)
  {
LABEL_15:

  }
LABEL_16:
  if (leadingMargin != 0.0)
  {

  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  unint64_t v7;
  unsigned __int8 v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  BOOL v24;
  objc_super v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)GKCollectionViewLayoutAttributes;
    v5 = -[UICollectionViewLayoutAttributes isEqual:](&v26, sel_isEqual_, v4);
    v6 = v4;
    v7 = -[GKCollectionViewLayoutAttributes maxTotalItemCount](self, "maxTotalItemCount");
    if (v7 == objc_msgSend(v6, "maxTotalItemCount"))
      v8 = v5;
    else
      v8 = 0;
    v9 = -[GKCollectionViewLayoutAttributes currentVisibleItemCount](self, "currentVisibleItemCount");
    if (v9 != objc_msgSend(v6, "currentVisibleItemCount"))
      v8 = 0;
    v10 = -[GKCollectionViewLayoutAttributes currentTotalItemCount](self, "currentTotalItemCount");
    if (v10 == objc_msgSend(v6, "currentTotalItemCount"))
      v11 = v8;
    else
      v11 = 0;
    -[GKCollectionViewLayoutAttributes leadingMargin](self, "leadingMargin");
    v13 = v12;
    objc_msgSend(v6, "leadingMargin");
    if (v13 != v14)
      v11 = 0;
    -[GKCollectionViewLayoutAttributes trailingMargin](self, "trailingMargin");
    v16 = v15;
    objc_msgSend(v6, "trailingMargin");
    if (v16 == v17)
      v18 = v11;
    else
      v18 = 0;
    -[GKCollectionViewLayoutAttributes sectionMetrics](self, "sectionMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "calculatedItemHeight");
    v21 = v20;
    objc_msgSend(v6, "sectionMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "calculatedItemHeight");
    v24 = v21 == v23 && v18;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewLayoutAttributes;
  return -[UICollectionViewLayoutAttributes hash](&v3, sel_hash);
}

- (BOOL)allSectionItemsVisible
{
  return self->_allSectionItemsVisible;
}

- (void)setAllSectionItemsVisible:(BOOL)a3
{
  self->_allSectionItemsVisible = a3;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (void)setIsPinned:(BOOL)a3
{
  self->_isPinned = a3;
}

- (double)unpinnedY
{
  return self->_unpinnedY;
}

- (void)setUnpinnedY:(double)a3
{
  self->_unpinnedY = a3;
}

- (UICollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (GKSectionMetrics)sectionMetrics
{
  return self->_sectionMetrics;
}

- (void)setSectionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_sectionMetrics, a3);
}

- (GKSupplementaryViewMetrics)supplementaryMetrics
{
  return self->_supplementaryMetrics;
}

- (void)setSupplementaryMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryMetrics, a3);
}

- (unint64_t)currentVisibleItemCount
{
  return self->_currentVisibleItemCount;
}

- (void)setCurrentVisibleItemCount:(unint64_t)a3
{
  self->_currentVisibleItemCount = a3;
}

- (unint64_t)currentTotalItemCount
{
  return self->_currentTotalItemCount;
}

- (void)setCurrentTotalItemCount:(unint64_t)a3
{
  self->_currentTotalItemCount = a3;
}

- (unint64_t)maxTotalItemCount
{
  return self->_maxTotalItemCount;
}

- (void)setMaxTotalItemCount:(unint64_t)a3
{
  self->_maxTotalItemCount = a3;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (BOOL)isPartOfGlobalPinningGroup
{
  return self->_isPartOfGlobalPinningGroup;
}

- (void)setIsPartOfGlobalPinningGroup:(BOOL)a3
{
  self->_isPartOfGlobalPinningGroup = a3;
}

- (unint64_t)gridLayoutLocation
{
  return self->_gridLayoutLocation;
}

- (void)setGridLayoutLocation:(unint64_t)a3
{
  self->_gridLayoutLocation = a3;
}

- (BOOL)doesAbutLeftOfCollectionView
{
  return self->_doesAbutLeftOfCollectionView;
}

- (void)setDoesAbutLeftOfCollectionView:(BOOL)a3
{
  self->_doesAbutLeftOfCollectionView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryMetrics, 0);
  objc_storeStrong((id *)&self->_sectionMetrics, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
