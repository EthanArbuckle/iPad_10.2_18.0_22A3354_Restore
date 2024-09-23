@implementation DMFInviteUserToVPPRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4B20;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 0;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInviteUserToVPPRequest)initWithCoder:(id)a3
{
  id v4;
  DMFInviteUserToVPPRequest *v5;
  void *v6;
  uint64_t v7;
  NSURL *URL;
  void *v9;
  uint64_t v10;
  NSString *originator;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFInviteUserToVPPRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("URL"));
    v7 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("originator"));
    v10 = objc_claimAutoreleasedReturnValue();
    originator = v5->_originator;
    v5->_originator = (NSString *)v10;

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
  v7.super_class = (Class)DMFInviteUserToVPPRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFInviteUserToVPPRequest URL](self, "URL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  -[DMFInviteUserToVPPRequest originator](self, "originator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("originator"));

}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
