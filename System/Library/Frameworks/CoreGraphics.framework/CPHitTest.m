@implementation CPHitTest

- (CPHitTest)initWithPage:(id)a3
{
  CPHitTest *v4;
  CPHitTest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPHitTest;
  v4 = -[CPHitTest init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->page = (CPPage *)a3;
    -[CPHitTest findClickableObjects:](v4, "findClickableObjects:", 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray removeAllObjects](self->objectsOnPage, "removeAllObjects");

  v3.receiver = self;
  v3.super_class = (Class)CPHitTest;
  -[CPHitTest dealloc](&v3, sel_dealloc);
}

- (id)page
{
  return self->page;
}

- (id)paragraph:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  double v6;
  __double2 v7;
  double v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v5 = -[CPHitTest objectAtPoint:](self, "objectAtPoint:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(v5, "rotationAngle");
  if (v6 != 0.0)
  {
    v7 = __sincos_stret(v6 * -0.0174532925);
    v8 = y * v7.__cosval + v7.__sinval * x;
    x = v7.__cosval * x - v7.__sinval * y + 0.0;
    y = v8 + 0.0;
  }
  v9 = objc_msgSend(v5, "count");
  if (!v9)
    return 0;
  v10 = v9;
  v11 = 0;
  while (1)
  {
    v12 = (void *)objc_msgSend(v5, "childAtIndex:", v11);
    objc_msgSend(v12, "bounds");
    v14.x = x;
    v14.y = y;
    if (CGRectContainsPoint(v15, v14))
      break;
    v11 = (v11 + 1);
    if (v10 == (_DWORD)v11)
      return 0;
  }
  return v12;
}

- (id)paragraphNear:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v8;
  void *v9;
  double v10;
  __double2 v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;

  y = a3.y;
  x = a3.x;
  v6 = -[CPHitTest paragraph:](self, "paragraph:");
  if (v6)
    return v6;
  v8 = -[CPHitTest column:](self, "column:", x, y);
  if (!v8)
    return 0;
  v9 = v8;
  objc_msgSend(v8, "rotationAngle");
  if (v10 != 0.0)
  {
    v11 = __sincos_stret(v10 * -0.0174532925);
    y = y * v11.__cosval + v11.__sinval * x + 0.0;
  }
  v12 = objc_msgSend(v9, "count");
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    while (1)
    {
      v6 = (id)objc_msgSend(v9, "childAtIndex:", v14);
      objc_msgSend(v6, "bounds");
      if (v17 < 0.0 || v18 < 0.0)
        *(CGRect *)(&v16 - 1) = CGRectStandardize(*(CGRect *)&v15);
      if (v16 < y)
        break;
      v14 = (v14 + 1);
      if (v13 == (_DWORD)v14)
        return (id)objc_msgSend(v9, "lastChild");
    }
    return v6;
  }
  return (id)objc_msgSend(v9, "lastChild");
}

- (id)layoutArea:(CGPoint)a3
{
  id v3;

  v3 = -[CPHitTest objectAtPoint:](self, "objectAtPoint:", a3.x, a3.y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v3, "parent");
  else
    return 0;
}

- (unsigned)columnsAt:(CGPoint)a3
{
  unsigned int v4;

  v4 = 0;
  -[CPHitTest findObjectIn:at:count:](self, "findObjectIn:at:count:", self->objectsOnPage, &v4, a3.x, a3.y);
  return v4;
}

