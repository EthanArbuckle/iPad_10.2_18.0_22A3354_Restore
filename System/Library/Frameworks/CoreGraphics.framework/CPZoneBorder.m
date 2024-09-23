@implementation CPZoneBorder

- (CPZoneBorder)init
{
  CPZoneBorder *v2;
  CPZoneBorder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPZoneBorder;
  v2 = -[CPZoneBorder init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->bounds = CGRectNull;
    v2->graphicObjects = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v3->isHorizontal = 1;
  }
  return v3;
}

- (CPZoneBorder)initWithGraphicObject:(id)a3
{
  CPZoneBorder *v4;

  v4 = -[CPZoneBorder init](self, "init");
  if (v4)
  {
    v4->page = (CPPage *)objc_msgSend(a3, "page");
    -[CPZoneBorder addGraphicObject:](v4, "addGraphicObject:", a3);
    *(_WORD *)&v4->hasForwardVector = 257;
  }
  return v4;
}

- (id)initSuper
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorder;
  return -[CPZoneBorder init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorder;
  -[CPZoneBorder dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;

  v5 = (_QWORD *)CPCopyObject(self, a3);
  v6 = v5;
  if (v5)
  {
    v5[6] = 0;
    v5[5] = self->page;
    v5[7] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithArray:", self->graphicObjects);
    v6[8] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithArray:", self->neighbors);
    v6[9] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithArray:", self->intersections);
  }
  return v6;
}

- (id)copyWithoutIntersections
{
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)CPCopyObject(self, 0);
  v4 = v3;
  if (v3)
  {
    v3[6] = 0;
    v3[5] = self->page;
    v3[7] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->graphicObjects);
    v4[8] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->neighbors);
    v4[9] = 0;
  }
  return v4;
}

- (id)page
{
  return self->page;
}

- (void)addToArray:(id)a3
{
  objc_msgSend(a3, "addObject:", self);
  self->ownerArray = (NSMutableArray *)a3;
}

- (void)addToArray:(id)a3 atIndex:(unsigned int)a4
{
  objc_msgSend(a3, "insertObject:atIndex:", self, a4);
  self->ownerArray = (NSMutableArray *)a3;
}

- (void)removeFromArray
{
  NSMutableArray *ownerArray;

  ownerArray = self->ownerArray;
  self->ownerArray = 0;
  -[NSMutableArray removeObject:](ownerArray, "removeObject:");
}

- (void)removeFromArrayAtIndex:(unsigned int)a3
{
  NSMutableArray *ownerArray;
  uint64_t v4;

  ownerArray = self->ownerArray;
  v4 = a3;
  *(_QWORD *)(-[NSMutableArray objectAtIndex:](ownerArray, "objectAtIndex:", a3) + 48) = 0;
  -[NSMutableArray removeObjectAtIndex:](ownerArray, "removeObjectAtIndex:", v4);
}

- (id)ownerArray
{
  return self->ownerArray;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->bounds.origin.x;
  y = self->bounds.origin.y;
  width = self->bounds.size.width;
  height = self->bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->bounds = a3;
}

- (int64_t)zOrder
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;

  v3 = -[CPZoneBorder graphicObjectCount](self, "graphicObjectCount");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = objc_msgSend(-[CPZoneBorder graphicObjectAtIndex:](self, "graphicObjectAtIndex:", v5), "zOrder");
    if (v7 > v6)
      v6 = v7;
    v5 = (v5 + 1);
  }
  while (v4 != (_DWORD)v5);
  return v6;
}

- (unsigned)graphicObjectCount
{
  NSMutableArray *graphicObjects;

  graphicObjects = self->graphicObjects;
  if (graphicObjects)
    LODWORD(graphicObjects) = -[NSMutableArray count](graphicObjects, "count");
  return graphicObjects;
}

- (void)addGraphicObject:(id)a3
{
  double y;
  double v6;
  double v8;
  double v9;

  y = self->bounds.origin.y;
  v6 = INFINITY;
  if (self->bounds.origin.x == INFINITY || y == INFINITY)
  {
    objc_msgSend(a3, "renderedBounds", INFINITY, y);
    self->bounds.origin.x = v6;
    self->bounds.origin.y = y;
    self->bounds.size.width = v8;
    self->bounds.size.height = v9;
    self->isHorizontal = v8 >= v9;
  }
  if ((-[NSMutableArray containsObject:](self->graphicObjects, "containsObject:", a3, v6, y) & 1) == 0)
    -[NSMutableArray addObject:](self->graphicObjects, "addObject:", a3);
}

- (void)removeGraphicObjectAtIndex:(unsigned int)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->graphicObjects, "removeObjectAtIndex:", a3);
}

- (id)graphicObjectAtIndex:(unsigned int)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->graphicObjects, "objectAtIndex:", a3);
}

- (id)graphicObjects
{
  return self->graphicObjects;
}

- (unsigned)neighborCount
{
  NSMutableArray *neighbors;

  neighbors = self->neighbors;
  if (neighbors)
    LODWORD(neighbors) = -[NSMutableArray count](neighbors, "count");
  return neighbors;
}

