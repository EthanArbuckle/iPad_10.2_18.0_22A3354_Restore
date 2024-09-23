@implementation NUIGridDimension

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  __int16 flags;
  __int16 v6;
  uint64_t i;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v19;
  NSArray *obj;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  flags = (__int16)self->_flags;
  if (((((flags & 0x200) == 0) ^ v3) & 1) == 0)
  {
    if (v3)
      v6 = 512;
    else
      v6 = 0;
    *(_WORD *)&self->_flags = flags & 0xFDFF | v6;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = -[NUIGridDimension arrangedSubviews](self, "arrangedSubviews");
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v22)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NUIContainerGridView getColumnRange:rowRange:forArrangedSubview:](self->_gridView, "getColumnRange:rowRange:forArrangedSubview:", &v25, &v23, v8);
          v9 = objc_msgSend(v8, "isHidden");
          v10 = v25;
          do
          {
            v11 = v10;
            v12 = v26 + v25;
            if (v10 >= v26 + v25)
              break;
            v13 = -[NSMutableArray objectAtIndexedSubscript:](self->_gridView->_columns, "objectAtIndexedSubscript:", v10);
            v10 = v11 + 1;
          }
          while ((*(_WORD *)(v13 + 40) & 0x200) != 0);
          v14 = v23;
          do
          {
            v15 = v14;
            v16 = v24 + v23;
            if (v14 >= v24 + v23)
              break;
            v17 = -[NSMutableArray objectAtIndexedSubscript:](self->_gridView->_rows, "objectAtIndexedSubscript:", v14);
            v14 = v15 + 1;
          }
          while ((*(_WORD *)(v17 + 40) & 0x200) != 0);
          v19 = v11 >= v12 || v15 >= v16;
          if (v9 != v19)
            objc_msgSend(v8, "setHidden:");
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v22);
    }
    -[NUIContainerView invalidateIntrinsicContentSize](self->_gridView, "invalidateIntrinsicContentSize");
  }
}

- (NSArray)arrangedSubviews
{
  NSArray *result;
  NUIContainerGridView *gridView;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *viewRows;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
  result = self->_arrangedSubviews;
  if ((*((_BYTE *)&self->_gridView->_gridViewFlags + 2) & 2) != 0)
  {

    self->_arrangedSubviews = 0;
  }
  else if (result)
  {
    return result;
  }
  gridView = self->_gridView;
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    v5 = -[NSMutableArray indexOfObject:](gridView->_columns, "indexOfObject:", self);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", -[NSMutableArray count](self->_gridView->_viewRows, "count"));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      viewRows = self->_gridView->_viewRows;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(viewRows);
            objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectAtIndex:", v6));
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewRows, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }
      v13 = v7;
      goto LABEL_20;
    }
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  v14 = -[NSMutableArray indexOfObject:](gridView->_rows, "indexOfObject:", self);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", -[NSMutableArray objectAtIndex:](self->_gridView->_viewRows, "objectAtIndex:", v14));
LABEL_20:
  result = (NSArray *)(id)objc_msgSend(v13, "array");
  self->_arrangedSubviews = result;
  return result;
}

- (id)initWithContainerGridView:(int)a3 isRow:
{
  __int16 v5;
  __int16 v6;
  objc_super v7;

  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)NUIGridDimension;
    result = objc_msgSendSuper2(&v7, sel_init);
    if (result)
    {
      *((_QWORD *)result + 3) = 0x7FEFFFFFFFFFFFFFLL;
      *((_QWORD *)result + 4) = 0x7FEFFFFFFFFFFFFFLL;
      v5 = *((_WORD *)result + 20);
      *((_QWORD *)result + 1) = a2;
      if (a3)
        v6 = 256;
      else
        v6 = 0;
      *((_WORD *)result + 20) = v5 & 0xFC00 | v6 | 0xFF;
    }
  }
  return result;
}

- (BOOL)isHidden
{
  $ED2F510FED2B259BD5B5EABD061698BE flags;

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
    flags = self->_flags;
  }
  return (*(unsigned int *)&flags >> 9) & 1;
}

- (void)setAlignment:(int64_t)a3
{
  __int16 flags;

  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  flags = (__int16)self->_flags;
  if ((char)flags != a3)
  {
    *(_WORD *)&self->_flags = flags & 0xFF00 | a3;
    -[NUIContainerView setNeedsInvalidation:](self->_gridView, "setNeedsInvalidation:", 4);
  }
}

- (void)invalidateArrangedSubviews
{
  if (a1)
  {

    *(_QWORD *)(a1 + 16) = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUIGridDimension;
  -[NUIGridDimension dealloc](&v3, sel_dealloc);
}

- (double)length
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
  return self->_length;
}

- (void)setLength:(double)a3
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  if (self->_length != a3)
  {
    self->_length = a3;
    -[NUIContainerView invalidateIntrinsicContentSize](self->_gridView, "invalidateIntrinsicContentSize");
  }
}

- (double)spacingAfter
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
  return self->_spacing;
}

- (void)setSpacingAfter:(double)a3
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self->_gridView);
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    -[NUIContainerView setNeedsInvalidation:](self->_gridView, "setNeedsInvalidation:", 2);
  }
}

- (int64_t)alignment
{
  __int16 flags;

  flags = (__int16)self->_flags;
  if ((flags & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ no longer attached to grid view <%p>."), self, self->_gridView);
    return (char)*(_WORD *)&self->_flags;
  }
  return (char)flags;
}

@end
