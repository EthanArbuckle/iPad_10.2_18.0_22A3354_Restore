@implementation _NSMetadataQueryResultArray

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSMetadataQueryResultArray;
  -[_NSMetadataQueryResultArray dealloc](&v3, sel_dealloc);
}

- (unint64_t)retainCount
{
  return self->_rc + 1;
}

- (_NSMetadataQueryResultArray)retain
{
  int *p_rc;
  unsigned int v3;

  p_rc = &self->_rc;
  do
    v3 = __ldxr((unsigned int *)p_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_rc));
  return self;
}

- (void)release
{
  id query;
  int *p_rc;
  int v5;

  query = self->_query;
  objc_sync_enter(query);
  p_rc = &self->_rc;
  do
    v5 = __ldxr((unsigned int *)p_rc);
  while (__stxr(v5 - 1, (unsigned int *)p_rc));
  if (v5 <= 0)
  {
    objc_msgSend(self->_query, "_zapResultArrayIfIdenticalTo:", self);
    objc_sync_exit(query);
    -[_NSMetadataQueryResultArray dealloc](self, "dealloc");
  }
  else
  {
    objc_sync_exit(query);
  }
}

- (unint64_t)count
{
  return objc_msgSend(self->_query, "resultCount");
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v7;

  if (objc_msgSend(self->_query, "resultCount") <= a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%ld) out of bounds (%ld)"), _NSMethodExceptionProem((objc_class *)self, a2), a3, objc_msgSend(self->_query, "resultCount")), 0);
    objc_exception_throw(v7);
  }
  return (id)objc_msgSend(self->_query, "resultAtIndex:", a3);
}

@end
