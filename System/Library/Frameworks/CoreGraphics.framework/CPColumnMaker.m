@implementation CPColumnMaker

- (CPColumnMaker)init
{
  CPColumnMaker *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPColumnMaker;
  result = -[CPColumnMaker init](&v3, sel_init);
  if (result)
  {
    result->columns = 0;
    result->thinHorizontalShapes = 0;
    result->otherShapes = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPColumnMaker;
  -[CPColumnMaker dealloc](&v3, sel_dealloc);
}

- (id)columns
{
  return self->columns;
}

- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 paragraphs:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  CGFloat v16;
  double width;
  CGFloat v18;
  double v19;
  CGRect v22;
  CGRect v23;

  v8 = objc_msgSend(a5, "count");
  if (v8)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v9), "normalizedBounds");
      x = v11;
      v16 = v12;
      width = v13;
      v18 = v14;
      if (v13 < 0.0 || v14 < 0.0)
      {
        *(_QWORD *)&v19 = (unint64_t)CGRectStandardize(*(CGRect *)&v11);
        v22.origin.x = x;
        v22.origin.y = v16;
        v22.size.width = width;
        v22.size.height = v18;
        v23 = CGRectStandardize(v22);
        x = v23.origin.x;
        width = v23.size.width;
      }
      else
      {
        v19 = v11;
      }
      if (x + width + 4.0 > a3 && v19 + -4.0 < a4)
        break;
      v10 = ++v9 < v8;
    }
    while (v8 != v9);
  }
  else
  {
    return 0;
  }
  return v10;
}

- (void)partitionShapes:(id)a3
{
  NSMutableArray **p_thinHorizontalShapes;
  NSMutableArray **p_otherShapes;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double height;
  id *v18;
  CGFloat width;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  self->thinHorizontalShapes = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  p_thinHorizontalShapes = &self->thinHorizontalShapes;
  self->otherShapes = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  p_otherShapes = &self->otherShapes;
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    for (i = 0; v7 != i; ++i)
    {
      v9 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      objc_msgSend(v9, "bounds");
      v14 = v10;
      v15 = v11;
      v16 = v12;
      height = v13;
      if (v12 < 0.0 || v13 < 0.0)
      {
        v21 = CGRectStandardize(*(CGRect *)&v10);
        v18 = (id *)p_thinHorizontalShapes;
        if (v21.size.height > 1.0)
        {
          v22.origin.x = v14;
          v22.origin.y = v15;
          v22.size.width = v16;
          v22.size.height = height;
          v23 = CGRectStandardize(v22);
          width = v23.size.width;
          v23.origin.x = v14;
          v23.origin.y = v15;
          v23.size.width = v16;
          v23.size.height = height;
          v24 = CGRectStandardize(v23);
          height = v24.size.height;
          v16 = width;
LABEL_9:
          if (v16 / height > 4.0 || v16 / height == 0.0)
            v18 = (id *)p_thinHorizontalShapes;
          else
            v18 = (id *)p_otherShapes;
        }
      }
      else
      {
        v18 = (id *)p_thinHorizontalShapes;
        if (v13 > 1.0)
          goto LABEL_9;
      }
      objc_msgSend(*v18, "addObject:", v9);
    }
  }
  -[NSMutableArray sortUsingSelector:](*p_otherShapes, "sortUsingSelector:", sel_compareZDescending_);
}

