@implementation HMHomeInvitationData

- (HMHomeInvitationData)initWithInvitationState:(int64_t)a3 invitationIdentifier:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  HMHomeInvitationData *v10;
  uint64_t v11;
  NSUUID *identifier;
  uint64_t v13;
  NSDate *startDate;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMHomeInvitationData;
  v10 = -[HMHomeInvitationData init](&v19, sel_init);
  if (v10)
  {
    if (v8)
    {
      v11 = objc_msgSend(v8, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v13;

    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting home invitation expiry date to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_storeStrong((id *)&v10->_endDate, a5);
    v10->_invitationState = a3;
  }

  return v10;
}

- (HMHomeInvitationData)initWithCoder:(id)a3
{
  id v4;
  HMHomeInvitationData *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMHomeInvitationData;
  v5 = -[HMHomeInvitationData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v5->_invitationState = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("HM.invitationState"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMHomeInvitationData identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("HM.identifier"));

  -[HMHomeInvitationData startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("HM.startDate"));

  -[HMHomeInvitationData endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("HM.endDate"));

  objc_msgSend(v7, "encodeInt32:forKey:", -[HMHomeInvitationData invitationState](self, "invitationState"), CFSTR("HM.invitationState"));
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMHomeInvitationData identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeInvitationData startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMHomeInvitationData endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMHomeInvitationData homeInvitationStateDescription:](HMHomeInvitationData, "homeInvitationStateDescription:", -[HMHomeInvitationData invitationState](self, "invitationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ identifier = %@, startDate = %@, endDate = %@, state = %@ ]"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)invitationState
{
  return self->_invitationState;
}

- (void)setInvitationState:(int64_t)a3
{
  self->_invitationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)homeInvitationStateDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return CFSTR("HMHomeInvitationStateUnknown");
  else
    return off_1E3AB4658[a3 - 1];
}

@end
