@implementation CATIDSServiceConnectionMetadata

- (CATIDSServiceConnectionMetadata)initWithConnectionIdentifier:(id)a3 destinationAppleID:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  CATIDSServiceConnectionMetadata *v12;
  CATIDSServiceConnectionMetadata *v13;
  uint64_t v14;
  NSString *destinationAppleID;
  uint64_t v16;
  NSDictionary *userInfo;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CATIDSServiceConnectionMetadata;
  v12 = -[CATIDSServiceConnectionMetadata init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connectionIdentifier, a3);
    v14 = objc_msgSend(v10, "copy");
    destinationAppleID = v13->_destinationAppleID;
    v13->_destinationAppleID = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v16;

  }
  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATIDSServiceConnectionMetadata connectionIdentifier](self, "connectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATIDSServiceConnectionMetadata destinationAppleID](self, "destinationAppleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATIDSServiceConnectionMetadata userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { connectionIdentifier = %@, destinationAppleID = %@ , userInfo = %@ }>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CATIDSServiceConnectionMetadata connectionIdentifier](self, "connectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CATIDSServiceConnectionMetadata destinationAppleID](self, "destinationAppleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CATIDSServiceConnectionMetadata userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CATIDSServiceConnectionMetadata *v4;
  CATIDSServiceConnectionMetadata *v5;
  CATIDSServiceConnectionMetadata *v6;
  BOOL v7;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v4 = (CATIDSServiceConnectionMetadata *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    v7 = 1;
    goto LABEL_9;
  }
  if (-[CATIDSServiceConnectionMetadata isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CATIDSServiceConnectionMetadata isEqual:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("CATIDSServiceConnectionMetadata.m"), 71, CFSTR("expected %@, got %@"), v12, v14);

    }
    v7 = -[CATIDSServiceConnectionMetadata isEqualToMetadata:](self, "isEqualToMetadata:", v6);

  }
  else
  {
LABEL_7:
    v7 = 0;
  }
LABEL_9:

  return v7;
}

- (BOOL)isEqualToMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  -[CATIDSServiceConnectionMetadata connectionIdentifier](self, "connectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    v17 = 0;
  }
  else
  {
    -[CATIDSServiceConnectionMetadata destinationAppleID](self, "destinationAppleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationAppleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    if (v12 | v13 && (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, !v14))
    {
      v17 = 0;
    }
    else
    {
      -[CATIDSServiceConnectionMetadata userInfo](self, "userInfo");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v15 | v16)
        v17 = objc_msgSend((id)v15, "isEqual:", v16);
      else
        v17 = 1;

    }
  }

  return v17;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSString)destinationAppleID
{
  return self->_destinationAppleID;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_destinationAppleID, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end