- (BOOL)cuttingShapeBetween:(id)a3 and:(id)a4
{
  uint64_t v7;
  double v8;
  double x;
  double v10;
  double y;
  double v12;
  double width;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  _BOOL4 v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  BOOL v45;
  double v48;
  CGFloat rect;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
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
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v7 = -[NSMutableArray count](self->thinHorizontalShapes, "count");
  if (v7)
  {
    objc_msgSend(a3, "normalizedBounds");
    x = v8;
    y = v10;
    width = v12;
    v15 = v14;
    objc_msgSend(a4, "normalizedBounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v54 = v15;
    v56 = y;
    v24 = v15 < 0.0 || width < 0.0;
    if (v24)
    {
      v58.origin.x = x;
      v58.size.height = v15;
      v58.origin.y = y;
      v58.size.width = width;
      v59 = CGRectStandardize(v58);
      y = v59.origin.y;
    }
    v25 = v23 < 0.0 || v21 < 0.0;
    v26 = v19;
    v27 = v23;
    if (v25)
    {
      v60.origin.x = v17;
      v60.origin.y = v19;
      v60.size.width = v21;
      v60.size.height = v23;
      *(CGRect *)(&v26 - 1) = CGRectStandardize(v60);
    }
    v52 = v27;
    v53 = v26;
    rect = v19;
    v28 = x;
    if (v24)
    {
      v61.origin.x = x;
      v61.size.height = v54;
      v61.origin.y = v56;
      v61.size.width = width;
      *(_QWORD *)&v28 = (unint64_t)CGRectStandardize(v61);
    }
    v29 = v17;
    if (v25)
    {
      v62.origin.x = v17;
      v62.origin.y = rect;
      v62.size.width = v21;
      v62.size.height = v23;
      *(_QWORD *)&v29 = (unint64_t)CGRectStandardize(v62);
    }
    if (v24)
    {
      v63.origin.x = x;
      v63.size.height = v54;
      v63.origin.y = v56;
      v63.size.width = width;
      v64 = CGRectStandardize(v63);
      x = v64.origin.x;
      width = v64.size.width;
    }
    v30 = fmin(v28, v29);
    v31 = x + width;
    if (v25)
    {
      v65.origin.x = v17;
      v65.origin.y = rect;
      v65.size.width = v21;
      v65.size.height = v23;
      v66 = CGRectStandardize(v65);
      v17 = v66.origin.x;
      v21 = v66.size.width;
    }
    v32 = 0;
    v33 = v53 + v52;
    v34 = fmax(v31, v17 + v21);
    v55 = (v34 - v30) * 0.1;
    v57 = v30;
    do
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->thinHorizontalShapes, "objectAtIndex:", v32), "bounds");
      v39 = v35;
      v40 = v36;
      v41 = v37;
      v42 = v38;
      if (v38 < 0.0 || v37 < 0.0)
      {
        v67 = CGRectStandardize(*(CGRect *)&v35);
        if (v67.origin.y + v67.size.height > y)
          goto LABEL_56;
        v68.origin.x = v39;
        v68.origin.y = v40;
        v68.size.width = v41;
        v68.size.height = v42;
        v69 = CGRectStandardize(v68);
        if (v69.origin.y + v69.size.height < v33)
          goto LABEL_56;
        v70.origin.x = v39;
        v70.origin.y = v40;
        v70.size.width = v41;
        v70.size.height = v42;
        v71 = CGRectStandardize(v70);
        if (v71.origin.y > y)
          goto LABEL_56;
        v72.origin.x = v39;
        v72.origin.y = v40;
        v72.size.width = v41;
        v72.size.height = v42;
        v73 = CGRectStandardize(v72);
        if (v73.origin.y < v33)
          goto LABEL_56;
        v74.origin.x = v39;
        v74.origin.y = v40;
        v74.size.width = v41;
        v74.size.height = v42;
        if (COERCE_DOUBLE(CGRectStandardize(v74)) >= v34)
          goto LABEL_56;
        v75.origin.x = v39;
        v75.origin.y = v40;
        v75.size.width = v41;
        v75.size.height = v42;
        v76 = CGRectStandardize(v75);
        if (v76.origin.x + v76.size.width <= v30)
          goto LABEL_56;
        v77.origin.x = v39;
        v77.origin.y = v40;
        v77.size.width = v41;
        v77.size.height = v42;
        v78 = CGRectStandardize(v77);
        v48 = v78.origin.x + v78.size.width - v34;
        v78.origin.x = v39;
        v78.origin.y = v40;
        v78.size.width = v41;
        v78.size.height = v42;
        *(_QWORD *)&v39 = (unint64_t)CGRectStandardize(v78);
      }
      else
      {
        v45 = v36 + v38 <= y && v36 + v38 >= v33 && v36 <= y;
        if (!v45 || v36 < v33)
          goto LABEL_56;
        if (v35 >= v34 || v35 + v37 <= v30)
          goto LABEL_56;
        v48 = v35 + v37 - v34;
      }
      v45 = v48 <= v55;
      v30 = v57;
      if (!v45 || v57 - v39 > v55)
        return 1;
LABEL_56:
      ++v32;
    }
    while (v7 != v32);
  }
  return 0;
}

- (BOOL)paragraph:(id)a3 notOnSameShapeAs:(id)a4
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  BOOL v33;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v7 = -[NSMutableArray count](self->otherShapes, "count");
  if (v7)
  {
    objc_msgSend(a3, "normalizedBounds");
    v37 = v9;
    v38 = v8;
    v35 = v11;
    v36 = v10;
    objc_msgSend(a4, "normalizedBounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = v7 - 1;
    while (1)
    {
      v24 = (void *)-[NSMutableArray objectAtIndex:](self->otherShapes, "objectAtIndex:", v20);
      objc_msgSend(v24, "bounds");
      v29 = v25;
      v30 = v26;
      v31 = v27;
      v32 = v28;
      if (v22)
      {
        if (v21)
          goto LABEL_5;
      }
      else
      {
        v40.origin.y = v37;
        v40.origin.x = v38;
        v40.size.height = v35;
        v40.size.width = v36;
        if (CGRectContainsRect(*(CGRect *)&v25, v40))
          v22 = v24;
        else
          v22 = 0;
        if (v21)
          goto LABEL_5;
      }
      v39.origin.x = v29;
      v39.origin.y = v30;
      v39.size.width = v31;
      v39.size.height = v32;
      v41.origin.x = v13;
      v41.origin.y = v15;
      v41.size.width = v17;
      v41.size.height = v19;
      if (CGRectContainsRect(v39, v41))
        v21 = v24;
      else
        v21 = 0;
LABEL_5:
      if (v21)
        v33 = v22 == 0;
      else
        v33 = 1;
      if (v33)
      {
        v33 = v23 == v20++;
        if (!v33)
          continue;
      }
      return v22 != v21;
    }
  }
  return 0;
}

- (BOOL)paragraph:(id)a3 isAbove:(id)a4
{
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v6 = objc_msgSend(a3, "count");
  if (v6)
  {
    objc_msgSend(a4, "normalizedBounds");
    if (v9 < 0.0 || v10 < 0.0)
      *(CGRect *)&v7 = CGRectStandardize(*(CGRect *)&v7);
    v11 = v8 + v10;
    objc_msgSend((id)objc_msgSend(a3, "lastChild", v7), "baseline");
    LOBYTE(v6) = v12 > v11;
  }
  return v6;
}

- (BOOL)paragraph:(id)a3 isBelow:(id)a4
{
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v6 = objc_msgSend(a3, "count");
  if (v6)
  {
    objc_msgSend(a3, "normalizedBounds");
    if (v9 < 0.0 || v10 < 0.0)
      *(CGRect *)&v7 = CGRectStandardize(*(CGRect *)&v7);
    v11 = v8 + v10;
    objc_msgSend((id)objc_msgSend(a4, "lastChild", v7), "baseline");
    LOBYTE(v6) = v11 < v12;
  }
  return v6;
}

