@implementation IMSuggestedReplyMessagePartChatItem

- (IMSuggestedReplyMessagePartChatItem)initWithItem:(id)a3 suggestedReply:(id)a4
{
  id v6;
  id v7;
  IMSuggestedReplyMessagePartChatItem *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IMSuggestedReplyMessagePartChatItem;
  v8 = -[IMChatItem _initWithItem:](&v11, sel__initWithItem_, v6);
  if (v8)
  {
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptChatItem _setGUID:](v8, "_setGUID:", v9);

    objc_storeStrong((id *)&v8->_suggestedReply, a4);
  }

  return v8;
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
      -[IMSuggestedReplyMessagePartChatItem suggestedReply](self, "suggestedReply");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestedReply");
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
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMMessageChatItem messageItem](self, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSuggestedReplyMessagePartChatItem suggestedReply](self, "suggestedReply");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithItem:suggestedReply:", v5, v6);

  return v7;
}

- (IMChipReply)suggestedReply
{
  return self->_suggestedReply;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedReply, 0);
}

@end
