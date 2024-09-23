@implementation EMMoveMailboxChangeAction

- (EMMoveMailboxChangeAction)initWithMailbox:(id)a3 newParent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  EMMoveMailboxChangeAction *v9;

  v6 = a4;
  objc_msgSend(a3, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EMMoveMailboxChangeAction initWithMailboxObjectID:newParentMailboxID:](self, "initWithMailboxObjectID:newParentMailboxID:", v7, v8);

  return v9;
}

- (EMMoveMailboxChangeAction)initWithMailboxObjectID:(id)a3 newParentMailboxID:(id)a4
{
  id v7;
  EMMoveMailboxChangeAction *v8;
  EMMoveMailboxChangeAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EMMoveMailboxChangeAction;
  v8 = -[EMMailboxChangeAction initWithMailboxObjectID:](&v11, sel_initWithMailboxObjectID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_parentMailboxID, a4);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMoveMailboxChangeAction)initWithCoder:(id)a3
{
  id v4;
  EMMoveMailboxChangeAction *v5;
  uint64_t v6;
  EMMailboxObjectID *parentMailboxID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMoveMailboxChangeAction;
  v5 = -[EMMailboxChangeAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_parentMailboxID"));
    v6 = objc_claimAutoreleasedReturnValue();
    parentMailboxID = v5->_parentMailboxID;
    v5->_parentMailboxID = (EMMailboxObjectID *)v6;

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
  v6.super_class = (Class)EMMoveMailboxChangeAction;
  -[EMMailboxChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMoveMailboxChangeAction parentMailboxID](self, "parentMailboxID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_parentMailboxID"));

}

- (EMMailboxObjectID)parentMailboxID
{
  return self->_parentMailboxID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentMailboxID, 0);
}

@end
