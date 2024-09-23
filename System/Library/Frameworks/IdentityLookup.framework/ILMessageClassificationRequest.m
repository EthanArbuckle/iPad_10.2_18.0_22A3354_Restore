@implementation ILMessageClassificationRequest

- (ILMessageClassificationRequest)initWithMessageCommunications:(id)a3
{
  id v5;
  ILMessageClassificationRequest *v6;
  ILMessageClassificationRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ILMessageClassificationRequest;
  v6 = -[ILMessageClassificationRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_messageCommunications, a3);

  return v7;
}

- (ILMessageClassificationRequest)init
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
  v8.super_class = (Class)ILMessageClassificationRequest;
  -[ILClassificationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILMessageClassificationRequest messageCommunications](self, "messageCommunications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ messageCommunications=%@>"), v4, v5);
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
    && -[ILMessageClassificationRequest isEqualToRequest:](self, "isEqualToRequest:", v4);

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
  -[ILMessageClassificationRequest messageCommunications](self, "messageCommunications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageCommunications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToArray:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[ILMessageClassificationRequest messageCommunications](self, "messageCommunications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "messageCommunications");
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

  -[ILMessageClassificationRequest messageCommunications](self, "messageCommunications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageClassificationRequest)initWithCoder:(id)a3
{
  id v4;
  ILMessageClassificationRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *messageCommunications;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ILMessageClassificationRequest;
  v5 = -[ILClassificationRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_messageCommunications);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    messageCommunications = v5->_messageCommunications;
    v5->_messageCommunications = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ILMessageClassificationRequest;
  v4 = a3;
  -[ILClassificationRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ILMessageClassificationRequest messageCommunications](self, "messageCommunications", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messageCommunications);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSArray)messageCommunications
{
  return self->_messageCommunications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageCommunications, 0);
}

@end
