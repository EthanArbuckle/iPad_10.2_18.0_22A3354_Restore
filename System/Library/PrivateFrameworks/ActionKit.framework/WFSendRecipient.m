@implementation WFSendRecipient

- (WFSendRecipient)initWithName:(id)a3 address:(id)a4
{
  id v6;
  id v7;
  WFSendRecipient *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *address;
  WFSendRecipient *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFSendRecipient;
  v8 = -[WFSendRecipient init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1690], "controlCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formUnionWithCharacterSet:", v10);

    objc_msgSend(MEMORY[0x24BDD14A8], "nonBaseCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formUnionWithCharacterSet:", v11);

    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v12;

    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    address = v8->_address;
    v8->_address = (NSString *)v14;

    v16 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return v3 ^ -[NSString hash](self->_address, "hash") ^ 0x12399832;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFSendRecipient name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
        {
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }
        v10 = objc_msgSend(v7, "isEqualToString:", v8);

        if (!v10)
          goto LABEL_17;
      }
      -[WFSendRecipient address](self, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      v15 = v14;
      v11 = v15;
      if (v12 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v12 && v15)
          LOBYTE(v10) = objc_msgSend(v12, "isEqualToString:", v15);
      }

      goto LABEL_16;
    }
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (int64_t)contactType
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)MEMORY[0x24BE19408];
  -[WFSendRecipient address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "predictedTypeForHandleValue:", v3);

  return v4;
}

- (id)recipientContentItem
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[WFSendRecipient contactType](self, "contactType");
  if (v3 == 2)
  {
    v8 = (void *)MEMORY[0x24BE19450];
    -[WFSendRecipient address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSendRecipient name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemWithObject:named:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 == 1)
    {
      v4 = (void *)MEMORY[0x24BE19450];
      v11 = (void *)MEMORY[0x24BE194E8];
      -[WFSendRecipient address](self, "address");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addressWithEmailAddress:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3)
      {
        v10 = 0;
        return v10;
      }
      v4 = (void *)MEMORY[0x24BE19450];
      v5 = (void *)MEMORY[0x24BE195B0];
      -[WFSendRecipient address](self, "address");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "phoneNumberWithPhoneNumberString:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v7;
    -[WFSendRecipient name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemWithObject:named:", v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (WFSendRecipient)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFSendRecipient *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFSendRecipient initWithName:address:](self, "initWithName:address:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFSendRecipient name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[WFSendRecipient address](self, "address");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("address"));

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
