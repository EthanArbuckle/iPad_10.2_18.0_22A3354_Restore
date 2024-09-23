@implementation GKSectionMetrics

+ (id)metricsForIdiom:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdiom:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKSectionMetrics;
  v4 = -[GKGridLayoutMetrics copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setPadding:", self->_padding.top, self->_padding.left, self->_padding.bottom, self->_padding.right);
    objc_msgSend(v5, "setAlignment:", self->_alignment);
    objc_msgSend(v5, "setLineSpacing:", self->_lineSpacing);
    objc_msgSend(v5, "setInteritemSpacing:", self->_interitemSpacing);
    objc_msgSend(v5, "setDesiredItemWidth:", self->_desiredItemWidth);
    objc_msgSend(v5, "setDesiredItemHeight:", self->_desiredItemHeight);
    objc_msgSend(v5, "setFlowColumnWidth:", self->_flowColumnWidth);
    objc_msgSend(v5, "setFlowMaxColumnCount:", self->_flowMaxColumnCount);
    objc_msgSend(v5, "setUseViewSizeForFlowMaxColumnCount:", self->_useViewSizeForFlowMaxColumnCount);
    objc_msgSend(v5, "setItemHeightList:", self->_itemHeightList);
    objc_msgSend(v5, "setLastLineItemAlignment:", self->_lastLineItemAlignment);
    objc_msgSend(v5, "setMaximumVisibleItemCount:", self->_maximumVisibleItemCount);
    objc_msgSend(v5, "setIncrementalRevealItemCount:", self->_incrementalRevealItemCount);
    objc_msgSend(v5, "setIncrementalRevealConsumesPadding:", self->_incrementalRevealConsumesPadding);
    objc_msgSend(v5, "setShouldAlwaysIncludeShowMore:", self->_shouldAlwaysIncludeShowMore);
    objc_msgSend(v5, "setMarginBetweenItems:", self->_marginBetweenItems);
    objc_msgSend(v5, "setShouldShowSectionHeadersWhenNoItems:", self->_shouldShowSectionHeadersWhenNoItems);
  }
  return v5;
}

- (GKSectionMetrics)init
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v5 = *MEMORY[0x1E0D25B68] == 0;
    else
      v5 = 0;
    v6 = !v5;
  }
  else
  {
    v6 = 0;
  }
  return -[GKSectionMetrics initWithIdiom:](self, "initWithIdiom:", v6);
}