- (id)paragraphBelow:(id)a3 in:(id)a4
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  CGFloat v13;
  double width;
  CGFloat v15;
  double v16;
  uint64_t v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  CGRect v30;
  CGRect v31;

  v7 = objc_msgSend(a4, "count");
  if (!v7)
    return 0;
  objc_msgSend(a3, "normalizedBounds");
  x = v8;
  v13 = v9;
  width = v10;
  v15 = v11;
  if (v10 < 0.0 || v11 < 0.0)
  {
    v16 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v8)) + -4.0;
    v30.origin.x = x;
    v30.origin.y = v13;
    v30.size.width = width;
    v30.size.height = v15;
    v31 = CGRectStandardize(v30);
    x = v31.origin.x;
    width = v31.size.width;
  }
  else
  {
    v16 = v8 + -4.0;
  }
  v17 = 0;
  v18 = x + width + 4.0;
  while (1)
  {
    v19 = (id)objc_msgSend(a4, "objectAtIndex:", v17);
    if (v19 != a3)
    {
      v20 = v19;
      if (!-[CPColumnMaker paragraph:isAbove:](self, "paragraph:isAbove:", v19, a3))
      {
        objc_msgSend(v20, "normalizedBounds");
        if (v23 < 0.0 || v24 < 0.0)
          *(_QWORD *)&v21 = (unint64_t)CGRectStandardize(*(CGRect *)&v21);
        if (v21 <= v18)
        {
          objc_msgSend(v20, "normalizedBounds");
          if (v27 < 0.0 || v28 < 0.0)
            *(CGRect *)&v25 = CGRectStandardize(*(CGRect *)&v25);
          if (v25 + v27 >= v16)
            break;
        }
      }
    }
    if (v7 == ++v17)
      return 0;
  }
  return v20;
}

- (id)paragraphAbove:(id)a3 in:(id)a4
{
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  CGFloat v13;
  double width;
  CGFloat v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  void *v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  CGRect v30;
  CGRect v31;

  v7 = objc_msgSend(a4, "count");
  if (!v7)
    return 0;
  objc_msgSend(a3, "normalizedBounds");
  x = v8;
  v13 = v9;
  width = v10;
  v15 = v11;
  if (v10 < 0.0 || v11 < 0.0)
  {
    v16 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v8)) + -4.0;
    v30.origin.x = x;
    v30.origin.y = v13;
    v30.size.width = width;
    v30.size.height = v15;
    v31 = CGRectStandardize(v30);
    x = v31.origin.x;
    width = v31.size.width;
  }
  else
  {
    v16 = v8 + -4.0;
  }
  if (v7 < 1)
    return 0;
  v17 = x + width + 4.0;
  v18 = v7 + 1;
  while (1)
  {
    v19 = (id)objc_msgSend(a4, "objectAtIndex:", (v18 - 2));
    if (v19 != a3)
    {
      v20 = v19;
      if (!-[CPColumnMaker paragraph:isBelow:](self, "paragraph:isBelow:", v19, a3))
      {
        objc_msgSend(v20, "normalizedBounds");
        if (v23 < 0.0 || v24 < 0.0)
          *(_QWORD *)&v21 = (unint64_t)CGRectStandardize(*(CGRect *)&v21);
        if (v21 <= v17)
        {
          objc_msgSend(v20, "normalizedBounds");
          if (v27 < 0.0 || v28 < 0.0)
            *(CGRect *)&v25 = CGRectStandardize(*(CGRect *)&v25);
          if (v25 + v27 >= v16)
            break;
        }
      }
    }
    if ((unint64_t)--v18 <= 1)
      return 0;
  }
  return v20;
}

- (id)chunkAbove:(id)a3 in:(id)a4
{
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  CGFloat v12;
  double width;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  int v20;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v6 = objc_msgSend(a4, "count");
  if (!v6)
    return 0;
  objc_msgSend(a3, "bounds");
  x = v7;
  v12 = v8;
  width = v9;
  v14 = v10;
  if (v9 < 0.0 || v10 < 0.0)
  {
    v35 = CGRectStandardize(*(CGRect *)&v7);
    v15 = v35.origin.y + v35.size.height;
    v35.origin.x = x;
    v35.origin.y = v12;
    v35.size.width = width;
    v35.size.height = v14;
    *(_QWORD *)&v16 = (unint64_t)CGRectStandardize(v35);
    v36.origin.x = x;
    v36.origin.y = v12;
    v36.size.width = width;
    v36.size.height = v14;
    v37 = CGRectStandardize(v36);
    x = v37.origin.x;
    width = v37.size.width;
  }
  else
  {
    v15 = v8 + v10;
    v16 = v7;
  }
  if (v6 < 1)
    return 0;
  v17 = x + width;
  v18 = v6 + 1;
  while (1)
  {
    v19 = (id)objc_msgSend(a4, "objectAtIndex:", (v18 - 2));
    v20 = objc_msgSend(v19, "count");
    if (v19 != a3 && v20 != 0)
    {
      objc_msgSend(v19, "bounds");
      if (v24 < 0.0 || v25 < 0.0)
        *(CGRect *)(&v23 - 1) = CGRectStandardize(*(CGRect *)&v22);
      if (v23 - v15 >= -15.0)
      {
        objc_msgSend(v19, "bounds", v23 - v15);
        if (v28 < 0.0 || v29 < 0.0)
          *(_QWORD *)&v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v26);
        if (v26 <= v17)
        {
          objc_msgSend(v19, "bounds");
          if (v32 < 0.0 || v33 < 0.0)
            *(CGRect *)&v30 = CGRectStandardize(*(CGRect *)&v30);
          if (v30 + v32 >= v16)
            break;
        }
      }
    }
    if ((unint64_t)--v18 <= 1)
      return 0;
  }
  return v19;
}

