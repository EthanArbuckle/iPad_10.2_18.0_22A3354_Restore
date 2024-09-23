@implementation _PMLowPowerMode

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_saver;
}

- (_PMLowPowerMode)init
{
  _PMLowPowerMode *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PMLowPowerMode;
  v2 = -[_PMLowPowerMode init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.powerd.lowpowermode"), 4096);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254616AF8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PMLowPowerMode;
  -[_PMLowPowerMode dealloc](&v3, sel_dealloc);
}

- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withCompletion:(id)a5
{
  -[_PMLowPowerMode setPowerMode:fromSource:withParams:withCompletion:](self, "setPowerMode:fromSource:withParams:withCompletion:", a3, a4, 0, a5);
}

- (void)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5 withCompletion:(id)a6
{
  id v10;
  NSXPCConnection *connection;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  connection = self->_connection;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69___PMLowPowerMode_setPowerMode_fromSource_withParams_withCompletion___block_invoke;
  v16[3] = &unk_24C37D7A8;
  v17 = v10;
  v12 = v10;
  v13 = a5;
  v14 = a4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPowerMode:fromSource:withParams:withCompletion:", a3, v14, v13, v12);

}

- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4
{
  return -[_PMLowPowerMode setPowerMode:fromSource:withParams:](self, "setPowerMode:fromSource:withParams:", a3, a4, 0);
}

- (BOOL)setPowerMode:(int64_t)a3 fromSource:(id)a4 withParams:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a4;
  v9 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke;
  v15[3] = &unk_24C37D7D0;
  v15[4] = &v16;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __54___PMLowPowerMode_setPowerMode_fromSource_withParams___block_invoke_2;
  v14[3] = &unk_24C37D7F8;
  v14[4] = &v16;
  objc_msgSend(v12, "setPowerMode:fromSource:withParams:withCompletion:", a3, v8, v9, v14);

  LOBYTE(a3) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return a3;
}

- (int64_t)getPowerMode
{
  void *v2;
  unsigned int v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
