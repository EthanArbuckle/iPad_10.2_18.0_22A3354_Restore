@implementation CKTransientAttachmentMessagePartChatItem

- (CKTransientAttachmentMessagePartChatItem)initWithParentChatItem:(id)a3
{
  id v5;
  CKTransientAttachmentMessagePartChatItem *v6;
  CKTransientAttachmentMessagePartChatItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTransientAttachmentMessagePartChatItem;
  v6 = -[CKMessagePartChatItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parentGUID, a3);

  return v7;
}

- (id)IMChatItem
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D35978]);
  -[CKTransientAttachmentMessagePartChatItem parentGUID](self, "parentGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGUID:", v4);

  return v5;
}

- (NSString)parentGUID
{
  return self->_parentGUID;
}

- (void)setParentGUID:(id)a3
{
  objc_storeStrong((id *)&self->_parentGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentGUID, 0);
}

@end
