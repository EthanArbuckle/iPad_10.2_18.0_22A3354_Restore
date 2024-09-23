@implementation CPParagraphMaker

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPParagraphMaker;
  -[CPParagraphMaker dealloc](&v3, sel_dealloc);
}

- (id)paragraphs
{
  return self->paragraphs;
}

- (BOOL)firstWordOf:(id)a3 fits:(id)a4 indent:(double)a5
{
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;

  v8 = objc_msgSend(a3, "wordCount");
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(a4, "parent"), "bounds");
    if (v11 < 0.0 || v12 < 0.0)
      *(CGRect *)&v9 = CGRectStandardize(*(CGRect *)&v9);
    v13 = v11 - a5;
    objc_msgSend(a4, "bounds", v9, v10);
    if (v16 < 0.0 || v17 < 0.0)
      *(CGRect *)&v14 = CGRectStandardize(*(CGRect *)&v14);
    v18 = v13 - v16;
    v19 = objc_msgSend(a3, "wordAtIndex:", 0, v14, v15);
    v20 = *(void **)(*(_QWORD *)(objc_msgSend((id)objc_msgSend(a3, "charSequence"), "charAtIndex:", 0) + 160) + 64);
    v21 = *(double *)(*(_QWORD *)(objc_msgSend((id)objc_msgSend(a3, "charSequence"), "charAtIndex:", 0) + 160) + 72);
    objc_msgSend(v20, "spaceWidth");
    v23 = v21 * v22;
    v24 = *(double *)(v19 + 32);
    v25 = *(double *)(v19 + 40);
    if (v24 < 0.0 || v25 < 0.0)
    {
      v26 = *(_QWORD *)(v19 + 16);
      v27 = *(_QWORD *)(v19 + 24);
      *(CGRect *)(&v24 - 2) = CGRectStandardize(*(CGRect *)(&v24 - 2));
    }
    LOBYTE(v8) = v18 > v23 + v24;
  }
  return v8;
}

- (BOOL)isGraphicBetween:(id)a3 and:(id)a4
{
  NSMutableArray *compoundedShapesOnPage;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double x;
  double width;
  double v33;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect v56;

  if (!self->parent)
    return 0;
  compoundedShapesOnPage = self->compoundedShapesOnPage;
  v7 = -[NSMutableArray count](compoundedShapesOnPage, "count");
  objc_msgSend(a3, "bounds");
  v12 = v9;
  if (v10 < 0.0 || v11 < 0.0)
  {
    *(CGRect *)&v8 = CGRectStandardize(*(CGRect *)&v8);
    v12 = v13;
  }
  objc_msgSend(a4, "bounds", v8);
  v18 = v15;
  v19 = v17;
  if (v16 < 0.0 || v17 < 0.0)
  {
    *(CGRect *)&v14 = CGRectStandardize(*(CGRect *)&v14);
    v18 = v20;
    v19 = v21;
  }
  objc_msgSend(a3, "bounds", v14);
  v26 = v22;
  if (v24 < 0.0 || v25 < 0.0)
    *(_QWORD *)&v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v22);
  objc_msgSend(a3, "bounds");
  x = v27;
  width = v29;
  if (v29 < 0.0 || v30 < 0.0)
  {
    v56 = CGRectStandardize(*(CGRect *)&v27);
    x = v56.origin.x;
    width = v56.size.width;
  }
  objc_msgSend(a4, "bounds");
  v37 = v33;
  if (v35 < 0.0 || v36 < 0.0)
    *(_QWORD *)&v37 = (unint64_t)CGRectStandardize(*(CGRect *)&v33);
  v38 = x + width;
  objc_msgSend(a4, "bounds");
  if (v41 < 0.0 || v42 < 0.0)
    *(CGRect *)&v39 = CGRectStandardize(*(CGRect *)&v39);
  v43 = v39 + v41;
  if (v26 >= v37)
    v26 = v37;
  v44 = v38 <= v43 ? v43 : v38;
  if (v7 < 1)
    return 0;
  v45 = 0;
  v46 = v18 + v19;
  v47 = v7;
  while (1)
  {
    v48 = (void *)-[NSMutableArray objectAtIndex:](compoundedShapesOnPage, "objectAtIndex:", v45);
    objc_msgSend(v48, "right");
    if (v49 >= v26)
    {
      objc_msgSend(v48, "left");
      if (v50 <= v44)
      {
        objc_msgSend(v48, "bottom");
        if (v51 <= v12)
        {
          objc_msgSend(v48, "top");
          if (v52 >= v46)
          {
            objc_msgSend(v48, "bottom");
            if (v53 >= v46)
            {
              objc_msgSend(v48, "top");
              if (v54 <= v12)
                break;
            }
          }
        }
      }
    }
    if (v47 == ++v45)
      return 0;
  }
  return 1;
}

- (BOOL)line:(id)a3 isDirectlyBelow:(id)a4
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double x;
  double v15;
  double v16;
  double width;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  CGFloat rect;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  objc_msgSend(a3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a4, "bounds");
  x = v13;
  rect = v15;
  width = v16;
  v19 = v18;
  v20 = v12 < 0.0 || v10 < 0.0;
  v21 = v6;
  v22 = v10;
  if (v20)
  {
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    *(CGRect *)&v21 = CGRectStandardize(v28);
  }
  v23 = v21 + v22;
  v24 = v19 < 0.0 || width < 0.0;
  v25 = x;
  if (v24)
  {
    v29.origin.x = x;
    v29.origin.y = rect;
    v29.size.width = width;
    v29.size.height = v19;
    *(_QWORD *)&v25 = (unint64_t)CGRectStandardize(v29);
  }
  if (v23 < v25)
    return 0;
  if (v20)
  {
    v30.origin.x = v6;
    v30.origin.y = v8;
    v30.size.width = v10;
    v30.size.height = v12;
    *(_QWORD *)&v6 = (unint64_t)CGRectStandardize(v30);
  }
  if (v24)
  {
    v31.origin.x = x;
    v31.origin.y = rect;
    v31.size.width = width;
    v31.size.height = v19;
    v32 = CGRectStandardize(v31);
    x = v32.origin.x;
    width = v32.size.width;
  }
  return v6 <= x + width;
}

