@implementation NUIGridArrangement

- (NUIGridArrangement)initWithContainer:(id)a3 dataSource:(id)a4
{
  uint64_t v8;
  const __CFString *v9;
  char v10;
  NUIGridArrangement *v11;
  NUIGridArrangement *v12;
  char v13;
  char v14;
  char v16;
  uint64_t v17;
  const __CFString *v18;
  objc_super v19;

  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a3)
      goto LABEL_10;
  }
  else
  {
    v10 = _NUIIsDebuggerAttached();
    if (a3 || (v10 & 1) == 0)
      goto LABEL_9;
  }
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIGridArrangement.mm");
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("<Unknown File>");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container != nil"));
LABEL_9:
  if (!_NUIEnableAPIMisuseAssertions)
  {
    v16 = _NUIIsDebuggerAttached();
    if (a4 || (v16 & 1) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_10:
  if (a4)
    goto LABEL_11;
LABEL_22:
  v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIGridArrangement.mm");
  if (v17)
    v18 = (const __CFString *)v17;
  else
    v18 = CFSTR("<Unknown File>");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource != nil"));
LABEL_11:
  v19.receiver = self;
  v19.super_class = (Class)NUIGridArrangement;
  v11 = -[NUIGridArrangement init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_container, a3);
    objc_storeWeak((id *)&v12->_dataSource, a4);
    *(_BYTE *)&v12->_flags = *(_BYTE *)&v12->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 2;
    else
      v13 = 0;
    *(_BYTE *)&v12->_flags = *(_BYTE *)&v12->_flags & 0xFD | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 4;
    else
      v14 = 0;
    *(_BYTE *)&v12->_flags = *(_BYTE *)&v12->_flags & 0xFB | v14;
    v12->_arrangement.container = (_NUIGridArrangementContainer *)v12;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  objc_storeWeak((id *)&self->_container, 0);
  objc_storeWeak((id *)&self->_dataSource, 0);
  v3.receiver = self;
  v3.super_class = (Class)NUIGridArrangement;
  -[NUIGridArrangement dealloc](&v3, sel_dealloc);
}

- (NUIArrangementContainer)container
{
  return (NUIArrangementContainer *)objc_loadWeak((id *)&self->_container);
}

- (NUIGridArrangementDataSource)dataSource
{
  return (NUIGridArrangementDataSource *)objc_loadWeak((id *)&self->_dataSource);
}

- (BOOL)isBaselineRelativeArrangement
{
  return self->_arrangement.baselineRelative;
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  self->_arrangement.baselineRelative = a3;
}

- (int64_t)horizontalDistribution
{
  return *((char *)&self->_arrangement + 8);
}

- (void)setHorizontalDistribution:(int64_t)a3
{
  *((_BYTE *)&self->_arrangement + 8) = a3;
}

- (int64_t)verticalDistribution
{
  return *((char *)&self->_arrangement + 9);
}

- (void)setVerticalDistribution:(int64_t)a3
{
  *((_BYTE *)&self->_arrangement + 9) = a3;
}

- (void)reloadData
{
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  self->_scale = 0.0;
}

- (CGSize)layoutSizeFittingSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _NUIGridArrangement *p_arrangement;
  double v6;
  double v7;
  CGSize v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  p_arrangement = &self->_arrangement;
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, 0);
  v8.width = width;
  v8.height = height;
  _NUIGridArrangement::measureCells(p_arrangement, 0, v8);
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)_cacheDisplayScaleIfNeeded
{
  double *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    if (result[17] <= 0.0)
    {
      objc_msgSend(result, "container");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        result = (double *)objc_msgSend((id)objc_msgSend(v1, "container"), "displayScale");
      else
        result = (double *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
      *((_QWORD *)v1 + 17) = v2;
    }
  }
  return result;
}

- (void)positionItemsInBounds:(CGRect)a3 block:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CGSize v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUIGridArrangement _cacheDisplayScaleIfNeeded]((double *)self);
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, 0);
  v10.width = width;
  v10.height = height;
  _NUIGridArrangement::measureCells(&self->_arrangement, 1, v10);
  self->_bounds.origin.x = x;
  self->_bounds.origin.y = y;
  self->_bounds.size.width = width;
  self->_bounds.size.height = height;
  _NUIGridArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)a4, x, y, width, height);
}

- (void)positionItemsInColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5 block:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v13;
  NSUInteger v14;
  CGSize v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  length = a4.length;
  location = a4.location;
  v13 = a3.length;
  v14 = a3.location;
  -[NUIGridArrangement _cacheDisplayScaleIfNeeded]((double *)self);
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, 0);
  v16.width = width;
  v16.height = height;
  _NUIGridArrangement::measureCells(&self->_arrangement, 1, v16);
  self->_bounds.origin.x = x;
  self->_bounds.origin.y = y;
  self->_bounds.size.width = width;
  self->_bounds.size.height = height;
  _NUIGridArrangement::positionSubsetCells((uint64_t)&self->_arrangement, v14, v13, location, length, (uint64_t)a6, x, y, width, height);
}

