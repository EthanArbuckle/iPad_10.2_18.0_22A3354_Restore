@implementation NFValueAddedServiceCard

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)NFValueAddedServiceCard;
  -[NFValueAddedServiceCard description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { merchantID=%@ type=%d token=%@ passData=%@ userInterventionRequired=%d }"), v4, self->_identifier, self->_type, self->_token, self->_data, self->_userInterventionRequired);

  return v5;
}

- (id)asDictionary
{
  id v3;
  NSData *identifier;
  void *v5;
  NSData *token;
  NSData *data;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  identifier = self->_identifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  token = self->_token;
  data = self->_data;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userInterventionRequired);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", identifier, CFSTR("merchantID"), v5, CFSTR("type"), token, CFSTR("token"), data, CFSTR("passData"), v8, CFSTR("userInterventionRequired"), 0);

  return v9;
}

- (NFValueAddedServiceCard)initWithCoder:(id)a3
{
  id v4;
  NFValueAddedServiceCard *v5;
  uint64_t v6;
  NSData *identifier;
  uint64_t v8;
  NSData *token;
  uint64_t v10;
  NSData *data;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFValueAddedServiceCard;
  v5 = -[NFValueAddedServiceCard init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v6;

    v5->_type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v8 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v5->_userInterventionRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInterventionRequired"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("token"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userInterventionRequired, CFSTR("userInterventionRequired"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIdentifier:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  NSData *v6;
  NSData *identifier;
  NSData *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "length");
  if (v4 > 0x1F)
  {
    v8 = (NSData *)v9;
    identifier = self->_identifier;
    self->_identifier = v8;
  }
  else
  {
    v5 = v4;
    v6 = (NSData *)objc_msgSend(v9, "mutableCopy");
    -[NSData increaseLengthBy:](v6, "increaseLengthBy:", 32 - v5);
    identifier = self->_identifier;
    self->_identifier = v6;
  }

}

- (NSData)identifier
{
  return self->_identifier;
}

- (BOOL)userInterventionRequired
{
  return self->_userInterventionRequired;
}

- (void)setUserInterventionRequired:(BOOL)a3
{
  self->_userInterventionRequired = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSData)token
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
