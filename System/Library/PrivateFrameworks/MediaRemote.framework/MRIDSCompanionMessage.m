@implementation MRIDSCompanionMessage

- (MRIDSCompanionMessage)initWithID:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  MRIDSCompanionMessage *v8;
  uint64_t v9;
  NSNumber *messageID;
  uint64_t v11;
  NSData *data;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRIDSCompanionMessage;
  v8 = -[MRIDSCompanionMessage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    messageID = v8->_messageID;
    v8->_messageID = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v11;

  }
  return v8;
}

- (BOOL)replyWithData:(id)a3 priority:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  +[MRIDSCompanionConnection sharedManager](MRIDSCompanionConnection, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "_sendMessage:type:destination:session:options:priority:replyID:response:", v6, 0, 0, 0, 0, a4, self->_messageID, 0);

  return a4;
}

- (NSData)data
{
  return self->_data;
}

- (NSNumber)messageID
{
  return self->_messageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
