@implementation CPParagraphFlow

- (CPParagraphFlow)initWithParagraph:(id)a3
{
  CPParagraphFlow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat y;
  CGFloat v11;
  CGFloat v12;
  double v13;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)CPParagraphFlow;
  v4 = -[CPParagraphFlow init](&v15, sel_init);
  if (v4)
  {
    v4->paragraph = (CPParagraph *)a3;
    objc_msgSend(a3, "setFlowProperties:", v4);
    -[CPRotatedRegion normalizedBounds](v4->paragraph, "normalizedBounds");
    v9 = v5;
    y = v6;
    v11 = v7;
    v12 = v8;
    if (v7 < 0.0 || v8 < 0.0)
    {
      v16 = CGRectStandardize(*(CGRect *)&v5);
      v4->fLeft = v16.origin.x;
      v4->fRight = v16.origin.x + v16.size.width;
      v16.origin.x = v9;
      v16.origin.y = y;
      v16.size.width = v11;
      v16.size.height = v12;
      v17 = CGRectStandardize(v16);
      y = v17.origin.y;
      v13 = v17.origin.y + v17.size.height;
    }
    else
    {
      v4->fLeft = v5;
      v4->fRight = v5 + v7;
      v13 = v6 + v8;
    }
    v4->fTop = v13;
    v4->fBottom = y;
    v4->adjacentToCallout = 0;
    v4->calloutType = 0;
    v4->nextInColumn = 0;
    *(_OWORD *)&v4->paragraphsAbove = 0u;
    *(_OWORD *)&v4->paragraphsLeft = 0u;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CPParagraph setFlowProperties:](self->paragraph, "setFlowProperties:", 0);

  v3.receiver = self;
  v3.super_class = (Class)CPParagraphFlow;
  -[CPParagraphFlow dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%d,%d),(%d,%d),[%d],%@"), -[CPParagraphFlow inOrder](self, "inOrder"), -[CPParagraphFlow outOrder](self, "outOrder"), -[CPParagraphFlow leftOrder](self, "leftOrder"), -[CPParagraphFlow rightOrder](self, "rightOrder"), self->calloutType, -[CPParagraph description](self->paragraph, "description"));
}

- (int64_t)topDescending:(id)a3
{
  double v4;
  double v5;
  double v6;
  int64_t v7;

  -[CPRotatedRegion top](-[CPParagraphFlow paragraph](self, "paragraph"), "top");
  v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "paragraph"), "top");
  if (v5 <= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 < v6)
    return 1;
  else
    return v7;
}

- (BOOL)intervalOverlapLeft:(double)a3 right:(double)a4 rects:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  double x;
  double width;
  CGFloat height;
  CGFloat v14;
  unint64_t v15;
  double v16;
  CGRect rect;
  CGRect v20;

  rect = CGRectNull;
  v8 = objc_msgSend(a5, "count");
  if (v8)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v9), "getValue:", &rect);
      x = rect.origin.x;
      height = rect.size.height;
      width = rect.size.width;
      if (rect.size.width < 0.0 || rect.size.height < 0.0)
      {
        v15 = (unint64_t)CGRectStandardize(rect);
        v20.origin.y = rect.origin.y;
        v20.origin.x = x;
        v20.size.width = width;
        v20.size.height = height;
        *(CGRect *)&v14 = CGRectStandardize(v20);
        width = v16;
        x = *(double *)&v15;
      }
      else
      {
        v14 = rect.origin.x;
      }
      if (v14 + width > a3 && x < a4)
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
      if (x + width > a3 && v19 < a4)
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

- (BOOL)intervalOverlapTop:(double)a3 bottom:(double)a4 paragraphs:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double y;
  CGFloat v17;
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
      v15 = v11;
      y = v12;
      v17 = v13;
      v18 = v14;
      if (v13 < 0.0 || v14 < 0.0)
      {
        v22 = CGRectStandardize(*(CGRect *)&v11);
        v19 = v22.origin.y + v22.size.height;
        v22.origin.x = v15;
        v22.origin.y = y;
        v22.size.width = v17;
        v22.size.height = v18;
        v23 = CGRectStandardize(v22);
        y = v23.origin.y;
      }
      else
      {
        v19 = v12 + v14;
      }
      if (v19 > a4 && y < a3)
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

