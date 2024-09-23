@implementation AKTSDLineEnd

+ (id)simpleArrow
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathCloseSubpath(Mutable);
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("simple arrow"), 3.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledCircle
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  void *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 0.5, 0.5);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled circle"), MidX, CGRectGetMinY(v14));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v8;
}

+ (id)filledDiamond
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled diamond"), 3.0, 0.331400007);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v3;
}

+ (id)openArrow
{
  CGPath *Mutable;
  AKTSDLineEnd *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathMoveToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 5.0);
  v3 = -[AKTSDLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:]([AKTSDLineEnd alloc], "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", Mutable, 0, 0, CFSTR("open arrow"), 1, 3.0, 0.0);
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledArrow
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 6.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 1.5);
  CGPathCloseSubpath(Mutable);
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled arrow"), 3.0, 1.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v3;
}

+ (id)filledSquare
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  void *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 0.5, 0.5);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("filled square"), MidX, CGRectGetMinY(v14));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v8;
}

+ (id)openSquare
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  void *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 1.0, 1.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("open square"), MidX, CGRectGetMinY(v14) + -0.800000012);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v8;
}

+ (id)openCircle
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPath *Mutable;
  double MidX;
  void *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 6.0;
  v10.size.height = 6.0;
  v11 = CGRectInset(v10, 0.5, 0.5);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  Mutable = CGPathCreateMutable();
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGPathAddEllipseInRect(Mutable, 0, v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("open circle"), MidX, CGRectGetMinY(v14) + -0.800000012);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v8;
}

+ (id)invertedArrow
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 3.0);
  CGPathAddLineToPoint(Mutable, 0, 3.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 3.0);
  CGPathCloseSubpath(Mutable);
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 1, CFSTR("inverted arrow"), 3.0, 0.331400007);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v3;
}

+ (id)line
{
  CGPath *Mutable;
  void *v3;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 6.0, 0.0);
  +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", Mutable, 0, CFSTR("line"), 3.0, -0.800000012);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  return v3;
}

+ (id)none
{
  return +[AKTSDLineEnd lineEndWithPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:endPoint:isFilled:identifier:", 0, 0, CFSTR("none"), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

+ (AKTSDLineEnd)lineEndWithType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      +[AKTSDLineEnd simpleArrow](AKTSDLineEnd, "simpleArrow", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      +[AKTSDLineEnd filledCircle](AKTSDLineEnd, "filledCircle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[AKTSDLineEnd filledDiamond](AKTSDLineEnd, "filledDiamond", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[AKTSDLineEnd openArrow](AKTSDLineEnd, "openArrow", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[AKTSDLineEnd filledArrow](AKTSDLineEnd, "filledArrow", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[AKTSDLineEnd filledSquare](AKTSDLineEnd, "filledSquare", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[AKTSDLineEnd openSquare](AKTSDLineEnd, "openSquare", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      +[AKTSDLineEnd openCircle](AKTSDLineEnd, "openCircle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[AKTSDLineEnd invertedArrow](AKTSDLineEnd, "invertedArrow", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      +[AKTSDLineEnd line](AKTSDLineEnd, "line", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      +[AKTSDLineEnd none](AKTSDLineEnd, "none", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return (AKTSDLineEnd *)v5;
}

+ (AKTSDLineEnd)lineEndWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("simple arrow")))
  {
    +[AKTSDLineEnd simpleArrow](AKTSDLineEnd, "simpleArrow");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled circle")))
  {
    +[AKTSDLineEnd filledCircle](AKTSDLineEnd, "filledCircle");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled diamond")))
  {
    +[AKTSDLineEnd filledDiamond](AKTSDLineEnd, "filledDiamond");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("open arrow")))
  {
    +[AKTSDLineEnd openArrow](AKTSDLineEnd, "openArrow");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled arrow")))
  {
    +[AKTSDLineEnd filledArrow](AKTSDLineEnd, "filledArrow");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("filled square")))
  {
    +[AKTSDLineEnd filledSquare](AKTSDLineEnd, "filledSquare");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("open square")))
  {
    +[AKTSDLineEnd openSquare](AKTSDLineEnd, "openSquare");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("open circle")))
  {
    +[AKTSDLineEnd openCircle](AKTSDLineEnd, "openCircle");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("inverted arrow")))
  {
    +[AKTSDLineEnd invertedArrow](AKTSDLineEnd, "invertedArrow");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("line")))
  {
    +[AKTSDLineEnd line](AKTSDLineEnd, "line");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("none")))
    {
      v5 = 0;
      goto LABEL_24;
    }
    +[AKTSDLineEnd none](AKTSDLineEnd, "none");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_24:

  return (AKTSDLineEnd *)v5;
}

