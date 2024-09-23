@implementation CKPinnedConversationContactItemFromHandle

- (CKPinnedConversationContactItemFromHandle)initWithEntity:(id)a3
{
  id v5;
  CKPinnedConversationContactItemFromHandle *v6;
  CKPinnedConversationContactItemFromHandle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationContactItemFromHandle;
  v6 = -[CKPinnedConversationContactItemFromHandle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entity, a3);

  return v7;
}

- (NSString)contactItemIdentifier
{
  return (NSString *)-[CKEntity pinnedConversationContactItemIdentifier](self->_entity, "pinnedConversationContactItemIdentifier");
}

- (id)cnContactWithKeys:(id)a3
{
  return -[CKEntity cnContactWithKeys:](self->_entity, "cnContactWithKeys:", a3);
}

- (id)contactItemView
{
  CKPinnedConversationContactItemAvatarView *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CKPinnedConversationContactItemAvatarView);
  objc_msgSend(MEMORY[0x1E0C97468], "descriptorForRequiredKeysWithThreeDTouchEnabled:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEntity cnContactWithKeys:](self->_entity, "cnContactWithKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarView setContact:](v3, "setContact:", v6);
  -[CKPinnedConversationContactItemAvatarView setPinnedConversationContactItem:](v3, "setPinnedConversationContactItem:", self);

  return v3;
}

- (CKEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(double)a3
{
  self->_contentScale = a3;
}

- (int64_t)contactItemAlignment
{
  return self->_contactItemAlignment;
}

- (void)setContactItemAlignment:(int64_t)a3
{
  self->_contactItemAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