- (void)setParagraphsAboveIn:(id)a3
{
  unsigned int v5;
  int v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  NSMutableArray *paragraphsAbove;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = objc_msgSend(a3, "indexOfObject:", self->paragraph);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v8 = -[CPObject firstChild](self->paragraph, "firstChild");
    v9 = objc_msgSend(v8, "leftSpacerIndex");
    v10 = objc_msgSend(v8, "rightSpacerIndex");
    if (v6 + 1 < v5)
    {
      v11 = v10;
      for (i = v6 + 1; i < v5; ++i)
      {
        v13 = (void *)objc_msgSend(a3, "objectAtIndex:", i, v27, v28);
        v27 = 0u;
        v28 = 0u;
        v14 = boundsForOverlap(v13, v9, v11);
        v18 = v14;
        v19 = v15;
        v20 = v16;
        v21 = v17;
        *(double *)&v27 = v14;
        *((double *)&v27 + 1) = v15;
        *(double *)&v28 = v16;
        *((double *)&v28 + 1) = v17;
        if (v16 < 0.0 || v17 < 0.0)
        {
          v22 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v14));
          if (v22 > self->fRight)
            continue;
          v29.origin.x = v18;
          v29.origin.y = v19;
          v29.size.width = v20;
          v29.size.height = v21;
          *(CGRect *)&v14 = CGRectStandardize(v29);
          v20 = v23;
          v18 = v22;
        }
        else if (v14 > self->fRight)
        {
          continue;
        }
        if (v14 + v20 >= self->fLeft)
        {
          if (self->paragraphsAbove)
          {
            if (!-[CPParagraphFlow intervalOverlapLeft:right:rects:](self, "intervalOverlapLeft:right:rects:", v7, v18, v27, v28))
            {
              paragraphsAbove = self->paragraphsAbove;
              goto LABEL_15;
            }
          }
          else
          {
            v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
            paragraphsAbove = (NSMutableArray *)objc_msgSend(v25, "initWithCapacity:", 1, v27, v28);
            self->paragraphsAbove = paragraphsAbove;
LABEL_15:
            -[NSMutableArray addObject:](paragraphsAbove, "addObject:", v13);
          }
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", &v27, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          objc_msgSend(v7, "addObject:", v26);

        }
      }
    }

  }
}

- (id)paragraphsAbove
{
  return self->paragraphsAbove;
}

- (id)paragraphsBelow
{
  return self->paragraphsBelow;
}

- (id)paragraphsLeft
{
  return self->paragraphsLeft;
}

- (id)paragraphsRight
{
  return self->paragraphsRight;
}

- (void)setParagraphsBelowIn:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  int v12;
  int v13;
  uint64_t v14;
  CPParagraph *v15;
  CPParagraph *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  NSMutableArray *paragraphsBelow;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  CGRect v35;
  CGRect v36;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    -[CPRotatedRegion top](self->paragraph, "top");
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v9 = -[CPObject lastChild](self->paragraph, "lastChild");
    objc_msgSend(v9, "baseline");
    v11 = v10;
    v12 = objc_msgSend(v9, "leftSpacerIndex");
    v13 = objc_msgSend(v9, "rightSpacerIndex");
    v14 = 0;
    while (1)
    {
      v15 = (CPParagraph *)objc_msgSend(a3, "objectAtIndex:", v14, v33, v34);
      if (v15 != self->paragraph)
      {
        v16 = v15;
        v33 = 0u;
        v34 = 0u;
        v17 = boundsForOverlap(v15, v12, v13);
        v21 = v17;
        v22 = v18;
        v23 = v19;
        v24 = v20;
        *(double *)&v33 = v17;
        *((double *)&v33 + 1) = v18;
        *(double *)&v34 = v19;
        *((double *)&v34 + 1) = v20;
        if (v19 < 0.0 || v20 < 0.0)
        {
          v26 = COERCE_DOUBLE(CGRectStandardize(*(CGRect *)&v17));
          if (v26 <= self->fRight)
          {
            v35.origin.x = v21;
            v35.origin.y = v22;
            v35.size.width = v23;
            v35.size.height = v24;
            v36 = CGRectStandardize(v35);
            v25 = v36.origin.y + v36.size.height;
            v36.origin.x = v21;
            v36.origin.y = v22;
            v36.size.width = v23;
            v36.size.height = v24;
            *(CGRect *)&v17 = CGRectStandardize(v36);
            v23 = v27;
            v21 = v26;
LABEL_10:
            if (v17 + v23 < self->fLeft || v25 >= v7 || v25 - v11 > 2.0)
              goto LABEL_24;
            if (self->paragraphsBelow)
            {
              if (!-[CPParagraphFlow intervalOverlapLeft:right:rects:](self, "intervalOverlapLeft:right:rects:", v8, v21, v33, v34))
              {
                paragraphsBelow = self->paragraphsBelow;
                goto LABEL_22;
              }
            }
            else
            {
              v31 = objc_alloc(MEMORY[0x1E0C99DE8]);
              paragraphsBelow = (NSMutableArray *)objc_msgSend(v31, "initWithCapacity:", 1, v33, v34);
              self->paragraphsBelow = paragraphsBelow;
LABEL_22:
              -[NSMutableArray addObject:](paragraphsBelow, "addObject:", v16);
            }
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", &v33, "{CGRect={CGPoint=dd}{CGSize=dd}}");
            objc_msgSend(v8, "addObject:", v32);

          }
        }
        else if (v17 <= self->fRight)
        {
          v25 = v18 + v20;
          goto LABEL_10;
        }
      }
LABEL_24:
      if (v5 == ++v14)
      {

        return;
      }
    }
  }
}

