@implementation MSMessageListItemSelection

- (MSMessageListItemSelection)initWithMessageListItems:(id)a3
{
  id v5;
  MSMessageListItemSelection *v6;
  MSMessageListItemSelection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSMessageListItemSelection;
  v6 = -[MSMessageListItemSelection init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageListItems, a3);
    v7->_isSelectAll = 0;
  }

  return v7;
}

- (MSMessageListItemSelection)initWithMailboxes:(id)a3 excludedMessageListItems:(id)a4
{
  id v7;
  MSMessageListItemSelection *v8;
  MSMessageListItemSelection *v9;

  v7 = a3;
  v8 = -[MSMessageListItemSelection initWithMessageListItems:](self, "initWithMessageListItems:", a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mailboxes, a3);
    v9->_isSelectAll = 1;
  }

  return v9;
}

- (NSArray)messageListItems
{
  return self->_messageListItems;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (BOOL)isSelectAll
{
  return self->_isSelectAll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_messageListItems, 0);
}

@end
