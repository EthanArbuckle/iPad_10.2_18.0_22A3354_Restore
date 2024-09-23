@implementation MDLMeshBufferView

- (unint64_t)type
{
  return self->_type;
}

- (MDLMeshBufferZone)zone
{
  return 0;
}

- (MDLMeshBufferAllocator)allocator
{
  return (MDLMeshBufferAllocator *)self->_allocator;
}

- (MDLMeshBufferView)initWithBufferViewNoCopy:(id)a3 type:(unint64_t)a4
{
  id v6;
  MDLMeshBufferView *v7;
  void *v8;
  char isKindOfClass;
  unint64_t v10;
  MDLMeshBufferView *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MDLMeshBufferView;
  v7 = -[MDLMeshBufferView init](&v13, sel_init);
  if (v7)
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_storeStrong((id *)&v7->_allocator, *((id *)v6 + 5));
    v7->super._writable = 0;
    v7->super._offset = *((_QWORD *)v6 + 3);
    v7->_type = a4;
    v10 = *((_QWORD *)v6 + 2);
    v7->super._data = (const void *)*((_QWORD *)v6 + 1);
    v7->super._length = v10;
    v7->super._regionIndex = *((_QWORD *)v6 + 4);
    v11 = v7;
  }

  return v7;
}

- (MDLMeshBufferView)init
{
  MDLMeshBufferView *v2;
  MDLMeshBufferView *v3;
  MDLMeshBufferViewAllocator *allocator;
  MDLMeshBufferView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MDLMeshBufferView;
  v2 = -[MDLMeshBufferView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->super._writable = 0;
    allocator = v2->_allocator;
    v2->_allocator = 0;

    v3->super._data = 0;
    v3->super._length = 0;
    v3->_type = -1;
    *(_OWORD *)&v3->super._offset = xmmword_1DCC57020;
    v5 = v3;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSLog(CFSTR("Warning: NSZone is not supported in current development. \n"), a2, a3);
  return 0;
}

- (void)fillData:(id)a3 offset:(unint64_t)a4
{
  NSLog(CFSTR("Warning: fillData:offset: not currently supported\n"), a2, a3, a4);
}

- (id)map
{
  NSLog(CFSTR("Warning: Buffer is not writable, could not map"), a2);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
}

@end
