@implementation CMContinuityCaptureTransportDeviceNWStream

- (id)initForIdentifier:(id)a3 nwClientID:(id)a4
{
  id v7;
  id v8;
  CMContinuityCaptureTransportDeviceNWStream *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureTransportDeviceNWStream;
  v9 = -[CMContinuityCaptureTransportDeviceNWStream init](&v11, sel_init);
  if (v9)
  {
    v9->_entity = CMContinuityCaptureEntityTypeFromMediaIdentifer(v7);
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_nwClientID, a4);
  }

  return v9;
}

- (NSString)streamIdentifier
{
  return self->_identifier;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSUUID)streamUUID
{
  return self->_nwClientID;
}

- (id)cipherKeyforSessionID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDBCEC8];
  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_msgSend([v3 alloc], "initWithLength:", 32));
  *(_DWORD *)objc_msgSend(v5, "mutableBytes") = 1938474645;
  CMContinuityCaptureCreateCipherKey(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureTransportDeviceNWStream streamIdentifier](self, "streamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ entity:%u [%p]"), v5, v6, self->_entity, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwClientID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