- (void)setParagraphsLeftIn:(id)a3
{
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double y;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;
  NSMutableArray *paragraphsLeft;
  id v23;
  CGRect v24;

  if (objc_msgSend(a3, "count"))
  {
    v5 = objc_msgSend(a3, "indexOfObject:", self->paragraph);
    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    if (v5 >= 1)
    {
      v6 = v5 + 1;
      while (1)
      {
        v7 = (void *)objc_msgSend(a3, "objectAtIndex:", (v6 - 2));
        objc_msgSend(v7, "normalizedBounds");
        y = v9;
        if (v10 < 0.0 || v11 < 0.0)
        {
          v24 = CGRectStandardize(*(CGRect *)&v8);
          y = v24.origin.y;
        }
        if (y > self->fTop)
          goto LABEL_22;
        objc_msgSend(v7, "normalizedBounds");
        if (v15 < 0.0 || v16 < 0.0)
          *(CGRect *)(&v14 - 1) = CGRectStandardize(*(CGRect *)&v13);
        v17 = v14 + v16;
        if (v14 + v16 < self->fBottom)
          goto LABEL_22;
        objc_msgSend(v7, "normalizedBounds");
        if (v20 < 0.0 || v21 < 0.0)
          *(CGRect *)&v18 = CGRectStandardize(*(CGRect *)&v18);
        if (v18 + v20 > self->fLeft)
          goto LABEL_22;
        if (!self->paragraphsLeft)
          break;
        if (!-[CPParagraphFlow intervalOverlapTop:bottom:paragraphs:](self, "intervalOverlapTop:bottom:paragraphs:", v23, v17, y))
        {
          paragraphsLeft = self->paragraphsLeft;
LABEL_20:
          -[NSMutableArray addObject:](paragraphsLeft, "addObject:", v7);
        }
        objc_msgSend(v23, "addObject:", v7);
LABEL_22:
        if ((unint64_t)--v6 <= 1)
          goto LABEL_23;
      }
      paragraphsLeft = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      self->paragraphsLeft = paragraphsLeft;
      goto LABEL_20;
    }
LABEL_23:

  }
}

