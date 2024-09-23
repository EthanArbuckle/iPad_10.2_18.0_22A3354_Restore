@implementation IDSOffGridDeliveryQueryResult

- (IDSOffGridDeliveryQueryResult)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryQueryResult;
  return -[IDSOffGridDeliveryQueryResult init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IDSOffGridDeliveryQueryResult uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryQueryResult shortHandle](self, "shortHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IDSOffGridDeliveryQueryResult status](self, "status");
  v7 = -[IDSOffGridDeliveryQueryResult hasUsableSenderKey](self, "hasUsableSenderKey");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSOffGridDeliveryQueryResult %p>: uri %@ short handle %@ status %ld hasUsableSenderKey %@"), self, v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  IDSURI *uri;
  void *v5;
  id v6;

  uri = self->_uri;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", uri, CFSTR("uri"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("status"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_shortHandle, CFSTR("shortHandle"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasUsableSenderKey, CFSTR("hasUsableSenderKey"));

}

- (IDSOffGridDeliveryQueryResult)initWithCoder:(id)a3
{
  id v4;
  IDSOffGridDeliveryQueryResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc_init(IDSOffGridDeliveryQueryResult);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryQueryResult setUri:](v5, "setUri:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryQueryResult setStatus:](v5, "setStatus:", (int)objc_msgSend(v7, "intValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryQueryResult setShortHandle:](v5, "setShortHandle:", v8);

  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasUsableSenderKey"));
  -[IDSOffGridDeliveryQueryResult setHasUsableSenderKey:](v5, "setHasUsableSenderKey:", v9);

  return v5;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
  objc_storeStrong((id *)&self->_uri, a3);
}

- (NSString)shortHandle
{
  return self->_shortHandle;
}

- (void)setShortHandle:(id)a3
{
  objc_storeStrong((id *)&self->_shortHandle, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)hasUsableSenderKey
{
  return self->_hasUsableSenderKey;
}

- (void)setHasUsableSenderKey:(BOOL)a3
{
  self->_hasUsableSenderKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortHandle, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
