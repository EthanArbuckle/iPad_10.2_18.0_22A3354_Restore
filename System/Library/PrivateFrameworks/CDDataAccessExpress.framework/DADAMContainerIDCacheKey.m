@implementation DADAMContainerIDCacheKey

- (DADAMContainerIDCacheKey)initWithAccountID:(id)a3 andDataclass:(int64_t)a4
{
  id v7;
  DADAMContainerIDCacheKey *v8;
  DADAMContainerIDCacheKey *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DADAMContainerIDCacheKey;
  v8 = -[DADAMContainerIDCacheKey init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountID, a3);
    v9->_dataclass = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accountID;
  void *v6;
  int64_t dataclass;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accountID = self->_accountID;
    objc_msgSend(v4, "accountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](accountID, "isEqualToString:", v6))
    {
      dataclass = self->_dataclass;
      v8 = dataclass == objc_msgSend(v4, "dataclass");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_dataclass + -[NSString hash](self->_accountID, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DADAMContainerIDCacheKey initWithAccountID:andDataclass:](+[DADAMContainerIDCacheKey allocWithZone:](DADAMContainerIDCacheKey, "allocWithZone:", a3), "initWithAccountID:andDataclass:", self->_accountID, self->_dataclass);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> Account ID: %@, data class: %ld"), objc_opt_class(), self, self->_accountID, self->_dataclass);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (int64_t)dataclass
{
  return self->_dataclass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
