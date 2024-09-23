@implementation _NUIFlowRowContainer

- (_QWORD)initWithFlowArrangement:(uint64_t)a3 cellRange:(uint64_t)a4
{
  if (result)
  {
    result = (_QWORD *)objc_msgSend(result, "init");
    if (result)
    {
      result[16] = a4;
      result[17] = a2;
      result[15] = a3;
      result[1] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  _NUIGridArrangement::resetForInvalidation(&self->_gridArrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)_NUIFlowRowContainer;
  -[_NUIFlowRowContainer dealloc](&v3, sel_dealloc);
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height;
  double width;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((id)+[_NUIFlowArrangementDummyItem sharedDummyItem]() == a4)
  {
    v8 = 1.0;
    v9 = 1.0;
  }
  else
  {
    objc_msgSend(*(id *)self->_flowArrangement, "contentLayoutSizeFittingSize:forArrangedSubview:", a4, width, height);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((id)+[_NUIFlowArrangementDummyItem sharedDummyItem]() != a3)
  {
    objc_msgSend(*(id *)self->_flowArrangement, "layoutFrameForArrangedSubview:withProposedContentFrame:", a3, x, y, width, height);
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)populateGridArrangementCells:(void *)a3
{
  NSUInteger location;
  NSUInteger length;
  char *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  signed __int8 v12;
  __int16 v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;

  location = self->_range.location;
  length = self->_range.length;
  if (location < length + location)
  {
    v7 = (char *)*((_QWORD *)a3 + 1);
    v8 = location << 6;
    v9 = self->_range.location;
    do
    {
      v10 = *((_QWORD *)self->_flowArrangement + 7) + v8;
      v11 = *(_QWORD *)v10;
      v24 = *(_QWORD *)v10;
      v22 = v9 - location;
      v23 = 1;
      v21 = xmmword_1AA837710;
      v12 = *(_BYTE *)(v10 + 56);
      v20 = v12;
      v13 = *(char *)(v10 + 57);
      v19 = *(char *)(v10 + 57);
      if ((unint64_t)v7 >= *((_QWORD *)a3 + 2))
      {
        v7 = (char *)std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*,_NSRange,objc_object  {objcproto18NUIArrangementItem}*,NUIContainerAlignment,_NSRange>((void **)a3, &v24, (uint64_t *)&v22, (uint64_t *)&v21, &v20, &v19);
      }
      else
      {
        _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)v7, v11, v9 - location, 1, 0, 1, v12, v13);
        v7 += 112;
        *((_QWORD *)a3 + 1) = v7;
      }
      *((_QWORD *)a3 + 1) = v7;
      ++v9;
      location = self->_range.location;
      length = self->_range.length;
      v8 += 64;
    }
    while (v9 < length + location);
  }
  if (*((_BYTE *)&self->_gridArrangement + 8) == 1 && length < *((_QWORD *)self->_flowArrangement + 2))
  {
    v14 = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
    v24 = v14;
    v15 = self->_range.length;
    v16 = *((_QWORD *)self->_flowArrangement + 2) - v15;
    v22 = v15;
    v23 = v16;
    v21 = xmmword_1AA837710;
    v19 = 3;
    v20 = 3;
    v17 = *((_QWORD *)a3 + 1);
    if (v17 >= *((_QWORD *)a3 + 2))
    {
      v18 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowArrangementDummyItem *,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((void **)a3, &v24, (uint64_t *)&v22, (uint64_t *)&v21, &v20, &v19);
    }
    else
    {
      _NUIGridArrangementCell::_NUIGridArrangementCell(*((_QWORD *)a3 + 1), v14, v15, v16, 0, 1, 3u, 3);
      v18 = (void *)(v17 + 112);
      *((_QWORD *)a3 + 1) = v17 + 112;
    }
    *((_QWORD *)a3 + 1) = v18;
  }
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  __int16 v11;
  _QWORD *v12;
  unint64_t v13;
  _NUIGridArrangementDimension *v14;
  double *flowArrangement;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  if (a5)
  {
    v6 = *((_QWORD *)a3 + 2);
    v7 = *((_QWORD *)a3 + 1);
    if (v7 >= v6)
    {
      v33 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - *(_QWORD *)a3) >> 3);
      if ((unint64_t)(v33 + 1) > 0x492492492492492)
LABEL_45:
        abort();
      v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - *(_QWORD *)a3) >> 3);
      v35 = 2 * v34;
      if (2 * v34 <= v33 + 1)
        v35 = v33 + 1;
      if (v34 >= 0x249249249249249)
        v36 = 0x492492492492492;
      else
        v36 = v35;
      if (v36)
      {
        v37 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v36);
        v39 = v38;
      }
      else
      {
        v37 = 0;
        v39 = 0;
      }
      _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v37[56 * v33], 0, 1.79769313e308);
      v41 = &v37[56 * v39];
      v8 = v40 + 56;
      v43 = *(char **)a3;
      v42 = (char *)*((_QWORD *)a3 + 1);
      if (v42 != *(char **)a3)
      {
        do
        {
          v44 = *(_OWORD *)(v42 - 56);
          v45 = *(_OWORD *)(v42 - 40);
          v46 = *(_OWORD *)(v42 - 24);
          *(_QWORD *)(v40 - 8) = *((_QWORD *)v42 - 1);
          *(_OWORD *)(v40 - 24) = v46;
          *(_OWORD *)(v40 - 40) = v45;
          *(_OWORD *)(v40 - 56) = v44;
          v40 -= 56;
          v42 -= 56;
        }
        while (v42 != v43);
        v42 = *(char **)a3;
      }
      *(_QWORD *)a3 = v40;
      *((_QWORD *)a3 + 1) = v8;
      *((_QWORD *)a3 + 2) = v41;
      if (v42)
        operator delete(v42);
    }
    else
    {
      _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), 0, 1.79769313e308);
      v8 = v7 + 56;
      *((_QWORD *)a3 + 1) = v7 + 56;
    }
    *((_QWORD *)a3 + 1) = v8;
  }
  else
  {
    v10 = *(_QWORD *)a4;
    v47 = *((_QWORD *)a4 + 1);
    if (*(_QWORD *)a4 != v47)
    {
      v11 = 0;
      v12 = (char *)a3 + 16;
      do
      {
        if (*(_QWORD *)(v10 + 64))
        {
          v13 = 0;
          v14 = (_NUIGridArrangementDimension *)*((_QWORD *)a3 + 1);
          do
          {
            flowArrangement = (double *)self->_flowArrangement;
            if ((unint64_t)v14 >= *v12)
            {
              v16 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v14 - *(_QWORD *)a3) >> 3);
              v17 = v16 + 1;
              if ((unint64_t)(v16 + 1) > 0x492492492492492)
                goto LABEL_45;
              if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v12 - *(_QWORD *)a3) >> 3) > v17)
                v17 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v12 - *(_QWORD *)a3) >> 3);
              if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v12 - *(_QWORD *)a3) >> 3)) >= 0x249249249249249)
                v18 = 0x492492492492492;
              else
                v18 = v17;
              if (v18)
              {
                v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v18);
                v21 = v20;
              }
              else
              {
                v19 = 0;
                v21 = 0;
              }
              _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v19[56 * v16], v11, flowArrangement[6]);
              v24 = *(char **)a3;
              v23 = (char *)*((_QWORD *)a3 + 1);
              v25 = v22;
              if (v23 != *(char **)a3)
              {
                do
                {
                  v26 = *(_OWORD *)(v23 - 56);
                  v27 = *(_OWORD *)(v23 - 40);
                  v28 = *(_OWORD *)(v23 - 24);
                  *(_QWORD *)(v25 - 8) = *((_QWORD *)v23 - 1);
                  *(_OWORD *)(v25 - 24) = v28;
                  *(_OWORD *)(v25 - 40) = v27;
                  *(_OWORD *)(v25 - 56) = v26;
                  v25 -= 56;
                  v23 -= 56;
                }
                while (v23 != v24);
                v23 = *(char **)a3;
              }
              v29 = &v19[56 * v21];
              v14 = (_NUIGridArrangementDimension *)(v22 + 56);
              *(_QWORD *)a3 = v25;
              *((_QWORD *)a3 + 1) = v22 + 56;
              *((_QWORD *)a3 + 2) = v29;
              if (v23)
                operator delete(v23);
            }
            else
            {
              _NUIGridArrangementDimension::_NUIGridArrangementDimension(v14, v11, flowArrangement[6]);
              v14 = (_NUIGridArrangementDimension *)((char *)v14 + 56);
              *((_QWORD *)a3 + 1) = v14;
            }
            *((_QWORD *)a3 + 1) = v14;
            ++v11;
            ++v13;
          }
          while (v13 < *(_QWORD *)(v10 + 64));
        }
        v10 += 112;
      }
      while (v10 != v47);
    }
    v31 = *(char **)a3;
    v30 = (char *)*((_QWORD *)a3 + 1);
    if (*(char **)a3 != v30)
    {
      v32 = *((_QWORD *)self->_flowArrangement + 4);
      do
      {
        *(_QWORD *)v31 = v32;
        v31 += 56;
      }
      while (v31 != v30);
    }
    *((_QWORD *)v30 - 7) = 0;
  }
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  NSUInteger location;
  double v4;
  NSUInteger v7;
  float v8;
  float v9;

  location = self->_range.location;
  v4 = 0.0;
  if (location < self->_range.length + location)
  {
    v7 = location << 6;
    do
    {
      objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v7), "contentCompressionResistancePriorityForAxis:", a3);
      if (v4 <= v8)
      {
        objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v7), "contentCompressionResistancePriorityForAxis:", a3);
        v4 = v9;
      }
      ++location;
      v7 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v4;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  NSUInteger location;
  double v4;
  NSUInteger v7;
  float v8;
  float v9;

  location = self->_range.location;
  v4 = 0.0;
  if (location < self->_range.length + location)
  {
    v7 = location << 6;
    do
    {
      objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v7), "contentHuggingPriorityForAxis:", a3);
      if (v4 <= v8)
      {
        objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v7), "contentHuggingPriorityForAxis:", a3);
        v4 = v9;
      }
      ++location;
      v7 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v4;
}

