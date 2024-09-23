@implementation CATTaskMessageStart

- (CATTaskMessageStart)initWithTaskUUID:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  CATTaskMessageStart *v9;
  CATTaskMessageStart *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskMessageStart.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CATTaskMessageStart;
  v9 = -[CATTaskMessage initWithTaskUUID:](&v13, sel_initWithTaskUUID_, v7);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_request, a4);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageStart)initWithCoder:(id)a3
{
  id v4;
  CATTaskMessageStart *v5;
  void *v6;
  uint64_t v7;
  CATTaskRequest *request;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessageStart;
  v5 = -[CATTaskMessage initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("request"));
    v7 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (CATTaskRequest *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessageStart;
  v4 = a3;
  -[CATTaskMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CATTaskMessageStart request](self, "request", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("request"));

}

- (CATTaskRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
