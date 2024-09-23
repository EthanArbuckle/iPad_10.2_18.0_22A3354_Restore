@implementation IMBalloonAppExtension

- (id)version
{
  void *v2;
  void *v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (LSPlugInKitProxy)proxy
{
  return self->_proxy;
}

- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5
{
  id v9;
  id v10;
  void *v11;
  IMBalloonAppExtension *v12;
  objc_super v14;

  v9 = a4;
  v10 = a3;
  +[IMBalloonApp appWithPluginBundle:pluginKitProxy:extension:](IMBalloonApp, "appWithPluginBundle:pluginKitProxy:extension:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)IMBalloonAppExtension;
  v12 = -[IMBalloonPlugin initWithBundle:app:](&v14, sel_initWithBundle_app_, v10, v11);

  if (v12)
    objc_storeStrong((id *)&v12->_proxy, a4);

  return v12;
}

- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 extension:(id)a4
{
  double v4;
  id v7;
  id v8;
  id v9;
  IMBalloonAppExtension *v10;

  sub_1A219B2A0(v4);
  v8 = v7;
  v9 = a3;
  v10 = -[IMBalloonAppExtension _initWithPluginBundle:extension:pluginKitProxyClass:](self, "_initWithPluginBundle:extension:pluginKitProxyClass:", v9, v8, objc_opt_class());

  return v10;
}

- (IMBalloonAppExtension)initWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  IMBalloonAppExtension *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  +[IMBalloonApp appWithPluginBundle:appBundle:](IMBalloonApp, "appWithPluginBundle:appBundle:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)IMBalloonAppExtension;
  v9 = -[IMBalloonPlugin initWithBundle:app:](&v16, sel_initWithBundle_app_, v7, v8);

  if (v9)
  {
    objc_msgSend(v6, "infoDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBalloonPlugin browserImageName](v9, "browserImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("CKBrowserDisplayImageName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
        -[IMBalloonPlugin setBrowserImageName:](v9, "setBrowserImageName:", v12);

    }
    -[IMBalloonPlugin browserImagePath](v9, "browserImagePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("kCKBrowserDisplayImagePath"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
        -[IMBalloonPlugin setBrowserImagePath:](v9, "setBrowserImagePath:", v14);

    }
  }

  return v9;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (id)_initWithPluginBundle:(id)a3 extension:(id)a4 pluginKitProxyClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  IMBalloonAppExtension *v13;
  id *p_isa;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class pluginKitProxyForIdentifier:](a5, "pluginKitProxyForIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = -[IMBalloonAppExtension initWithPluginBundle:pluginKitProxy:extension:](self, "initWithPluginBundle:pluginKitProxy:extension:", v8, v12, v10);
  p_isa = (id *)&v13->super.super.isa;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extension, a4);
    objc_storeStrong(p_isa + 20, v12);
  }

  return p_isa;
}

- (BOOL)isBetaPlugin
{
  void *v2;
  char v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBetaPlugin");

  return v3;
}

- (PKPlugIn)plugin
{
  void *v2;
  void *v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPlugIn *)v3;
}

- (BOOL)shouldBalloonHideAppIcon
{
  void *v2;
  char v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldBalloonHideAppIcon");

  return v3;
}

- (BOOL)shouldBreadcrumbHideAppIcon
{
  void *v2;
  char v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldBreadcrumbHideAppIcon");

  return v3;
}

- (BOOL)isLaunchProhibited
{
  void *v2;
  char v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLaunchProhibited");

  return v3;
}

- (NSNumber)itemID
{
  void *v2;
  void *v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (BOOL)canSendDataPayloads
{
  void *v2;
  char v3;

  -[IMBalloonPlugin app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canSendDataPayloads");

  return v3;
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void)setCanSendDataPayloads:(BOOL)a3
{
  self->_canSendDataPayloads = a3;
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