- (BOOL)line:(id)a3 isBelow:(id)a4
{
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v27;
  double width;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double x;
  double v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  unint64_t v46;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v6 = objc_msgSend(a3, "leftSpacerIndex");
  if (v6 != objc_msgSend(a4, "leftSpacerIndex"))
    return 0;
  v7 = objc_msgSend(a3, "rightSpacerIndex");
  if (v7 != objc_msgSend(a4, "rightSpacerIndex"))
    return 0;
  objc_msgSend(a3, "bounds");
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  if (v10 < 0.0 || v11 < 0.0)
    *(CGRect *)&v8 = CGRectStandardize(*(CGRect *)&v8);
  v16 = v9 + v11;
  objc_msgSend(a4, "baseline", v8);
  if (v16 >= v17)
    return 0;
  objc_msgSend(a4, "bounds");
  v21 = v20;
  v23 = v22;
  v24 = v15 * 6.0;
  v25 = v22 * 6.0;
  if (v19 >= v25 && v14 >= v24)
    return 0;
  v27 = v19 < v25;
  if (v19 >= v25)
    width = v19;
  else
    width = v25;
  v29 = (v25 - v19) * 0.5;
  if (!v27)
    v29 = 0.0;
  v30 = v14 < v24;
  if (v14 >= v24)
    v31 = v14;
  else
    v31 = v15 * 6.0;
  v32 = (v24 - v14) * 0.5;
  if (!v30)
    v32 = 0.0;
  x = v18 - v29;
  v34 = v12 - v32;
  v35 = v15 < 0.0 || v31 < 0.0;
  v36 = v34;
  v37 = v31;
  if (v35)
  {
    v49.origin.x = v34;
    v49.origin.y = v13;
    v49.size.width = v31;
    v49.size.height = v15;
    v38 = v21;
    *(CGRect *)&v36 = CGRectStandardize(v49);
    v21 = v38;
  }
  v39 = v36 + v37;
  v40 = v23 < 0.0 || width < 0.0;
  v41 = x;
  if (v40)
  {
    v50.origin.x = x;
    v50.origin.y = v21;
    v50.size.width = width;
    v50.size.height = v23;
    v48 = v34;
    v42 = x;
    v43 = width;
    v44 = v21;
    *(_QWORD *)&v41 = (unint64_t)CGRectStandardize(v50);
    v21 = v44;
    width = v43;
    x = v42;
    v34 = v48;
  }
  if (v39 < v41)
    return 0;
  if (v35)
  {
    v51.origin.x = v34;
    v51.origin.y = v13;
    v51.size.width = v31;
    v51.size.height = v15;
    v45 = v21;
    v46 = (unint64_t)CGRectStandardize(v51);
    v21 = v45;
    v34 = *(double *)&v46;
  }
  if (v40)
  {
    v52.origin.x = x;
    v52.origin.y = v21;
    v52.size.width = width;
    v52.size.height = v23;
    v53 = CGRectStandardize(v52);
    x = v53.origin.x;
    width = v53.size.width;
  }
  return v34 <= x + width;
}

- (int)linesThatOverlapLineAt:(int)a3 between:(double)a4 and:(double)a5 from:(int)a6
{
  uint64_t i;
  int v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
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
  int v31;
  int v32;
  double v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v45;
  double v46;
  double v47;
  double v49;
  double v50;
  double v51;
  double v53;
  double v54;
  double v55;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGRect v63;
  CGRect v64;

  LODWORD(i) = a6;
  v11 = -[NSMutableArray count](self->avail, "count");
  v12 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", a3);
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "bounds");
  v25 = v22;
  if (v23 < 0.0 || v24 < 0.0)
  {
    *(CGRect *)&v21 = CGRectStandardize(*(CGRect *)&v21);
    v25 = v26;
  }
  objc_msgSend(v12, "bounds", v21);
  if (v29 < 0.0 || v30 < 0.0)
    *(CGRect *)&v27 = CGRectStandardize(*(CGRect *)&v27);
  v31 = v11 - i;
  if (v11 > (int)i)
  {
    v32 = 0;
    v33 = v28 + v30;
    for (i = (int)i; ; ++i)
    {
      if (a3 != i)
      {
        v34 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", i, v27);
        objc_msgSend(v34, "bounds");
        if (v37 < 0.0 || v38 < 0.0)
          *(CGRect *)(&v36 - 1) = CGRectStandardize(*(CGRect *)&v35);
        if (v36 + v38 <= v25)
          return v32;
        objc_msgSend(v34, "bounds", v36 + v38);
        v64.origin.x = v39;
        v64.origin.y = v40;
        v64.size.width = v41;
        v64.size.height = v42;
        v63.origin.x = v14;
        v63.origin.y = v16;
        v63.size.width = v18;
        v63.size.height = v20;
        if (!CGRectIntersectsRect(v63, v64))
        {
          objc_msgSend(v34, "bounds");
          if (v45 < 0.0 || v46 < 0.0)
            *(_QWORD *)&v43 = (unint64_t)CGRectStandardize(*(CGRect *)&v43);
          if (v43 > a4)
          {
            objc_msgSend(v34, "bounds");
            if (v49 < 0.0 || v50 < 0.0)
              *(_QWORD *)&v47 = (unint64_t)CGRectStandardize(*(CGRect *)&v47);
            if (v47 < a5)
              goto LABEL_31;
          }
          objc_msgSend(v34, "bounds");
          if (v53 < 0.0 || v54 < 0.0)
            *(CGRect *)&v51 = CGRectStandardize(*(CGRect *)&v51);
          v27 = v51 + v53;
          if (v27 > a4)
          {
            objc_msgSend(v34, "bounds");
            if (v57 < 0.0 || v58 < 0.0)
              *(CGRect *)&v55 = CGRectStandardize(*(CGRect *)&v55);
            v27 = v55 + v57;
            if (v27 < a5)
            {
LABEL_31:
              objc_msgSend(v34, "bounds");
              if (v60 < 0.0 || v61 < 0.0)
                *(CGRect *)&v27 = CGRectStandardize(*(CGRect *)&v27);
              if (v59 < v33)
                ++v32;
            }
          }
        }
      }
      if (!--v31)
        return v32;
    }
  }
  return 0;
}

