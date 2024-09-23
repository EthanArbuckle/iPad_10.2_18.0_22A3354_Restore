@implementation HMDOutgoingHomeInvitation

- (HMDOutgoingHomeInvitation)initWithInvitee:(id)a3 invitationState:(int64_t)a4 forHome:(id)a5 expiryDate:(id)a6 messageIdentifier:(id)a7
{
  return -[HMDOutgoingHomeInvitation initWithUUID:invitee:invitationState:forHome:expiryDate:messageIdentifier:](self, "initWithUUID:invitee:invitationState:forHome:expiryDate:messageIdentifier:", 0, a3, a4, a5, a6, a7);
}

- (HMDOutgoingHomeInvitation)initWithUUID:(id)a3 invitee:(id)a4 invitationState:(int64_t)a5 forHome:(id)a6 expiryDate:(id)a7 messageIdentifier:(id)a8
{
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDOutgoingHomeInvitation *v24;
  id obj;
  id v27;
  objc_super v28;

  v15 = a4;
  obj = a8;
  v27 = a8;
  v16 = (objc_class *)MEMORY[0x24BDD7888];
  v17 = a7;
  v18 = a6;
  v19 = a3;
  v20 = [v16 alloc];
  objc_msgSend(v15, "userID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithUUID:inviteeUserID:inviteeName:invitationState:expiryDate:", v19, v21, v22, a5, v17);

  v28.receiver = self;
  v28.super_class = (Class)HMDOutgoingHomeInvitation;
  v24 = -[HMDHomeInvitation initWithInvitationData:forHome:](&v28, sel_initWithInvitationData_forHome_, v23, v18);

  if (v24)
  {
    objc_storeStrong((id *)&v24->_user, a4);
    objc_storeStrong((id *)&v24->_messageIdentifier, obj);
  }

  return v24;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDHomeInvitation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDHomeInvitation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeInvitation invitationState](self, "invitationState");
  -[HMDHomeInvitation operations](self, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, Identifier = %@, Invitee = %@, State = %tu, Operations = %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDOutgoingHomeInvitation shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeInvitation invitationState](self, "invitationState");
  -[HMDHomeInvitation operations](self, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Identifier = %@, Invitee = %@, State = %tu, Operations = %@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)responseReceived
{
  return -[HMDHomeInvitation isAccepted](self, "isAccepted") || -[HMDHomeInvitation isDeclined](self, "isDeclined");
}

- (BOOL)isComplete
{
  _BOOL4 v3;

  v3 = -[HMDOutgoingHomeInvitation responseReceived](self, "responseReceived");
  if (v3)
  {
    v3 = -[HMDHomeInvitation isAccepted](self, "isAccepted");
    if (v3)
      LOBYTE(v3) = !-[HMDHomeInvitation isDeclined](self, "isDeclined");
  }
  return v3;
}

- (void)cancel
{
  -[HMDOutgoingHomeInvitation updateInvitationState:](self, "updateInvitationState:", 1);
}

- (NSArray)accessoryInvitationsInformation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDHomeInvitation operations](self, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (HMDOutgoingHomeInvitation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDOutgoingHomeInvitation *v6;
  uint64_t v7;
  void *user;
  uint64_t v9;
  HMDUser *v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSString *inviteeDestinationAddress;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *uuidsOfAllowedAccessories;
  objc_super v20;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.invitationData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HMDOutgoingHomeInvitation;
  v6 = -[HMDHomeInvitation initWithCoder:invitationData:](&v20, sel_initWithCoder_invitationData_, v4, v5);
  if (v6)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.residentDevice")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.residentDevice"));
      v7 = objc_claimAutoreleasedReturnValue();
      user = v6->_user;
      v6->_user = (HMDUser *)v7;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v6->_user;
      v6->_user = (HMDUser *)v9;

      -[HMDUser displayName](v6->_user, "displayName");
      user = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inviteeName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(user, "isEqual:", v11);

      if ((v12 & 1) == 0)
        objc_msgSend(v5, "setInviteeName:", user);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.inviteeDestinationAddress"));
    v13 = objc_claimAutoreleasedReturnValue();
    inviteeDestinationAddress = v6->_inviteeDestinationAddress;
    v6->_inviteeDestinationAddress = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6AB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUser setRestrictedGuestAccessSettings:](v6->_user, "setRestrictedGuestAccessSettings:", v15);

    -[HMDUser restrictedGuestAccessSettings](v6->_user, "restrictedGuestAccessSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuidsOfAllowedAccessories");
    v17 = objc_claimAutoreleasedReturnValue();
    uuidsOfAllowedAccessories = v6->_uuidsOfAllowedAccessories;
    v6->_uuidsOfAllowedAccessories = (NSArray *)v17;

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
  int v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDOutgoingHomeInvitation;
  -[HMDHomeInvitation encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    v5 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDHomeInvitation operations](self, "operations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.accessoryInvitations"));
  }
  -[HMDOutgoingHomeInvitation user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRemoteGateway");

  -[HMDOutgoingHomeInvitation user](self, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v11 = CFSTR("HM.residentDevice");
  else
    v11 = CFSTR("HM.user");
  objc_msgSend(v4, "encodeObject:forKey:", v10, v11);

  -[HMDOutgoingHomeInvitation inviteeDestinationAddress](self, "inviteeDestinationAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDOutgoingHomeInvitation inviteeDestinationAddress](self, "inviteeDestinationAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("HM.inviteeDestinationAddress"));

  }
  -[HMDOutgoingHomeInvitation user](self, "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "restrictedGuestAccessSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, *MEMORY[0x24BDD6AB8]);

}