- (BOOL)paragraph:(id)a3 isLinkedBelowTo:(id)a4
{
  int v7;
  int v8;
  int v9;

  v7 = objc_msgSend(a4, "count");
  if (v7)
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "flowProperties"), "outOrder");
    v9 = objc_msgSend(a4, "inOrder");
    LOBYTE(v7) = 0;
    if (v9 == 1 && v8 == 1)
      LOBYTE(v7) = -[CPColumnMaker paragraphAbove:in:](self, "paragraphAbove:in:", objc_msgSend(a4, "firstChild"), self->allParagraphs) == a3;
  }
  return v7;
}

- (BOOL)column:(id)a3 isLinkedBelowTo:(id)a4
{
  return objc_msgSend(a3, "count")
      && objc_msgSend(a4, "count")
      && -[CPColumnMaker paragraph:isLinkedBelowTo:](self, "paragraph:isLinkedBelowTo:", objc_msgSend(a3, "lastChild"), a4);
}

- (BOOL)canSafelyAdd:(id)a3 to:(id)a4
{
  return 1;
}

- (void)intersectionCallout:(id)a3
{
  id v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  _BOOL4 v28;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat r1;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v3 = a3;
  objc_msgSend((id)objc_msgSend(a3, "paragraph"), "normalizedBounds");
  v44 = v5;
  v45 = v6;
  r1 = v7;
  v9 = v8;
  objc_msgSend(v3, "area");
  v40 = v10;
  v11 = -[NSMutableArray count](self->paragraphWrappers, "count");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "paragraph"), "lastChild"), "baseline");
  v13 = v11;
  if (v11)
  {
    v14 = v12;
    v15 = 0;
    v16 = v45;
    v17 = v9 < 0.0 || v45 < 0.0;
    v41 = v14;
    v42 = v9;
    while (1)
    {
      v18 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", v15, v16);
      v19 = objc_msgSend(v18, "paragraph");
      if (v19 != objc_msgSend(v3, "paragraph"))
      {
        objc_msgSend((id)objc_msgSend(v18, "paragraph"), "normalizedBounds");
        v24 = v20;
        v25 = v21;
        v26 = v22;
        v27 = v23;
        v28 = v23 < 0.0 || v22 < 0.0;
        if (v28)
          *(CGRect *)(&v21 - 1) = CGRectStandardize(*(CGRect *)&v20);
        v16 = v21 + v23;
        if (v21 + v23 > v14)
        {
          v48.origin.x = v44;
          v48.size.width = v45;
          v48.origin.y = r1;
          v48.size.height = v9;
          v47 = v24;
          v56.origin.x = v24;
          v56.origin.y = v25;
          v56.size.width = v26;
          v56.size.height = v27;
          v49 = CGRectIntersection(v48, v56);
          x = v49.origin.x;
          y = v49.origin.y;
          width = v49.size.width;
          height = v49.size.height;
          objc_msgSend(v18, "area");
          v43 = v33;
          if (width < 0.0 || height < 0.0)
          {
            v50.origin.x = x;
            v50.origin.y = y;
            v50.size.width = width;
            v50.size.height = height;
            v51 = CGRectStandardize(v50);
            v34 = v51.size.width;
            v51.origin.x = x;
            v51.origin.y = y;
            v51.size.width = width;
            v51.size.height = height;
            v52 = CGRectStandardize(v51);
            height = v52.size.height;
          }
          else
          {
            v34 = width;
          }
          v14 = v41;
          v9 = v42;
          v35 = v34 * height;
          v16 = 1.0;
          if (v35 > 1.0)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "paragraph"), "lastChild"), "baseline");
            v37 = v36;
            v38 = r1;
            v39 = v42;
            if (v17)
            {
              v53.origin.x = v44;
              v53.size.width = v45;
              v53.origin.y = r1;
              v53.size.height = v42;
              *(CGRect *)(&v38 - 1) = CGRectStandardize(v53);
            }
            v16 = v38 + v39;
            if (v38 + v39 > v37)
            {
              if (v28)
              {
                v54.origin.x = v47;
                v54.origin.y = v25;
                v54.size.width = v26;
                v54.size.height = v27;
                v55 = CGRectStandardize(v54);
                v25 = v55.origin.y;
                v27 = v55.size.height;
              }
              v16 = v25 + v27;
              if (v25 + v27 > v41)
              {
                v16 = fmax(v40, v43) * 0.02;
                if (v35 > v16)
                  break;
              }
            }
          }
        }
      }
      if (v13 == ++v15)
        return;
    }
    if (v40 >= v43 * 0.25)
    {
      if (v43 >= v40 * 0.25 && (int)objc_msgSend(v18, "inOrder") <= 1)
      {
        if ((int)objc_msgSend(v18, "outOrder") > 1)
          v3 = v18;
      }
      else
      {
        v3 = v18;
      }
    }
    objc_msgSend(v3, "setCalloutType:", 3);
  }
}

