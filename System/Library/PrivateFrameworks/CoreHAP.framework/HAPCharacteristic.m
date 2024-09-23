@implementation HAPCharacteristic

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HAPCharacteristic instanceID](self, "instanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 metadata:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](self, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", a3, a4, a5, a6, a7, a8, v10, a9);
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 implicitWriteWithResponse:(BOOL)a9 metadata:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSString *v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  HAPCharacteristic *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  const char *v42;
  id v43;
  void *v44;
  HAPCharacteristic *v45;
  uint64_t v46;
  NSString *type;
  NSString *v48;
  uint64_t v49;
  NSDate *valueUpdatedTime;
  uint64_t v51;
  HAPCharacteristicMetadata *accessoryMetadata;
  void *v53;
  uint64_t v54;
  HAPCharacteristicMetadata *metadata;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *context;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  NSString *v68;
  void *v69;
  NSString *v70;
  id v71;
  objc_super v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  NSString *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v71 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a10;
  if ((isValidTypeName(v16) & 1) != 0)
  {
    objc_msgSend(v16, "hap_validatedAndNormalizedUUIDString");
    v70 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v70)
    {
      v33 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = v35;
        v36 = "%{public}@### Unable to initialize characteristic because type name is not a UUID";
        v37 = v34;
        v38 = 12;
LABEL_48:
        _os_log_impl(&dword_1CCE01000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);

        goto LABEL_49;
      }
      goto LABEL_49;
    }
    if ((isValidInstanceID(v71) & 1) == 0)
    {
      v33 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v35;
        v75 = 2112;
        v76 = v70;
        v36 = "%{public}@### Unable to initialize characteristic '%@' because of invalid instance ID";
LABEL_47:
        v37 = v34;
        v38 = 22;
        goto LABEL_48;
      }
LABEL_49:

      objc_autoreleasePoolPop(v33);
      v32 = 0;
LABEL_50:

      goto LABEL_51;
    }
    v68 = v70;
    +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v20;
    if (a7)
    {
      if ((a7 & 0xF) != 0)
      {
        objc_msgSend(v20, "getDefaultCharacteristicProperties:", v68);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v63 = v21;
          v23 = objc_msgSend(v21, "unsignedIntegerValue");
          if ((a7 & 2) == 0 && (v23 & 2) != 0)
          {
            v24 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v26;
              v75 = 2112;
              v27 = v68;
              v76 = v68;
              v28 = "%{public}@### HomeKit Characteristic '%@' does not support secureRead.";
LABEL_42:
              _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);

LABEL_44:
              objc_autoreleasePoolPop(v24);

LABEL_45:
              v33 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v74 = v35;
                v75 = 2112;
                v76 = v27;
                v36 = "%{public}@### Unable to initialize characteristic '%@' because of invalid properties";
                goto LABEL_47;
              }
              goto LABEL_49;
            }
            goto LABEL_43;
          }
          v22 = v63;
          if ((a7 & 0x80) == 0 && v23 < 0 && ((a7 & 4) == 0 || !a9))
          {
            v24 = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v26;
              v75 = 2114;
              v27 = v68;
              v76 = v68;
              v28 = "%{public}@### HomeKit Characteristic '%{public}@' does not support writeResponse.";
              goto LABEL_42;
            }
