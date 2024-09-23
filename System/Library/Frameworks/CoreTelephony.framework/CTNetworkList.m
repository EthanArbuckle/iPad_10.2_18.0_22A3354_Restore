@implementation CTNetworkList

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTNetworkList networks](self, "networks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", networks=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", moreComing=%d"), -[CTNetworkList moreComing](self, "moreComing"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTNetworkList networks](self, "networks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setNetworks:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTNetworkList networks](self, "networks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("networks"));

}

- (CTNetworkList)initWithCoder:(id)a3
{
  id v4;
  CTNetworkList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *networks;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTNetworkList;
  v5 = -[CTNetworkList init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("networks"));
    v9 = objc_claimAutoreleasedReturnValue();
    networks = v5->_networks;
    v5->_networks = (NSMutableArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSMutableArray)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_networks, a3);
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networks, 0);
}

@end
