@implementation SGXPCResponse2

- (NSSecureCoding)response2
{
  return self->_response2;
}

- (id)response1
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGXPCResponse2;
  -[SGXPCResponse1 response1](&v3, sel_response1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response2, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGXPCResponse2;
  v4 = a3;
  -[SGXPCResponse1 encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_response2, CFSTR("response2"), v5.receiver, v5.super_class);

}

- (SGXPCResponse2)initWithCoder:(id)a3
{
  id v4;
  SGXPCResponse2 *v5;
  uint64_t v6;
  NSSecureCoding *response2;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGXPCResponse2;
  v5 = -[SGXPCResponse1 initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("response2"));
    v6 = objc_claimAutoreleasedReturnValue();
    response2 = v5->_response2;
    v5->_response2 = (NSSecureCoding *)v6;

  }
  return v5;
}

- (void)setResponse2:(id)a3
{
  objc_storeStrong((id *)&self->_response2, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)responseWith:(id)a3 also:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (_QWORD *)objc_opt_new();
  objc_msgSend(v7, "setResponse1:", v6);

  v8 = (void *)v7[3];
  v7[3] = v5;

  return v7;
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
