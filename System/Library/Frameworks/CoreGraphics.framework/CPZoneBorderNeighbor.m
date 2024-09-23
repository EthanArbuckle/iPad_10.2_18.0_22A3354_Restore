@implementation CPZoneBorderNeighbor

- (CPZoneBorderNeighbor)init
{
  CPZoneBorderNeighbor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderNeighbor;
  result = -[CPZoneBorderNeighbor init](&v3, sel_init);
  if (result)
  {
    result->neighborShape = 0;
    result->shapeSide = 0;
  }
  return result;
}

- (id)initSuper
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderNeighbor;
  return -[CPZoneBorderNeighbor init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v3;
  id v4;

  v3 = (id *)CPCopyObject(self, a3);
  v4 = v3[1];
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderNeighbor;
  -[CPZoneBorderNeighbor dealloc](&v3, sel_dealloc);
}

- (void)setNeighborShape:(id)a3
{
  CPShape *neighborShape;

  neighborShape = self->neighborShape;
  if (neighborShape != a3)
  {

    self->neighborShape = (CPShape *)a3;
  }
}

- (id)neighborShape
{
  return self->neighborShape;
}

- (void)setShapeSide:(int)a3
{
  self->shapeSide = a3;
}

- (int)shapeSide
{
  return self->shapeSide;
}

@end
