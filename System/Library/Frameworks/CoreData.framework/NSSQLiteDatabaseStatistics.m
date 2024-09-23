@implementation NSSQLiteDatabaseStatistics

- (int64_t)pageSize
{
  return self->_pageSize;
}

- (int64_t)totalCachePages
{
  return self->_cacheMissPages + self->_cacheHitPages + self->_cacheSpillPages;
}

- (id)copy
{
  id result;

  result = -[NSSQLiteDatabaseStatistics initWithPageSize:]([NSSQLiteDatabaseStatistics alloc], "initWithPageSize:", self->_pageSize);
  *((_QWORD *)result + 1) = self->_cacheHitPages;
  *((_QWORD *)result + 2) = self->_cacheMissPages;
  *((_QWORD *)result + 3) = self->_cacheSpillPages;
  return result;
}

- (NSSQLiteDatabaseStatistics)initWithPageSize:(int64_t)a3
{
  NSSQLiteDatabaseStatistics *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSQLiteDatabaseStatistics;
  result = -[NSSQLiteDatabaseStatistics init](&v5, sel_init);
  if (result)
    result->_pageSize = a3;
  return result;
}

- (id)databaseStatisticsBySubtracting:(id)a3
{
  NSSQLiteDatabaseStatistics *v5;

  if (a3)
  {
    v5 = -[NSSQLiteDatabaseStatistics initWithPageSize:]([NSSQLiteDatabaseStatistics alloc], "initWithPageSize:", self->_pageSize);
    v5->_cacheHitPages = self->_cacheHitPages - *((_QWORD *)a3 + 1);
    v5->_cacheMissPages = self->_cacheMissPages - *((_QWORD *)a3 + 2);
    v5->_cacheSpillPages = self->_cacheSpillPages - *((_QWORD *)a3 + 3);
  }
  else
  {
    v5 = -[NSSQLiteDatabaseStatistics copy](self, "copy");
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> cacheHitPages=%lld, cacheMissPages=%lld, cacheSpillPages=%lld, pageSize=%lld"), objc_opt_class(), self, self->_cacheHitPages, self->_cacheMissPages, self->_cacheSpillPages, self->_pageSize);
}

- (int64_t)cacheHitPages
{
  return self->_cacheHitPages;
}

- (int64_t)cacheMissPages
{
  return self->_cacheMissPages;
}

- (int64_t)cacheSpillPages
{
  return self->_cacheSpillPages;
}

@end
