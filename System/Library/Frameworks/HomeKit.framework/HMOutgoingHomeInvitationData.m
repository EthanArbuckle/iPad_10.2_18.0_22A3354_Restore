@implementation HMOutgoingHomeInvitationData

- (HMOutgoingHomeInvitationData)initWithUUID:(id)a3 inviteeUserID:(id)a4 inviteeName:(id)a5 invitationState:(int64_t)a6 expiryDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  HMOutgoingHomeInvitationData *v29;
  int64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  HMOutgoingHomeInvitationData *v38;
  uint64_t v39;
  NSString *inviteeUserID;
  uint64_t v41;
  NSUUID *inviteeUUID;
  void *v43;
  uint64_t v44;
  NSString *inviteeName;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "timeIntervalSinceDate:", v16);
  if (v15)
  {
    v19 = v18;
    if (v18 <= 3153600000.0)
    {
      v32 = (void *)MEMORY[0x1A1AC1AAC](v17);
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
      if (v19 >= 0.0)
      {
        if (v34)
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v37;
          v51 = 2112;
          v52 = (uint64_t)v15;
          _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        v36 = v15;
      }
      else
      {
        if (v34)
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v35;
          v51 = 2112;
          v52 = (uint64_t)v15;
          _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Home invitation expiry date is already in the past, expiryDate: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        v36 = v16;
      }
      v23 = objc_msgSend(v36, "copy");
    }
    else
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC](v17);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v22;
        v51 = 2048;
        v52 = 0x41E77F03C0000000;
        v53 = 2112;
        v54 = v15;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Capping home invitation expiry duration to %g seconds from now, original expiry date: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v16, "dateByAddingTimeInterval:", 3153600000.0);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;
  }
  else
  {
    objc_msgSend(v16, "dateByAddingTimeInterval:", 3153600000.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = v12;
      v27 = v14;
      v28 = v13;
      v29 = self;
      v30 = a6;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v31;
      v51 = 2112;
      v52 = (uint64_t)v24;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to maximum allowed: %@", buf, 0x16u);

      a6 = v30;
      self = v29;
      v13 = v28;
      v14 = v27;
      v12 = v47;
    }

    objc_autoreleasePoolPop(v25);
  }
  v48.receiver = self;
  v48.super_class = (Class)HMOutgoingHomeInvitationData;
  v38 = -[HMHomeInvitationData initWithInvitationState:invitationIdentifier:endDate:](&v48, sel_initWithInvitationState_invitationIdentifier_endDate_, a6, v12, v24);
  if (v38)
  {
    v39 = objc_msgSend(v13, "copy");
    inviteeUserID = v38->_inviteeUserID;
    v38->_inviteeUserID = (NSString *)v39;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v41 = objc_claimAutoreleasedReturnValue();
    inviteeUUID = v38->_inviteeUUID;
    v38->_inviteeUUID = (NSUUID *)v41;

    objc_msgSend(v14, "hm_truncatedNameString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "copy");
    inviteeName = v38->_inviteeName;
    v38->_inviteeName = (NSString *)v44;

    v38->_lock._os_unfair_lock_opaque = 0;
  }

  return v38;
}

- (NSString)inviteeName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_inviteeName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInviteeName:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *inviteeName;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v7, "hm_truncatedNameString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  inviteeName = self->_inviteeName;
  self->_inviteeName = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMOutgoingHomeInvitationData)initWithCoder:(id)a3
{
  id v4;
  HMOutgoingHomeInvitationData *v5;
  uint64_t v6;
  NSString *inviteeUserID;
  uint64_t v8;
  NSUUID *inviteeUUID;
  void *v10;
  uint64_t v11;
  NSString *inviteeName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMOutgoingHomeInvitationData;
  v5 = -[HMHomeInvitationData initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.inviteeUserID"));
    v6 = objc_claimAutoreleasedReturnValue();
    inviteeUserID = v5->_inviteeUserID;
    v5->_inviteeUserID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    inviteeUUID = v5->_inviteeUUID;
    v5->_inviteeUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDisplayName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hm_truncatedNameString");
    v11 = objc_claimAutoreleasedReturnValue();
    inviteeName = v5->_inviteeName;
    v5->_inviteeName = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMOutgoingHomeInvitationData;
  v4 = a3;
  -[HMHomeInvitationData encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[HMOutgoingHomeInvitationData inviteeUserID](self, "inviteeUserID", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.inviteeUserID"));

  -[HMOutgoingHomeInvitationData inviteeUUID](self, "inviteeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userUUID"));

  -[HMOutgoingHomeInvitationData inviteeName](self, "inviteeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userDisplayName"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMOutgoingHomeInvitationData;
  -[HMHomeInvitationData description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMOutgoingHomeInvitationData inviteeUserID](self, "inviteeUserID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMOutgoingHomeInvitationData inviteeUUID](self, "inviteeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMOutgoingHomeInvitationData inviteeName](self, "inviteeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", [ inviteeUserID = %@, inviteeUUID = %@, inviteeName = %@ ]"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)inviteeUserID
{
  return self->_inviteeUserID;
}

- (NSUUID)inviteeUUID
{
  return self->_inviteeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteeUUID, 0);
  objc_storeStrong((id *)&self->_inviteeUserID, 0);
  objc_storeStrong((id *)&self->_inviteeName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
