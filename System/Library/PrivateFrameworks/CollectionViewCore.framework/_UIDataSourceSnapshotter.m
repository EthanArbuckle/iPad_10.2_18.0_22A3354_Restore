@implementation _UIDataSourceSnapshotter

+ (id)snapshotterForDataSourceBackedView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDataSourceBackedView:", v4);

  return v5;
}

+ (id)snapshotterForSectionCountsProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSectionCountsProvider:", v4);

  return v5;
}

+ (id)snapshotterForNoDataSource
{
  return objc_alloc_init((Class)a1);
}

+ (id)snapshotterForSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51___UIDataSourceSnapshotter_snapshotterForSnapshot___block_invoke;
    v8[3] = &unk_1EA7CE608;
    v9 = v4;
    v6 = (void *)MEMORY[0x1DF0DB6D0](v8);
    objc_msgSend(a1, "snapshotterForSectionCountsProvider:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (_UIDataSourceSnapshotter)initWithSectionCounts:(id)a3
{
  _UIDataSourceSnapshotter *v4;
  void **p_begin;
  id v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  _NSRange *value;
  _NSRange *end;
  _NSRange *v15;
  char *begin;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _NSRange *v22;
  _NSRange *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v4 = -[_UIDataSourceSnapshotter init](self, "init");
  if (objc_msgSend(v25, "count"))
  {
    p_begin = (void **)&v4->_sectionRanges.__begin_;
    std::vector<_NSRange>::reserve((void **)&v4->_sectionRanges.__begin_, objc_msgSend(v25, "count"));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v25;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "integerValue");
          v12 = v11;
          end = v4->_sectionRanges.__end_;
          value = v4->_sectionRanges.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (char *)*p_begin;
            v17 = ((char *)end - (_BYTE *)*p_begin) >> 4;
            v18 = v17 + 1;
            if ((unint64_t)(v17 + 1) >> 60)
              abort();
            v19 = (char *)value - begin;
            if (v19 >> 3 > v18)
              v18 = v19 >> 3;
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
              v20 = 0xFFFFFFFFFFFFFFFLL;
            else
              v20 = v18;
            if (v20)
            {
              v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v20);
              begin = (char *)v4->_sectionRanges.__begin_;
              end = v4->_sectionRanges.__end_;
            }
            else
            {
              v21 = 0;
            }
            v22 = (_NSRange *)(v20 + 16 * v17);
            v22->location = v8;
            v22->length = v12;
            v23 = v22;
            if (end != (_NSRange *)begin)
            {
              do
              {
                v23[-1] = end[-1];
                --v23;
                --end;
              }
              while (end != (_NSRange *)begin);
              begin = (char *)*p_begin;
            }
            v15 = v22 + 1;
            v4->_sectionRanges.__begin_ = v23;
            v4->_sectionRanges.__end_ = v22 + 1;
            v4->_sectionRanges.__end_cap_.__value_ = (_NSRange *)(v20 + 16 * v21);
            if (begin)
              operator delete(begin);
          }
          else
          {
            end->location = v8;
            end->length = v11;
            v15 = end + 1;
          }
          v4->_sectionRanges.__end_ = v15;
          v8 += v12;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (_UIDataSourceSnapshotter)initWithDataSourceBackedView:(id)a3
{
  id v4;
  _UIDataSourceSnapshotter *v5;
  _UIDataSourceSnapshotter *v6;

  v4 = a3;
  v5 = -[_UIDataSourceSnapshotter init](self, "init");
  v6 = v5;
  if (v5)
    _UIDataSourceSnapshotterCommonInit(v5, v4, 0);

  return v6;
}

- (_UIDataSourceSnapshotter)initWithSectionCountsProvider:(id)a3
{
  id v4;
  _UIDataSourceSnapshotter *v5;
  _UIDataSourceSnapshotter *v6;

  v4 = a3;
  v5 = -[_UIDataSourceSnapshotter init](self, "init");
  v6 = v5;
  if (v5)
    _UIDataSourceSnapshotterCommonInit(v5, 0, v4);

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  const __CFString *v9;
  unint64_t v10;
  unint64_t i;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_UIDataSourceSnapshotter numberOfSections](self, "numberOfSections");
  v8 = v7;
  v9 = CFSTR("s");
  v10 = v7 - 1;
  if (v7 == 1)
    v9 = &stru_1EA7CEF88;
  objc_msgSend(v6, "appendFormat:", CFSTR("%lu section%@ with item counts: ["), v7, v9);
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("%lu"), -[_UIDataSourceSnapshotter numberOfItemsInSection:](self, "numberOfItemsInSection:", i));
      if (i < v10)
        objc_msgSend(v6, "appendString:", CFSTR(", "));
    }
  }
  objc_msgSend(v6, "appendString:", CFSTR("] >"));
  return (NSString *)v6;
}