- (void)addNeighbor:(id)a3
{
  NSMutableArray *neighbors;

  if (!self->neighbors)
  {
    neighbors = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    self->neighbors = neighbors;
LABEL_6:
    -[NSMutableArray addObject:](neighbors, "addObject:", a3);
    return;
  }
  if (!-[CPZoneBorder hasNeighborShape:atSide:](self, "hasNeighborShape:atSide:", objc_msgSend(a3, "neighborShape"), objc_msgSend(a3, "shapeSide")))
  {
    neighbors = self->neighbors;
    goto LABEL_6;
  }
}

- (void)removeNeighborAtIndex:(unsigned int)a3
{
  NSMutableArray *neighbors;

  neighbors = self->neighbors;
  if (neighbors)
    -[NSMutableArray removeObjectAtIndex:](neighbors, "removeObjectAtIndex:", a3);
}

- (id)neighborAtIndex:(unsigned int)a3
{
  id result;

  result = self->neighbors;
  if (result)
    return (id)objc_msgSend(result, "objectAtIndex:", a3);
  return result;
}

- (BOOL)hasNeighborShape:(id)a3
{
  NSMutableArray *neighbors;
  unint64_t v6;

  neighbors = self->neighbors;
  if (neighbors)
  {
    neighbors = (NSMutableArray *)-[NSMutableArray count](neighbors, "count");
    if (neighbors)
    {
      v6 = 0;
      while (1)
      {
        LOBYTE(neighbors) = objc_msgSend(-[CPZoneBorder neighborAtIndex:](self, "neighborAtIndex:", v6), "neighborShape") == (_QWORD)a3;
        if ((_BYTE)neighbors)
          break;
        v6 = (v6 + 1);
        if (-[NSMutableArray count](self->neighbors, "count") <= v6)
        {
          LOBYTE(neighbors) = 0;
          return (char)neighbors;
        }
      }
    }
  }
  return (char)neighbors;
}

- (BOOL)hasNeighborShape:(id)a3 atSide:(int)a4
{
  NSMutableArray *neighbors;
  unsigned int v8;
  id v9;

  neighbors = self->neighbors;
  if (neighbors)
  {
    neighbors = (NSMutableArray *)-[NSMutableArray count](neighbors, "count");
    if (neighbors)
    {
      v8 = 1;
      while (1)
      {
        v9 = -[CPZoneBorder neighborAtIndex:](self, "neighborAtIndex:", v8 - 1);
        if ((id)objc_msgSend(v9, "neighborShape") == a3 && objc_msgSend(v9, "shapeSide") == a4)
          break;
        if (-[NSMutableArray count](self->neighbors, "count") <= (unint64_t)v8++)
        {
          LOBYTE(neighbors) = 0;
          return (char)neighbors;
        }
      }
      LOBYTE(neighbors) = 1;
    }
  }
  return (char)neighbors;
}

- (void)setHasForwardVector:(BOOL)a3
{
  self->hasForwardVector = a3;
}

- (BOOL)hasForwardVector
{
  return self->hasForwardVector;
}

- (void)setHasBackwardVector:(BOOL)a3
{
  self->hasBackwardVector = a3;
}

- (BOOL)hasBackwardVector
{
  return self->hasBackwardVector;
}

- (void)setSide:(int)a3 ofPage:(id)a4
{
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;

  self->page = (CPPage *)a4;
  objc_msgSend(a4, "pageCropBox");
  v10 = v8;
  v11 = v9;
  switch(a3)
  {
    case 1:
      self->bounds.origin.x = v6;
      goto LABEL_8;
    case 2:
      v12 = 0;
      goto LABEL_13;
    case 3:
      if (v8 < 0.0 || v9 < 0.0)
      {
        *(CGRect *)&v6 = CGRectStandardize(*(CGRect *)&v6);
        v11 = v13;
      }
      self->bounds.origin.x = v6;
      v7 = v7 + v11;
LABEL_8:
      v12 = 1;
      v11 = 0.0;
      goto LABEL_14;
    case 4:
      if (v8 < 0.0 || v9 < 0.0)
      {
        *(CGRect *)(&v7 - 1) = CGRectStandardize(*(CGRect *)&v6);
        v12 = 0;
        v6 = v14 + v15;
      }
      else
      {
        v12 = 0;
        v6 = v6 + v8;
      }
LABEL_13:
      self->bounds.origin.x = v6;
      v10 = 0.0;
LABEL_14:
      self->bounds.origin.y = v7;
      self->bounds.size.width = v10;
      self->bounds.size.height = v11;
      self->isHorizontal = v12;
      break;
    default:
      break;
  }
  *(_WORD *)&self->hasForwardVector = 257;
}

- (BOOL)isHorizontal
{
  return self->isHorizontal;
}

- (BOOL)isVertical
{
  return !self->isHorizontal;
}

- (unsigned)intersectionCount
{
  NSMutableArray *intersections;

  intersections = self->intersections;
  if (intersections)
    LODWORD(intersections) = -[NSMutableArray count](intersections, "count");
  return intersections;
}

