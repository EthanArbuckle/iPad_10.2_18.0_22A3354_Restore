@implementation MTKMeshBufferAllocator

- (MTKMeshBufferAllocator)initWithDevice:(id)device
{
  id v5;
  MTKMeshBufferAllocator *v6;
  MTKMeshBufferAllocator *v7;
  objc_super v9;

  v5 = device;
  v9.receiver = self;
  v9.super_class = (Class)MTKMeshBufferAllocator;
  v6 = -[MTKMeshBufferAllocator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, device);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MTLDevice **v4;
  BOOL v5;

  v4 = (MTLDevice **)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_device;

  return v5;
}

- (id)newZone:(unint64_t)a3
{
  return -[MTKMeshBufferZone initWithCapacity:allocator:]([MTKMeshBufferZone alloc], "initWithCapacity:allocator:", a3, self);
}

- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  MTKMeshBufferZone *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    v9 = -[MTLDevice minConstantBufferAlignmentBytes](self->_device, "minConstantBufferAlignmentBytes");
    if (objc_msgSend(v6, "count"))
    {
      v10 = 0;
      v11 = 0;
      v12 = v9 - 1;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue") + v11;

        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntegerValue");

        if (v16 == 1)
          v17 = v12;
        else
          v17 = 0;
        v11 = v14 + v17;
        ++v10;
      }
      while (v10 < objc_msgSend(v6, "count"));
    }
    else
    {
      v11 = 0;
    }
    v18 = -[MTKMeshBufferZone initWithCapacity:allocator:]([MTKMeshBufferZone alloc], "initWithCapacity:allocator:", v11, self);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4
{
  return -[MTKMeshBuffer _initWithLength:allocator:type:]([MTKMeshBuffer alloc], "_initWithLength:allocator:type:", a3, self, a4);
}

- (id)newBufferWithData:(id)a3 type:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[MTKMeshBuffer _initWithData:allocator:type:]([MTKMeshBuffer alloc], "_initWithData:allocator:type:", v6, self, a4);

  return v7;
}

- (id)newBufferFromZone:(id)a3 length:(unint64_t)a4 type:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "allocator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", self);

    if (!v11)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v12 = (id)objc_msgSend(v9, "newBufferWithLength:type:", a4, a5);
  }
  else
  {
    v12 = -[MTKMeshBufferAllocator newBuffer:type:](self, "newBuffer:type:", a4, a5);
  }
  v13 = v12;
LABEL_7:

  return v13;
}

- (id)newBufferFromZone:(id)a3 data:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = -[MTKMeshBufferAllocator newBufferFromZone:length:type:](self, "newBufferFromZone:length:type:", v9, objc_msgSend(v8, "length"), a5);

  objc_msgSend(v10, "fillData:offset:", v8, 0);
  return v10;
}

- (id)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
