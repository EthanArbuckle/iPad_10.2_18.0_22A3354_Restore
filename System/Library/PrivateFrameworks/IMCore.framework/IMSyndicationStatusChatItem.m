@implementation IMSyndicationStatusChatItem

- (id)_initWithItem:(id)a3 withSyndicationStatus:(int64_t)a4 statusItemSequenceNumber:(unint64_t)a5
{
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMSyndicationStatusChatItem;
  v9 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](&v16, sel__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_, v8, 19, 0, 0, 0, a5);
  v10 = v9;
  if (v9)
  {
    v9[18] = a4;
    *((_BYTE *)v9 + 120) = objc_msgSend(v8, "wasDetectedAsSWYSpam");
    objc_msgSend(v8, "swyAppName");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v10[16];
    v10[16] = v11;

    objc_msgSend(v8, "swyBundleID");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v10[17];
    v10[17] = v13;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  IMSyndicationStatusChatItem *v4;
  int64_t syndicationStatus;
  unsigned __int8 v6;
  objc_super v8;

  v4 = (IMSyndicationStatusChatItem *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      syndicationStatus = self->_syndicationStatus;
      v6 = syndicationStatus == -[IMSyndicationStatusChatItem syndicationStatus](v4, "syndicationStatus");
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)IMSyndicationStatusChatItem;
      v6 = -[IMTranscriptChatItem isEqual:](&v8, sel_isEqual_, v4);
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[IMMessageStatusChatItem messageItem](self, "messageItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:withSyndicationStatus:statusItemSequenceNumber:", v4, self->_syndicationStatus, -[IMMessageStatusChatItem statusItemSequenceNumber](self, "statusItemSequenceNumber"));

  return v5;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[IMMessageStatusChatItem messageItem](self, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:withSyndicationStatus:statusItemSequenceNumber:", v5, self->_syndicationStatus, a3);

  return v6;
}

- (NSString)swyAppName
{
  return self->_swyAppName;
}

- (NSString)swyBundleID
{
  return self->_swyBundleID;
}

- (int64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (BOOL)wasDetectedAsSWYSpam
{
  return self->_wasDetectedAsSWYSpam;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swyBundleID, 0);
  objc_storeStrong((id *)&self->_swyAppName, 0);
}

@end