- (void)setParagraphsRightIn:(id)a3
{
  unsigned int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double y;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  NSMutableArray *paragraphsRight;
  id v24;
  CGRect v25;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = objc_msgSend(a3, "indexOfObject:", self->paragraph);
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    if (v6 + 1 < v5)
    {
      v7 = v6 + 1;
      while (1)
      {
        v8 = (void *)objc_msgSend(a3, "objectAtIndex:", v7);
        objc_msgSend(v8, "normalizedBounds");
        y = v10;
        if (v11 < 0.0 || v12 < 0.0)
        {
          v25 = CGRectStandardize(*(CGRect *)&v9);
          y = v25.origin.y;
        }
        if (y > self->fTop)
          goto LABEL_22;
        objc_msgSend(v8, "normalizedBounds");
        if (v16 < 0.0 || v17 < 0.0)
          *(CGRect *)(&v15 - 1) = CGRectStandardize(*(CGRect *)&v14);
        v18 = v15 + v17;
        if (v15 + v17 < self->fBottom)
          goto LABEL_22;
        objc_msgSend(v8, "normalizedBounds");
        if (v21 < 0.0 || v22 < 0.0)
          *(CGRect *)&v19 = CGRectStandardize(*(CGRect *)&v19);
        if (v19 < self->fRight)
          goto LABEL_22;
        if (!self->paragraphsRight)
          break;
        if (!-[CPParagraphFlow intervalOverlapTop:bottom:paragraphs:](self, "intervalOverlapTop:bottom:paragraphs:", v24, v18, y, v21, v22))
        {
          paragraphsRight = self->paragraphsRight;
LABEL_20:
          -[NSMutableArray addObject:](paragraphsRight, "addObject:", v8);
        }
        objc_msgSend(v24, "addObject:", v8);
LABEL_22:
        if (++v7 >= v5)
          goto LABEL_23;
      }
      paragraphsRight = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      self->paragraphsRight = paragraphsRight;
      goto LABEL_20;
    }
LABEL_23:

  }
}

- (id)simpleRule:(unsigned int)a3
{
  void *v3;

  if (a3 != 1)
    return 0;
  v3 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0);
  if (objc_msgSend((id)objc_msgSend(v3, "flowProperties"), "inOrder:", 1) == 1)
    return v3;
  else
    return 0;
}

- (id)ignoreCallouts:(unsigned int)a3
{
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  CPParagraph *v24;
  CPParagraph *v25;
  double v26;
  double v27;
  double v28;
  double v29;

  if (a3)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = (void *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", v5);
      v9 = (void *)objc_msgSend(v8, "flowProperties");
      if (objc_msgSend(v9, "calloutType"))
      {
        v10 = objc_msgSend(v9, "outOrder");
        if (v10 < 2)
          ++v6;
        if (v10 > 1)
          return 0;
      }
      else
      {
        v7 = v8;
      }
      if (a3 == ++v5)
        goto LABEL_12;
    }
  }
  v7 = 0;
  v6 = 0;
LABEL_12:
  if (v6 != a3 - 1)
    return 0;
  v11 = (void *)objc_msgSend(v7, "flowProperties");
  if (objc_msgSend(v11, "inOrder:", 1) != 1)
  {
    -[CPRotatedRegion normalizedBounds](self->paragraph, "normalizedBounds");
    v16 = v13;
    v17 = v15;
    if (v14 < 0.0 || v15 < 0.0)
    {
      *(CGRect *)&v12 = CGRectStandardize(*(CGRect *)&v12);
      v16 = v18;
      v17 = v19;
    }
    v20 = (void *)objc_msgSend(v11, "paragraphsAbove", v12);
    v21 = objc_msgSend(v20, "count");
    if (v21)
    {
      v22 = 0;
      v23 = v16 + v17;
      while (1)
      {
        v24 = (CPParagraph *)objc_msgSend(v20, "objectAtIndex:", v22);
        if (v24 != self->paragraph)
        {
          v25 = v24;
          -[CPRotatedRegion normalizedBounds](v24, "normalizedBounds");
          if (v28 < 0.0 || v29 < 0.0)
            *(CGRect *)&v26 = CGRectStandardize(*(CGRect *)&v26);
          if (v27 < v23
            || objc_msgSend(-[CPParagraph flowProperties](v25, "flowProperties", v26), "outOrder") == 1)
          {
            break;
          }
        }
        if (v21 == ++v22)
          return v7;
      }
    }
    return 0;
  }
  return v7;
}

