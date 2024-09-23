@implementation NUIContainerFlowView

+ (id)containerFlowViewWithArrangedSubviews:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithArrangedSubviews:", a3);
}

+ (id)containerFlowViewWithNumberOfColumns:(int64_t)a3 arrangedSubviews:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArrangedSubviews:", a4);
  objc_msgSend(v5, "setNumberOfColumns:", a3);
  objc_msgSend(v5, "setHorizontalDistribution:", 3);
  return v5;
}

- (NUIContainerFlowView)initWithFrame:(CGRect)a3
{
  NUIContainerFlowView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUIContainerFlowView;
  result = -[NUIContainerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_arrangement.container = (_NUIFlowArrangementContainer *)result;
    *(_WORD *)&result->_flowFlags = *((unsigned __int8 *)&result->_flowFlags + 1) << 8;
    *((_BYTE *)&result->_flowFlags + 1) = 2;
  }
  return result;
}

- (NUIContainerFlowView)initWithArrangedSubviews:(id)a3
{
  NUIContainerFlowView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUIContainerFlowView;
  result = -[NUIContainerView initWithArrangedSubviews:](&v4, sel_initWithArrangedSubviews_, a3);
  if (result)
  {
    result->_arrangement.container = (_NUIFlowArrangementContainer *)result;
    *(_WORD *)&result->_flowFlags = *((unsigned __int8 *)&result->_flowFlags + 1) << 8;
    *((_BYTE *)&result->_flowFlags + 1) = 2;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  _NUIFlowArrangement::resetForInvalidation(&self->_arrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerFlowView;
  -[NUIContainerView dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfColumns
{
  return self->_arrangement.columns;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  if (self->_arrangement.columns != a3)
  {
    self->_arrangement.columns = (int)a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (int64_t)horizontalAlignment
{
  return (int64_t)self->_flowFlags;
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  __int16 flowFlags;

  flowFlags = (__int16)self->_flowFlags;
  if ((char)flowFlags != a3)
  {
    *(_WORD *)&self->_flowFlags = flowFlags & 0xFF00 | a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 1);
  }
}

- (int64_t)verticalAlignment
{
  return (int64_t)self->_flowFlags;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if ((uint64_t)*(_WORD *)&self->_flowFlags >> 8 != a3)
  {
    *(_WORD *)&self->_flowFlags = *(_WORD *)&self->_flowFlags | (unsigned __int16)((_WORD)a3 << 8);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 1);
  }
}

- (int64_t)alignmentForCell:(const _NUIFlowArrangementCell *)a3 inAxis:(int64_t)a4
{
  int64_t result;

  result = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", a3->var0);
  if (result == -1)
  {
    if (a4)
      return -[NUIContainerFlowView verticalAlignment](self, "verticalAlignment");
    else
      return -[NUIContainerFlowView horizontalAlignment](self, "horizontalAlignment");
  }
  return result;
}

- (int64_t)horizontalDistribution
{
  return *((char *)&self->_arrangement + 8);
}

- (void)setHorizontalDistribution:(int64_t)a3
{
  __int16 v3;

  v3 = *((_WORD *)&self->_arrangement + 4);
  if ((char)v3 != a3)
  {
    *((_WORD *)&self->_arrangement + 4) = v3 & 0xFF00 | a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (int64_t)verticalDistribution
{
  return *((char *)&self->_arrangement + 9);
}

- (void)setVerticalDistribution:(int64_t)a3
{
  if ((uint64_t)*((__int16 *)&self->_arrangement + 4) >> 8 != a3)
  {
    *((_WORD *)&self->_arrangement + 4) = *((_WORD *)&self->_arrangement + 4) | (unsigned __int16)((_WORD)a3 << 8);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 1);
  }
}

- (double)itemSpacing
{
  return self->_arrangement.itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  if (self->_arrangement.itemSpacing != a3)
  {
    self->_arrangement.itemSpacing = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (double)rowSpacing
{
  return self->_arrangement.rowSpacing;
}

- (void)setRowSpacing:(double)a3
{
  if (self->_arrangement.rowSpacing != a3)
  {
    self->_arrangement.rowSpacing = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (double)itemWidth
{
  return self->_arrangement.itemWidth;
}

- (void)setItemWidth:(double)a3
{
  if (self->_arrangement.itemWidth != a3)
  {
    self->_arrangement.itemWidth = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (double)rowHeight
{
  return self->_arrangement.rowHeight;
}

- (void)setRowHeight:(double)a3
{
  if (self->_arrangement.rowHeight != a3)
  {
    self->_arrangement.rowHeight = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  objc_super v3;

  if (!self->_arrangement.columns)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerFlowView;
  return -[NUIContainerView isLayoutSizeDependentOnPerpendicularAxis](&v3, sel_isLayoutSizeDependentOnPerpendicularAxis);
}

- (id)calculateViewForFirstBaselineLayout
{
  NUIContainerFlowView *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  NUIContainerFlowView *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v2 = self;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(NUIContainerFlowView **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[UIView effectiveFirstBaselineOffsetFromTop](v9, "effectiveFirstBaselineOffsetFromTop");
        if (v10 > v7)
        {
          v7 = v10;
          v2 = v9;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v2;
}

- (id)calculateViewForLastBaselineLayout
{
  NUIContainerFlowView *v2;
  NSEnumerator *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  NUIContainerFlowView *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v2 = self;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = -[NSArray reverseObjectEnumerator](-[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews", 0), "reverseObjectEnumerator");
  v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(NUIContainerFlowView **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[UIView effectiveBaselineOffsetFromBottom](v9, "effectiveBaselineOffsetFromBottom");
        if (v10 > v7)
        {
          v7 = v10;
          v2 = v9;
        }
      }
      v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v2;
}

- (_WORD)_effectiveAlignmentForArrangedSubview:(uint64_t)a3 inAxis:
{
  _WORD *v4;
  __int16 v5;

  if (result)
  {
    v4 = result;
    result = (_WORD *)objc_msgSend(result, "alignmentForView:inAxis:", a2, a3);
    if (result == (_WORD *)-1)
    {
      v5 = v4[356];
      if (a3)
        return (_WORD *)((uint64_t)v5 >> 8);
      else
        return (_WORD *)(char)v5;
    }
  }
  return result;
}

- (void)populateFlowArrangementCells:(void *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  int64_t flowFlags;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint8_t buf;
  _BYTE v24[15];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews");
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v29 = 0;
        v29 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9);
        if (_NUIIsDebuggerAttached())
        {
          -[NUIContainerView minimumSpacingAdjacentToView:](self, "minimumSpacingAdjacentToView:", v29);
          v11 = v10;
          v13 = v12;
          v15 = v14;
          if (!NUIContainerViewLengthIsDefault(v16)
            || !NUIContainerViewLengthIsDefault(v11)
            || !NUIContainerViewLengthIsDefault(v13)
            || !NUIContainerViewLengthIsDefault(v15))
          {
            v17 = _NUILog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              -[NUIContainerFlowView populateFlowArrangementCells:].cold.1(&buf, v24, v17);
          }
        }
        v22 = 0;
        if (self)
        {
          flowFlags = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", v29, 0);
          if (flowFlags == -1)
            flowFlags = (int64_t)self->_flowFlags;
          v19 = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", v29, 1, 0, flowFlags);
          if (v19 == -1)
            v19 = *((char *)&self->_flowFlags + 1);
        }
        else
        {
          v19 = 0;
        }
        v21 = v19;
        std::vector<_NUIFlowArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>((void **)a3, &v29, &v22, &v21);
        ++v9;
      }
      while (v7 != v9);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v7 = v20;
    }
    while (v20);
  }
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  _NUIFlowArrangement::resetForInvalidation(&self->_arrangement, a3);
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4
{
  double v8;
  double v9;
  CGSize v11;

  if (!a1)
    return 0.0;
  do
  {
    _NUIFlowArrangement::resetForInvalidation((_NUIFlowArrangement *)(a1 + 552), 0);
    v11.width = a3;
    v11.height = a4;
    _NUIFlowArrangement::measureCells((_NUIFlowArrangement *)(a1 + 552), a2, v11);
    v9 = v8;
  }
  while ((objc_msgSend((id)a1, "mustRestartMeasurement") & 1) != 0);
  return v9;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -[NUIContainerFlowView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUIContainerFlowView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, 1, a3.size.width, a3.size.height);
  _NUIFlowArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_4, x, y, width, height);
}

uint64_t __55__NUIContainerFlowView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (id)arrangedDebugDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t flowFlags;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *obj;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NUIContainerFlowView;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ alignments = "), -[NUIContainerView arrangedDebugDescription](&v20, sel_arrangedDebugDescription));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        if (self)
        {
          flowFlags = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6), 0);
          if (flowFlags == -1)
            flowFlags = (int64_t)self->_flowFlags;
        }
        else
        {
          flowFlags = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_155);
        v9 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", flowFlags));
        if (!v9)
          v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), flowFlags);
        if (self)
        {
          v10 = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", v7, 1);
          if (v10 == -1)
            v10 = *((char *)&self->_flowFlags + 1);
        }
        else
        {
          v10 = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_155);
        v11 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10));
        if (!v11)
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v10);
        objc_msgSend(v15, "appendFormat:", CFSTR("[%@|%@]"), v9, v11);
        ++v6;
      }
      while (v4 != v6);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      v4 = v12;
    }
    while (v12);
  }
  return (id)objc_msgSend(v15, "stringByAppendingString:", CFSTR(";"));
}

- (id)debugDictionary
{
  void *v3;
  uint64_t flowFlags;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NUIContainerFlowView;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v9, sel_debugDictionary));
  v10[0] = CFSTR("horizontal");
  flowFlags = (uint64_t)self->_flowFlags;
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_155);
  v5 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", flowFlags));
  if (!v5)
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), flowFlags);
  v10[1] = CFSTR("vertical");
  v11[0] = v5;
  v6 = *((char *)&self->_flowFlags + 1);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_155);
  v7 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6));
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v6);
  v11[1] = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2), CFSTR("alignmnets"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", _NUIFlowArrangement::debugDictionary(&self->_arrangement), CFSTR("arrangement"));
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char *v4;
  uint64_t v5;
  objc_super v6;

  if (sel_fittingSizeForCell_withProposedSize_ == a3)
  {
    v4 = sel_fittingSizeForFlowPositioningOfArrangedSubview_withProposedSize_;
  }
  else
  {
    if (sel_distributionForRowAtIndex_ofTotalRowCount_withCells_ != a3)
    {
      v6.receiver = self;
      v6.super_class = (Class)NUIContainerFlowView;
      return -[NUIContainerFlowView respondsToSelector:](&v6, sel_respondsToSelector_);
    }
    v4 = sel_distributionForRowAtIndex_ofTotalRowCount_withArrangedSubviews_;
  }
  v5 = -[NUIContainerFlowView methodForSelector:](self, "methodForSelector:", v4);
  return v5 != objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", v4);
}

