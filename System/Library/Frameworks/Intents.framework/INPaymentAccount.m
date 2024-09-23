@implementation INPaymentAccount

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[INPaymentAccount nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[INPaymentAccount nickname](self, "nickname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[INPaymentAccount accountNumber](self, "accountNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[INPaymentAccount accountNumber](self, "accountNumber");
    else
      INAccountTypeGetLocalizedName(-[INPaymentAccount accountType](self, "accountType"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (INPaymentAccount)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName balance:(INBalanceAmount *)balance secondaryBalance:(INBalanceAmount *)secondaryBalance
{
  INSpeakableString *v14;
  NSString *v15;
  INSpeakableString *v16;
  INBalanceAmount *v17;
  INBalanceAmount *v18;
  INPaymentAccount *v19;
  uint64_t v20;
  INSpeakableString *v21;
  uint64_t v22;
  NSString *accountNumber;
  uint64_t v24;
  INSpeakableString *v25;
  uint64_t v26;
  INBalanceAmount *v27;
  uint64_t v28;
  INBalanceAmount *v29;
  objc_super v31;

  v14 = nickname;
  v15 = number;
  v16 = organizationName;
  v17 = balance;
  v18 = secondaryBalance;
  v31.receiver = self;
  v31.super_class = (Class)INPaymentAccount;
  v19 = -[INPaymentAccount init](&v31, sel_init);
  if (v19)
  {
    v20 = -[INSpeakableString copy](v14, "copy");
    v21 = v19->_nickname;
    v19->_nickname = (INSpeakableString *)v20;

    v22 = -[NSString copy](v15, "copy");
    accountNumber = v19->_accountNumber;
    v19->_accountNumber = (NSString *)v22;

    v19->_accountType = accountType;
    v24 = -[INSpeakableString copy](v16, "copy");
    v25 = v19->_organizationName;
    v19->_organizationName = (INSpeakableString *)v24;

    v26 = -[INBalanceAmount copy](v17, "copy");
    v27 = v19->_balance;
    v19->_balance = (INBalanceAmount *)v26;

    v28 = -[INBalanceAmount copy](v18, "copy");
    v29 = v19->_secondaryBalance;
    v19->_secondaryBalance = (INBalanceAmount *)v28;

  }
  return v19;
}

- (INPaymentAccount)initWithNickname:(INSpeakableString *)nickname number:(NSString *)number accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName
{
  return -[INPaymentAccount initWithNickname:number:accountType:organizationName:balance:secondaryBalance:](self, "initWithNickname:number:accountType:organizationName:balance:secondaryBalance:", nickname, number, accountType, organizationName, 0, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[INSpeakableString hash](self->_nickname, "hash");
  v4 = -[NSString hash](self->_accountNumber, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_accountType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ -[INSpeakableString hash](self->_organizationName, "hash") ^ v6;
  v8 = -[INBalanceAmount hash](self->_balance, "hash");
  v9 = v7 ^ v8 ^ -[INBalanceAmount hash](self->_secondaryBalance, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INPaymentAccount *v4;
  INPaymentAccount *v5;
  INSpeakableString *nickname;
  NSString *accountNumber;
  INSpeakableString *organizationName;
  INBalanceAmount *balance;
  INBalanceAmount *secondaryBalance;
  BOOL v11;

  v4 = (INPaymentAccount *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      nickname = self->_nickname;
      v11 = 0;
      if (nickname == v5->_nickname || -[INSpeakableString isEqual:](nickname, "isEqual:"))
      {
        accountNumber = self->_accountNumber;
        if ((accountNumber == v5->_accountNumber || -[NSString isEqual:](accountNumber, "isEqual:"))
          && self->_accountType == v5->_accountType)
        {
          organizationName = self->_organizationName;
          if (organizationName == v5->_organizationName || -[INSpeakableString isEqual:](organizationName, "isEqual:"))
          {
            balance = self->_balance;
            if (balance == v5->_balance || -[INBalanceAmount isEqual:](balance, "isEqual:"))
            {
              secondaryBalance = self->_secondaryBalance;
              if (secondaryBalance == v5->_secondaryBalance
                || -[INBalanceAmount isEqual:](secondaryBalance, "isEqual:"))
              {
                v11 = 1;
              }
            }
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (INPaymentAccount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  INPaymentAccount *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickname"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("accountNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryBalance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INPaymentAccount initWithNickname:number:accountType:organizationName:balance:secondaryBalance:](self, "initWithNickname:number:accountType:organizationName:balance:secondaryBalance:", v5, v9, v10, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *nickname;
  id v5;

  nickname = self->_nickname;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nickname, CFSTR("nickname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountType, CFSTR("accountType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryBalance, CFSTR("secondaryBalance"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

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

  v10 = self->_accountType - 1;
  if (v10 > 6)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E228D078[v10];
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("accountType"));

  objc_msgSend(v6, "encodeObject:", self->_organizationName);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("organizationName"));

  objc_msgSend(v6, "encodeObject:", self->_balance);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("balance"));

  objc_msgSend(v6, "encodeObject:", self->_secondaryBalance);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("secondaryBalance"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INPaymentAccount descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPaymentAccount;
  -[INPaymentAccount description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPaymentAccount _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  uint64_t v4;
  NSString *accountNumber;
  uint64_t v6;
  void *v7;
  INSpeakableString *organizationName;
  void *v9;
  INBalanceAmount *balance;
  void *v11;
  INBalanceAmount *secondaryBalance;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("nickname");
  nickname = self->_nickname;
  v4 = (uint64_t)nickname;
  if (!nickname)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v4;
  v19[0] = v4;
  v18[1] = CFSTR("accountNumber");
  accountNumber = self->_accountNumber;
  v6 = (uint64_t)accountNumber;
  if (!accountNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v6;
  v19[1] = v6;
  v18[2] = CFSTR("accountType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_accountType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("organizationName");
  organizationName = self->_organizationName;
  v9 = organizationName;
  if (!organizationName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[3] = v9;
  v18[4] = CFSTR("balance");
  balance = self->_balance;
  v11 = balance;
  if (!balance)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[4] = v11;
  v18[5] = CFSTR("secondaryBalance");
  secondaryBalance = self->_secondaryBalance;
  v13 = secondaryBalance;
  if (!secondaryBalance)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (secondaryBalance)
  {
    if (balance)
      goto LABEL_13;
LABEL_18:

    if (organizationName)
      goto LABEL_14;
    goto LABEL_19;
  }

  if (!balance)
    goto LABEL_18;
LABEL_13:
  if (organizationName)
    goto LABEL_14;
LABEL_19:

LABEL_14:
  if (!accountNumber)
  {

    if (nickname)
      return v14;
LABEL_21:

    return v14;
  }
  if (!nickname)
    goto LABEL_21;
  return v14;
}

- (INSpeakableString)nickname
{
  return self->_nickname;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (INAccountType)accountType
{
  return self->_accountType;
}

- (INSpeakableString)organizationName
{
  return self->_organizationName;
}

- (INBalanceAmount)balance
{
  return self->_balance;
}

- (INBalanceAmount)secondaryBalance
{
  return self->_secondaryBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

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
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("accountType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = INAccountTypeWithString(v13);

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("organizationName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("balance"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("secondaryBalance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNickname:number:accountType:organizationName:balance:secondaryBalance:", v11, v12, v14, v17, v20, v23);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
