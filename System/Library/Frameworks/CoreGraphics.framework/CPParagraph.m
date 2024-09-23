@implementation CPParagraph

- (CPParagraph)init
{
  CPParagraph *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPParagraph;
  result = -[CPRotatedRegion init](&v3, sel_init);
  if (result)
  {
    result->super.super.isTextRegion = 1;
    LOBYTE(result->alignment) = 0;
    *(_QWORD *)&result->hasDropCap = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPParagraph;
  -[CPRegion dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPParagraph;
  result = -[CPRegion copyWithZone:](&v4, sel_copyWithZone_, a3);
  *((_QWORD *)result + 24) = 0;
  return result;
}

- (id)flowProperties
{
  return *(id *)&self->hasDropCap;
}

- (void)setFlowProperties:(id)a3
{
  *(_QWORD *)&self->hasDropCap = a3;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitParagraph:", self);
}

- (BOOL)isParagraphRegion
{
  return self->flowProperties == 0;
}

- (BOOL)isListItemRegion
{
  return self->flowProperties != 0;
}

- (unint64_t)index
{
  return objc_msgSend(-[CPObject children](self->super.super.super.super.parent, "children"), "indexOfObject:", self);
}

- (BOOL)isTextRegion
{
  return 1;
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (BOOL)isGraphicalRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  return 0;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (void)setNoIndentation:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 1) = a3;
}

- (BOOL)noIndentation
{
  return *(&self->super.dirtyNormalizedBounds + 1);
}

- (BOOL)hasDropCap
{
  return self->alignment;
}

- (void)setHasDropCap:(BOOL)a3
{
  LOBYTE(self->alignment) = a3;
}

- (void)explode
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CPParagraph *v7;

  v3 = -[CPObject childrenOfClass:](self, "childrenOfClass:", objc_opt_class());
  if ((unint64_t)objc_msgSend(v3, "count") >= 2 && objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(v3, "objectAtIndex:", v4);
      if (v4)
      {
        v6 = v5;
        v7 = objc_alloc_init(CPParagraph);
        -[CPParagraph setAlignment:](v7, "setAlignment:", *(_QWORD *)&self->noIndentation);
        objc_msgSend(-[CPObject parent](self, "parent"), "add:", v7);
        -[CPChunk add:](v7, "add:", v6);

      }
      ++v4;
    }
    while (objc_msgSend(v3, "count") > v4);
  }
}

- (CGRect)reducedBounds
{
  double v3;
  double v4;
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
  CGRect result;

  -[CPParagraph bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(-[CPObject lastChild](self, "lastChild"), "baseline");
  v12 = v11;
  v13 = v10 - (v6 - v11);
  v14 = v4;
  v15 = v8;
  result.size.height = v13;
  result.size.width = v15;
  result.origin.y = v12;
  result.origin.x = v14;
  return result;
}

- (double)selectionBottom
{
  double v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  v3 = 0.0;
  if (-[CPObject count](self, "count"))
  {
    v4 = -[CPObject lastChild](self, "lastChild");
    if (v4)
    {
      objc_msgSend(v4, "bounds");
      v3 = v6;
      if (v7 < 0.0 || v8 < 0.0)
      {
        v10 = CGRectStandardize(*(CGRect *)&v5);
        return v10.origin.y;
      }
    }
  }
  return v3;
}

- (void)setBelow:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 2) = a3;
}

- (BOOL)below
{
  return *(&self->super.dirtyNormalizedBounds + 2);
}

- (unint64_t)alignment
{
  return *(_QWORD *)&self->noIndentation;
}

- (void)setAlignment:(unint64_t)a3
{
  *(_QWORD *)&self->noIndentation = a3;
}