- (int)indexOfUniqueLineBelow:(id)a3 from:(int)a4
{
  uint64_t v4;
  int v7;
  int v8;
  void *v9;
  BOOL v10;
  double v11;
  int v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;

  LODWORD(v4) = a4;
  v7 = -[NSMutableArray count](self->avail, "count");
  v8 = v7 - v4;
  if (v7 <= (int)v4)
  {
    v10 = 0;
    v9 = 0;
  }
  else
  {
    v4 = (int)v4;
    while (1)
    {
      v9 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v4);
      v10 = -[CPParagraphMaker line:isDirectlyBelow:](self, "line:isDirectlyBelow:", v9, a3);
      if (v10 || -[CPParagraphMaker line:isBelow:](self, "line:isBelow:", v9, a3))
        break;
      ++v4;
      if (!--v8)
        goto LABEL_9;
    }
  }
  if ((_DWORD)v4 == v7)
  {
LABEL_9:
    LODWORD(v4) = -1;
    return v4;
  }
  if ((_DWORD)v4 != v7 - 1)
  {
    objc_msgSend(v9, "baseline");
    v12 = v4 + 1;
    if ((int)v4 + 1 < v7)
    {
      v13 = v11;
      v14 = v12;
      do
      {
        v15 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v14);
        objc_msgSend(v15, "baseline");
        if (vabdd_f64(v13, v16) >= 0.1)
        {
          objc_msgSend(v15, "bounds");
          if (v19 < 0.0 || v20 < 0.0)
            *(CGRect *)(&v18 - 1) = CGRectStandardize(*(CGRect *)&v17);
          if (v18 + v20 < v13)
            return v4;
          if (v10)
            goto LABEL_25;
          if (!-[CPParagraphMaker line:isDirectlyBelow:](self, "line:isDirectlyBelow:", v15, a3, v18 + v20))
          {
            v10 = 0;
            goto LABEL_29;
          }
        }
        else
        {
          if (!-[CPParagraphMaker line:isDirectlyBelow:](self, "line:isDirectlyBelow:", v15, a3))
          {
            if (!v10)
            {
              v10 = 0;
              if (-[CPParagraphMaker line:isBelow:](self, "line:isBelow:", v15, a3))
                LODWORD(v4) = -1;
              goto LABEL_29;
            }
LABEL_25:
            v10 = 1;
            goto LABEL_29;
          }
          if (v10)
            goto LABEL_9;
        }
        objc_msgSend(v15, "baseline");
        v13 = v21;
        v10 = 1;
        LODWORD(v4) = v12;
LABEL_29:
        ++v14;
        ++v12;
      }
      while (v7 != v12);
    }
  }
  return v4;
}

- (BOOL)spacingOf:(id)a3 and:(id)a4 and:(id)a5 is:(double *)a6
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  objc_msgSend(a3, "baseline");
  v10 = v9;
  objc_msgSend(a4, "baseline");
  v12 = v10 - v11;
  objc_msgSend(a4, "baseline");
  v14 = v13;
  objc_msgSend(a5, "baseline");
  v16 = vabdd_f64(v12, v14 - v15);
  if (v16 < 2.0)
    *a6 = v12;
  return v16 < 2.0;
}

- (unint64_t)alignmentOf:(id)a3 and:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double x;
  double width;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v39;
  double v40;
  double v41;
  double v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v47;
  CGRect v48;
  CGRect v49;

  objc_msgSend(a3, "anchor");
  v47 = v6;
  objc_msgSend(a4, "anchor");
  v8 = v7;
  objc_msgSend(a3, "bounds");
  x = v9;
  width = v11;
  if (v11 < 0.0 || v12 < 0.0)
  {
    v48 = CGRectStandardize(*(CGRect *)&v9);
    x = v48.origin.x;
    width = v48.size.width;
  }
  objc_msgSend(a4, "bounds");
  v19 = v15;
  v20 = v17;
  if (v17 < 0.0 || v18 < 0.0)
  {
    v49 = CGRectStandardize(*(CGRect *)&v15);
    v19 = v49.origin.x;
    v20 = v49.size.width;
  }
  objc_msgSend(a3, "bounds");
  v25 = v21;
  if (v23 < 0.0 || v24 < 0.0)
    *(_QWORD *)&v25 = (unint64_t)CGRectStandardize(*(CGRect *)&v21);
  objc_msgSend(a3, "bounds");
  v30 = v28;
  if (v28 < 0.0 || v29 < 0.0)
  {
    *(CGRect *)&v26 = CGRectStandardize(*(CGRect *)&v26);
    v30 = v31;
  }
  objc_msgSend(a4, "bounds", v26, v27);
  v36 = v32;
  if (v34 < 0.0 || v35 < 0.0)
    *(_QWORD *)&v36 = (unint64_t)CGRectStandardize(*(CGRect *)&v32);
  objc_msgSend(a4, "bounds");
  if (v39 < 0.0 || v40 < 0.0)
    *(CGRect *)(&v39 - 2) = CGRectStandardize(*(CGRect *)&v37);
  v41 = vabdd_f64(x + width, v19 + v20);
  v42 = vabdd_f64(v47, v8);
  v43 = v42 < 1.0;
  v44 = v43 | 2;
  if (v41 >= 2.0)
    v44 = v42 < 1.0;
  v45 = v44 | 8;
  if (v42 >= 1.0)
    v45 = 2;
  if (v41 < 2.0)
    v43 = v45;
  if (vabdd_f64(v25 + v30 * 0.5, v36 + v39 * 0.5) >= 2.0)
    return v43;
  else
    return v43 | 4;
}

- (BOOL)styleOf:(id)a3 differsFromStyleOf:(id)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  if (objc_msgSend(a3, "styleIsUniform:styleFlags:", &v7, 63487)
    && objc_msgSend(a4, "styleIsUniform:styleFlags:", &v6, 63487))
  {
    return CPPDFStyleEqual(v7, v6, 63487) ^ 1;
  }
  else
  {
    return 1;
  }
}

