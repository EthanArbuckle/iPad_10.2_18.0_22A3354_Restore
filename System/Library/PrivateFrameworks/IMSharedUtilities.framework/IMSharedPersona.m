@implementation IMSharedPersona

+ (id)personaFromDictionaryRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  IMSharedPersona *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "_stringForKey:", CFSTR("h"));
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_stringForKey:", CFSTR("n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = -[IMSharedPersona initWithSenderID:suggestedDisplayName:]([IMSharedPersona alloc], "initWithSenderID:suggestedDisplayName:", v4, v5);

      v5 = (void *)v4;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (IMSharedPersona)initWithSenderID:(id)a3 suggestedDisplayName:(id)a4
{
  id v7;
  id v8;
  IMSharedPersona *v9;
  IMSharedPersona *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSharedPersona;
  v9 = -[IMSharedPersona init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_senderID, a3);
    if (objc_msgSend(v8, "length"))
      objc_storeStrong((id *)&v10->_suggestedDisplayName, a4);
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", self->_senderID, CFSTR("h"));
  if (-[NSString length](self->_suggestedDisplayName, "length"))
    objc_msgSend(v3, "setValue:forKey:", self->_suggestedDisplayName, CFSTR("n"));
  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[IMSharedPersona initWithSenderID:suggestedDisplayName:]([IMSharedPersona alloc], "initWithSenderID:suggestedDisplayName:", self->_senderID, self->_suggestedDisplayName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSharedPersona)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IMSharedPersona *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[IMSharedPersona initWithSenderID:suggestedDisplayName:](self, "initWithSenderID:suggestedDisplayName:", v5, v6);
    v7 = self;
  }
  else
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_senderID, CFSTR("senderID"));
  if (-[NSString length](self->_suggestedDisplayName, "length"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_suggestedDisplayName, CFSTR("suggestedName"));

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_senderID, CFSTR("senderID"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_suggestedDisplayName, CFSTR("suggestedDisplayName"), 1);
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (NSString)suggestedDisplayName
{
  return self->_suggestedDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedDisplayName, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
}

@end
