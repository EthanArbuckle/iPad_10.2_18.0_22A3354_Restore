@implementation NUIContainerBoxView

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, a3);
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -[NUIContainerBoxView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)calculateViewForFirstBaselineLayout
{
  NUIContainerBoxView *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  NUIContainerBoxView *v9;
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
        v9 = *(NUIContainerBoxView **)(*((_QWORD *)&v12 + 1) + 8 * i);
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
  NUIContainerBoxView *v2;
  NSEnumerator *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  NUIContainerBoxView *v9;
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
        v9 = *(NUIContainerBoxView **)(*((_QWORD *)&v12 + 1) + 8 * i);
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

- (NUIContainerBoxView)initWithArrangedSubviews:(id)a3
{
  NUIContainerBoxView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUIContainerBoxView;
  result = -[NUIContainerView initWithArrangedSubviews:](&v4, sel_initWithArrangedSubviews_, a3);
  if (result)
    result->_arrangement.container = (_NUIBoxArrangementContainer *)result;
  return result;
}

- (NUIContainerBoxView)initWithFrame:(CGRect)a3
{
  NUIContainerBoxView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUIContainerBoxView;
  result = -[NUIContainerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_arrangement.container = (_NUIBoxArrangementContainer *)result;
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
  -[NUIContainerBoxView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, a3.size.width, a3.size.height);
  _NUIBoxArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_5, x, y, width, height);
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:
{
  double v6;
  CGSize v8;

  if (!a1)
    return 0.0;
  do
  {
    _NUIBoxArrangement::resetForInvalidation((_NUIBoxArrangement *)(a1 + 552), 0);
    v8.width = a2;
    v8.height = a3;
    v6 = _NUIBoxArrangement::measureCells((_NUIBoxArrangement *)(a1 + 552), v8);
  }
  while ((objc_msgSend((id)a1, "mustRestartMeasurement") & 1) != 0);
  return v6;
}

- (void)populateBoxArrangementCells:(void *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t boxFlags;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews");
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v19 = 0;
        v19 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v14 = 0;
        if (self)
        {
          boxFlags = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:");
          if (boxFlags == -1)
            boxFlags = (int64_t)self->_boxFlags;
          v11 = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", v19, 1, 0, boxFlags);
          if (v11 == -1)
            v11 = *((char *)&self->_boxFlags + 1);
        }
        else
        {
          v11 = 0;
        }
        v13 = v11;
        std::vector<_NUIBoxArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>((void **)a3, &v19, &v14, &v13);
        ++v9;
      }
      while (v7 != v9);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      v7 = v12;
    }
    while (v12);
  }
}

- (id).cxx_construct
{
  _NUIBoxArrangement::_NUIBoxArrangement(&self->_arrangement);
  return self;
}

- (void)dealloc
{
  objc_super v3;

  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerBoxView;
  -[NUIContainerView dealloc](&v3, sel_dealloc);
}

uint64_t __54__NUIContainerBoxView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (void)setVerticalAlignment:(int64_t)a3
{
  int64_t v5;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 0;
  else
    v5 = a3;
  if (v5 != *(_WORD *)&self->_boxFlags >> 8)
  {
    *(_WORD *)&self->_boxFlags = *(_WORD *)&self->_boxFlags | (unsigned __int16)((_WORD)v5 << 8);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  int64_t v5;
  __int16 boxFlags;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 0;
  else
    v5 = a3;
  boxFlags = (__int16)self->_boxFlags;
  if (v5 != (char)boxFlags)
  {
    *(_WORD *)&self->_boxFlags = boxFlags & 0xFF00 | v5;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (void).cxx_destruct
{
  _NUIBoxArrangement *p_arrangement;
  CGRect *begin;
  _NUIBoxArrangementCell *v4;

  p_arrangement = &self->_arrangement;
  begin = self->_arrangement.viewFrames.__begin_;
  if (begin)
  {
    p_arrangement->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v4 = p_arrangement->cells.__begin_;
  if (v4)
  {
    p_arrangement->cells.__end_ = v4;
    operator delete(v4);
  }
}

+ (id)containerBoxViewWithArrangedSubviews:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithArrangedSubviews:", a3);
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  int64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUIContainerBoxView;
  if (-[NUIContainerView needsBaselineDebugBoundingBoxesForArrangedSubview:](&v8, sel_needsBaselineDebugBoundingBoxesForArrangedSubview_))
  {
    return 1;
  }
  if (self)
  {
    v6 = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", a3, 1);
    if (v6 == -1)
      v6 = *((char *)&self->_boxFlags + 1);
  }
  else
  {
    v6 = 0;
  }
  return v6 == 2 || v6 == 5;
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
      v5 = v4[332];
      if (a3)
        return (_WORD *)((uint64_t)v5 >> 8);
      else
        return (_WORD *)(char)v5;
    }
  }
  return result;
}

- (int64_t)horizontalAlignment
{
  return (int64_t)self->_boxFlags;
}

- (int64_t)verticalAlignment
{
  return *((char *)&self->_boxFlags + 1);
}

- (id)arrangedDebugDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t boxFlags;
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
  v20.super_class = (Class)NUIContainerBoxView;
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
          boxFlags = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6), 0);
          if (boxFlags == -1)
            boxFlags = (int64_t)self->_boxFlags;
        }
        else
        {
          boxFlags = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_117);
        v9 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", boxFlags));
        if (!v9)
          v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), boxFlags);
        if (self)
        {
          v10 = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", v7, 1);
          if (v10 == -1)
            v10 = *((char *)&self->_boxFlags + 1);
        }
        else
        {
          v10 = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_117);
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
  uint64_t boxFlags;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NUIContainerBoxView;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v9, sel_debugDictionary));
  v10[0] = CFSTR("horizontal");
  boxFlags = (uint64_t)self->_boxFlags;
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_117);
  v5 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", boxFlags));
  if (!v5)
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), boxFlags);
  v10[1] = CFSTR("vertical");
  v11[0] = v5;
  v6 = *((char *)&self->_boxFlags + 1);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_117);
  v7 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6));
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v6);
  v11[1] = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2), CFSTR("alignmnets"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", _NUIBoxArrangement::debugDictionary(&self->_arrangement), CFSTR("arrangement"));
  return (id)objc_msgSend(v3, "copy");
}

@end
