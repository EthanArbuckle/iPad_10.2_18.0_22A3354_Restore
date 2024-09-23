@implementation NSPurgeableData

- (const)bytes
{
  NSString *v4;
  objc_class *v5;
  void *v6;

  if (!self->_accessCount || !self->_reserved->var0)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    v5 = (objc_class *)objc_opt_class();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls."), v4, NSStringFromClass(v5), self), 0);
    objc_exception_throw(v6);
  }
  return (const void *)self->_reserved->var0;
}

- (unint64_t)length
{
  NSString *v4;
  objc_class *v5;
  void *v6;

  if (!self->_accessCount || !self->_reserved->var0)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    v5 = (objc_class *)objc_opt_class();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls."), v4, NSStringFromClass(v5), self), 0);
    objc_exception_throw(v6);
  }
  return self->_length;
}

- (NSPurgeableData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  NSPurgeableData *v9;
  NSPurgeableData *v10;
  unint64_t var0;
  char *v12;
  size_t v13;
  _QWORD *v14;
  int v15;
  NSUInteger v16;
  void *v18;

  if (a4 >= 0x8000000000000001)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "length", a4, 0x8000000000000000), 0);
    objc_exception_throw(v18);
  }
  v9 = -[NSPurgeableData initWithCapacity:](self, "initWithCapacity:", a4);
  v10 = v9;
  if (v9)
  {
    var0 = v9->_reserved->var0;
    v12 = (char *)a3;
    v13 = a4;
    if (a4 >= 0x80000)
    {
      v14 = (_QWORD *)MEMORY[0x1E0C85AD8];
      v13 = a4;
      v12 = (char *)a3;
      if (((*MEMORY[0x1E0C85AD8] - 1) & (var0 | (unint64_t)a3)) != 0)
        goto LABEL_8;
      malloc_default_zone();
      v15 = malloc_zone_claimed_address();
      v13 = a4;
      v12 = (char *)a3;
      if (v15)
        goto LABEL_8;
      v16 = -*v14 & a4;
      NSCopyMemoryPages(a3, (void *)var0, v16);
      v12 = (char *)a3 + v16;
      var0 += v16;
      v13 = a4 - v16;
    }
    if (!v13)
    {
LABEL_9:
      if (a6)
        (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
      v10->_length = a4;
      return v10;
    }
LABEL_8:
    memmove((void *)var0, v12, v13);
    goto LABEL_9;
  }
  return v10;
}

- (NSPurgeableData)initWithCapacity:(unint64_t)a3
{
  NSPurgeableData *v3;
  void *v5;

  v3 = self;
  if (a3 >= 0x8000000000000001)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "capacity", a3, 0x8000000000000000), 0);
    objc_exception_throw(v5);
  }
  self->_length = 0;
  self->_reserved = ($76F2F73B8BE4E3FDC118F7A69FD479A2 *)malloc_type_malloc(0x28uLL, 0x1000040C7883783uLL);
  if (_CFDiscorporateMemoryAllocate())
  {

    return 0;
  }
  else
  {
    v3->_accessCount = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSPurgeableData _destroyMemory](self, "_destroyMemory");
  v3.receiver = self;
  v3.super_class = (Class)NSPurgeableData;
  -[NSPurgeableData dealloc](&v3, sel_dealloc);
}

- (void)_destroyMemory
{
  $76F2F73B8BE4E3FDC118F7A69FD479A2 *reserved;

  reserved = self->_reserved;
  if (reserved)
  {
    if (reserved->var2)
    {
      _CFDiscorporateMemoryDeallocate();
      reserved = self->_reserved;
    }
    free(reserved);
    self->_reserved = 0;
  }
}

- (BOOL)beginContentAccess
{
  int accessCount;
  BOOL v4;

  objc_sync_enter(self);
  accessCount = self->_accessCount;
  if (!accessCount)
  {
    if (!self->_reserved || _CFDiscorporateMemoryMaterialize())
    {
      v4 = 0;
      goto LABEL_8;
    }
    accessCount = self->_accessCount;
  }
  if (accessCount != 0x7FFFFFFF)
    self->_accessCount = accessCount + 1;
  v4 = 1;
LABEL_8:
  objc_sync_exit(self);
  return v4;
}

- (void)endContentAccess
{
  int accessCount;
  int v5;
  void *v6;

  objc_sync_enter(self);
  accessCount = self->_accessCount;
  if (accessCount != 0x7FFFFFFF)
  {
    if (!accessCount)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: called without successful matching -beginContentAccess"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
      objc_exception_throw(v6);
    }
    v5 = accessCount - 1;
    self->_accessCount = v5;
    if (!v5)
      _CFDiscorporateMemoryDematerialize();
  }
  objc_sync_exit(self);
}

