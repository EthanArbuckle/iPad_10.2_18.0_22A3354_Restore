@implementation SGXPCResponse3

- (NSSecureCoding)response3
{
  return self->_response3;
}

- (id)response2
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGXPCResponse3;
  -[SGXPCResponse2 response2](&v3, sel_response2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)response1
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGXPCResponse3;
  -[SGXPCResponse2 response1](&v3, sel_response1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGXPCResponse3;
  v4 = a3;
  -[SGXPCResponse2 encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_response3, CFSTR("response3"), v5.receiver, v5.super_class);

}

- (SGXPCResponse3)initWithCoder:(id)a3
{
  id v4;
  SGXPCResponse3 *v5;
  uint64_t v6;
  NSSecureCoding *response3;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGXPCResponse3;
  v5 = -[SGXPCResponse2 initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("response3"));
    v6 = objc_claimAutoreleasedReturnValue();
    response3 = v5->_response3;
    v5->_response3 = (NSSecureCoding *)v6;

  }
  return v5;
}

+ (id)responseWith:(id)a3 also:(id)a4 also:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (_QWORD *)objc_opt_new();
  objc_msgSend(v10, "setResponse1:", v9);

  objc_msgSend(v10, "setResponse2:", v8);
  v11 = (void *)v10[4];
  v10[4] = v7;

  return v10;
}

+ (id)responseWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithError:", v4);

  return v5;
}

@end
