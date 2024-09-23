@implementation MCMResultBase

- (MCMResultBase)initWithError:(id)a3
{
  id v5;
  MCMResultBase *v6;
  MCMResultBase *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultBase;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_cacheable = 1;
  }

  return v7;
}

- (MCMResultBase)init
{
  return -[MCMResultBase initWithError:](self, "initWithError:", 0);
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  -[MCMResultBase error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    -[MCMResultBase error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "category");
    -[MCMResultBase error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "type");
    -[MCMResultBase error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "fileSystemRepresentation");
    -[MCMResultBase error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "POSIXerrno");
    container_error_create();

    container_xpc_encode_error();
    container_error_free();
    xpc_dictionary_set_value(v4, "ReplyErrorExtended", v6);

  }
  xpc_dictionary_set_BOOL(v4, "ReplyCacheable", -[MCMResultBase isCacheable](self, "isCacheable"));

  return 1;
}

- (MCMError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (BOOL)isCacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

@end
