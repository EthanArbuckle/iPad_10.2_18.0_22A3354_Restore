@implementation DMFDeleteUserRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF47D8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFDeleteUserRequest)initWithCoder:(id)a3
{
  id v4;
  DMFDeleteUserRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *username;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFDeleteUserRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("username"));
    v7 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("forceDeletion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_forceDeletion = objc_msgSend(v9, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFDeleteUserRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFDeleteUserRequest username](self, "username", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("username"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFDeleteUserRequest forceDeletion](self, "forceDeletion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("forceDeletion"));

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)forceDeletion
{
  return self->_forceDeletion;
}

- (void)setForceDeletion:(BOOL)a3
{
  self->_forceDeletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
}

@end
