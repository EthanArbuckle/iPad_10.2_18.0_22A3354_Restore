@implementation MRCodableGroupSessionParticipant

- (MRCodableGroupSessionParticipant)initWithIdentifier:(id)a3 identity:(id)a4 connected:(BOOL)a5 guest:(BOOL)a6 hidden:(BOOL)a7
{
  id v13;
  id v14;
  MRCodableGroupSessionParticipant *v15;
  MRCodableGroupSessionParticipant *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRCodableGroupSessionParticipant;
  v15 = -[MRCodableGroupSessionParticipant init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_identity, a4);
    v16->_connected = a5;
    v16->_guest = a6;
    v16->_hidden = a7;
  }

  return v16;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17 = objc_opt_class();
  -[MRCodableGroupSessionParticipant identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRCodableGroupSessionParticipant identity](self, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRCodableGroupSessionParticipant isLocal](self, "isLocal"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRCodableGroupSessionParticipant isPending](self, "isPending"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRCodableGroupSessionParticipant isConnected](self, "isConnected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRCodableGroupSessionParticipant isGuest](self, "isGuest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRCodableGroupSessionParticipant isHidden](self, "isHidden"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: identifier=%@, identity=%@, local=%@, pending=%@, connected=%@, guest=%@, hidden=%@>"), v17, v16, v14, v4, v5, v7, v9, v11);

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  MRCodableGroupSessionParticipant *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;

  v4 = (MRCodableGroupSessionParticipant *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      v7 = identifier;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSString isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identity, CFSTR("identity"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_host, CFSTR("host"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_local, CFSTR("local"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pending, CFSTR("pending"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_connected, CFSTR("connected"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_guest, CFSTR("guest"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hidden, CFSTR("hidden"));

}

- (MRCodableGroupSessionParticipant)initWithCoder:(id)a3
{
  id v4;
  MRCodableGroupSessionParticipant *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  MRUserIdentity *identity;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRCodableGroupSessionParticipant;
  v5 = -[MRCodableGroupSessionParticipant init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
    v8 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (MRUserIdentity *)v8;

    v5->_host = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("host"));
    v5->_local = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("local"));
    v5->_pending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pending"));
    v5->_connected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connected"));
    v5->_guest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("guest"));
    v5->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (MRUserIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (BOOL)isPending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isGuest
{
  return self->_guest;
}

- (void)setGuest:(BOOL)a3
{
  self->_guest = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (BOOL)isHost
{
  return self->_host;
}

- (void)setHost:(BOOL)a3
{
  self->_host = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
