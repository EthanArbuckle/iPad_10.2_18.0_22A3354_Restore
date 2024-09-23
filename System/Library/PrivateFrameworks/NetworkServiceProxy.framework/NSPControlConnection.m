@implementation NSPControlConnection

- (id)initFromMetadata:(id)a3
{
  id v4;
  NSPControlConnection *v5;
  void *v6;
  void *v7;
  NSPControlConnection *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NSPControlConnection;
  v5 = -[NSPControlConnection init](&v12, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  createPropertiesFromMetaData(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Failed to create flow properties from the connection metadata", v11, 2u);
    }

    goto LABEL_9;
  }
  v7 = v6;
  v5->_flowIdentifier = objc_msgSend(v6, "flowIdentifier");

LABEL_5:
  v8 = v5;
LABEL_10:

  return v8;
}

- (id)initFromStream:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0C93058]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSPControlConnection initFromMetadata:](self, "initFromMetadata:", v4);

  return v5;
}

- (id)initFromTask:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "performSelector:", sel__TCPConnectionMetadata);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      self = (NSPControlConnection *)-[NSPControlConnection initFromMetadata:](self, "initFromMetadata:", v5);

      v5 = self;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)initFromConnection:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSPControlConnection initFromMetadata:](self, "initFromMetadata:", v4);

  return v5;
}

- (id)initFromNWConnection:(id)a3
{
  uint64_t v4;
  void *v5;
  NSPControlConnection *v6;
  id v7;
  const void *bytes_ptr;
  void *v9;

  if (a3)
  {
    v4 = nw_connection_copy_metadata();
    v5 = (void *)v4;
    if (v4 && MEMORY[0x1A1AEADA0](v4) == MEMORY[0x1E0C812E8])
    {
      v7 = objc_alloc(MEMORY[0x1E0C99D50]);
      bytes_ptr = xpc_data_get_bytes_ptr(v5);
      v9 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v5), 0);
      self = (NSPControlConnection *)-[NSPControlConnection initFromMetadata:](self, "initFromMetadata:", v9);

      v6 = self;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fetchConnectionInfoWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  +[NSPManager sharedManager](NSPManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSPControlConnection flowIdentifier](self, "flowIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getConnectionInfoForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = -[NSPControlConnection flowIdentifier](self, "flowIdentifier");
      v10 = "Got connection info for flow %lu";
      v11 = v9;
      v12 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_19E8FE000, v11, v12, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = -[NSPControlConnection flowIdentifier](self, "flowIdentifier");
    v10 = "Failed to get connection info for flow %lu";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  v4[2](v4, v7);
}

- (unint64_t)flowIdentifier
{
  return self->_flowIdentifier;
}

@end