- (unint64_t)alignmentOf:(id)a3 and:(id)a4 and:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  double v68;
  uint64_t v69;
  uint64_t v70;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;

  objc_msgSend(a3, "anchor");
  v72 = v8;
  objc_msgSend(a4, "anchor");
  v81 = v9;
  objc_msgSend(a5, "anchor");
  v80 = v10;
  objc_msgSend(a3, "bounds");
  if (v13 < 0.0 || v14 < 0.0)
    *(CGRect *)&v11 = CGRectStandardize(*(CGRect *)&v11);
  v78 = v13;
  v79 = v11;
  objc_msgSend(a4, "bounds");
  if (v17 < 0.0 || v18 < 0.0)
    *(CGRect *)&v15 = CGRectStandardize(*(CGRect *)&v15);
  v76 = v17;
  v77 = v15;
  objc_msgSend(a5, "bounds");
  if (v21 < 0.0 || v22 < 0.0)
    *(CGRect *)&v19 = CGRectStandardize(*(CGRect *)&v19);
  v74 = v21;
  v75 = v19;
  objc_msgSend(a4, "bounds");
  v27 = v25;
  if (v25 < 0.0 || v26 < 0.0)
  {
    *(CGRect *)&v23 = CGRectStandardize(*(CGRect *)&v23);
    v27 = v28;
  }
  objc_msgSend(a3, "bounds", v23, v24);
  if (v31 < 0.0 || v32 < 0.0)
    v29 = (unint64_t)CGRectStandardize(*(CGRect *)&v29);
  v73 = *(double *)&v29;
  objc_msgSend(a3, "bounds");
  v37 = v35;
  if (v35 < 0.0 || v36 < 0.0)
  {
    *(CGRect *)&v33 = CGRectStandardize(*(CGRect *)&v33);
    v37 = v38;
  }
  objc_msgSend(a4, "bounds", v33, v34);
  v43 = v39;
  if (v41 < 0.0 || v42 < 0.0)
    *(_QWORD *)&v43 = (unint64_t)CGRectStandardize(*(CGRect *)&v39);
  objc_msgSend(a4, "bounds");
  v48 = v46;
  if (v46 < 0.0 || v47 < 0.0)
  {
    *(CGRect *)&v44 = CGRectStandardize(*(CGRect *)&v44);
    v48 = v49;
  }
  objc_msgSend(a5, "bounds", v44, v45);
  v54 = v50;
  if (v52 < 0.0 || v53 < 0.0)
    *(_QWORD *)&v54 = (unint64_t)CGRectStandardize(*(CGRect *)&v50);
  v55 = v48 * 0.5;
  v56 = v77 + v76;
  objc_msgSend(a5, "bounds");
  if (v59 < 0.0 || v60 < 0.0)
    *(CGRect *)(&v59 - 2) = CGRectStandardize(*(CGRect *)&v57);
  v61 = v43 + v55;
  v62 = v54 + v59 * 0.5;
  v63 = vabdd_f64(v79 + v78, v56);
  v64 = v27 * 0.25;
  v65 = vabdd_f64(v81, v80) < 1.0 && vabdd_f64(v72, v81) < v64;
  v66 = vabdd_f64(v56, v75 + v74);
  if (v63 < v64 && v66 < 2.0)
    v65 |= 2uLL;
  v68 = vabdd_f64(v73 + v37 * 0.5, v61);
  v69 = v65 | 4;
  if (vabdd_f64(v61, v62) >= 2.0)
    v69 = v65;
  if (v68 >= 2.0)
    v69 = v65;
  if (a5)
    v65 = v69;
  if ((~(_BYTE)v65 & 3) != 0)
    v70 = v65;
  else
    v70 = v65 | 8;
  return v70 | objc_msgSend(a3, "hasDropCap");
}

- (BOOL)line:(id)a3 isAlignedWith:(id)a4
{
  unsigned __int8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double x;
  double width;
  BOOL v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  BOOL v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  char v34;
  char v35;
  double v37;
  CGRect v38;

  v6 = objc_msgSend(a4, "alignment");
  objc_msgSend(a3, "anchor");
  v8 = v7;
  objc_msgSend(a3, "center");
  v10 = v9;
  objc_msgSend(a3, "bounds");
  x = v11;
  width = v13;
  if (v13 < 0.0 || v14 < 0.0)
  {
    v38 = CGRectStandardize(*(CGRect *)&v11);
    x = v38.origin.x;
    width = v38.size.width;
    if ((v6 & 1) == 0)
      goto LABEL_4;
  }
  else if ((v6 & 1) == 0)
  {
LABEL_4:
    v17 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(a4, "hasDropCap"))
  {
    v18 = (void *)objc_msgSend(a4, "childAtIndex:", 0);
    v19 = (void *)objc_msgSend(a4, "childAtIndex:", 1);
    objc_msgSend(v18, "anchor");
    v21 = vabdd_f64(v8, v20);
    objc_msgSend(v19, "anchor");
    v17 = vabdd_f64(v8, v22) <= 1.0 || v21 <= 1.0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "anchor");
    v17 = vabdd_f64(v8, v23) <= 1.0;
  }
LABEL_11:
  v24 = x + width;
  if ((v6 & 2) != 0)
  {
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "right");
    v25 = vabdd_f64(v24, v28) <= 1.0;
    if ((v6 & 4) != 0)
    {
LABEL_13:
      objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "center");
      v27 = vabdd_f64(v10, v26) <= 1.0;
      if ((v6 & 8) == 0)
        goto LABEL_21;
      goto LABEL_17;
    }
  }
  else
  {
    v25 = 0;
    if ((v6 & 4) != 0)
      goto LABEL_13;
  }
  v27 = 0;
  if ((v6 & 8) == 0)
  {
LABEL_21:
    v34 = 0;
    goto LABEL_22;
  }
LABEL_17:
  v29 = (void *)objc_msgSend(a4, "childAtIndex:", 1);
  objc_msgSend(v29, "anchor");
  v31 = v30;
  objc_msgSend(v29, "right");
  if (v8 < v31 + -5.0 || v24 > v32 + 10.0)
    goto LABEL_21;
  if (vabdd_f64(v31, v8) > 1.0 || vabdd_f64(v32, v24) > 3.0)
  {
    objc_msgSend((id)objc_msgSend(a4, "childAtIndex:", 1), "right");
    v34 = 0;
    if (vabdd_f64(v24, v37) < 1.0)
      v25 = 1;
  }
  else
  {
    v34 = 1;
  }
LABEL_22:
  v35 = (v17 || v25) | v27 | v34;
  if ((v6 & !v17 & 1) != 0)
    return v27;
  else
    return v35;
}

