@implementation CPZone

- (CPZone)init
{
  CPZone *v2;
  CPZone *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPZone;
  v2 = -[CPChunk init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->outerVertices = 0;
    v2->swollenOuterVertices = 0;
    v2->area = -1.0;
    v2->isStraddleZone = 0;
    v2->zoneProfile = 0;
    v2->leftGuides = 0;
    v2->rightGuides = 0;
    v2->gutters = 0;
    v2->spacers = 0;
    v2->textLinesInZone = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->charactersInZone = 0;
    v3->hasRotatedCharacters = 0;
  }
  return v3;
}

- (void)dealloc
{
  CGPoint *swollenOuterVertices;
  NSZone *v4;
  CGPoint *outerVertices;
  NSZone *v6;
  objc_super v7;

  swollenOuterVertices = self->swollenOuterVertices;
  if (swollenOuterVertices)
  {
    v4 = (NSZone *)MEMORY[0x186DC1FA4](swollenOuterVertices, a2);
    NSZoneFree(v4, self->swollenOuterVertices);
  }
  outerVertices = self->outerVertices;
  if (outerVertices)
  {
    v6 = (NSZone *)MEMORY[0x186DC1FA4](outerVertices, a2);
    NSZoneFree(v6, self->outerVertices);
  }

  v7.receiver = self;
  v7.super_class = (Class)CPZone;
  -[CPRegion dealloc](&v7, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  unsigned int v6;
  uint64_t i;
  unsigned int v8;
  uint64_t j;
  NSArray *leftGuides;
  NSArray *rightGuides;
  NSArray *gutters;
  NSArray *spacers;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CPZone;
  v5 = -[CPRegion copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    v5[16] = -[NSMutableArray copyWithZone:](self->zoneBorders, "copyWithZone:", a3);
    v5[21] = self->zoneProfile;
    if (self->outerVertices)
    {
      v6 = -[CPZone vertexCount](self, "vertexCount");
      v5[17] = NSZoneMalloc(0, 16 * v6);
      if (v6)
      {
        for (i = 0; i != v6; ++i)
          *(CGPoint *)(v5[17] + i * 16) = self->outerVertices[i];
      }
    }
    if (self->swollenOuterVertices)
    {
      v8 = -[CPZone vertexCount](self, "vertexCount");
      v5[18] = NSZoneMalloc(0, 16 * v8);
      if (v8)
      {
        for (j = 0; j != v8; ++j)
          *(CGPoint *)(v5[18] + j * 16) = self->swollenOuterVertices[j];
      }
    }
    leftGuides = self->leftGuides;
    if (leftGuides)
      v5[22] = leftGuides;
    rightGuides = self->rightGuides;
    if (rightGuides)
      v5[23] = rightGuides;
    gutters = self->gutters;
    if (gutters)
      v5[24] = gutters;
    spacers = self->spacers;
    if (spacers)
      v5[25] = spacers;
    v5[26] = -[CPCharSequence copyWithZone:](self->charactersInZone, "copyWithZone:", a3);
    *((_BYTE *)v5 + 216) = self->hasRotatedCharacters;
    v5[28] = -[NSMutableArray mutableCopy](self->textLinesInZone, "mutableCopy");
    v5[29] = -[NSArray copy](self->graphicsInZone, "copy");
  }
  return v5;
}

- (id)textLinesInZone
{
  return self->textLinesInZone;
}

- (id)graphicsInZone
{
  id result;

  result = self->graphicsInZone;
  if (!result)
  {
    result = -[CPObject shallowDescendantsOfClass:](self, "shallowDescendantsOfClass:", objc_opt_class());
    self->graphicsInZone = (NSArray *)result;
  }
  return result;
}

- (unsigned)wordCount
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v3 = -[NSMutableArray count](self->textLinesInZone, "count");
  if (!v3)
    return 0;
  v4 = 0;
  v5 = 0;
  do
    v5 += objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", v4++), "wordCount");
  while (v3 != v4);
  return v5;
}