- (void)callOuts
{
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  BOOL v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  _BOOL4 v62;
  double v63;
  _BOOL4 v64;
  double v65;
  double v66;
  double x;
  double width;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat rect;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v3 = -[NSMutableArray count](self->paragraphWrappers, "count");
  if (v3 >= 2)
  {
    objc_msgSend(-[CPObject page](self->currentZone, "page"), "pageCropBox");
    v8 = v7;
    v9 = v4;
    v10 = v5;
    v11 = v6;
    v12 = 0;
    v13 = v6 < 0.0 || v5 < 0.0;
    v14 = v4 + v6;
    do
    {
      v15 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", v12);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "paragraph"), "childAtIndex:", 0), "baseline");
      v17 = v16;
      if (v13)
      {
        v73.origin.x = v8;
        v73.origin.y = v9;
        v73.size.width = v10;
        v73.size.height = v11;
        v74 = CGRectStandardize(v73);
        v18 = v74.origin.y + v74.size.height - v17;
        v74.origin.x = v8;
        v74.origin.y = v9;
        v74.size.width = v10;
        v74.size.height = v11;
        v75 = CGRectStandardize(v74);
      }
      else
      {
        v18 = v14 - v16;
        v75.size.height = v11;
      }
      if (v18 > v75.size.height * 0.1)
        break;
      if (objc_msgSend((id)objc_msgSend(v15, "paragraph"), "count") == 1
        && !objc_msgSend(v15, "inOrder"))
      {
        if (!CheckParagraphUnilined(v15))
          break;
        objc_msgSend(v15, "dBelow");
        v20 = v19;
        if (!objc_msgSend(v15, "outOrder"))
          goto LABEL_19;
        if ((int)objc_msgSend(v15, "outOrder") >= 1)
        {
          objc_msgSend((id)objc_msgSend(v15, "paragraph"), "normalizedBounds");
          if (v23 < 0.0 || v24 < 0.0)
            *(CGRect *)(&v24 - 3) = CGRectStandardize(*(CGRect *)&v21);
          if (v20 > v24)
LABEL_19:
            objc_msgSend(v15, "setCalloutType:", 1);
        }
      }
      ++v12;
    }
    while (v3 != v12);
    v25 = v3 - 1;
    do
    {
      v26 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", v25);
      objc_msgSend((id)objc_msgSend(v26, "paragraph"), "normalizedBounds");
      if (v29 < 0.0 || v30 < 0.0)
        *(CGRect *)(&v28 - 1) = CGRectStandardize(*(CGRect *)&v27);
      v31 = v28 + v30;
      if (v13)
      {
        v76.origin.x = v8;
        v76.origin.y = v9;
        v76.size.width = v10;
        v76.size.height = v11;
        v77 = CGRectStandardize(v76);
        v32 = v31 - v77.origin.y;
        v77.origin.x = v8;
        v77.origin.y = v9;
        v77.size.width = v10;
        v77.size.height = v11;
        v78 = CGRectStandardize(v77);
      }
      else
      {
        v32 = v31 - v9;
        v78.size.height = v11;
      }
      if (v32 > v78.size.height * 0.1)
        break;
      if (objc_msgSend((id)objc_msgSend(v26, "paragraph"), "count") == 1
        && !objc_msgSend(v26, "outOrder"))
      {
        objc_msgSend(v26, "dAbove");
        v34 = v33;
        if (!objc_msgSend(v26, "inOrder"))
          goto LABEL_39;
        if ((int)objc_msgSend(v26, "inOrder") >= 1)
        {
          objc_msgSend((id)objc_msgSend(v26, "paragraph"), "normalizedBounds");
          if (v37 < 0.0 || v38 < 0.0)
            *(CGRect *)(&v38 - 3) = CGRectStandardize(*(CGRect *)&v35);
          if (v34 > v38)
            goto LABEL_39;
        }
        if ((int)objc_msgSend(v26, "inOrder") > 1)
          goto LABEL_39;
        v39 = (void *)objc_msgSend((id)objc_msgSend(v26, "paragraphsAbove"), "objectAtIndex:", 0);
        objc_msgSend(v39, "alignment");
        objc_msgSend(v39, "left");
        v41 = v40;
        objc_msgSend(v39, "right");
        objc_msgSend(v39, "center");
        objc_msgSend((id)objc_msgSend(v26, "paragraph"), "left");
        v43 = v42;
        objc_msgSend((id)objc_msgSend(v26, "paragraph"), "right");
        objc_msgSend((id)objc_msgSend(v26, "paragraph"), "center");
        if (vabdd_f64(v41, v43) > 1.0)
        {
LABEL_39:
          if (!CheckParagraphUnilined(v26))
            break;
          objc_msgSend(v26, "setCalloutType:", 1);
        }
      }
      --v25;
    }
    while ((_DWORD)v25);
    v44 = 0;
    v45 = v3;
    do
    {
      v46 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", v44);
      if (!objc_msgSend(v46, "calloutType"))
      {
        if (!objc_msgSend(v46, "inOrder") && objc_msgSend(v46, "outOrder") == 2)
        {
          objc_msgSend((id)objc_msgSend(v46, "paragraph"), "normalizedBounds");
          v48 = v47;
          rect = v49;
          v51 = v50;
          v53 = v52;
          objc_msgSend(v46, "belowBounds");
          v55 = v54;
          v57 = v56;
          v59 = v58;
          v61 = v60;
          v62 = v53 < 0.0 || v51 < 0.0;
          v63 = v48;
          if (v62)
          {
            v79.origin.x = v48;
            v79.origin.y = rect;
            v79.size.width = v51;
            v79.size.height = v53;
            *(_QWORD *)&v63 = (unint64_t)CGRectStandardize(v79);
          }
          v64 = v61 < 0.0 || v59 < 0.0;
          v70 = v57;
          v71 = v55;
          if (v64)
          {
            v80.origin.x = v55;
            v80.origin.y = v57;
            v80.size.width = v59;
            v80.size.height = v61;
            v65 = COERCE_DOUBLE(CGRectStandardize(v80));
            v81.origin.y = v57;
            v66 = v63 - v65;
            v81.origin.x = v55;
            v81.size.width = v59;
            v81.size.height = v61;
            v82 = CGRectStandardize(v81);
            x = v82.origin.x;
            width = v82.size.width;
            if (!v62)
              goto LABEL_62;
LABEL_61:
            v83.origin.x = v48;
            v83.origin.y = rect;
            v83.size.width = v51;
            v83.size.height = v53;
            v84 = CGRectStandardize(v83);
            v48 = v84.origin.x;
            v51 = v84.size.width;
          }
          else
          {
            v66 = v63 - v55;
            x = v55;
            width = v59;
            if (v62)
              goto LABEL_61;
          }
LABEL_62:
          if (v66 >= 0.0)
          {
            v69 = x + width - (v48 + v51);
            if (v69 >= 0.0)
            {
              if (v64)
              {
                v85.origin.y = v70;
                v85.origin.x = v71;
                v85.size.width = v59;
                v85.size.height = v61;
                v86 = CGRectStandardize(v85);
                v59 = v86.size.width;
              }
              if (v66 + v69 > v59 * 0.5)
                objc_msgSend(v46, "setCalloutType:", 2, v66 + v69);
            }
          }
          goto LABEL_58;
        }
        -[CPColumnMaker intersectionCallout:](self, "intersectionCallout:", v46);
      }
LABEL_58:
      ++v44;
    }
    while (v45 != v44);
  }
}

