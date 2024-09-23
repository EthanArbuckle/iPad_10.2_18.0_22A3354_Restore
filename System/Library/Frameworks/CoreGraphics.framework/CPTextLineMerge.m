@implementation CPTextLineMerge

- (BOOL)fits:(id)a3 into:(id)a4
{
  double v6;
  double v7;
  __int128 v9;
  uint64_t v10;

  v6 = 0.0;
  v7 = 0.0;
  if (objc_msgSend(a3, "length", 0x3FE0000000000000, 0x3FF0000000000000))
    v7 = *(double *)(objc_msgSend(a3, "charAtIndex:", 0) + 104);
  if (objc_msgSend(a4, "length"))
    v6 = *(double *)(objc_msgSend(a4, "charAtIndex:", 0) + 104);
  v10 = 0;
  if (vabdd_f64(v7, v6) <= 2.0)
  {
    *(_QWORD *)&v9 = 0x3FF0000000000000;
    LOBYTE(v10) = 1;
  }
  return objc_msgSend(a3, "map:whereNeighborsWith:passing:", fits, a4, &v9);
}

- (void)addInterval:(id)a3 to:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  id v19;

  objc_msgSend(a3, "left");
  v7 = v6;
  objc_msgSend(a3, "right");
  v9 = v8;
  v10 = objc_msgSend(a4, "count");
  v11 = v10;
  if (v10 >= 1)
  {
    v12 = 0;
    v13 = v10;
    do
    {
      v14 = (void *)objc_msgSend(a4, "objectAtIndex:", v12);
      if (objc_msgSend(a3, "intersects:", v14))
      {
        objc_msgSend(v14, "left");
        v16 = v15;
        objc_msgSend(v14, "right");
        if (v16 < v7)
          v7 = v16;
        if (v17 > v9)
          v9 = v17;
      }
      ++v12;
    }
    while (v13 != v12);
  }
  v19 = -[CPInterval initLeft:right:]([CPInterval alloc], "initLeft:right:", v7, v9);
  if (v11 >= 1)
  {
    v18 = v11 + 1;
    do
    {
      if (objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", (v18 - 2)), "intersects:", v19))objc_msgSend(a4, "removeObjectAtIndex:", (v18 - 2));
      --v18;
    }
    while (v18 > 1);
  }
  objc_msgSend(a4, "addObject:", v19);

}

- (void)mergeColumn:(id)a3 overlapping:(id)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  CGFloat v14;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;

  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = objc_msgSend(a3, "objectAtIndex:", 0);
    if (v7 != 1)
    {
      v9 = (void *)v8;
      v10 = v7;
      for (i = 1; i != v10; ++i)
      {
        v12 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
        objc_msgSend(v9, "normalizedBounds");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v12, "normalizedBounds");
        v25 = v22;
        v26 = v24;
        if (v23 < 0.0 || v24 < 0.0)
        {
          *(CGRect *)&v21 = CGRectStandardize(*(CGRect *)&v21);
          v25 = v27;
          v26 = v28;
        }
        if (v18 < 0.0 || v20 < 0.0)
        {
          v35.origin.x = v14;
          v35.origin.y = v16;
          v35.size.width = v18;
          v35.size.height = v20;
          *(CGRect *)&v21 = CGRectStandardize(v35);
          v16 = v29;
        }
        v30 = 0.0;
        v31 = 0.0;
        if (objc_msgSend(v12, "length", v21))
          v31 = *(double *)(objc_msgSend(v12, "charAtIndex:", 0) + 168);
        if (objc_msgSend(v9, "length"))
          v30 = *(double *)(objc_msgSend(v9, "charAtIndex:", 0) + 168);
        v32 = vabdd_f64(v31, v30);
        v33 = vabdd_f64(360.0 - v31, v30);
        if (v32 >= v33)
          v32 = v33;
        v34 = vabdd_f64(v31, 360.0 - v30);
        if (v32 >= v34)
          v32 = v34;
        if (v25 + v26 - v16 > 2.0 && v32 < 1.0 && -[CPTextLineMerge fits:into:](self, "fits:into:", v9, v12))
        {
          objc_msgSend(v9, "mergeByAnchorXIncreasingYDecreasing:", v12);
          objc_msgSend(v12, "removeAllChars");
          objc_msgSend(a4, "removeObject:", v12);
        }
        else
        {
          v9 = v12;
        }
      }
    }
  }
}