- (BOOL)mapToWords:(void *)a3 passing:(void *)a4
{
  unint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  unint64_t v11;

  v7 = -[NSMutableArray count](self->textLinesInZone, "count");
  if (v7)
  {
    v8 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", 0), "mapToWords:passing:", a3, a4);
    if (v8)
    {
      v9 = 1;
      while (v7 != v9)
      {
        v10 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", v9++), "mapToWords:passing:", a3, a4);
        if ((v10 & 1) == 0)
        {
          v11 = v9 - 1;
          goto LABEL_9;
        }
      }
      v11 = v7;
LABEL_9:
      LOBYTE(v8) = v11 >= v7;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)mapToWordsWithIndex:(void *)a3 passing:(void *)a4
{
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v16 = -[NSMutableArray count](self->textLinesInZone, "count");
  if (v16)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = (void *)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", v6, v16);
      v10 = objc_msgSend(v9, "charSequence");
      v11 = objc_msgSend(v9, "wordCount");
      v12 = (v11 + v8);
      v13 = objc_msgSend(v9, "wordArray");
      if (v8 < v12)
        break;
LABEL_8:
      v7 = ++v6 >= v16;
      if (v6 == v16)
        return 1;
    }
    v14 = v13;
    while (((unsigned int (*)(uint64_t, uint64_t, uint64_t, void *))a3)(v8, v14, v10, a4))
    {
      v14 += 48;
      v8 = (v8 + 1);
      if (!--v11)
      {
        v8 = v12;
        goto LABEL_8;
      }
    }
  }
  else
  {
    return 1;
  }
  return v7;
}

- (BOOL)mapToWordPairs:(void *)a3 passing:(void *)a4
{
  CPZone *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  int v14;
  CPZone *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  unint64_t v21;

  v6 = self;
  v7 = 224;
  v21 = -[NSMutableArray count](self->textLinesInZone, "count");
  if (!v21)
    return 1;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v20 = 224;
  while (1)
  {
    v12 = (void *)objc_msgSend(*(id *)((char *)&v6->super.super.super.super.isa + v7), "objectAtIndex:", v8, v20);
    v13 = objc_msgSend(v12, "wordCount");
    if (v13)
      break;
LABEL_10:
    v9 = ++v8 >= v21;
    if (v8 == v21)
      return v9;
  }
  v14 = v13;
  v15 = v6;
  v16 = objc_msgSend(v12, "charSequence");
  v17 = objc_msgSend(v12, "wordArray");
  if (v11
    && !((unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v11, v17, v10, v16, a4))
  {
    return v9;
  }
  v11 = v17 + 48 * (v14 - 1);
  if (v14 == 1)
  {
LABEL_9:
    v10 = v16;
    v6 = v15;
    v7 = v20;
    goto LABEL_10;
  }
  while ((((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v17, v17 + 48, v16, v16, a4) & 1) != 0)
  {
    v18 = v17 + 96;
    v17 += 48;
    if (v18 > v11)
      goto LABEL_9;
  }
  return v9;
}

- (BOOL)mapToWordPairsWithIndex:(void *)a3 passing:(void *)a4
{
  CPZone *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  CPZone *v19;
  unint64_t v20;

  v6 = self;
  v20 = -[NSMutableArray count](self->textLinesInZone, "count");
  if (!v20)
    return 1;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v19 = v6;
  while (1)
  {
    v12 = (void *)-[NSMutableArray objectAtIndex:](v6->textLinesInZone, "objectAtIndex:", v7);
    v13 = objc_msgSend(v12, "wordCount");
    if (v13)
      break;
LABEL_11:
    v8 = ++v7 >= v20;
    if (v7 == v20)
      return v8;
  }
  v14 = v13;
  v15 = objc_msgSend(v12, "charSequence");
  v16 = objc_msgSend(v12, "wordArray");
  if (v10)
  {
    if (!((unsigned int (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v11, v10, v16, v9, v15, a4))return v8;
    v11 = (v11 + 1);
  }
  v10 = v16 + 48 * (v14 - 1);
  if (v14 == 1)
  {
LABEL_10:
    v9 = v15;
    v6 = v19;
    goto LABEL_11;
  }
  while (((unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v11, v16, v16 + 48, v15, v15, a4))
  {
    v11 = (v11 + 1);
    v17 = v16 + 96;
    v16 += 48;
    if (v17 > v10)
      goto LABEL_10;
  }
  return v8;
}

- (BOOL)isZone
{
  return 1;
}

- (BOOL)hasBorders
{
  return -[CPZone vertexCount](self, "vertexCount") != 0;
}

- (id)zoneBorders
{
  return self->zoneBorders;
}

- (void)setZoneBorders:(id)a3
{
  NSMutableArray *zoneBorders;
  NSMutableArray *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;

  zoneBorders = self->zoneBorders;
  if (zoneBorders != a3)
  {

    v6 = (NSMutableArray *)a3;
    self->zoneBorders = v6;
    v7 = -[NSMutableArray count](v6, "count");
    if (v7 >= 1)
    {
      v8 = 0;
      v9 = v7;
      do
      {
        v10 = (void *)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v8);
        v11 = objc_msgSend(v10, "graphicObjectCount");
        if (v11 >= 1)
        {
          v12 = v11;
          v13 = 0;
          do
          {
            objc_msgSend((id)objc_msgSend(v10, "graphicObjectAtIndex:", v13), "setIsInZoneBorder:", 1);
            v13 = (v13 + 1);
          }
          while (v12 != (_DWORD)v13);
        }
        ++v8;
      }
      while (v8 != v9);
    }
  }
}

- (BOOL)bordersWindClockwise
{
  return 0;
}

- (BOOL)hasNeighborShape:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v10;

  v5 = -[CPZone vertexCount](self, "vertexCount");
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", 0), "hasNeighborShape:", a3) & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v7 = v6;
      v8 = 1;
      while (v7 != v8)
      {
        if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v8++), "hasNeighborShape:", a3))
        {
          v10 = v8 - 1;
          goto LABEL_9;
        }
      }
      v10 = v7;
LABEL_9:
      LOBYTE(v5) = v10 < v7;
    }
  }
  return v5;
}

