@implementation NSSQLCountRequestContext

- (id)_createStatement
{
  NSSQLCountRequestContext *v2;

  v2 = self;
  if (self)
    self = (NSSQLCountRequestContext *)self->super.super._sqlCore;
  return -[NSSQLiteAdapter newCountStatementWithFetchRequestContext:](-[NSSQLCountRequestContext adapter](self, "adapter"), v2);
}

- (BOOL)executeRequestCore:(id *)a3
{
  const char *v5;

  -[NSSQLStoreRequestContext setResult:](self, "setResult:", _executeCountRequest((uint64_t)self));
  if (a3 && *a3)
  {
    if (!self)
      return -[NSSQLStoreRequestContext result](self, "result") != 0;
    objc_setProperty_nonatomic(self, v5, *a3, 40);
  }
  else if (!self)
  {
    return -[NSSQLStoreRequestContext result](self, "result") != 0;
  }
  if (self->super.super._exception || self->super.super._error)
    return 0;
  return -[NSSQLStoreRequestContext result](self, "result") != 0;
}

@end
