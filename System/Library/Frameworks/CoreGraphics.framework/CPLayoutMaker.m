@implementation CPLayoutMaker

- (void)makeLayouts:(id)a3 from:(id)a4
{
  uint64_t v7;
  CPLayoutArea *v8;
  uint64_t i;
  uint64_t v10;

  objc_msgSend(a4, "sortUsingSelector:", sel_compareTopDescending_);
  v7 = objc_msgSend(a4, "count");
  if (v7)
  {
    v8 = objc_alloc_init(CPLayoutArea);
    -[CPLayoutArea setHasRotatedCharacters:](v8, "setHasRotatedCharacters:", objc_msgSend(a3, "hasRotatedCharacters"));
    objc_msgSend(a3, "add:", v8);

    for (i = 0; i != v7; ++i)
    {
      v10 = objc_msgSend(a4, "objectAtIndex:", i);
      if (!-[CPLayoutMaker column:fits:](self, "column:fits:", v10, v8))
      {
        -[CPChunk sortUsingSelector:](v8, "sortUsingSelector:", sel_compareX_);
        v8 = objc_alloc_init(CPLayoutArea);
        -[CPLayoutArea setHasRotatedCharacters:](v8, "setHasRotatedCharacters:", objc_msgSend(a3, "hasRotatedCharacters"));
        objc_msgSend(a3, "add:", v8);

      }
      -[CPChunk add:](v8, "add:", v10);
    }
    -[CPChunk sortUsingSelector:](v8, "sortUsingSelector:", sel_compareX_);
  }
}

- (BOOL)column:(id)a3 fits:(id)a4
{
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double y;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat rect1;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v6 = objc_msgSend(a4, "count");
  if (!v6)
    return 1;
  v7 = v6;
  objc_msgSend(a3, "normalizedBounds");
  v12 = v8;
  rect1 = v9;
  v13 = v10;
  v14 = v11;
  if (v10 < 0.0 || v11 < 0.0)
  {
    v15 = (unint64_t)CGRectStandardize(*(CGRect *)&v8);
    v38.origin.x = v12;
    v38.origin.y = rect1;
    v38.size.width = v13;
    v38.size.height = v14;
    v39 = CGRectStandardize(v38);
    v35 = v39.origin.x + v39.size.width;
    v39.origin.x = v12;
    v39.origin.y = rect1;
    v39.size.width = v13;
    v39.size.height = v14;
    *(CGRect *)(&v9 - 1) = CGRectStandardize(v39);
  }
  else
  {
    v35 = v8 + v10;
    *(double *)&v15 = v8;
  }
  v16 = 0;
  v36 = v9 + v11;
  v33 = v13;
  v34 = v14;
  while (1)
  {
    v17 = *(double *)&v15;
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", v16), "normalizedBounds");
    v19 = v18;
    y = v20;
    v23 = v22;
    v25 = v24;
    v40.origin.x = v12;
    v40.origin.y = rect1;
    v40.size.width = v13;
    v40.size.height = v14;
    v46.origin.x = v19;
    v46.origin.y = y;
    v46.size.width = v23;
    v46.size.height = v25;
    if (CGRectIntersectsRect(v40, v46))
      break;
    if (v23 < 0.0 || v25 < 0.0)
    {
      v27 = v12;
      v41.origin.x = v19;
      v41.origin.y = y;
      v41.size.width = v23;
      v41.size.height = v25;
      v28 = COERCE_DOUBLE(CGRectStandardize(v41));
      v42.origin.x = v19;
      v42.origin.y = y;
      v42.size.width = v23;
      v42.size.height = v25;
      v43 = CGRectStandardize(v42);
      v26 = v43.origin.x + v43.size.width;
      if (v17 >= v28 && v17 <= v26)
        return 0;
      v44.origin.x = v19;
      v44.origin.y = y;
      v44.size.width = v23;
      v44.size.height = v25;
      v45 = CGRectStandardize(v44);
      y = v45.origin.y;
      v19 = v28;
      v12 = v27;
      v13 = v33;
      *(double *)&v15 = v17;
    }
    else
    {
      v26 = v19 + v23;
      *(double *)&v15 = v17;
      if (v17 >= v19 && v17 <= v26)
        return 0;
    }
    if (v35 <= v26 && v35 >= v19 || v36 < y)
      return 0;
    v16 = (v16 + 1);
    v14 = v34;
    if (v7 == (_DWORD)v16)
      return 1;
  }
  return 0;
}

@end