- (BOOL)isPreformattedWithUnitWidth:(double *)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v26;

  if (a3)
    *a3 = *(double *)&self->listItem;
  if (*(double *)&self->listItem == 0.0)
  {
    v6 = -[NSMutableArray count](self->super.super.super.super.children, "count");
    if (v6)
    {
      v7 = 0;
      while (1)
      {
        v8 = (void *)-[NSMutableArray objectAtIndex:](self->super.super.super.super.children, "objectAtIndex:", v7);
        v5 = objc_msgSend(v8, "isMonospaced");
        if (!v5)
          break;
        if (objc_msgSend(v8, "inlineCount"))
          goto LABEL_23;
        if (v6 == ++v7)
        {
          v9 = 0;
          v10 = 0;
          v11 = 0;
          v12 = 0.0;
          while (1)
          {
            v13 = (void *)-[NSMutableArray objectAtIndex:](self->super.super.super.super.children, "objectAtIndex:", v9);
            v26 = 0;
            if (!objc_msgSend(v13, "styleIsUniform:styleFlags:", &v26, 3072))
              goto LABEL_23;
            v14 = v26;
            if (v10)
            {
              if (v10 == v26)
              {
                v14 = v10;
              }
              else
              {
                if (!v26 || *(double *)(v10 + 72) != *(double *)(v26 + 72))
                  goto LABEL_23;
                v15 = *(void **)(v10 + 64);
                if (v15 != *(void **)(v26 + 64))
                {
                  if (!objc_msgSend(v15, "isSameFontAs:"))
                    goto LABEL_23;
                  v14 = v26;
                }
              }
            }
            v16 = objc_msgSend((id)objc_msgSend(v13, "charSequence"), "length");
            if (!v16)
              goto LABEL_23;
            v17 = v16;
            v18 = (double)v16;
            objc_msgSend(v13, "monospaceWidth");
            v12 = v12 + v18 * v19;
            v11 += v17;
            ++v9;
            v10 = v14;
            if (v6 == v9)
            {
              if (v11 >= 0xC)
              {
                v20 = 0;
                v21 = v12 / (double)v11;
                while (1)
                {
                  v22 = (void *)-[NSMutableArray objectAtIndex:](self->super.super.super.super.children, "objectAtIndex:", v20);
                  v23 = (double)objc_msgSend((id)objc_msgSend(v22, "charSequence"), "length");
                  objc_msgSend(v22, "monospaceWidth");
                  if (vabdd_f64(v24, v21) * v23 > v21 * 0.0625 + v21 * 0.0625)
                    break;
                  if (v6 == ++v20)
                  {
                    *(double *)&self->listItem = v21;
                    if (a3)
                      *a3 = v21;
                    goto LABEL_4;
                  }
                }
              }
              goto LABEL_23;
            }
          }
        }
      }
    }
    else
    {
LABEL_23:
      LOBYTE(v5) = 0;
    }
  }
  else
  {
LABEL_4:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (CGRect)bounds
{
  NSMutableArray *children;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat height;
  CGFloat y;
  CGFloat width;
  CGFloat x;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __double2 v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  children = self->super.super.super.super.children;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    height = 0.0;
    y = INFINITY;
    width = 0.0;
    x = INFINITY;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(children);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "charSequence");
        if (objc_msgSend(v11, "length"))
        {
          v12 = 0;
          do
          {
            v13 = objc_msgSend(v11, "charAtIndex:", v12);
            v14 = __sincos_stret(*(double *)(v13 + 168) * 0.0174532925);
            v15 = *(double *)v13;
            v16 = *(double *)(v13 + 8);
            v28.size.width = *(CGFloat *)(v13 + 16);
            v28.size.height = *(CGFloat *)(v13 + 24);
            v21.a = v14.__cosval;
            v21.b = v14.__sinval;
            v21.c = -v14.__sinval;
            v21.d = v14.__cosval;
            v21.tx = 0.0;
            v21.ty = 0.0;
            v28.origin.x = v15;
            v28.origin.y = v16;
            v32 = CGRectApplyAffineTransform(v28, &v21);
            v29.origin.x = x;
            v29.origin.y = y;
            v29.size.width = width;
            v29.size.height = height;
            v30 = CGRectUnion(v29, v32);
            x = v30.origin.x;
            y = v30.origin.y;
            width = v30.size.width;
            height = v30.size.height;
            v12 = (v12 + 1);
          }
          while (v12 < objc_msgSend(v11, "length"));
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }
  else
  {
    height = 0.0;
    y = INFINITY;
    width = 0.0;
    x = INFINITY;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CPParagraphListItem)listItem
{
  return (CPParagraphListItem *)self->flowProperties;
}

- (void)setListItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

@end