- (int64_t)numberOfItems
{
  _NSRange *begin;
  _NSRange *end;
  int64_t result;

  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  if (begin == end)
    return 0;
  result = 0;
  do
  {
    result += begin->length;
    ++begin;
  }
  while (begin != end);
  return result;
}

- (int64_t)numberOfSections
{
  return self->_sectionRanges.__end_ - self->_sectionRanges.__begin_;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  _NSRange *begin;

  begin = self->_sectionRanges.__begin_;
  if (a3 >= self->_sectionRanges.__end_ - begin)
    return 0;
  else
    return begin[a3].length;
}

- (int64_t)numberOfItemsBeforeSection:(int64_t)a3
{
  _NSRange *begin;

  begin = self->_sectionRanges.__begin_;
  if (a3 >= self->_sectionRanges.__end_ - begin)
    return 0;
  else
    return begin[a3].location;
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _NSRange *begin;
  _NSRange *end;
  uint64_t v8;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    begin = self->_sectionRanges.__begin_;
    end = self->_sectionRanges.__end_;
    if (begin == end)
    {
LABEL_9:
      v5 = 0;
    }
    else
    {
      v8 = 0;
      while (a3 < begin->location || begin->length + begin->location <= a3)
      {
        ++v8;
        if (++begin == end)
          goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3 - begin->location, v8, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (int64_t)globalIndexForIndexPath:(id)a3
{
  id v4;
  void *v5;
  _NSRange *end;
  _NSRange *begin;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  _NSRange *v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    begin = self->_sectionRanges.__begin_;
    end = self->_sectionRanges.__end_;
    v8 = objc_msgSend(v4, "section");
    v9 = v8;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v8 & 0x8000000000000000) == 0 && v8 < end - begin)
    {
      v11 = self->_sectionRanges.__begin_;
      v12 = objc_msgSend(v5, "item");
      if (v12 >= v11[v9].length || v12 <= -1)
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v10 = v11[v9].location + v12;
    }
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (_NSRange)rangeForSection:(int64_t)a3
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange *begin;
  vector<_NSRange, std::allocator<_NSRange>> *p_sectionRanges;
  NSUInteger *p_location;
  _NSRange result;

  v4 = 0;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0)
  {
    p_sectionRanges = &self->_sectionRanges;
    begin = self->_sectionRanges.__begin_;
    if (p_sectionRanges->__end_ - begin > a3)
    {
      p_location = &begin[a3].location;
      v5 = *p_location;
      v4 = p_location[1];
    }
  }
  result.length = v4;
  result.location = v5;
  return result;
}

