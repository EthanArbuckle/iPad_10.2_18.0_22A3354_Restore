@implementation MTKMeshBufferZone

- (MTKMeshBufferZone)initWithCapacity:(unint64_t)a3 allocator:(id)a4
{
  id v7;
  MTKMeshBufferZone *v8;
  MTKMeshBufferZone *v9;
  void *v10;
  unint64_t capacity;
  void *v12;
  uint64_t v13;
  MTLBuffer *buffer;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *buffers;
  MTKMeshBufferZone *v17;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MTKMeshBufferZone;
  v8 = -[MTKMeshBufferZone init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_allocator, a4);
    v9->_capacity = a3;
    -[MTKMeshBufferAllocator device](v9->_allocator, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    capacity = v9->_capacity;
    if (capacity > objc_msgSend(v10, "maxBufferLength") || !v9->_capacity)
    {

      v17 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "newBufferWithLength:options:", v9->_capacity, 0);
    buffer = v9->_buffer;
    v9->_buffer = (MTLBuffer *)v13;

    v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    buffers = v9->_buffers;
    v9->_buffers = v15;

    v9->_destroyInvoked = 0;
  }
  v17 = v9;
LABEL_7:

  return v17;
}

- (id)newBufferWithLength:(unint64_t)a3 type:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  NSMutableOrderedSet *buffers;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;

  if (a4 == 1)
  {
    -[MTKMeshBufferAllocator device](self->_allocator, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "minConstantBufferAlignmentBytes");

  }
  else
  {
    v8 = 1;
  }
  buffers = self->_buffers;
  if (!self->_destroyInvoked)
  {
    -[NSMutableOrderedSet lastObject](buffers, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "offset");
    v10 = (v8 + v19 + objc_msgSend(v18, "length") - 1) & -v8;

    goto LABEL_11;
  }
  v10 = 0;
  if (!-[NSMutableOrderedSet count](buffers, "count"))
  {
LABEL_11:
    v20 = -[MTLBuffer length](self->_buffer, "length");
LABEL_12:
    if (v20 - v10 < (uint64_t)a3)
      return 0;
    v21 = -[MTKMeshBuffer _initWithLength:offset:zone:type:]([MTKMeshBuffer alloc], "_initWithLength:offset:zone:type:", a3, v10, self, a4);
    if (v21)
    {
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setBuffer:", v21);
      -[NSMutableOrderedSet addObject:](self->_buffers, "addObject:", v22);

    }
    return v21;
  }
  v11 = 0;
  v12 = v8 - 1;
  v13 = -v8;
  while (1)
  {
    -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_buffers, "objectAtIndexedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "offset") - v10 >= a3)
      break;
    v16 = objc_msgSend(v15, "offset");
    v10 = (v12 + v16 + objc_msgSend(v15, "length")) & v13;

    if (++v11 >= (unint64_t)-[NSMutableOrderedSet count](self->_buffers, "count"))
      goto LABEL_11;
  }
  v21 = -[MTKMeshBuffer _initWithLength:offset:zone:type:]([MTKMeshBuffer alloc], "_initWithLength:offset:zone:type:", a3, v10, self, a4);
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setBuffer:", v21);
  -[NSMutableOrderedSet insertObject:atIndex:](self->_buffers, "insertObject:atIndex:", v23, v11);

  v20 = -[MTLBuffer length](self->_buffer, "length");
  if (!v21)
    goto LABEL_12;
  return v21;
}

- (void)destroyBuffer:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "zone");
  if ((MTKMeshBufferZone *)objc_claimAutoreleasedReturnValue() != self)
    -[MTKMeshBufferZone destroyBuffer:].cold.1();

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

- (MDLMeshBufferAllocator)allocator
{
  return (MDLMeshBufferAllocator *)self->_allocator;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
}

- (void)destroyBuffer:.cold.1()
{
  __assert_rtn("-[MTKMeshBufferZone destroyBuffer:]", "MTKMeshBufferZone.m", 109, "destroyedBuffer.zone == self");
}

@end
