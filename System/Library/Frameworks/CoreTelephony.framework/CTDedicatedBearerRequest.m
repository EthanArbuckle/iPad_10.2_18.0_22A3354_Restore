@implementation CTDedicatedBearerRequest

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDedicatedBearerRequest details](self, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", details=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTDedicatedBearerRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTDedicatedBearerRequest;
  return -[CTDedicatedBearerRequest init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTDedicatedBearerRequest details](self, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDetails:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTDedicatedBearerRequest details](self, "details");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kDBRdetails"));

}

- (CTDedicatedBearerRequest)initWithCoder:(id)a3
{
  id v4;
  CTDedicatedBearerRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *details;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTDedicatedBearerRequest;
  v5 = -[CTDedicatedBearerRequest init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kDBRdetails"));
    v11 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (NSArray *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
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
  objc_storeStrong((id *)&self->_details, 0);
}

@end