- (CGColor)newBackgroundColor
{
  unsigned int v3;
  unsigned int v4;
  CGColor *v5;
  CGColor *CopyWithAlpha;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t SRGB;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double Alpha;
  double v24;

  -[CPZone backgroundGraphics](self, "backgroundGraphics");
  v3 = -[NSMutableArray count](self->backgroundGraphics, "count");
  v4 = v3;
  if (!v3)
    return 0;
  if (v3 == 1
    && (-[NSMutableArray objectAtIndex:](self->backgroundGraphics, "objectAtIndex:", 0),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (CGColor *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->backgroundGraphics, "objectAtIndex:", 0), "fillColor");
    CopyWithAlpha = v5;
    if (v5)
      CFRetain(v5);
  }
  else
  {
    v7 = malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
    -[NSMutableArray getObjects:](self->backgroundGraphics, "getObjects:", v7);
    -[CPZone zoneBounds](self, "zoneBounds");
    v9 = v8;
    v11 = v10;
    SRGB = (uint64_t)CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
    free(v7);
    if (-[CPZone isRectangular](self, "isRectangular"))
      return (CGColor *)SRGB;
    -[CPZone area](self, "area");
    if (v20 <= 0.0)
    {
      return (CGColor *)SRGB;
    }
    else
    {
      v21 = v20;
      if (SRGB)
      {
        if (SRGB < 0)
          Alpha = CGTaggedColorGetAlpha(SRGB, v13, v14, v15, v16, v17, v18, v19);
        else
          Alpha = *(double *)(SRGB + 8 * *(_QWORD *)(SRGB + 56) + 56);
      }
      else
      {
        Alpha = 0.0;
      }
      v24 = v11 * (v9 * Alpha) / v21;
      if (v24 > 1.0)
        v24 = 1.0;
      CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)SRGB, v24);
      if (SRGB)
        CFRelease((CFTypeRef)SRGB);
    }
  }
  return CopyWithAlpha;
}

