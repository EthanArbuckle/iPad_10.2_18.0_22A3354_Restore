@implementation KCSharingParticipant

- (KCSharingParticipant)initWithHandle:(id)a3 permissionLevel:(int64_t)a4
{
  id v7;
  KCSharingParticipant *v8;
  KCSharingParticipant *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingParticipant;
  v8 = -[KCSharingParticipant init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_permissionLevel = a4;
  }

  return v9;
}

- (KCSharingParticipant)initWithParticipantID:(id)a3 handle:(id)a4 permissionLevel:(int64_t)a5 isCurrentUser:(BOOL)a6 inviteStatus:(int64_t)a7 sharingInvitationData:(id)a8
{
  id v14;
  id v15;
  id v16;
  KCSharingParticipant *v17;
  uint64_t v18;
  NSString *participantID;
  uint64_t v20;
  NSString *handle;
  uint64_t v22;
  NSData *sharingInvitationData;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)KCSharingParticipant;
  v17 = -[KCSharingParticipant init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    participantID = v17->_participantID;
    v17->_participantID = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    handle = v17->_handle;
    v17->_handle = (NSString *)v20;

    v17->_isCurrentUser = a6;
    v17->_permissionLevel = a5;
    v17->_inviteStatus = a7;
    v22 = objc_msgSend(v16, "copy");
    sharingInvitationData = v17->_sharingInvitationData;
    v17->_sharingInvitationData = (NSData *)v22;

  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KCSharingParticipant *v4;
  void *v5;
  void *v6;
  int64_t v7;
  _BOOL8 v8;
  int64_t v9;
  void *v10;
  KCSharingParticipant *v11;

  v4 = [KCSharingParticipant alloc];
  -[KCSharingParticipant participantID](self, "participantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingParticipant handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  v8 = -[KCSharingParticipant isCurrentUser](self, "isCurrentUser");
  v9 = -[KCSharingParticipant inviteStatus](self, "inviteStatus");
  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[KCSharingParticipant initWithParticipantID:handle:permissionLevel:isCurrentUser:inviteStatus:sharingInvitationData:](v4, "initWithParticipantID:handle:permissionLevel:isCurrentUser:inviteStatus:sharingInvitationData:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (BOOL)isOwner
{
  return -[KCSharingParticipant permissionLevel](self, "permissionLevel") == 2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[KCSharingParticipant participantID](self, "participantID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingParticipant handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  v7 = CFSTR("readOnly");
  if (v6 == 1)
    v7 = CFSTR("readWrite");
  if (v6 == 2)
    v7 = CFSTR("owner");
  v8 = v7;
  v9 = -[KCSharingParticipant inviteStatus](self, "inviteStatus") - 1;
  if (v9 > 2)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E1FCC1C8[v9];
  if (-[KCSharingParticipant isCurrentUser](self, "isCurrentUser"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[KCSharingParticipant isOwner](self, "isOwner"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("KCSharingParticipant(%@, handle:%@ permissionLevel:%@ inviteStatus: %@ isCurrentUser:%@ isOwner:%@)"), v4, v5, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)longDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[KCSharingParticipant description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR(" inviteToken:%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "insertString:atIndex:", v8, objc_msgSend(v4, "length") - 1);
  return (NSString *)v4;
}

- (NSDictionary)JSONObject
{
  void *v3;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  int64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("handle");
  -[KCSharingParticipant handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("permissionLevel");
  v4 = -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  v5 = CFSTR("readOnly");
  if (v4 == 1)
    v5 = CFSTR("readWrite");
  if (v4 == 2)
    v5 = CFSTR("owner");
  v6 = v5;
  v18[1] = v6;
  v17[2] = CFSTR("isCurrentUser");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = CFSTR("inviteStatus");
  v8 = -[KCSharingParticipant inviteStatus](self, "inviteStatus");
  if ((unint64_t)(v8 - 1) > 2)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E1FCC1C8[v8 - 1];
  v18[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[KCSharingParticipant participantID](self, "participantID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("participantID"));

  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("inviteToken"));

  v15 = (void *)objc_msgSend(v11, "copy");
  return (NSDictionary *)v15;
}

- (KCSharingParticipant)initWithCoder:(id)a3
{
  id v4;
  KCSharingParticipant *v5;
  uint64_t v6;
  NSString *participantID;
  uint64_t v8;
  NSString *handle;
  uint64_t v10;
  NSData *sharingInvitationData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KCSharingParticipant;
  v5 = -[KCSharingParticipant init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantID"));
    v6 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    v5->_permissionLevel = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("permissionLevel"));
    v5->_isCurrentUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCurrentUser"));
    v5->_inviteStatus = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("inviteStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inviteData"));
    v10 = objc_claimAutoreleasedReturnValue();
    sharingInvitationData = v5->_sharingInvitationData;
    v5->_sharingInvitationData = (NSData *)v10;

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
  -[KCSharingParticipant participantID](self, "participantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("participantID"));

  -[KCSharingParticipant handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("handle"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[KCSharingParticipant permissionLevel](self, "permissionLevel"), CFSTR("permissionLevel"));
  objc_msgSend(v4, "encodeBool:forKey:", -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"), CFSTR("isCurrentUser"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[KCSharingParticipant inviteStatus](self, "inviteStatus"), CFSTR("inviteStatus"));
  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("inviteData"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  unint64_t v11;

  -[KCSharingParticipant participantID](self, "participantID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[KCSharingParticipant handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[KCSharingParticipant permissionLevel](self, "permissionLevel");
  v8 = -[KCSharingParticipant isCurrentUser](self, "isCurrentUser");
  v9 = v7 ^ v8 ^ -[KCSharingParticipant inviteStatus](self, "inviteStatus");
  -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int v17;
  int64_t v19;
  BOOL v20;

  v6 = a3;
  if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = v6;
    -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[KCSharingParticipant sharingInvitationData](self, "sharingInvitationData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sharingInvitationData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToData:", v3);

    }
    else
    {
      objc_msgSend(v7, "sharingInvitationData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;
    }

    -[KCSharingParticipant participantID](self, "participantID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "participantID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v13
      || (-[KCSharingParticipant participantID](self, "participantID"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "participantID"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToString:", v4)))
    {
      -[KCSharingParticipant handle](self, "handle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", v15)
        && (v20 = v10,
            v16 = -[KCSharingParticipant permissionLevel](self, "permissionLevel"),
            v16 == objc_msgSend(v7, "permissionLevel"))
        && (v17 = -[KCSharingParticipant isCurrentUser](self, "isCurrentUser"),
            v17 == objc_msgSend(v7, "isCurrentUser")))
      {
        v19 = -[KCSharingParticipant inviteStatus](self, "inviteStatus");
        v11 = v19 == objc_msgSend(v7, "inviteStatus") && v20;
      }
      else
      {
        v11 = 0;
      }

      if (v12 == v13)
        goto LABEL_15;
    }
    else
    {
      v11 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (void)_setInvitedBy:(id)a3
{
  objc_storeWeak((id *)&self->_invitedBy, a3);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (NSString)handle
{
  return self->_handle;
}

- (int64_t)permissionLevel
{
  return self->_permissionLevel;
}

- (void)setPermissionLevel:(int64_t)a3
{
  self->_permissionLevel = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (KCSharingParticipant)invitedBy
{
  return (KCSharingParticipant *)objc_loadWeakRetained((id *)&self->_invitedBy);
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
  objc_destroyWeak((id *)&self->_invitedBy);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
