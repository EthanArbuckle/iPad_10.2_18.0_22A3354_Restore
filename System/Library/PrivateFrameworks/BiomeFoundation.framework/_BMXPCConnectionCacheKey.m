@implementation _BMXPCConnectionCacheKey

- (_BMXPCConnectionCacheKey)initWithServiceType:(unint64_t)a3 domain:(unint64_t)a4 user:(unsigned int)a5 useCase:(id)a6 flags:(unint64_t)a7
{
  id v13;
  _BMXPCConnectionCacheKey *v14;
  _BMXPCConnectionCacheKey *v15;
  objc_super v17;

  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_BMXPCConnectionCacheKey;
  v14 = -[_BMXPCConnectionCacheKey init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_serviceType = a3;
    v14->_domain = a4;
    v14->_user = a5;
    objc_storeStrong((id *)&v14->_useCase, a6);
    v15->_flags = a7;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  void *v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_serviceType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_domain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_user);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_useCase, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_flags);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _BMXPCConnectionCacheKey *v4;
  _BMXPCConnectionCacheKey *v5;
  _BMXPCConnectionCacheKey *v6;
  NSString *useCase;
  BOOL v8;

  v4 = (_BMXPCConnectionCacheKey *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      v8 = self->_serviceType == v5->_serviceType
        && self->_domain == v5->_domain
        && self->_user == v5->_user
        && ((useCase = self->_useCase, useCase == v6->_useCase)
         || -[NSString isEqual:](useCase, "isEqual:"))
        && self->_flags == v6->_flags;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (unsigned)user
{
  return self->_user;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
}

@end
