@implementation MPSGraphCreateSparseOpDescriptor

+ (MPSGraphCreateSparseOpDescriptor)descriptorWithStorageType:(MPSGraphSparseStorageType)sparseStorageType dataType:(MPSDataType)dataType
{
  uint64_t v4;
  MPSGraphCreateSparseOpDescriptor *v6;

  v4 = *(_QWORD *)&dataType;
  v6 = objc_alloc_init(MPSGraphCreateSparseOpDescriptor);
  -[MPSGraphCreateSparseOpDescriptor setSparseStorageType:](v6, "setSparseStorageType:", sparseStorageType);
  -[MPSGraphCreateSparseOpDescriptor setDataType:](v6, "setDataType:", v4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphCreateSparseOpDescriptor *v4;

  v4 = [MPSGraphCreateSparseOpDescriptor alloc];
  -[MPSGraphCreateSparseOpDescriptor setSparseStorageType:](v4, "setSparseStorageType:", self->_sparseStorageType);
  -[MPSGraphCreateSparseOpDescriptor setDataType:](v4, "setDataType:", self->_dataType);
  return v4;
}

- (MPSGraphSparseStorageType)sparseStorageType
{
  return self->_sparseStorageType;
}

- (void)setSparseStorageType:(MPSGraphSparseStorageType)sparseStorageType
{
  self->_sparseStorageType = sparseStorageType;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (void)setDataType:(MPSDataType)dataType
{
  self->_dataType = dataType;
}

@end
