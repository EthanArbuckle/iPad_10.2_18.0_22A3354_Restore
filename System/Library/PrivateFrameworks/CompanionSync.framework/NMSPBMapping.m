@implementation NMSPBMapping

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)NMSPBMapping;
  -[NMSPBMapping description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[NMSPBMapping requestClass](self, "requestClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSPBMapping responseClass](self, "responseClass"))
  {
    NSStringFromClass(-[NMSPBMapping responseClass](self, "responseClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {Request=%@, Response=%@}"), v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {Request=%@, Response=%@}"), v4, v5, CFSTR("(Nil)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (Class)requestClass
{
  return self->_requestClass;
}

- (void)setRequestClass:(Class)a3
{
  objc_storeStrong((id *)&self->_requestClass, a3);
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (void)setResponseClass:(Class)a3
{
  objc_storeStrong((id *)&self->_responseClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong((id *)&self->_requestClass, 0);
}

@end
