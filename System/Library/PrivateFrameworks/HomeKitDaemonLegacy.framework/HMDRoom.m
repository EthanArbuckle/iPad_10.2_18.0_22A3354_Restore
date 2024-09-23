@implementation HMDRoom

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMDRoom)initWithName:(id)a3 uuid:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDRoom *v11;
  void *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSUUID *uuid;
  void *v19;
  uint64_t v20;
  NSUUID *spiClientIdentifier;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDRoom;
  v11 = -[HMDRoom init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "hm_truncatedNameString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v13;

    if (v9)
    {
      v15 = objc_msgSend(v9, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v15);
    v17 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v17;

    spiClientIdentifierForUUID(v11->_uuid);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    spiClientIdentifier = v11->_spiClientIdentifier;
    v11->_spiClientIdentifier = (NSUUID *)v20;

    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_home, v10);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDRoom msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDRoom home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDRoom;
  -[HMDRoom dealloc](&v6, sel_dealloc);
}

- (void)configure:(id)a3 queue:(id)a4
{
  id v6;

  v6 = a4;
  -[HMDRoom setMsgDispatcher:](self, "setMsgDispatcher:", a3);
  -[HMDRoom setWorkQueue:](self, "setWorkQueue:", v6);

  -[HMDRoom _registerForMessages](self, "_registerForMessages");
}

- (NSString)serializedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDRoom home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRoom uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)dumpState
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDRoom name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRoom uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRoom urlString](self, "urlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("name: %@  uuid: %@, assistantIdentifier: %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D27F80]);
  -[HMDRoom appData](self, "appData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dumpState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D27E60]);

  return v3;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[HMDRoom home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "administratorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", CFSTR("kRenameRoomRequestKey"), self, v7, sel__handleRenameRequest_);

}

- (void)_handleRenameRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  HMDRoom *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDRoom *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDRoomModel *v19;
  void *v20;
  void *v21;
  HMDRoomModel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kRoomName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMMaxLengthForNaming();
  if (objc_msgSend(v5, "length") <= v6)
  {
    -[HMDRoom home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRoom name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceName:withNewName:", v13, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[HMDRoom home](self, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [HMDRoomModel alloc];
      -[HMDRoom uuid](self, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v19, "initWithObjectChangeType:uuid:parentUUID:", 2, v20, v21);

      -[HMDRoomModel setName:](v22, "setName:", v5);
      objc_msgSend(v18, "backingStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "transaction:options:", v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "add:withMessage:", v22, v4);
      objc_msgSend(v26, "run");

      v11 = 0;
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v17;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@New name does not conform to the HomeKit naming standard: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 46);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "respondWithError:", v11);
LABEL_10:

}

- (void)_handleUpdateRoomModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  HMDRoom *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  const __CFString *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDRoom uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRoom home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "roomForEntireHome");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (!v12)
  {
    objc_msgSend(v6, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hm_truncatedNameString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 && objc_msgSend(v21, "length"))
    {
      -[HMDRoom home](self, "home");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[HMDRoom name](self, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRoom setName:](self, "setName:", v21);
        objc_msgSend(v7, "transactionResult");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "markChanged");
        objc_msgSend(v24, "markSaveToAssistant");
        if ((HMFEqualObjects() & 1) == 0)
        {
          v31 = CFSTR("kRoomOldNameKey");
          v32 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          logAndPostNotification(CFSTR("HMDRoomNameUpdatedNotification"), self, v25);

        }
        objc_msgSend(v7, "respondWithPayload:", 0);

      }
      else
      {
        objc_msgSend(v7, "responseHandler");
        v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v29)[2](v29, v30, 0);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 20, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "responseHandler");
      v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v27)[2](v27, v26, 0);

    }
    goto LABEL_18;
  }
  objc_msgSend(v7, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HMFEqualObjects();

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v34 = v28;
      v35 = 2112;
      v36 = v7;
      v37 = 2112;
      v38 = v6;
      v39 = 2112;
      v40 = &unk_1E8B339F0;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update name for the default room %@, %@, errorCode: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 29, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v21);
LABEL_18:

    goto LABEL_19;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v19;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Always return success for transaction update during replay and lookup", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v7, "respondWithSuccess");
LABEL_19:

}

- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDApplicationData *v10;
  void *v11;
  void *v12;
  HMDApplicationData *v13;
  void *v14;
  HMDRoom *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDRoom appData](self, "appData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDRoom appData](self, "appData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithModel:", v6);

  }
  else
  {
    v10 = [HMDApplicationData alloc];
    objc_msgSend(v6, "appDataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRoom uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDApplicationData initWithDictionary:parentUUID:](v10, "initWithDictionary:parentUUID:", v11, v12);
    -[HMDRoom setAppData:](self, "setAppData:", v13);

    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appDataDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  objc_msgSend(v7, "transactionResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "markChanged");
  objc_msgSend(v7, "respondWithPayload:", 0);

}

- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDRoom setAppData:](self, "setAppData:", 0);
  objc_msgSend(v5, "transactionResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markChanged");
  objc_msgSend(v5, "respondWithPayload:", 0);

}

