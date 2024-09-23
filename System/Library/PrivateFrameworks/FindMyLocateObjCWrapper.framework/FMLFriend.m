@implementation FMLFriend

- (FMLFriend)initWithHandle:(id)a3 handleType:(int64_t)a4 createDate:(id)a5 expiry:(id)a6 origin:(int64_t)a7 originatedFromTheSameClient:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  FMLFriend *v17;
  FMLFriend *v18;
  objc_super v20;

  v8 = a8;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FMLFriend;
  v17 = -[FMLFriend init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[FMLFriend setHandle:](v17, "setHandle:", v14);
    -[FMLFriend setHandleType:](v18, "setHandleType:", a4);
    -[FMLFriend setCreatedAt:](v18, "setCreatedAt:", v15);
    -[FMLFriend setExpiry:](v18, "setExpiry:", v16);
    -[FMLFriend setOrigin:](v18, "setOrigin:", a7);
    -[FMLFriend setOriginatedFromTheSameClient:](v18, "setOriginatedFromTheSameClient:", v8);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMLFriend comparisonIdentifier](self, "comparisonIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comparisonIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)comparisonIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v13 = (void *)MEMORY[0x24BDD17C8];
  -[FMLFriend handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FMLFriend handleType](self, "handleType");
  -[FMLFriend createdAt](self, "createdAt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLFriend expiry](self, "expiry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Handle:%@ Handle Type:%ld CreateAt:%@ expiry:%@ origin:%ld originatedFromTheSameClient:%d"), v5, v6, v8, v10, -[FMLFriend origin](self, "origin"), -[FMLFriend originatedFromTheSameClient](self, "originatedFromTheSameClient"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FMLFriend comparisonIdentifier](self, "comparisonIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FMLFriend comparisonIdentifier](self, "comparisonIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[FMLFriend comparisonIdentifier](self, "comparisonIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@]>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FMLHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setExpiry:(id)a3
{
  objc_storeStrong((id *)&self->_expiry, a3);
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (BOOL)originatedFromTheSameClient
{
  return self->_originatedFromTheSameClient;
}

- (void)setOriginatedFromTheSameClient:(BOOL)a3
{
  self->_originatedFromTheSameClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
