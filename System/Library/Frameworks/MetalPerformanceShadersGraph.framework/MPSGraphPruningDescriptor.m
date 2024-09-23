@implementation MPSGraphPruningDescriptor

+ (id)descriptorWithPruningMetric:(int64_t)a3 sparsityFormat:(int64_t)a4 sparsity:(float)a5
{
  MPSGraphPruningDescriptor *v8;
  double v9;

  v8 = objc_alloc_init(MPSGraphPruningDescriptor);
  -[MPSGraphPruningDescriptor setPruningMetric:](v8, "setPruningMetric:", a3);
  -[MPSGraphPruningDescriptor setPruningStructure:](v8, "setPruningStructure:", a4);
  *(float *)&v9 = a5;
  -[MPSGraphPruningDescriptor setSparsity:](v8, "setSparsity:", v9);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphPruningDescriptor *v4;
  double v5;

  v4 = objc_alloc_init(MPSGraphPruningDescriptor);
  -[MPSGraphPruningDescriptor setPruningMetric:](v4, "setPruningMetric:", self->_pruningMetric);
  -[MPSGraphPruningDescriptor setPruningStructure:](v4, "setPruningStructure:", self->_pruningStructure);
  *(float *)&v5 = self->_sparsity;
  -[MPSGraphPruningDescriptor setSparsity:](v4, "setSparsity:", v5);
  return v4;
}

- (float)sparsity
{
  return self->_sparsity;
}

- (void)setSparsity:(float)a3
{
  self->_sparsity = a3;
}

- (int64_t)pruningMetric
{
  return self->_pruningMetric;
}

- (void)setPruningMetric:(int64_t)a3
{
  self->_pruningMetric = a3;
}

- (int64_t)pruningStructure
{
  return self->_pruningStructure;
}

- (void)setPruningStructure:(int64_t)a3
{
  self->_pruningStructure = a3;
}

@end
