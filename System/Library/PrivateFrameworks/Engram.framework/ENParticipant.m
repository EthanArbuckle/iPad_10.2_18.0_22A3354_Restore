@implementation ENParticipant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENParticipant)initWithAccountPublicKey:(id)a3 aliases:(id)a4 devices:(id)a5
{
  id v9;
  id v10;
  id v11;
  ENParticipant *v12;
  ENParticipant *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENParticipant;
  v12 = -[ENParticipant init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountPublicKey, a3);
    objc_storeStrong((id *)&v13->_aliases, a4);
    objc_storeStrong((id *)&v13->_devices, a5);
  }

  return v13;
}

- (ENParticipant)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ENParticipant *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("kENParticipantAliasesKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("kENParticipantDevicesKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ENParticipant initWithAccountPublicKey:aliases:devices:](self, "initWithAccountPublicKey:aliases:devices:", 0, v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ENParticipant accountPublicKey](self, "accountPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kENParticipantAccountPublicKey"));

  -[ENParticipant aliases](self, "aliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kENParticipantAliasesKey"));

  -[ENParticipant devices](self, "devices");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kENParticipantDevicesKey"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ENParticipant aliases](self, "aliases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENParticipant accountPublicKey](self, "accountPublicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ENParticipant supportsEngram](self, "supportsEngram");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p aliases: %@ accountPublicKey: %@, supportEngram: %@>"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)supportsEngram
{
  void *v3;
  void *v4;
  BOOL v5;

  -[ENParticipant accountPublicKey](self, "accountPublicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ENParticipant devices](self, "devices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ENParticipant devices](self, "devices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (ENAccountPublicKey)accountPublicKey
{
  return self->_accountPublicKey;
}

- (void)setAccountPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_accountPublicKey, a3);
}

- (NSSet)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
  objc_storeStrong((id *)&self->_aliases, a3);
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_accountPublicKey, 0);
}

@end
