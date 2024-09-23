@implementation HKMCCycleTimelineFlowLayout

- (HKMCCycleTimelineFlowLayout)initWithYOffset:(double)a3 pillConfigurations:(id)a4 introPillConfiguration:(id)a5 pillAspectRatio:(double)a6
{
  id v12;
  id v13;
  HKMCCycleTimelineFlowLayout *v14;
  HKMCCycleTimelineFlowLayout *v15;
  id *p_pillConfigurations;
  void *v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMCCycleTimelineFlowLayout.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pillConfigurations count] > 0"));

  }
  v37.receiver = self;
  v37.super_class = (Class)HKMCCycleTimelineFlowLayout;
  v14 = -[UICollectionViewFlowLayout init](&v37, sel_init);
  v15 = v14;
  if (v14)
  {
    v32 = v13;
    v14->_yOffset = a3;
    p_pillConfigurations = (id *)&v14->_pillConfigurations;
    objc_storeStrong((id *)&v14->_pillConfigurations, a4);
    objc_storeStrong((id *)&v15->_introPillConfiguration, a5);
    v15->_pillAspectRatio = a6;
    objc_msgSend(*p_pillConfigurations, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v12, "count") >> 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightWithAspectRatio:", a6);
    v15->_centerPillHeight = v18;
    objc_msgSend(v17, "width");
    v19 = v15->_centerPillHeight + a3;
    v15->_cellSize.width = v20;
    v15->_cellSize.height = v19;
    v15->_totalZoomWidth = 0.0;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v21 = *p_pillConfigurations;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v26, "width");
          v28 = v27;
          objc_msgSend(v26, "spacing");
          v15->_totalZoomWidth = v15->_totalZoomWidth + v28 + v29;
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v23);
    }

    -[UICollectionViewFlowLayout setScrollDirection:](v15, "setScrollDirection:", 1);
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](v15, "setMinimumLineSpacing:", 0.0);
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v15, "setMinimumInteritemSpacing:", 0.0);
    -[UICollectionViewFlowLayout setItemSize:](v15, "setItemSize:", v15->_cellSize.width, v15->_cellSize.height);

    v13 = v32;
  }

  return v15;
}

- (CGSize)configuredSize
{
  double v3;
  double v4;
  CGSize result;

  v3 = self->_cellSize.width * (double)-[NSArray count](self->_pillConfigurations, "count");
  v4 = self->_centerPillHeight + self->_yOffset;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)HKMCCycleTimelineFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](&v14, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[HKMCCycleTimelineFlowLayout _configureLayoutAttributes:](self, "_configureLayoutAttributes:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMCCycleTimelineFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v6, sel_layoutAttributesForItemAtIndexPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCCycleTimelineFlowLayout _configureLayoutAttributes:](self, "_configureLayoutAttributes:", v4);
  return v4;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double width;
  double v16;
  double v17;
  CGPoint result;
  CGRect v19;

  -[HKMCCycleTimelineFlowLayout collectionView](self, "collectionView", a3.x, a3.y, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (double)-[NSIndexPath item](self->_centerIndexPath, "item");
  width = self->_cellSize.width;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  v16 = (CGRectGetWidth(v19) - width) * -0.5 + v14 * width;
  v17 = 0.0;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[HKMCCycleTimelineFlowLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", a3.x, a3.y, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMCCycleTimelineFlowLayout;
  -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v5, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidateFlowLayoutAttributes:", 0);
  objc_msgSend(v3, "setInvalidateFlowLayoutDelegateMetrics:", 0);
  return v3;
}

- (void)prepareLayout
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double MidX;
  NSIndexPath *v16;
  NSIndexPath *centerIndexPath;
  NSIndexPath *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  NSInteger v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _NSRange *p_zoomRange;
  uint64_t v33;
  NSUInteger v34;
  objc_super v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36.receiver = self;
  v36.super_class = (Class)HKMCCycleTimelineFlowLayout;
  -[UICollectionViewFlowLayout prepareLayout](&v36, sel_prepareLayout);
  -[HKMCCycleTimelineFlowLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "contentOffset");
  v13 = v12;
  v14 = v12 + v9 * 0.5;
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  MidX = CGRectGetMidX(v37);
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  objc_msgSend(v3, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v38));
  v16 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  centerIndexPath = self->_centerIndexPath;
  self->_centerIndexPath = v16;

  v18 = self->_centerIndexPath;
  v35.receiver = self;
  v35.super_class = (Class)HKMCCycleTimelineFlowLayout;
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](&v35, sel_layoutAttributesForItemAtIndexPath_, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v39.origin.x = v21;
  v39.origin.y = v23;
  v39.size.width = v25;
  v39.size.height = v27;
  self->_offsetFactor = (CGRectGetMidX(v39) - v14) / self->_cellSize.width;
  v28 = -[NSIndexPath item](self->_centerIndexPath, "item");
  v29 = -[NSArray count](self->_pillConfigurations, "count");
  if (v29 >= 0)
    v30 = v29;
  else
    v30 = v29 + 1;
  v31 = v28 - (v30 >> 1);
  p_zoomRange = &self->_zoomRange;
  if (v31 <= 1)
    v33 = 1;
  else
    v33 = v31;
  v34 = -[NSArray count](self->_pillConfigurations, "count");
  p_zoomRange->location = v33 - 1;
  self->_zoomRange.length = v34 + 1;
  if (self->_offsetFactor < 0.0)
    p_zoomRange->location = v33;
  self->_zoomAreaOffset = v13 + (v9 - self->_totalZoomWidth) * 0.5;

}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)_configureLayoutAttributes:(id)a3
{
  void *v4;
  unint64_t v5;
  NSUInteger location;
  double x;
  double y;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  id v18;
  CGRect v19;

  v18 = a3;
  objc_msgSend(v18, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "item");

  location = self->_zoomRange.location;
  if (v5 < location || v5 - location >= self->_zoomRange.length)
  {
    width = self->_cellSize.width;
    height = self->_cellSize.height;
    v12 = 0.0;
    y = 0.0;
    v14 = 0.0;
  }
  else
  {
    -[HKMCCycleTimelineFlowLayout _pillFrameAtZoomIndex:](self, "_pillFrameAtZoomIndex:");
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;
    v12 = fabs(CGRectGetMidX(v19) / self->_totalZoomWidth * 2.0 + -1.0);
    objc_msgSend(v18, "frame");
    v14 = x - (v13 - self->_zoomAreaOffset);
    -[HKMCCycleTimelineFlowLayout collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "effectiveUserInterfaceLayoutDirection");

    if (v16 == 1)
    {
      objc_msgSend(v18, "frame");
      v14 = v17 - v14 - width;
    }
  }
  objc_msgSend(v18, "setPillFrame:", v14, y, width, height);
  objc_msgSend(v18, "setShrinkFactor:", v12);

}

