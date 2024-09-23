@implementation HMDUserPresence

- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDUserPresence *v9;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = -[HMDUserPresence initWithUser:presenceRegionStatus:timeStamp:](self, "initWithUser:presenceRegionStatus:timeStamp:", v6, v7, v8);

  return v9;
}

- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4 timeStamp:(id)a5
{
  return -[HMDUserPresence initWithUser:presenceRegionStatus:timeStamp:presenceUpdateReason:device:](self, "initWithUser:presenceRegionStatus:timeStamp:presenceUpdateReason:device:", a3, a4, a5, 0, 0);
}

- (HMDUserPresence)initWithUser:(id)a3 presenceRegionStatus:(id)a4 timeStamp:(id)a5 presenceUpdateReason:(id)a6 device:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDUserPresence *v17;
  HMDUserPresence *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDUserPresence;
  v17 = -[HMDUserPresence init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_user, a3);
    objc_storeStrong((id *)&v18->_presenceRegionStatus, a4);
    objc_storeStrong((id *)&v18->_updateTimestamp, a5);
    objc_storeStrong((id *)&v18->_deviceWhichUpdatedUserPresence, a7);
    objc_storeStrong((id *)&v18->_presenceUpdateReason, a6);
  }

  return v18;
}

- (HMDUserPresenceRegion)rawPresenceRegionStatus
{
  return self->_presenceRegionStatus;
}

- (NSDate)lastLocalActivityTimeStamp
{
  void *v3;
  uint64_t v4;
  NSDate *v5;

  -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "value");

  if (v4 == 1)
    v5 = self->_lastLocalActivityTimeStamp;
  else
    v5 = 0;
  return v5;
}

- (void)setLastLocalActivityTimeStamp:(id)a3
{
  void *v4;
  uint64_t v5;
  NSDate *v6;
  NSDate *lastLocalActivityTimeStamp;
  id v8;

  v8 = a3;
  -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "value");

  if (v5 == 1)
    v6 = (NSDate *)v8;
  else
    v6 = 0;
  lastLocalActivityTimeStamp = self->_lastLocalActivityTimeStamp;
  self->_lastLocalActivityTimeStamp = v6;

}

