@implementation GLKMeshBufferZone

- (GLKMeshBufferZone)initWithCapacity:(unint64_t)a3 allocator:(id)a4
{
  id v7;
  GLKMeshBufferZone *v8;
  GLKMeshBufferZone *v9;
  uint64_t v10;
  NSMutableOrderedSet *buffers;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GLKMeshBufferZone;
  v8 = -[GLKMeshBufferZone init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_allocator, a4);
    v9->_capacity = a3;
    v10 = objc_opt_new();
    buffers = v9->_buffers;
    v9->_buffers = (NSMutableOrderedSet *)v10;

    glGenBuffers(1, &v9->_glBufferName);
    glBindBuffer(0x8892u, v9->_glBufferName);
    glBufferData(0x8892u, a3, 0, 0x88E4u);
    v9->_destroyInvoked = 0;
  }

  return v9;
}

- (id)newBufferWithLength:(unint64_t)a3 type:(unint64_t)a4
{
  uint64_t v7;
  NSMutableOrderedSet *buffers;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;

  if (a4 == 1)
  {
    v7 = 256;
  }
  else
  {
    if (a4 != 2)
      return 0;
    v7 = 1;
  }
  buffers = self->_buffers;
  if (self->_destroyInvoked)
  {
    if (-[NSMutableOrderedSet count](buffers, "count"))
    {
      v9 = 0;
      v10 = 0;
      v11 = v7 - 1;
      v12 = ~v7;
      while (1)
      {
        -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_buffers, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "buffer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "offset") - v10 >= a3)
          break;
        v15 = objc_msgSend(v14, "offset");
        v10 = (v11 + v15 + objc_msgSend(v14, "length")) & v12;

        if (++v9 >= (unint64_t)-[NSMutableOrderedSet count](self->_buffers, "count"))
          goto LABEL_14;
      }
      v19 = -[GLKMeshBuffer _initWithLength:offset:zone:type:]([GLKMeshBuffer alloc], "_initWithLength:offset:zone:type:", a3, v10, self, a4);
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setBuffer:", v19);
      -[NSMutableOrderedSet insertObject:atIndex:](self->_buffers, "insertObject:atIndex:", v20, v9);

      if (v19)
        return v19;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    -[NSMutableOrderedSet lastObject](buffers, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "buffer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "offset");
    v10 = (v7 + v18 + objc_msgSend(v17, "length") - 1) & -v7;

  }
LABEL_14:
  if (self->_capacity - v10 < a3)
    return 0;
  v19 = -[GLKMeshBuffer _initWithLength:offset:zone:type:]([GLKMeshBuffer alloc], "_initWithLength:offset:zone:type:", a3, v10, self, a4);
  if (v19)
  {
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setBuffer:", v19);
    -[NSMutableOrderedSet addObject:](self->_buffers, "addObject:", v21);

  }
  return v19;
}

- (void)destroyBuffer:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "zone");
  if ((GLKMeshBufferZone *)objc_claimAutoreleasedReturnValue() != self)
    -[GLKMeshBufferZone destroyBuffer:].cold.1();

  self->_destroyInvoked = 1;
  if (-[NSMutableOrderedSet count](self->_buffers, "count"))
  {
    v4 = 0;
    while (1)
    {
      -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_buffers, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "buffer");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
        break;

      if (++v4 >= (unint64_t)-[NSMutableOrderedSet count](self->_buffers, "count"))
        goto LABEL_8;
    }
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_buffers, "removeObjectAtIndex:", v4);

  }
LABEL_8:

}

- (void)dealloc
{
  objc_super v3;

  glDeleteBuffers(1, &self->_glBufferName);
  v3.receiver = self;
  v3.super_class = (Class)GLKMeshBufferZone;
  -[GLKMeshBufferZone dealloc](&v3, sel_dealloc);
}

- (MDLMeshBufferAllocator)allocator
{
  return (MDLMeshBufferAllocator *)self->_allocator;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unsigned)glBufferName
{
  return self->_glBufferName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
}

- (void)destroyBuffer:.cold.1()
{
  __assert_rtn("-[GLKMeshBufferZone destroyBuffer:]", "GLKModel.m", 199, "destroyedBuffer.zone == self");
}

@end