- (id)column:(CGPoint)a3
{
  id v3;

  v3 = -[CPHitTest objectAtPoint:](self, "objectAtPoint:", a3.x, a3.y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (id)textLine:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  void *v6;
  double v7;
  __double2 v8;
  double v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v5 = -[CPHitTest paragraph:](self, "paragraph:");
  if (!v5)
    return 0;
  v6 = v5;
  objc_msgSend(v5, "rotationAngle");
  if (v7 != 0.0)
  {
    v8 = __sincos_stret(v7 * -0.0174532925);
    v9 = y * v8.__cosval + v8.__sinval * x;
    x = v8.__cosval * x - v8.__sinval * y + 0.0;
    y = v9 + 0.0;
  }
  v10 = objc_msgSend(v6, "count");
  if (!v10)
    return 0;
  v11 = v10;
  v12 = 0;
  while (1)
  {
    v13 = (void *)objc_msgSend(v6, "childAtIndex:", v12);
    objc_msgSend(v13, "bounds");
    v15.x = x;
    v15.y = y;
    if (CGRectContainsPoint(v16, v15))
      break;
    v12 = (v12 + 1);
    if (v11 == (_DWORD)v12)
      return 0;
  }
  return v13;
}

- (id)objectAtPoint:(CGPoint)a3
{
  int v4;

  v4 = 0;
  return -[CPHitTest findObjectIn:at:count:](self, "findObjectIn:at:count:", self->objectsOnPage, &v4, a3.x, a3.y);
}

- (int64_t)compareByReadingOrder:(CGPoint)a3 to:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  double v9;
  double v10;
  double v12[2];

  y = a4.y;
  x = a4.x;
  v7 = -[CPHitTest textLine:](self, "textLine:", a3.x, a3.y);
  v8 = -[CPHitTest textLine:](self, "textLine:", x, y);
  -[CPPage pageCropBox](self->page, "pageCropBox");
  v12[0] = v9;
  v12[1] = v10;
  return readingOrder(v7, v8, v12);
}

- (void)findClickableObjects:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *objectsOnPage;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v3 = a3;
  objectsOnPage = self->objectsOnPage;
  if (objectsOnPage)

  self->objectsOnPage = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[CPPage bodyZone](self->page, "bodyZone");
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    while (1)
    {
      v10 = (void *)objc_msgSend(v6, "childAtIndex:", v9);
      if (!objc_msgSend(v10, "count"))
        goto LABEL_14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v10, "children");
        v15 = self->objectsOnPage;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v3)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[NSMutableArray addObject:](self->objectsOnPage, "addObject:", objc_msgSend(v10, "childAtIndex:", 0));
        }
        goto LABEL_14;
      }
      v16 = (void *)objc_msgSend(v10, "firstChild");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v3)
          -[NSMutableArray addObject:](self->objectsOnPage, "addObject:", v16);
        if (objc_msgSend(v16, "count"))
        {
          v11 = objc_msgSend(v16, "firstChild");
LABEL_9:
          v12 = (void *)v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = self->objectsOnPage;
            v14 = objc_msgSend(v12, "children");
            v15 = v13;
LABEL_13:
            -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v14);
          }
        }
      }
LABEL_14:
      v9 = (v9 + 1);
      if (v8 == (_DWORD)v9)
        goto LABEL_25;
    }
    if (!objc_msgSend(v10, "count"))
      goto LABEL_14;
    v11 = objc_msgSend(v10, "childAtIndex:", 0);
    goto LABEL_9;
  }
LABEL_25:
  -[CPPage pageCropBox](self->page, "pageCropBox");
  v21[0] = v17;
  v21[1] = v18;
  -[NSMutableArray sortUsingFunction:context:](self->objectsOnPage, "sortUsingFunction:context:", readingOrder, v21, v19, v20);
}

- (BOOL)hitTestGraphicObject:(id)a3 point:(CGPoint)a4
{
  double y;
  double x;
  int v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  CGPoint v14;
  CGRect v15;

  y = a4.y;
  x = a4.x;
  v8 = objc_msgSend(a3, "count");
  if (v8 < 1)
  {
    return 0;
  }
  else
  {
    v9 = v8;
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = (void *)objc_msgSend(a3, "childAtIndex:", v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[CPHitTest hitTestGraphicObject:point:](self, "hitTestGraphicObject:point:", v12, x, y))
          return v11;
      }
      else
      {
        objc_msgSend(v12, "renderedBounds");
        v14.x = x;
        v14.y = y;
        if (CGRectContainsPoint(v15, v14))
          return v11;
      }
      v10 = (v10 + 1);
      v11 = (int)v10 < v9;
    }
    while (v9 != (_DWORD)v10);
  }
  return v11;
}