- (id)describeWithFormat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HMDOutgoingHomeInvitation;
  -[HMDHomeInvitation describeWithFormat](&v10, sel_describeWithFormat);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  -[HMDOutgoingHomeInvitation user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type = Outgoing, invitee email = %@ invitee name = %@"), v6, v8);

  return v3;
}

- (BOOL)refreshDisplayName
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[HMDOutgoingHomeInvitation user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "refreshDisplayName");

  if (!v4)
    return 0;
  -[HMDHomeInvitation invitationData](self, "invitationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v5 : 0;
  v7 = v6;

  if (!v7)
    return 0;
  -[HMDOutgoingHomeInvitation user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInviteeName:", v9);

  return 1;
}

- (void)notifyStateChangedForMessage:(id)a3
{
  id v4;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeInvitation invitationData](self, "invitationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation accessoryInvitationsInformation](self, "accessoryInvitationsInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v24[0] = CFSTR("kInvitationIdentifierKey");
    -[HMDHomeInvitation identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("kAccessoryInvitationsKey");
    v25[0] = v11;
    v25[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  encodeRootObject();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("kInvitationsDataKey");
  v22[1] = CFSTR("kAccessoryInvitationsDataKey");
  v23[0] = v7;
  v23[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(MEMORY[0x24BE3F1B0], "entitledMessageWithName:identifier:messagePayload:", CFSTR("kUserInvitationsUpdatedNotificationKey"), v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "msgDispatcher");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendMessage:target:", v18, v21);

}

- (void)updateInvitationState:(int64_t)a3
{
  int64_t v5;
  objc_super v6;

  v5 = -[HMDHomeInvitation invitationState](self, "invitationState");
  v6.receiver = self;
  v6.super_class = (Class)HMDOutgoingHomeInvitation;
  -[HMDHomeInvitation updateInvitationState:](&v6, sel_updateInvitationState_, a3);
  if (-[HMDHomeInvitation invitationState](self, "invitationState") != v5)
    -[HMDOutgoingHomeInvitation notifyStateChangedForMessage:](self, "notifyStateChangedForMessage:", 0);
}

- (NSArray)operationIdentifiers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_operationIdentifiers, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setOperationIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *operationIdentifiers;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  operationIdentifiers = self->_operationIdentifiers;
  self->_operationIdentifiers = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v10;
  else
    v8 = 0;
  v9 = v8;
  if (v9)
    -[HMDOutgoingHomeInvitation _transactionOutgoingInvitationUpdated:newValues:message:](self, "_transactionOutgoingInvitationUpdated:newValues:message:", 0, v9, v7);

}

- (void)_transactionOutgoingInvitationUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDOutgoingHomeInvitation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSUUID *v24;
  NSUUID *messageIdentifier;
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
  void *v37;
  void *v38;
  void *v39;
  int64_t v40;
  void *v41;
  HMDOutgoingHomeInvitation *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(_QWORD, _QWORD, _QWORD);
  int v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation updateUser:](self, "updateUser:", v12);

  }
  objc_msgSend(v9, "expiryDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeInvitation endDate](v15, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "expiryDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543874;
      v53 = v17;
      v54 = 2112;
      v55 = (uint64_t)v18;
      v56 = 2112;
      v57 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Expiry date is updated from: %@ to %@", (uint8_t *)&v52, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v9, "expiryDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeInvitation setEndDate:](v15, "setEndDate:", v20);

  }
  objc_msgSend(v9, "messageIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v9, "messageIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (NSUUID *)objc_msgSend(v22, "initWithUUIDString:", v23);
    messageIdentifier = self->_messageIdentifier;
    self->_messageIdentifier = v24;

  }
  objc_msgSend(v9, "inviteeDestinationAddress");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v9, "inviteeDestinationAddress");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation setInviteeDestinationAddress:](self, "setInviteeDestinationAddress:", v27);

  }
  objc_msgSend(v9, "idsInvitationUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v9, "idsInvitationUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeInvitation setIdsInvitationUUID:](self, "setIdsInvitationUUID:", v29);

  }
  objc_msgSend(v9, "dateSent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v9, "dateSent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation setDateSent:](self, "setDateSent:", v31);

  }
  objc_msgSend(v9, "accessCode");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v9, "accessCode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation setAccessCode:](self, "setAccessCode:", v33);

  }
  objc_msgSend(v9, "announceAccessLevel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v9, "announceAccessLevel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation setAnnounceAccessLevel:](self, "setAnnounceAccessLevel:", v35);

  }
  objc_msgSend(v9, "pendingUserUUID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v9, "pendingUserUUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation setPendingUserUUID:](self, "setPendingUserUUID:", v37);

  }
  objc_msgSend(v9, "invitationState");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v9, "invitationState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "integerValue") == 2)
    {
      v40 = -[HMDHomeInvitation invitationState](self, "invitationState");

      if (v40 != 2)
      {
        v41 = (void *)MEMORY[0x227676638]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[HMDHomeInvitation invitationState](v42, "invitationState");
          v52 = 138543618;
          v53 = v44;
          v54 = 2048;
          v55 = v45;
          _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Invitation state cannot be set back to pending, maintaining current state as %lu", (uint8_t *)&v52, 0x16u);

        }
        objc_autoreleasePoolPop(v41);
        goto LABEL_29;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "invitationState");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation updateInvitationState:](self, "updateInvitationState:", objc_msgSend(v46, "integerValue"));

  }