- (BOOL)intersectsWith:(id)a3 atRect:(CGRect *)a4
{
  BOOL result;
  CGFloat width;
  CGFloat y;
  CGFloat height;
  CGFloat v11;

  result = -[CPZoneBorder continues:](self, "continues:");
  if (self->isHorizontal)
  {
    if (!*((_BYTE *)a3 + 80))
    {
      width = *((double *)a3 + 3);
      y = self->bounds.origin.y;
      a4->origin.x = *((CGFloat *)a3 + 1);
      a4->origin.y = y;
      height = self->bounds.size.height;
LABEL_6:
      a4->size.width = width;
      a4->size.height = height;
      return result;
    }
  }
  else if (*((_BYTE *)a3 + 80))
  {
    width = self->bounds.size.width;
    v11 = *((double *)a3 + 2);
    a4->origin.x = self->bounds.origin.x;
    a4->origin.y = v11;
    height = *((double *)a3 + 4);
    goto LABEL_6;
  }
  result = 0;
  *a4 = CGRectNull;
  return result;
}

- (unsigned)indexOfIntersectionWith:(id)a3
{
  unsigned int v5;
  uint64_t v6;

  v5 = -[CPZoneBorder intersectionCount](self, "intersectionCount");
  if (v5)
  {
    v6 = 0;
    while ((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v6), "intersectingBorder") != a3)
    {
      if (v5 == ++v6)
        return v5;
    }
    return v6;
  }
  return v5;
}

- (BOOL)windsClockwiseOnto:(id)a3
{
  unsigned int v5;
  int v6;
  _BOOL4 v7;
  int v8;

  v5 = -[CPZoneBorder indexOfIntersectionWith:](self, "indexOfIntersectionWith:");
  if (objc_msgSend(a3, "indexOfIntersectionWith:", self))
    v6 = -1;
  else
    v6 = 1;
  v7 = -[CPZoneBorder isHorizontal](self, "isHorizontal");
  if (v5)
    v8 = -v6;
  else
    v8 = v6;
  if (!v7)
    v8 = -v8;
  return v8 == 1;
}

- (id)getNextBorder:(unsigned int)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", a3), "intersectingBorder");
  return (id)objc_msgSend(v4[9], "objectAtIndex:", objc_msgSend(v4, "indexOfIntersectionWith:", self));
}

- (BOOL)hasClockwiseVectorAtIndex:(unsigned int)a3 startingForward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = -[CPZoneBorder getNextBorder:](self, "getNextBorder:", *(_QWORD *)&a3);
  if (self->isHorizontal == v4)
    return objc_msgSend(v6, "backwardVector");
  else
    return objc_msgSend(v6, "forwardVector");
}

- (BOOL)hasCounterclockwiseVectorAtIndex:(unsigned int)a3 startingForward:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = -[CPZoneBorder getNextBorder:](self, "getNextBorder:", *(_QWORD *)&a3);
  if (self->isHorizontal == v4)
    return objc_msgSend(v6, "forwardVector");
  else
    return objc_msgSend(v6, "backwardVector");
}

- (void)instantiateVectors
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[CPZoneBorder intersectionCount](self, "intersectionCount");
  if (v3)
  {
    v4 = 0;
    v5 = v3;
    do
    {
      v6 = v4 + 1;
      if (v4 + 1 < v5)
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v4), "setForwardVector:", self->hasForwardVector);
      if (v4)
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v4), "setBackwardVector:", self->hasBackwardVector);
      ++v4;
    }
    while (v5 != v6);
  }
}

- (BOOL)hasVectorGoingForward:(BOOL)a3 startingAtIndex:(unsigned int *)a4
{
  _BOOL4 v5;
  unsigned int v7;
  BOOL result;
  unsigned int v9;
  unsigned int v10;
  signed int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v7 = -[CPZoneBorder intersectionCount](self, "intersectionCount");
  *a4 = v7;
  if (v7 < 2)
    return 0;
  v9 = v7;
  result = 0;
  v10 = v9 - 1;
  if (v5)
    v11 = 0;
  else
    v11 = v9 - 1;
  if (!v5)
    v10 = 0;
  v12 = v10 - v11;
  if (v10 != v11)
  {
    v13 = 0;
    v14 = v11;
    if (v5)
      v15 = 1;
    else
      v15 = -1;
    while (1)
    {
      v16 = (void *)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v14 + v13);
      if (v5)
      {
        if ((objc_msgSend(v16, "forwardVector") & 1) != 0)
          goto LABEL_18;
      }
      else if ((objc_msgSend(v16, "backwardVector") & 1) != 0)
      {
LABEL_18:
        *a4 = v14 + v13;
        return 1;
      }
      v13 += v15;
      if (v12 == (_DWORD)v13)
        return 0;
    }
  }
  return result;
}

