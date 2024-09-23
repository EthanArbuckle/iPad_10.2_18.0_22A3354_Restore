@implementation HAPBTLEServiceSignature

- (HAPBTLEServiceSignature)initWithServiceType:(id)a3 serviceInstanceID:(id)a4 serviceProperties:(unint64_t)a5 linkedServices:(id)a6 authenticated:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  HAPBTLEServiceSignature *v15;
  uint64_t v16;
  NSUUID *serviceType;
  uint64_t v18;
  NSNumber *serviceInstanceID;
  uint64_t v20;
  NSArray *linkedServices;
  HAPBTLEServiceSignature *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  const char *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!v12)
  {
    v23 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      v32 = 2112;
      v33 = (id)objc_opt_class();
      v26 = v33;
      v27 = "%{public}@[%@] The service type is required";
LABEL_10:
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);

    }
LABEL_11:

    objc_autoreleasePoolPop(v23);
    v22 = 0;
    goto LABEL_12;
  }
  if (!v13)
  {
    v23 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      v32 = 2112;
      v33 = (id)objc_opt_class();
      v26 = v33;
      v27 = "%{public}@[%@] The service instance ID is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v29.receiver = self;
  v29.super_class = (Class)HAPBTLEServiceSignature;
  v15 = -[HAPBTLEServiceSignature init](&v29, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    serviceType = v15->_serviceType;
    v15->_serviceType = (NSUUID *)v16;

    v18 = objc_msgSend(v13, "copy");
    serviceInstanceID = v15->_serviceInstanceID;
    v15->_serviceInstanceID = (NSNumber *)v18;

    v15->_serviceProperties = a5;
    v20 = objc_msgSend(v14, "copy");
    linkedServices = v15->_linkedServices;
    v15->_linkedServices = (NSArray *)v20;

    v15->_authenticated = a7;
  }
  self = v15;
  v22 = self;
LABEL_12:

  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBTLEServiceSignature serviceType](self, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBTLEServiceSignature serviceInstanceID](self, "serviceInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPBTLEServiceSignature serviceProperties](self, "serviceProperties");
  -[HAPBTLEServiceSignature linkedServices](self, "linkedServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Service Signature: Type : %@, InstanceID : %@, Properties : %tu, Linked Services : %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)serviceType
{
  return self->_serviceType;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
