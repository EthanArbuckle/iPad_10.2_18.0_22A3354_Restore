@implementation CIFilterShape

- (void)dealloc
{
  void *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)
    free(priv);
  self->_priv = 0;
  v4.receiver = self;
  v4.super_class = (Class)CIFilterShape;
  -[CIFilterShape dealloc](&v4, sel_dealloc);
}

+ (id)_shapeInfinite
{
  return objc_alloc_init((Class)a1);
}

+ (CIFilterShape)shapeWithRect:(CGRect)r
{
  return (CIFilterShape *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRect:", r.origin.x, r.origin.y, r.size.width, r.size.height);
}

- (CIFilterShape)initWithRect:(CGRect)r
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CIFilterShape *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect *v12;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = r.size.height;
  width = r.size.width;
  y = r.origin.y;
  x = r.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)CIFilterShape;
  v7 = -[CIFilterShape init](&v14, sel_init);
  if (v7)
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v16 = CGRectStandardize(v15);
    v8 = v16.origin.x;
    v9 = v16.origin.y;
    v10 = v16.size.width;
    v11 = v16.size.height;
    v7->_priv = 0;
    if (!CGRectIsInfinite(v16))
    {
      v12 = (CGRect *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
      v17.origin.x = v8;
      v17.origin.y = v9;
      v17.size.width = v10;
      v17.size.height = v11;
      *v12 = CGRectIntegral(v17);
      v7->_priv = v12;
    }
  }
  return v7;
}

- (CIFilterShape)initWithStruct:(filterShape *)a3
{
  CIFilterShape *v4;
  CIFilterShape *v5;
  CGSize *v6;
  CGSize size;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CIFilterShape;
  v4 = -[CIFilterShape init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_priv = 0;
    if (a3)
    {
      v6 = (CGSize *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
      size = a3->var0.size;
      *v6 = (CGSize)a3->var0.origin;
      v6[1] = size;
      v5->_priv = v6;
    }
  }
  return v5;
}

- (CIFilterShape)transformBy:(CGAffineTransform *)m interior:(BOOL)flag
{
  _BOOL4 v4;
  __int128 v7;
  double a;
  double b;
  __int128 v11;
  double x;
  double y;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  if (!self->_priv)
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite](CIFilterShape, "_shapeInfinite", m, flag);
  v4 = flag;
  v7 = *(_OWORD *)&m->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&m->a;
  *(_OWORD *)&v14.c = v7;
  *(_OWORD *)&v14.tx = *(_OWORD *)&m->tx;
  if (CGAffineTransformIsIdentity(&v14))
    return (CIFilterShape *)(id)-[CIFilterShape copy](self, "copy");
  a = m->a;
  b = m->b;
  if (m->a == 1.0 && b == 0.0 && m->c == 0.0 && m->d == 1.0 && m->tx == floor(m->tx) && m->ty == floor(m->ty))
  {
    -[CIFilterShape extent](self, "extent", a);
    v16 = CGRectOffset(v15, m->tx, m->ty);
  }
  else
  {
    if ((b != 0.0 || m->c != 0.0) && a == 0.0)
      a = m->d;
    -[CIFilterShape extent](self, "extent", a);
    v11 = *(_OWORD *)&m->c;
    *(_OWORD *)&v14.a = *(_OWORD *)&m->a;
    *(_OWORD *)&v14.c = v11;
    *(_OWORD *)&v14.tx = *(_OWORD *)&m->tx;
    v18 = CGRectApplyAffineTransform(v17, &v14);
    if (v4)
    {
      v19 = CGRectStandardize(v18);
      x = v19.origin.x;
      y = v19.origin.y;
      v16.origin.x = ceil(v19.origin.x);
      v16.origin.y = ceil(v19.origin.y);
      v16.size.width = floor(x + v19.size.width) - v16.origin.x;
      v16.size.height = floor(y + v19.size.height) - v16.origin.y;
    }
    else
    {
      v16 = CGRectIntegral(v18);
    }
  }
  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
}

