@implementation MPSGraphTensor

- (id)initTensorWithValue:(Value)a3 graph:(id)a4
{
  id v6;
  MPSGraphTensor *v7;
  uint64_t v8;
  NSArray *shape;
  NSString *name;
  unsigned int *v11;
  unsigned int v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphTensor;
  v7 = -[MPSGraphTensor init](&v14, sel_init);
  getMPSShapeFromMLIR((uint64_t **)(*((_QWORD *)a3.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  v8 = objc_claimAutoreleasedReturnValue();
  shape = v7->_shape;
  v7->_shape = (NSArray *)v8;

  v7->_value = a3;
  objc_storeWeak((id *)&v7->_graph, v6);
  name = v7->_name;
  v7->_name = (NSString *)CFSTR("UndefinedName");

  objc_storeWeak((id *)&v7->_operation, 0);
  v7->_dataType = getMPSDataType((_QWORD *)(*((_QWORD *)a3.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  if (qword_1EDC0BEC0 != -1)
    dispatch_once(&qword_1EDC0BEC0, &__block_literal_global_3);
  v11 = (unsigned int *)_MergedGlobals_5;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 + 1, v11));
  v7->_index = v12;

  return v7;
}

- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5
{
  return -[MPSGraphTensor initTensorWithOperation:value:graph:name:](self, "initTensorWithOperation:value:graph:name:", a3, a4.impl, a5, 0);
}

- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5 name:(id)a6
{
  id v10;
  id v11;
  id *v12;

  v10 = a3;
  v11 = a6;
  v12 = -[MPSGraphTensor initTensorWithValue:graph:](self, "initTensorWithValue:graph:", a4.impl, a5);
  objc_storeWeak(v12 + 2, v10);
  if (v11)
    objc_storeStrong(v12 + 8, a6);

  return v12;
}

- (id)initTensorWithOperation:(id)a3 value:(Value)a4 graph:(id)a5 parentBlock:(id)a6 name:(id)a7
{
  id v12;
  id *v13;

  v12 = a6;
  v13 = -[MPSGraphTensor initTensorWithOperation:value:graph:name:](self, "initTensorWithOperation:value:graph:name:", a3, a4.impl, a5, a7);
  objc_storeWeak(v13 + 4, v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphTensor *v3;
  MPSGraphTensor *v4;
  MPSGraphTensor *v5;

  v3 = self;
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  int v17;
  void **v18;
  void *v19[2];
  uint64_t v20;

  v19[0] = 0;
  v19[1] = 0;
  v20 = 0;
  v11 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 1;
  v13 = 0;
  v14 = 0;
  v12 = 0;
  v10 = &unk_1E0E22B10;
  v18 = v19;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v10, 0, 0, 0);
  mlir::Value::print((mlir::Value *)&self->_value, (llvm::raw_ostream *)&v10);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphTensor;
  -[MPSGraphTensor debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  if (*((char *)v18 + 23) < 0)
    v5 = *v18;
  -[NSArray debugDescription](self->_shape, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : \n\nIR: %s \nShape: %@\n"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v10);
  if (SHIBYTE(v20) < 0)
    operator delete(v19[0]);
  return v7;
}

- (MPSGraphOperation)operation
{
  return (MPSGraphOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (unint64_t)index
{
  return self->_index;
}

- (Value)value
{
  return self->_value;
}

- (MPSShape)shape
{
  return self->_shape;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_destroyWeak((id *)&self->_parentBlock);
  objc_destroyWeak((id *)&self->_graph);
  objc_destroyWeak((id *)&self->_operation);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
