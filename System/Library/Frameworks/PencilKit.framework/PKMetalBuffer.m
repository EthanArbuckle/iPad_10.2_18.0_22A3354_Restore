@implementation PKMetalBuffer

- (_QWORD)initWithDevice:(uint64_t)a3 length:(uint64_t)a4 bytes:(uint64_t)a5 options:
{
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v9 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKMetalBuffer;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      if (a4)
        v10 = objc_msgSend(v9, "newBufferWithBytes:length:options:", a4, a3, a5);
      else
        v10 = objc_msgSend(v9, "newBufferWithLength:options:", a3, a5);
      v11 = (void *)a1[3];
      a1[3] = v10;

    }
  }

  return a1;
}

- (BOOL)lock
{
  BOOL v3;
  PKMetalBuffer *v5;
  unint64_t lockCount;

  if (atomic_load((unsigned int *)&self->_isPurged))
    return 0;
  v5 = self;
  objc_sync_enter(v5);
  lockCount = v5->_lockCount;
  v5->_lockCount = lockCount + 1;
  if (lockCount)
  {
    v3 = 1;
  }
  else
  {
    v3 = 1;
    if (-[MTLBuffer setPurgeableState:](v5->_metalBuffer, "setPurgeableState:", 2) == 4)
    {
      atomic_store(1u, (unsigned int *)&self->_isPurged);
      v3 = 0;
    }
  }
  objc_sync_exit(v5);

  return v3;
}

- (void)unlock
{
  uint64_t v2;
  PKMetalBuffer *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj->_lockCount - 1;
  obj->_lockCount = v2;
  if (!v2)
    -[MTLBuffer setPurgeableState:](obj->_metalBuffer, "setPurgeableState:", 3);
  objc_sync_exit(obj);

}

- (BOOL)isPurged
{
  unsigned int v2;

  v2 = atomic_load((unsigned int *)&self->_isPurged);
  return v2 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalBuffer, 0);
}

@end
