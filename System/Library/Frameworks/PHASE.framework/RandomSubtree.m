@implementation RandomSubtree

- (PHASESoundEventNodeDefinition)subtree
{
  return self->_subtree;
}

- (void)setSubtree:(id)a3
{
  objc_storeStrong((id *)&self->_subtree, a3);
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtree, 0);
}

@end