- (BOOL)extractCycleTo:(id)a3 goingForward:(BOOL)a4 startingAtIndex:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  void *v9;
  int v10;
  CGRect v12;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  objc_msgSend(a3, "removeAllObjects");
  v9 = (void *)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v5);
  if (!v6)
  {
    v10 = objc_msgSend(v9, "backwardVector");
    if (!v10)
      return v10;
LABEL_5:
    v12 = CGRectNull;
    LOBYTE(v10) = -[CPZoneBorder extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:](self, "extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:", a3, v6, v5, self, &v12);
    return v10;
  }
  if ((objc_msgSend(v9, "forwardVector") & 1) != 0)
    goto LABEL_5;
  LOBYTE(v10) = 0;
  return v10;
}

- (BOOL)extractCycleTo:(id)a3 goingForward:(BOOL)a4 throughIntersectionIndex:(unsigned int)a5 returningTo:(id)a6 atRect:(CGRect *)a7
{
  _BOOL8 v9;
  _QWORD *v11;
  NSMutableArray *intersections;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  unsigned int v18;
  void *v19;
  _BOOL4 isHorizontal;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  uint64_t v34;
  uint64_t i;
  uint64_t v38;

  v9 = a4;
  v11 = -[CPZoneBorder copyWithoutIntersections](self, "copyWithoutIntersections");
  intersections = self->intersections;
  if (v9)
  {
    v13 = -[NSMutableArray count](intersections, "count") - 1;
    v38 = a5;
    v14 = (void *)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:");
    if (a6 == self)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v14, "setForwardVector:", 0);
      v15 = 0;
    }
    v17 = 1;
  }
  else
  {
    v38 = a5;
    v16 = (void *)-[NSMutableArray objectAtIndex:](intersections, "objectAtIndex:");
    if (a6 == self)
    {
      v13 = 0;
      v17 = -1;
      v15 = 1;
    }
    else
    {
      objc_msgSend(v16, "setBackwardVector:", 0);
      v15 = 0;
      v13 = 0;
      v17 = -1;
    }
  }
  if (v13 == a5)
    goto LABEL_26;
  while (1)
  {
    v18 = a5 + v17;
    v19 = (void *)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", a5 + v17);
    if (-[CPZoneBorder hasClockwiseVectorAtIndex:startingForward:](self, "hasClockwiseVectorAtIndex:startingForward:", a5 + v17, v9))
    {
      isHorizontal = self->isHorizontal;
      goto LABEL_21;
    }
    if (!v9)
      break;
    if (!objc_msgSend(v19, "forwardVector"))
      goto LABEL_19;
    objc_msgSend(v19, "setForwardVector:", 0);
LABEL_16:
    a5 += v17;
    if (v13 == v18)
      goto LABEL_26;
  }
  if (objc_msgSend(v19, "backwardVector"))
  {
    objc_msgSend(v19, "setBackwardVector:", 0);
    goto LABEL_16;
  }
LABEL_19:
  if (!-[CPZoneBorder hasCounterclockwiseVectorAtIndex:startingForward:](self, "hasCounterclockwiseVectorAtIndex:startingForward:", v17 + a5, v9))goto LABEL_26;
  isHorizontal = !self->isHorizontal;
LABEL_21:
  v21 = a3;
  if ((id)objc_msgSend(v19, "intersectingBorder") == a6)
  {
    objc_msgSend(v19, "intersectionRect");
    a7->origin.x = v28;
    a7->origin.y = v29;
    a7->size.width = v30;
    a7->size.height = v31;
    goto LABEL_32;
  }
  v22 = (void *)objc_msgSend(v19, "intersectingBorder");
  if (!objc_msgSend(v22, "extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:", a3, isHorizontal ^ v9, objc_msgSend(v22, "indexOfIntersectionWith:", self), a6, a7))
  {
LABEL_26:
    v26 = 0;
    if ((v15 & 1) != 0)
      goto LABEL_27;
    goto LABEL_38;
  }
  v21 = a3;
  v23 = objc_msgSend(a3, "lastObject");
  if (!v23)
    __assert_rtn("-[CPZoneBorder extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:]", "CPZoneBorder.m", 683, "nextExtractedBorder");
  v24 = v23;
  objc_msgSend(v19, "intersectionRect");
  +[CPZoneBorder addIntersectionBetweenBorder:andBorder:atRect:](CPZoneBorder, "addIntersectionBetweenBorder:andBorder:atRect:", v24, v11);
  v25 = *(void **)(v24 + 72);
  if (isHorizontal != v9)
    objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", 0), "setForwardVector:", 1);
  else
    objc_msgSend((id)objc_msgSend(v25, "lastObject"), "setBackwardVector:", 1);
LABEL_32:
  objc_msgSend(v11, "addToArray:", v21);
  if (v15)
  {
    if ((unint64_t)objc_msgSend(v21, "count") >= 2)
    {
      +[CPZoneBorder addIntersectionBetweenBorder:andBorder:atRect:](CPZoneBorder, "addIntersectionBetweenBorder:andBorder:atRect:", v11, objc_msgSend(v21, "objectAtIndex:", 0), a7->origin.x, a7->origin.y, a7->size.width, a7->size.height);
      if (!v11)
        __assert_rtn("-[CPZoneBorder extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:]", "CPZoneBorder.m", 712, "extractedBorder");
      v32 = (void *)v11[9];
      if (v9)
        objc_msgSend((id)objc_msgSend(v32, "objectAtIndex:", 0), "setForwardVector:", 1);
      else
        objc_msgSend((id)objc_msgSend(v32, "lastObject"), "setBackwardVector:", 1);
      v34 = objc_msgSend(v21, "count");
      if (v34)
      {
        for (i = 0; i != v34; ++i)
          objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", i), "trimToLastIntersections");
      }
    }
    v26 = 1;
LABEL_27:
    v27 = (void *)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v38);
    if (v9)
      objc_msgSend(v27, "setForwardVector:", 0);
    else
      objc_msgSend(v27, "setBackwardVector:", 0);
  }
  else
  {
    v26 = 1;
  }
