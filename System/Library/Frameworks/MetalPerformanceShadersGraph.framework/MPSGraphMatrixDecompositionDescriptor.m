@implementation MPSGraphMatrixDecompositionDescriptor

+ (id)descriptorWithDecompositionType:(unint64_t)a3 dataType:(unsigned int)a4
{
  uint64_t v4;
  MPSGraphMatrixDecompositionDescriptor *v6;

  v4 = *(_QWORD *)&a4;
  v6 = objc_alloc_init(MPSGraphMatrixDecompositionDescriptor);
  -[MPSGraphMatrixDecompositionDescriptor setDataType:](v6, "setDataType:", v4);
  -[MPSGraphMatrixDecompositionDescriptor setDecompositionType:](v6, "setDecompositionType:", a3);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphMatrixDecompositionDescriptor *v4;

  v4 = [MPSGraphMatrixDecompositionDescriptor alloc];
  -[MPSGraphMatrixDecompositionDescriptor setDataType:](v4, "setDataType:", self->_dataType);
  -[MPSGraphMatrixDecompositionDescriptor setDecompositionType:](v4, "setDecompositionType:", self->_decompositionType);
  return v4;
}

- (unint64_t)decompositionType
{
  return self->_decompositionType;
}

- (void)setDecompositionType:(unint64_t)a3
{
  self->_decompositionType = a3;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unsigned int)a3
{
  self->_dataType = a3;
}

@end