- (void)discardContentIfPossible
{
  objc_sync_enter(self);
  if (!self->_accessCount)
    -[NSPurgeableData _destroyMemory](self, "_destroyMemory");
  objc_sync_exit(self);
}

- (void)mutableBytes
{
  NSString *v4;
  objc_class *v5;
  void *v6;

  if (!self->_accessCount || !self->_reserved->var0)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    v5 = (objc_class *)objc_opt_class();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls."), v4, NSStringFromClass(v5), self), 0);
    objc_exception_throw(v6);
  }
  return (void *)self->_reserved->var0;
}

- (void)setLength:(unint64_t)a3
{
  $76F2F73B8BE4E3FDC118F7A69FD479A2 *reserved;
  unint64_t var1;
  unint64_t length;
  char v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t var0;
  size_t v16;
  NSUInteger v17;
  $76F2F73B8BE4E3FDC118F7A69FD479A2 *v18;
  NSString *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  _QWORD *v23;

  if (!self->_accessCount || (reserved = self->_reserved, !reserved->var0))
  {
    v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    v20 = (objc_class *)objc_opt_class();
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls."), v19, NSStringFromClass(v20), self);
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = (_QWORD *)MEMORY[0x1E0C99750];
    goto LABEL_31;
  }
  if (a3 >= 0x8000000000000001)
  {
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem((objc_class *)self, a2), "length", a3, 0x8000000000000000);
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_31;
  }
  var1 = reserved->var1;
  length = self->_length;
  v9 = 1;
  if (a3 >> 19)
    v9 = 2;
  v10 = (a3 >> v9) + a3;
  if (var1 > v10)
    v10 = var1;
  if (a3 <= length)
    v10 = a3;
  v11 = (_QWORD *)MEMORY[0x1E0C85AD8];
  v12 = v10 + *MEMORY[0x1E0C85AD8] - 1;
  if (((unint64_t)v12 & -*MEMORY[0x1E0C85AD8]) <= v10)
    v13 = v10;
  else
    v13 = v12 & -*MEMORY[0x1E0C85AD8];
  if (v13 != var1)
  {
    if (!_CFDiscorporateMemoryAllocate())
    {
      v14 = 0;
      var0 = self->_reserved->var0;
      if (length >= a3)
        v16 = a3;
      else
        v16 = length;
      if (v16 >= 0x80000)
      {
        if (((*v11 - 1) & var0) != 0)
          goto LABEL_23;
        malloc_default_zone();
        if (malloc_zone_claimed_address())
          goto LABEL_23;
        v17 = v16 & -*v11;
        NSCopyMemoryPages((const void *)var0, 0, v17);
        var0 += v17;
        v14 = (void *)v17;
        v16 -= v17;
      }
      if (!v16)
      {
LABEL_24:
        _CFDiscorporateMemoryDeallocate();
        v18 = self->_reserved;
        v18->var5 = 0;
        *(_OWORD *)&v18->var0 = 0u;
        *(_OWORD *)&v18->var2 = 0u;
        goto LABEL_25;
      }
LABEL_23:
      memmove(v14, (const void *)var0, v16);
      goto LABEL_24;
    }
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unable to allocate memory for length (%lu)"), _NSMethodExceptionProem((objc_class *)self, a2), v13);
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = (_QWORD *)MEMORY[0x1E0C99850];
LABEL_31:
    objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", *v23, v21, 0));
  }
LABEL_25:
  if (a3 > length)
    bzero((void *)(self->_reserved->var0 + length), a3 - length);
  self->_length = a3;
}

- (id)description
{
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (self->_accessCount)
  {
    v7.receiver = self;
    v7.super_class = (Class)NSPurgeableData;
    v3 = -[NSData description](&v7, sel_description);
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
  }
  v5 = v3;
  objc_sync_exit(self);
  return v5;
}

- (BOOL)isContentDiscarded
{
  BOOL v3;

  objc_sync_enter(self);
  if (!self->_reserved)
    goto LABEL_5;
  if (!self->_accessCount)
  {
    if (!_CFDiscorporateMemoryMaterialize())
    {
      _CFDiscorporateMemoryDematerialize();
      goto LABEL_3;
    }
LABEL_5:
    v3 = 1;
    goto LABEL_6;
  }
LABEL_3:
  v3 = 0;
LABEL_6:
  objc_sync_exit(self);
  return v3;
}

- (NSPurgeableData)init
{
  return -[NSPurgeableData initWithCapacity:](self, "initWithCapacity:", 0);
}

@end
