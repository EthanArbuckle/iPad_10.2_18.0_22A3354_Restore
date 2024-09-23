@implementation CTTrafficDescriptor

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTrafficDescriptor bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTTrafficDescriptor bundleId](self, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", bundleId=%@"), v5);

  }
  -[CTTrafficDescriptor accountId](self, "accountId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTTrafficDescriptor accountId](self, "accountId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", accountId=%@"), v7);

  }
  -[CTTrafficDescriptor appCategory](self, "appCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTTrafficDescriptor appCategory](self, "appCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", appCategory=%@"), v9);

  }
  -[CTTrafficDescriptor llphs](self, "llphs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTTrafficDescriptor llphs](self, "llphs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", llphs=%@"), v11);

  }
  -[CTTrafficDescriptor host](self, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CTTrafficDescriptor host](self, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", host=%@"), v13);

  }
  -[CTTrafficDescriptor address](self, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CTTrafficDescriptor address](self, "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", address=%@"), v15);

  }
  -[CTTrafficDescriptor port](self, "port");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CTTrafficDescriptor port](self, "port");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", port=%@"), v17);

  }
  -[CTTrafficDescriptor portRangeLow](self, "portRangeLow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CTTrafficDescriptor portRangeLow](self, "portRangeLow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", portRangeLow=%@"), v19);

  }
  -[CTTrafficDescriptor portRangeUpper](self, "portRangeUpper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CTTrafficDescriptor portRangeUpper](self, "portRangeUpper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", portRangeUpper=%@"), v21);

  }
  -[CTTrafficDescriptor ipProtocol](self, "ipProtocol");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CTTrafficDescriptor ipProtocol](self, "ipProtocol");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", ipProtocol=%@"), v23);

  }
  -[CTTrafficDescriptor trafficClass](self, "trafficClass");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CTTrafficDescriptor trafficClass](self, "trafficClass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", trafficClass=%@"), v25);

  }
  -[CTTrafficDescriptor dnn](self, "dnn");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CTTrafficDescriptor dnn](self, "dnn");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", dnn=%@"), v27);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTTrafficDescriptor bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CTTrafficDescriptor bundleId](self, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setBundleId:", v7);

  }
  -[CTTrafficDescriptor accountId](self, "accountId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTTrafficDescriptor accountId](self, "accountId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setAccountId:", v10);

  }
  -[CTTrafficDescriptor appCategory](self, "appCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CTTrafficDescriptor appCategory](self, "appCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v4, "setAppCategory:", v13);

  }
  -[CTTrafficDescriptor llphs](self, "llphs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CTTrafficDescriptor llphs](self, "llphs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v4, "setLlphs:", v16);

  }
  -[CTTrafficDescriptor host](self, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CTTrafficDescriptor host](self, "host");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v4, "setHost:", v19);

  }
  -[CTTrafficDescriptor address](self, "address");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CTTrafficDescriptor address](self, "address");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v4, "setAddress:", v22);

  }
  -[CTTrafficDescriptor port](self, "port");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CTTrafficDescriptor port](self, "port");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v4, "setPort:", v25);

  }
  -[CTTrafficDescriptor portRangeLow](self, "portRangeLow");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CTTrafficDescriptor portRangeLow](self, "portRangeLow");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v4, "setPortRangeLow:", v28);

  }
  -[CTTrafficDescriptor portRangeUpper](self, "portRangeUpper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[CTTrafficDescriptor portRangeUpper](self, "portRangeUpper");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v4, "setPortRangeUpper:", v31);

  }
  -[CTTrafficDescriptor ipProtocol](self, "ipProtocol");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CTTrafficDescriptor ipProtocol](self, "ipProtocol");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v4, "setIpProtocol:", v34);

  }
  -[CTTrafficDescriptor trafficClass](self, "trafficClass");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[CTTrafficDescriptor trafficClass](self, "trafficClass");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(v4, "setTrafficClass:", v37);

  }
  -[CTTrafficDescriptor dnn](self, "dnn");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[CTTrafficDescriptor dnn](self, "dnn");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "copy");
    objc_msgSend(v4, "setDnn:", v40);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  -[CTTrafficDescriptor bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTTrafficDescriptor bundleId](self, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v5, CFSTR("bundleId"));

  }
  -[CTTrafficDescriptor accountId](self, "accountId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTTrafficDescriptor accountId](self, "accountId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v7, CFSTR("accountId"));

  }
  -[CTTrafficDescriptor appCategory](self, "appCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTTrafficDescriptor appCategory](self, "appCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v9, CFSTR("appCategory"));

  }
  -[CTTrafficDescriptor llphs](self, "llphs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTTrafficDescriptor llphs](self, "llphs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v11, CFSTR("llphs"));

  }
  -[CTTrafficDescriptor host](self, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CTTrafficDescriptor host](self, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v13, CFSTR("host"));

  }
  -[CTTrafficDescriptor address](self, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CTTrafficDescriptor address](self, "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v15, CFSTR("address"));

  }
  -[CTTrafficDescriptor port](self, "port");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CTTrafficDescriptor port](self, "port");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v17, CFSTR("port"));

  }
  -[CTTrafficDescriptor portRangeLow](self, "portRangeLow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CTTrafficDescriptor portRangeLow](self, "portRangeLow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v19, CFSTR("portRangeLow"));

  }
  -[CTTrafficDescriptor portRangeUpper](self, "portRangeUpper");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CTTrafficDescriptor portRangeUpper](self, "portRangeUpper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v21, CFSTR("portRangeUpper"));

  }
  -[CTTrafficDescriptor ipProtocol](self, "ipProtocol");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[CTTrafficDescriptor ipProtocol](self, "ipProtocol");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v23, CFSTR("ipProtocol"));

  }
  -[CTTrafficDescriptor trafficClass](self, "trafficClass");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[CTTrafficDescriptor trafficClass](self, "trafficClass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v25, CFSTR("trafficClass"));

  }
  -[CTTrafficDescriptor dnn](self, "dnn");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[CTTrafficDescriptor dnn](self, "dnn");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v27, CFSTR("dnn"));

  }
}

