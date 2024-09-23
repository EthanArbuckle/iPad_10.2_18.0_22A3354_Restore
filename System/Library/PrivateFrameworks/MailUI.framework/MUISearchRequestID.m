@implementation MUISearchRequestID

- (MUISearchRequestID)init
{
  MUISearchRequestID *result;
  unsigned int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUISearchRequestID;
  result = -[MUISearchRequestID init](&v4, sel_init);
  if (result)
  {
    do
      v3 = __ldaxr((unsigned int *)&init_next);
    while (__stlxr(v3 + 1, (unsigned int *)&init_next));
    result->_underlying = v3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[MUISearchRequestID isEqualToID:](self, "isEqualToID:", v4);

  return v5;
}

- (BOOL)isEqualToID:(id)a3
{
  unsigned int underlying;

  if (!a3)
    return 0;
  if (self)
    underlying = self->_underlying;
  else
    underlying = 0;
  return underlying == *((_DWORD *)a3 + 2);
}

- (unint64_t)hash
{
  if (self)
    return *(unsigned int *)(self + 8);
  return self;
}

- (id)description
{
  MUISearchRequestID *underlying;

  underlying = self;
  if (self)
    underlying = (MUISearchRequestID *)self->_underlying;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), underlying);
}

@end