- (BOOL)closeImagesBetween:(id)a3 and:(id)a4 bounds:(CGRect)a5
{
  CGFloat x;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  NSMutableArray *images;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t i;
  void *v28;
  CGFloat v29;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double maxParagraphDistance;
  double v53;
  BOOL v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  uint64_t v61;
  double v62;
  uint64_t rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double v67;
  double v68;
  CGFloat r2;
  CGFloat r2_8;
  CGFloat r2_16;
  CGFloat r2_24;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  r2_16 = a5.size.width;
  r2_24 = a5.size.height;
  r2_8 = a5.origin.y;
  x = a5.origin.x;
  v83 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  objc_msgSend(a3, "normalizedBounds");
  v11 = v10;
  v67 = v13;
  v68 = v12;
  v15 = v14;
  objc_msgSend(a4, "normalizedBounds");
  rect = v16;
  rect_8 = v17;
  rect_16 = v19;
  rect_24 = v18;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  images = self->images;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](images, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (!v21)
    goto LABEL_29;
  v22 = v21;
  v61 = v11;
  v62 = v15;
  v23 = *(_QWORD *)v78;
  v24 = 0.0;
  v25 = 0.0;
  v26 = INFINITY;
  r2 = INFINITY;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v78 != v23)
        objc_enumerationMutation(images);
      v28 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
      objc_msgSend(v28, "bounds", v61);
      v85 = CGRectInset(v84, 2.0, 2.0);
      v29 = v85.origin.x;
      y = v85.origin.y;
      width = v85.size.width;
      height = v85.size.height;
      v85.origin.x = x;
      v85.origin.y = r2_8;
      v85.size.width = r2_16;
      v85.size.height = r2_24;
      v92.origin.x = v29;
      v92.origin.y = y;
      v92.size.width = width;
      v92.size.height = height;
      if (CGRectContainsRect(v85, v92))
      {
        objc_msgSend(v9, "addObject:", v28);
        v86.origin.x = v29;
        v86.origin.y = y;
        v86.size.width = width;
        v86.size.height = height;
        v93.origin.x = r2;
        v93.origin.y = v26;
        v93.size.width = v25;
        v93.size.height = v24;
        v87 = CGRectUnion(v86, v93);
        r2 = v87.origin.x;
        v26 = v87.origin.y;
        v25 = v87.size.width;
        v24 = v87.size.height;
      }
    }
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](images, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  }
  while (v22);
  if (v25 == 0.0)
    goto LABEL_29;
  v33 = v25;
  objc_msgSend(v9, "sortUsingSelector:", sel_compareTopDescending_);
  v34 = objc_msgSend(v9, "count");
  v35 = 1;
  v36 = v68;
  while (v34 != v35)
  {
    v37 = (void *)objc_msgSend(v9, "objectAtIndex:", v35 - 1);
    v38 = (void *)objc_msgSend(v9, "objectAtIndex:", v35);
    objc_msgSend(v37, "bottom");
    v40 = v39;
    objc_msgSend(v38, "top");
    ++v35;
    if (v40 - v41 > self->maxParagraphDistance)
      goto LABEL_29;
  }
  v42 = v67;
  if (v62 < 0.0 || v67 < 0.0)
  {
    v43 = v61;
    v44 = v62;
    v45 = v68;
    v88 = CGRectStandardize(*(CGRect *)(&v42 - 3));
    v36 = v88.origin.y;
  }
  if (v33 < 0.0 || v24 < 0.0)
  {
    v89.origin.x = r2;
    v89.origin.y = v26;
    v89.size.width = v33;
    v89.size.height = v24;
    v90 = CGRectStandardize(v89);
    v46 = v36 - (v90.origin.y + v90.size.height);
    v90.origin.x = r2;
    v90.origin.y = v26;
    v90.size.width = v33;
    v90.size.height = v24;
    v91 = CGRectStandardize(v90);
    v26 = v91.origin.y;
  }
  else
  {
    v46 = v36 - (v26 + v24);
  }
  v48 = rect_16;
  v47 = rect_24;
  v49 = rect_8;
  if (rect_8 < 0.0 || rect_16 < 0.0)
  {
    v50 = rect;
    *(CGRect *)(&v47 - 1) = CGRectStandardize(*(CGRect *)(&v47 - 1));
  }
  v51 = v47 + v48;
  maxParagraphDistance = self->maxParagraphDistance;
  v53 = v26 - v51;
  if (v46 < maxParagraphDistance && v53 < maxParagraphDistance)
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v57 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v74 != v59)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "setAnchoringParagraph:", a3);
        }
        v58 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      }
      while (v58);
    }
    v55 = 1;
  }
  else
  {
LABEL_29:
    v55 = 0;
  }

  return v55;
}

