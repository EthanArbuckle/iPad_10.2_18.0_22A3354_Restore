@implementation WCDataMessageRecord

- (WCDataMessageRecord)initWithIdentifier:(id)a3 responseHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  WCDataMessageRecord *v9;
  uint64_t v10;
  id responseHandler;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WCDataMessageRecord;
  v9 = -[WCMessageRecord initWithIdentifier:errorHandler:](&v13, sel_initWithIdentifier_errorHandler_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    responseHandler = v9->_responseHandler;
    v9->_responseHandler = (id)v10;

  }
  return v9;
}

- (BOOL)expectsResponse
{
  void *v2;
  BOOL v3;

  -[WCDataMessageRecord responseHandler](self, "responseHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCMessageRecord identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDataMessageRecord responseHandler](self, "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = "YES";
  else
    v8 = "NO";
  -[WCMessageRecord errorHandler](self, "errorHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = "YES";
  else
    v10 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, hasResponseHandler %s, hasErrorHandler: %s>"), v5, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
}

@end
