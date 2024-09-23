@implementation HMFNetworkServiceInfo

- (HMFNetworkServiceInfo)initWithEndpoint:(id)a3 txtRecord:(id)a4
{
  NSObject *v6;
  id v7;
  char *bonjour_service_name;
  char *bonjour_service_type;
  char *bonjour_service_domain;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  HMFNetworkServiceInfo *v16;
  _QWORD applier[4];
  id v19;

  v6 = a3;
  v7 = a4;
  bonjour_service_name = (char *)nw_endpoint_get_bonjour_service_name(v6);
  if (bonjour_service_name)
    bonjour_service_name = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", bonjour_service_name);
  bonjour_service_type = (char *)nw_endpoint_get_bonjour_service_type(v6);
  if (bonjour_service_type)
    bonjour_service_type = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", bonjour_service_type);
  bonjour_service_domain = (char *)nw_endpoint_get_bonjour_service_domain(v6);
  if (bonjour_service_domain)
    bonjour_service_domain = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", bonjour_service_domain);
  v11 = v7;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", nw_txt_record_get_key_count(v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __txtRecordDictionary_block_invoke;
    applier[3] = &unk_1E3B394E8;
    v14 = v13;
    v19 = v14;
    if (nw_txt_record_apply(v12, applier))
      v15 = (void *)objc_msgSend(v14, "copy");
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  v16 = -[HMFNetworkServiceInfo initWithServiceName:serviceType:serviceDomain:txtRecord:](self, "initWithServiceName:serviceType:serviceDomain:txtRecord:", bonjour_service_name, bonjour_service_type, bonjour_service_domain, v15);
  return v16;
}

- (HMFNetworkServiceInfo)initWithServiceName:(id)a3 serviceType:(id)a4 serviceDomain:(id)a5 txtRecord:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMFNetworkServiceInfo *v15;
  HMFNetworkServiceInfo *v16;
  id *p_isa;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMFNetworkServiceInfo;
    v16 = -[HMFNetworkServiceInfo init](&v19, sel_init);
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_serviceName, a3);
      objc_storeStrong(p_isa + 4, a4);
      objc_storeStrong(p_isa + 5, a5);
      objc_storeStrong(p_isa + 2, a6);
    }
    self = p_isa;
    v15 = self;
  }

  return v15;
}

- (NSDictionary)txtRecord
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDictionary copy](self->_txtRecord, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSString)deviceID
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  void *v8;

  if (-[HMFNetworkServiceInfo isAirPlay](self, "isAirPlay"))
  {
    -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("deviceid");
  }
  else
  {
    -[HMFNetworkServiceInfo serviceType](self, "serviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("_companion-link._tcp"));

    -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v7)
      v5 = CFSTR("rpBA");
    else
      v5 = CFSTR("id");
  }
  objc_msgSend(v3, "hmf_stringForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)model
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  void *v8;

  if (-[HMFNetworkServiceInfo isAirPlay](self, "isAirPlay"))
  {
    -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("model");
  }
  else
  {
    -[HMFNetworkServiceInfo serviceType](self, "serviceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("_companion-link._tcp"));

    -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v7)
      v5 = CFSTR("rpMd");
    else
      v5 = CFSTR("md");
  }
  objc_msgSend(v3, "hmf_stringForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)category
{
  void *v2;
  void *v3;

  -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("ci"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)statusFlag
{
  void *v2;
  void *v3;

  -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("sf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)stateNumber
{
  void *v2;
  void *v3;

  -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("s#"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)configNumber
{
  void *v2;
  void *v3;

  -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", CFSTR("c#"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isUDP
{
  void *v4;
  char v5;

  if (-[HMFNetworkServiceInfo isMatter](self, "isMatter"))
    return 1;
  -[HMFNetworkServiceInfo serviceType](self, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("._udp"));

  return v5;
}

- (BOOL)isTCP
{
  void *v2;
  char v3;

  -[HMFNetworkServiceInfo serviceType](self, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("._tcp"));

  return v3;
}

- (BOOL)isAirPlay
{
  void *v2;
  char v3;

  -[HMFNetworkServiceInfo serviceType](self, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_airplay._tcp"));

  return v3;
}

- (BOOL)isHAP
{
  void *v3;
  char v4;
  void *v5;

  -[HMFNetworkServiceInfo serviceType](self, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_hap._tcp")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HMFNetworkServiceInfo serviceType](self, "serviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("_hap._udp"));

  }
  return v4;
}

- (BOOL)isMatter
{
  void *v3;
  char v4;
  void *v5;

  -[HMFNetworkServiceInfo serviceType](self, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_matter._tcp")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HMFNetworkServiceInfo serviceType](self, "serviceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("_matterc._udp"));

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v6, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkServiceInfo serviceName](self, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects(v8, v9);

  if (!v10)
    goto LABEL_9;
  objc_msgSend(v7, "serviceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkServiceInfo serviceType](self, "serviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HMFEqualObjects(v11, v12);

  if (!v13)
    goto LABEL_9;
  objc_msgSend(v7, "serviceDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFNetworkServiceInfo serviceDomain](self, "serviceDomain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HMFEqualObjects(v14, v15);

  if (v16)
  {
    objc_msgSend(v7, "txtRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFNetworkServiceInfo txtRecord](self, "txtRecord");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HMFEqualObjects(v17, v18);

  }
  else
  {
LABEL_9:
    v19 = 0;
  }

  return v19;
}

- (void)updateWithServiceInfo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  NSDictionary *v13;
  NSDictionary *txtRecord;
  void *v15;
  HMFNetworkServiceInfo *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v4, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects(v5, self->_serviceName);

  if (!v6)
    goto LABEL_5;
  objc_msgSend(v4, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HMFEqualObjects(v7, self->_serviceType);

  if (!v8)
    goto LABEL_5;
  objc_msgSend(v4, "serviceDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects(v9, self->_serviceDomain);

  if (!v10)
    goto LABEL_5;
  objc_msgSend(v4, "txtRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects(v11, self->_txtRecord);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v4, "txtRecord");
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    txtRecord = self->_txtRecord;
    self->_txtRecord = v13;

    os_unfair_lock_unlock(&self->_lock);
    v15 = (void *)MEMORY[0x1A1AC355C]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "txtRecord");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_19B546000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating with new txt record: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
  else
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_lock);
  }

}

+ (id)defaultServiceTypes
{
  if (_MergedGlobals_3_15 != -1)
    dispatch_once(&_MergedGlobals_3_15, &__block_literal_global_42);
  return (id)qword_1ED012FE8;
}

void __44__HMFNetworkServiceInfo_defaultServiceTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("_hap._tcp");
  v2[1] = CFSTR("_hap._udp");
  v2[2] = CFSTR("_airplay._tcp");
  v2[3] = CFSTR("_matter._tcp");
  v2[4] = CFSTR("_matterc._udp");
  v2[5] = CFSTR("_companion-link._tcp");
  v2[6] = CFSTR("_sleep-proxy._udp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012FE8;
  qword_1ED012FE8 = v0;

}

+ (id)logCategory
{
  if (qword_1ED012FF0 != -1)
    dispatch_once(&qword_1ED012FF0, &__block_literal_global_42);
  return (id)qword_1ED012FF8;
}

void __36__HMFNetworkServiceInfo_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle(CFSTR("HMFNetworkService"), CFSTR("com.apple.HMFoundation"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED012FF8;
  qword_1ED012FF8 = v0;

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)serviceDomain
{
  return self->_serviceDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDomain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
}

@end
