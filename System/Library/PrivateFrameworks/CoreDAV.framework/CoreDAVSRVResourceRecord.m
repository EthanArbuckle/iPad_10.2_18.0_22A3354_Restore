@implementation CoreDAVSRVResourceRecord

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v9.receiver = self;
  v9.super_class = (Class)CoreDAVSRVResourceRecord;
  -[CoreDAVSRVResourceRecord description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVSRVResourceRecord serviceString](self, "serviceString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Service string: [%@]"), v5);

  -[CoreDAVSRVResourceRecord port](self, "port");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Port: [%@]"), v6);

  -[CoreDAVSRVResourceRecord target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Target: [%@]"), v7);

  return v3;
}

- (NSString)serviceString
{
  return self->_serviceString;
}

- (void)setServiceString:(id)a3
{
  objc_storeStrong((id *)&self->_serviceString, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (NSString)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
}

@end
