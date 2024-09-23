@implementation CRKIDSMessageOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[CRKIDSMessageOptions shouldFireAndForget](self, "shouldFireAndForget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("fireAndForget"));

  -[CRKIDSMessageOptions deliveryTimeout](self, "deliveryTimeout");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("deliveryTimeout"));

}

- (CRKIDSMessageOptions)initWithCoder:(id)a3
{
  id v4;
  CRKIDSMessageOptions *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSNumber *deliveryTimeout;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKIDSMessageOptions;
  v5 = -[CRKIDSMessageOptions init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fireAndForget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fireAndForget = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("deliveryTimeout"));
    v8 = objc_claimAutoreleasedReturnValue();
    deliveryTimeout = v5->_deliveryTimeout;
    v5->_deliveryTimeout = (NSNumber *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFireAndForget:", -[CRKIDSMessageOptions shouldFireAndForget](self, "shouldFireAndForget"));
  -[CRKIDSMessageOptions deliveryTimeout](self, "deliveryTimeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeliveryTimeout:", v5);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[CRKIDSMessageOptions shouldFireAndForget](self, "shouldFireAndForget");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v7 = v6;
  -[CRKIDSMessageOptions deliveryTimeout](self, "deliveryTimeout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { fireAndForget = %@, deliveryTimeout = %@ }>"), v4, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)shouldFireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (NSNumber)deliveryTimeout
{
  return self->_deliveryTimeout;
}

- (void)setDeliveryTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryTimeout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryTimeout, 0);
}

@end
