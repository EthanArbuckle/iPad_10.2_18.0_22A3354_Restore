@implementation DMFSetAppExtensionUUIDsRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4B38;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppExtensionUUIDsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetAppExtensionUUIDsRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *VPNUUIDString;
  void *v9;
  uint64_t v10;
  NSString *cellularSliceUUIDString;
  void *v12;
  uint64_t v13;
  NSString *contentFilterUUIDString;
  void *v15;
  uint64_t v16;
  NSString *DNSProxyUUIDString;
  void *v18;
  uint64_t v19;
  NSString *relayUUIDString;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFSetAppExtensionUUIDsRequest;
  v5 = -[DMFAppRequest initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("VPNUUIDString"));
    v7 = objc_claimAutoreleasedReturnValue();
    VPNUUIDString = v5->_VPNUUIDString;
    v5->_VPNUUIDString = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("cellularSliceUUIDString"));
    v10 = objc_claimAutoreleasedReturnValue();
    cellularSliceUUIDString = v5->_cellularSliceUUIDString;
    v5->_cellularSliceUUIDString = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("contentFilterUUIDString"));
    v13 = objc_claimAutoreleasedReturnValue();
    contentFilterUUIDString = v5->_contentFilterUUIDString;
    v5->_contentFilterUUIDString = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("DNSProxyUUIDString"));
    v16 = objc_claimAutoreleasedReturnValue();
    DNSProxyUUIDString = v5->_DNSProxyUUIDString;
    v5->_DNSProxyUUIDString = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("relayUUIDString"));
    v19 = objc_claimAutoreleasedReturnValue();
    relayUUIDString = v5->_relayUUIDString;
    v5->_relayUUIDString = (NSString *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppExtensionUUIDsRequest;
  v4 = a3;
  -[DMFAppRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[DMFSetAppExtensionUUIDsRequest VPNUUIDString](self, "VPNUUIDString", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("VPNUUIDString"));

  -[DMFSetAppExtensionUUIDsRequest cellularSliceUUIDString](self, "cellularSliceUUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cellularSliceUUIDString"));

  -[DMFSetAppExtensionUUIDsRequest contentFilterUUIDString](self, "contentFilterUUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contentFilterUUIDString"));

  -[DMFSetAppExtensionUUIDsRequest DNSProxyUUIDString](self, "DNSProxyUUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("DNSProxyUUIDString"));

  -[DMFSetAppExtensionUUIDsRequest relayUUIDString](self, "relayUUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("relayUUIDString"));

}

- (NSString)VPNUUIDString
{
  return self->_VPNUUIDString;
}

- (void)setVPNUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)cellularSliceUUIDString
{
  return self->_cellularSliceUUIDString;
}

- (void)setCellularSliceUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)contentFilterUUIDString
{
  return self->_contentFilterUUIDString;
}

- (void)setContentFilterUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)DNSProxyUUIDString
{
  return self->_DNSProxyUUIDString;
}

- (void)setDNSProxyUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)relayUUIDString
{
  return self->_relayUUIDString;
}

- (void)setRelayUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayUUIDString, 0);
  objc_storeStrong((id *)&self->_DNSProxyUUIDString, 0);
  objc_storeStrong((id *)&self->_contentFilterUUIDString, 0);
  objc_storeStrong((id *)&self->_cellularSliceUUIDString, 0);
  objc_storeStrong((id *)&self->_VPNUUIDString, 0);
}

@end