- (double)averageSpacing:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  double v7;
  double v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;

  v4 = objc_msgSend(a3, "count");
  if (!v4)
    return 0.0;
  if (v4 == 1)
  {
    objc_msgSend(a3, "normalizedBounds");
    if (v7 < 0.0 || v8 < 0.0)
      *(CGRect *)(&v8 - 3) = CGRectStandardize(*(CGRect *)&v5);
  }
  else
  {
    v9 = 0;
    v10 = v4;
    v11 = v4 - 1;
    v12 = 0.0;
    do
    {
      v13 = v9 + 1;
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:"), "baseline");
      v15 = v14;
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:", v13), "baseline");
      v12 = v12 + v15 - v16;
      v9 = v13;
    }
    while (v11 != v13);
    return v12 / (double)v10;
  }
  return v8;
}

- (void)splitColumns:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CPColumn *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
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
  uint64_t v41;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect v48;

  v41 = objc_msgSend(a3, "count");
  if (v41)
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(a3, "objectAtIndex:", v4, v41);
      objc_msgSend(v5, "normalizedBounds");
      v45 = v7;
      v46 = v6;
      v43 = v9;
      v44 = v8;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", objc_msgSend(v5, "children"));
      v11 = objc_alloc_init(CPColumn);
      v12 = objc_msgSend(v10, "count");
      if (v12 != 1)
      {
        v13 = v12;
        for (i = 1; i != v13; ++i)
        {
          v15 = (void *)objc_msgSend(v10, "objectAtIndex:", i - 1);
          -[CPChunk add:](v11, "add:", v15);
          v16 = (void *)objc_msgSend(v10, "objectAtIndex:", i);
          objc_msgSend(v15, "normalizedBounds");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          objc_msgSend(v16, "normalizedBounds");
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;
          if (v22 < 0.0 || v24 < 0.0)
          {
            v47.origin.x = v18;
            v47.origin.y = v20;
            v47.size.width = v22;
            v47.size.height = v24;
            *(CGRect *)&v25 = CGRectStandardize(v47);
            v20 = v33;
          }
          if (v30 < 0.0 || v32 < 0.0)
          {
            v48.origin.x = v26;
            v48.origin.y = v28;
            v48.size.width = v30;
            v48.size.height = v32;
            *(CGRect *)&v25 = CGRectStandardize(v48);
            v28 = v34;
            v32 = v35;
          }
          -[CPColumnMaker averageSpacing:](self, "averageSpacing:", v15, v25);
          v37 = v36;
          -[CPColumnMaker averageSpacing:](self, "averageSpacing:", v16);
          v39 = fmax(v37, v38);
          v40 = 1.0;
          if (v39 > 20.0)
            v40 = v39 / 12.0 * 5.0 / 100.0 + 1.0;
          if (vabdd_f64(v20, v28 + v32) > v40 * self->maxParagraphDistance
            && !-[CPColumnMaker closeImagesBetween:and:bounds:](self, "closeImagesBetween:and:bounds:", v15, objc_msgSend(v10, "objectAtIndex:", i), v46, v45, v44, v43))
          {
            -[NSMutableArray addObject:](self->columns, "addObject:", v11);

            v11 = objc_alloc_init(CPColumn);
          }
        }
      }
      -[CPChunk add:](v11, "add:", objc_msgSend(v10, "lastObject"));
      -[NSMutableArray addObject:](self->columns, "addObject:", v11);

      ++v4;
    }
    while (v4 != v41);
  }
}

- (void)anchorImages
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableArray *images;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
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
  NSMutableArray *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->columns, "count");
  if ((unint64_t)(-[NSMutableArray count](self->images, "count") + v3) <= 0xC8)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = self->columns;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v33 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          images = self->images;
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](images, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v29 != v12)
                  objc_enumerationMutation(images);
                v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                objc_msgSend(v14, "top");
                v16 = v15;
                objc_msgSend(v8, "bottom");
                if (v16 <= v17)
                {
                  objc_msgSend(v8, "bottom");
                  v19 = v18;
                  objc_msgSend(v14, "top");
                  if (v19 - v20 <= self->maxParagraphDistance)
                  {
                    objc_msgSend(v14, "left");
                    v22 = v21;
                    objc_msgSend(v8, "left");
                    if (v22 >= v23)
                    {
                      objc_msgSend(v14, "right");
                      v25 = v24;
                      objc_msgSend(v8, "right");
                      if (v25 <= v26)
                        objc_msgSend(v14, "setAnchoringParagraph:", objc_msgSend(v8, "lastChild"));
                    }
                  }
                }
              }
              v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](images, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v11);
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v5);
    }
  }
}