- (CGRect)_pillFrameAtZoomIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double offsetFactor;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[HKMCCycleTimelineFlowLayout _configurationAtIndex:](self, "_configurationAtIndex:", a3 - 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCCycleTimelineFlowLayout _configurationAtIndex:](self, "_configurationAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "width");
  v8 = v7;
  objc_msgSend(v6, "width");
  offsetFactor = self->_offsetFactor;
  v11 = v10 - v8;
  v12 = v10 + (v10 - v8) * offsetFactor;
  v13 = v8 + v11 * offsetFactor;
  if (offsetFactor >= 0.0)
    v14 = v13;
  else
    v14 = v12;
  v15 = v14 * self->_pillAspectRatio;
  -[HKMCCycleTimelineFlowLayout _pillOriginXAtZoomIndex:centerPill:](self, "_pillOriginXAtZoomIndex:centerPill:", a3, 1);
  v17 = v16;
  v18 = self->_yOffset + (self->_centerPillHeight - v15) * 0.5;

  v19 = v17;
  v20 = v18;
  v21 = v14;
  v22 = v15;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)_pillOriginXAtZoomIndex:(int64_t)a3 centerPill:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double offsetFactor;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v4 = a4;
  v7 = a3 - 1;
  if (a3 < 1)
  {
    v9 = 0.0;
  }
  else
  {
    -[HKMCCycleTimelineFlowLayout _pillOriginXAtZoomIndex:centerPill:](self, "_pillOriginXAtZoomIndex:centerPill:", a3 - 1, 0);
    v9 = v8;
  }
  -[HKMCCycleTimelineFlowLayout _configurationAtIndex:](self, "_configurationAtIndex:", a3 - 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCCycleTimelineFlowLayout _configurationAtIndex:](self, "_configurationAtIndex:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "width");
  v13 = v12;
  objc_msgSend(v11, "width");
  offsetFactor = self->_offsetFactor;
  v16 = v15 - v13;
  v17 = v15 + (v15 - v13) * offsetFactor;
  v18 = v13 + v16 * offsetFactor;
  if (offsetFactor >= 0.0)
    v19 = v18;
  else
    v19 = v17;
  objc_msgSend(v10, "spacing");
  v21 = v20;
  objc_msgSend(v11, "spacing");
  v22 = self->_offsetFactor;
  v24 = v23 - v21;
  v25 = v23 + (v23 - v21) * v22;
  v26 = v21 + v24 * v22;
  if (v22 >= 0.0)
    v25 = v26;
  v27 = v9 + v19 + v25;
  if (v4)
  {
    -[HKMCCycleTimelineFlowLayout _configurationAtIndex:](self, "_configurationAtIndex:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "spacing");
    v30 = v29;
    -[HKMCCycleTimelineFlowLayout _configurationAtIndex:](self, "_configurationAtIndex:", a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "spacing");
    v32 = self->_offsetFactor;
    v34 = v33 - v30;
    v35 = v33 + (v33 - v30) * v32;
    v36 = v30 + v34 * v32;
    if (v32 >= 0.0)
      v37 = v36;
    else
      v37 = v35;

    v27 = v27 + v37 * 0.5;
  }

  return v27;
}

- (id)_configurationAtIndex:(int64_t)a3
{
  HKMCCycleTimelinePillConfiguration *v5;

  if (a3 < 0 || -[NSArray count](self->_pillConfigurations, "count") <= a3)
  {
    v5 = self->_introPillConfiguration;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_pillConfigurations, "objectAtIndexedSubscript:", a3);
    v5 = (HKMCCycleTimelinePillConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerIndexPath, 0);
  objc_storeStrong((id *)&self->_introPillConfiguration, 0);
  objc_storeStrong((id *)&self->_pillConfigurations, 0);
}

@end
