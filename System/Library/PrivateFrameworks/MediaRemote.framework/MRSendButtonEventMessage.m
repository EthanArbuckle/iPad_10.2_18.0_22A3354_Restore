@implementation MRSendButtonEventMessage

- (MRSendButtonEventMessage)initWithButtonEvent:(_MRHIDButtonEvent)a3
{
  BOOL var2;
  unint64_t v4;
  MRSendButtonEventMessage *v5;
  _MRSendButtonEventMessageProtobuf *v6;
  objc_super v8;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)MRSendButtonEventMessage;
  v5 = -[MRProtocolMessage init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRSendButtonEventMessageProtobuf);
    -[_MRSendButtonEventMessageProtobuf setUsagePage:](v6, "setUsagePage:", v4);
    -[_MRSendButtonEventMessageProtobuf setUsage:](v6, "setUsage:", HIDWORD(v4));
    -[_MRSendButtonEventMessageProtobuf setButtonDown:](v6, "setButtonDown:", var2);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (_MRHIDButtonEvent)buttonEvent
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  _BOOL4 v7;
  _MRHIDButtonEvent result;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usagePage");
  v4 = objc_msgSend(v2, "usage");
  v5 = objc_msgSend(v2, "buttonDown");

  v6 = v3 | (unint64_t)(v4 << 32);
  v7 = v5;
  result.var0 = v6;
  result.var1 = HIDWORD(v6);
  result.var2 = v7;
  return result;
}

- (unint64_t)type
{
  return 39;
}

@end