- (int64_t)sectionForGlobalIndex:(int64_t)a3
{
  _NSRange *begin;
  _NSRange *end;
  int64_t result;

  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  if (begin == end)
    return 0x7FFFFFFFFFFFFFFFLL;
  for (result = 0; a3 < begin->location || a3 - begin->location >= begin->length; ++result)
  {
    if (++begin == end)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _UIDataSourceSnapshotter *v4;
  _UIDataSourceSnapshotter *v5;
  uint64_t v6;
  uint64_t v7;
  _NSRange *begin;
  _NSRange *end;
  _NSRange *v10;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v13;
  NSUInteger v14;
  _BOOL4 v16;

  v4 = (_UIDataSourceSnapshotter *)a3;
  if (v4 == self)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[_UIDataSourceSnapshotter numberOfSections](v5, "numberOfSections");
      if (v6 == -[_UIDataSourceSnapshotter numberOfSections](self, "numberOfSections")
        && (v7 = -[_UIDataSourceSnapshotter numberOfItems](v5, "numberOfItems"),
            v7 == -[_UIDataSourceSnapshotter numberOfItems](self, "numberOfItems")))
      {
        begin = self->_sectionRanges.__begin_;
        end = self->_sectionRanges.__end_;
        if (begin == end)
        {
          LOBYTE(v16) = 1;
        }
        else
        {
          v10 = v5->_sectionRanges.__begin_;
          do
          {
            location = begin->location;
            length = begin->length;
            ++begin;
            v13 = v10->location;
            v14 = v10->length;
            ++v10;
            v16 = location == v13 && length == v14;
          }
          while (v16 && begin != end);
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }

    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (BOOL)indexPathIsSectionAppendingInsert:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "section");
    v7 = -[_UIDataSourceSnapshotter numberOfSections](self, "numberOfSections");
    v8 = objc_msgSend(v5, "item");
    v9 = -[_UIDataSourceSnapshotter numberOfItemsInSection:](self, "numberOfItemsInSection:", v6);
    v11 = v6 < v7 && v8 == v9;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)indexPathForAppendingInsertInSection:(int64_t)a3
{
  void *v4;

  v4 = 0;
  if ((a3 & 0x8000000000000000) == 0 && self->_sectionRanges.__end_ - self->_sectionRanges.__begin_ > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[_UIDataSourceSnapshotter numberOfItemsInSection:](self, "numberOfItemsInSection:", a3), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)snapshot
{
  return (id)-[_UIDataSourceSnapshotter copy](self, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIDataSourceSnapshotter *v4;
  _UIDataSourceSnapshotter *v5;
  char *begin;
  char *end;

  v4 = objc_alloc_init(_UIDataSourceSnapshotter);
  v5 = v4;
  begin = (char *)self->_sectionRanges.__begin_;
  end = (char *)self->_sectionRanges.__end_;
  if (end - begin >= 1 && v4 != self)
    std::vector<_NSRange>::__assign_with_size[abi:nn180100]<_NSRange*,_NSRange*>(&v4->_sectionRanges.__begin_, begin, end, (unint64_t)(end - begin) >> 4);
  return v5;
}

- (BOOL)_decrementSectionCount:(int64_t)a3
{
  return -[_UIDataSourceSnapshotter _decrementSectionCount:byCount:](self, "_decrementSectionCount:byCount:", a3, 1);
}

- (BOOL)_decrementSectionCount:(int64_t)a3 byCount:(int64_t)a4
{
  _NSRange *begin;
  _NSRange *v5;
  NSUInteger *p_length;
  unint64_t length;
  unint64_t v8;

  begin = self->_sectionRanges.__begin_;
  if (a3 >= self->_sectionRanges.__end_ - begin)
    return 0;
  v5 = &begin[a3];
  length = v5->length;
  p_length = &v5->length;
  v8 = length - a4;
  if (length < a4)
    return 0;
  *p_length = v8;
  -[_UIDataSourceSnapshotter _recomputeRangeLocations](self, "_recomputeRangeLocations");
  return 1;
}

- (BOOL)_deleteSection:(int64_t)a3
{
  _NSRange *end;
  _NSRange *begin;
  _BOOL4 v6;
  _NSRange *v8;
  char *v9;

  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  v6 = (char *)end - (char *)begin > 0 && a3 < end - begin;
  if (v6)
  {
    v8 = &begin[a3];
    v9 = (char *)((char *)end - (char *)&v8[1]);
    if (end != &v8[1])
      memmove(&begin[a3], &v8[1], (char *)end - (char *)&v8[1]);
    self->_sectionRanges.__end_ = (_NSRange *)&v9[(_QWORD)v8];
    -[_UIDataSourceSnapshotter _recomputeRangeLocations](self, "_recomputeRangeLocations");
  }
  return v6;
}

- (BOOL)_deleteAllSections
{
  self->_sectionRanges.__end_ = self->_sectionRanges.__begin_;
  return 1;
}

- (BOOL)_incrementSectionCount:(int64_t)a3
{
  return -[_UIDataSourceSnapshotter _incrementSectionCount:byCount:](self, "_incrementSectionCount:byCount:", a3, 1);
}

- (BOOL)_incrementSectionCount:(int64_t)a3 byCount:(int64_t)a4
{
  _NSRange *begin;
  int64_t v6;

  begin = self->_sectionRanges.__begin_;
  v6 = self->_sectionRanges.__end_ - begin;
  if (v6 > a3)
  {
    begin[a3].length += a4;
    -[_UIDataSourceSnapshotter _recomputeRangeLocations](self, "_recomputeRangeLocations");
  }
  return v6 > a3;
}

- (BOOL)_insertSection:(int64_t)a3 withInitialCount:(int64_t)a4
{
  _NSRange *end;
  _NSRange *begin;
  int64_t v7;
  _NSRange *v9;
  _NSRange *value;
  _NSRange *v11;
  _NSRange *v12;
  _NSRange *v13;
  _NSRange v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  _NSRange *v20;
  _NSRange *v21;
  _NSRange *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  _NSRange *v26;
  _NSRange *v27;
  _NSRange *v28;
  _NSRange *v29;
  _NSRange *v30;
  _NSRange *v31;
  int64_t v32;
  _NSRange *v33;
  _NSRange v35;

  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  v7 = end - begin;
  if (v7 >= a3)
  {
    v35.location = 0x7FFFFFFFFFFFFFFFLL;
    v35.length = a4;
    v9 = &begin[a3];
    value = self->_sectionRanges.__end_cap_.__value_;
    if (end >= value)
    {
      v15 = v7 + 1;
      if ((unint64_t)(v7 + 1) >> 60)
        abort();
      v16 = (char *)value - (char *)begin;
      if (v16 >> 3 > v15)
        v15 = v16 >> 3;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
        v17 = 0xFFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
      {
        v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v17);
      }
      else
      {
        v19 = 0;
        v18 = 0;
      }
      v21 = (_NSRange *)&v19[16 * a3];
      v22 = (_NSRange *)&v19[16 * v18];
      if (v18 == a3)
      {
        if (a3 < 1)
        {
          if (a3)
            v23 = 2 * a3;
          else
            v23 = 1;
          v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NSRange>>(v23);
          v21 = (_NSRange *)&v24[16 * (v23 >> 2)];
          v22 = (_NSRange *)&v24[16 * v25];
          if (v19)
            operator delete(v19);
        }
        else
        {
          v21 = (_NSRange *)((char *)v21 - ((8 * a3 + 8) & 0xFFFFFFFFFFFFFFF0));
        }
      }
      *v21 = v35;
      v26 = self->_sectionRanges.__begin_;
      v27 = v21;
      if (v26 != v9)
      {
        v28 = v9;
        v29 = v21;
        do
        {
          v27 = v29 - 1;
          v29[-1] = v28[-1];
          --v28;
          --v29;
        }
        while (v28 != v26);
      }
      v30 = v21 + 1;
      v31 = self->_sectionRanges.__end_;
      v32 = (char *)v31 - (char *)v9;
      if (v31 != v9)
        memmove(v30, v9, (char *)v31 - (char *)v9);
      v33 = self->_sectionRanges.__begin_;
      self->_sectionRanges.__begin_ = v27;
      self->_sectionRanges.__end_ = (_NSRange *)((char *)v30 + v32);
      self->_sectionRanges.__end_cap_.__value_ = v22;
      if (v33)
        operator delete(v33);
    }
    else if (v9 == end)
    {
      *end = v35;
      self->_sectionRanges.__end_ = end + 1;
    }
    else
    {
      v11 = v9 + 1;
      v12 = end - 1;
      v13 = end;
      while (v12 < end)
      {
        v14 = *v12++;
        *v13++ = v14;
      }
      self->_sectionRanges.__end_ = v13;
      if (end != v11)
        memmove(&end[-(end - v11)], v9, (char *)end - (char *)v11);
      v20 = &v35;
      if (v9 <= &v35)
        v20 = &v35 + (self->_sectionRanges.__end_ > &v35);
      *v9 = *v20;
    }
    -[_UIDataSourceSnapshotter _recomputeRangeLocations](self, "_recomputeRangeLocations", v35);
  }
  return v7 >= a3;
}

- (void)_recomputeRangeLocations
{
  _NSRange *begin;
  _NSRange *end;
  NSUInteger v4;

  begin = self->_sectionRanges.__begin_;
  end = self->_sectionRanges.__end_;
  if (begin != end)
  {
    v4 = 0;
    do
    {
      begin->location = v4;
      v4 += begin->length;
      ++begin;
    }
    while (begin != end);
  }
}

- (void)_resetToStateOfSnapshotter:(id)a3
{
  _UIDataSourceSnapshotter *v5;
  void *v6;
  char **v7;

  v5 = (_UIDataSourceSnapshotter *)a3;
  v7 = (char **)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceSnapshotter.mm"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotter != nil"));

    v5 = 0;
  }
  if (self != v5)
    std::vector<_NSRange>::__assign_with_size[abi:nn180100]<_NSRange*,_NSRange*>(&self->_sectionRanges.__begin_, v7[1], v7[2], (v7[2] - v7[1]) >> 4);

}

- (void).cxx_destruct
{
  _NSRange *begin;

  begin = self->_sectionRanges.__begin_;
  if (begin)
  {
    self->_sectionRanges.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