- (id)backgroundGraphics
{
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  int v36;
  int v37;
  int v38;
  int v39;

  if (!self->backgroundGraphics)
  {
    self->backgroundGraphics = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = -[CPZone vertexCount](self, "vertexCount");
    if (v3)
    {
      v4 = v3;
      v5 = -[CPZone bordersWindClockwise](self, "bordersWindClockwise");
      v6 = (void *)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v4 - 1);
      v7 = 0;
      if (v5)
        v8 = 4;
      else
        v8 = 2;
      if (v5)
        v9 = 2;
      else
        v9 = 4;
      v38 = v9;
      v39 = v8;
      if (v5)
        v10 = 1;
      else
        v10 = 3;
      if (v5)
        v11 = 3;
      else
        v11 = 1;
      v36 = v11;
      v37 = v10;
      v12 = v4;
      do
      {
        v13 = v6;
        v6 = (void *)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v7);
        v14 = objc_msgSend(v6, "indexOfIntersectionWith:", v13);
        v15 = objc_msgSend(v6, "isHorizontal");
        if (v14)
          v16 = v37;
        else
          v16 = v36;
        v17 = v39;
        if (!v14)
          v17 = v38;
        if (v15)
          v18 = v16;
        else
          v18 = v17;
        if (v7)
        {
          if (-[NSMutableArray count](self->backgroundGraphics, "count"))
          {
            v19 = 0;
            v20 = 0;
            do
            {
              if ((objc_msgSend(v6, "hasNeighborShape:atSide:", -[NSMutableArray objectAtIndex:](self->backgroundGraphics, "objectAtIndex:", v19), v18) & 1) == 0)
              {
                -[NSMutableArray removeObjectAtIndex:](self->backgroundGraphics, "removeObjectAtIndex:", v19);
                --v20;
              }
              v19 = ++v20;
            }
            while (-[NSMutableArray count](self->backgroundGraphics, "count") > (unint64_t)v20);
          }
        }
        else
        {
          v21 = objc_msgSend(v6, "neighborCount");
          if (v21)
          {
            v22 = v21;
            v23 = 0;
            do
            {
              v24 = (void *)objc_msgSend(v6, "neighborAtIndex:", v23);
              v25 = (void *)objc_msgSend(v24, "neighborShape");
              v26 = objc_msgSend(v25, "fillColor");
              if (v26)
              {
                v34 = v26 < 0
                    ? CGTaggedColorGetAlpha(v26, v27, v28, v29, v30, v31, v32, v33)
                    : *(double *)(v26 + 8 * *(_QWORD *)(v26 + 56) + 56);
                if (v34 > 0.0 && objc_msgSend(v24, "shapeSide") == (_DWORD)v18)
                  -[NSMutableArray addObject:](self->backgroundGraphics, "addObject:", v25);
              }
              v23 = (v23 + 1);
            }
            while (v22 != (_DWORD)v23);
          }
        }
        ++v7;
      }
      while (v7 != v12);
      -[NSMutableArray sortUsingSelector:](self->backgroundGraphics, "sortUsingSelector:", sel_compareZ_);
    }
  }
  return self->backgroundGraphics;
}

- (void)removeUnfilledNeighborShapes
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;

  v3 = -[CPZone vertexCount](self, "vertexCount");
  if (v3)
  {
    v4 = 0;
    v5 = v3;
    do
    {
      v6 = (void *)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v4);
      v7 = objc_msgSend(v6, "neighborCount");
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        do
        {
          v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "neighborAtIndex:", v9), "neighborShape");
          if ((objc_msgSend(v10, "hasFill") & 1) == 0)
            objc_msgSend(v10, "remove");
          v9 = (v9 + 1);
        }
        while (v8 != (_DWORD)v9);
      }
      ++v4;
    }
    while (v4 != v5);
  }
}

- (unsigned)vertexCount
{
  NSMutableArray *zoneBorders;

  zoneBorders = self->zoneBorders;
  if (zoneBorders)
    LODWORD(zoneBorders) = -[NSMutableArray count](zoneBorders, "count");
  return zoneBorders;
}

- (int64_t)borderZOrder
{
  unsigned int v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;

  v3 = -[CPZone vertexCount](self, "vertexCount");
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = v3;
    do
    {
      v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v4), "zOrder");
      if (v7 > v5)
        v5 = v7;
      ++v4;
    }
    while (v6 != v4);
  }
  else
  {
    v5 = 0;
  }
  v8 = -[NSMutableArray count](self->super.super.super.children, "count");
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      v10 = (void *)-[NSMutableArray objectAtIndex:](self->super.super.super.children, "objectAtIndex:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = objc_msgSend(v10, "borderZOrder");
          if (v11 > v5)
            v5 = v11;
        }
      }
    }
  }
  return v5;
}