LABEL_43:
            v27 = v68;
            goto LABEL_44;
          }
        }

        v43 = v19;
        v67 = v43;
        if (v43)
        {
          objc_msgSend(v43, "constraints");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44
            || (objc_msgSend(v67, "manufacturerDescription"), (v44 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            || (objc_msgSend(v67, "format"), (v44 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {

            v43 = v67;
          }
          else
          {
            objc_msgSend(v67, "units");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = v67;
            if (!v65)
            {
              v57 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v74 = v59;
                _os_log_impl(&dword_1CCE01000, v58, OS_LOG_TYPE_ERROR, "%{public}@### Characteristic metadata is empty", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v57);

              v33 = (void *)MEMORY[0x1D17B7244]();
              HMFGetOSLogHandle();
              v34 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                goto LABEL_49;
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v74 = v35;
              v75 = 2112;
              v76 = v68;
              v36 = "%{public}@### Unable to initialize characteristic '%@' because of invalid metadata";
              goto LABEL_47;
            }
          }
        }

        v72.receiver = self;
        v72.super_class = (Class)HAPCharacteristic;
        v45 = -[HAPCharacteristic init](&v72, sel_init);
        if (v45)
        {
          +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v68);
          v46 = objc_claimAutoreleasedReturnValue();
          type = v45->_type;
          v45->_type = (NSString *)v46;

          objc_msgSend(v64, "characteristicUTIFromType:", v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (v69)
          {
            context = (void *)MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v45->_type;
              *(_DWORD *)buf = 138544130;
              v74 = v60;
              v75 = 2112;
              v76 = v48;
              v77 = 2112;
              v78 = v69;
              v79 = 2112;
              v80 = v71;
              _os_log_impl(&dword_1CCE01000, v62, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(context);
          }
          objc_storeStrong((id *)&v45->_instanceID, a4);
          objc_storeStrong(&v45->_value, a5);
          objc_storeStrong((id *)&v45->_stateNumber, a6);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v49 = objc_claimAutoreleasedReturnValue();
          valueUpdatedTime = v45->_valueUpdatedTime;
          v45->_valueUpdatedTime = (NSDate *)v49;

          v45->_properties = a7;
          v45->_eventNotificationsEnabled = a8;
          v45->_implicitWriteWithResponse = a9;
          v45->_shouldValidateValueAfterReading = 1;
          +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:](HMFObjectCacheHAPCharacteristicMetadata, "hap_cacheInstanceForMetadata:", v67);
          v51 = objc_claimAutoreleasedReturnValue();
          accessoryMetadata = v45->_accessoryMetadata;
          v45->_accessoryMetadata = (HAPCharacteristicMetadata *)v51;

          -[HAPCharacteristic _generateValidMetadata:](v45, "_generateValidMetadata:", v67);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:](HMFObjectCacheHAPCharacteristicMetadata, "hap_cacheInstanceForMetadata:", v53);
          v54 = objc_claimAutoreleasedReturnValue();
          metadata = v45->_metadata;
          v45->_metadata = (HAPCharacteristicMetadata *)v54;

        }
        self = v45;
        v32 = self;
        goto LABEL_50;
      }
      v39 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = v41;
        v42 = "%{public}@### Characteristic is missing valid properties";
        goto LABEL_22;
      }
    }
    else
    {
      v39 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v74 = v41;
        v42 = "%{public}@### Characteristic has nil properties";
LABEL_22:
        _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);

      }
    }
    v27 = v68;

    objc_autoreleasePoolPop(v39);
    goto LABEL_45;
  }
  v29 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v74 = v31;
    v75 = 2112;
    v76 = (NSString *)v16;
    _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize characteristic because of invalid characteristic type name: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v29);
  v32 = 0;
LABEL_51:

  return v32;
}

- (id)_generateValidMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDefaultCharacteristicMetadata:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v4;
  if (v7)
  {
    v8 = v7;
    if (v4)
    {
      -[HAPCharacteristic _updateMetadata:withProvidedMetadata:](self, "_updateMetadata:withProvidedMetadata:", v7, v4);
      v8 = v7;
    }
  }
  v9 = v8;

  return v9;
}

- (void)_updateMetadata:(id)a3 withProvidedMetadata:(id)a4
{
  id v5;
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
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a3;
  v5 = a4;
  objc_msgSend(v40, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "format");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFormat:", v7);

  }
  objc_msgSend(v40, "units");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v5, "units");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setUnits:", v9);

  }
  objc_msgSend(v40, "manufacturerDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v5, "manufacturerDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setManufacturerDescription:", v11);

  }
  objc_msgSend(v40, "constraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "constraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v12)
  {
    objc_msgSend(v40, "setConstraints:", v13);
    goto LABEL_20;
  }

  if (v14)
  {
    objc_msgSend(v5, "constraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minimumValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v5, "constraints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "minimumValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setMinimumValue:", v18);

    }
    objc_msgSend(v5, "constraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "maximumValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v5, "constraints");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "maximumValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraints");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setMaximumValue:", v23);

    }
    objc_msgSend(v5, "constraints");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stepValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v5, "constraints");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stepValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraints");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setStepValue:", v28);

    }
    objc_msgSend(v5, "constraints");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "maxLength");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v5, "constraints");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "maxLength");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraints");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setMaxLength:", v33);

    }
    objc_msgSend(v5, "constraints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "validValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      objc_msgSend(v5, "constraints");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "validValues");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraints");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setValidValues:", v38);