- (CTTrafficDescriptor)initWithCoder:(id)a3
{
  id v4;
  CTTrafficDescriptor *v5;
  uint64_t v6;
  NSString *bundleId;
  uint64_t v8;
  NSString *accountId;
  uint64_t v10;
  NSString *appCategory;
  uint64_t v12;
  NSString *host;
  uint64_t v14;
  NSNumber *llphs;
  uint64_t v16;
  NSString *address;
  uint64_t v18;
  NSNumber *port;
  uint64_t v20;
  NSNumber *portRangeLow;
  uint64_t v22;
  NSNumber *portRangeUpper;
  uint64_t v24;
  NSNumber *ipProtocol;
  uint64_t v26;
  NSNumber *trafficClass;
  uint64_t v28;
  NSString *dnn;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CTTrafficDescriptor;
  v5 = -[CTTrafficDescriptor init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountId"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appCategory"));
    v10 = objc_claimAutoreleasedReturnValue();
    appCategory = v5->_appCategory;
    v5->_appCategory = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("host"));
    v12 = objc_claimAutoreleasedReturnValue();
    host = v5->_host;
    v5->_host = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("llphs"));
    v14 = objc_claimAutoreleasedReturnValue();
    llphs = v5->_llphs;
    v5->_llphs = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v16 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("port"));
    v18 = objc_claimAutoreleasedReturnValue();
    port = v5->_port;
    v5->_port = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portRangeLow"));
    v20 = objc_claimAutoreleasedReturnValue();
    portRangeLow = v5->_portRangeLow;
    v5->_portRangeLow = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portRangeUpper"));
    v22 = objc_claimAutoreleasedReturnValue();
    portRangeUpper = v5->_portRangeUpper;
    v5->_portRangeUpper = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipProtocol"));
    v24 = objc_claimAutoreleasedReturnValue();
    ipProtocol = v5->_ipProtocol;
    v5->_ipProtocol = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trafficClass"));
    v26 = objc_claimAutoreleasedReturnValue();
    trafficClass = v5->_trafficClass;
    v5->_trafficClass = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dnn"));
    v28 = objc_claimAutoreleasedReturnValue();
    dnn = v5->_dnn;
    v5->_dnn = (NSString *)v28;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)appCategory
{
  return self->_appCategory;
}

- (void)setAppCategory:(id)a3
{
  objc_storeStrong((id *)&self->_appCategory, a3);
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_storeStrong((id *)&self->_accountId, a3);
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSNumber)llphs
{
  return self->_llphs;
}

- (void)setLlphs:(id)a3
{
  objc_storeStrong((id *)&self->_llphs, a3);
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
  objc_storeStrong((id *)&self->_port, a3);
}

- (NSNumber)portRangeLow
{
  return self->_portRangeLow;
}

- (void)setPortRangeLow:(id)a3
{
  objc_storeStrong((id *)&self->_portRangeLow, a3);
}

- (NSNumber)portRangeUpper
{
  return self->_portRangeUpper;
}

- (void)setPortRangeUpper:(id)a3
{
  objc_storeStrong((id *)&self->_portRangeUpper, a3);
}

- (NSNumber)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_ipProtocol, a3);
}

- (NSNumber)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(id)a3
{
  objc_storeStrong((id *)&self->_trafficClass, a3);
}

- (NSString)dnn
{
  return self->_dnn;
}

- (void)setDnn:(id)a3
{
  objc_storeStrong((id *)&self->_dnn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnn, 0);
  objc_storeStrong((id *)&self->_trafficClass, 0);
  objc_storeStrong((id *)&self->_ipProtocol, 0);
  objc_storeStrong((id *)&self->_portRangeUpper, 0);
  objc_storeStrong((id *)&self->_portRangeLow, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_llphs, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_appCategory, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
