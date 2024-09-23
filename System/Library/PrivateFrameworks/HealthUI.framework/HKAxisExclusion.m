@implementation HKAxisExclusion

- (HKAxisExclusion)init
{
  HKAxisExclusion *v2;
  NSMutableArray *v3;
  NSMutableArray *excludedRects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKAxisExclusion;
  v2 = -[HKAxisExclusion init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    excludedRects = v2->_excludedRects;
    v2->_excludedRects = v3;

  }
  return v2;
}

- (BOOL)excludeRect:(CGRect)a3
{
  BOOL v3;
  double height;
  double width;
  double y;
  double x;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  NSMutableArray *excludedRects;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = 0;
  v25 = *MEMORY[0x1E0C80C00];
  if (a3.size.width > 0.0)
  {
    height = a3.size.height;
    if (a3.size.height > 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = self->_excludedRects;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "CGRectValue", (_QWORD)v20);
            v28.origin.x = v14;
            v28.origin.y = v15;
            v28.size.width = v16;
            v28.size.height = v17;
            v26.origin.x = x;
            v26.origin.y = y;
            v26.size.width = width;
            v26.size.height = height;
            v27 = CGRectIntersection(v26, v28);
            if (!CGRectIsNull(v27))
            {
              v3 = 1;
              goto LABEL_13;
            }
          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v11)
            continue;
          break;
        }
      }

      excludedRects = self->_excludedRects;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](excludedRects, "addObject:", v9);
      v3 = 0;
LABEL_13:

    }
  }
  return v3;
}

- (void)unifyExclusion
{
  double x;
  double y;
  double width;
  double height;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  NSMutableArray *excludedRects;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v35 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = self->_excludedRects;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v26 = height;
    v27 = width;
    v28 = y;
    v29 = x;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "CGRectValue", *(_QWORD *)&v26, *(_QWORD *)&v27, *(_QWORD *)&v28, *(_QWORD *)&v29, (_QWORD)v30);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v36.origin.x = x;
        v36.origin.y = y;
        v36.size.width = width;
        v36.size.height = height;
        v40.origin.y = v28;
        v40.origin.x = v29;
        v40.size.height = v26;
        v40.size.width = v27;
        if (CGRectEqualToRect(v36, v40))
        {
          height = v19;
          width = v17;
          y = v15;
          x = v13;
        }
        else
        {
          v37.origin.x = x;
          v37.origin.y = y;
          v37.size.width = width;
          v37.size.height = height;
          v41.origin.x = v13;
          v41.origin.y = v15;
          v41.size.width = v17;
          v41.size.height = v19;
          v38 = CGRectUnion(v37, v41);
          x = v38.origin.x;
          y = v38.origin.y;
          width = v38.size.width;
          height = v38.size.height;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
    v21 = v28;
    v20 = v29;
    v23 = v26;
    v22 = v27;
  }
  else
  {
    v20 = x;
    v21 = y;
    v22 = width;
    v23 = height;
  }

  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v42.origin.x = v20;
  v42.origin.y = v21;
  v42.size.width = v22;
  v42.size.height = v23;
  if (!CGRectEqualToRect(v39, v42))
  {
    -[NSMutableArray removeAllObjects](self->_excludedRects, "removeAllObjects");
    excludedRects = self->_excludedRects;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](excludedRects, "addObject:", v25);

  }
}

- (NSMutableArray)excludedRects
{
  return self->_excludedRects;
}

- (void)setExcludedRects:(id)a3
{
  objc_storeStrong((id *)&self->_excludedRects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedRects, 0);
}

@end