LABEL_20:
    }
  }

}

- (void)setProhibitCaching:(BOOL)a3
{
  self->_prohibitCaching = a3;
}

- (NSDate)valueUpdatedTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_valueUpdatedTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSData)notificationContext
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_notificationContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)stateNumber
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (id)value
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (BOOL)shouldValidateValueAfterReading
{
  return self->_shouldValidateValueAfterReading;
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (id)validateValue:(id)a3 outValue:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  id v60;
  double v61;
  double v62;
  void *v63;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  unint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  NSObject *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  id v97;
  __int16 v98;
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HAPCharacteristic metadata](self, "metadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[HAPCharacteristic metadata](self, "metadata");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[HAPCharacteristic metadata](self, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "format");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_4;
    }
    else
    {

    }
    -[HAPCharacteristic metadata](self, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "format");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = 0;
    if (!v6)
    {
      v13 = 0;
LABEL_65:

      goto LABEL_66;
    }
    -[HAPCharacteristic metadata](self, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[HAPCharacteristic metadata](self, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[HAPCharacteristic metadata](self, "metadata");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraints");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "minimumValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAPCharacteristic metadata](self, "metadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraints");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "maximumValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[HAPCharacteristic metadata](self, "metadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraints");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "minLength");
        v26 = objc_claimAutoreleasedReturnValue();

        -[HAPCharacteristic metadata](self, "metadata");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "constraints");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "maxLength");
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)v26;
      }
      else
      {
        v91 = 0;
        v29 = 0;
        v23 = 0;
        v16 = 0;
      }
    }
    else
    {
      v91 = 0;
      v29 = 0;
      v23 = 0;
    }
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("int")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("float")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("BOOL")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("int8")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("int16")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("int64")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint8")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint16")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint32")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint64")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("string")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("date")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("array")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("dict")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("data")) & 1) != 0
      || objc_msgSend(v15, "isEqualToString:", CFSTR("tlv8")))
    {
      v30 = objc_opt_class();
    }
    else
    {
      v30 = 0;
    }
    if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", v30) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 43);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v88 = v15;
        v40 = v23;
        v41 = v16;
        v42 = v29;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristic type](self, "type");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v93 = v43;
        v94 = 2112;
        v95 = (uint64_t)v44;
        v96 = 2112;
        v97 = (id)objc_opt_class();
        v98 = 2112;
        v99 = v30;
        v45 = v97;
        _os_log_impl(&dword_1CCE01000, v39, OS_LOG_TYPE_ERROR, "%{public}@### Failed to validate value for characteristic with type '%@' because the value was of class '%@' but should be '%@'", buf, 0x2Au);

        v29 = v42;
        v16 = v41;
        v23 = v40;
        v15 = v88;
      }

      objc_autoreleasePoolPop(v38);
      goto LABEL_64;
    }
    if (!a4)
    {
LABEL_47:
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("int")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("float")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("int8")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("int16")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("int64")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint8")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint16")) & 1) != 0
        || (objc_msgSend(v15, "isEqualToString:", CFSTR("uint32")) & 1) != 0
        || objc_msgSend(v15, "isEqualToString:", CFSTR("uint64")))
      {
        if (v16 && objc_msgSend(v6, "compare:", v16) == -1)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 44);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4)
            *a4 = 0;
        }
        else
        {
          v63 = 0;
        }
        if (v23 && objc_msgSend(v6, "compare:", v23) == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 45);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (a4)
            *a4 = 0;
        }
        else
        {
          v37 = v63;
        }
        goto LABEL_64;
      }
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("BOOL")))
      {
        v65 = (void *)objc_opt_class();
        if ((objc_msgSend(v65, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
        {
          v66 = v29;
          if (objc_msgSend(v65, "isSubclassOfClass:", objc_opt_class()))
          {
            if (objc_msgSend(v6, "intValue") < 2)
            {
              v37 = 0;
LABEL_102:
              v29 = v66;
              goto LABEL_64;
            }
            v89 = MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = (void *)objc_opt_class();
              v70 = objc_retainAutorelease(v6);
              v86 = v69;
              *(_DWORD *)buf = 138544130;
              v93 = v68;
              v94 = 2112;
              v95 = (uint64_t)v6;
              v96 = 2112;
              v97 = v69;
              v98 = 2080;
              v99 = objc_msgSend(v70, "objCType");
              _os_log_impl(&dword_1CCE01000, v67, OS_LOG_TYPE_ERROR, "%{public}@Value to be validated is expected to be either '0' or '1', instead it was '%@' - class %@  objCType %s", buf, 0x2Au);

            }
            v71 = (void *)v89;
          }
          else
          {
            v79 = MEMORY[0x1D17B7244]();
            HMFGetOSLogHandle();
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v93 = v81;
              v94 = 2112;
              v95 = (uint64_t)v6;
              v96 = 2112;
              v97 = v65;
              _os_log_impl(&dword_1CCE01000, v80, OS_LOG_TYPE_ERROR, "%{public}@inValue not a BOOLean value %@ - class %@", buf, 0x20u);

            }
            v71 = (void *)v79;
          }
          objc_autoreleasePoolPop(v71);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 3);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4)
            *a4 = 0;
          goto LABEL_102;
        }
