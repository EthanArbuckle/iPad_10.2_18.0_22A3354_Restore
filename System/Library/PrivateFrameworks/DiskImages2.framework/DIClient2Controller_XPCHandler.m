@implementation DIClient2Controller_XPCHandler

- (id)serviceName
{
  return CFSTR("com.apple.diskimagescontroller");
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B75508);
}

- (BOOL)connectWithError:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DIClient2Controller_XPCHandler;
  v5 = -[DIBaseXPCHandler connectWithError:](&v7, sel_connectWithError_);
  if (v5)
  {
    if (DIForwardLogs())
      LOBYTE(v5) = -[DIBaseXPCHandler dupStderrWithError:](self, "dupStderrWithError:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)newAttachWithParams:(id)a3 error:(id *)a4
{
  id v6;
  DIController2ClientDelegate *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(DIController2ClientDelegate);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B70F30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseXPCHandler connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExportedInterface:", v8);

  -[DIBaseXPCHandler connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExportedObject:", v7);

  -[DIBaseXPCHandler remoteProxy](self, "remoteProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __60__DIClient2Controller_XPCHandler_newAttachWithParams_error___block_invoke;
  v17 = &unk_24CEED908;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v11, "attachWithParams:reply:", v6, &v14);

  if (-[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4, v14, v15, v16, v17))
  {
    -[DIController2ClientDelegate deviceHandle](v7, "deviceHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v12;
}

- (BOOL)keychainUnlockWithEncryptionUnlocker:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[DIBaseXPCHandler remoteProxy](self, "remoteProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__DIClient2Controller_XPCHandler_keychainUnlockWithEncryptionUnlocker_error___block_invoke;
  v10[3] = &unk_24CEED998;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "keychainUnlockWithEncryptionUnlocker:reply:", v8, v10);

  LOBYTE(a4) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[DIBaseXPCHandler remoteProxy](self, "remoteProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__DIClient2Controller_XPCHandler_GUIAskForPassphraseWithEncryptionFrontend_error___block_invoke;
  v10[3] = &unk_24CEED9C0;
  objc_copyWeak(&v12, &location);
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "GUIAskForPassphraseWithEncryptionFrontend:reply:", v8, v10);

  LOBYTE(a4) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  -[DIBaseXPCHandler remoteProxy](self, "remoteProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__DIClient2Controller_XPCHandler_createAndStoreInSystemKeychainWithCreator_account_error___block_invoke;
  v13[3] = &unk_24CEED9E8;
  objc_copyWeak(&v15, &location);
  v11 = v8;
  v14 = v11;
  objc_msgSend(v10, "createAndStoreInSystemKeychainWithCreator:account:reply:", v11, v9, v13);

  LOBYTE(a5) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a5);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return (char)a5;
}

@end
