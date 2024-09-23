@implementation CMContinuityCaptureTransportDeviceRapportStream

- (CMContinuityCaptureTransportDeviceRapportStream)initWithRapportStream:(id)a3
{
  id v5;
  CMContinuityCaptureTransportDeviceRapportStream *v6;
  CMContinuityCaptureTransportDeviceRapportStream *v7;
  void *v8;
  CMContinuityCaptureTransportDeviceRapportStream *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureTransportDeviceRapportStream;
  v6 = -[CMContinuityCaptureTransportDeviceRapportStream init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    objc_msgSend(v5, "streamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_entity = CMContinuityCaptureEntityTypeFromMediaIdentifer(v8);

    v9 = v7;
  }

  return v7;
}

- (NSString)streamIdentifier
{
  return (NSString *)-[RPStreamSession streamID](self->_stream, "streamID");
}

- (RPStreamSession)stream
{
  return self->_stream;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSUUID)streamUUID
{
  return (NSUUID *)-[RPStreamSession nwClientID](self->_stream, "nwClientID");
}

- (id)cipherKeyforSessionID:(id)a3
{
  RPStreamSession *stream;
  id v4;
  void *v5;
  void *v6;

  stream = self->_stream;
  v4 = a3;
  -[RPStreamSession streamKey](stream, "streamKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
  -[CMContinuityCaptureTransportDeviceRapportStream streamIdentifier](self, "streamIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ entity:%u [%p]"), v5, v6, self->_entity, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isMediaStream
{
  return (unint64_t)(self->_entity - 1) < 3;
}

- (void)sendMessage:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CMContinuityCaptureTransportDeviceRapportStream isMediaStream](self, "isMediaStream"))
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureTransportDeviceRapportStream sendMessage:message:completion:].cold.1();

  }
  else
  {
    -[RPStreamSession sendEventID:event:options:completion:](self->_stream, "sendEventID:event:options:completion:", CFSTR("ContinuityCaptureStreamEventID"), v9, 0, v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)sendMessage:message:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ Unsupported operation for %{public}@");
  OUTLINED_FUNCTION_1_0();
}

@end
