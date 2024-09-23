@implementation HDXPCClient

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (HDXPCClient)initWithConnection:(id)a3 process:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HDXPCClient *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDXPCClient.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDXPCClient.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = -[HDXPCClient _initWithConnection:process:](self, "_initWithConnection:process:", v7, v9);

  return v10;
}

- (id)_initWithConnection:(id)a3 process:(id)a4
{
  id v7;
  id v8;
  HDXPCClient *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDXPCClient;
  v9 = -[HDXPCClient init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (HDXPCProcess)process
{
  return (HDXPCProcess *)objc_getProperty(self, a2, 8, 1);
}

+ (id)clientWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[HDXPCProcess processWithConnection:error:](HDXPCProcess, "processWithConnection:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConnection:process:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (HDXPCClient)initWithProcess:(id)a3
{
  id v5;
  HDXPCClient *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDXPCClient.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("process != nil"));

  }
  v6 = -[HDXPCClient _initWithConnection:process:](self, "_initWithConnection:process:", 0, v5);

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  -[HDXPCClient process](self, "process");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v3) & 1) != 0 || (objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
    v6 = &stru_24CB19CC0;
  else
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR(" proc-bid=%@"), v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %@(%d) app-id=%@%@>"), objc_opt_class(), v3, objc_msgSend(v2, "processIdentifier"), v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