- (BOOL)fitsBelow:(id)a3 alignment:(unint64_t)a4 spacing:(double)a5 from:(int)a6
{
  unsigned int v10;
  int v11;
  void *v12;
  double v13;
  double x;
  double v15;
  double v16;
  double width;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  _BOOL4 v28;
  double v29;
  _BOOL4 v30;
  double v31;
  uint64_t v32;
  unsigned int v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v45;
  double v46;
  double v47;
  BOOL v48;
  double v49;
  CGFloat rect;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v10 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", a3, (a6 + 1));
  if ((v10 & 0x80000000) != 0)
    return 0;
  v11 = v10;
  v49 = a5;
  v12 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v10);
  objc_msgSend(a3, "bounds");
  x = v13;
  rect = v15;
  width = v16;
  v19 = v18;
  objc_msgSend(v12, "bounds");
  v24 = v20;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  v28 = v23 < 0.0 || v22 < 0.0;
  if (v28)
    *(CGRect *)&v20 = CGRectStandardize(*(CGRect *)&v20);
  v29 = v20 + v22;
  v30 = v19 < 0.0 || width < 0.0;
  v31 = x;
  if (v30)
  {
    v51.origin.x = x;
    v51.origin.y = rect;
    v51.size.width = width;
    v51.size.height = v19;
    *(_QWORD *)&v31 = (unint64_t)CGRectStandardize(v51);
  }
  if (v29 < v31)
    return 0;
  if (v28)
  {
    v52.origin.x = v24;
    v52.origin.y = v25;
    v52.size.width = v26;
    v52.size.height = v27;
    *(_QWORD *)&v24 = (unint64_t)CGRectStandardize(v52);
  }
  if (v30)
  {
    v53.origin.x = x;
    v53.origin.y = rect;
    v53.size.width = width;
    v53.size.height = v19;
    v54 = CGRectStandardize(v53);
    x = v54.origin.x;
    width = v54.size.width;
  }
  if (v24 > x + width)
    return 0;
  if (v11 <= a6 + 2)
    v32 = (v11 + 1);
  else
    v32 = (a6 + 2);
  v33 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", v12, v32);
  if ((v33 & 0x80000000) != 0)
  {
    objc_msgSend(a3, "baseline");
    v46 = v45;
    objc_msgSend(v12, "baseline");
    return v46 - v47 < v49 * 0.9;
  }
  else
  {
    v34 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v33);
    objc_msgSend(a3, "baseline");
    v36 = v35;
    objc_msgSend(v12, "baseline");
    v38 = v36 - v37;
    objc_msgSend(v12, "baseline");
    v40 = v39;
    objc_msgSend(v34, "baseline");
    v42 = v41;
    objc_msgSend(a3, "bounds");
    if (v38 > v43 * 3.0 || vabdd_f64(v38, v49) < 2.0)
      return 0;
    v48 = vabdd_f64(v38, v40 - v42) < 2.0;
    return v38 + 2.0 < v49 && v48;
  }
}