- (void)mergeLinesInInterval:(id)a3 from:(id)a4
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(a4, "count");
  if (v7 >= 1)
  {
    v8 = 0;
    v9 = v7;
    do
    {
      v10 = objc_msgSend(a4, "objectAtIndex:", v8);
      if (objc_msgSend(a3, "contains:", v10))
        objc_msgSend(v11, "addObject:", v10);
      ++v8;
    }
    while (v9 != v8);
  }
  if ((int)objc_msgSend(v11, "count") > 1)
    -[CPTextLineMerge mergeColumn:overlapping:](self, "mergeColumn:overlapping:", v11, a4);

}

- (void)mergeByColumn:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double x;
  double v11;
  CGFloat v12;
  double v13;
  double width;
  double v15;
  double v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CPInterval *v27;
  double v28;
  id v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v5 = objc_msgSend(a3, "count");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = v5;
    do
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", v6);
      objc_msgSend(v8, "normalizedBounds");
      x = v9;
      v12 = v11;
      width = v13;
      v16 = v15;
      v17 = objc_msgSend(v8, "length");
      if (v17)
      {
        v18 = v17;
        v19 = objc_msgSend(v8, "charAtIndex:", 0);
        v20 = objc_msgSend(v8, "charAtIndex:", (v18 - 1));
        v21 = *(void **)(*(_QWORD *)(v19 + 160) + 64);
        v22 = *(void **)(*(_QWORD *)(v20 + 160) + 64);
        v23 = 0.0;
        v24 = 0.0;
        if (v21)
        {
          objc_msgSend(v21, "spaceWidth");
          v24 = v25 * 0.25;
        }
        if (v22)
        {
          objc_msgSend(v22, "spaceWidth");
          v23 = v26 * 0.25;
        }
        v27 = [CPInterval alloc];
        if (width < 0.0 || v16 < 0.0)
        {
          v37.origin.x = x;
          v37.origin.y = v12;
          v37.size.width = width;
          v37.size.height = v16;
          v28 = COERCE_DOUBLE(CGRectStandardize(v37)) - v24;
          v38.origin.x = x;
          v38.origin.y = v12;
          v38.size.width = width;
          v38.size.height = v16;
          v39 = CGRectStandardize(v38);
          x = v39.origin.x;
          width = v39.size.width;
        }
        else
        {
          v28 = x - v24;
        }
        v29 = -[CPInterval initLeft:right:](v27, "initLeft:right:", v28, v23 + x + width);
        -[CPTextLineMerge addInterval:to:](self, "addInterval:to:", v29, v36);

      }
      ++v6;
    }
    while (v7 != v6);
  }
  v30 = objc_msgSend(v36, "count");
  v31 = (void *)objc_msgSend(a3, "mutableCopy");
  if (v30 >= 1)
  {
    v32 = 0;
    v33 = v30;
    do
    {
      v34 = objc_msgSend(v36, "objectAtIndex:", v32);
      v35 = objc_msgSend(v31, "count");
      -[CPTextLineMerge mergeLinesInInterval:from:](self, "mergeLinesInInterval:from:", v34, v31);
      if (objc_msgSend(v31, "count") != v35)
        -[CPTextLineMerge mergeByColumn:](self, "mergeByColumn:", v31);
      ++v32;
    }
    while (v33 != v32);
  }

}

- (void)eliminate:(id)a3
{
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v5 = 0;
  v6 = objc_msgSend(a3, "count") - 1;
  while ((v6 & ~(v6 >> 31)) != v5)
  {
    v7 = v5;
    v8 = objc_msgSend(a3, "objectAtIndex:", v5++);
    if (!-[CPTextLineMerge fits:into:](self, "fits:into:", v8, objc_msgSend(a3, "objectAtIndex:", v5)))
    {
      if (v6 > v7)
      {
        v9 = v6;
        do
          objc_msgSend(a3, "removeObjectAtIndex:", v9--);
        while (v9 > v7);
      }
      return;
    }
  }
}