LABEL_38:

  return v26;
}

- (BOOL)crosses:(id)a3
{
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  double v36;
  double v37;
  BOOL v38;
  BOOL v39;
  double x;
  double width;
  CGFloat v42;
  double v43;
  double height;
  _BOOL4 v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  BOOL v52;
  CGFloat v53;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double y;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double rect;
  CGFloat recta;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
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
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  objc_msgSend(a3, "bounds");
  v8 = v5;
  v9 = v7 < 0.0 || v6 < 0.0;
  v71 = v7;
  v72 = v4;
  v70 = v6;
  if (!self->isHorizontal)
  {
    x = v4;
    width = v6;
    if (v9)
    {
      v83 = CGRectStandardize(*(CGRect *)&v4);
      x = v83.origin.x;
      width = v83.size.width;
    }
    recta = v8;
    v42 = self->bounds.origin.x;
    v43 = self->bounds.size.width;
    height = self->bounds.size.height;
    v45 = height < 0.0 || v43 < 0.0;
    v46 = self->bounds.origin.x;
    v47 = self->bounds.size.width;
    if (v45)
    {
      v84 = CGRectStandardize(self->bounds);
      v46 = v84.origin.x;
      v47 = v84.size.width;
    }
    v48 = v72;
    if (v9)
    {
      v85.size.height = v71;
      v85.origin.x = v72;
      v85.origin.y = recta;
      v85.size.width = v70;
      *(_QWORD *)&v48 = (unint64_t)CGRectStandardize(v85);
    }
    v49 = x + width;
    v50 = v46 + v47;
    v51 = v42;
    if (v45)
    {
      v86.origin.y = self->bounds.origin.y;
      v86.origin.x = v42;
      v86.size.width = v43;
      v86.size.height = height;
      *(_QWORD *)&v51 = (unint64_t)CGRectStandardize(v86);
    }
    v52 = v48 >= v51 || v49 <= v50;
    v53 = v71;
    if (!v52)
    {
      v55 = recta;
      v56 = recta;
      v57 = v71;
      if (v9)
      {
        v58 = v72;
        v59 = recta;
        v60 = v70;
        *(CGRect *)(&v56 - 1) = CGRectStandardize(*(CGRect *)(&v53 - 3));
        v57 = v61;
      }
      v67 = v56;
      y = self->bounds.origin.y;
      v63 = y;
      v64 = height;
      if (v45)
      {
        v87.origin.x = v42;
        v87.origin.y = self->bounds.origin.y;
        v87.size.width = v43;
        v87.size.height = height;
        v88 = CGRectStandardize(v87);
        v63 = v88.origin.y;
        v64 = v88.size.height;
      }
      if (v9)
      {
        v89.size.height = v71;
        v89.origin.x = v72;
        v89.origin.y = recta;
        v89.size.width = v70;
        v90 = CGRectStandardize(v89);
        v55 = v90.origin.y;
      }
      v65 = v67 + v57;
      v66 = v63 + v64;
      if (v45)
      {
        v91.origin.x = v42;
        v91.origin.y = y;
        v91.size.width = v43;
        v91.size.height = height;
        v92 = CGRectStandardize(v91);
        y = v92.origin.y;
      }
      v38 = v55 > y;
      v39 = v65 < v66;
      return v39 && v38;
    }
    return 0;
  }
  v10 = v5;
  v11 = v7;
  if (v9)
  {
    v73 = CGRectStandardize(*(CGRect *)&v4);
    v10 = v73.origin.y;
    v11 = v73.size.height;
  }
  v12 = self->bounds.origin.y;
  v13 = self->bounds.size.height;
  rect = self->bounds.size.width;
  v14 = v13 < 0.0 || rect < 0.0;
  v15 = self->bounds.origin.y;
  v16 = self->bounds.size.height;
  if (v14)
  {
    v74 = CGRectStandardize(self->bounds);
    v15 = v74.origin.y;
    v16 = v74.size.height;
  }
  v17 = v8;
  if (v9)
  {
    v75.size.height = v71;
    v75.origin.x = v72;
    v75.origin.y = v8;
    v75.size.width = v70;
    v76 = CGRectStandardize(v75);
    v8 = v76.origin.y;
  }
  v18 = v10 + v11;
  v19 = v15 + v16;
  v20 = v12;
  if (v14)
  {
    v77.origin.x = self->bounds.origin.x;
    v77.origin.y = v12;
    v77.size.width = rect;
    v77.size.height = v13;
    *(CGRect *)(&v20 - 1) = CGRectStandardize(v77);
  }
  if (v8 >= v20 || v18 <= v19)
    return 0;
  v22 = v72;
  v23 = v70;
  v24 = v70;
  v25 = v17;
  v26 = v72;
  if (v9)
  {
    v27 = v72;
    v28 = v25;
    v29 = v71;
    v78 = CGRectStandardize(*(CGRect *)(&v23 - 2));
    v22 = v78.origin.x;
    v24 = v78.size.width;
  }
  v30 = self->bounds.origin.x;
  v31 = v30;
  v32 = rect;
  if (v14)
  {
    v79.origin.x = self->bounds.origin.x;
    v33 = v22;
    v79.origin.y = v12;
    v79.size.width = rect;
    v79.size.height = v13;
    v80 = CGRectStandardize(v79);
    v22 = v33;
    v31 = v80.origin.x;
    v32 = v80.size.width;
  }
  if (v9)
  {
    v81.origin.x = v72;
    v34 = v22;
    v81.origin.y = v25;
    v81.size.width = v70;
    v81.size.height = v71;
    v35 = (unint64_t)CGRectStandardize(v81);
    v22 = v34;
    v26 = *(double *)&v35;
  }
  v36 = v22 + v24;
  v37 = v31 + v32;
  if (v14)
  {
    v82.origin.x = v30;
    v82.origin.y = v12;
    v82.size.width = rect;
    v82.size.height = v13;
    *(_QWORD *)&v30 = (unint64_t)CGRectStandardize(v82);
  }
  v38 = v26 > v30;
  v39 = v36 < v37;
  return v39 && v38;
}