- (id)twoSides:(unsigned int)a3
{
  CPParagraph *v4;
  CPParagraph *v5;
  double v6;
  double v7;
  double v8;
  CPParagraph *v9;
  id result;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 != 2)
    return 0;
  v4 = (CPParagraph *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0);
  v5 = (CPParagraph *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 1);
  -[CPRotatedRegion bottom](v4, "bottom");
  v7 = v6;
  -[CPRotatedRegion top](v5, "top");
  if (v7 <= v8)
  {
    -[CPRotatedRegion bottom](v5, "bottom");
    v12 = v11;
    -[CPRotatedRegion top](v4, "top");
    v9 = v5;
    if (v12 <= v13)
      return 0;
  }
  else
  {
    v9 = v4;
    v4 = v5;
  }
  v14 = -[CPParagraph flowProperties](v9, "flowProperties");
  v15 = -[CPParagraph flowProperties](v4, "flowProperties");
  if (objc_msgSend(v14, "inOrder") != 1
    || objc_msgSend(v15, "inOrder") != 1
    || objc_msgSend(v14, "outOrder") != 1
    || objc_msgSend(v15, "outOrder") != 1)
  {
    return 0;
  }
  v16 = objc_msgSend((id)objc_msgSend(v14, "paragraphsBelow"), "objectAtIndex:", 0);
  v17 = objc_msgSend((id)objc_msgSend(v15, "paragraphsBelow"), "objectAtIndex:", 0);
  result = 0;
  if (v16 == v17)
  {
    self->nextInColumn = v9;
    objc_msgSend(v14, "setNextInColumn:", v4);
    objc_msgSend(v15, "setNextInColumn:", objc_msgSend((id)objc_msgSend(v15, "paragraphsBelow"), "objectAtIndex:", 0));
    return v9;
  }
  return result;
}

- (id)belowTwoSides:(unsigned int)a3
{
  return 0;
}

- (id)nextParagraphInColumn:(id)a3
{
  NSMutableArray *paragraphsBelow;
  CPParagraph *nextInColumn;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  _BOOL4 v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  unint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  uint64_t v40;
  double width;
  uint64_t v45;
  CPParagraph *v46;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  paragraphsBelow = self->paragraphsBelow;
  if (!paragraphsBelow)
    return 0;
  nextInColumn = self->nextInColumn;
  if (nextInColumn)
    return nextInColumn;
  v7 = -[NSMutableArray count](paragraphsBelow, "count");
  nextInColumn = -[CPParagraphFlow simpleRule:](self, "simpleRule:", v7);
  if (nextInColumn)
    return nextInColumn;
  nextInColumn = -[CPParagraphFlow ignoreCallouts:](self, "ignoreCallouts:", v7);
  if (nextInColumn)
    return nextInColumn;
  nextInColumn = -[CPParagraphFlow twoSides:](self, "twoSides:", v7);
  if (nextInColumn)
    return nextInColumn;
  if (!(_DWORD)v7)
    return 0;
  v8 = 0;
  v9 = v7;
  while (objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", v8), "flowProperties"), "inOrder") == 1)
  {
    nextInColumn = 0;
    if (v7 == ++v8)
      return nextInColumn;
  }
  -[NSMutableArray sortUsingSelector:](self->paragraphsBelow, "sortUsingSelector:", sel_compareTopDescending_);
  if (v7 < 2)
    goto LABEL_25;
  nextInColumn = (CPParagraph *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0);
  if (objc_msgSend(-[CPParagraph flowProperties](nextInColumn, "flowProperties"), "inOrder") != 1)
    goto LABEL_25;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 1), "normalizedBounds");
  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v13 < 0.0 || v12 < 0.0;
  if (v18)
    *(CGRect *)&v10 = CGRectStandardize(*(CGRect *)&v10);
  v19 = v11 + v13;
  -[CPRotatedRegion normalizedBounds](nextInColumn, "normalizedBounds", v10);
  if (v22 < 0.0 || v23 < 0.0)
    *(CGRect *)(&v21 - 1) = CGRectStandardize(*(CGRect *)&v20);
  if (v19 >= v21)
    goto LABEL_25;
  v24 = v14;
  if (v18)
  {
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v28 = (unint64_t)CGRectStandardize(*(CGRect *)&v24);
    v48.origin.x = v14;
    v48.origin.y = v15;
    v48.size.width = v16;
    v48.size.height = v17;
    *(CGRect *)&v24 = CGRectStandardize(v48);
    v16 = v29;
    v14 = *(double *)&v28;
  }
  if (fmin(self->fRight, v24 + v16) - fmax(self->fLeft, v14) >= (self->fRight - self->fLeft) * 0.2)
  {
LABEL_25:
    v30 = 0;
    if (v7 <= 1)
      v31 = 1;
    else
      v31 = v7;
    while ((int)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", v30), "flowProperties"), "inOrder") < 2)
    {
      if (v31 == ++v30)
      {
        objc_msgSend(a3, "normalizedBounds");
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        nextInColumn = (CPParagraph *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0);
        -[CPRotatedRegion normalizedBounds](nextInColumn, "normalizedBounds");
        if (v7 >= 2)
        {
          v52.origin.x = v33;
          v52.origin.y = v35;
          v52.size.width = v37;
          v52.size.height = v39;
          v49 = CGRectUnion(*(CGRect *)&v40, v52);
          width = v49.size.width;
          v45 = 1;
          do
          {
            v46 = (CPParagraph *)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", v45, v49.origin.x, v49.origin.y);
            -[CPRotatedRegion normalizedBounds](v46, "normalizedBounds");
            v53.origin.x = v33;
            v53.origin.y = v35;
            v53.size.width = v37;
            v53.size.height = v39;
            v49 = CGRectUnion(v50, v53);
            if (v51.size.width < width)
            {
              width = v51.size.width;
              nextInColumn = v46;
            }
            ++v45;
          }
          while (v9 != v45);
        }
        return nextInColumn;
      }
    }
    return 0;
  }
  return nextInColumn;
}

