@implementation IMMessageStatusChatItem

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMMessageStatusChatItem;
  -[IMTranscriptChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[%@] statusType: %d expireStatusType: %d]"), v4, self->_statusType, self->_expireStatusType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[IMMessageStatusChatItem messageItem](self, "messageItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v4, self->_statusType, self->_time, self->_count, self->_expireStatusType, self->_statusItemSequenceNumber);

  return v5;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[IMMessageStatusChatItem messageItem](self, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", v5, self->_statusType, self->_time, self->_count, self->_expireStatusType, a3);

  return v6;
}

- (id)_timeStale
{
  NSDate *timeStale;
  void *v4;
  void *v5;
  NSDate *v6;
  void *v7;
  NSDate *v8;
  NSDate *v9;

  timeStale = self->_timeStale;
  if (!timeStale)
  {
    -[IMChatItem _item](self, "_item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_expireStatusType == 2)
    {
      if (!objc_msgSend(v4, "isFromMe"))
      {
        objc_msgSend(v5, "timePlayed");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v7, 3.0);
          v9 = self->_timeStale;
          self->_timeStale = v8;

        }
        goto LABEL_8;
      }
      if (self->_timeAdded)
      {
        v6 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", self->_timeAdded, 3.0);
        v7 = self->_timeStale;
        self->_timeStale = v6;
LABEL_8:

      }
    }

    timeStale = self->_timeStale;
  }
  return timeStale;
}

- (id)_timeAdded
{
  return self->_timeAdded;
}

- (void)_setTimeAdded:(id)a3
{
  NSDate *v5;
  NSDate *timeStale;
  NSDate *v7;

  v5 = (NSDate *)a3;
  if (self->_timeAdded != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_timeAdded, a3);
    timeStale = self->_timeStale;
    self->_timeStale = 0;

    v5 = v7;
  }

}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)isStewie
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (!v4)
    return 0;
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isStewie");

  return v8;
}

- (NSString)errorText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    _NSStringFromIMMessageError(objc_msgSend(v4, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error %ld"), objc_msgSend(v5, "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (int64_t)messageStatusType
{
  return self->_statusType;
}

- (id)_initWithItem:(id)a3 statusType:(int64_t)a4 time:(id)a5 count:(unint64_t)a6 statusItemSequenceNumber:(unint64_t)a7
{
  return -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](self, "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", a3, a4, a5, a6, 0, a7);
}

- (id)_initWithItem:(id)a3 expireStatusType:(int64_t)a4 count:(unint64_t)a5 statusItemSequenceNumber:(unint64_t)a6
{
  return -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](self, "_initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:", a3, 0, 0, a5, a4, a6);
}

- (id)_initWithItem:(id)a3 statusType:(int64_t)a4 time:(id)a5 count:(unint64_t)a6 expireStatusType:(int64_t)a7 statusItemSequenceNumber:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v14 = a3;
  v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IMMessageStatusChatItem;
  v16 = -[IMChatItem _initWithItem:](&v23, sel__initWithItem_, v14);
  v17 = v16;
  if (v16)
  {
    *((_QWORD *)v16 + 7) = a4;
    objc_storeStrong((id *)v16 + 8, a5);
    v17[10] = a6;
    v17[9] = a7;
    v17[14] = a8;
    objc_msgSend(v14, "guid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)sub_1A2132A84();

    objc_msgSend(v17, "_setGUID:", v21);
  }

  return v17;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (NSDate)time
{
  return self->_time;
}

- (int64_t)expireStatusType
{
  return self->_expireStatusType;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSDate)timeAdded
{
  return self->_timeAdded;
}

- (NSDate)timeStale
{
  return self->_timeStale;
}

- (NSString)recipientDisplayName
{
  return self->_recipientDisplayName;
}

- (void)setRecipientDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)statusItemSequenceNumber
{
  return self->_statusItemSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientDisplayName, 0);
  objc_storeStrong((id *)&self->_timeStale, 0);
  objc_storeStrong((id *)&self->_timeAdded, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

@end