- (CIFilterShape)insetByX:(int)dx Y:(int)dy
{
  CGRect v7;
  CGRect v8;

  if (!self->_priv)
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite](CIFilterShape, "_shapeInfinite", *(_QWORD *)&dx, *(_QWORD *)&dy);
  -[CIFilterShape extent](self, "extent");
  v8 = CGRectInset(v7, (double)dx, (double)dy);
  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

- (CIFilterShape)unionWith:(CIFilterShape *)s2
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
  CGRect v19;

  if (!s2)
    return 0;
  if (!self->_priv || !s2->_priv)
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite](CIFilterShape, "_shapeInfinite");
  -[CIFilterShape extent](self, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CIFilterShape extent](s2, "extent");
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  v18 = CGRectUnion(v17, v19);
  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (CIFilterShape)unionWithRect:(CGRect)r
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v9 = CGRectStandardize(r);
  if (!self->_priv)
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite](CIFilterShape, "_shapeInfinite", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  if (CGRectIsInfinite(v9))
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite](CIFilterShape, "_shapeInfinite", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  -[CIFilterShape extent](self, "extent");
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v11 = CGRectUnion(v10, v12);
  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
}

- (CIFilterShape)intersectWith:(CIFilterShape *)s2
{
  void *priv;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  if (!s2)
    return 0;
  priv = s2->_priv;
  if (self->_priv)
  {
    if (priv)
    {
      -[CIFilterShape extent](self, "extent");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[CIFilterShape extent](s2, "extent");
      v20.origin.x = v13;
      v20.origin.y = v14;
      v20.size.width = v15;
      v20.size.height = v16;
      v18.origin.x = v6;
      v18.origin.y = v8;
      v18.size.width = v10;
      v18.size.height = v12;
      v19 = CGRectIntersection(v18, v20);
      return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
    }
    return (CIFilterShape *)(id)-[CIFilterShape copy](self, "copy");
  }
  if (priv)
  {
    self = s2;
    return (CIFilterShape *)(id)-[CIFilterShape copy](self, "copy");
  }
  return (CIFilterShape *)+[CIFilterShape _shapeInfinite](CIFilterShape, "_shapeInfinite");
}

- (CIFilterShape)intersectWithRect:(CGRect)r
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v9 = CGRectStandardize(r);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  if (self->_priv)
    goto LABEL_2;
  if (CGRectIsInfinite(v9))
    return (CIFilterShape *)+[CIFilterShape _shapeInfinite](CIFilterShape, "_shapeInfinite");
  if (self->_priv)
  {
LABEL_2:
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    if (CGRectIsInfinite(v10))
      return (CIFilterShape *)(id)-[CIFilterShape copy](self, "copy");
    -[CIFilterShape extent](self, "extent");
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v12 = CGRectIntersection(v11, v13);
  }
  else
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
  }
  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CIFilterShape initWithStruct:](+[CIFilterShape allocWithZone:](CIFilterShape, "allocWithZone:", a3), "initWithStruct:", self->_priv);
}

- (CGRect)extent
{
  double *priv;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  priv = (double *)self->_priv;
  if (!priv)
    priv = (double *)MEMORY[0x1E0C9D5E0];
  v3 = priv[2];
  v4 = priv[3];
  v5 = *priv;
  v6 = priv[1];
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (id)description
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v12;
  CGRect v13;

  -[CIFilterShape extent](self, "extent");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (CGRectIsInfinite(v12))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CIFilterShape: %p extent [infinite]>"), self, v8, v9, v10, v11);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectIsEmpty(v13))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CIFilterShape: %p extent [empty]>"), self, v8, v9, v10, v11);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CIFilterShape: %p extent [%g %g %g %g]>"), self, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

- (CGSRegionObject)CGSRegion
{
  CGRect v3;

  -[CIFilterShape extent](self, "extent");
  if (!CGRectIsInfinite(v3))
    CGSNewRegionWithRect();
  return 0;
}

@end
