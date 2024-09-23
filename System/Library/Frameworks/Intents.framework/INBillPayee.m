@implementation INBillPayee

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[INBillPayee nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INBillPayee nickname](self, "nickname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INBillPayee accountNumber](self, "accountNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[INBillPayee accountNumber](self, "accountNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    -[INBillPayee organizationName](self, "organizationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (INBillPayee)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number organizationName:(INSpeakableString *)organizationName
{
  INSpeakableString *v8;
  NSString *v9;
  INSpeakableString *v10;
  INBillPayee *v11;
  uint64_t v12;
  INSpeakableString *v13;
  uint64_t v14;
  NSString *accountNumber;
  uint64_t v16;
  INSpeakableString *v17;
  objc_super v19;

  v8 = nickname;
  v9 = number;
  v10 = organizationName;
  v19.receiver = self;
  v19.super_class = (Class)INBillPayee;
  v11 = -[INBillPayee init](&v19, sel_init);
  if (v11)
  {
    v12 = -[INSpeakableString copy](v8, "copy");
    v13 = v11->_nickname;
    v11->_nickname = (INSpeakableString *)v12;

    v14 = -[NSString copy](v9, "copy");
    accountNumber = v11->_accountNumber;
    v11->_accountNumber = (NSString *)v14;

    v16 = -[INSpeakableString copy](v10, "copy");
    v17 = v11->_organizationName;
    v11->_organizationName = (INSpeakableString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[INSpeakableString hash](self->_nickname, "hash");
  v4 = -[NSString hash](self->_accountNumber, "hash") ^ v3;
  return v4 ^ -[INSpeakableString hash](self->_organizationName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INBillPayee *v4;
  INBillPayee *v5;
  INSpeakableString *nickname;
  NSString *accountNumber;
  INSpeakableString *organizationName;
  BOOL v9;

  v4 = (INBillPayee *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      nickname = self->_nickname;
      v9 = 0;
      if (nickname == v5->_nickname || -[INSpeakableString isEqual:](nickname, "isEqual:"))
      {
        accountNumber = self->_accountNumber;
        if (accountNumber == v5->_accountNumber || -[NSString isEqual:](accountNumber, "isEqual:"))
        {
          organizationName = self->_organizationName;
          if (organizationName == v5->_organizationName || -[INSpeakableString isEqual:](organizationName, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INBillPayee)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  INBillPayee *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickname"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("accountNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[INBillPayee initWithNickname:number:organizationName:](self, "initWithNickname:number:organizationName:", v5, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *nickname;
  id v5;

  nickname = self->_nickname;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nickname, CFSTR("nickname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_nickname);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("nickname"));

  objc_msgSend(v6, "encodeObject:", self->_accountNumber);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("accountNumber"));

  objc_msgSend(v6, "encodeObject:", self->_organizationName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("organizationName"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INBillPayee descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INBillPayee;
  -[INBillPayee description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBillPayee _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INSpeakableString *nickname;
  void *v4;
  NSString *accountNumber;
  void *v6;
  INSpeakableString *organizationName;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("nickname");
  nickname = self->_nickname;
  v4 = nickname;
  if (!nickname)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("accountNumber");
  accountNumber = self->_accountNumber;
  v6 = accountNumber;
  if (!accountNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("organizationName");
  organizationName = self->_organizationName;
  v8 = organizationName;
  if (!organizationName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (organizationName)
  {
    if (accountNumber)
      goto LABEL_9;
LABEL_12:

    if (nickname)
      return v9;
LABEL_13:

    return v9;
  }

  if (!accountNumber)
    goto LABEL_12;
LABEL_9:
  if (!nickname)
    goto LABEL_13;
  return v9;
}

- (INSpeakableString)nickname
{
  return self->_nickname;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (INSpeakableString)organizationName
{
  return self->_organizationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("nickname"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("accountNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("organizationName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNickname:number:organizationName:", v11, v12, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
