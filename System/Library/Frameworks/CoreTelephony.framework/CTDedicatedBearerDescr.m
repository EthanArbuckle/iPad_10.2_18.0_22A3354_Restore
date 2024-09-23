@implementation CTDedicatedBearerDescr

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const char *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDedicatedBearerDescr src_ip](self, "src_ip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", src_ip=%@"), v4);

  -[CTDedicatedBearerDescr src_ports](self, "src_ports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", src_ports=%@"), v5);

  -[CTDedicatedBearerDescr remote_ip](self, "remote_ip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", remote_ip=%@"), v6);

  -[CTDedicatedBearerDescr remote_ports](self, "remote_ports");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", remote_ports=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", ip_protocol=%lu"), -[CTDedicatedBearerDescr ip_protocol](self, "ip_protocol"));
  -[CTDedicatedBearerDescr traffic_class](self, "traffic_class");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", traffic_class=%@"), v8);

  v9 = -[CTDedicatedBearerDescr direction](self, "direction");
  if (v9 > 2)
    v10 = "???";
  else
    v10 = off_1E1532DD0[v9];
  objc_msgSend(v3, "appendFormat:", CFSTR(", direction=%s"), v10);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTDedicatedBearerDescr)init
{
  CTDedicatedBearerDescr *v2;
  CTDedicatedBearerDescr *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTDedicatedBearerDescr;
  v2 = -[CTDedicatedBearerDescr init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CTDedicatedBearerDescr setIp_protocol:](v2, "setIp_protocol:", -1);
    -[CTDedicatedBearerDescr setDirection:](v3, "setDirection:", 2);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTDedicatedBearerDescr src_ip](self, "src_ip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setSrc_ip:", v7);

  -[CTDedicatedBearerDescr src_ports](self, "src_ports");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setSrc_ports:", v9);

  -[CTDedicatedBearerDescr remote_ip](self, "remote_ip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setRemote_ip:", v11);

  -[CTDedicatedBearerDescr remote_ports](self, "remote_ports");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setRemote_ports:", v13);

  objc_msgSend(v5, "setIp_protocol:", -[CTDedicatedBearerDescr ip_protocol](self, "ip_protocol"));
  -[CTDedicatedBearerDescr traffic_class](self, "traffic_class");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setTraffic_class:", v15);

  objc_msgSend(v5, "setDirection:", -[CTDedicatedBearerDescr direction](self, "direction"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CTDedicatedBearerDescr src_ip](self, "src_ip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("src_ip"));

  -[CTDedicatedBearerDescr src_ports](self, "src_ports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("src_ports"));

  -[CTDedicatedBearerDescr remote_ip](self, "remote_ip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("remote_ip"));

  -[CTDedicatedBearerDescr remote_ports](self, "remote_ports");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("remote_ports"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTDedicatedBearerDescr ip_protocol](self, "ip_protocol"), CFSTR("ip_protocol"));
  -[CTDedicatedBearerDescr traffic_class](self, "traffic_class");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("traffic_class"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTDedicatedBearerDescr direction](self, "direction"), CFSTR("direction"));
}

- (CTDedicatedBearerDescr)initWithCoder:(id)a3
{
  id v4;
  CTDedicatedBearerDescr *v5;
  uint64_t v6;
  NSString *src_ip;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *src_ports;
  uint64_t v13;
  NSString *remote_ip;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *remote_ports;
  uint64_t v20;
  NSString *traffic_class;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTDedicatedBearerDescr;
  v5 = -[CTDedicatedBearerDescr init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("src_ip"));
    v6 = objc_claimAutoreleasedReturnValue();
    src_ip = v5->_src_ip;
    v5->_src_ip = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("src_ports"));
    v11 = objc_claimAutoreleasedReturnValue();
    src_ports = v5->_src_ports;
    v5->_src_ports = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remote_ip"));
    v13 = objc_claimAutoreleasedReturnValue();
    remote_ip = v5->_remote_ip;
    v5->_remote_ip = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("remote_ports"));
    v18 = objc_claimAutoreleasedReturnValue();
    remote_ports = v5->_remote_ports;
    v5->_remote_ports = (NSArray *)v18;

    v5->_ip_protocol = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ip_protocol"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traffic_class"));
    v20 = objc_claimAutoreleasedReturnValue();
    traffic_class = v5->_traffic_class;
    v5->_traffic_class = (NSString *)v20;

    v5->_direction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)src_ip
{
  return self->_src_ip;
}

- (void)setSrc_ip:(id)a3
{
  objc_storeStrong((id *)&self->_src_ip, a3);
}

- (NSArray)src_ports
{
  return self->_src_ports;
}

- (void)setSrc_ports:(id)a3
{
  objc_storeStrong((id *)&self->_src_ports, a3);
}

- (NSString)remote_ip
{
  return self->_remote_ip;
}

- (void)setRemote_ip:(id)a3
{
  objc_storeStrong((id *)&self->_remote_ip, a3);
}

- (NSArray)remote_ports
{
  return self->_remote_ports;
}

- (void)setRemote_ports:(id)a3
{
  objc_storeStrong((id *)&self->_remote_ports, a3);
}

- (unint64_t)ip_protocol
{
  return self->_ip_protocol;
}

- (void)setIp_protocol:(unint64_t)a3
{
  self->_ip_protocol = a3;
}

- (NSString)traffic_class
{
  return self->_traffic_class;
}

- (void)setTraffic_class:(id)a3
{
  objc_storeStrong((id *)&self->_traffic_class, a3);
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traffic_class, 0);
  objc_storeStrong((id *)&self->_remote_ports, 0);
  objc_storeStrong((id *)&self->_remote_ip, 0);
  objc_storeStrong((id *)&self->_src_ports, 0);
  objc_storeStrong((id *)&self->_src_ip, 0);
}

@end
