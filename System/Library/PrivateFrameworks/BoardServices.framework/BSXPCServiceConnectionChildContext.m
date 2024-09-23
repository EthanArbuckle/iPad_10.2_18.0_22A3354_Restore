@implementation BSXPCServiceConnectionChildContext

- (BOOL)isChild
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
}

- (BOOL)isServer
{
  return -[BSXPCServiceConnectionContext isServer](self->_parent, "isServer");
}

- (BOOL)isClient
{
  return -[BSXPCServiceConnectionContext isClient](self->_parent, "isClient");
}

- (id)endpointDescription
{
  return -[BSXPCServiceConnectionRootContext endpointDescription](self->_parent, "endpointDescription");
}

- (_QWORD)_initWithParent:(uint64_t)a3 identifier:(char)a4 remote:(void *)a5 proem:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v9 = a2;
  v10 = a5;
  if (a1)
  {
    a1 = -[BSXPCServiceConnectionContext _initWithProem:](a1, v10);
    if (a1)
    {
      v11 = objc_msgSend(v9, "copy");
      v12 = (void *)a1[2];
      a1[2] = v11;

      a1[4] = a3;
      *((_BYTE *)a1 + 24) = a4;
    }
  }

  return a1;
}

- (BOOL)isNonLaunching
{
  return -[BSXPCServiceConnectionContext isNonLaunching](self->_parent, "isNonLaunching");
}

- (unint64_t)hash
{
  return -[BSXPCServiceConnectionRootContext hash](self->_parent, "hash") ^ (self->_identifier << 32);
}

- (BOOL)isEqual:(id)a3
{
  BSXPCServiceConnectionChildContext *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BSXPCServiceConnectionChildContext *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && BSEqualObjects()
      && self->_identifier == v4->_identifier
      && self->_remote == v4->_remote;
  }

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  unint64_t identifier;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_remote)
    v5 = CFSTR("remote ");
  else
    v5 = &stru_1E39106C8;
  identifier = self->_identifier;
  -[BSXPCServiceConnectionRootContext debugDescription](self->_parent, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@%llx>on%@"), v4, self, v5, identifier, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
