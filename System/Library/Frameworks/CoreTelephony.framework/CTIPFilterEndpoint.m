@implementation CTIPFilterEndpoint

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTIPFilterEndpoint addr](self, "addr");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTIPFilterEndpoint addr](self, "addr");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", addr=%@"), v5);

  }
  -[CTIPFilterEndpoint maskLen](self, "maskLen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTIPFilterEndpoint maskLen](self, "maskLen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", maskLen=%@"), v7);

  }
  -[CTIPFilterEndpoint port](self, "port");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTIPFilterEndpoint port](self, "port");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", port=%@"), v9);

  }
  -[CTIPFilterEndpoint portRange](self, "portRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTIPFilterEndpoint portRange](self, "portRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", portRange=%@"), v11);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTIPFilterEndpoint addr](self, "addr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAddr:", v6);

  -[CTIPFilterEndpoint maskLen](self, "maskLen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMaskLen:", v8);

  -[CTIPFilterEndpoint port](self, "port");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPort:", v10);

  -[CTIPFilterEndpoint portRange](self, "portRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPortRange:", v12);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CTIPFilterEndpoint addr](self, "addr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("addr"));

  -[CTIPFilterEndpoint maskLen](self, "maskLen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maskLen"));

  -[CTIPFilterEndpoint port](self, "port");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("port"));

  -[CTIPFilterEndpoint portRange](self, "portRange");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("portRange"));

}

- (CTIPFilterEndpoint)initWithCoder:(id)a3
{
  id v4;
  CTIPFilterEndpoint *v5;
  uint64_t v6;
  NSString *addr;
  uint64_t v8;
  NSNumber *maskLen;
  uint64_t v10;
  NSNumber *port;
  uint64_t v12;
  NSNumber *portRange;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTIPFilterEndpoint;
  v5 = -[CTIPFilterEndpoint init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addr"));
    v6 = objc_claimAutoreleasedReturnValue();
    addr = v5->_addr;
    v5->_addr = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskLen"));
    v8 = objc_claimAutoreleasedReturnValue();
    maskLen = v5->_maskLen;
    v5->_maskLen = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("port"));
    v10 = objc_claimAutoreleasedReturnValue();
    port = v5->_port;
    v5->_port = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portRange"));
    v12 = objc_claimAutoreleasedReturnValue();
    portRange = v5->_portRange;
    v5->_portRange = (NSNumber *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)addr
{
  return self->_addr;
}

- (void)setAddr:(id)a3
{
  objc_storeStrong((id *)&self->_addr, a3);
}

- (NSNumber)maskLen
{
  return self->_maskLen;
}

- (void)setMaskLen:(id)a3
{
  objc_storeStrong((id *)&self->_maskLen, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (NSNumber)portRange
{
  return self->_portRange;
}

- (void)setPortRange:(id)a3
{
  objc_storeStrong((id *)&self->_portRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portRange, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_maskLen, 0);
  objc_storeStrong((id *)&self->_addr, 0);
}

@end
