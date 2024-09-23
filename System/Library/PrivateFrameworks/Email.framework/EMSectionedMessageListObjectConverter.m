@implementation EMSectionedMessageListObjectConverter

+ (id)itemIDForItemID:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  _EMSectionedMessageListItemID *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[_EMSectionedMessageListItemID initWithItemID:sectionID:]([_EMSectionedMessageListItemID alloc], "initWithItemID:sectionID:", v5, v6);

  return v7;
}

+ (id)objectIDForObjectID:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  _EMSectionedObjectID *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[_EMSectionedObjectID initWithObjectID:sectionID:]([_EMSectionedObjectID alloc], "initWithObjectID:sectionID:", v5, v6);

  return v7;
}

+ (id)messageListItemForMessageListItem:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  _EMSectionedMessageListItem *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[_EMSectionedMessageListItem initWithMessageListItem:sectionID:]([_EMSectionedMessageListItem alloc], "initWithMessageListItem:sectionID:", v5, v6);

  return v7;
}

@end