- (GKSectionMetrics)initWithIdiom:(int64_t)a3
{
  GKSectionMetrics *v4;
  GKSectionMetrics *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double *p_top;
  double v11;
  double v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GKSectionMetrics;
  v4 = -[GKGridLayoutMetrics init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_desiredItemWidth = 1.79769313e308;
    v4->_flowColumnWidth = 1.79769313e308;
    v4->_lastLineItemAlignment = 0;
    v4->_alignment = 1;
    v4->_maximumVisibleItemCount = -1;
    v4->_incrementalRevealItemCount = 3;
    v4->_incrementalRevealConsumesPadding = 1;
    v4->_marginBetweenItems = 20.0;
    +[GKSupplementaryViewMetrics supplementaryMetrics](GKSupplementaryViewMetrics, "supplementaryMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setKind:", CFSTR("SectionHeader"));
    objc_msgSend(v6, "setShouldPin:", 1);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    p_top = &v5->_padding.top;
    *(_QWORD *)&v5->_desiredItemHeight = qword_1AB7F7E60[a3 == 1];
    if (a3 == 1)
    {
      *p_top = 22.0;
      v5->_padding.left = 0.0;
      v5->_padding.bottom = 0.0;
      v5->_padding.right = 0.0;
      v11 = dbl_1AB7F7E70[v9 > 1.0];
    }
    else
    {
      v12 = 8.0;
      if (v9 > 1.0)
        v12 = 7.5;
      *p_top = v12;
      v5->_padding.left = 0.0;
      v5->_padding.bottom = v12;
      v5->_padding.right = 0.0;
      v11 = 35.0;
    }
    objc_msgSend(v6, "setDesiredHeight:", v11);
    -[GKGridLayoutMetrics addSupplementaryMetrics:forKey:atLocation:](v5, "addSupplementaryMetrics:forKey:atLocation:", v6, CFSTR("HeaderMetricKey"), 0);
    +[GKSupplementaryViewMetrics supplementaryMetrics](GKSupplementaryViewMetrics, "supplementaryMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setKind:", CFSTR("IncrementalReveal"));
    objc_msgSend(v13, "setDesiredHeight:", v5->_desiredItemHeight);
    -[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:](v5, "insertSupplementaryMetrics:forKey:atLocation:", v13, CFSTR("ShowMoreMetricKey"), 1);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float64x2_t *v5;
  float64x2_t *v6;
  double v7;
  double v8;
  double v9;
  NSDictionary *itemHeightList;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float64x2_t *)v4;
    v6 = v5;
    v11 = (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_padding.top, v5[9]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_padding.bottom, v5[10]))), 0xFuLL))) & 1) != 0&& self->_alignment == *(_QWORD *)&v5[2].f64[1]&& self->_lineSpacing == v5[3].f64[0]&& self->_interitemSpacing == v5[3].f64[1]&& (-[GKSectionMetrics calculatedItemHeight](self, "calculatedItemHeight"), v8 = v7, -[float64x2_t calculatedItemHeight](v6, "calculatedItemHeight"), v8 == v9)&& self->_desiredItemWidth == v6[4].f64[1]&& self->_flowColumnWidth == v6[5].f64[0]&& self->_flowMaxColumnCount == *(_QWORD *)&v6[5].f64[1]&& self->_useViewSizeForFlowMaxColumnCount == LOBYTE(v6[2].f64[0])&& (itemHeightList = self->_itemHeightList, itemHeightList == *(NSDictionary **)&v6[6].f64[1])&& (-[NSDictionary isEqual:](itemHeightList, "isEqual:", self->_itemHeightList) & 1) == 0
       && self->_lastLineItemAlignment == *(_QWORD *)&v6[7].f64[0]
       && self->_maximumVisibleItemCount == *(_QWORD *)&v6[7].f64[1]
       && self->_incrementalRevealItemCount == *(_QWORD *)&v6[8].f64[0]
       && self->_incrementalRevealConsumesPadding == BYTE1(v6[2].f64[0])
       && self->_shouldAlwaysIncludeShowMore == BYTE2(v6[2].f64[0])
       && self->_shouldShowSectionHeadersWhenNoItems == BYTE3(v6[2].f64[0]);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)localDescription
{
  float64x2_t *p_padding;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t maximumVisibleItemCount;
  unint64_t incrementalRevealItemCount;
  double lineSpacing;
  double interitemSpacing;
  __CFString *v13;
  double flowColumnWidth;
  double desiredItemWidth;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v22;
  unint64_t lastLineItemAlignment;
  unint64_t alignment;
  const __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;

  p_padding = (float64x2_t *)&self->_padding;
  NSStringFromUIEdgeInsets(self->_padding);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_desiredItemWidth == 1.79769313e308)
  {
    v5 = CFSTR("inf");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v5;
  if (self->_desiredItemHeight == 1.79769313e308)
  {
    v29 = CFSTR("inf");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)0x1E0CB3000;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  lastLineItemAlignment = self->_lastLineItemAlignment;
  alignment = self->_alignment;
  maximumVisibleItemCount = self->_maximumVisibleItemCount;
  if (maximumVisibleItemCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" maxVisItems:%ld"), self->_maximumVisibleItemCount);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = &stru_1E59EB978;
  }
  incrementalRevealItemCount = self->_incrementalRevealItemCount;
  if (incrementalRevealItemCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" incReveal:%ld"), self->_incrementalRevealItemCount);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = &stru_1E59EB978;
  }
  lineSpacing = self->_lineSpacing;
  if (lineSpacing <= 0.0)
  {
    v26 = &stru_1E59EB978;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" lineSpacing:%f"), *(_QWORD *)&lineSpacing);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  interitemSpacing = self->_interitemSpacing;
  v22 = v8;
  if (interitemSpacing <= 0.0)
  {
    v13 = &stru_1E59EB978;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" interitemSpacing:%f "), *(_QWORD *)&interitemSpacing);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  flowColumnWidth = self->_flowColumnWidth;
  desiredItemWidth = self->_desiredItemWidth;
  if (flowColumnWidth == desiredItemWidth)
  {
    v17 = &stru_1E59EB978;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_flowColumnWidth);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("flowWidth:%@"), v6);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*p_padding, *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(p_padding[1], *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL))) & 1) != 0)
  {
    v19 = (__CFString *)v25;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p> align:%ld lastAlign:%ld %@%@%@%@ size:{%@, %@}%@%@"), v22, self, alignment, lastLineItemAlignment, v28, v27, v26, v13, v25, v29, v17, &stru_1E59EB978);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" pad:%@"), v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (__CFString *)v25;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p> align:%ld lastAlign:%ld %@%@%@%@ size:{%@, %@}%@%@"), v22, self, alignment, lastLineItemAlignment, v28, v27, v26, v13, v25, v29, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (flowColumnWidth != desiredItemWidth)
  {

  }
  if (interitemSpacing > 0.0)

  if (lineSpacing > 0.0)
  if (incrementalRevealItemCount)

  if (maximumVisibleItemCount)
  return v20;
}

