@implementation BRGlobalProgressProxy

- (BRGlobalProgressProxy)initWithGlobalProgressKind:(id)a3
{
  id v5;
  void *v6;
  BRGlobalProgressProxy *v7;
  objc_super v9;

  v5 = a3;
  +[BRDaemonConnection mobileDocumentsURL](BRDaemonConnection, "mobileDocumentsURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BRGlobalProgressProxy;
  v7 = -[BRProgressProxy initWithURL:](&v9, sel_initWithURL_, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_kind, a3);
    -[BRProgressProxy setDelegate:](v7, "setDelegate:", v7);
  }

  return v7;
}

- (BOOL)progressProxy:(id)a3 shouldProxyProgress:(id)a4
{
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;

  objc_msgSend(a4, "userInfo", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB30C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_kind;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {
    v10 = 1;
  }
  else if (v8)
  {
    v10 = -[NSString isEqual:](v7, "isEqual:", v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)progressProxy:(id)a3 localizedDescriptionForProgress:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a4;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BRGlobalProgressLocalizedAndCapitalizedDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
