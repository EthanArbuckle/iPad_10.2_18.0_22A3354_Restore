@implementation EMMessageDeleteAllAction

- (EMMessageDeleteAllAction)initWithMailboxes:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageListItemsToExclude:(id)a6
{
  id v10;
  id v11;
  EMMessageDeleteAllAction *v12;
  uint64_t v13;
  NSArray *mailboxObjectIDs;
  objc_super v16;

  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EMMessageDeleteAllAction;
  v12 = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v16, sel_initWithMessageListItems_origin_actor_, v11, a4, a5);
  if (v12)
  {
    objc_msgSend(v10, "ef_mapSelector:", sel_objectID);
    v13 = objc_claimAutoreleasedReturnValue();
    mailboxObjectIDs = v12->_mailboxObjectIDs;
    v12->_mailboxObjectIDs = (NSArray *)v13;

  }
  return v12;
}

- (int64_t)signpostType
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageDeleteAllAction)initWithCoder:(id)a3
{
  id v4;
  EMMessageDeleteAllAction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *mailboxObjectIDs;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageDeleteAllAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v12, sel_initWithCoder_, v4);
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
  v6.super_class = (Class)EMMessageDeleteAllAction;
  -[EMMessageChangeAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EMMessageDeleteAllAction mailboxObjectIDs](self, "mailboxObjectIDs");
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