- (void)makeColumnsFrom:(id)a3 zone:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  double v9;
  double width;
  double height;
  CGFloat x;
  CGFloat y;
  void *v14;
  float v15;
  void *v16;
  uint64_t v17;
  CPParagraphFlow *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t j;
  void *v24;
  CPColumn *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSMutableArray *columns;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  CPColumn *v38;
  uint64_t v39;
  uint64_t n;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = objc_msgSend(a3, "count");
    if (((double)v8 * -0.01 + 15.0) / 100.0 >= 0.0)
      v9 = ((double)v8 * -0.01 + 15.0) / 100.0;
    else
      v9 = 0.0;
    width = self->pageBounds.size.width;
    height = self->pageBounds.size.height;
    if (width < 0.0 || height < 0.0)
    {
      x = self->pageBounds.origin.x;
      y = self->pageBounds.origin.y;
      *(CGRect *)(&height - 3) = CGRectStandardize(*(CGRect *)(&width - 2));
    }
    self->maxParagraphDistance = v9 * height;
    self->currentZone = (CPZone *)a4;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    objc_msgSend((id)objc_msgSend(a4, "page"), "complexity");
    if (v15 <= 0.8)
      objc_msgSend(a4, "descendantsOfClass:to:", objc_opt_class(), v14);
    -[CPColumnMaker partitionShapes:](self, "partitionShapes:", v14);

    self->images = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    objc_msgSend(a4, "descendantsOfClass:to:", objc_opt_class(), self->images);
    -[NSMutableArray sortUsingSelector:](self->images, "sortUsingSelector:", sel_compareZDescending_);
    self->allParagraphs = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", a3);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", a3);
    -[NSMutableArray sortUsingSelector:](self->allParagraphs, "sortUsingSelector:", sel_compareY_);
    objc_msgSend(v16, "sortUsingSelector:", sel_compareTopDescending_);
    v17 = 0;
    self->paragraphWrappers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    do
    {
      v18 = -[CPParagraphFlow initWithParagraph:]([CPParagraphFlow alloc], "initWithParagraph:", objc_msgSend(a3, "objectAtIndex:", v17));
      -[NSMutableArray addObject:](self->paragraphWrappers, "addObject:", v18);
      -[CPParagraphFlow setParagraphsAboveIn:](v18, "setParagraphsAboveIn:", self->allParagraphs);
      -[CPParagraphFlow setParagraphsBelowIn:](v18, "setParagraphsBelowIn:", v16);

      ++v17;
    }
    while (v7 != v17);

    -[NSMutableArray sortUsingSelector:](self->allParagraphs, "sortUsingSelector:", sel_compareX_);
    v19 = -[NSMutableArray count](self->paragraphWrappers, "count");
    if (v19)
    {
      for (i = 0; i != v19; ++i)
      {
        v21 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", i);
        objc_msgSend(v21, "setParagraphsLeftIn:", self->allParagraphs);
        objc_msgSend(v21, "setParagraphsRightIn:", self->allParagraphs);
      }
    }
    -[CPColumnMaker callOuts](self, "callOuts");
    -[NSMutableArray sortUsingSelector:](self->paragraphWrappers, "sortUsingSelector:", sel_topDescending_);
    self->columns = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    if (v19)
    {
      for (j = 0; j != v19; ++j)
      {
        v24 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", j);
        if (!objc_msgSend(v24, "calloutType") && (objc_msgSend(v24, "placed") & 1) == 0)
        {
          v25 = objc_alloc_init(CPColumn);
          objc_msgSend(v22, "addObject:", v25);

          -[CPChunk add:](v25, "add:", objc_msgSend(v24, "paragraph"));
          objc_msgSend(v24, "setPlaced:", 1);
          v26 = objc_msgSend(v24, "nextParagraphInColumn:", v25);
          if (v26)
          {
            v27 = (void *)v26;
            do
            {
              if (!-[CPColumnMaker canSafelyAdd:to:](self, "canSafelyAdd:to:", v27, v25))
                break;
              v28 = (void *)objc_msgSend(v27, "flowProperties");
              if (!objc_msgSend(v28, "calloutType") && (objc_msgSend(v28, "placed") & 1) == 0)
              {
                -[CPChunk add:](v25, "add:", v27);
                objc_msgSend(v28, "setPlaced:", 1);
              }
              v27 = (void *)objc_msgSend(v28, "nextParagraphInColumn:", v25);
            }
            while (v27);
          }
        }
      }
    }
    -[CPColumnMaker splitColumns:](self, "splitColumns:", v22);

    -[CPColumnMaker anchorImages](self, "anchorImages");
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    columns = self->columns;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(columns);
          v34 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
          if (objc_msgSend(v34, "count"))
            objc_msgSend(a4, "add:", v34);
        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](columns, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v31);
    }
    v35 = -[NSMutableArray count](self->paragraphWrappers, "count");
    if (v35)
    {
      for (m = 0; m != v35; ++m)
      {
        v37 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphWrappers, "objectAtIndex:", m);
        if (objc_msgSend(v37, "calloutType"))
        {
          v38 = objc_alloc_init(CPColumn);
          -[NSMutableArray addObject:](self->columns, "addObject:", v38);
          objc_msgSend(a4, "add:", v38);

          -[CPChunk add:](v38, "add:", objc_msgSend(v37, "paragraph"));
        }
      }
    }

    v39 = -[NSMutableArray count](self->columns, "count");
    if (v39)
    {
      for (n = 0; n != v39; ++n)
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->columns, "objectAtIndex:", n), "sortUsingSelector:", sel_compareTopDescending_);
    }

    objc_msgSend((id)objc_msgSend(a4, "page"), "addColumns:", self->columns);
  }
}

- (CGRect)pageBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->pageBounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPageBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->pageBounds, &v3, 32, 1, 0);
}

@end
