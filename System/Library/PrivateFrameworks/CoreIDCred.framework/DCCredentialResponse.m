@implementation DCCredentialResponse

- (DCCredentialResponse)initWithResponseData:(id)a3 elementsByNamespace:(id)a4
{
  id v6;
  id v7;
  DCCredentialResponse *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DCCredentialResponse;
  v8 = -[DCCredentialResponse init](&v12, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    -[DCCredentialResponse setResponseData:](v8, "setResponseData:", v9);

    v10 = (void *)objc_msgSend(v7, "copy");
    -[DCCredentialResponse setElementsByNamespace:](v8, "setElementsByNamespace:", v10);

  }
  return v8;
}

- (DCCredentialResponse)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DCCredentialResponse *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_responseData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_elementsByNamespace);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v7 && v11)
  {
    self = -[DCCredentialResponse initWithResponseData:elementsByNamespace:](self, "initWithResponseData:elementsByNamespace:", v7, v11);
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DCCredentialResponse responseData](self, "responseData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_responseData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[DCCredentialResponse elementsByNamespace](self, "elementsByNamespace");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_elementsByNamespace);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (NSDictionary)elementsByNamespace
{
  return self->_elementsByNamespace;
}

- (void)setElementsByNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_elementsByNamespace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsByNamespace, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end
