@implementation MDLMeshBufferZoneDefault

- (MDLMeshBufferZoneDefault)initWithCapacity:(unint64_t)a3 allocator:(id)a4
{
  id v7;
  MDLMeshBufferZoneDefault *v8;
  MDLMeshBufferZoneDefault *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MDLMeshBufferZoneDefault;
  v8 = -[MDLMeshBufferZoneDefault init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_capacity = a3;
    objc_storeStrong((id *)&v8->_allocator, a4);
  }

  return v9;
}

- (BOOL)reserveMemory:(unint64_t)a3 allocator:(id)a4
{
  MDLMeshBufferAllocator *v6;
  MDLMeshBufferAllocator *v7;
  unint64_t v8;
  BOOL v9;

  v6 = (MDLMeshBufferAllocator *)a4;
  v7 = v6;
  if (!a3)
    goto LABEL_8;
  v8 = self->_usedCapacity + a3;
  if (v8 >= self->_capacity)
  {
    NSLog(CFSTR("no memory avaliable in zone"));
    goto LABEL_6;
  }
  if (self->_allocator == v6)
  {
    self->_usedCapacity = v8;
LABEL_8:
    v9 = 1;
    goto LABEL_9;
  }
  NSLog(CFSTR("incorrect allocator used with zone"));
LABEL_6:
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)cancelMemory:(unint64_t)a3
{
  self->_usedCapacity -= a3;
}

- (NSUInteger)capacity
{
  return self->_capacity;
}

- (id)allocator
{
  return self->_allocator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
}

@end
