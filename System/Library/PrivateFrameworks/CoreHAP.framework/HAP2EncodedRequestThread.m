@implementation HAP2EncodedRequestThread

- (HAP2EncodedRequestThread)initWithBTLERequest:(id)a3 enforcePDUBodyLength:(BOOL)a4
{
  id v7;
  HAP2EncodedRequestThread *v8;
  HAP2EncodedRequestThread *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HAP2EncodedRequestThread;
  v8 = -[HAP2EncodedRequestThread init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_btleRequest, a3);
    v9->_enforcePDUBodyLength = a4;
  }

  return v9;
}

- (BOOL)isEncrypted
{
  void *v2;
  char v3;

  -[HAP2EncodedRequestThread btleRequest](self, "btleRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEncrypted");

  return v3;
}

- (unint64_t)type
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[HAP2EncodedRequestThread btleRequest](self, "btleRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hap2RequestTypeFromBTLERequestType:", objc_msgSend(v4, "type"));

  return v5;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v9;
  char v10;

  -[HAP2EncodedRequestThread btleRequest](self, "btleRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(v4, "replaceBytesInRange:withBytes:length:", 0, 0, &v10, 1);
  if (self)
  {
    if (self->_enforcePDUBodyLength)
    {
      -[HAP2EncodedRequestThread btleRequest](self, "btleRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "body");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v9 = 0;
        objc_msgSend(v4, "appendBytes:length:", &v9, 2);
      }
    }
  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (HAP2AccessoryServerEncodingThreadBTLERequest)btleRequest
{
  return self->_btleRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btleRequest, 0);
}

+ (unsigned)btleRequestTypeFromHAP2RequestType:(unint64_t)a3
{
  if (a3 > 0xF)
    return 0;
  else
    return byte_1CCFA35C0[a3];
}

+ (unint64_t)hap2RequestTypeFromBTLERequestType:(unsigned __int8)a3
{
  if ((a3 + 1) > 0xFu)
    return 0;
  else
    return qword_1CCFA3370[(a3 + 1)];
}

@end