+ (AKTSDLineEnd)lineEndWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  _BOOL8 v6;
  double y;
  double x;
  id v10;
  void *v11;

  v6 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:endPoint:isFilled:identifier:", a3, v6, v10, x, y);

  return (AKTSDLineEnd *)v11;
}

+ (AKTSDLineEnd)lineEndWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7
{
  _BOOL8 v7;
  double y;
  double x;
  id v12;
  void *v13;

  v7 = a6;
  y = a5.y;
  x = a5.x;
  v12 = a7;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, a4, v7, v12, 0, x, y);

  return (AKTSDLineEnd *)v13;
}

- (AKTSDLineEnd)initWithPath:(CGPath *)a3 wrapPath:(CGPath *)a4 endPoint:(CGPoint)a5 isFilled:(BOOL)a6 identifier:(id)a7 lineJoin:(int)a8
{
  CGFloat y;
  CGFloat x;
  id v15;
  AKTSDLineEnd *v16;
  uint64_t v17;
  NSString *mIdentifier;
  objc_super v20;

  y = a5.y;
  x = a5.x;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)AKTSDLineEnd;
  v16 = -[AKTSDLineEnd init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    mIdentifier = v16->mIdentifier;
    v16->mIdentifier = (NSString *)v17;

    v16->mLineJoin = a8;
    v16->mPath = CGPathCreateMutableCopy(a3);
    v16->mWrapPath = CGPathCreateMutableCopy(a4);
    v16->mEndPoint.x = x;
    v16->mEndPoint.y = y;
    v16->mIsFilled = a6;
  }

  return v16;
}

- (AKTSDLineEnd)initWithPath:(CGPath *)a3 endPoint:(CGPoint)a4 isFilled:(BOOL)a5 identifier:(id)a6
{
  return -[AKTSDLineEnd initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](self, "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", a3, 0, a5, a6, 0, a4.x, a4.y);
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->mPath);
  CGPathRelease(self->mWrapPath);
  v3.receiver = self;
  v3.super_class = (Class)AKTSDLineEnd;
  -[AKTSDLineEnd dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSString hash](self->mIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  AKTSDLineEnd *v4;
  NSString *mIdentifier;
  AKTSDLineEnd *v6;
  void *v7;
  char v8;

  v4 = (AKTSDLineEnd *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[AKTSDLineEnd isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    mIdentifier = self->mIdentifier;
    v6 = v4;
    -[AKTSDLineEnd identifier](v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSString isEqualToString:](mIdentifier, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", self->mPath, self->mWrapPath, self->mIsFilled, self->mIdentifier, self->mLineJoin, self->mEndPoint.x, self->mEndPoint.y);
}

- (CGPath)wrapPath
{
  CGPath *result;

  result = self->mWrapPath;
  if (!result)
    return self->mPath;
  return result;
}

- (BOOL)isNone
{
  void *v2;
  char v3;

  -[AKTSDLineEnd identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("none"));

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDLineEnd identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->mIdentifier;
}

- (CGPath)path
{
  return self->mPath;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mEndPoint.x;
  y = self->mEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isFilled
{
  return self->mIsFilled;
}

- (int)lineJoin
{
  return self->mLineJoin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mIdentifier, 0);
}

@end
