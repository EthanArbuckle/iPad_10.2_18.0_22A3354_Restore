@implementation BSXPCServiceConnectionRootContext

- (BOOL)isRoot
{
  return 1;
}

- (id)endpointDescription
{
  return self->_eDesc;
}

- (_QWORD)childContextWithRemoteIdentifier:(_QWORD *)a1
{
  BSXPCServiceConnectionChildContext *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  if (a1)
  {
    v4 = [BSXPCServiceConnectionChildContext alloc];
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_msgSend(a1, "isClient");
    v7 = 83;
    if (v6)
      v7 = 67;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[%c:%llx-%llxr]"), v7, a1[2], a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BSXPCServiceConnectionChildContext _initWithParent:identifier:remote:proem:](v4, a1, a2, 1, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_QWORD)uniqueChildContext
{
  _QWORD *v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  BSXPCServiceConnectionChildContext *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  if (a1)
  {
    v2 = (unint64_t *)(a1 + 24);
    do
    {
      v3 = __ldxr(v2);
      v4 = v3 + 1;
    }
    while (__stxr(v3 + 1, v2));
    v5 = [BSXPCServiceConnectionChildContext alloc];
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_msgSend(v1, "isClient");
    v8 = 83;
    if (v7)
      v8 = 67;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%c:%llx-%llx]"), v8, v1[2], v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = -[BSXPCServiceConnectionChildContext _initWithParent:identifier:remote:proem:](v5, v1, v4, 0, v9);

  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eDesc, 0);
}

- (_QWORD)_initWithType:(void *)a3 eDesc:
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  if (a1)
  {
    do
    {
      v6 = __ldxr(&_initWithType_eDesc____uniqueCounter);
      v7 = v6 + 1;
    }
    while (__stxr(v6 + 1, &_initWithType_eDesc____uniqueCounter));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%c:%llx]"), a2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = -[BSXPCServiceConnectionContext _initWithProem:](a1, v8);

    if (a1)
    {
      a1[2] = v7;
      v9 = objc_msgSend(v5, "copy");
      v10 = (void *)a1[4];
      a1[4] = v9;

    }
  }

  return a1;
}

- (unint64_t)hash
{
  return self->_unique;
}

- (BOOL)isEqual:(id)a3
{
  BSXPCServiceConnectionRootContext *v4;
  BOOL v5;

  v4 = (BSXPCServiceConnectionRootContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_unique == v4->_unique;
  }

  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[BSXPCServiceConnectionContext isClient](self, "isClient");
  v6 = CFSTR("server");
  if (v5)
    v6 = CFSTR("client");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %llx %@>"), v4, self, v6, self->_unique, self->_eDesc);
}

@end
