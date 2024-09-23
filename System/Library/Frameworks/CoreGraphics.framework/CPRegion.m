@implementation CPRegion

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPRegion;
  -[CPObject dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v3;
  id *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPRegion;
  v3 = -[CPChunk copyWithZone:](&v7, sel_copyWithZone_, a3);
  v4 = v3;
  if (v3)
    v5 = v3[13];
  return v4;
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitRegion:", self);
}

- (BOOL)isTextRegion
{
  return self->isTextRegion;
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (void)setIsImageRegion:(BOOL)a3
{
  -[CPRegion setValue:forKey:](self, "setValue:forKey:", CFSTR("image"), CFSTR("regionType"));
  self->isImageRegion = a3;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (BOOL)isParagraphRegion
{
  return 0;
}

- (BOOL)isListItemRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  return objc_msgSend((id)-[CPRegion valueForKey:](self, "valueForKey:", CFSTR("regionType")), "isEqualToString:", CFSTR("row"));
}

- (BOOL)isTableCellRegion
{
  return 0;
}

- (BOOL)isBodyZone
{
  return 0;
}

- (void)setIsTextRegion:(BOOL)a3
{
  self->isTextRegion = a3;
}

- (BOOL)isGraphicalRegion
{
  _BOOL4 v3;
  char isKindOfClass;

  if (-[CPObject count](self, "count") == 1)
  {
    v3 = -[CPRegion isBoxRegion](self, "isBoxRegion");
    -[CPObject firstChild](self, "firstChild");
    if (!v3)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      return isKindOfClass & 1;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(-[CPObject firstChild](self, "firstChild"), "isGraphicalRegion");
  }
  isKindOfClass = 0;
  return isKindOfClass & 1;
}

- (BOOL)isCompoundShape
{
  return self->isCompoundShape;
}

- (void)setIsCompoundShape:(BOOL)a3
{
  self->isCompoundShape = a3;
}

- (BOOL)isZone
{
  return 0;
}

- (BOOL)isRotated
{
  double v2;

  -[CPChunk rotationAngle](self, "rotationAngle");
  return 360.0 - v2 > 0.1 && v2 > 0.1;
}

- (BOOL)isIndivisible
{
  _BOOL4 v3;

  if (-[CPRegion isImageRegion](self, "isImageRegion")
    || -[CPRegion isShapeRegion](self, "isShapeRegion")
    || -[CPRegion isRowRegion](self, "isRowRegion")
    || -[CPRegion isTableCellRegion](self, "isTableCellRegion"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[CPRegion isBoxRegion](self, "isBoxRegion");
    if (v3)
      LOBYTE(v3) = -[CPRegion isRotated](self, "isRotated");
  }
  return v3;
}

- (id)nextRegion
{
  return self->nextRegion;
}

- (void)setNextRegion:(id)a3
{
  CPRegion *nextRegion;

  nextRegion = self->nextRegion;
  if (nextRegion != a3)
  {

    self->nextRegion = (CPRegion *)a3;
  }
}

- (int)order
{
  return self->order;
}

- (void)setOrder:(int)a3
{
  self->order = a3;
}

- (void)setLink:(id)a3
{
  self->link = a3;
}

- (id)link
{
  return self->link;
}

@end
