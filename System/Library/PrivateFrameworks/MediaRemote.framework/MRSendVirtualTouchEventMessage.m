@implementation MRSendVirtualTouchEventMessage

- (MRSendVirtualTouchEventMessage)initWithTouchEvent:(_MRHIDTouchEvent *)a3 virtualDeviceID:(unint64_t)a4
{
  MRSendVirtualTouchEventMessage *v6;
  _MRSendVirtualTouchEventMessageProtobuf *v7;
  _MRVirtualTouchEventProtobuf *v8;
  unsigned int var1;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRSendVirtualTouchEventMessage;
  v6 = -[MRProtocolMessage init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(_MRSendVirtualTouchEventMessageProtobuf);
    -[_MRSendVirtualTouchEventMessageProtobuf setVirtualDeviceID:](v7, "setVirtualDeviceID:", a4);
    v8 = objc_alloc_init(_MRVirtualTouchEventProtobuf);
    -[_MRVirtualTouchEventProtobuf setX:](v8, "setX:", a3->var0.var0.var0);
    -[_MRVirtualTouchEventProtobuf setY:](v8, "setY:", a3->var0.var0.var1);
    var1 = a3->var1;
    if (var1 - 1 >= 5)
      v10 = 0;
    else
      v10 = var1;
    -[_MRVirtualTouchEventProtobuf setPhase:](v8, "setPhase:", v10);
    -[_MRVirtualTouchEventProtobuf setFinger:](v8, "setFinger:", a3->var3);
    -[_MRSendVirtualTouchEventMessageProtobuf setEvent:](v7, "setEvent:", v8);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v6, "setUnderlyingCodableMessage:", v7);
    -[MRProtocolMessage setTimestamp:](v6, "setTimestamp:", a3->var2);

  }
  return v6;
}

- (_MRHIDTouchEvent)event
{
  void *v5;
  double v6;
  double v7;
  unsigned int v8;
  unsigned int v9;
  _MRHIDTouchEvent *result;
  id v11;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "event");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)&retstr->var0.var0.var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  objc_msgSend(v11, "x");
  *(float *)&v6 = v6;
  retstr->var0.var0.var0 = *(float *)&v6;
  objc_msgSend(v11, "y");
  *(float *)&v7 = v7;
  retstr->var0.var0.var1 = *(float *)&v7;
  v8 = objc_msgSend(v11, "phase");
  if (v8 - 1 >= 5)
    v9 = 0;
  else
    v9 = v8;
  retstr->var1 = v9;
  retstr->var2 = -[MRProtocolMessage timestamp](self, "timestamp");
  retstr->var3 = objc_msgSend(v11, "finger");

  return result;
}

- (unint64_t)virtualDeviceID
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "virtualDeviceID");

  return v3;
}

- (unint64_t)type
{
  return 10;
}

@end
