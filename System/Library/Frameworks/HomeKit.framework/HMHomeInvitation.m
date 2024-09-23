@implementation HMHomeInvitation

- (HMHomeInvitation)initWithInvitationData:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HMHomeInvitation *v9;
  HMHomeInvitation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMHomeInvitation;
  v9 = -[HMHomeInvitation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_invitationData, a3);
    objc_storeWeak((id *)&v10->_home, v8);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMHomeInvitation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMHomeInvitation *v4;
  HMHomeInvitation *v5;
  HMHomeInvitation *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMHomeInvitation *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMHomeInvitation identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMHomeInvitation identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (HMHome)home
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMHome *)WeakRetained;
}

- (void)setHome:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSURL)homeObjectURL
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSURL *homeObjectURL;
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;

  -[HMHomeInvitation uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  homeObjectURL = self->_homeObjectURL;
  if (!homeObjectURL)
  {
    objc_msgSend(v3, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMBulletinObjectTuple tupleWithQueryType:uuidString:](HMBulletinObjectTuple, "tupleWithQueryType:uuidString:", 4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    generateURLForHomeKitObject(v7, 0);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v9 = self->_homeObjectURL;
    self->_homeObjectURL = v8;

    homeObjectURL = self->_homeObjectURL;
  }
  v10 = homeObjectURL;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[HMHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[HMHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[HMHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)invitationState
{
  void *v2;
  int64_t v3;

  -[HMHomeInvitation invitationData](self, "invitationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "invitationState");

  return v3;
}

- (void)cancelInviteWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("You must provide a completion handler"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  -[HMHomeInvitation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegateCaller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 48, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", v8, v6);

}

- (void)_updateInvitationState:(int64_t)a3
{
  id v4;

  -[HMHomeInvitation invitationData](self, "invitationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvitationState:", a3);

}

- (HMHomeInvitation)initWithCoder:(id)a3
{
  id v4;
  HMHomeInvitation *v5;
  void *v6;

  v4 = a3;
  v5 = -[HMHomeInvitation initWithInvitationData:home:](self, "initWithInvitationData:home:", 0, 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_home, v6);

  }
  return v5;
}

- (HMHomeInvitation)initWithCoder:(id)a3 invitationData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMHomeInvitation *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMHomeInvitation initWithInvitationData:home:](self, "initWithInvitationData:home:", v6, v8);
  return v9;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return 0;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMHomeInvitationData)invitationData
{
  return self->_invitationData;
}

- (void)setInvitationData:(id)a3
{
  objc_storeStrong((id *)&self->_invitationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_homeObjectURL, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
