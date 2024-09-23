@implementation IDSActivityUpdate

- (IDSActivityUpdate)initWithSubActivity:(id)a3 pushToken:(id)a4 serverTimestamp:(unint64_t)a5 clientContext:(id)a6 isDeviceOnline:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  IDSActivityUpdate *v16;
  IDSActivityUpdate *v17;
  IDSActivityUpdate *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (v13 && objc_msgSend(v13, "length"))
  {
    v20.receiver = self;
    v20.super_class = (Class)IDSActivityUpdate;
    v16 = -[IDSActivityUpdate init](&v20, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_subActivity, a3);
      objc_storeStrong((id *)&v17->_pushToken, a4);
      objc_storeStrong((id *)&v17->_clientContext, a6);
      v17->_serverTimestamp = a5;
      v17->_isDeviceOnline = a7;
    }
    self = v17;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; subActivity: %@; pushToken: %@; serverTimestamp: %llu; clientContext: %@>"),
               objc_opt_class(),
               self,
               self->_subActivity,
               self->_pushToken,
               self->_serverTimestamp,
               self->_clientContext);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subActivity;
  id v5;

  subActivity = self->_subActivity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subActivity, CFSTR("subactivity"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_serverTimestamp, CFSTR("servertimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushToken, CFSTR("pushtoken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientContext, CFSTR("clientcontext"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDeviceOnline, CFSTR("online"));

}

- (IDSActivityUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  IDSActivityUpdate *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subactivity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("servertimestamp"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushtoken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientcontext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("online"));

  v10 = -[IDSActivityUpdate initWithSubActivity:pushToken:serverTimestamp:clientContext:isDeviceOnline:](self, "initWithSubActivity:pushToken:serverTimestamp:clientContext:isDeviceOnline:", v5, v7, v6, v8, v9);
  return v10;
}

- (NSString)subActivity
{
  return self->_subActivity;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (unint64_t)serverTimestamp
{
  return self->_serverTimestamp;
}

- (BOOL)isDeviceOnline
{
  return self->_isDeviceOnline;
}

- (void)setIsDeviceOnline:(BOOL)a3
{
  self->_isDeviceOnline = a3;
}

- (NSData)clientContext
{
  return self->_clientContext;
}

- (IDSDevice)matchingDevice
{
  return self->_matchingDevice;
}

- (void)setMatchingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_matchingDevice, a3);
}

- (NSArray)URIs
{
  return self->_URIs;
}

- (void)setURIs:(id)a3
{
  objc_storeStrong((id *)&self->_URIs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URIs, 0);
  objc_storeStrong((id *)&self->_matchingDevice, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_subActivity, 0);
}

@end
