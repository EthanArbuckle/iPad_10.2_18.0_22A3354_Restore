@implementation _PFSQLiteSnapshotWrapper

- (unint64_t)hash
{
  unint64_t result;

  result = (unint64_t)self->_s->hidden;
  if (result)
    return CFHashBytes();
  return result;
}

- (void)dealloc
{
  malloc_zone_t *v3;
  objc_super v4;

  if (self->_flags)
  {
    sqlite3_snapshot_free(self->_s);
  }
  else
  {
    v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v3 = malloc_default_zone();
    malloc_zone_free(v3, self->_s);
  }
  self->_s = 0;
  v4.receiver = self;
  v4.super_class = (Class)_PFSQLiteSnapshotWrapper;
  -[_PFSQLiteSnapshotWrapper dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && -[_PFSQLiteSnapshotWrapper compare:](self, "compare:", a3) == 0;
}

- (int64_t)compare:(id)a3
{
  return sqlite3_snapshot_cmp(self->_s, (sqlite3_snapshot *)objc_msgSend(a3, "bytes"));
}

- (const)bytes
{
  return self->_s;
}

- (_QWORD)initWithData:(void *)a1
{
  _QWORD *v3;
  malloc_zone_t *v4;
  void *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)_PFSQLiteSnapshotWrapper;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v4 = malloc_default_zone();
    v5 = malloc_type_zone_calloc(v4, 1uLL, 0x30uLL, 0x1000040EED21634uLL);
    v3[1] = v5;
    objc_msgSend(a2, "getBytes:length:", v5, 48);
    *((_DWORD *)v3 + 5) = 0;
  }
  return v3;
}

- (id)mutableCopy
{
  id v3;
  void *v4;

  v3 = objc_alloc((Class)objc_opt_class());
  if (self)
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_s, 48);
  else
    v4 = 0;
  return -[_PFSQLiteSnapshotWrapper initWithData:](v3, v4);
}

- (uint64_t)data
{
  if (result)
    return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(result + 8), 48);
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *ClassName;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)objc_opt_class();
  ClassName = object_getClassName(v4);
  if (self)
    v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_s, 48);
  else
    v6 = 0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%s (%p) : %@"), ClassName, self, v6);
}

@end
