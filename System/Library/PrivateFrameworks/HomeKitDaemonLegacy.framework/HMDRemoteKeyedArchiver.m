@implementation HMDRemoteKeyedArchiver

- (id)initForWritingWithRemoteDeviceIsOnSameAccount:(BOOL)a3 remoteGateway:(BOOL)a4 remoteUserIsAdministrator:(BOOL)a5 user:(id)a6 dataVersion:(int64_t)a7 supportedFeatures:(id)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v14;
  id v15;
  HMDRemoteKeyedArchiver *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSKeyedArchiver *archiver;
  NSKeyedArchiver *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v14 = a6;
  v15 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMDRemoteKeyedArchiver;
  v16 = -[HMDRemoteKeyedArchiver init](&v27, sel_init);
  if (!v16)
    goto LABEL_12;
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v19;
    v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Encoding for user : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  archiver = v16->_archiver;
  v16->_archiver = (NSKeyedArchiver *)v20;

  objc_setAssociatedObject(v16->_archiver, CFSTR("kTransportTypeAssociationKey"), MEMORY[0x1E0C9AAB0], (void *)0x301);
  if (v12)
  {
    objc_setAssociatedObject(v16->_archiver, CFSTR("DeviceIsOnSameAccountKey"), MEMORY[0x1E0C9AAB0], (void *)0x301);
    if (!v11)
    {
LABEL_6:
      if (!v10)
        goto LABEL_7;
LABEL_15:
      objc_setAssociatedObject(v16->_archiver, CFSTR("RemoteUserIsAdministrator"), MEMORY[0x1E0C9AAB0], (void *)0x301);
      if (!v14)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if (!v11)
  {
    goto LABEL_6;
  }
  objc_setAssociatedObject(v16->_archiver, CFSTR("RemoteGateway"), MEMORY[0x1E0C9AAB0], (void *)0x301);
  if (v10)
    goto LABEL_15;
LABEL_7:
  if (v14)
LABEL_8:
    objc_setAssociatedObject(v16->_archiver, CFSTR("User"), v14, (void *)0x301);
LABEL_9:
  if (v15)
    objc_setAssociatedObject(v16->_archiver, CFSTR("SupportedFeatures"), v15, (void *)0x301);
  v22 = v16->_archiver;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v22, CFSTR("DataVersion"), v23, (void *)0x301);

  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteKeyedArchiver setClassName:forClass:](v16, "setClassName:forClass:", v25, objc_opt_class());

LABEL_12:
  return v16;
}

- (id)initForWritingWithRemoteDeviceIsOnSameAccount:(BOOL)a3 remoteGateway:(BOOL)a4 remoteUserIsAdministrator:(BOOL)a5 user:(id)a6 supportedFeatures:(id)a7
{
  return -[HMDRemoteKeyedArchiver initForWritingWithRemoteDeviceIsOnSameAccount:remoteGateway:remoteUserIsAdministrator:user:dataVersion:supportedFeatures:](self, "initForWritingWithRemoteDeviceIsOnSameAccount:remoteGateway:remoteUserIsAdministrator:user:dataVersion:supportedFeatures:", a3, a4, a5, a6, 4, a7);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDRemoteKeyedArchiver archiver](self, "archiver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_removeAssociatedObjects(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDRemoteKeyedArchiver;
  -[HMDRemoteKeyedArchiver dealloc](&v4, sel_dealloc);
}

- (void)setClassName:(id)a3 forClass:(Class)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HMDRemoteKeyedArchiver archiver](self, "archiver");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClassName:forClass:", v6, a4);

}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDRemoteKeyedArchiver archiver](self, "archiver");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, v6);

}

- (void)finishEncoding
{
  id v2;

  -[HMDRemoteKeyedArchiver archiver](self, "archiver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishEncoding");

}

- (NSData)encodedData
{
  void *v2;
  void *v3;

  -[HMDRemoteKeyedArchiver archiver](self, "archiver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSKeyedArchiver)archiver
{
  return self->_archiver;
}

- (void)setArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_archiver, a3);
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
  objc_storeStrong((id *)&self->_transportType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
}

@end
