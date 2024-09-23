@implementation GTReplayProfileRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayProfileRequest)initWithCoder:(id)a3
{
  id v4;
  GTReplayProfileRequest *v5;
  uint64_t v6;
  NSData *profileData;
  GTReplayProfileRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayProfileRequest;
  v5 = -[GTReplayRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileData"));
    v6 = objc_claimAutoreleasedReturnValue();
    profileData = v5->_profileData;
    v5->_profileData = (NSData *)v6;

    v5->_profileDataVersion = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("profileDataVersion"));
    v5->_priority = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("priority"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayProfileRequest;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_profileData, CFSTR("profileData"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_profileDataVersion, CFSTR("profileDataVersion"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_priority, CFSTR("priority"));

}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

- (id)streamHandler
{
  return self->_streamHandler;
}

- (void)setStreamHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_profileData, a3);
}

- (int)profileDataVersion
{
  return self->_profileDataVersion;
}

- (void)setProfileDataVersion:(int)a3
{
  self->_profileDataVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong(&self->_streamHandler, 0);
}

@end
