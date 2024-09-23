@implementation IMSuggestedRepliesMessagePartChatItem

- (IMSuggestedRepliesMessagePartChatItem)initWithItem:(id)a3 suggestedRepliesList:(id)a4 selectedIndex:(int64_t)a5
{
  id v8;
  id v9;
  IMSuggestedRepliesMessagePartChatItem *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMSuggestedRepliesMessagePartChatItem;
  v10 = -[IMChatItem _initWithItem:](&v14, sel__initWithItem_, v8);
  if (v10)
  {
    objc_msgSend(v8, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("lre:"), "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptChatItem _setGUID:](v10, "_setGUID:", v12);

    objc_storeStrong((id *)&v10->_suggestedRepliesList, a4);
    v10->_selectedIndex = a5;
  }

  return v10;
}

+ (id)suggestedRepliesChatItemGUIDPrefix
{
  return CFSTR("lre:");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  BOOL v11;

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
      -[IMSuggestedRepliesMessagePartChatItem suggestedRepliesList](self, "suggestedRepliesList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestedRepliesList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        v10 = -[IMSuggestedRepliesMessagePartChatItem selectedIndex](self, "selectedIndex");
        v11 = v10 == objc_msgSend(v5, "selectedIndex");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
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
  -[IMSuggestedRepliesMessagePartChatItem suggestedRepliesList](self, "suggestedRepliesList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithItem:suggestedRepliesList:selectedIndex:", v5, v6, -[IMSuggestedRepliesMessagePartChatItem selectedIndex](self, "selectedIndex"));

  return v7;
}

- (NSArray)suggestedRepliesList
{
  return self->_suggestedRepliesList;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRepliesList, 0);
}

@end