- (void)removeFromBelow:(id)a3
{
  -[NSMutableArray removeObject:](self->paragraphsBelow, "removeObject:", a3);
}

- (void)removeFromAbove:(id)a3
{
  -[NSMutableArray removeObject:](self->paragraphsAbove, "removeObject:", a3);
}

- (void)replaceBelow:(id)a3 withOneOf:(id)a4
{
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double x;
  double width;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  unint64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[NSMutableArray removeObject:](self->paragraphsBelow, "removeObject:", a3);
  -[CPRotatedRegion normalizedBounds](self->paragraph, "normalizedBounds");
  v7 = v6;
  v37 = v8;
  v38 = v9;
  v11 = v10;
  v12 = objc_msgSend(a4, "count");
  if (v12)
  {
    v13 = 0;
    v14 = v38;
    v15 = v38 < 0.0 || v11 < 0.0;
    do
    {
      v16 = (void *)objc_msgSend(a4, "objectAtIndex:", v13, v14);
      objc_msgSend(v16, "normalizedBounds");
      v21 = v17;
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = v20 < 0.0 || v19 < 0.0;
      v26 = v17;
      if (v25)
        *(_QWORD *)&v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
      v27 = v7;
      v28 = v11;
      if (v15)
      {
        v39.origin.x = v7;
        v39.origin.y = v37;
        v39.size.height = v38;
        v39.size.width = v11;
        *(CGRect *)&v27 = CGRectStandardize(v39);
      }
      v14 = v27 + v28;
      if (v26 < v14)
      {
        x = v21;
        width = v23;
        if (v25)
        {
          v40.origin.x = v21;
          v40.origin.y = v22;
          v40.size.width = v23;
          v40.size.height = v24;
          v41 = CGRectStandardize(v40);
          x = v41.origin.x;
          width = v41.size.width;
        }
        v14 = v7;
        if (v15)
        {
          v42.origin.x = v7;
          v42.origin.y = v37;
          v42.size.height = v38;
          v42.size.width = v11;
          *(_QWORD *)&v14 = (unint64_t)CGRectStandardize(v42);
        }
        if (x + width > v14)
        {
          v31 = v21;
          if (v25)
          {
            v32 = v22;
            v33 = v23;
            v34 = v24;
            v35 = (unint64_t)CGRectStandardize(*(CGRect *)&v31);
            v43.origin.x = v21;
            v43.origin.y = v22;
            v43.size.width = v23;
            v43.size.height = v24;
            *(CGRect *)&v31 = CGRectStandardize(v43);
            v23 = v36;
            v21 = *(double *)&v35;
          }
          if (!-[CPParagraphFlow intervalOverlapLeft:right:paragraphs:](self, "intervalOverlapLeft:right:paragraphs:", self->paragraphsBelow, v21, v31 + v23))-[NSMutableArray addObject:](self->paragraphsBelow, "addObject:", v16);
        }
      }
      ++v13;
    }
    while (v12 != v13);
  }
}

