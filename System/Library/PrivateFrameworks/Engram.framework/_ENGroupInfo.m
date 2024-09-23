@implementation _ENGroupInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ENGroupInfo)initWithAccountIdentity:(id)a3 paricipants:(id)a4 sharedApplicationData:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ENGroupInfo *v12;
  _ENGroupInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ENGroupInfo;
  v12 = -[_ENGroupInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    objc_storeStrong((id *)&v13->_participants, a4);
    objc_storeStrong((id *)&v13->_sharedApplicationData, a5);
  }

  return v13;
}

- (_ENGroupInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _ENGroupInfo *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kENGroupInfoAccountIdentityKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kENGroupInfoParticipantsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kENGroupInfoSharedApplicationDataKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_ENGroupInfo initWithAccountIdentity:paricipants:sharedApplicationData:](self, "initWithAccountIdentity:paricipants:sharedApplicationData:", v5, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_ENGroupInfo accountIdentity](self, "accountIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kENGroupInfoAccountIdentityKey"));

  -[_ENGroupInfo participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kENGroupInfoParticipantsKey"));

  -[_ENGroupInfo sharedApplicationData](self, "sharedApplicationData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kENGroupInfoSharedApplicationDataKey"));

}

- (ENAccountIdentity)accountIdentity
{
  return (ENAccountIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSData)sharedApplicationData
{
  return self->_sharedApplicationData;
}

- (void)setSharedApplicationData:(id)a3
{
  objc_storeStrong((id *)&self->_sharedApplicationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedApplicationData, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_accountIdentity, 0);
}

@end
