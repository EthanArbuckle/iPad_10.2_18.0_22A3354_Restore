@implementation CTXPCContexts

- (void)encodeWithCoder:(id)a3
{
  NSArray *subscriptions;
  id v5;

  subscriptions = self->_subscriptions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subscriptions, CFSTR("subscriptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataPreferred, CFSTR("user_data_preferred"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voicePreferred, CFSTR("user_default_voice"));

}

- (id)findForUuid:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
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
  -[CTXPCContexts subscriptions](self, "subscriptions", 0);
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
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTXPCContexts subscriptions](self, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", subscriptions=%@"), v4);

  -[CTXPCContexts dataPreferred](self, "dataPreferred");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", dataPreferred=%@"), v5);

  -[CTXPCContexts voicePreferred](self, "voicePreferred");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", voicePreferred=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (NSUUID)voicePreferred
{
  return self->_voicePreferred;
}

- (NSUUID)dataPreferred
{
  return self->_dataPreferred;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTXPCContexts)initWithCoder:(id)a3
{
  id v4;
  CTXPCContexts *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *subscriptions;
  uint64_t v11;
  NSUUID *dataPreferred;
  uint64_t v13;
  NSUUID *voicePreferred;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTXPCContexts;
  v5 = -[CTXPCContexts init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("subscriptions"));
    v9 = objc_claimAutoreleasedReturnValue();
    subscriptions = v5->_subscriptions;
    v5->_subscriptions = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user_data_preferred"));
    v11 = objc_claimAutoreleasedReturnValue();
    dataPreferred = v5->_dataPreferred;
    v5->_dataPreferred = (NSUUID *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user_default_voice"));
    v13 = objc_claimAutoreleasedReturnValue();
    voicePreferred = v5->_voicePreferred;
    v5->_voicePreferred = (NSUUID *)v13;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicePreferred, 0);
  objc_storeStrong((id *)&self->_dataPreferred, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CTXPCContexts *v5;
  void *subscriptions;
  void *v7;
  int v8;
  int v9;
  NSUUID *dataPreferred;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSUUID *voicePreferred;
  void *v16;

  v5 = (CTXPCContexts *)a3;
  if (v5 == self)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_38;
  }
  subscriptions = self->_subscriptions;
  if (subscriptions)
    goto LABEL_4;
  -[CTXPCContexts subscriptions](v5, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_15:
    v12 = 1;
    goto LABEL_38;
  }
  subscriptions = self->_subscriptions;
  if (!subscriptions)
  {
    v9 = 0;
    goto LABEL_22;
  }
LABEL_4:
  -[CTXPCContexts subscriptions](v5, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(subscriptions, "isEqual:", v7) & 1) != 0)
  {
    v8 = 0;
    v9 = 1;
    goto LABEL_6;
  }
  if (self->_subscriptions)
  {
    v12 = 0;
LABEL_37:

    goto LABEL_38;
  }
  v9 = 1;
LABEL_22:
  -[CTXPCContexts subscriptions](v5, "subscriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {

    v12 = 0;
    goto LABEL_36;
  }
  v8 = 1;
LABEL_6:
  dataPreferred = self->_dataPreferred;
  if (!dataPreferred)
  {
LABEL_19:
    -[CTXPCContexts dataPreferred](v5, "dataPreferred");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v12 = 0;
      goto LABEL_41;
    }
    v11 = 1;
    goto LABEL_25;
  }
  -[CTXPCContexts dataPreferred](v5, "dataPreferred");
  subscriptions = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSUUID isEqual:](dataPreferred, "isEqual:", subscriptions) & 1) == 0)
  {
    if (self->_dataPreferred)
    {
      v12 = 0;
      goto LABEL_35;
    }
    goto LABEL_19;
  }
  v11 = 0;
LABEL_25:
  voicePreferred = self->_voicePreferred;
  if (!voicePreferred)
    goto LABEL_32;
  -[CTXPCContexts voicePreferred](v5, "voicePreferred");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSUUID isEqual:](voicePreferred, "isEqual:", v3) & 1) != 0)
  {
    v12 = 1;
    goto LABEL_33;
  }
  if (self->_voicePreferred)
  {
    v12 = 0;
  }
  else
  {
LABEL_32:
    -[CTXPCContexts voicePreferred](v5, "voicePreferred");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16 == 0;

    if (!voicePreferred)
    {
      if (!v11)
      {
LABEL_34:
        if (dataPreferred)
          goto LABEL_35;
        goto LABEL_42;
      }
      goto LABEL_40;
    }
  }
LABEL_33:

  if ((v11 & 1) == 0)
    goto LABEL_34;
LABEL_40:
  v13 = 0;
LABEL_41:

  if (dataPreferred)
  {
LABEL_35:

    if ((v8 & 1) != 0)
      goto LABEL_36;
LABEL_43:
    if (!v9)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_42:
  if (!v8)
    goto LABEL_43;
LABEL_36:
  if ((v9 & 1) != 0)
    goto LABEL_37;
LABEL_38:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTXPCContexts subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSubscriptions:", v6);

  -[CTXPCContexts dataPreferred](self, "dataPreferred");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDataPreferred:", v8);

  -[CTXPCContexts voicePreferred](self, "voicePreferred");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setVoicePreferred:", v10);

  return v4;
}

- (id)findForSlot:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CTXPCContexts subscriptions](self, "subscriptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "slotID") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)findForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
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
  -[CTXPCContexts subscriptions](self, "subscriptions", 0);
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
        objc_msgSend(v9, "accountID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
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

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (void)setDataPreferred:(id)a3
{
  objc_storeStrong((id *)&self->_dataPreferred, a3);
}

- (void)setVoicePreferred:(id)a3
{
  objc_storeStrong((id *)&self->_voicePreferred, a3);
}

@end