- (BOOL)continues:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v17;
  CGRect v18;

  +[CPZoneBorder extendRect:](CPZoneBorder, "extendRect:", self->bounds.origin.x, self->bounds.origin.y, self->bounds.size.width, self->bounds.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  +[CPZoneBorder extendRect:](CPZoneBorder, "extendRect:", *((double *)a3 + 1), *((double *)a3 + 2), *((double *)a3 + 3), *((double *)a3 + 4));
  v18.origin.x = v12;
  v18.origin.y = v13;
  v18.size.width = v14;
  v18.size.height = v15;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  return CGRectIntersectsRect(v17, v18);
}

- (void)combine:(id)a3
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  BOOL hasForwardVector;
  BOOL hasBackwardVector;

  self->bounds = CGRectUnion(self->bounds, *(CGRect *)((char *)a3 + 8));
  v5 = objc_msgSend(a3, "graphicObjectCount");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      -[CPZoneBorder addGraphicObject:](self, "addGraphicObject:", objc_msgSend(a3, "graphicObjectAtIndex:", v7));
      v7 = (v7 + 1);
    }
    while (v6 != (_DWORD)v7);
  }
  v8 = objc_msgSend(a3, "neighborCount");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    do
    {
      -[CPZoneBorder addNeighbor:](self, "addNeighbor:", objc_msgSend(a3, "neighborAtIndex:", v10));
      v10 = (v10 + 1);
    }
    while (v9 != (_DWORD)v10);
  }
  hasForwardVector = self->hasForwardVector;
  if (hasForwardVector)
    hasForwardVector = *((_BYTE *)a3 + 81) != 0;
  self->hasForwardVector = hasForwardVector;
  hasBackwardVector = self->hasBackwardVector;
  if (hasBackwardVector)
    hasBackwardVector = *((_BYTE *)a3 + 82) != 0;
  self->hasBackwardVector = hasBackwardVector;
  objc_msgSend(a3, "removeFromArray");
}

