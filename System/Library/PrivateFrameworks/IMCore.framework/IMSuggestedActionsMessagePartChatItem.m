@implementation IMSuggestedActionsMessagePartChatItem

- (IMSuggestedActionsMessagePartChatItem)initWithItem:(id)a3 suggestedActionsList:(id)a4
{
  id v6;
  id v7;
  IMSuggestedActionsMessagePartChatItem *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSuggestedActionsMessagePartChatItem;
  v8 = -[IMChatItem _initWithItem:](&v12, sel__initWithItem_, v6);
  if (v8)
  {
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)sub_1A2132A84();
    -[IMTranscriptChatItem _setGUID:](v8, "_setGUID:", v10);

    -[IMMessagePartChatItem setSuggestedActionsList:](v8, "setSuggestedActionsList:", v7);
  }

  return v8;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IMTranscriptChatItem guid](self, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[IMMessagePartChatItem suggestedActionsList](self, "suggestedActionsList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestedActionsList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IMSuggestedActionsMessagePartChatItem *v4;
  void *v5;
  void *v6;
  IMSuggestedActionsMessagePartChatItem *v7;

  v4 = [IMSuggestedActionsMessagePartChatItem alloc];
  -[IMMessageChatItem messageItem](self, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartChatItem suggestedActionsList](self, "suggestedActionsList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMSuggestedActionsMessagePartChatItem initWithItem:suggestedActionsList:](v4, "initWithItem:suggestedActionsList:", v5, v6);

  return v7;
}

@end
