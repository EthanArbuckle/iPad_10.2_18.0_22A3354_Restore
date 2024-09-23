@implementation SODNSSRVResponse

- (SODNSSRVResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SODNSSRVResponse;
  return -[SODNSSRVResponse init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SODNSSRVResponse host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("host: %@, port: %d"), v4, -[SODNSSRVResponse port](self, "port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
}

@end