- (id)newInitialParagraphIn:(id)a3
{
  CPParagraph *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  double x;
  double width;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v57;
  double v58;
  double v59;
  double v60;
  double v62;
  double v63;
  double v64;
  double v65;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v78;
  double v79;
  double v80;
  double v81;
  double v83;
  double v84;
  double v85;
  double v86;
  double v88;
  double v89;
  unint64_t v90;
  int v91;
  _BOOL4 v92;
  unsigned int v93;
  void *v94;
  unint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  int v107;
  int v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  uint64_t v115;
  double v116;
  double v117;
  double v118;
  double v119;
  BOOL v120;
  _BOOL4 v121;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  CGRect v128;

  v5 = objc_alloc_init(CPParagraph);
  v6 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", 0);
  v7 = v6;
  -[NSMutableArray removeObjectAtIndex:](self->avail, "removeObjectAtIndex:", 0);
  -[CPParagraph setAlignment:](v5, "setAlignment:", 1);
  -[CPChunk add:](v5, "add:", v6);

  if (objc_msgSend(a3, "hasRotatedCharacters") && -[NSMutableArray count](self->avail, "count"))
  {
    do
    {
      v8 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", 0);
      -[CPChunk bounds](self->page, "bounds");
      v10 = v9;
      -[CPChunk bounds](self->page, "bounds");
      v12 = v11;
      objc_msgSend(v8, "normalizedBounds");
      v17 = v13;
      if (v15 < 0.0 || v16 < 0.0)
        *(_QWORD *)&v17 = (unint64_t)CGRectStandardize(*(CGRect *)&v13);
      objc_msgSend(v6, "normalizedBounds");
      x = v18;
      width = v20;
      if (v20 < 0.0 || v21 < 0.0)
      {
        v128 = CGRectStandardize(*(CGRect *)&v18);
        x = v128.origin.x;
        width = v128.size.width;
      }
      objc_msgSend(v6, "baseline");
      v25 = v24;
      objc_msgSend(v8, "baseline");
      if (vabdd_f64(v25, v26) >= v12 * 0.01)
        break;
      v27 = v17 - (x + width);
      if (v27 <= 0.0 || v27 >= v10 * 0.02)
        break;
      -[CPChunk add:](v5, "add:", v8);
      -[NSMutableArray removeObjectAtIndex:](self->avail, "removeObjectAtIndex:", 0);
      v6 = v8;
    }
    while (-[NSMutableArray count](self->avail, "count"));
  }
  v29 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", v6, 0);
  if ((v29 & 0x80000000) == 0)
  {
    v30 = v29;
    objc_msgSend(v6, "bounds");
    v35 = v31;
    if (v33 < 0.0 || v34 < 0.0)
      *(_QWORD *)&v35 = (unint64_t)CGRectStandardize(*(CGRect *)&v31);
    objc_msgSend(v6, "bounds");
    if (v38 < 0.0 || v39 < 0.0)
      *(CGRect *)&v36 = CGRectStandardize(*(CGRect *)&v36);
    v40 = -[CPParagraphMaker linesThatOverlapLineAt:between:and:from:](self, "linesThatOverlapLineAt:between:and:from:", v30, 0, v35, v36 + v38);
    v41 = v40 > 0 ? 0xFFFFFFFFLL : v30;
    if (v40 <= 0)
    {
      v42 = v30;
      v43 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v30);
      objc_msgSend(v6, "baseline");
      v45 = v44;
      objc_msgSend(v43, "baseline");
      v127 = v45 - v46;
      objc_msgSend(v6, "bounds");
      if (v127 < v47 * 4.0)
      {
        v126 = 0;
        if (!objc_msgSend(v6, "styleIsUniform:styleFlags:", &v126, 63487)
          || !objc_msgSend((id)objc_msgSend(v43, "charSequence"), "length"))
        {
          goto LABEL_35;
        }
        v48 = (void *)objc_msgSend(v43, "charSequence");
        v49 = objc_msgSend(v48, "length");
        v50 = 0;
        if (v49)
        {
          do
          {
            v51 = objc_msgSend(v48, "charAtIndex:", v50);
            if ((CPPDFStyleEqual(v126, *(_QWORD *)(v51 + 160), 63487) & 1) != 0)
              break;
            v50 = (v50 + 1);
          }
          while (v49 != (_DWORD)v50);
        }
        if ((_DWORD)v50 != v49)
        {
LABEL_35:
          if (!-[CPParagraphMaker isGraphicBetween:and:](self, "isGraphicBetween:and:", v6, v43))
          {
            v52 = -[CPParagraphMaker alignmentOf:and:](self, "alignmentOf:and:", v6, v43);
            if (!-[CPParagraphMaker fitsBelow:alignment:spacing:from:](self, "fitsBelow:alignment:spacing:from:", v43, v52, v41, v127))
            {
              v53 = (v41 + 1);
              v54 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", v43, v53);
              if ((v54 & 0x80000000) != 0)
              {
                v75 = 0;
                goto LABEL_81;
              }
              objc_msgSend(v43, "bounds");
              v59 = v55;
              if (v57 < 0.0 || v58 < 0.0)
                *(_QWORD *)&v59 = (unint64_t)CGRectStandardize(*(CGRect *)&v55);
              objc_msgSend(v6, "bounds");
              v64 = v60;
              if (v62 < 0.0 || v63 < 0.0)
                *(_QWORD *)&v64 = (unint64_t)CGRectStandardize(*(CGRect *)&v60);
              objc_msgSend(v6, "bounds");
              if (v67 < 0.0 || v68 < 0.0)
                *(CGRect *)&v65 = CGRectStandardize(*(CGRect *)&v65);
              v69 = fmin(v59, v64);
              v70 = v65 + v67;
              objc_msgSend(v43, "bounds");
              if (v73 < 0.0 || v74 < 0.0)
                *(CGRect *)&v71 = CGRectStandardize(*(CGRect *)&v71);
              if (-[CPParagraphMaker linesThatOverlapLineAt:between:and:from:](self, "linesThatOverlapLineAt:between:and:from:", v54, v53, v69, fmax(v70, v71 + v73)) > 0)
              {
                v75 = 0;
                LODWORD(v54) = -1;
LABEL_81:
                v91 = 0;
                v92 = v52 != 0;
LABEL_82:
                -[CPParagraph setAlignment:](v5, "setAlignment:", v52);
                v106 = v127;
                if (v127 > 0.0)
                {
                  -[CPParagraph setAlignment:](v5, "setAlignment:", v52, v127);
                  -[CPChunk add:](v5, "add:", v43);
                  if ((v92 & v91) == 1)
                  {
                    -[CPChunk add:](v5, "add:", v75);
                    -[NSMutableArray removeObjectAtIndex:](self->avail, "removeObjectAtIndex:", (int)v54);
                  }
                  -[NSMutableArray removeObjectAtIndex:](self->avail, "removeObjectAtIndex:", v42);
                }
                v107 = -[CPObject count](v5, "count", v106);
                v108 = v107;
                if (v107 < 2 || (v52 & 4) != 0 && v107 == 2)
                  -[CPParagraph setAlignment:](v5, "setAlignment:", 1);
                if (objc_msgSend(v6, "hasDropCap"))
                  -[CPParagraph setHasDropCap:](v5, "setHasDropCap:", 1);
                if (v108 == 3)
                {
                  objc_msgSend(v6, "bounds");
                  v113 = v111;
                  if (v111 < 0.0 || v112 < 0.0)
                  {
                    *(CGRect *)&v109 = CGRectStandardize(*(CGRect *)&v109);
                    v113 = v114;
                  }
                  objc_msgSend(v43, "bounds", v109, v110);
                  if (v117 < 0.0 || v118 < 0.0)
                    *(CGRect *)(&v116 - 1) = CGRectStandardize(*(CGRect *)&v115);
                  v119 = v113 - v117;
                  v120 = -[CPParagraphMaker firstWordOf:fits:indent:](self, "firstWordOf:fits:indent:", v43, v6, v119, v116);
                  v121 = -[CPParagraphMaker firstWordOf:fits:indent:](self, "firstWordOf:fits:indent:", v75, v43, v119);
                  if (v120 || v121)
                    -[CPParagraph setAlignment:](v5, "setAlignment:", -[CPParagraph alignment](v5, "alignment") | 0x10);
                }
                return v5;
              }
              v75 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v54);
              if (-[CPParagraphMaker isGraphicBetween:and:](self, "isGraphicBetween:and:", v43, v75))
                goto LABEL_81;
              if (!-[CPParagraphMaker spacingOf:and:and:is:](self, "spacingOf:and:and:is:", v6, v43, v75, &v127))
              {
                if (!-[CPParagraphMaker styleOf:differsFromStyleOf:](self, "styleOf:differsFromStyleOf:", v6, v75))
                {
                  objc_msgSend(v6, "baseline");
                  v100 = v99;
                  objc_msgSend(v43, "baseline");
                  v102 = v100 - v101;
                  objc_msgSend(v43, "baseline");
                  v104 = v103;
                  objc_msgSend(v75, "baseline");
                  if (v102 > v104 - v105 + 1.0)
                    v127 = 0.0;
                }
                goto LABEL_81;
              }
              objc_msgSend(v6, "bounds");
              v80 = v76;
              if (v78 < 0.0 || v79 < 0.0)
                *(_QWORD *)&v80 = (unint64_t)CGRectStandardize(*(CGRect *)&v76);
              objc_msgSend(v43, "bounds");
              v85 = v81;
              if (v83 < 0.0 || v84 < 0.0)
                *(_QWORD *)&v85 = (unint64_t)CGRectStandardize(*(CGRect *)&v81);
              objc_msgSend(v75, "bounds");
              if (v88 < 0.0 || v89 < 0.0)
                *(_QWORD *)&v86 = (unint64_t)CGRectStandardize(*(CGRect *)&v86);
              if (vabdd_f64(v80, v85) >= 0.9 || (v86 = v80 - v86, v86 <= 1.9))
              {
                v90 = -[CPParagraphMaker alignmentOf:and:and:](self, "alignmentOf:and:and:", v6, v43, v75, v86);
                v91 = v90 != 0;
                if (v90)
                  v52 = v90;
                v92 = v52 != 0;
                if (v90 && v52)
                {
                  v93 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", v75, (v54 + 1));
                  if ((v93 & 0x80000000) != 0
                    || (v94 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v93),
                        v95 = -[CPParagraphMaker alignmentOf:and:](self, "alignmentOf:and:", v75, v94),
                        objc_msgSend(v75, "baseline"),
                        v97 = v96,
                        objc_msgSend(v94, "baseline"),
                        v95 != v52)
                    || v97 - v98 + 1.0 >= v127)
                  {
                    v92 = 1;
                    v91 = 1;
                  }
                  else
                  {
                    v124 = 0;
                    v125 = 0;
                    v123 = 0;
                    if (objc_msgSend(v43, "styleIsUniform:styleFlags:", &v125, 0xFFFFLL)
                      && objc_msgSend(v75, "styleIsUniform:styleFlags:", &v124, 0xFFFFLL))
                    {
                      if (objc_msgSend(v94, "styleIsUniform:styleFlags:", &v123, 0xFFFFLL)
                        && CPPDFStyleEqual(v125, v124, 0xFFFF))
                      {
                        v91 = CPPDFStyleEqual(v124, v123, 0xFFFF) ^ 1;
                      }
                      else
                      {
                        v91 = 1;
                      }
                    }
                    else
                    {
                      v91 = 0;
                    }
                    v92 = 1;
                  }
                }
                goto LABEL_82;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (int)paragraph:(id)a3 splits:(id)a4
{
  return 0;
}

- (void)addLinesTo:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  int v33;
  int v34;
  double v35;
  char v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  double v69;
  double v70;
  int v71;
  id v72;
  int v73;
  uint64_t v74;
  CPParagraph *v75;
  uint64_t v76;
  double v77;
  CPTextLine *v78;
  CGRect v79;

  v5 = objc_msgSend(a3, "alignment");
  v6 = (void *)objc_msgSend(a3, "childAtIndex:", 1);
  v7 = (void *)objc_msgSend(a3, "childAtIndex:", 2);
  objc_msgSend(v6, "bounds");
  v12 = v8;
  if (v10 < 0.0 || v11 < 0.0)
    *(_QWORD *)&v12 = (unint64_t)CGRectStandardize(*(CGRect *)&v8);
  objc_msgSend(a3, "bounds");
  v17 = v13;
  if (v15 < 0.0 || v16 < 0.0)
    *(_QWORD *)&v17 = (unint64_t)CGRectStandardize(*(CGRect *)&v13);
  objc_msgSend(v6, "baseline");
  v19 = v18;
  objc_msgSend(v7, "baseline");
  v21 = v19 - v20;
  self->spacingSet = 1;
  self->currentSpacing = v21;
  v22 = -[NSMutableArray count](self->avail, "count");
  objc_msgSend(v7, "baseline");
  v24 = v23;
  if (v22 < 1)
  {
    v25 = 0;
  }
  else
  {
    v25 = 0;
    while (1)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v25), "baseline");
      if (v26 < v24)
        break;
      if (v22 == ++v25)
        return;
    }
  }
  if ((_DWORD)v25 != v22)
  {
    v27 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", v7, v25);
    if ((v27 & 0x80000000) == 0)
    {
      v28 = v27;
      if (-[NSMutableArray count](self->avail, "count"))
      {
        v78 = 0;
        v29 = v12 - v17;
        while (1)
        {
          v30 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v28);
          if (-[CPParagraphMaker isGraphicBetween:and:](self, "isGraphicBetween:and:", v7, v30))
            goto LABEL_45;
          objc_msgSend(v30, "baseline");
          v32 = v24 - v31;
          if (vabdd_f64(v32, v21) > 2.0)
          {
            if (v32 < v21)
            {
              objc_msgSend(a3, "bounds");
              v77 = v42;
              v44 = v43;
              v46 = v45;
              v48 = v47;
              objc_msgSend(v30, "bounds");
              v50 = v49;
              v52 = v51;
              v54 = v53;
              v56 = v55;
              v57 = (void *)objc_msgSend(a3, "childAtIndex:", objc_msgSend(a3, "count") - 2);
              v58 = (void *)objc_msgSend(a3, "lastChild");
              objc_msgSend(v58, "rotationAngle");
              v60 = v59;
              objc_msgSend(v57, "rotationAngle");
              if (vabdd_f64(v60, v61) <= 0.00872664626)
              {
                if (v54 < 0.0 || v56 < 0.0)
                {
                  v79.origin.x = v50;
                  v79.origin.y = v52;
                  v79.size.width = v54;
                  v79.size.height = v56;
                  *(_QWORD *)&v50 = (unint64_t)CGRectStandardize(v79);
                }
                v62 = v77;
                if (v46 < 0.0 || v48 < 0.0)
                {
                  v63 = v44;
                  v64 = v46;
                  v65 = v48;
                  *(_QWORD *)&v62 = (unint64_t)CGRectStandardize(*(CGRect *)&v62);
                }
                v66 = vabdd_f64(v62, v50);
                objc_msgSend(a3, "bounds");
                if (v69 < 0.0 || v70 < 0.0)
                  *(CGRect *)(&v69 - 2) = CGRectStandardize(*(CGRect *)&v67);
                if (v66 < v69 * 0.25
                  || -[CPParagraphMaker styleOf:differsFromStyleOf:](self, "styleOf:differsFromStyleOf:", v58, v30))
                {
                  v71 = objc_msgSend(a3, "count");
                  v72 = a3;
                  -[NSMutableArray removeLastObject](self->paragraphs, "removeLastObject");
                  v73 = v71 - 1;
                  if (v71 != 1)
                  {
                    do
                    {
                      v74 = objc_msgSend(a3, "childAtIndex:", 0);
                      v75 = objc_alloc_init(CPParagraph);
                      -[CPChunk add:](v75, "add:", v74);
                      -[NSMutableArray addObject:](self->paragraphs, "addObject:", v75);

                      --v73;
                    }
                    while (v73);
                  }
                  v76 = objc_msgSend(a3, "childAtIndex:", 0);

                  -[NSMutableArray insertObject:atIndex:](self->avail, "insertObject:atIndex:", v76, 0);
                }
              }
            }
            goto LABEL_45;
          }
          if (-[CPParagraphMaker line:isAlignedWith:](self, "line:isAlignedWith:", v30, a3))
            goto LABEL_25;
          v33 = -[CPParagraphMaker paragraph:splits:](self, "paragraph:splits:", a3, v30);
          if (v33 > 0)
            break;
          if ((objc_msgSend(a3, "alignment") & 8) == 0)
            goto LABEL_45;
          if ((-[CPParagraphMaker alignmentOf:and:](self, "alignmentOf:and:", objc_msgSend(a3, "childAtIndex:", 1), v30) & 1) == 0)goto LABEL_45;
          objc_msgSend(a3, "add:", v30);
          -[NSMutableArray removeObjectAtIndex:](self->avail, "removeObjectAtIndex:", v28);
          v38 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", v7, v28);
          if ((v38 & 0x80000000) != 0)
            goto LABEL_45;
          v28 = v38;
          objc_msgSend(v30, "baseline");
          v40 = v39;
          v7 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v28);
          objc_msgSend(v7, "baseline");
          if (vabdd_f64(v40 - v41, v21) > 2.0
            || (-[CPParagraphMaker alignmentOf:and:](self, "alignmentOf:and:", objc_msgSend(a3, "childAtIndex:", 1), v7) & 1) == 0)
          {
            goto LABEL_45;
          }
          objc_msgSend(a3, "setAlignment:", 1);
LABEL_26:
          if (-[CPParagraphMaker fitsBelow:alignment:spacing:from:](self, "fitsBelow:alignment:spacing:from:", v7, v5, v28, v21))
          {
            goto LABEL_45;
          }
          objc_msgSend(a3, "add:", v7);
          -[NSMutableArray removeObjectAtIndex:](self->avail, "removeObjectAtIndex:", (int)v28);
          objc_msgSend(v7, "baseline");
          v24 = v35;
          if (v78)
          {
            -[NSMutableArray addObject:](self->avail, "addObject:");
            -[NSMutableArray sortUsingSelector:](self->avail, "sortUsingSelector:", sel_baseLineDescending_);
          }
          v28 = -[CPParagraphMaker indexOfUniqueLineBelow:from:](self, "indexOfUniqueLineBelow:from:", v7, v28);
          v36 = objc_msgSend(a3, "alignment");
          if ((v28 & 0x80000000) != 0 || (v36 & 0x10) != 0)
          {
            if ((v28 & 0x80000000) != 0)
              goto LABEL_45;
          }
          else if ((objc_msgSend(a3, "alignment") & 1) != 0)
          {
            v37 = (void *)-[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", v28);
            if (objc_msgSend(v37, "wordCount"))
            {
              if (-[CPParagraphMaker firstWordOf:fits:indent:](self, "firstWordOf:fits:indent:", v37, v7, v29))
                goto LABEL_45;
            }
          }
          if (!-[NSMutableArray count](self->avail, "count"))
            goto LABEL_45;
        }
        v34 = v33;
        if (v78)

        v78 = objc_alloc_init(CPTextLine);
        do
        {
          -[CPChunk add:](v78, "add:", objc_msgSend(v30, "childAtIndex:", 0));
          --v34;
        }
        while (v34);
LABEL_25:
        v7 = v30;
        goto LABEL_26;
      }
    }
    v78 = 0;
LABEL_45:

  }
}

