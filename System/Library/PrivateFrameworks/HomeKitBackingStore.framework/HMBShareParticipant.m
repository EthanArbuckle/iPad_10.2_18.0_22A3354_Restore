@implementation HMBShareParticipant

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a3;
  objc_msgSend(v8, "setWithObject:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMBShareParticipant)initWithCKShareParticipant:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  HMBShareParticipant *v8;
  uint64_t v9;
  CKShareParticipant *ckShareParticipant;
  uint64_t v11;
  NSUUID *clientIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMBShareParticipant;
  v8 = -[HMBShareParticipant init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    ckShareParticipant = v8->_ckShareParticipant;
    v8->_ckShareParticipant = (CKShareParticipant *)v9;

    v11 = objc_msgSend(v7, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSUUID *)v11;

  }
  return v8;
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
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("CK Share Participant"), v4, 2, 0);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareParticipant clientIdentifier](self, "clientIdentifier", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Client Identifier"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareParticipant pendingInvitation](self, "pendingInvitation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Pending Invitation"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMBShareUserID)cloudShareID
{
  void *v2;
  void *v3;
  void *v4;
  HMBShareUserID *v5;

  -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = -[HMBShareUserID initWithUserRecordID:]([HMBShareUserID alloc], "initWithUserRecordID:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)hasWriteAccess
{
  void *v2;
  BOOL v3;

  -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "permission") == 3;

  return v3;
}

- (BOOL)hasAccepted
{
  void *v2;
  BOOL v3;

  -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "acceptanceStatus") == 2;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ckShareParticipant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMBShareParticipant clientIdentifier](self, "clientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[HMBShareParticipant pendingInvitation](self, "pendingInvitation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pendingInvitation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMBShareParticipant clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMBShareParticipant pendingInvitation](self, "pendingInvitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMBShareParticipant *v4;
  void *v5;
  void *v6;
  HMBShareParticipant *v7;
  void *v8;

  v4 = +[HMBShareParticipant allocWithZone:](HMBShareParticipant, "allocWithZone:", a3);
  -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBShareParticipant clientIdentifier](self, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBShareParticipant initWithCKShareParticipant:clientIdentifier:](v4, "initWithCKShareParticipant:clientIdentifier:", v5, v6);

  -[HMBShareParticipant pendingInvitation](self, "pendingInvitation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBShareParticipant setPendingInvitation:](v7, "setPendingInvitation:", v8);

  return v7;
}

- (HMBShareParticipant)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  HMBShareParticipant *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.cksp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.ci"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.pi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

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
    self = -[HMBShareParticipant initWithCKShareParticipant:clientIdentifier:](self, "initWithCKShareParticipant:clientIdentifier:", v5, v6);
    -[HMBShareParticipant setPendingInvitation:](self, "setPendingInvitation:", v7);
    v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMBShareParticipant ckShareParticipant](self, "ckShareParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMBUI.cksp"));

  -[HMBShareParticipant clientIdentifier](self, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMBUI.ci"));

  -[HMBShareParticipant pendingInvitation](self, "pendingInvitation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMBUI.pi"));

}

- (NSUUID)clientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (CKShareParticipant)ckShareParticipant
{
  return (CKShareParticipant *)objc_getProperty(self, a2, 16, 1);
}

- (HMBShareInvitation)pendingInvitation
{
  return (HMBShareInvitation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingInvitation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvitation, 0);
  objc_storeStrong((id *)&self->_ckShareParticipant, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
