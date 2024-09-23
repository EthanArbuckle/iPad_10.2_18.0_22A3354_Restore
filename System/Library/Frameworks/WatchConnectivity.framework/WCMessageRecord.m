@implementation WCMessageRecord

- (WCMessageRecord)initWithIdentifier:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  WCMessageRecord *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  id errorHandler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WCMessageRecord;
  v8 = -[WCMessageRecord init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    errorHandler = v8->_errorHandler;
    v8->_errorHandler = (id)v11;

  }
  return v8;
}

- (void)dealloc
{
  NSObject *timeoutTimer;
  objc_super v4;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
    dispatch_source_cancel(timeoutTimer);
  v4.receiver = self;
  v4.super_class = (Class)WCMessageRecord;
  -[WCMessageRecord dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCMessageRecord identifier](self, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_errorHandler)
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, hasErrorHandler: %s>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WCMessageRecord *v4;
  WCMessageRecord *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WCMessageRecord *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WCMessageRecord identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCMessageRecord identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WCMessageRecord identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_source)timeoutTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimeoutTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
