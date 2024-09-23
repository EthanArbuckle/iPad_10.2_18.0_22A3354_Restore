@implementation EMMessageFlagChangeAllAction

- (EMMessageFlagChangeAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 flagChange:(id)a5 origin:(int64_t)a6 actor:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  EMMessageFlagChangeAllAction *v15;
  uint64_t v16;
  NSArray *mailboxObjectIDs;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageFlagChangeAllAction;
  v15 = -[EMMessageFlagChangeAction initWithMessageListItems:origin:actor:flagChange:](&v19, sel_initWithMessageListItems_origin_actor_flagChange_, v13, a6, a7, v14);
  if (v15)
  {
    objc_msgSend(v12, "ef_mapSelector:", sel_objectID);
    v16 = objc_claimAutoreleasedReturnValue();
    mailboxObjectIDs = v15->_mailboxObjectIDs;
    v15->_mailboxObjectIDs = (NSArray *)v16;

  }
  return v15;
}

- (int64_t)signpostType
{
  return 7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageFlagChangeAllAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageFlagChangeAllAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *mailboxObjectIDs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageFlagChangeAllAction;
  v5 = -[EMMessageFlagChangeAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_mailboxObjectIDs"));
    v9 = objc_claimAutoreleasedReturnValue();
    mailboxObjectIDs = v5->_mailboxObjectIDs;
    v5->_mailboxObjectIDs = (NSArray *)v9;

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
  v6.super_class = (Class)EMMessageFlagChangeAllAction;
  -[EMMessageFlagChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMessageFlagChangeAllAction mailboxObjectIDs](self, "mailboxObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_mailboxObjectIDs"));

}

- (NSArray)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
}

@end