- (BOOL)hasOverlappingLines
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  unsigned int v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", 0), "normalizedBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[NSMutableArray count](self->avail, "count");
  if ((v11 & 0xFFFFFFFE) != 0)
  {
    v13 = v11;
    if (v8 < 0.0 || v10 < 0.0)
    {
      v28.origin.x = v4;
      v28.origin.y = v6;
      v28.size.width = v8;
      v28.size.height = v10;
      *(CGRect *)&v12 = CGRectStandardize(v28);
      v6 = v14;
    }
    v15 = v13;
    v16 = 1;
    v17 = 1;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v16, v12), "normalizedBounds");
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = v21;
      if (v20 < 0.0 || v21 < 0.0)
      {
        v29 = CGRectStandardize(*(CGRect *)&v18);
        if (v29.origin.y + v29.size.height > v6)
          return v17;
        v30.origin.x = v22;
        v30.origin.y = v23;
        v30.size.width = v24;
        v30.size.height = v25;
        *(CGRect *)&v12 = CGRectStandardize(v30);
        v23 = v26;
      }
      else
      {
        v12 = v19 + v21;
        if (v19 + v21 > v6)
          return v17;
      }
      if (v23 < v6)
        v6 = v23;
      v17 = ++v16 < v15;
    }
    while (v15 != v16);
  }
  else
  {
    return 0;
  }
  return v17;
}

- (void)makeOverlappingLinesTo:(id)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  unsigned int v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double y;
  CGFloat v27;
  CGFloat v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v5 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", 0);
  objc_msgSend(a3, "addObject:", v5);
  objc_msgSend(v5, "normalizedBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[NSMutableArray count](self->avail, "count");
  if ((v14 & 0xFFFFFFFE) != 0)
  {
    v16 = v14;
    if (v11 < 0.0 || v13 < 0.0)
    {
      v29.origin.x = v7;
      v29.origin.y = v9;
      v29.size.width = v11;
      v29.size.height = v13;
      *(CGRect *)&v15 = CGRectStandardize(v29);
      v9 = v17;
    }
    v18 = v16;
    v19 = 1;
    do
    {
      v20 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v19, v15);
      objc_msgSend(v20, "normalizedBounds");
      v25 = v21;
      y = v22;
      v27 = v23;
      v28 = v24;
      if (v23 < 0.0 || v24 < 0.0)
      {
        v30 = CGRectStandardize(*(CGRect *)&v21);
        if (v9 - (v30.origin.y + v30.size.height) >= -2.0)
          return;
        ++v19;
        v31.origin.x = v25;
        v31.origin.y = y;
        v31.size.width = v27;
        v31.size.height = v28;
        v32 = CGRectStandardize(v31);
        y = v32.origin.y;
      }
      else
      {
        if (v9 - (v22 + v24) >= -2.0)
          return;
        ++v19;
      }
      objc_msgSend(a3, "addObject:", v20);
      if (y < v9)
        v9 = y;
    }
    while (v19 != v18);
  }
}

- (void)removeOverlapping:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "count");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = v5;
    do
      -[NSMutableArray removeObject:](self->avail, "removeObject:", objc_msgSend(a3, "objectAtIndex:", v6++));
    while (v7 != v6);
  }
}

