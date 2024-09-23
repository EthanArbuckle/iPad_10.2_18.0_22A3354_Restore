@implementation GKQuadtreeNode

- (double)min
{
  return *(double *)(*(_QWORD *)(a1 + 8) + 8);
}

- (double)max
{
  return *(double *)(*(_QWORD *)(a1 + 8) + 16);
}

- (void)cQuadTreeNode
{
  return self->_cQuadTreeNode;
}

- (void)setCQuadTreeNode:(void *)a3
{
  self->_cQuadTreeNode = a3;
}

- (GKQuad)quad
{
  vector_float2 quadMin;
  vector_float2 quadMax;
  GKQuad result;

  quadMin = self->_quad.quadMin;
  quadMax = self->_quad.quadMax;
  result.quadMax = quadMax;
  result.quadMin = quadMin;
  return result;
}

@end