- (double)sectionHeaderHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self, "supplementaryMetricsForKey:", CFSTR("HeaderMetricKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "desiredHeight");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setSectionHeaderHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self, "supplementaryMetricsForKey:", CFSTR("HeaderMetricKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (metrics != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKSectionMetrics setSectionHeaderHeight:]", objc_msgSend(v8, "UTF8String"), 515);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
    v4 = 0;
  }
  objc_msgSend(v4, "setDesiredHeight:", a3);

}

- (double)showMoreHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self, "supplementaryMetricsForKey:", CFSTR("ShowMoreMetricKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "desiredHeight");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setShowMoreHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self, "supplementaryMetricsForKey:", CFSTR("ShowMoreMetricKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (metrics != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKSectionMetrics setShowMoreHeight:]", objc_msgSend(v8, "UTF8String"), 528);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
    v4 = 0;
  }
  objc_msgSend(v4, "setDesiredHeight:", a3);

}

- (BOOL)sectionHeadersShouldPin
{
  void *v2;
  void *v3;
  char v4;

  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self, "supplementaryMetricsForKey:", CFSTR("HeaderMetricKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "shouldPin");
  else
    v4 = 0;

  return v4;
}

- (void)setSectionHeadersShouldPin:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = a3;
  -[GKGridLayoutMetrics supplementaryMetricsForKey:](self, "supplementaryMetricsForKey:", CFSTR("HeaderMetricKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (metrics != ((void *)0))\n[%s (%s:%d)]"), v6, "-[GKSectionMetrics setSectionHeadersShouldPin:]", objc_msgSend(v8, "UTF8String"), 541);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
    v4 = 0;
  }
  objc_msgSend(v4, "setShouldPin:", v3);

}

- (void)setItemHeightList:(id)a3
{
  NSDictionary *v5;
  NSDictionary *v6;

  v5 = (NSDictionary *)a3;
  if (self->_itemHeightList != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_itemHeightList, a3);
    v5 = v6;
    self->_calculatedItemHeightCache = 0.0;
  }

}

- (double)calculatedItemHeight
{
  double desiredItemHeight;
  NSDictionary *itemHeightList;
  double *v5;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  double calculatedItemHeightCache;

  v8 = 0;
  v9 = (double *)&v8;
  desiredItemHeight = self->_desiredItemHeight;
  v10 = 0x2020000000;
  calculatedItemHeightCache = desiredItemHeight;
  itemHeightList = self->_itemHeightList;
  if (itemHeightList)
  {
    desiredItemHeight = self->_calculatedItemHeightCache;
    if (desiredItemHeight <= 0.0)
    {
      calculatedItemHeightCache = 0.0;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __40__GKSectionMetrics_calculatedItemHeight__block_invoke;
      v7[3] = &unk_1E59C4C50;
      v7[4] = &v8;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](itemHeightList, "enumerateKeysAndObjectsUsingBlock:", v7);
      v5 = v9;
      self->_calculatedItemHeightCache = v9[3];
      desiredItemHeight = v5[3];
    }
    else
    {
      calculatedItemHeightCache = self->_calculatedItemHeightCache;
    }
  }
  _Block_object_dispose(&v8, 8);
  return desiredItemHeight;
}

void __40__GKSectionMetrics_calculatedItemHeight__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("GKFixedHeightSentinel")))
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D25B28];
    objc_msgSend(v5, "doubleValue");
    v10 = v9;

    objc_msgSend(v8, "scaledValueFromHISpecLeading:forFontTextStyle:", v12, v10);
    v7 = v11;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

- (unint64_t)flowMaxColumnCountForViewWidth:(double)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 <= 507.0)
    v3 = 1;
  if (a3 <= 990.5)
    return v3;
  else
    return 3;
}

