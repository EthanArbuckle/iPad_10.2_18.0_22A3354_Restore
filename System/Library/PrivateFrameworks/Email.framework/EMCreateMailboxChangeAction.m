@implementation EMCreateMailboxChangeAction

- (EMCreateMailboxChangeAction)initWithMailboxName:(id)a3 parentMailbox:(id)a4
{
  id v6;
  void *v7;
  EMCreateMailboxChangeAction *v8;

  v6 = a3;
  objc_msgSend(a4, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EMCreateMailboxChangeAction initWithMailboxName:parentMailboxID:](self, "initWithMailboxName:parentMailboxID:", v6, v7);

  return v8;
}

- (EMCreateMailboxChangeAction)initWithMailboxName:(id)a3 parentMailboxID:(id)a4
{
  id v7;
  EMCreateMailboxChangeAction *v8;
  EMCreateMailboxChangeAction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMCreateMailboxChangeAction;
  v8 = -[EMMailboxChangeAction initWithMailboxObjectID:](&v11, sel_initWithMailboxObjectID_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_name, a3);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMCreateMailboxChangeAction)initWithCoder:(id)a3
{
  id v4;
  EMCreateMailboxChangeAction *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMCreateMailboxChangeAction;
  v5 = -[EMMailboxChangeAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMCreateMailboxChangeAction;
  -[EMMailboxChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMCreateMailboxChangeAction name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_name"));

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