- (unsigned)countOverlapsOfLineAtIndex:(unsigned int)a3 in:(id)a4
{
  uint64_t v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double y;
  CGFloat v12;
  CGFloat v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v5 = a3;
  objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", a3), "normalizedBounds");
  v10 = v6;
  y = v7;
  v12 = v8;
  v13 = v9;
  if (v8 < 0.0 || v9 < 0.0)
  {
    v27 = CGRectStandardize(*(CGRect *)&v6);
    v14 = v27.origin.y + v27.size.height;
    v27.origin.x = v10;
    v27.origin.y = y;
    v27.size.width = v12;
    v27.size.height = v13;
    v28 = CGRectStandardize(v27);
    y = v28.origin.y;
  }
  else
  {
    v14 = v7 + v9;
  }
  v15 = objc_msgSend(a4, "count");
  if (v15)
  {
    v16 = 0;
    v17 = 0;
    while (1)
    {
      if (v5 != v16)
      {
        objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", v16), "normalizedBounds");
        v22 = v18;
        v23 = v19;
        v24 = v20;
        v25 = v21;
        if (v20 < 0.0 || v21 < 0.0)
        {
          v29 = CGRectStandardize(*(CGRect *)&v18);
          if (y < v29.origin.y + v29.size.height)
          {
            v30.origin.x = v22;
            v30.origin.y = v23;
            v30.size.width = v24;
            v30.size.height = v25;
            v31 = CGRectStandardize(v30);
            v23 = v31.origin.y;
LABEL_14:
            if (v14 > v23)
              ++v17;
          }
        }
        else if (y < v19 + v21)
        {
          goto LABEL_14;
        }
      }
      if (v15 == ++v16)
        return v17;
    }
  }
  return 0;
}

- (void)detachDropCaps:(id)a3 to:(id)a4
{
  int v6;
  uint64_t i;
  void *v8;
  id v9;

  v6 = objc_msgSend(a3, "count");
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      if (objc_msgSend(v8, "length") >= 2)
        objc_msgSend(v8, "removeSubsequences:whereTrue:passing:", v9, sizeChange, 0);
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(a3, "addObjectsFromArray:", v9);
    objc_msgSend(a4, "addObjectsFromArray:", v9);
  }
  objc_msgSend(a3, "sortUsingFunction:context:", sortTopDescending, 0);

}

- (id)findLineFor:(id)a3 in:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double y;
  CGFloat v23;
  CGFloat v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v31;
  CGFloat rect;
  CGFloat rect_16;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  objc_msgSend(a3, "bounds");
  v6 = v5;
  rect_16 = v7;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(a4, "count");
  if (v12 < 1)
    return 0;
  v13 = 0;
  v14 = v12;
  v15 = v11 < 0.0 || v9 < 0.0;
  v31 = v6 + v9;
  rect = v6;
  while (1)
  {
    v16 = (void *)objc_msgSend(a4, "objectAtIndex:", v13, *(_QWORD *)&v31);
    objc_msgSend(v16, "normalizedBounds");
    v21 = v17;
    y = v18;
    v23 = v19;
    v24 = v20;
    v25 = v20 < 0.0 || v19 < 0.0;
    v26 = v17;
    if (v25)
      *(_QWORD *)&v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
    if (v15)
    {
      v34.origin.x = rect;
      v34.origin.y = rect_16;
      v34.size.width = v9;
      v34.size.height = v11;
      v35 = CGRectStandardize(v34);
      v27 = v26 - (v35.origin.x + v35.size.width);
      v35.origin.x = rect;
      v35.origin.y = rect_16;
      v35.size.width = v9;
      v35.size.height = v11;
      v36 = CGRectStandardize(v35);
    }
    else
    {
      v27 = v26 - v31;
      v36.size.width = v9;
    }
    if (v27 <= v36.size.width)
    {
      if (v25)
      {
        v37.origin.x = v21;
        v37.origin.y = y;
        v37.size.width = v23;
        v37.size.height = v24;
        v38 = CGRectStandardize(v37);
        y = v38.origin.y;
      }
      v28 = rect_16;
      v29 = v11;
      if (v15)
      {
        v39.origin.x = rect;
        v39.origin.y = rect_16;
        v39.size.width = v9;
        v39.size.height = v11;
        *(CGRect *)(&v28 - 1) = CGRectStandardize(v39);
      }
      if (y < v28 + v29)
        break;
    }
    if (v14 == ++v13)
      return 0;
  }
  return v16;
}

