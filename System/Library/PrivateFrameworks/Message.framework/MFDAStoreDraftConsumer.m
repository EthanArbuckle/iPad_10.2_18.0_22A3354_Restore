@implementation MFDAStoreDraftConsumer

- (void)handleResponse:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *serverId;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (v8)
    objc_storeStrong((id *)&self->_error, a4);
  v9 = v7;
  v17 = v9;
  if (v9)
  {
    if (self->_error)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAStoreDraftConsumer.m"), 29, CFSTR("should not have error and response"));

      v9 = v17;
    }
    if (objc_msgSend(v9, "status") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAStoreDraftConsumer.m"), 32, CFSTR("got non-successful status code %ld for response"), objc_msgSend(v17, "status"));

    }
    objc_msgSend(v17, "serverId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAStoreDraftConsumer.m"), 33, CFSTR("got a successful response with no server id"));

    }
    objc_msgSend(v17, "serverId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSString *)objc_msgSend(v11, "copy");
    serverId = self->_serverId;
    self->_serverId = v12;

    self->_success = 1;
    v9 = v17;
  }

}

- (NSString)serverId
{
  return self->_serverId;
}

- (MFError)error
{
  return self->_error;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serverId, 0);
}

@end
