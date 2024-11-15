@implementation HAPBTLECharacteristicSignature

- (HAPBTLECharacteristicSignature)initWithCharacteristicType:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 characteristicProperties:(unint64_t)a6 characteristicMetadata:(id)a7 authenticated:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HAPBTLECharacteristicSignature *v19;
  uint64_t v20;
  NSUUID *characteristicType;
  uint64_t v22;
  NSNumber *serviceInstanceID;
  uint64_t v24;
  NSUUID *serviceType;
  HAPBTLECharacteristicSignature *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  const char *v31;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = v17;
  if (!v14)
  {
    v27 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    v36 = 2112;
    v37 = (id)objc_opt_class();
    v30 = v37;
    v31 = "%{public}@[%@] The characteristic type is required";
LABEL_19:
    _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);

    goto LABEL_20;
  }
  if (!v15)
  {
    v27 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    v36 = 2112;
    v37 = (id)objc_opt_class();
    v30 = v37;
    v31 = "%{public}@[%@] The service instance ID is required";
    goto LABEL_19;
  }
  if (!v16)
  {
    v27 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    v36 = 2112;
    v37 = (id)objc_opt_class();
    v30 = v37;
    v31 = "%{public}@[%@] The service type is required";
    goto LABEL_19;
  }
  if (!a6)
  {
    v27 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    v36 = 2112;
    v37 = (id)objc_opt_class();
    v30 = v37;
    v31 = "%{public}@[%@] The characteristic properties is required";
    goto LABEL_19;
  }
  if (!v17)
  {
    v27 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v29;
      v36 = 2112;
      v37 = (id)objc_opt_class();
      v30 = v37;
      v31 = "%{public}@[%@] The characteristic metadata is required";
      goto LABEL_19;
    }
LABEL_20:

    objc_autoreleasePoolPop(v27);
    v26 = 0;
    goto LABEL_21;
  }
  v33.receiver = self;
  v33.super_class = (Class)HAPBTLECharacteristicSignature;
  v19 = -[HAPBTLECharacteristicSignature init](&v33, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    characteristicType = v19->_characteristicType;
    v19->_characteristicType = (NSUUID *)v20;

    v22 = objc_msgSend(v15, "copy");
    serviceInstanceID = v19->_serviceInstanceID;
    v19->_serviceInstanceID = (NSNumber *)v22;

    v24 = objc_msgSend(v16, "copy");
    serviceType = v19->_serviceType;
    v19->_serviceType = (NSUUID *)v24;

    v19->_characteristicProperties = a6;
    objc_storeStrong((id *)&v19->_characteristicMetadata, a7);
    v19->_authenticated = a8;
  }
  self = v19;
  v26 = self;
LABEL_21:

  return v26;
}

- (NSUUID)characteristicType
{
  return self->_characteristicType;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (NSUUID)serviceType
{
  return self->_serviceType;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end
