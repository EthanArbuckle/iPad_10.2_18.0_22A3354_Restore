@implementation MRSendLyricsEventMessage

- (MRSendLyricsEventMessage)initWithEvent:(id)a3
{
  id v4;
  MRSendLyricsEventMessage *v5;
  _MRSendLyricsEventMessageProtobuf *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRSendLyricsEventMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRSendLyricsEventMessageProtobuf);
    -[_MRSendLyricsEventMessageProtobuf setEvent:](v6, "setEvent:", v4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (_MRLyricsEventProtobuf)event
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_MRLyricsEventProtobuf *)v3;
}

- (unint64_t)type
{
  return 44;
}

@end
