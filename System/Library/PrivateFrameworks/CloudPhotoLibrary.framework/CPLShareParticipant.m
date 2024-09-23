@implementation CPLShareParticipant

- (CPLShareParticipant)initWithCoder:(id)a3
{
  id v4;
  CPLShareParticipant *v5;
  uint64_t v6;
  NSString *userIdentifier;
  uint64_t v8;
  NSString *participantID;
  uint64_t v10;
  NSString *email;
  uint64_t v12;
  NSString *phoneNumber;
  uint64_t v14;
  NSPersonNameComponents *nameComponents;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPLShareParticipant;
  v5 = -[CPLShareParticipant init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", _nsStringClass, CFSTR("uid"));
    v6 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", _nsStringClass, CFSTR("pid"));
    v8 = objc_claimAutoreleasedReturnValue();
    participantID = v5->_participantID;
    v5->_participantID = (NSString *)v8;

    v5->_isCurrentUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("current"));
    v5->_role = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("role"));
    v5->_acceptanceStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_permission = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("perm"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", _nsStringClass, CFSTR("email"));
    v10 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", _nsStringClass, CFSTR("phone"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v14 = objc_claimAutoreleasedReturnValue();
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v14;

    v5->_hasiCloudAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("iCloud"));
  }

  return v5;
}

- (CPLShareParticipant)init
{
  return -[CPLShareParticipant initWithUserIdentifier:participantID:phoneNumber:email:](self, "initWithUserIdentifier:participantID:phoneNumber:email:", 0, 0, 0, 0);
}

- (CPLShareParticipant)initWithUserIdentifier:(id)a3
{
  return -[CPLShareParticipant initWithUserIdentifier:participantID:phoneNumber:email:](self, "initWithUserIdentifier:participantID:phoneNumber:email:", a3, 0, 0, 0);
}

- (CPLShareParticipant)initWithPhoneNumber:(id)a3
{
  return -[CPLShareParticipant initWithUserIdentifier:participantID:phoneNumber:email:](self, "initWithUserIdentifier:participantID:phoneNumber:email:", 0, 0, a3, 0);
}

- (CPLShareParticipant)initWithEmail:(id)a3
{
  return -[CPLShareParticipant initWithUserIdentifier:participantID:phoneNumber:email:](self, "initWithUserIdentifier:participantID:phoneNumber:email:", 0, 0, 0, a3);
}

- (CPLShareParticipant)initWithParticipantID:(id)a3
{
  return -[CPLShareParticipant initWithUserIdentifier:participantID:phoneNumber:email:](self, "initWithUserIdentifier:participantID:phoneNumber:email:", 0, a3, 0, 0);
}

- (CPLShareParticipant)initWithUserIdentifier:(id)a3 participantID:(id)a4 phoneNumber:(id)a5 email:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CPLShareParticipant *v14;
  uint64_t v15;
  NSString *userIdentifier;
  uint64_t v17;
  NSString *phoneNumber;
  uint64_t v19;
  NSString *email;
  uint64_t v21;
  NSString *participantID;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CPLShareParticipant;
  v14 = -[CPLShareParticipant init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    userIdentifier = v14->_userIdentifier;
    v14->_userIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v12, "copy");
    phoneNumber = v14->_phoneNumber;
    v14->_phoneNumber = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    email = v14->_email;
    v14->_email = (NSString *)v19;

    v21 = objc_msgSend(v11, "copy");
    participantID = v14->_participantID;
    v14->_participantID = (NSString *)v21;

    v14->_permission = 1;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *userIdentifier;
  id v5;

  userIdentifier = self->_userIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userIdentifier, CFSTR("uid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrentUser, CFSTR("current"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_role, CFSTR("role"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_acceptanceStatus, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_permission, CFSTR("perm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_email, CFSTR("email"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_participantID, CFSTR("pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameComponents, CFSTR("name"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasiCloudAccount, CFSTR("iCloud"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CPLShareParticipant *v4;
  void *v5;

  v4 = -[CPLShareParticipant initWithUserIdentifier:participantID:phoneNumber:email:]([CPLShareParticipant alloc], "initWithUserIdentifier:participantID:phoneNumber:email:", self->_userIdentifier, self->_participantID, self->_phoneNumber, self->_email);
  -[CPLShareParticipant setIsCurrentUser:](v4, "setIsCurrentUser:", self->_isCurrentUser);
  -[CPLShareParticipant setRole:](v4, "setRole:", self->_role);
  -[CPLShareParticipant setAcceptanceStatus:](v4, "setAcceptanceStatus:", self->_acceptanceStatus);
  -[CPLShareParticipant setPermission:](v4, "setPermission:", self->_permission);
  v5 = (void *)-[NSPersonNameComponents copy](self->_nameComponents, "copy");
  -[CPLShareParticipant setNameComponents:](v4, "setNameComponents:", v5);

  -[CPLShareParticipant setHasiCloudAccount:](v4, "setHasiCloudAccount:", self->_hasiCloudAccount);
  return v4;
}

- (id)description
{
  void *v3;
  NSString *userIdentifier;
  NSString *participantID;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  userIdentifier = self->_userIdentifier;
  participantID = self->_participantID;
  if (self->_hasiCloudAccount)
    v6 = CFSTR("iCloud");
  else
    v6 = CFSTR("Non-iCloud");
  objc_msgSend((id)objc_opt_class(), "descriptionForRole:", self->_role);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "descriptionForPermission:", self->_permission);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ %@ %@ %@ %@]"), userIdentifier, participantID, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)redactedDescription
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_hasiCloudAccount)
    v4 = CFSTR("iCloud");
  else
    v4 = CFSTR("Non-iCloud");
  objc_msgSend((id)objc_opt_class(), "descriptionForRole:", self->_role);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "descriptionForPermission:", self->_permission);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[<redacted> %@ %@ %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (int64_t)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (void)setAcceptanceStatus:(int64_t)a3
{
  self->_acceptanceStatus = a3;
}

- (int64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(int64_t)a3
{
  self->_permission = a3;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)hasiCloudAccount
{
  return self->_hasiCloudAccount;
}

- (void)setHasiCloudAccount:(BOOL)a3
{
  self->_hasiCloudAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

+ (id)descriptionForAcceptanceStatus:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)a3 >= 4)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[status %ld]"), a3);
  else
    v3 = off_1E60D8070[a3];
  return v3;
}

+ (id)descriptionForPermission:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)a3 >= 4)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[permission %ld]"), a3);
  else
    v3 = off_1E60D8090[a3];
  return v3;
}

+ (id)descriptionForRole:(int64_t)a3
{
  __CFString *v3;

  if ((unint64_t)a3 >= 4)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[role %ld]"), a3);
  else
    v3 = off_1E60D80B0[a3];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _nsStringClass = objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