- (HMDUserPresenceRegion)presenceRegionStatus
{
  void *v3;
  int v4;
  HMDUserPresenceRegion *presenceRegionStatus;
  void *v6;
  int v7;
  HMDUserPresenceRegion *v8;
  HMDUserPresenceRegion *v9;

  -[HMDUserPresence user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRestrictedGuest");

  presenceRegionStatus = self->_presenceRegionStatus;
  if (v4)
  {
    if (presenceRegionStatus)
    {
      if (-[HMDUserPresenceRegion value](presenceRegionStatus, "value"))
      {
        -[HMDUserPresence user](self, "user");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isAccessCurrentlyAllowedBySchedule");

        if (!v7)
        {
          +[HMDUserPresenceRegion regionWithValue:](HMDUserPresenceRegion, "regionWithValue:", 2);
          v9 = (HMDUserPresenceRegion *)objc_claimAutoreleasedReturnValue();
          return v9;
        }
      }
      v8 = self->_presenceRegionStatus;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
  }
  else
  {
    v9 = presenceRegionStatus;
  }
  return v9;
}

- (void)setPresenceRegionStatus:(id)a3
{
  HMDUserPresenceRegion *v4;
  NSDate *v5;
  NSDate *updateTimestamp;
  void *v7;
  HMDUserPresence *v8;
  NSObject *v9;
  void *v10;
  HMDUserPresenceRegion *presenceRegionStatus;
  void *v12;
  HMDUserPresenceRegion *v13;
  int v14;
  void *v15;
  __int16 v16;
  HMDUserPresenceRegion *v17;
  __int16 v18;
  HMDUserPresenceRegion *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (HMDUserPresenceRegion *)a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    updateTimestamp = self->_updateTimestamp;
    self->_updateTimestamp = v5;
  }
  else
  {
    updateTimestamp = self->_updateTimestamp;
    self->_updateTimestamp = 0;
  }

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    presenceRegionStatus = v8->_presenceRegionStatus;
    -[NSDate hmf_localTimeDescription](v8->_updateTimestamp, "hmf_localTimeDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v10;
    v16 = 2112;
    v17 = presenceRegionStatus;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating region status from %@ to %@ with update timestamp %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  v13 = v8->_presenceRegionStatus;
  v8->_presenceRegionStatus = v4;

}

- (BOOL)isAtHome
{
  void *v2;
  BOOL v3;

  -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "value") == 1;

  return v3;
}

- (BOOL)isNotAtHome
{
  void *v2;
  BOOL v3;

  -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "value") == 2;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDUserPresence *v4;
  HMDUserPresence *v5;
  HMDUserPresence *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (HMDUserPresence *)a3;
  if (self == v4)
  {
    v17 = 1;
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
      goto LABEL_9;
    -[HMDUserPresence user](self, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresence user](v6, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if (!v11)
      goto LABEL_9;
    -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresence presenceRegionStatus](v6, "presenceRegionStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if (v14)
    {
      -[HMDUserPresence updateTimestamp](self, "updateTimestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPresence updateTimestamp](v6, "updateTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HMFEqualObjects();

    }
    else
    {
LABEL_9:
      v17 = 0;
    }

  }
  return v17;
}

- (HMDUserPresence)initWithCoder:(id)a3
{
  id v4;
  HMDUserPresence *v5;
  uint64_t v6;
  HMDUser *user;
  uint64_t v8;
  HMDUserPresenceRegion *presenceRegionStatus;
  uint64_t v10;
  NSDate *updateTimestamp;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserPresence;
  v5 = -[HMDUserPresence init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
    v6 = objc_claimAutoreleasedReturnValue();
    user = v5->_user;
    v5->_user = (HMDUser *)v6;

    +[HMDUserPresenceRegion regionWithCoder:](HMDUserPresenceRegion, "regionWithCoder:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    presenceRegionStatus = v5->_presenceRegionStatus;
    v5->_presenceRegionStatus = (HMDUserPresenceRegion *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PresenceUpdateTimestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    updateTimestamp = v5->_updateTimestamp;
    v5->_updateTimestamp = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDUserPresence user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.user"));

  -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addToCoder:", v4);

  -[HMDUserPresence updateTimestamp](self, "updateTimestamp");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("PresenceUpdateTimestamp"));

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUserPresence user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
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
  _QWORD v33[10];

  v33[8] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence user](self, "user");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "userID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UID"), v31);
  v33[0] = v30;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence user](self, "user");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("UUID"), v28);
  v33[1] = v27;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence presenceRegionStatus](self, "presenceRegionStatus");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Reg"), v26);
  v33[2] = v25;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence updateTimestamp](self, "updateTimestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hmf_localTimeDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("TS"), v23);
  v33[3] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence presenceUpdateReason](self, "presenceUpdateReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Reason"), v9);
  v33[4] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence deviceWhichUpdatedUserPresence](self, "deviceWhichUpdatedUserPresence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Device"), v12);
  v33[5] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence lastLocalActivityTimeStamp](self, "lastLocalActivityTimeStamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("lastAccess"), v15);
  v33[6] = v16;
  v17 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserPresence user](self, "user");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presenceAuthStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Auth"), v19);
  v33[7] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 8);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (HMDUser)user
{
  return self->_user;
}

- (HMDDevice)deviceWhichUpdatedUserPresence
{
  return self->_deviceWhichUpdatedUserPresence;
}

- (void)setRawPresenceRegionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_rawPresenceRegionStatus, a3);
}

- (HMDUserPresenceUpdateReason)presenceUpdateReason
{
  return self->_presenceUpdateReason;
}

- (void)setPresenceUpdateReason:(id)a3
{
  objc_storeStrong((id *)&self->_presenceUpdateReason, a3);
}

- (NSDate)updateTimestamp
{
  return self->_updateTimestamp;
}

- (NSDate)lastLocalActivityUpdateTimeStampInWorkingStore
{
  return self->_lastLocalActivityUpdateTimeStampInWorkingStore;
}

- (void)setLastLocalActivityUpdateTimeStampInWorkingStore:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocalActivityUpdateTimeStampInWorkingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocalActivityUpdateTimeStampInWorkingStore, 0);
  objc_storeStrong((id *)&self->_updateTimestamp, 0);
  objc_storeStrong((id *)&self->_presenceUpdateReason, 0);
  objc_storeStrong((id *)&self->_rawPresenceRegionStatus, 0);
  objc_storeStrong((id *)&self->_deviceWhichUpdatedUserPresence, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_lastLocalActivityTimeStamp, 0);
  objc_storeStrong((id *)&self->_presenceRegionStatus, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
