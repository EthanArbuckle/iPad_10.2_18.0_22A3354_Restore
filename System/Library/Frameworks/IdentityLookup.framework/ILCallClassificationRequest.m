@implementation ILCallClassificationRequest

- (ILCallClassificationRequest)initWithCallCommunications:(id)a3
{
  id v5;
  ILCallClassificationRequest *v6;
  ILCallClassificationRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILCallClassificationRequest;
  v6 = -[ILCallClassificationRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_callCommunications, a3);

  return v7;
}

- (ILCallClassificationRequest)init
{

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ILCallClassificationRequest;
  -[ILClassificationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILCallClassificationRequest callCommunications](self, "callCommunications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ callCommunications=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILCallClassificationRequest isEqualToRequest:](self, "isEqualToRequest:", v4);

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ILCallClassificationRequest callCommunications](self, "callCommunications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callCommunications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToArray:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[ILCallClassificationRequest callCommunications](self, "callCommunications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "callCommunications");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9 == 0;

    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ILCallClassificationRequest callCommunications](self, "callCommunications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILCallClassificationRequest)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ILCallClassificationRequest *v10;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callCommunications);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ILCallClassificationRequest initWithCallCommunications:](self, "initWithCallCommunications:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ILCallClassificationRequest;
  v4 = a3;
  -[ILClassificationRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ILCallClassificationRequest callCommunications](self, "callCommunications", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callCommunications);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSArray)callCommunications
{
  return self->_callCommunications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCommunications, 0);
}

@end
