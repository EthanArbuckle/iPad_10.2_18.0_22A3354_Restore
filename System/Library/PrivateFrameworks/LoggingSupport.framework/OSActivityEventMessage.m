@implementation OSActivityEventMessage

- (void)fillEventData:(const char *)a3 length:(unint64_t)a4 privateBuffer:(const char *)a5 length:(unint64_t)a6
{
  NSData *v9;
  NSData *bufferData;
  NSData *v11;
  NSData *bufferPrivateData;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  bufferData = self->_bufferData;
  self->_bufferData = v9;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a5, a6);
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  bufferPrivateData = self->_bufferPrivateData;
  self->_bufferPrivateData = v11;

}

- (NSMutableArray)arguments
{
  return 0;
}

- (NSString)format
{
  unint64_t v3;
  void *v4;
  int v5;
  void *v6;
  const char *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v3 = -[OSActivityEvent traceID](self, "traceID") >> 32;
  v9[0] = 0;
  v9[1] = 0;
  -[OSActivityEvent senderImageUUID](self, "senderImageUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getUUIDBytes:", v9);

  v5 = uuidpath_resolve(0, v9, v3, 0, &v8, 0, 0, 0);
  v6 = 0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferData, 0);
  objc_storeStrong((id *)&self->_bufferPrivateData, 0);
}

@end
