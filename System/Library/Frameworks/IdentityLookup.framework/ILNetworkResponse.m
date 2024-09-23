@implementation ILNetworkResponse

- (ILNetworkResponse)initWithURLResponse:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  ILNetworkResponse *v8;
  uint64_t v9;
  NSHTTPURLResponse *urlResponse;
  uint64_t v11;
  NSData *data;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ILNetworkResponse;
  v8 = -[ILNetworkResponse init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    urlResponse = v8->_urlResponse;
    v8->_urlResponse = (NSHTTPURLResponse *)v9;

    v11 = objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ILNetworkResponse urlResponse](self, "urlResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILNetworkResponse data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p urlResponse=%@ data.length=%lu>"), v4, self, v5, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILNetworkResponse)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ILNetworkResponse *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_urlResponse);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_data);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ILNetworkResponse initWithURLResponse:data:](self, "initWithURLResponse:data:", v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ILNetworkResponse urlResponse](self, "urlResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_urlResponse);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ILNetworkResponse data](self, "data");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_data);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (NSHTTPURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (void)setUrlResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
}

@end
