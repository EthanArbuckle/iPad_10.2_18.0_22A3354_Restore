@implementation MRRequestGroupSessionMessage

- (MRRequestGroupSessionMessage)initWithDetails:(id)a3
{
  id v4;
  MRRequestGroupSessionMessage *v5;
  _MRRequestGroupSessionMessageProtobuf *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRRequestGroupSessionMessage;
  v5 = -[MRProtocolMessage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRRequestGroupSessionMessageProtobuf);
    objc_msgSend(v4, "protobuf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRRequestGroupSessionMessageProtobuf setDetails:](v6, "setDetails:", v7);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);
  }

  return v5;
}

- (MRRequestDetails)details
{
  MRRequestDetails *v3;
  void *v4;
  void *v5;
  MRRequestDetails *v6;

  v3 = [MRRequestDetails alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRRequestDetails initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
}

- (unint64_t)type
{
  return 132;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
}

@end
