@implementation HMDIncomingHomeInvitation

- (NSDictionary)bulletinContext
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("homeIncomingInvitation");
  -[HMDHomeInvitation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (HMDIncomingHomeInvitation)initWithInviterAccount:(id)a3 invitationIdentifier:(id)a4 invitationState:(int64_t)a5 homeName:(id)a6 homeUUID:(id)a7 inviterIdentity:(id)a8 expiryDate:(id)a9
{
  return -[HMDIncomingHomeInvitation initWithInviterAccount:invitationIdentifier:invitationState:homeName:homeUUID:inviterIdentity:inviterMergeID:expiryDate:](self, "initWithInviterAccount:invitationIdentifier:invitationState:homeName:homeUUID:inviterIdentity:inviterMergeID:expiryDate:", a3, a4, a5, a6, a7, a8, 0, a9);
}

- (HMDIncomingHomeInvitation)initWithInviterAccount:(id)a3 invitationIdentifier:(id)a4 invitationState:(int64_t)a5 homeName:(id)a6 homeUUID:(id)a7 inviterIdentity:(id)a8 inviterMergeID:(id)a9 expiryDate:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDIncomingHomeInvitation *v25;
  HMDIncomingHomeInvitation *v26;
  uint64_t v27;
  HMFPairingIdentity *inviterIdentity;
  uint64_t v29;
  NSString *inviterMergeID;
  id v33;
  id v35;
  void *v37;
  objc_super v38;

  v14 = a3;
  v35 = a8;
  v33 = a9;
  v15 = a10;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  objc_msgSend(v14, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x24BDD7718]);
  v37 = v14;
  objc_msgSend(v14, "handles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "remoteDestinationString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v20, "initWithInviterUserID:invitationIdentifier:inviterName:invitationState:homeName:homeUUID:expiryDate:", v23, v18, v19, a5, v17, v16, v15);

  v38.receiver = self;
  v38.super_class = (Class)HMDIncomingHomeInvitation;
  v25 = -[HMDHomeInvitation initWithInvitationData:forHome:](&v38, sel_initWithInvitationData_forHome_, v24, 0);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_inviterAccount, a3);
    v27 = objc_msgSend(v35, "copy");
    inviterIdentity = v26->_inviterIdentity;
    v26->_inviterIdentity = (HMFPairingIdentity *)v27;

    v29 = objc_msgSend(v33, "copy");
    inviterMergeID = v26->_inviterMergeID;
    v26->_inviterMergeID = (NSString *)v29;

  }
  return v26;
}

