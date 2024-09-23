@implementation EMRenameMailboxChangeAction

- (EMRenameMailboxChangeAction)initWithMailbox:(id)a3 newName:(id)a4
{
  id v6;
  void *v7;
  EMRenameMailboxChangeAction *v8;

  v6 = a4;
  objc_msgSend(a3, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EMRenameMailboxChangeAction initWithMailboxObjectID:newName:](self, "initWithMailboxObjectID:newName:", v7, v6);

  return v8;
}

- (EMRenameMailboxChangeAction)initWithMailboxObjectID:(id)a3 newName:(id)a4
{
  id v7;
  EMRenameMailboxChangeAction *v8;
  EMRenameMailboxChangeAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EMRenameMailboxChangeAction;
  v8 = -[EMMailboxChangeAction initWithMailboxObjectID:](&v11, sel_initWithMailboxObjectID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_name, a4);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMRenameMailboxChangeAction)initWithCoder:(id)a3
{
  id v4;
  EMRenameMailboxChangeAction *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMRenameMailboxChangeAction;
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
  v6.super_class = (Class)EMRenameMailboxChangeAction;
  -[EMMailboxChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMRenameMailboxChangeAction name](self, "name");
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
