@implementation CBSProxyServer

- (CBSProxyServer)init
{
  return -[CBSProxyServer initWithServer:port:token:](self, "initWithServer:port:token:", &stru_24FCB15E8, &unk_24FCB4070, 0);
}

- (CBSProxyServer)initWithServer:(id)a3 port:(id)a4 token:(id)a5
{
  id v9;
  id v10;
  id v11;
  CBSProxyServer *v12;
  CBSProxyServer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CBSProxyServer;
  v12 = -[CBSProxyServer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_server, a3);
    objc_storeStrong((id *)&v13->_port, a4);
    objc_storeStrong((id *)&v13->_token, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBSProxyServer server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBSProxyServer port](self, "port");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBSProxyServer token](self, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; server = %@, port = %@, token = %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBSProxyServer)initWithCoder:(id)a3
{
  id v4;
  CBSProxyServer *v5;
  uint64_t v6;
  NSString *server;
  uint64_t v8;
  NSNumber *port;
  uint64_t v10;
  NSString *token;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CBSProxyServer;
  v5 = -[CBSProxyServer init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("server"));
    v6 = objc_claimAutoreleasedReturnValue();
    server = v5->_server;
    v5->_server = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("port"));
    v8 = objc_claimAutoreleasedReturnValue();
    port = v5->_port;
    v5->_port = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v10 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CBSProxyServer server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("server"));

  -[CBSProxyServer port](self, "port");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("port"));

  -[CBSProxyServer token](self, "token");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("token"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CBSProxyServer *v4;
  void *v5;
  uint64_t v6;
  NSString *server;
  void *v8;
  uint64_t v9;
  NSNumber *port;
  void *v11;
  uint64_t v12;
  NSString *token;

  v4 = objc_alloc_init(CBSProxyServer);
  -[CBSProxyServer server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  server = v4->_server;
  v4->_server = (NSString *)v6;

  -[CBSProxyServer port](self, "port");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  port = v4->_port;
  v4->_port = (NSNumber *)v9;

  -[CBSProxyServer token](self, "token");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  token = v4->_token;
  v4->_token = (NSString *)v12;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CBSProxyServer *v4;
  char v5;
  CBSProxyServer *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (CBSProxyServer *)a3;
  v5 = self == v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[CBSProxyServer server](self, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSProxyServer server](v6, "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    -[CBSProxyServer port](self, "port");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSProxyServer port](v6, "port");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

    -[CBSProxyServer token](self, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (-[CBSProxyServer token](v6, "token"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CBSProxyServer token](self, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBSProxyServer token](v6, "token");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if (v13)
      {
LABEL_8:

        v5 = v9 & v12 & v16;
        goto LABEL_9;
      }
    }
    else
    {
      v16 = 1;
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