- (HMDRoom)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRoom *v9;
  uint64_t v10;
  HMDApplicationData *appData;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roomName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roomUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDRoom initWithName:uuid:home:](self, "initWithName:uuid:home:", v5, v7, v8);
  if (v9)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.appDataRepository"));
    v10 = objc_claimAutoreleasedReturnValue();
    appData = v9->_appData;
    v9->_appData = (HMDApplicationData *)v10;

    -[HMDApplicationData updateParentUUIDIfNil:](v9->_appData, "updateParentUUIDIfNil:", v7);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HMDRoom home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeConditionalObject:forKey:", v4, CFSTR("home"));
  -[HMDRoom name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("roomName"));

  -[HMDRoom uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("roomUUID"));

  LODWORD(v6) = objc_msgSend(v10, "hmd_isForXPCTransport");
  -[HMDRoom appData](self, "appData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v6)
    objc_msgSend(v8, "encodeForXPCTransportWithCoder:key:", v10, CFSTR("HM.appData"));
  else
    objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("HM.appDataRepository"));

}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDRoom messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMDRoom *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  if (v12)
  {
    -[HMDRoom _handleUpdateRoomModel:message:](self, "_handleUpdateRoomModel:message:", v12, v10);
    v13 = v9;
LABEL_15:

    goto LABEL_16;
  }
  v13 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    -[HMDRoom _handleUpdateAppDataModel:message:](self, "_handleUpdateAppDataModel:message:", v15, v10);
    goto LABEL_15;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v19;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = (id)objc_opt_class();
    v20 = v28;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(v10, "responseHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v10, "responseHandler");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v22, 0);

    goto LABEL_15;
  }
LABEL_16:

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDRoom *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDRoom _handleRemoveAppDataModel:message:](self, "_handleRemoveAppDataModel:message:", v10, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v14;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = (id)objc_opt_class();
      v15 = v24;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v7, "responseHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v7, "responseHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v17)[2](v17, v18, 0);

    }
  }

}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v5;
  HMDRoomModel *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRoomModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HMDRoomModel alloc];
  -[HMDRoom uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRoom home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", 1, v7, v9);

  -[HMDRoom name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRoomModel setName:](v10, "setName:", v11);

  objc_msgSend(v5, "addObject:", v10);
  -[HMDRoom appData](self, "appData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 >= 3 && v12)
  {
    -[HMDRoom appData](self, "appData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "modelObjectWithChangeType:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDRoom uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDRoom uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("uuid"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDRoom name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("name"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDApplicationData)appData
{
  return self->_appData;
}

- (void)setAppData:(id)a3
{
  objc_storeStrong((id *)&self->_appData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_100142 != -1)
    dispatch_once(&logCategory__hmf_once_t12_100142, &__block_literal_global_100143);
  return (id)logCategory__hmf_once_v13_100144;
}

void __22__HMDRoom_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_100144;
  logCategory__hmf_once_v13_100144 = v0;

}

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDRoom uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)assistantObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[6];
  _QWORD v52[6];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[HMDRoom home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    -[HMDRoom name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && v3)
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = objc_alloc(MEMORY[0x1E0C99E08]);
        v52[0] = *MEMORY[0x1E0D88A28];
        v51[0] = CFSTR("objectType");
        v51[1] = CFSTR("objectName");
        -[HMDRoom name](self, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = v8;
        v51[2] = CFSTR("objectIdentifier");
        -[HMDRoom urlString](self, "urlString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v52[2] = v9;
        v51[3] = CFSTR("objectHome");
        objc_msgSend(v3, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v52[3] = v10;
        v51[4] = CFSTR("objectHomeIdentifier");
        objc_msgSend(v3, "urlString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v51[5] = CFSTR("objectReference");
        v52[4] = v11;
        v52[5] = self;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v7, "initWithDictionary:", v12);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v36 = v3;
        objc_msgSend(v3, "zones");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");

        obj = v16;
        v39 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v39)
        {
          v38 = *(_QWORD *)v46;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v46 != v38)
                objc_enumerationMutation(obj);
              v40 = v17;
              v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              objc_msgSend(v18, "roomUUIDs", v35);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v42;
                do
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v42 != v22)
                      objc_enumerationMutation(v19);
                    v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
                    -[HMDRoom uuid](self, "uuid");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v24) = objc_msgSend(v25, "hmf_isEqualToUUIDString:", v24);

                    if ((_DWORD)v24)
                    {
                      objc_msgSend(v18, "name");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v13, "addObject:", v26);

                      objc_msgSend(v18, "urlString");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "addObject:", v27);

                    }
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                }
                while (v21);
              }

              v17 = v40 + 1;
            }
            while (v40 + 1 != v39);
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          }
          while (v39);
        }

        v28 = v35;
        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v35, "setObject:forKey:", v13, CFSTR("objectZones"));
          objc_msgSend(v35, "setObject:forKey:", v14, CFSTR("objectZoneIdentifiers"));
        }
        v29 = (void *)objc_msgSend(v35, "copy", v35);

        v3 = v36;
        goto LABEL_28;
      }
    }
    else
    {

    }
  }
  v30 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRoom name](self, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v32;
    v55 = 2112;
    v56 = v33;
    v57 = 2112;
    v58 = v3;
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of room is nil: name %@  home %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v30);
  v29 = 0;
LABEL_28:

  return (NSDictionary *)v29;
}

@end
