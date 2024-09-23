@implementation MFOutgoingMessage

- (void)setMessageBody:(id)a3
{
  objc_storeStrong((id *)&self->_messageBody, a3);
}

- (id)messageStore
{
  return 0;
}

- (id)messageBody
{
  return self->_messageBody;
}

- (id)messageBodyIfAvailable
{
  return self->_messageBody;
}

- (id)messageData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MFOutgoingMessage headers](self, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodedHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MFMessageBody rawData](self->_messageBody, "rawData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D46100], "dataWithCapacity:", objc_msgSend(v5, "length") + objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendData:", v4);
    if (v5)
      objc_msgSend(v6, "appendData:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;

  if (a5)
    *a5 = 1;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  -[MFOutgoingMessage headers](self, "headers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodedHeaders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MFMessageBody rawData](self->_messageBody, "rawData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "length");
    v13 = objc_msgSend(v11, "length") + v12;
    if (a4)
      *a4 = v13;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D46100], "dataWithCapacity:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendData:", v10);
      if (v11)
        objc_msgSend(v14, "appendData:", v11);
      objc_msgSend(v14, "mf_makeImmutable");
      v15 = objc_retainAutorelease(v14);
      *a3 = v15;

    }
  }

  return v10 != 0;
}

- (id)messageDataHolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MFOutgoingMessage headers](self, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodedHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MFMessageBody rawData](self->_messageBody, "rawData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D46088], "dataHolderWithData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "addData:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  if (a5)
    *a5 = 1;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  -[MFOutgoingMessage headers](self, "headers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodedHeaders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MFMessageBody rawData](self->_messageBody, "rawData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "length");
    v13 = objc_msgSend(v11, "length");
    if (a4)
      *a4 = v13 + v12;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0D46088], "dataHolderWithData:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v11)
        objc_msgSend(v14, "addData:", v11);
      v16 = objc_retainAutorelease(v15);
      *a3 = v16;

    }
  }

  return v10 != 0;
}

- (id)mutableHeaders
{
  MFMutableMessageHeaders *messageHeaders;
  MFMutableMessageHeaders *v4;
  MFMutableMessageHeaders *v5;

  messageHeaders = self->_messageHeaders;
  if (!messageHeaders)
  {
    v4 = (MFMutableMessageHeaders *)objc_alloc_init(MEMORY[0x1E0D46110]);
    v5 = self->_messageHeaders;
    self->_messageHeaders = v4;

    messageHeaders = self->_messageHeaders;
  }
  return messageHeaders;
}

- (void)setMutableHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_messageHeaders, a3);
}

- (unint64_t)messageSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[MFOutgoingMessage headers](self, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodedHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  -[MFMessageBody rawData](self->_messageBody, "rawData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") + v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHeaders, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
}

@end
