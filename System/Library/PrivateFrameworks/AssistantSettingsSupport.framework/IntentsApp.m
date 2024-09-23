@implementation IntentsApp

- (IntentsApp)initWithAppId:(id)a3 displayName:(id)a4 accessGranted:(BOOL)a5
{
  id v9;
  id v10;
  IntentsApp *v11;
  IntentsApp *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IntentsApp;
  v11 = -[IntentsApp init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appID, a3);
    objc_storeStrong((id *)&v12->_displayName, a4);
    v12->_accessGranted = a5;
  }

  return v12;
}

- (int64_t)compareWithIntentsApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IntentsApp displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSString)appID
{
  return self->_appID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)accessGranted
{
  return self->_accessGranted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