- (double)effectiveBaselineOffsetFromContentBottom
{
  NSUInteger location;
  double v3;
  NSUInteger v5;
  double v6;
  double v7;

  location = self->_range.location;
  v3 = 0.0;
  if (location < self->_range.length + location)
  {
    v5 = location << 6;
    do
    {
      objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v5), "effectiveBaselineOffsetFromContentBottom");
      if (v3 <= v6)
      {
        objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v5), "effectiveBaselineOffsetFromContentBottom");
        v3 = v7;
      }
      ++location;
      v5 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v3;
}

- (double)effectiveFirstBaselineOffsetFromContentTop
{
  NSUInteger location;
  double v3;
  NSUInteger v5;
  double v6;
  double v7;

  location = self->_range.location;
  v3 = 0.0;
  if (location < self->_range.length + location)
  {
    v5 = location << 6;
    do
    {
      objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v5), "effectiveFirstBaselineOffsetFromContentTop");
      if (v3 <= v6)
      {
        objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v5), "effectiveFirstBaselineOffsetFromContentTop");
        v3 = v7;
      }
      ++location;
      v5 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v3;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  NSUInteger location;
  NSUInteger v4;
  int v5;

  location = self->_range.location;
  if (location >= self->_range.length + location)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = location << 6;
    do
    {
      v5 = objc_msgSend(*(id *)(*((_QWORD *)self->_flowArrangement + 7) + v4), "isLayoutSizeDependentOnPerpendicularAxis");
      if (v5)
        break;
      ++location;
      v4 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v5;
}

- (void).cxx_destruct
{
  CGRect *begin;
  _NUIGridArrangementDimension *v4;
  _NUIGridArrangementDimension *v5;
  _NUIGridArrangementCell *v6;

  begin = self->_gridArrangement.viewFrames.__begin_;
  if (begin)
  {
    self->_gridArrangement.viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_gridArrangement.rows.__begin_;
  if (v4)
  {
    self->_gridArrangement.rows.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_gridArrangement.columns.__begin_;
  if (v5)
  {
    self->_gridArrangement.columns.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_gridArrangement.cells.__begin_;
  if (v6)
  {
    self->_gridArrangement.cells.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  _NUIGridArrangement::_NUIGridArrangement(&self->_gridArrangement);
  return self;
}

@end
