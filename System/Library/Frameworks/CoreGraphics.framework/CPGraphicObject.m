@implementation CPGraphicObject

- (CPGraphicObject)init
{
  CPGraphicObject *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPGraphicObject;
  result = -[CPChunk init](&v3, sel_init);
  if (result)
  {
    result->renderedBounds = CGRectNull;
    result->isInZoneBorder = 0;
    result->zoneGraphicType = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->anchoringParagraph = 0;
  v3.receiver = self;
  v3.super_class = (Class)CPGraphicObject;
  -[CPObject dealloc](&v3, sel_dealloc);
}

- (CGRect)renderedBounds
{
  CGRect *p_renderedBounds;
  double x;
  double y;
  double width;
  double height;
  objc_super v8;
  CGRect result;

  p_renderedBounds = &self->renderedBounds;
  x = self->renderedBounds.origin.x;
  y = self->renderedBounds.origin.y;
  if (x == INFINITY || y == INFINITY)
  {
    v8.receiver = self;
    v8.super_class = (Class)CPGraphicObject;
    -[CPChunk renderedBounds](&v8, sel_renderedBounds);
    p_renderedBounds->origin.x = x;
    p_renderedBounds->origin.y = y;
    p_renderedBounds->size.width = width;
    p_renderedBounds->size.height = height;
  }
  else
  {
    width = self->renderedBounds.size.width;
    height = self->renderedBounds.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unsigned)unicode
{
  return 0;
}

- (BOOL)isNarrow
{
  double v2;
  double v3;

  -[CPGraphicObject renderedBounds](self, "renderedBounds");
  if (v3 == v2)
    return 0;
  if (v3 > 6.0 && v2 > 6.0)
    return 0;
  if (v3 <= 3.0 || v2 <= 3.0)
    return 1;
  if (v3 > v2 * 8.0)
    return 1;
  return v2 > v3 * 8.0;
}

- (BOOL)canBeContainer
{
  double v2;
  double v3;

  -[CPGraphicObject renderedBounds](self, "renderedBounds");
  return v3 >= 9.0 && v2 >= 9.0;
}

- (BOOL)isVisible
{
  return 0;
}

- (BOOL)isIndivisible
{
  return 1;
}

- (BOOL)isInZoneBorder
{
  return self->isInZoneBorder;
}

- (void)setIsInZoneBorder:(BOOL)a3
{
  self->isInZoneBorder = a3;
}

- (int)zoneGraphicType
{
  return self->zoneGraphicType;
}

- (void)setZoneGraphicType:(int)a3
{
  self->zoneGraphicType = a3;
}

- (void)setAnchoringTextLine:(id)a3
{
  self->anchoringTextLine = (CPTextLine *)a3;
}

- (id)anchoringTextLine
{
  return self->anchoringTextLine;
}

- (void)setUser:(id)a3
{
  if (self->user != a3)
  {
    if (a3)
      objc_msgSend(a3, "incrementUsedGraphicCount");
    self->user = (CPGraphicUser *)a3;
  }
}

- (id)user
{
  return self->user;
}

- (unsigned)clipIndex
{
  return self->clipIndex;
}

- (void)setClipIndex:(unsigned int)a3
{
  self->clipIndex = a3;
}

- (CPParagraph)anchoringParagraph
{
  return self->anchoringParagraph;
}

- (void)setAnchoringParagraph:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

@end
