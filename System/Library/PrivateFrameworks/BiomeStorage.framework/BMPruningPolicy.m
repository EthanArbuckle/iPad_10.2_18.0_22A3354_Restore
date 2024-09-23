@implementation BMPruningPolicy

- (BOOL)pruneOnAccess
{
  return self->_pruneOnAccess;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (BOOL)filterByAgeOnRead
{
  return self->_filterByAgeOnRead;
}

- (BOOL)isEqual:(id)a3
{
  BMPruningPolicy *v4;
  BMPruningPolicy *v5;
  BOOL v6;

  v4 = (BMPruningPolicy *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_pruneOnAccess == v5->_pruneOnAccess
        && self->_maxAge == v5->_maxAge
        && self->_maxStreamSize == v5->_maxStreamSize
        && self->_filterByAgeOnRead == v5->_filterByAgeOnRead
        && self->_maxEventCount == v5->_maxEventCount;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)initPruneOnAccess:(BOOL)a3 filterByAgeOnRead:(BOOL)a4 maxAge:(double)a5 maxStreamSize:(unint64_t)a6 maxEventCount:(unint64_t)a7
{
  id result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BMPruningPolicy;
  result = -[BMPruningPolicy init](&v13, sel_init);
  if (result)
  {
    *((_BYTE *)result + 8) = a3;
    *((_BYTE *)result + 9) = a4;
    *((double *)result + 2) = a5;
    *((_QWORD *)result + 3) = a6;
    *((_QWORD *)result + 4) = a7;
  }
  return result;
}

- (id)initPruneOnAccess:(BOOL)a3 filterByAgeOnRead:(BOOL)a4 maxAge:(double)a5 maxStreamSize:(unint64_t)a6
{
  return -[BMPruningPolicy initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:](self, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", a3, a4, a6, -1, a5);
}

- (unint64_t)maxStreamSize
{
  return self->_maxStreamSize;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 3;
  if (self->_filterByAgeOnRead)
    v2 = 1;
  return self->_maxStreamSize ^ (v2 << !self->_pruneOnAccess) ^ self->_maxEventCount ^ (unint64_t)(self->_maxAge * 1000.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BMPruningPolicy initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:]([BMPruningPolicy alloc], "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:maxEventCount:", self->_pruneOnAccess, self->_filterByAgeOnRead, self->_maxStreamSize, self->_maxEventCount, self->_maxAge);
}

- (void)setPruneOnAccess:(BOOL)a3
{
  self->_pruneOnAccess = a3;
}

- (void)setFilterByAgeOnRead:(BOOL)a3
{
  self->_filterByAgeOnRead = a3;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (void)setMaxStreamSize:(unint64_t)a3
{
  self->_maxStreamSize = a3;
}

- (unint64_t)maxEventCount
{
  return self->_maxEventCount;
}

- (void)setMaxEventCount:(unint64_t)a3
{
  self->_maxEventCount = a3;
}

@end
