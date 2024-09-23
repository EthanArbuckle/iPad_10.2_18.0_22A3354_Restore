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
  v16 = (objc_class *)MEMORY[0x1E0CBA728];
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

  v3 = (void *)MEMORY[0x1E0CB3940];
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMDHomeInvitation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeInvitation invitationState](self, "invitationState");
  -[HMDOutgoingHomeInvitation operations](self, "operations");
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDOutgoingHomeInvitation shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeInvitation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeInvitation invitationState](self, "invitationState");
  -[HMDOutgoingHomeInvitation operations](self, "operations");
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
  int v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[HMDOutgoingHomeInvitation responseReceived](self, "responseReceived")
    && -[HMDHomeInvitation isAccepted](self, "isAccepted")
    && !-[HMDHomeInvitation isDeclined](self, "isDeclined"))
  {
    -[HMDOutgoingHomeInvitation operationIdentifiers](self, "operationIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[HMDHomeInvitation home](self, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDOutgoingHomeInvitation operationIdentifiers](self, "operationIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "operationsWithIdentifiers:outOperations:", v9, 0) ^ 1;

    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)cancel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDOutgoingHomeInvitation updateInvitationState:](self, "updateInvitationState:", 1);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[HMDOutgoingHomeInvitation operations](self, "operations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSArray)accessoryInvitationsInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDOutgoingHomeInvitation operations](self, "operations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDOutgoingHomeInvitation operations](self, "operations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "accessoryInvitationInformation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (HMDOutgoingHomeInvitation)initWithCoder:(id)a3
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
  HMDOutgoingHomeInvitation *v14;
  uint64_t v15;
  void *user;
  uint64_t v17;
  HMDUser *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSString *inviteeDestinationAddress;
  NSArray *v23;
  void *operationIdentifiers;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *v33;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.invitationData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kUserManagementOperationsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("kUserManagementOperationIdentifiersKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v41.receiver = self;
  v41.super_class = (Class)HMDOutgoingHomeInvitation;
  v14 = -[HMDHomeInvitation initWithCoder:invitationData:](&v41, sel_initWithCoder_invitationData_, v4, v5);
  if (v14)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HM.residentDevice")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.residentDevice"));
      v15 = objc_claimAutoreleasedReturnValue();
      user = v14->_user;
      v14->_user = (HMDUser *)v15;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.user"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v14->_user;
      v14->_user = (HMDUser *)v17;

      -[HMDUser displayName](v14->_user, "displayName");
      user = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inviteeName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(user, "isEqual:", v19);

      if ((v20 & 1) == 0)
        objc_msgSend(v5, "setInviteeName:", user);
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.inviteeDestinationAddress"));
    v21 = objc_claimAutoreleasedReturnValue();
    inviteeDestinationAddress = v14->_inviteeDestinationAddress;
    v14->_inviteeDestinationAddress = (NSString *)v21;

    if (v13)
    {
      v23 = v13;
      operationIdentifiers = v14->_operationIdentifiers;
      v14->_operationIdentifiers = v23;
LABEL_17:

      goto LABEL_18;
    }
    if (v9)
    {
      v36 = v5;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
      operationIdentifiers = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v35 = v9;
      v25 = v9;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v38;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v38 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v29), "identifier", v35);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "UUIDString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(operationIdentifiers, "addObject:", v31);

            ++v29;
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v27);
      }

      objc_msgSend(operationIdentifiers, "allObjects");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v14->_operationIdentifiers;
      v14->_operationIdentifiers = (NSArray *)v32;

      v9 = v35;
      v5 = v36;
      goto LABEL_17;
    }
  }
LABEL_18:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  HMDOutgoingHomeInvitation *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HMDOutgoingHomeInvitation;
  -[HMDHomeInvitation encodeWithCoder:](&v43, sel_encodeWithCoder_, v4);
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    -[HMDOutgoingHomeInvitation operations](self, "operations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[HMDOutgoingHomeInvitation operations](self, "operations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "accessoryInvitation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.accessoryInvitations"));
  }
  -[HMDOutgoingHomeInvitation user](self, "user");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isRemoteGateway");

  -[HMDOutgoingHomeInvitation user](self, "user");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v18 = CFSTR("HM.residentDevice");
  else
    v18 = CFSTR("HM.user");
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[HMDOutgoingHomeInvitation operations](self, "operations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    objc_msgSend(v4, "hmd_supportedFeatures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", &unk_1E8B327A8);

    if ((v21 & 1) == 0)
    {
      v34 = self;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = v19;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            objc_msgSend(v28, "accessory");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0 && v29)
              objc_msgSend(v22, "addObject:", v28);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v25);
      }

      v19 = (void *)objc_msgSend(v22, "copy");
      self = v34;
    }
  }
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("kUserManagementOperationsKey"));
  -[HMDOutgoingHomeInvitation operationIdentifiers](self, "operationIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("kUserManagementOperationIdentifiersKey"));

  -[HMDOutgoingHomeInvitation inviteeDestinationAddress](self, "inviteeDestinationAddress");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[HMDOutgoingHomeInvitation inviteeDestinationAddress](self, "inviteeDestinationAddress");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("HM.inviteeDestinationAddress"));

  }
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
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

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeInvitation invitationData](self, "invitationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
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
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  encodeRootObject();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("kInvitationsDataKey");
  v22[1] = CFSTR("kAccessoryInvitationsDataKey");
  v23[0] = v7;
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0D285D0], "entitledMessageWithName:identifier:messagePayload:", CFSTR("kUserInvitationsUpdatedNotificationKey"), v17, v14);
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