- (double)averageHeight:(id)a3
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v11;
  double v12;

  v4 = objc_msgSend(a3, "count");
  v5 = v4;
  if (!v4)
    return 0.0;
  if (v4 < 1)
  {
    v8 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = v4;
    v8 = 0.0;
    do
    {
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v6), "bounds");
      if (v11 < 0.0 || v12 < 0.0)
        *(CGRect *)(&v12 - 3) = CGRectStandardize(*(CGRect *)&v9);
      v8 = v8 + v12;
      ++v6;
    }
    while (v7 != v6);
  }
  return v8 / (double)v5;
}

- (void)dropCaps:(id)a3 to:(id)a4
{
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;

  -[CPTextLineMerge detachDropCaps:to:](self, "detachDropCaps:to:");
  -[CPTextLineMerge averageHeight:](self, "averageHeight:", a4);
  v8 = v7;
  v9 = objc_msgSend(a3, "count");
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = (v9 - 1);
  if (v9 >= 1)
  {
    v11 = v8 + v8;
    v12 = v9 + 1;
    do
    {
      v13 = (void *)objc_msgSend(a3, "objectAtIndex:", (v12 - 2));
      if (objc_msgSend(v13, "length") == 1)
      {
        objc_msgSend(v13, "bounds");
        if (v16 < 0.0 || v17 < 0.0)
          *(CGRect *)&v14 = CGRectStandardize(*(CGRect *)&v14);
        if (v17 > v11
          && -[CPTextLineMerge countOverlapsOfLineAtIndex:in:](self, "countOverlapsOfLineAtIndex:in:", v10, a3, v14, v15, v16))
        {
          objc_msgSend(v23, "addObject:", v13);
          objc_msgSend(a3, "removeObjectAtIndex:", (v12 - 2));
        }
      }
      --v12;
      v10 = (v10 - 1);
    }
    while (v12 > 1);
  }
  v18 = objc_msgSend(v23, "count");
  if (v18 >= 1)
  {
    v19 = 0;
    v20 = v18;
    do
    {
      v21 = (void *)objc_msgSend(v23, "objectAtIndex:", v19);
      -[NSMutableArray removeObject:](self->avail, "removeObject:", v21);
      v22 = -[CPTextLineMerge findLineFor:in:](self, "findLineFor:in:", v21, a3);
      if (v22)
      {
        objc_msgSend(v22, "mergeByAnchorXIncreasingYDecreasing:", v21);
        objc_msgSend(v21, "removeAllChars");
      }
      ++v19;
    }
    while (v20 != v19);
  }

}

- (void)mergeLinesIn:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  id v7;

  v5 = objc_msgSend(a3, "count");
  if ((v5 & 0xFFFFFFFE) != 0)
  {
    v6 = v5;
    objc_msgSend(a3, "sortUsingFunction:context:", sortTopDescending, 0);
    self->avail = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", a3);
    if (-[CPTextLineMerge hasOverlappingLines](self, "hasOverlappingLines"))
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
      while (-[NSMutableArray count](self->avail, "count"))
      {
        -[CPTextLineMerge makeOverlappingLinesTo:](self, "makeOverlappingLinesTo:", v7);
        if ((int)objc_msgSend(v7, "count") < 2)
        {
          -[NSMutableArray removeObjectAtIndex:](self->avail, "removeObjectAtIndex:", 0);
        }
        else
        {
          -[CPTextLineMerge dropCaps:to:](self, "dropCaps:to:", v7, a3);
          if ((int)objc_msgSend(v7, "count") >= 2)
          {
            -[CPTextLineMerge eliminate:](self, "eliminate:", v7);
            if ((int)objc_msgSend(v7, "count") >= 2)
              -[CPTextLineMerge mergeByColumn:](self, "mergeByColumn:", v7);
          }
          -[CPTextLineMerge removeOverlapping:](self, "removeOverlapping:", v7);
        }
        objc_msgSend(v7, "removeAllObjects");
      }

      self->avail = 0;
    }
    else
    {

      self->avail = 0;
    }
  }
}

@end
