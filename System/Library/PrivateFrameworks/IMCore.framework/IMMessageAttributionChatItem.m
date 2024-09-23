@implementation IMMessageAttributionChatItem

- (id)_initWithItem:(id)a3 attributionInfo:(id)a4 attributionType:(int64_t)a5 showsLearnMoreLink:(BOOL)a6 statusItemSequenceNumber:(unint64_t)a7
{
  id v13;
  id *v14;
  id *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IMMessageAttributionChatItem;
  v14 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](&v17, sel__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_, a3, 12, 0, 0, 0, a7);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 16, a4);
    v15[17] = (id)a5;
    *((_BYTE *)v15 + 120) = a6;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  IMMessageAttributionChatItem *v5;
  IMMessageAttributionChatItem *v6;
  int64_t v7;
  _BOOL4 v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (IMMessageAttributionChatItem *)a3;
  if (v5 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[IMMessageAttributionChatItem attributionType](self, "attributionType");
      if (v7 != -[IMMessageAttributionChatItem attributionType](v6, "attributionType")
        || (v8 = -[IMMessageAttributionChatItem showsLearnMoreLink](self, "showsLearnMoreLink"),
            v8 != -[IMMessageAttributionChatItem showsLearnMoreLink](v6, "showsLearnMoreLink")))
      {
        v9 = 0;
LABEL_15:

        goto LABEL_16;
      }
      -[IMMessageAttributionChatItem attributionInfo](self, "attributionInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        || (-[IMMessageAttributionChatItem attributionInfo](v6, "attributionInfo"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[IMMessageAttributionChatItem attributionInfo](self, "attributionInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMMessageAttributionChatItem attributionInfo](v6, "attributionInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v11, "isEqual:", v12);

        if (v10)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        v9 = 1;
      }

      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (BOOL)isCommSafetySensitiveAttribution
{
  return -[IMMessageAttributionChatItem attributionType](self, "attributionType") == 8
      || -[IMMessageAttributionChatItem attributionType](self, "attributionType") == 9;
}

- (NSString)bundleID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_attributionInfo, "objectForKeyedSubscript:", *MEMORY[0x1E0D37F30]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[IMMessageStatusChatItem messageItem](self, "messageItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:attributionInfo:attributionType:showsLearnMoreLink:statusItemSequenceNumber:", v4, self->_attributionInfo, self->_attributionType, self->_showsLearnMoreLink, -[IMMessageStatusChatItem statusItemSequenceNumber](self, "statusItemSequenceNumber"));

  return v5;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[IMMessageStatusChatItem messageItem](self, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:attributionInfo:attributionType:showsLearnMoreLink:statusItemSequenceNumber:", v5, self->_attributionInfo, self->_attributionType, self->_showsLearnMoreLink, a3);

  return v6;
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (int64_t)attributionType
{
  return self->_attributionType;
}

- (BOOL)showsLearnMoreLink
{
  return self->_showsLearnMoreLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionInfo, 0);
}

@end