- (int64_t)neighborZOrder
{
  unsigned int v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;

  v3 = -[CPZone vertexCount](self, "vertexCount");
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = v3;
    do
    {
      v7 = (void *)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v4);
      v8 = objc_msgSend(v7, "neighborCount");
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        do
        {
          v11 = (void *)objc_msgSend((id)objc_msgSend(v7, "neighborAtIndex:", v10), "neighborShape");
          if (v11)
          {
            v12 = objc_msgSend(v11, "zOrder");
            if (v12 > v5)
              v5 = v12;
          }
          v10 = (v10 + 1);
        }
        while (v9 != (_DWORD)v10);
      }
      ++v4;
    }
    while (v4 != v6);
  }
  else
  {
    v5 = 0;
  }
  v13 = -[NSMutableArray count](self->super.super.super.children, "count");
  if (v13)
  {
    for (i = 0; i != v13; ++i)
    {
      v15 = (void *)-[NSMutableArray objectAtIndex:](self->super.super.super.children, "objectAtIndex:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = objc_msgSend(v15, "neighborZOrder");
          if (v16 > v5)
            v5 = v16;
        }
      }
    }
  }
  return v5;
}

- (CGPoint)outerVertices
{
  CGPoint *result;
  CGPoint *v4;

  result = self->outerVertices;
  if (!result)
  {
    if (self->zoneBorders)
    {
      v4 = (CGPoint *)NSZoneMalloc(0, 16 * -[CPZone vertexCount](self, "vertexCount"));
      self->outerVertices = v4;
      +[CPZoneBorder outerVertices:fromBorders:swollenBy:](CPZoneBorder, "outerVertices:fromBorders:swollenBy:", v4, self->zoneBorders, 0.0);
      return self->outerVertices;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitZone:", self);
}

- (CGPoint)swollenOuterVertices
{
  CGPoint *result;
  CGPoint *v4;

  result = self->swollenOuterVertices;
  if (!result)
  {
    if (self->zoneBorders)
    {
      v4 = (CGPoint *)NSZoneMalloc(0, 16 * -[CPZone vertexCount](self, "vertexCount"));
      self->swollenOuterVertices = v4;
      +[CPZoneBorder outerVertices:fromBorders:swollenBy:](CPZoneBorder, "outerVertices:fromBorders:swollenBy:", v4, self->zoneBorders, 1.0);
      return self->swollenOuterVertices;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (double)area
{
  double result;
  CGPoint *v4;
  CGPoint *v5;
  unsigned int v6;
  double v7;
  int v8;
  int v9;
  double v10;

  result = self->area;
  if (result < 0.0)
  {
    v4 = -[CPZone outerVertices](self, "outerVertices");
    if (v4)
    {
      v5 = v4;
      v6 = -[CPZone vertexCount](self, "vertexCount");
      if (v6)
      {
        v7 = 0.0;
        v8 = 1;
        do
        {
          if (v8 == v6)
            v9 = 0;
          else
            v9 = v8;
          v7 = v7 + v5[v8 - 1].x * v5[v9].y - v5[v8 - 1].y * v5[v9].x;
          ++v8;
        }
        while (v8 - v6 != 1);
        v10 = v7 * 0.5;
      }
      else
      {
        v10 = 0.0;
      }
      result = fabs(v10);
      self->area = result;
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (CGRect)zoneBoundsFromVertices:(CGPoint *)a3 ofCount:(unsigned int)a4
{
  double x;
  double y;
  uint64_t v6;
  double *p_y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  x = a3->x;
  y = a3->y;
  if (a4 < 2)
  {
    v9 = a3->y;
    v8 = a3->x;
  }
  else
  {
    v6 = a4 - 1;
    p_y = &a3[1].y;
    v8 = a3->x;
    v9 = a3->y;
    do
    {
      v10 = *(p_y - 1);
      v11 = *p_y;
      if (v10 < v8)
        v8 = *(p_y - 1);
      if (v10 > x)
        x = *(p_y - 1);
      if (v11 < v9)
        v9 = *p_y;
      if (v11 > y)
        y = *p_y;
      p_y += 2;
      --v6;
    }
    while (v6);
  }
  v12 = x - v8;
  v13 = y - v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)zoneBounds
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v3 = -[CPZone vertexCount](self, "vertexCount");
  if ((_DWORD)v3)
  {
    -[CPZone zoneBoundsFromVertices:ofCount:](self, "zoneBoundsFromVertices:ofCount:", -[CPZone outerVertices](self, "outerVertices"), v3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPZone;
    -[CPChunk renderedBounds](&v8, sel_renderedBounds);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)swollenZoneBounds
{
  uint64_t v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;
  CGRect result;

  v3 = -[CPZone vertexCount](self, "vertexCount");
  if ((_DWORD)v3)
  {
    -[CPZone zoneBoundsFromVertices:ofCount:](self, "zoneBoundsFromVertices:ofCount:", -[CPZone swollenOuterVertices](self, "swollenOuterVertices"), v3);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPZone;
    -[CPChunk renderedBounds](&v9, sel_renderedBounds);
    if (v4 != INFINITY && v5 != INFINITY)
      *(CGRect *)&v4 = CGRectInset(*(CGRect *)&v4, -1.0, -1.0);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)isRectangular
{
  return -[CPZone vertexCount](self, "vertexCount") == 4;
}

- (BOOL)rectangleBordersAtLeft:(id *)a3 top:(id *)a4 right:(id *)a5 bottom:(id *)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  _BOOL4 v36;

  v36 = -[CPZone isRectangular](self, "isRectangular");
  if (v36)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = (void *)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v11);
      if (objc_msgSend(v14, "isHorizontal"))
      {
        if (v13)
        {
          objc_msgSend(v13, "bounds");
          v16 = v15;
          v18 = v17;
          objc_msgSend(v14, "bounds");
          v19 = v16 + v18 * 0.5;
          v22 = v21 + v20 * 0.5;
          if (v19 <= v22)
            v23 = v14;
          else
            v23 = v13;
          if (v19 <= v22)
            v24 = v13;
          else
            v24 = v14;
          *a4 = v23;
          *a6 = v24;
        }
        else
        {
          v13 = v14;
        }
      }
      else if (v12)
      {
        objc_msgSend(v12, "bounds");
        v26 = v25;
        v28 = v27;
        objc_msgSend(v14, "bounds");
        v29 = v26 + v28 * 0.5;
        v32 = v31 + v30 * 0.5;
        if (v29 <= v32)
          v33 = v14;
        else
          v33 = v12;
        if (v29 <= v32)
          v34 = v12;
        else
          v34 = v14;
        *a5 = v33;
        *a3 = v34;
      }
      else
      {
        v12 = v14;
      }
      ++v11;
    }
    while (v11 != 4);
  }
  return v36;
}

- (BOOL)contains:(id)a3
{
  CGPoint *v5;
  double *p_x;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  unsigned int v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;

  v5 = -[CPZone swollenOuterVertices](self, "swollenOuterVertices");
  if (v5)
  {
    p_x = &v5->x;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "hasBorders"))
    {
      v7 = objc_msgSend(a3, "vertexCount");
      v8 = objc_msgSend(a3, "zoneBorders");
      if (v7)
      {
        v9 = (void *)v8;
        v10 = 0;
        v11 = v7 - 1;
        do
        {
          objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v10), "bounds");
          LODWORD(v5) = CPUprightRectilinearShapeWithVerticesContainingRect(p_x, -[CPZone vertexCount](self, "vertexCount"), v12, v13, v14, v15);
          if (!(_DWORD)v5)
            break;
        }
        while (v11 != v10++);
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      v17 = -[CPZone vertexCount](self, "vertexCount");
      objc_msgSend(a3, "renderedBounds");
      LOBYTE(v5) = CPUprightRectilinearShapeWithVerticesContainingRect(p_x, v17, v18, v19, v20, v21);
    }
  }
  return (char)v5;
}

- (BOOL)canContain:(CGRect)a3
{
  return CPUprightRectilinearShapeWithVerticesContainingRect((double *)-[CPZone swollenOuterVertices](self, "swollenOuterVertices"), -[CPZone vertexCount](self, "vertexCount"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)addPDFChar:(void *)a3
{
  CPCharSequence *charactersInZone;

  charactersInZone = self->charactersInZone;
  if (!charactersInZone)
  {
    charactersInZone = -[CPCharSequence initWithSizeFor:]([CPCharSequence alloc], "initWithSizeFor:", 10);
    self->charactersInZone = charactersInZone;
  }
  -[CPCharSequence addChar:](charactersInZone, "addChar:", a3);
  if (*((double *)a3 + 21) != 0.0)
    self->hasRotatedCharacters = 1;
}

- (void)setCharactersInZone:(id)a3
{
  CPCharSequence *charactersInZone;
  CPCharSequence *v6;

  charactersInZone = self->charactersInZone;
  if (charactersInZone != a3)
  {

    v6 = (CPCharSequence *)a3;
    self->charactersInZone = v6;
    -[CPZone updatedCharSequenceFrom:length:](self, "updatedCharSequenceFrom:length:", 0, -[CPCharSequence length](v6, "length"));
  }
}

- (id)charactersInZone
{
  return self->charactersInZone;
}

- (BOOL)hasRotatedCharacters
{
  return self->hasRotatedCharacters;
}

- (void)updatedCharSequenceFrom:(unsigned int)a3 length:(unsigned int)a4
{
  unsigned int v5;
  uint64_t v6;

  if (!self->hasRotatedCharacters && a4 + a3 > a3)
  {
    v5 = a4;
    v6 = *(_QWORD *)&a3;
    while ((double)-[CPCharSequence charAtIndex:](self->charactersInZone, "charAtIndex:", v6)[168] == 0.0)
    {
      v6 = (v6 + 1);
      if (!--v5)
        return;
    }
    self->hasRotatedCharacters = 1;
  }
}

- (void)addContentFrom:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5 - 1;
    do
    {
      v7 = v6;
      v8 = objc_msgSend(a3, "objectAtIndex:", v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (-[CPZone contains:](self, "contains:", v8))
          {
            -[CPChunk add:](self, "add:", v8);
            objc_msgSend(a3, "removeObjectAtIndex:", v6);
          }
        }
      }
      --v6;
    }
    while (v7);
  }
}

- (int64_t)compareArea:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;

  -[CPZone area](self, "area");
  v6 = v5;
  objc_msgSend(a3, "area");
  v8 = v7;
  v9 = -[CPZone vertexCount](self, "vertexCount");
  v10 = (float)((float)(objc_msgSend(a3, "vertexCount") + v9) * 0.00000011921);
  if (v6 < v8 && v8 - v6 > v8 * v10)
    return -1;
  if (v6 > v8 && v6 - v8 > v6 * v10)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    return 1;
  else
    return 0;
}

- (BOOL)isStraddleZone
{
  return self->isStraddleZone;
}

- (void)setIsStraddleZone:(BOOL)a3
{
  self->isStraddleZone = a3;
}

- (id)zoneProfile
{
  return self->zoneProfile;
}

- (void)setZoneProfile:(id)a3
{
  CPZoneProfile *zoneProfile;

  zoneProfile = self->zoneProfile;
  if (zoneProfile != a3)
  {

    self->zoneProfile = (CPZoneProfile *)a3;
  }
}

- (void)setLeftGuides:(id)a3
{
  NSArray *leftGuides;

  leftGuides = self->leftGuides;
  if (leftGuides != a3)
  {

    self->leftGuides = (NSArray *)a3;
  }
}

- (id)leftGuides
{
  return self->leftGuides;
}

- (void)setRightGuides:(id)a3
{
  NSArray *rightGuides;

  rightGuides = self->rightGuides;
  if (rightGuides != a3)
  {

    self->rightGuides = (NSArray *)a3;
  }
}

- (id)rightGuides
{
  return self->rightGuides;
}

- (void)setGutters:(id)a3
{
  NSArray *gutters;

  gutters = self->gutters;
  if (gutters != a3)
  {

    self->gutters = (NSArray *)a3;
  }
}

- (id)gutters
{
  return self->gutters;
}

- (void)setSpacers:(id)a3
{
  NSArray *spacers;

  spacers = self->spacers;
  if (spacers != a3)
  {

    self->spacers = (NSArray *)a3;
  }
}

- (id)spacers
{
  return self->spacers;
}

- (void)incrementUsedGraphicCount
{
  ++self->usedGraphicCount;
}

- (unsigned)usedGraphicCount
{
  return self->usedGraphicCount;
}

- (void)setRotationAngle:(double)a3
{
  self->rotationAngle = a3;
}

- (double)rotationAngle
{
  return self->rotationAngle;
}

@end
