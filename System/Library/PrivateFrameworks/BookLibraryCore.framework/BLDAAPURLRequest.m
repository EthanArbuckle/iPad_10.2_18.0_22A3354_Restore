@implementation BLDAAPURLRequest

- (BLDAAPURLRequest)initWithDSID:(id)a3 reason:(int64_t)a4
{
  id v7;
  BLDAAPURLRequest *v8;
  BLDAAPURLRequest *v9;
  NSString *daapURL;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLDAAPURLRequest;
  v8 = -[BLDAAPURLRequest init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_DSID, a3);
    v9->_reason = a4;
    daapURL = v9->_daapURL;
    v9->_daapURL = (NSString *)&stru_24CE8D258;
    v9->_requestMethod = 4;

  }
  return v9;
}

- (void)_requestWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB4044;
  v6[3] = &unk_24CE8B2F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLDAAPURLRequest _URLWithCompletionHandler:](self, "_URLWithCompletionHandler:", v6);

}

- (id)createDaapURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BLDAAPURLRequest daapURL](self, "daapURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)executeWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB44B0;
  v6[3] = &unk_24CE8C060;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLDAAPURLRequest _requestWithCompletionHandler:](self, "_requestWithCompletionHandler:", v6);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDAAPURLRequest daapURL](self, "daapURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BLDAAPURLRequest requestMethod](self, "requestMethod");
  -[BLDAAPURLRequest DSID](self, "DSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p url=%@ requestMethod=%ld dsid=%@ reason=%ld>"), v5, self, v6, v7, v8, -[BLDAAPURLRequest reason](self, "reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_URLWithCompletionHandler:(id)a3
{
  -[BLDAAPURLRequest _URLWithRetry:completion:](self, "_URLWithRetry:completion:", 1, a3);
}

- (void)_URLWithRetry:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212CB48B4;
  v8[3] = &unk_24CE8C088;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[BLDAAPURLRequest _valueForDAAPBagKey:completion:](self, "_valueForDAAPBagKey:completion:", CFSTR("base-url"), v8);

}

- (void)_valueForDAAPBagKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CB4A58;
  v10[3] = &unk_24CE8C0B0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BLDAAPURLRequest _serverParametersWithCompletionHandler:](self, "_serverParametersWithCompletionHandler:", v10);

}

- (void)_serverParametersWithCompletionHandler:(id)a3
{
  id v4;
  BUBag *bag;
  BUBag *v6;
  BUBag *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  bag = self->_bag;
  if (!bag)
  {
    objc_msgSend(MEMORY[0x24BE0FBF8], "defaultBag");
    v6 = (BUBag *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bag;
    self->_bag = v6;

    bag = self->_bag;
  }
  -[BUBag purchaseDAAP](bag, "purchaseDAAP");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CB4BDC;
  v10[3] = &unk_24CE8C0D8;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "valueWithCompletion:", v10);

}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_storeStrong((id *)&self->_DSID, a3);
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSString)daapURL
{
  return self->_daapURL;
}

- (void)setDaapURL:(id)a3
{
  objc_storeStrong((id *)&self->_daapURL, a3);
}

- (int64_t)requestMethod
{
  return self->_requestMethod;
}

- (void)setRequestMethod:(int64_t)a3
{
  self->_requestMethod = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (int64_t)dataEncoding
{
  return self->_dataEncoding;
}

- (void)setDataEncoding:(int64_t)a3
{
  self->_dataEncoding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daapURL, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
