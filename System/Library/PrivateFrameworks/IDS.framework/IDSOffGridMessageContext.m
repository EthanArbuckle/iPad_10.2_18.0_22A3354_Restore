@implementation IDSOffGridMessageContext

- (IDSOffGridMessageContext)initWithIDSMessageContext:(id)a3
{
  id v4;
  IDSOffGridMessageContext *v5;
  uint64_t v6;
  NSString *senderMergeID;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSOffGridMessageContext;
  v5 = -[IDSOffGridMessageContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "senderCorrelationIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    senderMergeID = v5->_senderMergeID;
    v5->_senderMergeID = (NSString *)v6;

    objc_msgSend(v4, "originalGUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

  }
  return v5;
}

- (NSString)senderMergeID
{
  return self->_senderMergeID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_senderMergeID, 0);
}

@end