- (void)addCompoundedShapesOn:(id)a3 to:(id)a4
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    do
    {
      v10 = objc_msgSend(a3, "childAtIndex:", v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CPParagraphMaker addCompoundedShapesOn:to:](self, "addCompoundedShapesOn:to:", v10, a4);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          objc_msgSend(a4, "addObject:", v10);
      }
      v9 = (v9 + 1);
    }
    while (v8 != (_DWORD)v9);
  }
}

- (void)addIntersectingParagraph:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  NSMutableArray *paragraphs;
  uint64_t v18;
  uint64_t v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v24;
  uint64_t i;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a3, "page"), "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a3, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  paragraphs = self->paragraphs;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](paragraphs, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v18)
  {
    v19 = v18;
    v38.origin.x = v10;
    v38.origin.y = v12;
    v38.size.width = v14;
    v38.size.height = v16;
    v39 = CGRectInset(v38, v6 * -0.02, v8 * -0.01);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    v24 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(paragraphs);
        v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v26, "bounds");
        v41.origin.x = v27;
        v41.origin.y = v28;
        v41.size.width = v29;
        v41.size.height = v30;
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        if (CGRectIntersectsRect(v40, v41))
        {
          objc_msgSend(v26, "addChildrenOf:", a3);
          objc_msgSend(v26, "sortUsingSelector:", sel_baseLineDescendingApprox_);
          v31 = v26;
          -[NSMutableArray removeObject:](self->paragraphs, "removeObject:", v26);
          -[CPParagraphMaker addIntersectingParagraph:](self, "addIntersectingParagraph:", v26);

          return;
        }
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](paragraphs, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v19)
        continue;
      break;
    }
  }
  -[NSMutableArray addObject:](self->paragraphs, "addObject:", a3);
}

