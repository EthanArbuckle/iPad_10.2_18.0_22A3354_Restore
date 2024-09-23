@implementation DMFMDMv1InstallAppRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4B80;
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

- (DMFMDMv1InstallAppRequest)initWithCoder:(id)a3
{
  id v4;
  DMFMDMv1InstallAppRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *redemptionCode;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *originator;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *VPNUUIDString;
  void *v17;
  uint64_t v18;
  NSString *cellularSliceUUIDString;
  void *v20;
  uint64_t v21;
  NSString *contentFilterUUIDString;
  void *v23;
  uint64_t v24;
  NSString *DNSProxyUUIDString;
  void *v26;
  uint64_t v27;
  NSString *relayUUIDString;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *associatedDomains;
  void *v34;
  uint64_t v35;
  NSNumber *associatedDomainsEnableDirectDownloads;
  void *v37;
  uint64_t v38;
  NSNumber *removable;
  void *v40;
  uint64_t v41;
  NSNumber *tapToPayScreenLock;
  void *v43;
  uint64_t v44;
  NSNumber *allowUserToHide;
  void *v46;
  uint64_t v47;
  NSNumber *allowUserToLock;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSDictionary *configuration;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)DMFMDMv1InstallAppRequest;
  v5 = -[DMFInstallAppRequest initWithCoder:](&v64, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("redemptionCode"));
    v7 = objc_claimAutoreleasedReturnValue();
    redemptionCode = v5->_redemptionCode;
    v5->_redemptionCode = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_manage = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("originator"));
    v11 = objc_claimAutoreleasedReturnValue();
    originator = v5->_originator;
    v5->_originator = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managementOptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_managementOptions = objc_msgSend(v13, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("VPNUUIDString"));
    v15 = objc_claimAutoreleasedReturnValue();
    VPNUUIDString = v5->_VPNUUIDString;
    v5->_VPNUUIDString = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("cellularSliceUUIDString"));
    v18 = objc_claimAutoreleasedReturnValue();
    cellularSliceUUIDString = v5->_cellularSliceUUIDString;
    v5->_cellularSliceUUIDString = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("contentFilterUUIDString"));
    v21 = objc_claimAutoreleasedReturnValue();
    contentFilterUUIDString = v5->_contentFilterUUIDString;
    v5->_contentFilterUUIDString = (NSString *)v21;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("DNSProxyUUIDString"));
    v24 = objc_claimAutoreleasedReturnValue();
    DNSProxyUUIDString = v5->_DNSProxyUUIDString;
    v5->_DNSProxyUUIDString = (NSString *)v24;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("relayUUIDString"));
    v27 = objc_claimAutoreleasedReturnValue();
    relayUUIDString = v5->_relayUUIDString;
    v5->_relayUUIDString = (NSString *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("associatedDomains"));
    v32 = objc_claimAutoreleasedReturnValue();
    associatedDomains = v5->_associatedDomains;
    v5->_associatedDomains = (NSArray *)v32;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("associatedDomainsEnableDirectDownloads"));
    v35 = objc_claimAutoreleasedReturnValue();
    associatedDomainsEnableDirectDownloads = v5->_associatedDomainsEnableDirectDownloads;
    v5->_associatedDomainsEnableDirectDownloads = (NSNumber *)v35;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("removable"));
    v38 = objc_claimAutoreleasedReturnValue();
    removable = v5->_removable;
    v5->_removable = (NSNumber *)v38;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("tapToPayScreenLock"));
    v41 = objc_claimAutoreleasedReturnValue();
    tapToPayScreenLock = v5->_tapToPayScreenLock;
    v5->_tapToPayScreenLock = (NSNumber *)v41;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("allowUserToHide"));
    v44 = objc_claimAutoreleasedReturnValue();
    allowUserToHide = v5->_allowUserToHide;
    v5->_allowUserToHide = (NSNumber *)v44;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("allowUserToLock"));
    v47 = objc_claimAutoreleasedReturnValue();
    allowUserToLock = v5->_allowUserToLock;
    v5->_allowUserToLock = (NSNumber *)v47;

    v63 = (void *)MEMORY[0x1E0C99E60];
    v62 = objc_opt_class();
    v61 = objc_opt_class();
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    objc_msgSend(v63, "setWithObjects:", v62, v61, v49, v50, v51, v52, v53, v54, v55, v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("configuration"));
    v58 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v58;

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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)DMFMDMv1InstallAppRequest;
  v4 = a3;
  -[DMFInstallAppRequest encodeWithCoder:](&v21, sel_encodeWithCoder_, v4);
  -[DMFMDMv1InstallAppRequest redemptionCode](self, "redemptionCode", v21.receiver, v21.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("redemptionCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFMDMv1InstallAppRequest manage](self, "manage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("manage"));

  -[DMFMDMv1InstallAppRequest originator](self, "originator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("originator"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFMDMv1InstallAppRequest managementOptions](self, "managementOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("managementOptions"));

  -[DMFMDMv1InstallAppRequest VPNUUIDString](self, "VPNUUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("VPNUUIDString"));

  -[DMFMDMv1InstallAppRequest cellularSliceUUIDString](self, "cellularSliceUUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("cellularSliceUUIDString"));

  -[DMFMDMv1InstallAppRequest contentFilterUUIDString](self, "contentFilterUUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("contentFilterUUIDString"));

  -[DMFMDMv1InstallAppRequest DNSProxyUUIDString](self, "DNSProxyUUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("DNSProxyUUIDString"));

  -[DMFMDMv1InstallAppRequest relayUUIDString](self, "relayUUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("relayUUIDString"));

  -[DMFMDMv1InstallAppRequest associatedDomains](self, "associatedDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("associatedDomains"));

  -[DMFMDMv1InstallAppRequest associatedDomainsEnableDirectDownloads](self, "associatedDomainsEnableDirectDownloads");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("associatedDomainsEnableDirectDownloads"));

  -[DMFMDMv1InstallAppRequest removable](self, "removable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("removable"));

  -[DMFMDMv1InstallAppRequest tapToPayScreenLock](self, "tapToPayScreenLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("tapToPayScreenLock"));

  -[DMFMDMv1InstallAppRequest allowUserToHide](self, "allowUserToHide");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("allowUserToHide"));

  -[DMFMDMv1InstallAppRequest allowUserToLock](self, "allowUserToLock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("allowUserToLock"));

  -[DMFMDMv1InstallAppRequest configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("configuration"));

}

- (NSString)redemptionCode
{
  return self->_redemptionCode;
}

- (void)setRedemptionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)manage
{
  return self->_manage;
}

- (void)setManage:(BOOL)a3
{
  self->_manage = a3;
}

- (unint64_t)managementOptions
{
  return self->_managementOptions;
}

- (void)setManagementOptions:(unint64_t)a3
{
  self->_managementOptions = a3;
}

- (NSString)VPNUUIDString
{
  return self->_VPNUUIDString;
}

- (void)setVPNUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)cellularSliceUUIDString
{
  return self->_cellularSliceUUIDString;
}

- (void)setCellularSliceUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)contentFilterUUIDString
{
  return self->_contentFilterUUIDString;
}

- (void)setContentFilterUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)DNSProxyUUIDString
{
  return self->_DNSProxyUUIDString;
}

- (void)setDNSProxyUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)relayUUIDString
{
  return self->_relayUUIDString;
}

- (void)setRelayUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setRemovable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)tapToPayScreenLock
{
  return self->_tapToPayScreenLock;
}

- (void)setTapToPayScreenLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)allowUserToHide
{
  return self->_allowUserToHide;
}

- (void)setAllowUserToHide:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)allowUserToLock
{
  return self->_allowUserToLock;
}

- (void)setAllowUserToLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_allowUserToLock, 0);
  objc_storeStrong((id *)&self->_allowUserToHide, 0);
  objc_storeStrong((id *)&self->_tapToPayScreenLock, 0);
  objc_storeStrong((id *)&self->_removable, 0);
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_relayUUIDString, 0);
  objc_storeStrong((id *)&self->_DNSProxyUUIDString, 0);
  objc_storeStrong((id *)&self->_contentFilterUUIDString, 0);
  objc_storeStrong((id *)&self->_cellularSliceUUIDString, 0);
  objc_storeStrong((id *)&self->_VPNUUIDString, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_redemptionCode, 0);
}

@end
