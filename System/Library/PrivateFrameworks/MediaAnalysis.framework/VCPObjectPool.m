@implementation VCPObjectPool

- (VCPObjectPool)initWithAllocator:(id)a3
{
  id v4;
  VCPObjectPool *v5;
  void *v6;
  id allocator;
  uint64_t v8;
  NSMutableArray *objects;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPObjectPool;
  v5 = -[VCPObjectPool init](&v11, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    allocator = v5->_allocator;
    v5->_allocator = v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    objects = v5->_objects;
    v5->_objects = (NSMutableArray *)v8;

  }
  return v5;
}

+ (VCPObjectPool)objectPoolWithAllocator:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAllocator:", v3);

  return (VCPObjectPool *)v4;
}

- (id)getObject
{
  VCPObjectPool *v2;
  VCPLoaned *v3;
  void *v4;
  VCPLoaned *v5;
  void *v6;
  uint8_t v8[16];

  v2 = self;
  objc_sync_enter(v2);
  if (-[NSMutableArray count](v2->_objects, "count"))
  {
    v3 = [VCPLoaned alloc];
    -[NSMutableArray objectAtIndexedSubscript:](v2->_objects, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VCPLoaned initWithObject:fromPool:](v3, "initWithObject:fromPool:", v4, v2);

    -[NSMutableArray removeObjectAtIndex:](v2->_objects, "removeObjectAtIndex:", 0);
  }
  else
  {
    (*((void (**)(void))v2->_allocator + 2))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = -[VCPLoaned initWithObject:fromPool:]([VCPLoaned alloc], "initWithObject:fromPool:", v6, v2);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPObjectPool failed to allocate object", v8, 2u);
      }
      v5 = 0;
    }

  }
  objc_sync_exit(v2);

  return v5;
}

- (void)returnObject:(id)a3
{
  id v4;
  VCPObjectPool *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  -[NSMutableArray addObject:](obj->_objects, "addObject:", v4);

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->_allocator, 0);
}

@end
