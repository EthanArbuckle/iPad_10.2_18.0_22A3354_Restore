@implementation _CATRemoteConnectionSendDataContext

- (_CATRemoteConnectionSendDataContext)initWithData:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  _CATRemoteConnectionSendDataContext *v9;
  uint64_t v10;
  NSData *data;
  uint64_t v12;
  NSData *mEncodedData;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v16.receiver = self;
  v16.super_class = (Class)_CATRemoteConnectionSendDataContext;
  v9 = -[_CATRemoteConnectionSendDataContext init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    data = v9->_data;
    v9->_data = (NSData *)v10;

    objc_storeStrong(&v9->_userInfo, a4);
    +[CATHTTPMessageParser encodeRequestData:](CATHTTPMessageParser, "encodeRequestData:", v9->_data);
    v12 = objc_claimAutoreleasedReturnValue();
    mEncodedData = v9->mEncodedData;
    v9->mEncodedData = (NSData *)v12;

  }
  return v9;
}

- (BOOL)hasBytesRemaining
{
  unint64_t v3;

  v3 = -[NSData length](self->mEncodedData, "length");
  return v3 > -[_CATRemoteConnectionSendDataContext bytesWritten](self, "bytesWritten");
}

- (unint64_t)clientBytesWritten
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_CATRemoteConnectionSendDataContext bytesWritten](self, "bytesWritten");
  if (v3 <= -[_CATRemoteConnectionSendDataContext headerLength](self, "headerLength"))
    return 0;
  v4 = -[_CATRemoteConnectionSendDataContext bytesWritten](self, "bytesWritten");
  return v4 - -[_CATRemoteConnectionSendDataContext headerLength](self, "headerLength");
}

- (unint64_t)headerLength
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSData length](self->mEncodedData, "length");
  -[_CATRemoteConnectionSendDataContext data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 - objc_msgSend(v4, "length");

  return v5;
}

- (id)bufferedDataWithError:(id *)a3
{
  return -[NSData subdataWithRange:](self->mEncodedData, "subdataWithRange:", -[_CATRemoteConnectionSendDataContext bytesWritten](self, "bytesWritten", a3), -[NSData length](self->mEncodedData, "length")- -[_CATRemoteConnectionSendDataContext bytesWritten](self, "bytesWritten"));
}

- (NSData)data
{
  return self->_data;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->mEncodedData, 0);
}

@end
