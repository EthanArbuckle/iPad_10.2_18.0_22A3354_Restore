@implementation MRSendPackedVirtualTouchEventMessage

- (MRSendPackedVirtualTouchEventMessage)initWithTouchEvent:(_MRHIDTouchEvent *)a3 virtualDeviceID:(unint64_t)a4
{
  __int16 v4;
  MRSendPackedVirtualTouchEventMessage *v6;
  _MRSendPackedVirtualTouchEventMessageProtobuf *v7;
  float var1;
  void *v9;
  objc_super v11;
  _WORD v12[5];
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)MRSendPackedVirtualTouchEventMessage;
  v6 = -[MRProtocolMessage init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(_MRSendPackedVirtualTouchEventMessageProtobuf);
    var1 = a3->var0.var0.var1;
    v12[0] = (int)a3->var0.var0.var0;
    v12[1] = (int)var1;
    v12[2] = a3->var1;
    v12[3] = v4;
    v12[4] = a3->var3;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRSendPackedVirtualTouchEventMessageProtobuf setData:](v7, "setData:", v9);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v6, "setUnderlyingCodableMessage:", v7);
    -[MRProtocolMessage setTimestamp:](v6, "setTimestamp:", a3->var2);

  }
  return v6;
}

- (_MRHIDTouchEvent)event
{
  void *v5;
  void *v6;
  float v7;
  _MRHIDTouchEvent *result;
  _WORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getBytes:length:", v9, 10);

  *(_QWORD *)&retstr->var1 = 0;
  retstr->var2 = 0;
  *(_QWORD *)&retstr->var3 = 0;
  v7 = (float)v9[1];
  retstr->var0.var0.var0 = (float)v9[0];
  retstr->var0.var0.var1 = v7;
  retstr->var1 = v9[2];
  retstr->var2 = -[MRProtocolMessage timestamp](self, "timestamp");
  retstr->var3 = v9[4];

  return result;
}

- (unint64_t)virtualDeviceID
{
  void *v2;
  void *v3;
  unint64_t v4;
  _BYTE v6[6];
  __int16 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getBytes:length:", v6, 10);

  v4 = v7;
  return v4;
}

- (unint64_t)type
{
  return 43;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  _WORD v14[5];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getBytes:length:", v14, 10);

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRProtocolMessage timestamp](self, "timestamp");
  -[MRProtocolMessage error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRProtocolMessage replyIdentifier](self, "replyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRSendPackedVirtualTouchEventMessage type](self, "type");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\n<Message Type: %@\nTimestamp: %llu\nError: %@\nIdentifier: %@\nType: %lul\nMessage: x: %u y: %u phase: %u deviceID: %u finger: %u\n>"), v7, v8, v9, v10, v11, v14[0], v14[1], v14[2], v14[3], v14[4]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
