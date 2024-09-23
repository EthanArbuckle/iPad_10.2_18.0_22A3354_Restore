@implementation CPSWatchAlertPresentationContext

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_systemAuthenticationRequest, CFSTR("systemAuthenticationRequest"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_restrictedAccessRequest, CFSTR("restrictedAccessRequest"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_storeAuthenticationRequest, CFSTR("storeAuthenticationRequest"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_xpcEndpoint, CFSTR("xpcEndpoint"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CPSWatchAlertPresentationContext)initWithXPCDictionary:(id)a3
{
  id v4;
  CPSWatchAlertPresentationContext *v5;
  void *v6;
  uint64_t v7;
  CPSSystemAuthenticationRequest *systemAuthenticationRequest;
  uint64_t v9;
  CPSRestrictedAccessRequest *restrictedAccessRequest;
  uint64_t v11;
  CPSStoreAuthenticationRequest *storeAuthenticationRequest;
  uint64_t v13;
  NSXPCListenerEndpoint *xpcEndpoint;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSWatchAlertPresentationContext;
  v5 = -[CPSWatchAlertPresentationContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemAuthenticationRequest"));
    v7 = objc_claimAutoreleasedReturnValue();
    systemAuthenticationRequest = v5->_systemAuthenticationRequest;
    v5->_systemAuthenticationRequest = (CPSSystemAuthenticationRequest *)v7;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restrictedAccessRequest"));
    v9 = objc_claimAutoreleasedReturnValue();
    restrictedAccessRequest = v5->_restrictedAccessRequest;
    v5->_restrictedAccessRequest = (CPSRestrictedAccessRequest *)v9;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeAuthenticationRequest"));
    v11 = objc_claimAutoreleasedReturnValue();
    storeAuthenticationRequest = v5->_storeAuthenticationRequest;
    v5->_storeAuthenticationRequest = (CPSStoreAuthenticationRequest *)v11;

    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xpcEndpoint"));
    v13 = objc_claimAutoreleasedReturnValue();
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (NSXPCListenerEndpoint *)v13;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE0BEC8], "coderWithMessage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemAuthenticationRequest, CFSTR("systemAuthenticationRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_restrictedAccessRequest, CFSTR("restrictedAccessRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_storeAuthenticationRequest, CFSTR("storeAuthenticationRequest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_xpcEndpoint, CFSTR("xpcEndpoint"));

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CPSSystemAuthenticationRequest)systemAuthenticationRequest
{
  return self->_systemAuthenticationRequest;
}

- (void)setSystemAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, a3);
}

- (CPSRestrictedAccessRequest)restrictedAccessRequest
{
  return self->_restrictedAccessRequest;
}

- (void)setRestrictedAccessRequest:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedAccessRequest, a3);
}

- (CPSStoreAuthenticationRequest)storeAuthenticationRequest
{
  return self->_storeAuthenticationRequest;
}

- (void)setStoreAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, a3);
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_restrictedAccessRequest, 0);
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