LABEL_85:
        v37 = 0;
LABEL_64:
        v13 = v37;

        goto LABEL_65;
      }
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("string")))
        goto LABEL_85;
      v90 = v29;
      v72 = v6;
      v73 = objc_msgSend(v72, "length");
      if (v73 <= objc_msgSend(v91, "unsignedIntValue"))
      {
        v82 = objc_msgSend(v72, "length");
        if (v82 >= objc_msgSend(v29, "unsignedIntValue"))
        {
          v37 = 0;
LABEL_104:

          v29 = v90;
          goto LABEL_64;
        }
        v83 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v85;
          v94 = 2048;
          v95 = objc_msgSend(v72, "length");
          v96 = 1024;
          LODWORD(v97) = objc_msgSend(v90, "unsignedIntValue");
          _os_log_impl(&dword_1CCE01000, v84, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu < minLength: %u", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v83);
        v77 = (void *)MEMORY[0x1E0CB35C8];
        v78 = 51;
      }
      else
      {
        v74 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v93 = v76;
          v94 = 2048;
          v95 = objc_msgSend(v72, "length");
          v96 = 1024;
          LODWORD(v97) = objc_msgSend(v91, "unsignedIntValue");
          _os_log_impl(&dword_1CCE01000, v75, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu > maxLength: %u", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v74);
        v77 = (void *)MEMORY[0x1E0CB35C8];
        v78 = 46;
      }
      objc_msgSend(v77, "errorWithHMErrorCode:", v78);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        *a4 = 0;
      goto LABEL_104;
    }
    v87 = v23;
    v31 = v16;
    v32 = v29;
    -[HAPCharacteristic metadata](self, "metadata");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraints");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stepValue");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("float")) & 1) != 0)
      {

LABEL_38:
        -[HAPCharacteristic metadata](self, "metadata");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "constraints");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stepValue");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "doubleValue");
        v51 = v50;

        -[HAPCharacteristic metadata](self, "metadata");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "constraints");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "minimumValue");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          -[HAPCharacteristic metadata](self, "metadata");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "constraints");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "minimumValue");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "doubleValue");
          v59 = v58;

        }
        else
        {
          v59 = 0.0;
        }
        objc_msgSend(v6, "doubleValue");
        v62 = v59 + round((v61 - v59) / v51) * v51;
        v29 = v32;
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("int")))
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v62);
        else
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
        v16 = v31;
        v60 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_46;
      }
      v46 = objc_msgSend(v15, "isEqualToString:", CFSTR("int"));

      if ((v46 & 1) != 0)
        goto LABEL_38;
    }
    else
    {

    }
    v60 = objc_retainAutorelease(v6);
    v29 = v32;
    v16 = v31;
LABEL_46:
    v23 = v87;
    *a4 = v60;
    goto LABEL_47;
  }
LABEL_4:
  v13 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v6);
LABEL_66:

  return v13;
}

