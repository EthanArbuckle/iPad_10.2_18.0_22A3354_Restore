@implementation BacklightdExportedObj

- (void)setServer:(id)a3
{
  self->_server = (BrightnessSystemInternal *)a3;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)registerNotificationForProperties:(id)a3
{
  id v3;

  if (-[BacklightdExportedObj server](self, "server"))
  {
    v3 = -[BacklightdExportedObj copyClientID](self, "copyClientID");
    -[BrightnessSystemInternal setNotificationProperties:forClient:](self->_server, "setNotificationProperties:forClient:", a3, v3);

  }
}

- (void)clientCopyPropertyWithKey:(id)a3 reply:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  void (**v10)(id, id, id);
  id v11;
  SEL v12;
  BacklightdExportedObj *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = (void (**)(id, id, id))a4;
  v9 = 0;
  v8 = -1;
  v7 = 0;
  v6 = 0;
  if (-[BacklightdExportedObj server](self, "server"))
  {
    v5 = -[BacklightdExportedObj copyClientID](v13, "copyClientID");
    v9 = -[BrightnessSystemInternal copyPropertyForKey:client:](-[BacklightdExportedObj server](v13, "server"), "copyPropertyForKey:client:", v11, v5);

    if (v9)
    {
      v8 = 0;
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v9, 0);

    }
  }
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
  v10[2](v10, v7, v6);

}

- (void)clientSetPropertyWithKey:(id)a3 property:(id)a4
{
  id v4;
  uint64_t v5;

  v5 = 0;
  if (a4 && objc_msgSend(a4, "count"))
    v5 = objc_msgSend(a4, "objectAtIndex:", 0);
  if (-[BacklightdExportedObj server](self, "server"))
  {
    v4 = -[BacklightdExportedObj copyClientID](self, "copyClientID");
    -[BrightnessSystemInternal setProperty:forKey:client:](-[BacklightdExportedObj server](self, "server"), "setProperty:forKey:client:", v5, a3, v4);

  }
}

- (BrightnessSystemInternal)server
{
  return self->_server;
}

- (id)copyClientID
{
  if (!self->_clientIDSet)
  {
    self->_clientID = -[NSXPCConnection hash](-[BacklightdExportedObj connection](self, "connection"), "hash");
    self->_clientIDSet = 1;
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", self->_clientID);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)clientSetSYNCPropertyWithKey:(id)a3 property:(id)a4 reply:(id)a5
{
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void (**v13)(id, id, id);
  id v14;
  id v15;
  SEL v16;
  BacklightdExportedObj *v17;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v13 = (void (**)(id, id, id))a5;
  v12 = 0;
  v11 = -1;
  v10 = 0;
  v9 = 0;
  if (a4 && objc_msgSend(v14, "count"))
    v12 = objc_msgSend(v14, "objectAtIndex:", 0);
  if (-[BacklightdExportedObj server](v17, "server"))
  {
    v8 = -[BacklightdExportedObj copyClientID](v17, "copyClientID");
    v7 = -[BrightnessSystemInternal setProperty:forKey:client:](-[BacklightdExportedObj server](v17, "server"), "setProperty:forKey:client:", v12, v15, v8);

    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7 & 1);
    if (v6)
    {
      v11 = 0;
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, 0);

    }
  }
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v9 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
  v13[2](v13, v10, v9);

}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  BacklightdExportedObj *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)BacklightdExportedObj;
  -[BacklightdExportedObj dealloc](&v2, sel_dealloc);
}

@end
