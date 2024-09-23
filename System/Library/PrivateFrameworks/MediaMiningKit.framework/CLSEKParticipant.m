@implementation CLSEKParticipant

- (CLSEKParticipant)initWithEKParticipant:(id)a3
{
  id v4;
  CLSEKParticipant *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *emailAddress;
  uint64_t v10;
  NSString *name;
  CLSEKParticipant *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)CLSEKParticipant;
    v5 = -[CLSEKParticipant init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "URL");
      v6 = objc_claimAutoreleasedReturnValue();
      URL = v5->_URL;
      v5->_URL = (NSURL *)v6;

      v5->_participantStatus = objc_msgSend(v4, "participantStatus");
      objc_msgSend(v4, "emailAddress");
      v8 = objc_claimAutoreleasedReturnValue();
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = (NSString *)v8;

      objc_msgSend(v4, "name");
      v10 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v10;

      v5->_isCurrentUser = objc_msgSend(v4, "isCurrentUser");
      v5->_participantType = objc_msgSend(v4, "participantType");
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CLSEKParticipant)initWithCoder:(id)a3
{
  id v4;
  CLSEKParticipant *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *emailAddress;
  uint64_t v10;
  NSString *name;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSEKParticipant;
  v5 = -[CLSEKParticipant init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v5->_participantStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("participantStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v5->_isCurrentUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCurrentUser"));
    v5->_participantType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("participantType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *URL;
  id v5;

  URL = self->_URL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", URL, CFSTR("URL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_participantStatus, CFSTR("participantStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddress, CFSTR("emailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCurrentUser, CFSTR("isCurrentUser"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_participantType, CFSTR("participantType"));

}

- (unint64_t)hash
{
  return -[NSURL hash](self->_URL, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CLSEKParticipant *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (CLSEKParticipant *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CLSEKParticipant hash](self, "hash");
      v6 = v5 == -[CLSEKParticipant hash](v4, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (int64_t)participantType
{
  return self->_participantType;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end
