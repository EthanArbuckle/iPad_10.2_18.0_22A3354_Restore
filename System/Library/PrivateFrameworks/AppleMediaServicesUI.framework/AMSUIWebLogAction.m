@implementation AMSUIWebLogAction

- (AMSUIWebLogAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6;
  AMSUIWebLogAction *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *message;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebLogAction;
  v7 = -[AMSUIWebAction initWithJSObject:context:](&v16, sel_initWithJSObject_context_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("level"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7->_level = objc_msgSend(v8, "integerValue");
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    message = v7->_message;
    v7->_message = (NSString *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sensitive"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sensitive"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_sensitive = objc_msgSend(v14, "BOOLValue");

    }
    else
    {
      v7->_sensitive = 1;
    }

  }
  return v7;
}

- (id)runAction
{
  id v3;
  os_log_type_t v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebLogAction;
  v3 = -[AMSUIWebAction runAction](&v12, sel_runAction);
  v4 = -[AMSUIWebLogAction _logTypeFromLevel:](self, "_logTypeFromLevel:", -[AMSUIWebLogAction level](self, "level"));
  if (-[AMSUIWebLogAction sensitive](self, "sensitive") && !os_variant_has_internal_content())
  {
    v5 = CFSTR("<private>");
  }
  else
  {
    -[AMSUIWebLogAction message](self, "message");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, v4))
  {
    -[AMSUIWebAction context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_211102000, v7, v4, "JSLog: [%{public}@] %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unsigned)_logTypeFromLevel:(int64_t)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[AMSUIWebLogAction level](self, "level", a3);
  v4 = 0x1101100002uLL >> (8 * v3);
  if (v3 >= 5)
    LOBYTE(v4) = 0;
  return v4;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