- (NSArray)operations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;

  -[HMDHomeInvitation home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation operationIdentifiers](self, "operationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "operationsWithIdentifiers:outOperations:", v5, &v8);
  v6 = v8;

  return (NSArray *)v6;
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

- (void)updateUserManagementOperations:(id)a3
{
  id v4;
  void *v5;
  HMDOutgoingHomeInvitation *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDOutgoingHomeInvitation *v25;
  NSObject *v26;
  void *v27;
  HMDOutgoingHomeInvitationModel *v28;
  void *v29;
  void *v30;
  HMDOutgoingHomeInvitationModel *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Migrating operations to models", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeInvitation home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transaction:options:", CFSTR("kUserManagementOperationAddedKey"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v14);
        +[HMDUserManagementOperation operationWithDictionary:home:](HMDUserManagementOperation, "operationWithDictionary:home:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && (objc_msgSend(v19, "isFinished") & 1) == 0)
        {
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v22);

          objc_msgSend(v20, "modelObjectWithChangeType:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "add:", v23);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v16);
  }

  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = v6;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v27;
    v42 = 2112;
    v43 = v35;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Migrating operations with identifiers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(v13, "run");
  v28 = [HMDOutgoingHomeInvitationModel alloc];
  -[HMDHomeInvitation identifier](v25, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v28, "initWithObjectChangeType:uuid:parentUUID:", 2, v29, v30);

  -[HMDOutgoingHomeInvitationModel setOperations:](v31, "setOperations:", 0);
  -[HMDOutgoingHomeInvitationModel setOperationIdentifiers:](v31, "setOperationIdentifiers:", v35);
  objc_msgSend(v9, "backingStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "transaction:options:", CFSTR("kUserManagementOperationAddedKey"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "add:", v31);
  objc_msgSend(v34, "run");

}

- (void)processUserManagementOperationIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HMDHomeInvitation home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "operationsWithIdentifiers:outOperations:", v11, 0);

  if ((v6 & 1) != 0)
  {
    -[HMDOutgoingHomeInvitation setOperationIdentifiers:](self, "setOperationIdentifiers:", v11);
  }
  else
  {
    objc_msgSend(v4, "backingStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transaction:options:", CFSTR("kInviteAcceptedKey"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDOutgoingHomeInvitation modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", 3, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "add:", v10);

    objc_msgSend(v9, "run");
  }

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
  int64_t v30;
  void *v31;
  HMDOutgoingHomeInvitation *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  int v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
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
    v14 = (void *)MEMORY[0x1D17BA0A0]();
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
      v43 = 138543874;
      v44 = v17;
      v45 = 2112;
      v46 = (uint64_t)v18;
      v47 = 2112;
      v48 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Expiry date is updated from: %@ to %@", (uint8_t *)&v43, 0x20u);

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
    v22 = objc_alloc(MEMORY[0x1E0CB3A28]);
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
  objc_msgSend(v9, "invitationState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v9, "invitationState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "integerValue") == 2)
    {
      v30 = -[HMDHomeInvitation invitationState](self, "invitationState");

      if (v30 != 2)
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[HMDHomeInvitation invitationState](v32, "invitationState");
          v43 = 138543618;
          v44 = v34;
          v45 = 2048;
          v46 = v35;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Invitation state cannot be set back to pending, maintaining current state as %lu", (uint8_t *)&v43, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "invitationState");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation updateInvitationState:](self, "updateInvitationState:", objc_msgSend(v36, "integerValue"));

  }
LABEL_19:
  objc_msgSend(v9, "operationIdentifiers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v9, "operationIdentifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation processUserManagementOperationIdentifiers:](self, "processUserManagementOperationIdentifiers:", v38);
  }
  else
  {
    objc_msgSend(v9, "operations");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
      goto LABEL_24;
    objc_msgSend(v9, "operations");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDOutgoingHomeInvitation updateUserManagementOperations:](self, "updateUserManagementOperations:", v38);
  }

LABEL_24:
  objc_msgSend(v10, "transactionResult");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "markChanged");
  objc_msgSend(v10, "responseHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v10, "responseHandler");
    v42 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v42[2](v42, 0, 0);

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

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Outgoing invitations have no objects to remove. Transaction UUID: %@, Parent UUID: %@", (uint8_t *)&v14, 0x20u);

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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMDOutgoingHomeInvitation emptyModelObjectWithChangeType:](self, "emptyModelObjectWithChangeType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDOutgoingHomeInvitation user](self, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUser:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHomeInvitation invitationState](self, "invitationState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvitationState:", v9);

  -[HMDHomeInvitation endDate](self, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpiryDate:", v10);

  -[HMDOutgoingHomeInvitation messageIdentifier](self, "messageIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageIdentifier:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDOutgoingHomeInvitation responseReceived](self, "responseReceived"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResponseReceived:", v13);

  -[HMDOutgoingHomeInvitation inviteeDestinationAddress](self, "inviteeDestinationAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInviteeDestinationAddress:", v14);

  -[HMDOutgoingHomeInvitation operationIdentifiers](self, "operationIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (a4 <= 3)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[HMDOutgoingHomeInvitation operations](self, "operations", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v22, "accessory");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0 || !v23)
          {
            objc_msgSend(v22, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "UUIDString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeObject:", v26);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

  }
  if (objc_msgSend(v16, "count"))
  {
    v27 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v6, "setOperationIdentifiers:", v27);

  }
  return v6;
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

- (void).cxx_destruct
{
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
