@implementation _IDSGenericCompletionHandler

- (_IDSGenericCompletionHandler)initWithHandler:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _IDSGenericCompletionHandler *v9;
  _IDSGenericCompletionHandler *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging general](IDSLogging, "general");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v8);

    v9 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_IDSGenericCompletionHandler;
    v10 = -[_IDSGenericCompletionHandler init](&v14, sel_init);
    if (v10)
    {
      v11 = objc_msgSend(v6, "copy");
      handler = v10->_handler;
      v10->_handler = (id)v11;

      -[IDSDelegateInfo setQueue:](v10, "setQueue:", v7);
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (void)dealloc
{
  id handler;
  objc_super v4;

  handler = self->_handler;
  self->_handler = 0;

  -[IDSDelegateInfo setQueue:](self, "setQueue:", 0);
  v4.receiver = self;
  v4.super_class = (Class)_IDSGenericCompletionHandler;
  -[_IDSGenericCompletionHandler dealloc](&v4, sel_dealloc);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
