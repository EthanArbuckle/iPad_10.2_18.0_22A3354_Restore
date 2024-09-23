@implementation _CATRemoteConnectionSendDataWithStreamContext

- (_CATRemoteConnectionSendDataWithStreamContext)initWithStream:(id)a3 length:(unint64_t)a4 bufferSize:(unint64_t)a5 userInfo:(id)a6
{
  id v12;
  id v13;
  _CATRemoteConnectionSendDataWithStreamContext *v14;
  _CATRemoteConnectionSendDataWithStreamContext *v15;
  uint64_t v16;
  NSData *mHeaderData;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteConnection.m"), 1059, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stream"));

  }
  v20.receiver = self;
  v20.super_class = (Class)_CATRemoteConnectionSendDataWithStreamContext;
  v14 = -[_CATRemoteConnectionSendDataWithStreamContext init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_stream, a3);
    v15->_dataLength = a4;
    v15->_bufferSize = a5;
    objc_storeStrong(&v15->_userInfo, a6);
    +[CATHTTPMessageParser responseHeaderForContentWithLength:](CATHTTPMessageParser, "responseHeaderForContentWithLength:", a4);
    v16 = objc_claimAutoreleasedReturnValue();
    mHeaderData = v15->mHeaderData;
    v15->mHeaderData = (NSData *)v16;

    objc_msgSend(v12, "open");
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[NSInputStream close](self->_stream, "close");
  v3.receiver = self;
  v3.super_class = (Class)_CATRemoteConnectionSendDataWithStreamContext;
  -[_CATRemoteConnectionSendDataWithStreamContext dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBytesRemaining
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSData length](self->mHeaderData, "length");
  v4 = -[_CATRemoteConnectionSendDataWithStreamContext dataLength](self, "dataLength") + v3;
  return v4 > -[_CATRemoteConnectionSendDataWithStreamContext bytesWritten](self, "bytesWritten");
}

- (unint64_t)clientBytesWritten
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_CATRemoteConnectionSendDataWithStreamContext bytesWritten](self, "bytesWritten");
  if (v3 <= -[NSData length](self->mHeaderData, "length"))
    return 0;
  v4 = -[_CATRemoteConnectionSendDataWithStreamContext bytesWritten](self, "bytesWritten");
  return v4 - -[NSData length](self->mHeaderData, "length");
}

- (id)bufferedDataWithError:(id *)a3
{
  unint64_t mBytesRead;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  NSMutableData *mBuffer;
  NSMutableData *v10;
  NSUInteger v11;
  NSMutableData *v12;
  const void *v13;
  NSMutableData *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;
  NSMutableData *v21;
  NSMutableData *v22;
  NSMutableData *v23;
  NSUInteger v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSMutableData *v32;
  void *v34;

  mBytesRead = self->mBytesRead;
  v6 = -[NSData length](self->mHeaderData, "length") + mBytesRead;
  v7 = -[_CATRemoteConnectionSendDataWithStreamContext bytesWritten](self, "bytesWritten");
  v8 = v6 - v7;
  if (v6 - v7 >= -[_CATRemoteConnectionSendDataWithStreamContext bufferSize](self, "bufferSize"))
    goto LABEL_19;
  mBuffer = self->mBuffer;
  if (!mBuffer)
    goto LABEL_7;
  if (v8 >= -[NSMutableData length](mBuffer, "length"))
    goto LABEL_19;
  v10 = self->mBuffer;
  if (v10)
  {
    if (v6 == v7)
      goto LABEL_12;
    v11 = -[NSMutableData length](v10, "length") - v8;
    v12 = self->mBuffer;
    v13 = (const void *)(-[NSMutableData bytes](v12, "bytes") + v11);
    v14 = v12;
    v15 = v8;
  }
  else
  {
LABEL_7:
    v16 = (void *)MEMORY[0x24BDBCEC8];
    v17 = -[_CATRemoteConnectionSendDataWithStreamContext bufferSize](self, "bufferSize");
    v18 = -[NSData length](self->mHeaderData, "length");
    v19 = -[_CATRemoteConnectionSendDataWithStreamContext dataLength](self, "dataLength");
    if (v17 >= v19 + v18)
      v20 = v19 + v18;
    else
      v20 = v17;
    objc_msgSend(v16, "dataWithLength:", v20);
    v21 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    v22 = self->mBuffer;
    self->mBuffer = v21;

    v23 = self->mBuffer;
    v24 = -[NSData length](self->mHeaderData, "length");
    v13 = -[NSData bytes](self->mHeaderData, "bytes");
    v14 = v23;
    v15 = v24;
  }
  -[NSMutableData replaceBytesInRange:withBytes:](v14, "replaceBytesInRange:withBytes:", 0, v15, v13);
LABEL_12:
  v25 = self->mBytesRead;
  if (v25 >= -[_CATRemoteConnectionSendDataWithStreamContext dataLength](self, "dataLength"))
  {
LABEL_18:
    -[NSMutableData setLength:](self->mBuffer, "setLength:", v8);
    goto LABEL_19;
  }
  -[_CATRemoteConnectionSendDataWithStreamContext stream](self, "stream");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[NSMutableData mutableBytes](self->mBuffer, "mutableBytes") + v8;
  v28 = -[NSMutableData length](self->mBuffer, "length") - v8;
  v29 = -[_CATRemoteConnectionSendDataWithStreamContext dataLength](self, "dataLength");
  if (v28 >= v29 - self->mBytesRead)
    v30 = v29 - self->mBytesRead;
  else
    v30 = v28;
  v31 = objc_msgSend(v26, "read:maxLength:", v27, v30);

  if ((v31 & 0x8000000000000000) == 0)
  {
    self->mBytesRead += v31;
    v8 += v31;
    if (v8 < -[NSMutableData length](self->mBuffer, "length"))
      goto LABEL_18;
LABEL_19:
    v32 = self->mBuffer;
    return v32;
  }
  if (a3)
  {
    -[_CATRemoteConnectionSendDataWithStreamContext stream](self, "stream");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "streamError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v32 = 0;
  return v32;
}

- (NSInputStream)stream
{
  return self->_stream;
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
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
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->mHeaderData, 0);
  objc_storeStrong((id *)&self->mBuffer, 0);
}

@end
