@implementation CPLMomentShareParticipant

- (CPLMomentShareParticipant)initWithCoder:(id)a3
{
  id v4;
  CPLMomentShareParticipant *v5;
  CPLMomentShareParticipant *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentShareParticipant;
  v5 = -[CPLMomentShareParticipant init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLMomentShareParticipant)initWithShareParticipant:(id)a3
{
  id v4;
  CPLMomentShareParticipant *v5;
  void *v6;
  uint64_t v7;
  NSString *userIdentifier;
  void *v9;
  uint64_t v10;
  NSString *email;
  void *v12;
  uint64_t v13;
  NSString *phoneNumber;
  void *v15;
  uint64_t v16;
  NSPersonNameComponents *nameComponents;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPLMomentShareParticipant;
  v5 = -[CPLMomentShareParticipant init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "userIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v7;

    v5->_isCurrentUser = objc_msgSend(v4, "isCurrentUser");
    v5->_type = objc_msgSend(v4, "role");
    v5->_status = objc_msgSend(v4, "acceptanceStatus");
    objc_msgSend(v4, "email");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    email = v5->_email;
    v5->_email = (NSString *)v10;

    objc_msgSend(v4, "phoneNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v13;

    objc_msgSend(v4, "nameComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v16;

    v5->_hasiCloudAccount = objc_msgSend(v4, "hasiCloudAccount");
  }

  return v5;
}

- (id)asShareParticipant
{
  CPLShareParticipant *v3;

  v3 = -[CPLShareParticipant initWithUserIdentifier:]([CPLShareParticipant alloc], "initWithUserIdentifier:", self->_userIdentifier);
  -[CPLShareParticipant setIsCurrentUser:](v3, "setIsCurrentUser:", self->_isCurrentUser);
  -[CPLShareParticipant setRole:](v3, "setRole:", self->_type);
  -[CPLShareParticipant setAcceptanceStatus:](v3, "setAcceptanceStatus:", self->_status);
  -[CPLShareParticipant setEmail:](v3, "setEmail:", self->_email);
  -[CPLShareParticipant setPhoneNumber:](v3, "setPhoneNumber:", self->_phoneNumber);
  -[CPLShareParticipant setNameComponents:](v3, "setNameComponents:", self->_nameComponents);
  -[CPLShareParticipant setHasiCloudAccount:](v3, "setHasiCloudAccount:", self->_hasiCloudAccount);
  return v3;
}

- (id)description
{
  const __CFString *v2;

  if (self->_hasiCloudAccount)
    v2 = CFSTR("iCloud");
  else
    v2 = CFSTR("Non-iCloud");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@|%@|%@ %@ %@"), *(_OWORD *)&self->_email, self->_userIdentifier, self->_nameComponents, v2);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasiCloudAccount
{
  return self->_hasiCloudAccount;
}

- (void)setHasiCloudAccount:(BOOL)a3
{
  self->_hasiCloudAccount = a3;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void)setIsCurrentUser:(BOOL)a3
{
  self->_isCurrentUser = a3;
}

- (signed)type
{
  return self->_type;
}

- (void)setType:(signed __int16)a3
{
  self->_type = a3;
}

- (signed)status
{
  return self->_status;
}

- (void)setStatus:(signed __int16)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

+ (id)momentShareParticipantsFromParticipants:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CPLMomentShareParticipant *v12;
  CPLMomentShareParticipant *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12 = [CPLMomentShareParticipant alloc];
          v13 = -[CPLMomentShareParticipant initWithShareParticipant:](v12, "initWithShareParticipant:", v11, (_QWORD)v15);
          objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (id)shareParticipantsFromMomentShareParticipants:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "asShareParticipant", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

@end
