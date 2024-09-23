@implementation IMScheduledSectionLabelChatItem

- (IMScheduledSectionLabelChatItem)initWithAssociatedDateChatItem:(id)a3
{
  id v4;
  IMScheduledSectionLabelChatItem *v5;
  IMScheduledSectionLabelChatItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMScheduledSectionLabelChatItem;
  v5 = -[IMScheduledSectionLabelChatItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[IMScheduledSectionLabelChatItem setDateChatItem:](v5, "setDateChatItem:", v4);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IMScheduledSectionLabelChatItem dateChatItem](self, "dateChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToScheduledLabelChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMScheduledSectionLabelChatItem dateChatItem](self, "dateChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IMScheduledSectionLabelChatItem isEqualToScheduledLabelChatItem:](self, "isEqualToScheduledLabelChatItem:", v4);

  return v5;
}

- (IMScheduledSectionDateChatItem)dateChatItem
{
  return self->dateChatItem;
}

- (void)setDateChatItem:(id)a3
{
  objc_storeStrong((id *)&self->dateChatItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dateChatItem, 0);
}

@end
