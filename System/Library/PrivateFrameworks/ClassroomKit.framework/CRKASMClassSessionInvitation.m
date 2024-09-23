@implementation CRKASMClassSessionInvitation

- (CRKASMClassSessionInvitation)initWithInvitationIdentifier:(id)a3 instructorIdentifier:(id)a4 sessionIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKASMClassSessionInvitation *v12;
  CRKASMClassSessionInvitation *v13;
  uint64_t v14;
  NSString *instructorIdentifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMClassSessionInvitation;
  v12 = -[CRKASMClassSessionInvitation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_invitationIdentifier, a3);
    v14 = objc_msgSend(v10, "copy");
    instructorIdentifier = v13->_instructorIdentifier;
    v13->_instructorIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_sessionIdentifier, a5);
  }

  return v13;
}

- (CRKASMClassSessionInvitation)initWithSessionIdentifier:(id)a3 instructorIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  CRKASMClassSessionInvitation *v10;

  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CRKASMClassSessionInvitation initWithInvitationIdentifier:instructorIdentifier:sessionIdentifier:](self, "initWithInvitationIdentifier:instructorIdentifier:sessionIdentifier:", v9, v7, v8);

  return v10;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("SessionIdentifier");
  -[CRKASMClassSessionInvitation sessionIdentifier](self, "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("InstructorIdentifier");
  -[CRKASMClassSessionInvitation instructorIdentifier](self, "instructorIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("InvitationIdentifier");
  -[CRKASMClassSessionInvitation invitationIdentifier](self, "invitationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InstructorIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InvitationIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = 0;
  if (v7 && v13 && v10)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7F0]), "initWithString:", v7);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
    v17 = (void *)v16;
    v14 = 0;
    if (v15 && v16)
      v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInvitationIdentifier:instructorIdentifier:sessionIdentifier:", v16, v10, v15);

  }
  return v14;
}

- (NSUUID)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSString)instructorIdentifier
{
  return self->_instructorIdentifier;
}

- (DMFControlSessionIdentifier)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_instructorIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end
