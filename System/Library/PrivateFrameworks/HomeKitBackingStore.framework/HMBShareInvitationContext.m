@implementation HMBShareInvitationContext

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 emailAddress:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  HMBShareInvitationContext *v10;

  v6 = (objc_class *)MEMORY[0x1E0C95218];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithEmailAddress:", v7);

  v10 = -[HMBShareInvitationContext initWithParticipantClientIdentifier:lookupInfo:](self, "initWithParticipantClientIdentifier:lookupInfo:", v8, v9);
  return v10;
}

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 phoneNumber:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  HMBShareInvitationContext *v10;

  v6 = (objc_class *)MEMORY[0x1E0C95218];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPhoneNumber:", v7);

  v10 = -[HMBShareInvitationContext initWithParticipantClientIdentifier:lookupInfo:](self, "initWithParticipantClientIdentifier:lookupInfo:", v8, v9);
  return v10;
}

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 cloudShareID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMBShareInvitationContext *v12;

  v6 = (objc_class *)MEMORY[0x1E0C95218];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v7, "userRecordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithUserRecordID:", v10);
  v12 = -[HMBShareInvitationContext initWithParticipantClientIdentifier:lookupInfo:](self, "initWithParticipantClientIdentifier:lookupInfo:", v8, v11);

  return v12;
}

- (HMBShareInvitationContext)initWithParticipantClientIdentifier:(id)a3 lookupInfo:(id)a4
{
  id v7;
  id v8;
  HMBShareInvitationContext *v9;
  HMBShareInvitationContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBShareInvitationContext;
  v9 = -[HMBShareInvitationContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participantClientIdentifier, a3);
    objc_storeStrong((id *)&v10->_lookupInfo, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitationContext participantClientIdentifier](self, "participantClientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("User Client Identifier"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitationContext shouldGrantWriteAccess](self, "shouldGrantWriteAccess", v5);
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Should Grant Write Access"), v7);
  v15[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitationContext lookupInfo](self, "lookupInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithName:value:options:formatter:", CFSTR("Lookup Info"), v10, 2, v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMBShareInvitationContext participantClientIdentifier](self, "participantClientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "participantClientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (v9 = -[HMBShareInvitationContext shouldGrantWriteAccess](self, "shouldGrantWriteAccess"),
          v9 == objc_msgSend(v6, "shouldGrantWriteAccess")))
    {
      -[HMBShareInvitationContext lookupInfo](self, "lookupInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lookupInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isEqual:", v12);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[HMBShareInvitationContext participantClientIdentifier](self, "participantClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[HMBShareInvitationContext shouldGrantWriteAccess](self, "shouldGrantWriteAccess");
  -[HMBShareInvitationContext lookupInfo](self, "lookupInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMBShareInvitationContext *v4;
  void *v5;
  void *v6;
  HMBShareInvitationContext *v7;

  v4 = +[HMBShareInvitationContext allocWithZone:](HMBShareInvitationContext, "allocWithZone:", a3);
  -[HMBShareInvitationContext participantClientIdentifier](self, "participantClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBShareInvitationContext lookupInfo](self, "lookupInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBShareInvitationContext initWithParticipantClientIdentifier:lookupInfo:](v4, "initWithParticipantClientIdentifier:lookupInfo:", v5, v6);

  -[HMBShareInvitationContext setShouldGrantWriteAccess:](v7, "setShouldGrantWriteAccess:", -[HMBShareInvitationContext shouldGrantWriteAccess](self, "shouldGrantWriteAccess"));
  return v7;
}

- (HMBShareInvitationContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  HMBShareInvitationContext *v9;
  HMBShareInvitationContext *v10;
  HMBShareInvitationContext *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUIC.pci"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUIC.li"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v10 = -[HMBShareInvitationContext initWithParticipantClientIdentifier:lookupInfo:](self, "initWithParticipantClientIdentifier:lookupInfo:", v5, v6);
    v11 = v10;
    if (v10)
      v10->_shouldGrantWriteAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMBUIC.sgwa"));
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMBShareInvitationContext participantClientIdentifier](self, "participantClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMBUIC.pci"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMBShareInvitationContext shouldGrantWriteAccess](self, "shouldGrantWriteAccess"), CFSTR("HMBUIC.sgwa"));
  -[HMBShareInvitationContext lookupInfo](self, "lookupInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMBUIC.li"));

}

- (NSUUID)participantClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)shouldGrantWriteAccess
{
  return self->_shouldGrantWriteAccess;
}

- (void)setShouldGrantWriteAccess:(BOOL)a3
{
  self->_shouldGrantWriteAccess = a3;
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  return (CKUserIdentityLookupInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupInfo, 0);
  objc_storeStrong((id *)&self->_participantClientIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
