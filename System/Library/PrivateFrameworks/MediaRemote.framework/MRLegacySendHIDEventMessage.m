@implementation MRLegacySendHIDEventMessage

- (MRLegacySendHIDEventMessage)initWithHIDEvent:(__IOHIDEvent *)a3
{
  MRLegacySendHIDEventMessage *v5;
  void *Data;
  _MRSendHIDEventMessageProtobuf *v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRLegacySendHIDEventMessage;
  v5 = -[MRProtocolMessage init](&v10, sel_init);
  if (v5)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("MRLegacySendHIDEventMessage.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

    }
    v5->_event = (__IOHIDEvent *)CFRetain(a3);
    Data = (void *)IOHIDEventCreateData();
    v7 = objc_alloc_init(_MRSendHIDEventMessageProtobuf);
    -[_MRSendHIDEventMessageProtobuf setHidEventData:](v7, "setHidEventData:", Data);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v7);

  }
  return v5;
}

- (void)dealloc
{
  __IOHIDEvent *event;
  objc_super v4;

  event = self->_event;
  if (event)
    CFRelease(event);
  v4.receiver = self;
  v4.super_class = (Class)MRLegacySendHIDEventMessage;
  -[MRProtocolMessage dealloc](&v4, sel_dealloc);
}

- (_MRHIDButtonEvent)buttonEvent
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  _MRHIDButtonEvent result;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hidEventData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "length") < 0x30)
  {
    v6 = 0;
    v7 = 0;
    v5 = 0;
  }
  else
  {
    v4 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v5 = bswap32(*(unsigned __int16 *)(v4 + 43)) >> 16;
    v6 = *(_WORD *)(v4 + 47) != 0;
    v7 = (unint64_t)(bswap32(*(unsigned __int16 *)(v4 + 45)) >> 16) << 32;
  }

  v8 = v5 | v7;
  v9 = v6;
  result.var0 = v8;
  result.var1 = HIDWORD(v8);
  result.var2 = v9;
  return result;
}

- (unint64_t)type
{
  return 8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[MRProtocolMessage timestamp](self, "timestamp");
  -[MRProtocolMessage error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRProtocolMessage replyIdentifier](self, "replyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRLegacySendHIDEventMessage type](self, "type");
  v9 = -[MRLegacySendHIDEventMessage buttonEvent](self, "buttonEvent");
  v11 = (__CFString *)MRHIDButtonEventCopyDescription(v9, v10);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n<Message Type: %@\nTimestamp: %llu\nError: %@\nIdentifier: %@\nType: %lu\nMessage: %@\n>"), v4, v5, v6, v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