- (void)replaceAbove:(id)a3 withOneOf:(id)a4
{
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  _BOOL4 v25;
  double v26;
  double v27;
  double v28;
  double x;
  double width;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  unint64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[NSMutableArray removeObject:](self->paragraphsAbove, "removeObject:", a3);
  -[CPRotatedRegion normalizedBounds](self->paragraph, "normalizedBounds");
  v7 = v6;
  v37 = v8;
  v38 = v9;
  v11 = v10;
  v12 = objc_msgSend(a4, "count");
  if (v12)
  {
    v13 = 0;
    v14 = v38;
    v15 = v38 < 0.0 || v11 < 0.0;
    do
    {
      v16 = (void *)objc_msgSend(a4, "objectAtIndex:", v13, v14);
      objc_msgSend(v16, "normalizedBounds");
      v21 = v17;
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = v20 < 0.0 || v19 < 0.0;
      v26 = v17;
      if (v25)
        *(_QWORD *)&v26 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
      v27 = v7;
      v28 = v11;
      if (v15)
      {
        v39.origin.x = v7;
        v39.origin.y = v37;
        v39.size.height = v38;
        v39.size.width = v11;
        *(CGRect *)&v27 = CGRectStandardize(v39);
      }
      v14 = v27 + v28;
      if (v26 < v14)
      {
        x = v21;
        width = v23;
        if (v25)
        {
          v40.origin.x = v21;
          v40.origin.y = v22;
          v40.size.width = v23;
          v40.size.height = v24;
          v41 = CGRectStandardize(v40);
          x = v41.origin.x;
          width = v41.size.width;
        }
        v14 = v7;
        if (v15)
        {
          v42.origin.x = v7;
          v42.origin.y = v37;
          v42.size.height = v38;
          v42.size.width = v11;
          *(_QWORD *)&v14 = (unint64_t)CGRectStandardize(v42);
        }
        if (x + width > v14)
        {
          v31 = v21;
          if (v25)
          {
            v32 = v22;
            v33 = v23;
            v34 = v24;
            v35 = (unint64_t)CGRectStandardize(*(CGRect *)&v31);
            v43.origin.x = v21;
            v43.origin.y = v22;
            v43.size.width = v23;
            v43.size.height = v24;
            *(CGRect *)&v31 = CGRectStandardize(v43);
            v23 = v36;
            v21 = *(double *)&v35;
          }
          if (!-[CPParagraphFlow intervalOverlapLeft:right:paragraphs:](self, "intervalOverlapLeft:right:paragraphs:", self->paragraphsAbove, v21, v31 + v23))-[NSMutableArray addObject:](self->paragraphsAbove, "addObject:", v16);
        }
      }
      ++v13;
    }
    while (v12 != v13);
  }
}

- (CGRect)belowBounds
{
  unsigned int v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  uint64_t v12;
  uint64_t i;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  v3 = -[NSMutableArray count](self->paragraphsBelow, "count");
  if (v3)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0), "normalizedBounds");
    x = v4;
    y = v6;
    width = v8;
    height = v10;
    if (v3 != 1)
    {
      v12 = v3;
      for (i = 1; i != v12; ++i)
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", i), "normalizedBounds");
        v25.origin.x = v14;
        v25.origin.y = v15;
        v25.size.width = v16;
        v25.size.height = v17;
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        v23 = CGRectUnion(v22, v25);
        x = v23.origin.x;
        y = v23.origin.y;
        width = v23.size.width;
        height = v23.size.height;
      }
    }
  }
  else
  {
    height = 0.0;
    y = INFINITY;
    width = 0.0;
    x = INFINITY;
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)dBelow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  if (!-[CPParagraphFlow outOrder](self, "outOrder"))
    return 0.0;
  -[CPRotatedRegion normalizedBounds](self->paragraph, "normalizedBounds");
  v7 = v4;
  if (v5 < 0.0 || v6 < 0.0)
  {
    *(CGRect *)&v3 = CGRectStandardize(*(CGRect *)&v3);
    v7 = v8;
  }
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsBelow, "objectAtIndex:", 0, v3), "normalizedBounds");
  if (v11 < 0.0 || v12 < 0.0)
    *(CGRect *)(&v10 - 1) = CGRectStandardize(*(CGRect *)&v9);
  return v7 - (v10 + v12);
}

