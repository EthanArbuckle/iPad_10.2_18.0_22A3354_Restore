@implementation _MFDAMessageHeaderFetchConsumer

- (BOOL)wantsData
{
  return 1;
}

- (void)handleResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  MFDAMessage *v8;
  void *v9;
  NSData *v10;
  NSData *data;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    objc_storeStrong((id *)&self->_error, a4);
    self->_succeeded = 0;
  }
  else
  {
    objc_msgSend(v12, "changedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MFDAMessage initWithDAMailMessage:mailbox:]([MFDAMessage alloc], "initWithDAMailMessage:mailbox:", v7, 0);
    -[MFDAMessage setMessageStore:](v8, "setMessageStore:", self->_store);
    -[MFDAMessage headers](v8, "headers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "data");
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v10;

    self->_succeeded = 1;
  }

}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSData)data
{
  return self->_data;
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

- (MFDAMessageStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
