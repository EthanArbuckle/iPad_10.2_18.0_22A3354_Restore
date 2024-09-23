@implementation _MFDAMessageBodyFetchConsumer

- (BOOL)wantsData
{
  return 1;
}

- (void)handleResponse:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)&self->_error, a4);
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  self->_succeeded = v9;
  v10 = v7;
  if (v10)
  {
    if (self->_error)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 1940, CFSTR("should not have error and response"));

    }
    if (objc_msgSend(v10, "streaming"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 1942, CFSTR("should not get streaming responses"));

    }
    objc_msgSend(v10, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFDAMessageBodyFetchConsumer setData:](self, "setData:", v12);

  }
  -[_MFDAMessageBodyFetchConsumer setHasLocalCopyOfData:](self, "setHasLocalCopyOfData:", v10 != 0);

}

- (BOOL)succeeded
{
  char v2;
  void *v3;

  if (self->_succeeded)
    return 1;
  -[_MFDAMessageBodyFetchConsumer streamConsumer](self, "streamConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "succeeded");

  return v2;
}

- (NSData)data
{
  void *v3;
  NSData *v4;

  -[_MFDAMessageBodyFetchConsumer streamConsumer](self, "streamConsumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = self->_data;
  return v4;
}

- (MFDAStreamingContentConsumer)streamConsumer
{
  return self->_streamConsumer;
}

- (void)setStreamConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_streamConsumer, a3);
}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (BOOL)hasLocalCopyOfData
{
  return self->_hasLocalCopyOfData;
}

- (void)setHasLocalCopyOfData:(BOOL)a3
{
  self->_hasLocalCopyOfData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_streamConsumer, 0);
}

@end
