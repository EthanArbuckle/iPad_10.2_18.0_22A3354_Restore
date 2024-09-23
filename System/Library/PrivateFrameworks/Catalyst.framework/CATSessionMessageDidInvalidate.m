@implementation CATSessionMessageDidInvalidate

- (CATSessionMessageDidInvalidate)initWithError:(id)a3
{
  id v5;
  CATSessionMessageDidInvalidate *v6;
  CATSessionMessageDidInvalidate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATSessionMessageDidInvalidate;
  v6 = -[CATMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATSessionMessageDidInvalidate)initWithCoder:(id)a3
{
  id v4;
  CATSessionMessageDidInvalidate *v5;
  void *v6;
  uint64_t v7;
  NSError *error;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATSessionMessageDidInvalidate;
  v5 = -[CATMessage initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("error"));
    v7 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATSessionMessageDidInvalidate;
  v4 = a3;
  -[CATMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CATSessionMessageDidInvalidate error](self, "error", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