- (void)trimToLastIntersections
{
  unsigned int v3;
  unsigned int v4;
  double v5;
  double v6;
  double v7;
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
  CGFloat x;
  double width;
  double v23;
  unint64_t v24;
  double height;
  CGFloat y;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v3 = -[CPZoneBorder intersectionCount](self, "intersectionCount");
  if (v3)
  {
    v4 = v3;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", 0), "intersectionRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v4 - 1), "intersectionRect");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    if (self->isHorizontal)
    {
      x = self->bounds.origin.x;
      width = self->bounds.size.width;
      self->overhangMin = x;
      self->overhangMax = x + width;
      if (v10 < 0.0 || v12 < 0.0)
      {
        v37.origin.x = v6;
        v37.origin.y = v8;
        v37.size.width = v10;
        v37.size.height = v12;
        v23 = v16;
        v24 = (unint64_t)CGRectStandardize(v37);
        v16 = v23;
        v6 = *(double *)&v24;
      }
      self->bounds.origin.x = v6;
      if (v18 < 0.0 || v20 < 0.0)
      {
        v38.origin.x = v14;
        v38.origin.y = v16;
        v38.size.width = v18;
        v38.size.height = v20;
        v39 = CGRectStandardize(v38);
        v14 = v39.origin.x;
        v18 = v39.size.width;
      }
      height = self->bounds.size.height;
      if (width < 0.0 || height < 0.0)
      {
        y = self->bounds.origin.y;
        v27 = v6;
        v28 = width;
        *(_QWORD *)&v6 = (unint64_t)CGRectStandardize(*(CGRect *)(&height - 3));
      }
      self->bounds.size.width = v14 + v18 - v6;
    }
    else
    {
      v29 = self->bounds.origin.y;
      v30 = self->bounds.size.height;
      self->overhangMin = v29;
      self->overhangMax = v29 + v30;
      if (v10 < 0.0 || v12 < 0.0)
      {
        v40.origin.x = v6;
        v40.origin.y = v8;
        v40.size.width = v10;
        v40.size.height = v12;
        v31 = v16;
        v41 = CGRectStandardize(v40);
        v16 = v31;
        v8 = v41.origin.y;
      }
      self->bounds.origin.y = v8;
      if (v18 < 0.0 || v20 < 0.0)
      {
        v42.origin.x = v14;
        v42.origin.y = v16;
        v42.size.width = v18;
        v42.size.height = v20;
        v43 = CGRectStandardize(v42);
        v16 = v43.origin.y;
        v20 = v43.size.height;
      }
      v32 = v16 + v20;
      v33 = self->bounds.size.width;
      if (v33 < 0.0 || v30 < 0.0)
      {
        v34 = self->bounds.origin.x;
        v35 = v8;
        v36 = v30;
        v44 = CGRectStandardize(*(CGRect *)(&v33 - 2));
        v8 = v44.origin.y;
      }
      self->bounds.size.height = v32 - v8;
    }
  }
}

- (void)removeLooseThreadsStartingFrom:(id)a3
{
  unsigned int v5;
  void *v6;
  id *v7;
  id *v8;
  unsigned int v9;

  if (-[CPZoneBorder intersectionCount](self, "intersectionCount"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", (int)v5);
      v7 = (id *)objc_msgSend(v6, "intersectingBorder");
      if (v7 != a3)
      {
        v8 = v7;
        -[NSMutableArray removeObject:](self->intersections, "removeObject:", v6);
        v9 = objc_msgSend(v8, "indexOfIntersectionWith:", self);
        if (v9 < objc_msgSend(v8, "intersectionCount"))
          objc_msgSend(v8[9], "removeObjectAtIndex:", v9);
        if (objc_msgSend(v8, "intersectionCount") <= 1)
        {
          if (objc_msgSend(v8, "intersectionCount") == 1)
            objc_msgSend(v8, "removeLooseThreadsStartingFrom:", self);
          objc_msgSend(v8, "removeFromArray");
        }
        --v5;
      }
      ++v5;
    }
    while (v5 < -[CPZoneBorder intersectionCount](self, "intersectionCount"));
  }
}

- (int64_t)compareXBounds:(id)a3
{
  double x;
  double v4;

  x = self->bounds.origin.x;
  objc_msgSend(a3, "bounds");
  if (x < v4)
    return -1;
  else
    return x != v4;
}

- (int64_t)compareYBounds:(id)a3
{
  double y;
  double v4;

  y = self->bounds.origin.y;
  objc_msgSend(a3, "bounds");
  if (y < v4)
    return -1;
  else
    return y != v4;
}

+ (void)addIntersectionBetweenBorder:(id)a3 andBorder:(id)a4 atRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  CPZoneBorderIntersection *v11;
  void *v12;
  void *v13;
  CPZoneBorderIntersection *v14;

  if (a3 && a4)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v11 = objc_alloc_init(CPZoneBorderIntersection);
    -[CPZoneBorderIntersection setIntersectionRect:](v11, "setIntersectionRect:", x, y, width, height);
    -[CPZoneBorderIntersection setIntersectingBorder:](v11, "setIntersectingBorder:", a4);
    v12 = (void *)*((_QWORD *)a3 + 9);
    if (!v12)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      *((_QWORD *)a3 + 9) = v12;
    }
    objc_msgSend(v12, "addObject:", v11);
    objc_msgSend(*((id *)a3 + 9), "sortUsingSelector:", sel_comparePositionLengthwise_);

    v14 = objc_alloc_init(CPZoneBorderIntersection);
    -[CPZoneBorderIntersection setIntersectionRect:](v14, "setIntersectionRect:", x, y, width, height);
    -[CPZoneBorderIntersection setIntersectingBorder:](v14, "setIntersectingBorder:", a3);
    v13 = (void *)*((_QWORD *)a4 + 9);
    if (!v13)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      *((_QWORD *)a4 + 9) = v13;
    }
    objc_msgSend(v13, "addObject:", v14);
    objc_msgSend(*((id *)a4 + 9), "sortUsingSelector:", sel_comparePositionLengthwise_);

  }
}

+ (void)removeIntersectionBetweenBorder:(id)a3 andBorder:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  v6 = objc_msgSend(a3, "intersectionCount");
  if (v6)
  {
    v7 = 0;
    v8 = v6;
    while ((id)objc_msgSend((id)objc_msgSend(*((id *)a3 + 9), "objectAtIndex:", v7), "intersectingBorder") != a4)
    {
      if (v8 == ++v7)
        goto LABEL_7;
    }
    objc_msgSend(*((id *)a3 + 9), "removeObjectAtIndex:", v7);
  }