- (BOOL)hitTestParagraph:(id)a3 point:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  __double2 v8;
  double v9;
  int v10;
  int v11;
  uint64_t v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "rotationAngle");
  if (v7 != 0.0)
  {
    v8 = __sincos_stret(v7 * -0.0174532925);
    v9 = y * v8.__cosval + v8.__sinval * x;
    x = v8.__cosval * x - v8.__sinval * y + 0.0;
    y = v9 + 0.0;
  }
  v10 = objc_msgSend(a3, "count");
  if (v10 < 1)
  {
    return 0;
  }
  else
  {
    v11 = v10;
    v12 = 0;
    v13 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(a3, "childAtIndex:", v12), "bounds");
      v15.x = x;
      v15.y = y;
      if (CGRectContainsPoint(v16, v15))
        break;
      v12 = (v12 + 1);
      v13 = (int)v12 < v11;
    }
    while (v11 != (_DWORD)v12);
  }
  return v13;
}

- (id)findBestMatch:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  y = a4.y;
  x = a4.x;
  v8 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
  v9 = objc_msgSend(a3, "count");
  if (v9 < 1)
    return v8;
  v10 = 0;
  v11 = v9;
  while (1)
  {
    v12 = (void *)objc_msgSend(a3, "objectAtIndex:", v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || -[CPHitTest hitTestGraphicObject:point:](self, "hitTestGraphicObject:point:", v12, x, y))
      {
        break;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[CPHitTest hitTestParagraph:point:](self, "hitTestParagraph:point:", v12, x, y))
    {
      break;
    }
    if (v11 == ++v10)
      return v8;
  }
  return v12;
}

- (id)findObjectIn:(id)a3 at:(CGPoint)a4 count:(int *)a5
{
  double y;
  double x;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  __double2 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  BOOL v34;
  id v35;
  uint64_t v36;
  CGRect v38;

  y = a4.y;
  x = a4.x;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  *a5 = 0;
  v11 = objc_msgSend(a3, "count");
  if (v11 >= 1)
  {
    v12 = 0;
    v13 = 0;
    v14 = v11;
    while (1)
    {
      v15 = (void *)objc_msgSend(a3, "objectAtIndex:", v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v15, "rotationAngle");
      v17 = v16;
      objc_msgSend(v15, "renderedBounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      if (v17 == 0.0)
        goto LABEL_7;
      v26 = __sincos_stret(v17 * -0.0174532925);
      v27 = v26.__cosval * x - v26.__sinval * y + 0.0;
      v28 = y * v26.__cosval + v26.__sinval * x + 0.0;
LABEL_8:
      v38.origin.x = v19;
      v38.origin.y = v21;
      v38.size.width = v23;
      v38.size.height = v25;
      if (CGRectContainsPoint(v38, *(CGPoint *)&v27))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v15, "hasFill") & 1) == 0)
        {
          if (!v13)
            v13 = v15;
        }
        else
        {
          objc_msgSend(v10, "addObject:", v15);
        }
      }
      if (v14 == ++v12)
        goto LABEL_17;
    }
    objc_msgSend(v15, "renderedBounds");
    v19 = v29;
    v21 = v30;
    v23 = v31;
    v25 = v32;
LABEL_7:
    v27 = x;
    v28 = y;
    goto LABEL_8;
  }
  v13 = 0;
LABEL_17:
  v33 = objc_msgSend(v10, "count");
  *a5 = v33;
  if (v13)
    v34 = 0;
  else
    v34 = v33 == 0;
  if (v34)
    v35 = 0;
  else
    v35 = v13;
  if (v33)
  {
    if (v33 == 1)
    {
      v35 = (id)objc_msgSend(v10, "objectAtIndex:", 0);
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = objc_msgSend(v35, "zOrder");
          if (v36 < objc_msgSend(v13, "zOrder"))
            v35 = v13;
        }
      }
    }
    else
    {
      v35 = -[CPHitTest findBestMatch:atPoint:](self, "findBestMatch:atPoint:", v10, x, y);
    }
  }

  return v35;
}

@end