- (CGSize)fittingSizeForCell:(const _NUIFlowArrangementCell *)a3 withProposedSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  -[NUIContainerFlowView fittingSizeForFlowPositioningOfArrangedSubview:withProposedSize:](self, "fittingSizeForFlowPositioningOfArrangedSubview:withProposedSize:", a3->var0, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (int64_t)distributionForRowAtIndex:(int64_t)a3 ofTotalRowCount:(int64_t)a4 withCells:(const void *)a5
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v9 = *(_QWORD **)a5;
  v8 = (_QWORD *)*((_QWORD *)a5 + 1);
  ((void (*)())MEMORY[0x1E0C80A78])();
  v11 = (char *)v14 - v10;
  for (i = 0; v9 != v8; v9 += 8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_QWORD *)&v11[8 * i++] = *v9;
  }
  return -[NUIContainerFlowView distributionForRowAtIndex:ofTotalRowCount:withArrangedSubviews:](self, "distributionForRowAtIndex:ofTotalRowCount:withArrangedSubviews:", a3, a4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, i));
}

- (void).cxx_destruct
{
  _NUIFlowArrangement::~_NUIFlowArrangement(&self->_arrangement);
}

- (id).cxx_construct
{
  _NUIFlowArrangement::_NUIFlowArrangement(&self->_arrangement);
  return self;
}

- (void)populateFlowArrangementCells:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1AA816000, log, OS_LOG_TYPE_DEBUG, "Non default minimum spacing adjecent to arranged subview is not yet supported by NUIContainerFlowView.", buf, 2u);
}

@end
