@implementation KGNodeFilter

- (BOOL)matchesNode:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KGNodeFilter;
  return -[KGElementFilter matchesElement:](&v4, sel_matchesElement_, a3);
}

- (BOOL)whereNoInAndOutEdges
{
  return self->_whereNoInAndOutEdges;
}

- (void)setWhereNoInAndOutEdges:(BOOL)a3
{
  self->_whereNoInAndOutEdges = a3;
}

- (BOOL)whereNoInEdges
{
  return self->_whereNoInEdges;
}

- (void)setWhereNoInEdges:(BOOL)a3
{
  self->_whereNoInEdges = a3;
}

- (BOOL)whereNoOutEdges
{
  return self->_whereNoOutEdges;
}

- (void)setWhereNoOutEdges:(BOOL)a3
{
  self->_whereNoOutEdges = a3;
}

@end