- (CGRect)unionFrameForItemsInColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = _NUIGridArrangement::unionFrameForSubsetCells(&self->_arrangement, a3, a4, a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)frameForColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v5 = _NUIGridArrangement::frameForColumnsAndRows(&self->_arrangement, a3, a4, a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)populateGridArrangementCells:(void *)a3
{
  NUIGridArrangementDataSource *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v5 = -[NUIGridArrangement dataSource](self, "dataSource");
  v6 = -[NUIGridArrangementDataSource numberOfItemsInGridArrangement:](v5, "numberOfItemsInGridArrangement:", self);
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v12 = xmmword_1AA837710;
    do
    {
      v17 = v8;
      v18 = 1;
      v16 = v12;
      v14 = 1;
      v15 = 1;
      v13 = 0;
      v9 = -[NUIGridArrangementDataSource gridArrangement:itemAtIndex:columns:rows:horizontalAlignment:verticalAlignment:](v5, "gridArrangement:itemAtIndex:columns:rows:horizontalAlignment:verticalAlignment:", self, v8, &v17, &v16, &v15, &v14, v12);
      v13 = v9;
      v10 = *((_QWORD *)a3 + 1);
      if (v10 >= *((_QWORD *)a3 + 2))
      {
        v11 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*&,_NSRange &,_NSRange,NUIContainerAlignment &,NUIContainerAlignment>((void **)a3, &v13, &v17, (uint64_t *)&v16, &v15, &v14);
      }
      else
      {
        _NUIGridArrangementCell::_NUIGridArrangementCell(*((_QWORD *)a3 + 1), v9, v17, v18, v16, *((uint64_t *)&v16 + 1), v15, v14);
        v11 = (void *)(v10 + 112);
        *((_QWORD *)a3 + 1) = v10 + 112;
      }
      *((_QWORD *)a3 + 1) = v11;
      ++v8;
    }
    while (v7 != v8);
  }

}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36;
  NUIGridArrangementDataSource *v37;
  double v38;

  v37 = -[NUIGridArrangement dataSource](self, "dataSource");
  v9 = *(_QWORD *)a4;
  v10 = *((_QWORD *)a4 + 1);
  if (*(_QWORD *)a4 != v10)
  {
    v11 = 0;
    do
    {
      if (a5)
        v12 = 80;
      else
        v12 = 64;
      if (a5)
        v13 = 72;
      else
        v13 = 56;
      v14 = *(_QWORD *)(v9 + v12) + *(_QWORD *)(v9 + v13);
      if (v14 > v11)
        v11 = v14;
      v9 += 112;
    }
    while (v9 != v10);
    v15 = v11;
    if (v11)
    {
      for (i = 0; i != v15; ++i)
      {
        v38 = 0.0;
        v17 = 1.79769313e308;
        if (a5)
        {
          if ((*(_BYTE *)&self->_flags & 2) != 0)
          {
            -[NUIGridArrangementDataSource gridArrangement:heightOfRowAtIndex:spacingAfter:](v37, "gridArrangement:heightOfRowAtIndex:spacingAfter:", self, i, &v38);
LABEL_19:
            v17 = v18;
          }
        }
        else if ((*(_BYTE *)&self->_flags & 1) != 0)
        {
          -[NUIGridArrangementDataSource gridArrangement:widthOfColumnAtIndex:spacingAfter:](v37, "gridArrangement:widthOfColumnAtIndex:spacingAfter:", self, i, &v38);
          goto LABEL_19;
        }
        v20 = *((_QWORD *)a3 + 1);
        v19 = *((_QWORD *)a3 + 2);
        if (v20 >= v19)
        {
          v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v20 - *(_QWORD *)a3) >> 3);
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) > 0x492492492492492)
            abort();
          v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v19 - *(_QWORD *)a3) >> 3);
          if (2 * v24 > v23)
            v23 = 2 * v24;
          if (v24 >= 0x249249249249249)
            v25 = 0x492492492492492;
          else
            v25 = v23;
          if (v25)
          {
            v26 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v25);
            v28 = v27;
          }
          else
          {
            v26 = 0;
            v28 = 0;
          }
          _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v26[56 * v22], i, v17);
          v31 = *(char **)a3;
          v30 = (char *)*((_QWORD *)a3 + 1);
          v32 = v29;
          if (v30 != *(char **)a3)
          {
            do
            {
              v33 = *(_OWORD *)(v30 - 56);
              v34 = *(_OWORD *)(v30 - 40);
              v35 = *(_OWORD *)(v30 - 24);
              *(_QWORD *)(v32 - 8) = *((_QWORD *)v30 - 1);
              *(_OWORD *)(v32 - 24) = v35;
              *(_OWORD *)(v32 - 40) = v34;
              *(_OWORD *)(v32 - 56) = v33;
              v32 -= 56;
              v30 -= 56;
            }
            while (v30 != v31);
            v30 = *(char **)a3;
          }
          v21 = v29 + 56;
          *(_QWORD *)a3 = v32;
          *((_QWORD *)a3 + 1) = v29 + 56;
          *((_QWORD *)a3 + 2) = &v26[56 * v28];
          if (v30)
            operator delete(v30);
        }
        else
        {
          _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), i, v17);
          v21 = v20 + 56;
          *((_QWORD *)a3 + 1) = v20 + 56;
        }
        *((_QWORD *)a3 + 1) = v21;
        v36 = v38;
        if (i >= v15 - 1)
          v36 = 0.0;
        *(double *)(*(_QWORD *)a3 + 56 * i) = v36;
      }
    }
  }

}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  -[NUIArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](-[NUIGridArrangement container](self, "container"), "contentLayoutSizeFittingSize:forArrangedSubview:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double scale;
  double MinX;
  double v11;
  double v12;
  double v13;
  double v14;
  double MinY;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double MaxX;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect result;

  -[NUIArrangementContainer layoutFrameForArrangedSubview:withProposedContentFrame:](-[NUIGridArrangement container](self, "container"), "layoutFrameForArrangedSubview:withProposedContentFrame:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  scale = self->_scale;
  MinX = CGRectGetMinX(v58);
  if (scale == 1.0)
  {
    v11 = ceil(MinX);
    v12 = v11 - MinX;
    v13 = floor(MinX);
    if (v12 >= 0.001)
      v14 = v13;
    else
      v14 = v11;
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    MinY = CGRectGetMinY(v59);
    v16 = ceil(MinY);
    v17 = v16 - MinY;
    v18 = floor(MinY);
    if (v17 >= 0.001)
      v19 = v18;
    else
      v19 = v16;
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    v20 = CGRectGetWidth(v60);
    v21 = floor(v20);
    v22 = v20 - v21;
    v23 = ceil(v20);
    if (v22 >= 0.001)
      v24 = v23;
    else
      v24 = v21;
    v61.origin.x = x;
    v61.origin.y = y;
    v61.size.width = width;
    v61.size.height = height;
    v25 = CGRectGetHeight(v61);
    v26 = floor(v25);
    v27 = v25 - v26;
    v28 = ceil(v25);
    if (v27 >= 0.001)
      v29 = v28;
    else
      v29 = v26;
  }
  else
  {
    v30 = scale * MinX;
    v31 = ceil(v30);
    v32 = v31 - v30;
    v33 = floor(v30);
    if (v32 < 0.001)
      v33 = v31;
    v55 = v33 / scale;
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    v34 = scale * CGRectGetMinY(v62);
    v35 = ceil(v34);
    v36 = v35 - v34;
    v37 = floor(v34);
    if (v36 < 0.001)
      v37 = v35;
    v19 = v37 / scale;
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v38 = scale * CGRectGetWidth(v63);
    v39 = floor(v38);
    v40 = v38 - v39;
    v41 = ceil(v38);
    if (v40 < 0.001)
      v41 = v39;
    v24 = v41 / scale;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v42 = scale * CGRectGetHeight(v64);
    v43 = floor(v42);
    v44 = v42 - v43;
    v45 = ceil(v42);
    v14 = v55;
    if (v44 < 0.001)
      v45 = v43;
    v29 = v45 / scale;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0
    && -[NUIArrangementContainer effectiveUserInterfaceLayoutDirection](self->_container, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    v46 = self->_bounds.origin.x;
    v47 = self->_bounds.origin.y;
    v48 = self->_bounds.size.width;
    v49 = self->_bounds.size.height;
    v65.origin.x = v14;
    v65.origin.y = v19;
    v65.size.width = v24;
    v65.size.height = v29;
    v56 = CGRectGetMinX(v65);
    v66.origin.x = v46;
    v66.origin.y = v47;
    v66.size.width = v48;
    v66.size.height = v49;
    v57 = v56 - CGRectGetMinX(v66);
    v67.origin.x = v46;
    v67.origin.y = v47;
    v67.size.width = v48;
    v67.size.height = v49;
    MaxX = CGRectGetMaxX(v67);
    v68.origin.x = v14;
    v68.origin.y = v19;
    v68.size.width = v24;
    v68.size.height = v29;
    v14 = MaxX - (v57 + CGRectGetWidth(v68));
  }
  v51 = v14;
  v52 = v19;
  v53 = v24;
  v54 = v29;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (void).cxx_destruct
{
  CGRect *begin;
  _NUIGridArrangementDimension *v4;
  _NUIGridArrangementDimension *v5;
  _NUIGridArrangementCell *v6;

  begin = self->_arrangement.viewFrames.__begin_;
  if (begin)
  {
    self->_arrangement.viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_arrangement.rows.__begin_;
  if (v4)
  {
    self->_arrangement.rows.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_arrangement.columns.__begin_;
  if (v5)
  {
    self->_arrangement.columns.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_arrangement.cells.__begin_;
  if (v6)
  {
    self->_arrangement.cells.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  _NUIGridArrangement::_NUIGridArrangement(&self->_arrangement);
  return self;
}

@end