- (double)dAbove
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  if (!-[CPParagraphFlow inOrder](self, "inOrder"))
    return 0.0;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsAbove, "objectAtIndex:", 0), "normalizedBounds");
  v7 = v4;
  if (v5 < 0.0 || v6 < 0.0)
  {
    *(CGRect *)&v3 = CGRectStandardize(*(CGRect *)&v3);
    v7 = v8;
  }
  -[CPRotatedRegion normalizedBounds](self->paragraph, "normalizedBounds", v3);
  if (v11 < 0.0 || v12 < 0.0)
    *(CGRect *)(&v10 - 1) = CGRectStandardize(*(CGRect *)&v9);
  return v7 - (v10 + v12);
}

- (double)area
{
  CGFloat v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double width;
  CGFloat v9;
  double height;
  CGRect v12;
  CGRect v13;

  -[CPRotatedRegion normalizedBounds](self->paragraph, "normalizedBounds");
  v6 = v2;
  v7 = v3;
  width = v4;
  v9 = v5;
  if (v4 < 0.0 || v5 < 0.0)
  {
    v12 = CGRectStandardize(*(CGRect *)&v2);
    height = v12.size.height;
    v12.origin.x = v6;
    v12.origin.y = v7;
    v12.size.width = width;
    v12.size.height = v9;
    v13 = CGRectStandardize(v12);
    width = v13.size.width;
  }
  else
  {
    height = v5;
  }
  return height * width;
}

- (int)inOrder
{
  NSMutableArray *paragraphsAbove;

  paragraphsAbove = self->paragraphsAbove;
  if (paragraphsAbove)
    LODWORD(paragraphsAbove) = -[NSMutableArray count](paragraphsAbove, "count");
  return (int)paragraphsAbove;
}

- (int)inOrder:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  if (!a3)
    return -[CPParagraphFlow inOrder](self, "inOrder");
  v4 = -[NSMutableArray count](self->paragraphsAbove, "count");
  if (!v4)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    if (!objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->paragraphsAbove, "objectAtIndex:", v5), "flowProperties"), "calloutType"))++v6;
    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (int)outOrder
{
  NSMutableArray *paragraphsBelow;

  paragraphsBelow = self->paragraphsBelow;
  if (paragraphsBelow)
    LODWORD(paragraphsBelow) = -[NSMutableArray count](paragraphsBelow, "count");
  return (int)paragraphsBelow;
}

- (int)leftOrder
{
  NSMutableArray *paragraphsLeft;

  paragraphsLeft = self->paragraphsLeft;
  if (paragraphsLeft)
    LODWORD(paragraphsLeft) = -[NSMutableArray count](paragraphsLeft, "count");
  return (int)paragraphsLeft;
}

- (int)rightOrder
{
  NSMutableArray *paragraphsRight;

  paragraphsRight = self->paragraphsRight;
  if (paragraphsRight)
    LODWORD(paragraphsRight) = -[NSMutableArray count](paragraphsRight, "count");
  return (int)paragraphsRight;
}

- (CPParagraph)paragraph
{
  return self->paragraph;
}

- (void)setParagraph:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (double)fLeft
{
  return self->fLeft;
}

- (void)setFLeft:(double)a3
{
  self->fLeft = a3;
}

- (double)fRight
{
  return self->fRight;
}

- (void)setFRight:(double)a3
{
  self->fRight = a3;
}

- (double)fBottom
{
  return self->fBottom;
}

- (void)setFBottom:(double)a3
{
  self->fBottom = a3;
}

- (BOOL)placed
{
  return self->placed;
}

- (void)setPlaced:(BOOL)a3
{
  self->placed = a3;
}

- (int)calloutType
{
  return self->calloutType;
}

- (void)setCalloutType:(int)a3
{
  self->calloutType = a3;
}

- (CPParagraph)nextInColumn
{
  return self->nextInColumn;
}

- (void)setNextInColumn:(id)a3
{
  self->nextInColumn = (CPParagraph *)a3;
}

@end