- (HAPCharacteristicMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)isEqual:(id)a3
{
  HAPCharacteristic *v4;
  HAPCharacteristic *v5;
  HAPCharacteristic *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = (HAPCharacteristic *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_15;
    -[HAPCharacteristic instanceID](self, "instanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristic instanceID](v6, "instanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = numbersAreNotEqualNilSafe(v7, v8);

    if ((v9 & 1) != 0)
      goto LABEL_15;
    -[HAPCharacteristic type](self, "type");
    v10 = objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristic type](v6, "type");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 | v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend((id)v10, "isEqualToString:", v11);

      if (!v13)
        goto LABEL_15;
    }
    v15 = -[HAPCharacteristic properties](self, "properties");
    if (v15 == -[HAPCharacteristic properties](v6, "properties"))
    {
      -[HAPCharacteristic service](self, "service");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HAPCharacteristic service](v6, "service");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          -[HAPCharacteristic service](self, "service");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPCharacteristic service](v6, "service");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v20, "isEqual:", v21);

        }
        else
        {
          v14 = 1;
        }

      }
      else
      {
        v14 = 1;
      }
    }
    else
    {
LABEL_15:
      v14 = 0;
    }

  }
  return v14;
}

- (NSString)type
{
  return self->_type;
}

- (HAPService)service
{
  return (HAPService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
}

- (CBCharacteristic)cbCharacteristic
{
  void *v2;
  id v3;

  objc_getAssociatedObject(self, "cbCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (CBCharacteristic *)v3;
}

- (void)setCBCharacteristic:(id)a3
{
  objc_setAssociatedObject(self, "cbCharacteristic", a3, (void *)1);
}

- (BOOL)hap2_mergeWithCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic setValue:](self, "setValue:", v5);

  objc_msgSend(v4, "valueUpdatedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic setValueUpdatedTime:](self, "setValueUpdatedTime:", v6);

  -[HAPCharacteristic setProperties:](self, "setProperties:", objc_msgSend(v4, "properties"));
  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAPCharacteristic setMetadata:](self, "setMetadata:", v7);
  return 1;
}