- (CGSize)itemSizeForCollectionView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double desiredItemWidth;
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
  double v18;
  double flowColumnWidth;
  float v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t flowMaxColumnCount;
  unint64_t v26;
  float v27;
  double v28;
  double v29;
  CGSize result;

  v4 = a3;
  -[GKSectionMetrics calculatedItemHeight](self, "calculatedItemHeight");
  v6 = v5;
  desiredItemWidth = self->_desiredItemWidth;
  objc_msgSend(v4, "bounds");
  v9 = v8;
  v11 = v10;

  if (desiredItemWidth == 1.79769313e308)
  {
    -[GKSectionMetrics padding](self, "padding");
    v13 = v12;
    v15 = v14;
    -[GKSectionMetrics padding](self, "padding");
    v17 = v16;
    -[GKSectionMetrics padding](self, "padding");
    desiredItemWidth = v9 - (v17 + v18);
    if (self->_flowColumnWidth != 1.79769313e308)
    {
      -[GKSectionMetrics interitemSpacing](self, "interitemSpacing");
      flowColumnWidth = self->_flowColumnWidth;
      v20 = v9 - (v13 + v15) - flowColumnWidth;
      v22 = floorf(v20) / (v21 + flowColumnWidth) + 1.0;
      if ((unint64_t)v22 <= 1)
        v23 = 1;
      else
        v23 = (unint64_t)v22;
      if (self->_useViewSizeForFlowMaxColumnCount)
        flowMaxColumnCount = -[GKSectionMetrics flowMaxColumnCountForViewWidth:](self, "flowMaxColumnCountForViewWidth:", v9);
      else
        flowMaxColumnCount = self->_flowMaxColumnCount;
      if (v23 <= flowMaxColumnCount || flowMaxColumnCount == 0)
        v26 = v23;
      else
        v26 = flowMaxColumnCount;
      v27 = desiredItemWidth / (double)v26;
      desiredItemWidth = floorf(v27);
    }
  }
  if (v6 == 1.79769313e308)
    v28 = v11;
  else
    v28 = v6;
  v29 = desiredItemWidth;
  result.height = v28;
  result.width = v29;
  return result;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (double)marginBetweenItems
{
  return self->_marginBetweenItems;
}

- (void)setMarginBetweenItems:(double)a3
{
  self->_marginBetweenItems = a3;
}

- (double)desiredItemWidth
{
  return self->_desiredItemWidth;
}

- (void)setDesiredItemWidth:(double)a3
{
  self->_desiredItemWidth = a3;
}

- (double)flowColumnWidth
{
  return self->_flowColumnWidth;
}

- (void)setFlowColumnWidth:(double)a3
{
  self->_flowColumnWidth = a3;
}

- (BOOL)useViewSizeForFlowMaxColumnCount
{
  return self->_useViewSizeForFlowMaxColumnCount;
}

- (void)setUseViewSizeForFlowMaxColumnCount:(BOOL)a3
{
  self->_useViewSizeForFlowMaxColumnCount = a3;
}

- (unint64_t)flowMaxColumnCount
{
  return self->_flowMaxColumnCount;
}

- (void)setFlowMaxColumnCount:(unint64_t)a3
{
  self->_flowMaxColumnCount = a3;
}

- (double)desiredItemHeight
{
  return self->_desiredItemHeight;
}

- (void)setDesiredItemHeight:(double)a3
{
  self->_desiredItemHeight = a3;
}

- (NSDictionary)itemHeightList
{
  return self->_itemHeightList;
}

- (unint64_t)lastLineItemAlignment
{
  return self->_lastLineItemAlignment;
}

- (void)setLastLineItemAlignment:(unint64_t)a3
{
  self->_lastLineItemAlignment = a3;
}

- (unint64_t)maximumVisibleItemCount
{
  return self->_maximumVisibleItemCount;
}

- (void)setMaximumVisibleItemCount:(unint64_t)a3
{
  self->_maximumVisibleItemCount = a3;
}

- (unint64_t)incrementalRevealItemCount
{
  return self->_incrementalRevealItemCount;
}

- (void)setIncrementalRevealItemCount:(unint64_t)a3
{
  self->_incrementalRevealItemCount = a3;
}

- (BOOL)incrementalRevealConsumesPadding
{
  return self->_incrementalRevealConsumesPadding;
}

- (void)setIncrementalRevealConsumesPadding:(BOOL)a3
{
  self->_incrementalRevealConsumesPadding = a3;
}

- (BOOL)shouldAlwaysIncludeShowMore
{
  return self->_shouldAlwaysIncludeShowMore;
}

- (void)setShouldAlwaysIncludeShowMore:(BOOL)a3
{
  self->_shouldAlwaysIncludeShowMore = a3;
}

- (BOOL)shouldShowSectionHeadersWhenNoItems
{
  return self->_shouldShowSectionHeadersWhenNoItems;
}

- (void)setShouldShowSectionHeadersWhenNoItems:(BOOL)a3
{
  self->_shouldShowSectionHeadersWhenNoItems = a3;
}

- (double)calculatedItemHeightCache
{
  return self->_calculatedItemHeightCache;
}

- (void)setCalculatedItemHeightCache:(double)a3
{
  self->_calculatedItemHeightCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemHeightList, 0);
}

@end
