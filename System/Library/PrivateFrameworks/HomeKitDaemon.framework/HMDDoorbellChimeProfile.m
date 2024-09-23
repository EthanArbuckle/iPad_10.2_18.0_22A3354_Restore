@implementation HMDDoorbellChimeProfile

- (HMDDoorbellChimeProfile)initWithAppleMediaAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDDoorbellChimeProfile *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("33D815E0-BC5F-4CF3-BB38-BC185A8C53ED");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:withSalts:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HMDDoorbellChimeProfile;
  v10 = -[HMDAccessoryProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v12, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, v5, v8, 0, v9);

  return v10;
}

- (void)registerForMessages
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HMDDoorbellChimeProfile *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryProfile accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    if (objc_msgSend(v4, "isCurrentAccessory"))
    {
      +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryProfile msgDispatcher](self, "msgDispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BDD5BB8];
      v16[0] = v7;
      v16[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", v10, self, v11, sel_handleDoorbellChimeMessage_);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Accessory or home is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)sendDoorbellChimeMessageWithChimeMode:(int64_t)a3 chimeDate:(id)a4 personIdentificationText:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  HMDDoorbellChimeProfile *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  HMDRemoteDeviceMessageDestination *v31;
  void *v32;
  uint64_t v33;
  HMDRemoteMessage *v34;
  HMDRemoteMessage *v35;
  HMDDoorbellChimeProfile *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *context;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[HMDAccessoryProfile accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (!v12)
    goto LABEL_21;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMDDoorbellChimeProfile lastChimeMode](self, "lastChimeMode") == a3)
  {
    -[HMDDoorbellChimeProfile lastChimeDate](self, "lastChimeDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[HMDDoorbellChimeProfile lastChimeDate](self, "lastChimeDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v15);
      if (fabs(v16) >= 1.0)
      {

      }
      else
      {
        -[HMDDoorbellChimeProfile lastPersonIdentificationText](self, "lastPersonIdentificationText");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = HMFEqualObjects();

        if (v18)
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v44 = v22;
            v45 = 2048;
            v46 = a3;
            v47 = 2112;
            v48 = v8;
            v49 = 2112;
            v50 = v9;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Ignoring chime (mode: %ld) that is duplicate of previous chime, date: %@, text %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v19);
          os_unfair_lock_unlock(p_lock);
          goto LABEL_21;
        }
      }
    }
  }
  -[HMDDoorbellChimeProfile setLastChimeMode:](self, "setLastChimeMode:", a3);
  -[HMDDoorbellChimeProfile setLastChimeDate:](self, "setLastChimeDate:", v8);
  -[HMDDoorbellChimeProfile setLastPersonIdentificationText:](self, "setLastPersonIdentificationText:", v9);
  os_unfair_lock_unlock(&self->_lock);
  -[HMDDoorbellChimeProfile doorbellMessagePayloadWithChimeMode:chimeDate:personIdentificationText:](self, "doorbellMessagePayloadWithChimeMode:chimeDate:personIdentificationText:", a3, v8, v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isCurrentAccessory"))
  {
    v24 = objc_alloc(MEMORY[0x24BE3F1B0]);
    v25 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x24BDD5BB8];
    v28 = (void *)objc_msgSend(v25, "initWithTarget:", v26);
    v29 = (void *)objc_msgSend(v24, "initWithName:destination:payload:", v27, v28, v23);

    -[HMDDoorbellChimeProfile handleDoorbellChimeMessage:](self, "handleDoorbellChimeMessage:", v29);
  }
  else
  {
    objc_msgSend(v12, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v31, "initWithTarget:device:", v32, v30);

      v34 = [HMDRemoteMessage alloc];
      v41 = (void *)v33;
      v35 = -[HMDRemoteMessage initWithName:destination:payload:](v34, "initWithName:destination:payload:", *MEMORY[0x24BDD5BB8], v33, v23);
      context = (void *)MEMORY[0x227676638]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v38;
        v45 = 2112;
        v46 = (int64_t)v39;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying remote device to chime - %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      -[HMDAccessoryProfile msgDispatcher](v36, "msgDispatcher");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "sendMessage:", v35);

    }
  }

LABEL_21:
}

- (void)handleDoorbellChimeMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDDoorbellChimeProfile *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDDoorbellChimeProfile *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryProfile accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    if ((objc_msgSend(v7, "isCurrentAccessory") & 1) != 0)
    {
      objc_msgSend(v4, "messagePayload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BDD5BC0];
      objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x24BDD5BC0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

      v12 = *MEMORY[0x24BDD5BB0];
      objc_msgSend(v8, "hmf_dateForKey:", *MEMORY[0x24BDD5BB0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v12);

      v14 = *MEMORY[0x24BDD5BC8];
      objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x24BDD5BC8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

      v16 = objc_alloc(MEMORY[0x24BE3F1B0]);
      v17 = *MEMORY[0x24BDD5BB8];
      v18 = objc_alloc(MEMORY[0x24BE3F1B8]);
      -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);
      v21 = (void *)objc_msgSend(v16, "initWithName:destination:payload:", v17, v20, v9);

      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v25;
        v34 = 2112;
        v35 = v26;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying framework to chime on current accessory - %@", (uint8_t *)&v32, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDAccessoryProfile msgDispatcher](v23, "msgDispatcher");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sendMessage:", v21);

    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543362;
        v33 = v31;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Asked to chime on non-current accessory", (uint8_t *)&v32, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
    }
  }

}

- (id)doorbellMessagePayloadWithChimeMode:(int64_t)a3 chimeDate:(id)a4 personIdentificationText:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDBCED8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD5BC0]);

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD5BB0]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD5BC8]);

  v12 = (void *)objc_msgSend(v10, "copy");
  return v12;
}

- (int64_t)lastChimeMode
{
  return self->_lastChimeMode;
}

- (void)setLastChimeMode:(int64_t)a3
{
  self->_lastChimeMode = a3;
}

- (NSDate)lastChimeDate
{
  return self->_lastChimeDate;
}

- (void)setLastChimeDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)lastPersonIdentificationText
{
  return self->_lastPersonIdentificationText;
}

- (void)setLastPersonIdentificationText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPersonIdentificationText, 0);
  objc_storeStrong((id *)&self->_lastChimeDate, 0);
}

@end
