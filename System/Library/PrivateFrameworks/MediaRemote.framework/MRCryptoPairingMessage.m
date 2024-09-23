@implementation MRCryptoPairingMessage

- (MRCryptoPairingMessage)initWithPairingData:(id)a3 status:(int)a4
{
  return -[MRCryptoPairingMessage initWithPairingData:status:isRetrying:isUsingSystemPairing:state:](self, "initWithPairingData:status:isRetrying:isUsingSystemPairing:state:", a3, *(_QWORD *)&a4, 0, 0, 0);
}

- (MRCryptoPairingMessage)initWithPairingData:(id)a3 status:(int)a4 isRetrying:(BOOL)a5 isUsingSystemPairing:(BOOL)a6 state:(unint64_t)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  id v12;
  MRCryptoPairingMessage *v13;
  _MRCryptoPairingMessageProtobuf *v14;
  objc_super v16;

  v8 = a6;
  v9 = a5;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRCryptoPairingMessage;
  v13 = -[MRProtocolMessage init](&v16, sel_init);
  if (v13)
  {
    v14 = objc_alloc_init(_MRCryptoPairingMessageProtobuf);
    -[_MRCryptoPairingMessageProtobuf setPairingData:](v14, "setPairingData:", v12);
    -[_MRCryptoPairingMessageProtobuf setStatus:](v14, "setStatus:", v10);
    -[_MRCryptoPairingMessageProtobuf setIsRetrying:](v14, "setIsRetrying:", v9);
    -[_MRCryptoPairingMessageProtobuf setIsUsingSystemPairing:](v14, "setIsUsingSystemPairing:", v8);
    -[_MRCryptoPairingMessageProtobuf setState:](v14, "setState:", a7);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v13, "setUnderlyingCodableMessage:", v14);

  }
  return v13;
}

- (NSData)pairingData
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (int)status
{
  void *v2;
  int v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return v3;
}

- (BOOL)isRetrying
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRetrying");

  return v3;
}

- (BOOL)isUsingSystemPairing
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingSystemPairing");

  return v3;
}

- (unint64_t)state
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "state");

  return v3;
}

- (unint64_t)encryptionType
{
  return 0;
}

- (unint64_t)type
{
  return 34;
}

@end