- (void)makeParagraphsIn:(id)a3
{
  void *v5;
  int v6;
  int v7;
  char **v8;
  id v9;
  CPParagraph *v10;

  v5 = (void *)objc_msgSend(a3, "textLinesInZone");
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    self->parent = (CPZone *)a3;
    self->page = (CPPage *)objc_msgSend(a3, "page");
    self->avail = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v5);

    self->paragraphs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v6 == 1)
    {
      v10 = objc_alloc_init(CPParagraph);
      -[CPParagraph setAlignment:](v10, "setAlignment:", 1);
      -[CPChunk add:](v10, "add:", -[NSMutableArray objectAtIndex:](self->avail, "objectAtIndex:", 0));
      -[NSMutableArray addObject:](self->paragraphs, "addObject:", v10);

    }
    else
    {
      self->compoundedShapesOnPage = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      -[CPParagraphMaker addCompoundedShapesOn:to:](self, "addCompoundedShapesOn:to:", objc_msgSend(a3, "page"), self->compoundedShapesOnPage);
      v7 = objc_msgSend(a3, "hasRotatedCharacters");
      v8 = &selRef_baseLineDescendingApprox_;
      if (!v7)
        v8 = &selRef_baseLineDescending_;
      -[NSMutableArray sortUsingSelector:](self->avail, "sortUsingSelector:", *v8);
      while (-[NSMutableArray count](self->avail, "count"))
      {
        self->spacingSet = 0;
        v9 = -[CPParagraphMaker newInitialParagraphIn:](self, "newInitialParagraphIn:", a3);
        if (objc_msgSend(a3, "hasRotatedCharacters"))
          -[CPParagraphMaker addIntersectingParagraph:](self, "addIntersectingParagraph:", v9);
        else
          -[NSMutableArray addObject:](self->paragraphs, "addObject:", v9);
        if (objc_msgSend(v9, "count") == 3)
          -[CPParagraphMaker addLinesTo:](self, "addLinesTo:", v9);

      }
      self->avail = 0;
    }
  }
}

+ (BOOL)line:(id)a3 alignsWith:(id)a4
{
  return 0;
}

@end
