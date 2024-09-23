@implementation AFUIClientSession

- (AFUIClientSession)init
{
  AFUIClientSession *v2;
  AFUIClientSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUIClientSession;
  v2 = -[AFUIClientSession init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AFUIClientSession _initializeBSServiceConnection](v2, "_initializeBSServiceConnection");
  return v3;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)AFUIClientSession;
  -[AFUIClientSession dealloc](&v4, sel_dealloc);
}

- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AFUIClientSession _presenter](self, "_presenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayForDocumentTraits:documentState:textOperationsHandler:", v10, v9, v8);

}

- (void)documentStateChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFUIClientSession _presenter](self, "_presenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentStateChanged:", v4);

}

- (void)hide
{
  id v2;

  -[AFUIClientSession _presenter](self, "_presenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hide");

}

- (void)_initializeBSServiceConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0FA08], "endpointForMachName:service:instance:", CFSTR("com.apple.inputservice.input-ui-host"), CFSTR("com.apple.inputservice.AutoFillUI"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FA00], "NSXPCConnectionWithEndpoint:configurator:", v6, &__block_literal_global_0);
  v3 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
  -[AFUIClientSession _configureNSXPCConnection:withMachName:](self, "_configureNSXPCConnection:withMachName:", v3, CFSTR("com.apple.inputservice.input-ui-host"));
  connection = self->_connection;
  self->_connection = v3;
  v5 = v3;

  -[NSXPCConnection activate](self->_connection, "activate");
}

void __51__AFUIClientSession__initializeBSServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE80B88];
  v3 = a2;
  objc_msgSend(v2, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPerMessageAssertionAttributes:", v5);

}

- (void)_configureNSXPCConnection:(id)a3 withMachName:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD1990];
  v5 = a3;
  objc_msgSend(v4, "interfaceWithProtocol:", &unk_25645D828);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

}

- (id)_presenter
{
  void *v2;
  void *v3;

  -[AFUIClientSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