LABEL_7:
  v9 = objc_msgSend(a4, "intersectionCount");
  if (v9)
  {
    v10 = 0;
    v11 = v9;
    while ((id)objc_msgSend((id)objc_msgSend(*((id *)a4 + 9), "objectAtIndex:", v10), "intersectingBorder") != a3)
    {
      if (v11 == ++v10)
        return;
    }
    objc_msgSend(*((id *)a4 + 9), "removeObjectAtIndex:", v10);
  }
}

+ (void)outerVertices:(CGPoint *)a3 fromBorders:(id)a4 swollenBy:(double)a5
{
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  id *v14;
  void *v15;
  unsigned int v16;
  int v17;
  double v18;
  CGFloat v19;
  double v20;
  double y;
  double v22;
  double v23;
  double v24;
  double height;
  int v26;
  int v27;
  char v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v8 = +[CPZoneBorder clockwiseWindingNumberOfShapeWithBorders:](CPZoneBorder, "clockwiseWindingNumberOfShapeWithBorders:", a4);
  v9 = objc_msgSend(a4, "count");
  v10 = v9;
  if (v9)
  {
    v11 = 0;
    v12 = 0;
    v13 = v9;
    do
    {
      if (v12 + 1 < v10)
        ++v12;
      else
        v12 = 0;
      v14 = (id *)objc_msgSend(a4, "objectAtIndex:", v11);
      v15 = (void *)objc_msgSend(a4, "objectAtIndex:", v12);
      v16 = objc_msgSend(v14, "indexOfIntersectionWith:", v15);
      v17 = objc_msgSend(v15, "indexOfIntersectionWith:", v14);
      objc_msgSend((id)objc_msgSend(v14[9], "objectAtIndex:", v16), "intersectionRect");
      v19 = v18;
      y = v20;
      v23 = v22;
      height = v24;
      v26 = objc_msgSend(v14, "isHorizontal");
      if (!v26 || v16)
        v27 = (v17 != 0) & ~v26;
      else
        v27 = 1;
      if (v17)
        v28 = 0;
      else
        v28 = v26;
      if ((v28 & 1) != 0)
      {
        if (v8 < 0)
        {
          LOBYTE(v27) = v27 ^ 1;
LABEL_21:
          if (v23 < 0.0 || (v30 = v19, v31 = v23, height < 0.0))
          {
            v34.origin.x = v19;
            v34.origin.y = y;
            v34.size.width = v23;
            v34.size.height = height;
            *(CGRect *)&v30 = CGRectStandardize(v34);
          }
          a3->x = v30 + v31 + a5;
          if ((v27 & 1) != 0)
            goto LABEL_34;
          goto LABEL_25;
        }
      }
      else
      {
        if (v16)
          v29 = v26;
        else
          v29 = 1;
        if (v8 < 0)
        {
          v27 ^= 1u;
          if ((v29 & 1) == 0)
            goto LABEL_21;
        }
        else if (v29)
        {
          goto LABEL_21;
        }
      }
      if (v23 < 0.0 || (v33 = v19, height < 0.0))
      {
        v37.origin.x = v19;
        v37.origin.y = y;
        v37.size.width = v23;
        v37.size.height = height;
        *(_QWORD *)&v33 = (unint64_t)CGRectStandardize(v37);
      }
      a3->x = v33 - a5;
      if (v27)
      {
LABEL_34:
        if (v23 < 0.0 || height < 0.0)
        {
          v38.origin.x = v19;
          v38.origin.y = y;
          v38.size.width = v23;
          v38.size.height = height;
          v39 = CGRectStandardize(v38);
          y = v39.origin.y;
        }
        v32 = y - a5;
        goto LABEL_38;
      }
LABEL_25:
      if (v23 < 0.0 || height < 0.0)
      {
        v35.origin.x = v19;
        v35.origin.y = y;
        v35.size.width = v23;
        v35.size.height = height;
        v36 = CGRectStandardize(v35);
        y = v36.origin.y;
        height = v36.size.height;
      }
      v32 = y + height + a5;
LABEL_38:
      a3->y = v32;
      ++v11;
      ++a3;
    }
    while (v13 != v11);
  }
}

+ (int)clockwiseWindingNumberOfShapeWithBorders:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  v4 = objc_msgSend(a3, "count");
  v5 = v4;
  if (!v4)
    return 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = v4;
  do
  {
    if (v8 + 1 < v5)
      ++v8;
    else
      v8 = 0;
    if (objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v6), "windsClockwiseOnto:", objc_msgSend(a3, "objectAtIndex:", v8)))++v7;
    else
      --v7;
    ++v6;
  }
  while (v9 != v6);
  return v7 / 4;
}

+ (CGRect)extendRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = fmax(a3.size.width, a3.size.height) * 0.0 + 2.0;
  v4 = a3.origin.x - v3;
  v5 = a3.origin.y - v3;
  v6 = a3.size.width + v3 * 2.0;
  v7 = a3.size.height + v3 * 2.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

@end
