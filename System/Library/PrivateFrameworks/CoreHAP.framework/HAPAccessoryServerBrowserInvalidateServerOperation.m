@implementation HAPAccessoryServerBrowserInvalidateServerOperation

- (HAPAccessoryServerBrowserInvalidateServerOperation)initWithServer:(id)a3
{
  id v5;
  void *v6;
  HAPAccessoryServerBrowserInvalidateServerOperation *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HAPAccessoryServerBrowserInvalidateServerOperation;
  v7 = -[HAP2AsynchronousOperation initWithName:](&v9, sel_initWithName_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_server, a3);

  return v7;
}

- (void)main
{
  void *v3;
  _QWORD v4[5];

  -[HAPAccessoryServerBrowserInvalidateServerOperation server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__HAPAccessoryServerBrowserInvalidateServerOperation_main__block_invoke;
  v4[3] = &unk_1E894DD08;
  v4[4] = self;
  objc_msgSend(v3, "invalidateWithCompletionHandler:", v4);

}

- (HAPAccessoryServerIP)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

uint64_t __58__HAPAccessoryServerBrowserInvalidateServerOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

@end
