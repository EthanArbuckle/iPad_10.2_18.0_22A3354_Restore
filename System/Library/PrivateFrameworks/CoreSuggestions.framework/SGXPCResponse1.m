@implementation SGXPCResponse1

- (NSSecureCoding)response1
{
  return self->_response1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response1, 0);
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
  v5.super_class = (Class)SGXPCResponse1;
  v4 = a3;
  -[SGXPCResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_response1, CFSTR("response1"), v5.receiver, v5.super_class);

}

- (SGXPCResponse1)initWithCoder:(id)a3
{
  id v4;
  SGXPCResponse1 *v5;
  uint64_t v6;
  NSSecureCoding *response1;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGXPCResponse1;
  v5 = -[SGXPCResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("response1"));
    v6 = objc_claimAutoreleasedReturnValue();
    response1 = v5->_response1;
    v5->_response1 = (NSSecureCoding *)v6;

  }
  return v5;
}

- (void)setResponse1:(id)a3
{
  objc_storeStrong((id *)&self->_response1, a3);
}

+ (id)responseWith:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[2];
  v4[2] = v3;

  return v4;
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
