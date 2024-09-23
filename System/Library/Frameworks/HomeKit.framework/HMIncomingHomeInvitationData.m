@implementation HMIncomingHomeInvitationData

- (HMIncomingHomeInvitationData)initWithInviterUserID:(id)a3 invitationIdentifier:(id)a4 inviterName:(id)a5 invitationState:(int64_t)a6 homeName:(id)a7 homeUUID:(id)a8 expiryDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMIncomingHomeInvitationData *v27;
  int64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  HMIncomingHomeInvitationData *v39;
  uint64_t v40;
  NSString *inviterUserID;
  void *v42;
  uint64_t v43;
  NSString *homeName;
  uint64_t v45;
  NSUUID *homeUUID;
  uint64_t v47;
  NSUUID *inviterUUID;
  void *v49;
  uint64_t v50;
  NSString *inviterName;
  int64_t v53;
  id v54;
  id v55;
  id v56;
  objc_super v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v15 = a4;
  v55 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "timeIntervalSinceDate:", v19);
  if (v18)
  {
    v22 = v21;
    if (v21 <= 10800.0)
    {
      v33 = (void *)MEMORY[0x1A1AC1AAC](v20);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
      if (v22 >= 0.0)
      {
        if (v35)
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v38;
          v60 = 2112;
          v61 = (uint64_t)v18;
          _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        v37 = v18;
      }
      else
      {
        if (v35)
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v36;
          v60 = 2112;
          v61 = (uint64_t)v18;
          _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_INFO, "%{public}@Home invitation expiry date is already in the past, expiryDate: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        v37 = v19;
      }
      v26 = (void *)objc_msgSend(v37, "copy");
    }
    else
    {
      v53 = a6;
      v23 = (void *)MEMORY[0x1A1AC1AAC](v20);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v25;
        v60 = 2048;
        v61 = 0x40C5180000000000;
        v62 = 2112;
        v63 = v18;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_INFO, "%{public}@Capping home invitation expiry duration to %g seconds from now, original expiry date: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(v19, "dateByAddingTimeInterval:", 10800.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      a6 = v53;
    }
  }
  else
  {
    v27 = self;
    v28 = a6;
    objc_msgSend(v19, "dateByAddingTimeInterval:", 10800.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = v15;
      v31 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v32;
      v60 = 2112;
      v61 = (uint64_t)v26;
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to maximum allowed: %@", buf, 0x16u);

      v17 = v31;
      v15 = v54;
    }

    objc_autoreleasePoolPop(v29);
    a6 = v28;
    self = v27;
  }
  v57.receiver = self;
  v57.super_class = (Class)HMIncomingHomeInvitationData;
  v39 = -[HMHomeInvitationData initWithInvitationState:invitationIdentifier:endDate:](&v57, sel_initWithInvitationState_invitationIdentifier_endDate_, a6, v15, v26);
  if (v39)
  {
    v40 = objc_msgSend(v56, "copy");
    inviterUserID = v39->_inviterUserID;
    v39->_inviterUserID = (NSString *)v40;

    objc_msgSend(v16, "hm_truncatedNameString");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    homeName = v39->_homeName;
    v39->_homeName = (NSString *)v43;

    v45 = objc_msgSend(v17, "copy");
    homeUUID = v39->_homeUUID;
    v39->_homeUUID = (NSUUID *)v45;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v47 = objc_claimAutoreleasedReturnValue();
    inviterUUID = v39->_inviterUUID;
    v39->_inviterUUID = (NSUUID *)v47;

    objc_msgSend(v55, "hm_truncatedNameString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "copy");
    inviterName = v39->_inviterName;
    v39->_inviterName = (NSString *)v50;

    v39->_lock._os_unfair_lock_opaque = 0;
  }

  return v39;
}

- (NSString)inviterName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_inviterName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInviterName:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *inviterName;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v7, "hm_truncatedNameString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  inviterName = self->_inviterName;
  self->_inviterName = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMIncomingHomeInvitationData)initWithCoder:(id)a3
{
  id v4;
  HMIncomingHomeInvitationData *v5;
  void *v6;
  uint64_t v7;
  NSString *homeName;
  uint64_t v9;
  NSUUID *homeUUID;
  uint64_t v11;
  NSString *inviterUserID;
  uint64_t v13;
  NSUUID *inviterUUID;
  void *v15;
  uint64_t v16;
  NSString *inviterName;
  uint64_t v18;
  NSString *inviterMergeID;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMIncomingHomeInvitationData;
  v5 = -[HMHomeInvitationData initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hm_truncatedNameString");
    v7 = objc_claimAutoreleasedReturnValue();
    homeName = v5->_homeName;
    v5->_homeName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeUUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.inviterUserID"));
    v11 = objc_claimAutoreleasedReturnValue();
    inviterUserID = v5->_inviterUserID;
    v5->_inviterUserID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userUUID"));
    v13 = objc_claimAutoreleasedReturnValue();
    inviterUUID = v5->_inviterUUID;
    v5->_inviterUUID = (NSUUID *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDisplayName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hm_truncatedNameString");
    v16 = objc_claimAutoreleasedReturnValue();
    inviterName = v5->_inviterName;
    v5->_inviterName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mergeID"));
    v18 = objc_claimAutoreleasedReturnValue();
    inviterMergeID = v5->_inviterMergeID;
    v5->_inviterMergeID = (NSString *)v18;

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMIncomingHomeInvitationData;
  v4 = a3;
  -[HMHomeInvitationData encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[HMIncomingHomeInvitationData inviterUserID](self, "inviterUserID", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.inviterUserID"));

  -[HMIncomingHomeInvitationData homeName](self, "homeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("homeName"));

  -[HMIncomingHomeInvitationData homeUUID](self, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("homeUUID"));

  -[HMIncomingHomeInvitationData inviterUUID](self, "inviterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("userUUID"));

  -[HMIncomingHomeInvitationData inviterName](self, "inviterName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("userDisplayName"));

  -[HMIncomingHomeInvitationData inviterMergeID](self, "inviterMergeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("mergeID"));

}

- (id)description
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
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMIncomingHomeInvitationData;
  -[HMHomeInvitationData description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIncomingHomeInvitationData inviterUserID](self, "inviterUserID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIncomingHomeInvitationData inviterUUID](self, "inviterUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIncomingHomeInvitationData inviterName](self, "inviterName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIncomingHomeInvitationData inviterMergeID](self, "inviterMergeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIncomingHomeInvitationData homeName](self, "homeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIncomingHomeInvitationData homeUUID](self, "homeUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", [ inviterUserID = %@, inviterUUID = %@, inviterName = %@, inviterMergeID = %@, home = %@, homeUUID = %@ ]"), v4, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)inviterUserID
{
  return self->_inviterUserID;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSUUID)inviterUUID
{
  return self->_inviterUUID;
}

- (NSString)inviterMergeID
{
  return self->_inviterMergeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterMergeID, 0);
  objc_storeStrong((id *)&self->_inviterUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_inviterUserID, 0);
  objc_storeStrong((id *)&self->_inviterName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