- (BOOL)hap2_canUseCachedValue
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPCharacteristic eventNotificationsEnabled](self, "eventNotificationsEnabled")
    && !-[HAPCharacteristic prohibitCaching](self, "prohibitCaching"))
  {
    -[HAPCharacteristic value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    if (v5 && v3)
    {
      -[HAPCharacteristic type](self, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isStandardHAPCharacteristic:", v6);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)hap2_shortTypeFromUUID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("-0000-1000-8000-0026BB765291")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - objc_msgSend(CFSTR("-0000-1000-8000-0026BB765291"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BOOL8 v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  -[HAPCharacteristic value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EFA2EAA8) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[HAPCharacteristic value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_5:
    -[HAPCharacteristic value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    goto LABEL_6;
  }
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
LABEL_6:
  v25 = (void *)v7;

  v22 = objc_alloc((Class)objc_opt_class());
  -[HAPCharacteristic type](self, "type");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  -[HAPCharacteristic instanceID](self, "instanceID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v23, "copyWithZone:", a3);
  -[HAPCharacteristic stateNumber](self, "stateNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  v11 = -[HAPCharacteristic properties](self, "properties");
  v12 = -[HAPCharacteristic eventNotificationsEnabled](self, "eventNotificationsEnabled");
  v13 = -[HAPCharacteristic isWriteWithResponseImplicitlySupported](self, "isWriteWithResponseImplicitlySupported");
  -[HAPCharacteristic metadata](self, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  LOBYTE(v20) = v13;
  v16 = (void *)objc_msgSend(v22, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v21, v8, v25, v10, v11, v12, v20, v15);

  -[HAPCharacteristic valueUpdatedTime](self, "valueUpdatedTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValueUpdatedTime:", v17);

  -[HAPCharacteristic notificationContext](self, "notificationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNotificationContext:", v18);

  objc_msgSend(v16, "setProhibitCaching:", -[HAPCharacteristic prohibitCaching](self, "prohibitCaching"));
  objc_msgSend(v16, "setShouldValidateValueAfterReading:", -[HAPCharacteristic shouldValidateValueAfterReading](self, "shouldValidateValueAfterReading"));

  return v16;
}

- (NSString)description
{
  id v3;
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
  objc_super v20;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20.receiver = self;
  v20.super_class = (Class)HAPCharacteristic;
  -[HMFObject description](&v20, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  -[HAPCharacteristic service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Accessory Unique ID: %@"), v7);

  -[HAPCharacteristic instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Instance ID: %@"), v8);

  -[HAPCharacteristic type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Type: %@"), v9);

  -[HAPCharacteristic value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Value: %@"), v10);

  -[HAPCharacteristic stateNumber](self, "stateNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", State Number: %@"), v11);

  -[HAPCharacteristic valueUpdatedTime](self, "valueUpdatedTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_localTimeDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Value update time: %@"), v13);

  -[HAPCharacteristic propertiesDescription](self, "propertiesDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Properties: %@"), v14);

  -[HAPCharacteristic eventNotificationsEnabled](self, "eventNotificationsEnabled");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Event Notifications Enabled: %@"), v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HAPCharacteristic isWriteWithResponseImplicitlySupported](self, "isWriteWithResponseImplicitlySupported"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Write With Response Implicitly Supported: %@"), v16);

  -[HAPCharacteristic metadata](self, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Metadata: %@"), v17);

  -[HAPCharacteristic supportsEventNotificationContext](self, "supportsEventNotificationContext");
  HMFBooleanToString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", supportsEventNotificationContext: %@"), v18);

  return (NSString *)v3;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HAPCharacteristic service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[HAPCharacteristic instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HAPShortUUIDType(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic stateNumber](self, "stateNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic value](self, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic valueUpdatedTime](self, "valueUpdatedTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@/%@/%@/%@ %@/%@"), v7, v5, v8, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)propertiesDescription
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((-[HAPCharacteristic properties](self, "properties") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("read"));
  if ((-[HAPCharacteristic properties](self, "properties") & 4) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("write"));
  if ((-[HAPCharacteristic properties](self, "properties") & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("eventConnectionNotifications"));
  if ((-[HAPCharacteristic properties](self, "properties") & 8) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("broadcast"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("additionalAuthData"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x20) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("requiresTimedWrite"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x40) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("hidden"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x80) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("writeResponse"));
  if ((-[HAPCharacteristic properties](self, "properties") & 0x100) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("eventNotificationContext"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);

    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v6);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setValue:(id)a3
{
  id v4;
  NSDate *v5;
  id value;
  id v7;
  NSDate *valueUpdatedTime;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  value = self->_value;
  self->_value = v4;
  v7 = v4;

  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setStateNumber:(id)a3
{
  NSNumber *v4;
  NSNumber *stateNumber;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  stateNumber = self->_stateNumber;
  self->_stateNumber = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setValueUpdatedTime:(id)a3
{
  NSDate *v4;
  NSDate *valueUpdatedTime;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNotificationContext:(id)a3
{
  NSData *v4;
  NSData *notificationContext;

  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)supportsWriteWithResponse
{
  unsigned int v3;
  _BOOL4 v4;

  v3 = -[HAPCharacteristic properties](self, "properties");
  if ((v3 & 0x80) != 0)
    LOBYTE(v4) = 1;
  else
    return -[HAPCharacteristic isWriteWithResponseImplicitlySupported](self, "isWriteWithResponseImplicitlySupported") & (v3 >> 2);
  return v4;
}

- (BOOL)supportsAdditionalAuthorizationData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if ((-[HAPCharacteristic properties](self, "properties") & 0x10) != 0)
    return 1;
  +[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "supportsAdditionalAuthorizationData:forService:", v5, v6);

  return v7;
}

- (BOOL)supportsEventNotificationContext
{
  return (-[HAPCharacteristic properties](self, "properties") >> 8) & 1;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HAPCharacteristic *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HAPCharacteristic *v19;
  NSObject *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  if (!-[HAPCharacteristic shouldMergeObject:](self, "shouldMergeObject:", v6))
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@Not merging with characteristic: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    goto LABEL_14;
  }
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristic setValue:](self, "setValue:", v7);

  -[HAPCharacteristic metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToCharacteristicMetadata:", v9);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@Updated the characteristic metadata: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v6, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristic setMetadata:](v12, "setMetadata:", v16);

  }
  v17 = v10 ^ 1;
LABEL_15:

  return v17;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (BOOL)eventNotificationsEnabled
{
  return self->_eventNotificationsEnabled;
}

- (void)setEventNotificationsEnabled:(BOOL)a3
{
  self->_eventNotificationsEnabled = a3;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setShouldValidateValueAfterReading:(BOOL)a3
{
  self->_shouldValidateValueAfterReading = a3;
}

- (BOOL)prohibitCaching
{
  return self->_prohibitCaching;
}

- (HAPCharacteristicMetadata)accessoryMetadata
{
  return self->_accessoryMetadata;
}

- (BOOL)isWriteWithResponseImplicitlySupported
{
  return self->_implicitWriteWithResponse;
}

@end