- (NSString)homeName
{
  void *v2;
  void *v3;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)homeUUID
{
  void *v2;
  void *v3;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)inviterUserID
{
  void *v2;
  void *v3;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inviterUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)refreshDisplayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[HMDIncomingHomeInvitation inviterAccount](self, "inviterAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "inviterName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();
    if ((v9 & 1) == 0)
      objc_msgSend(v5, "setInviterName:", v7);
    v10 = v9 ^ 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDIncomingHomeInvitation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDIncomingHomeInvitation *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  HMFPairingIdentity *inviterIdentity;
  uint64_t v14;
  NSString *inviterMergeID;
  uint64_t v16;
  void *inviterAccount;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HMDAccount *v22;
  objc_super v24;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.invitationData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)HMDIncomingHomeInvitation;
  v6 = -[HMDHomeInvitation initWithCoder:invitationData:](&v24, sel_initWithCoder_invitationData_, v4, v5);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE3F230]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userPublicKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithPairingKeyData:", v8);

    v10 = objc_alloc(MEMORY[0x24BE3F228]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingUsername"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithIdentifier:publicKey:privateKey:", v11, v9, 0);
    inviterIdentity = v6->_inviterIdentity;
    v6->_inviterIdentity = (HMFPairingIdentity *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mergeID"));
    v14 = objc_claimAutoreleasedReturnValue();
    inviterMergeID = v6->_inviterMergeID;
    v6->_inviterMergeID = (NSString *)v14;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.account")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.account"));
      v16 = objc_claimAutoreleasedReturnValue();
      inviterAccount = v6->_inviterAccount;
      v6->_inviterAccount = (HMDAccount *)v16;
    }
    else
    {
      +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inviterUserID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accountHandleFromString:", v19);
      inviterAccount = (void *)objc_claimAutoreleasedReturnValue();

      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accountForHandle:", inviterAccount);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v6->_inviterAccount;
      v6->_inviterAccount = (HMDAccount *)v21;

    }
    -[HMDIncomingHomeInvitation refreshDisplayName](v6, "refreshDisplayName");

  }
  return v6;
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
  void *v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDIncomingHomeInvitation;
  -[HMDHomeInvitation encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    -[HMDIncomingHomeInvitation inviterIdentity](self, "inviterIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pairingUsername"));

    -[HMDIncomingHomeInvitation inviterIdentity](self, "inviterIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publicKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("userPublicKey"));

    -[HMDIncomingHomeInvitation inviterAccount](self, "inviterAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HM.account"));

    -[HMDIncomingHomeInvitation inviterMergeID](self, "inviterMergeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("mergeID"));

  }
  v12 = -[HMDIncomingHomeInvitation homeHasCameras](self, "homeHasCameras");
  objc_msgSend(v4, "encodeBool:forKey:", v12, *MEMORY[0x24BDD6488]);
  v13 = -[HMDIncomingHomeInvitation inviteePrivilege](self, "inviteePrivilege") == 5;
  objc_msgSend(v4, "encodeBool:forKey:", v13, *MEMORY[0x24BDD70C8]);
  -[HMDIncomingHomeInvitation restrictedGuestSchedule](self, "restrictedGuestSchedule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, *MEMORY[0x24BDD6AB0]);

}

- (id)describeWithFormat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v3 = (void *)MEMORY[0x227676638](self, a2);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HMDIncomingHomeInvitation;
  -[HMDHomeInvitation describeWithFormat](&v20, sel_describeWithFormat);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@"), v5);

  -[HMDHomeInvitation invitationData](self, "invitationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  -[HMDIncomingHomeInvitation inviterUserID](self, "inviterUserID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inviterName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDIncomingHomeInvitation homeName](self, "homeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIncomingHomeInvitation homeUUID](self, "homeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("type = Incoming, inviter email = %@ inviter name = %@ home = %@ (%@)"), v9, v10, v11, v13);

  v14 = -[HMDIncomingHomeInvitation inviteePrivilege](self, "inviteePrivilege");
  if (v14 > 5)
    v15 = CFSTR("None");
  else
    v15 = off_24E793D90[v14];
  v16 = v15;
  -[HMDIncomingHomeInvitation restrictedGuestSchedule](self, "restrictedGuestSchedule");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Privilege = %@, RG Schedule = %@"), v16, v17);

  v18 = (void *)objc_msgSend(v4, "copy");
  objc_autoreleasePoolPop(v3);
  return v18;
}

- (HMDAccount)inviterAccount
{
  return (HMDAccount *)objc_getProperty(self, a2, 104, 1);
}

- (HMFPairingIdentity)inviterIdentity
{
  return (HMFPairingIdentity *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)inviterMergeID
{
  return self->_inviterMergeID;
}

- (BOOL)homeHasCameras
{
  return self->_homeHasCameras;
}

- (void)setHomeHasCameras:(BOOL)a3
{
  self->_homeHasCameras = a3;
}

- (unint64_t)inviteePrivilege
{
  return self->_inviteePrivilege;
}

- (void)setInviteePrivilege:(unint64_t)a3
{
  self->_inviteePrivilege = a3;
}

- (HMRestrictedGuestHomeAccessSchedule)restrictedGuestSchedule
{
  return self->_restrictedGuestSchedule;
}

- (void)setRestrictedGuestSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedGuestSchedule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedGuestSchedule, 0);
  objc_storeStrong((id *)&self->_inviterMergeID, 0);
  objc_storeStrong((id *)&self->_inviterIdentity, 0);
  objc_storeStrong((id *)&self->_inviterAccount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
