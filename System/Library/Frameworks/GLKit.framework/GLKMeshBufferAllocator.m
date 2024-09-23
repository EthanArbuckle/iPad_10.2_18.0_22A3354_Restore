@implementation GLKMeshBufferAllocator

- (GLKMeshBufferAllocator)init
{
  GLKMeshBufferAllocator *v2;
  GLKMeshBufferAllocator *v3;
  GLKMeshBufferAllocator *v4;
  uint64_t v5;
  EAGLSharegroup *sharegroup;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GLKMeshBufferAllocator;
  v2 = -[GLKMeshBufferAllocator init](&v8, sel_init);
  if (!v2)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
  v3 = (GLKMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[GLKMeshBufferAllocator sharegroup](v3, "sharegroup");
    v5 = objc_claimAutoreleasedReturnValue();
    sharegroup = v2->_sharegroup;
    v2->_sharegroup = (EAGLSharegroup *)v5;

LABEL_4:
    v4 = v2;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  EAGLSharegroup **v4;
  BOOL v5;

  v4 = (EAGLSharegroup **)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_sharegroup == v4[1];

  return v5;
}

- (id)newZone:(unint64_t)a3
{
  return -[GLKMeshBufferZone initWithCapacity:allocator:]([GLKMeshBufferZone alloc], "initWithCapacity:allocator:", a3, self);
}

- (id)newZoneForBuffersWithSize:(id)a3 andType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  GLKMeshBufferZone *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v9 = 0;
      v10 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue") + v10;

        objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue");

        if (v14 == 1)
          v10 = v12 + 255;
        else
          v10 = v12;
        ++v9;
      }
      while (v9 < objc_msgSend(v6, "count"));
    }
    else
    {
      v10 = 0;
    }
    v15 = -[GLKMeshBufferZone initWithCapacity:allocator:]([GLKMeshBufferZone alloc], "initWithCapacity:allocator:", v10, self);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)newBuffer:(unint64_t)a3 type:(unint64_t)a4
{
  return -[GLKMeshBuffer _initWithLength:allocator:type:]([GLKMeshBuffer alloc], "_initWithLength:allocator:type:", a3, self, a4);
}

- (id)newBufferWithData:(id)a3 type:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[GLKMeshBuffer _initWithData:allocator:type:]([GLKMeshBuffer alloc], "_initWithData:allocator:type:", v6, self, a4);

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
    v12 = -[GLKMeshBufferAllocator newBuffer:type:](self, "newBuffer:type:", a4, a5);
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
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  v9 = a3;
  v10 = -[GLKMeshBufferAllocator newBufferFromZone:length:type:](self, "newBufferFromZone:length:type:", v9, objc_msgSend(v8, "length"), a5);

  if (v10)
  {
    objc_msgSend(v10, "map");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "bytes");
    v13 = objc_retainAutorelease(v8);
    memcpy(v12, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharegroup, 0);
}

@end