LABEL_29:
  objc_msgSend(v9, "uuidsOfAllowedAccessories");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v9, "uuidsOfAllowedAccessories");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation setUuidsOfAllowedAccessories:](self, "setUuidsOfAllowedAccessories:", v48);

  }
  objc_msgSend(v10, "transactionResult");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "markChanged");
  objc_msgSend(v10, "responseHandler");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v10, "responseHandler");
    v51 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v51[2](v51, 0, 0);

  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDOutgoingHomeInvitation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Outgoing invitations have no objects to remove. Transaction UUID: %@, Parent UUID: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

- (id)emptyModelObjectWithChangeType:(unint64_t)a3
{
  HMDOutgoingHomeInvitationModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDOutgoingHomeInvitationModel *v9;

  v5 = [HMDOutgoingHomeInvitationModel alloc];
  -[HMDHomeInvitation identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[HMDOutgoingHomeInvitation emptyModelObjectWithChangeType:](self, "emptyModelObjectWithChangeType:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryEncoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUser:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomeInvitation invitationState](self, "invitationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvitationState:", v8);

  -[HMDHomeInvitation endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpiryDate:", v9);

  -[HMDOutgoingHomeInvitation messageIdentifier](self, "messageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageIdentifier:", v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDOutgoingHomeInvitation responseReceived](self, "responseReceived"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseReceived:", v12);

  -[HMDOutgoingHomeInvitation inviteeDestinationAddress](self, "inviteeDestinationAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInviteeDestinationAddress:", v13);

  -[HMDHomeInvitation idsInvitationUUID](self, "idsInvitationUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdsInvitationUUID:", v14);

  v15 = (void *)MEMORY[0x24BDD16E0];
  -[HMDOutgoingHomeInvitation user](self, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "announceAccessLevel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnnounceAccessLevel:", v17);

  -[HMDOutgoingHomeInvitation user](self, "user");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessCode:", v19);

  -[HMDOutgoingHomeInvitation user](self, "user");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPendingUserUUID:", v21);

  -[HMDOutgoingHomeInvitation user](self, "user");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "restrictedGuestAccessSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uuidsOfAllowedAccessories");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuidsOfAllowedAccessories:", v24);

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (NSString)inviteeDestinationAddress
{
  return self->_inviteeDestinationAddress;
}

- (void)setInviteeDestinationAddress:(id)a3
{
  objc_storeStrong((id *)&self->_inviteeDestinationAddress, a3);
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (NSArray)uuidsOfAllowedAccessories
{
  return self->_uuidsOfAllowedAccessories;
}

- (void)setUuidsOfAllowedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_uuidsOfAllowedAccessories, a3);
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_storeStrong((id *)&self->_dateSent, a3);
}

- (NSNumber)announceAccessLevel
{
  return self->_announceAccessLevel;
}

- (void)setAnnounceAccessLevel:(id)a3
{
  objc_storeStrong((id *)&self->_announceAccessLevel, a3);
}

- (NSString)accessCode
{
  return self->_accessCode;
}

- (void)setAccessCode:(id)a3
{
  objc_storeStrong((id *)&self->_accessCode, a3);
}

- (NSUUID)pendingUserUUID
{
  return self->_pendingUserUUID;
}

- (void)setPendingUserUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUserUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUserUUID, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_announceAccessLevel, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_uuidsOfAllowedAccessories, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_inviteeDestinationAddress, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_operationIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
