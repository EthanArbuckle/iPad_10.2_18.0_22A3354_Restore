@implementation _INPBSearchForAccountsIntent

- (void)setAccountNickname:(id)a3
{
  objc_storeStrong((id *)&self->_accountNickname, a3);
}

- (BOOL)hasAccountNickname
{
  return self->_accountNickname != 0;
}

- (void)setAccountType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_accountType = a3;
  }
}

- (BOOL)hasAccountType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAccountType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)accountTypeAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_1E228C510[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAccountType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHECKING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREDIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEBIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVESTMENT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORTGAGE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREPAID")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SAVING")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setRequestedBalanceType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_requestedBalanceType = a3;
  }
}

- (BOOL)hasRequestedBalanceType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestedBalanceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)requestedBalanceTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228C548[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestedBalanceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONEY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POINTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MILES")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForAccountsIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBSearchForAccountsIntent accountNickname](self, "accountNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSearchForAccountsIntent accountNickname](self, "accountNickname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForAccountsIntent hasAccountType](self, "hasAccountType"))
    PBDataWriterWriteInt32Field();
  -[_INPBSearchForAccountsIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSearchForAccountsIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForAccountsIntent organizationName](self, "organizationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSearchForAccountsIntent organizationName](self, "organizationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForAccountsIntent hasRequestedBalanceType](self, "hasRequestedBalanceType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSearchForAccountsIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForAccountsIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForAccountsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForAccountsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForAccountsIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSearchForAccountsIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForAccountsIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBSearchForAccountsIntent init](+[_INPBSearchForAccountsIntent allocWithZone:](_INPBSearchForAccountsIntent, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_accountNickname, "copyWithZone:", a3);
  -[_INPBSearchForAccountsIntent setAccountNickname:](v5, "setAccountNickname:", v6);

  if (-[_INPBSearchForAccountsIntent hasAccountType](self, "hasAccountType"))
    -[_INPBSearchForAccountsIntent setAccountType:](v5, "setAccountType:", -[_INPBSearchForAccountsIntent accountType](self, "accountType"));
  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchForAccountsIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBDataString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  -[_INPBSearchForAccountsIntent setOrganizationName:](v5, "setOrganizationName:", v8);

  if (-[_INPBSearchForAccountsIntent hasRequestedBalanceType](self, "hasRequestedBalanceType"))
    -[_INPBSearchForAccountsIntent setRequestedBalanceType:](v5, "setRequestedBalanceType:", -[_INPBSearchForAccountsIntent requestedBalanceType](self, "requestedBalanceType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int accountType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v26;
  int requestedBalanceType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[_INPBSearchForAccountsIntent accountNickname](self, "accountNickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountNickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSearchForAccountsIntent accountNickname](self, "accountNickname");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForAccountsIntent accountNickname](self, "accountNickname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountNickname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  v12 = -[_INPBSearchForAccountsIntent hasAccountType](self, "hasAccountType");
  if (v12 != objc_msgSend(v4, "hasAccountType"))
    goto LABEL_21;
  if (-[_INPBSearchForAccountsIntent hasAccountType](self, "hasAccountType"))
  {
    if (objc_msgSend(v4, "hasAccountType"))
    {
      accountType = self->_accountType;
      if (accountType != objc_msgSend(v4, "accountType"))
        goto LABEL_21;
    }
  }
  -[_INPBSearchForAccountsIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSearchForAccountsIntent intentMetadata](self, "intentMetadata");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSearchForAccountsIntent intentMetadata](self, "intentMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSearchForAccountsIntent organizationName](self, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_20:

    goto LABEL_21;
  }
  -[_INPBSearchForAccountsIntent organizationName](self, "organizationName");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSearchForAccountsIntent organizationName](self, "organizationName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_21;
  }
  else
  {

  }
  v26 = -[_INPBSearchForAccountsIntent hasRequestedBalanceType](self, "hasRequestedBalanceType");
  if (v26 == objc_msgSend(v4, "hasRequestedBalanceType"))
  {
    if (!-[_INPBSearchForAccountsIntent hasRequestedBalanceType](self, "hasRequestedBalanceType")
      || !objc_msgSend(v4, "hasRequestedBalanceType")
      || (requestedBalanceType = self->_requestedBalanceType,
          requestedBalanceType == objc_msgSend(v4, "requestedBalanceType")))
    {
      v24 = 1;
      goto LABEL_22;
    }
  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[_INPBDataString hash](self->_accountNickname, "hash");
  if (-[_INPBSearchForAccountsIntent hasAccountType](self, "hasAccountType"))
    v4 = 2654435761 * self->_accountType;
  else
    v4 = 0;
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v6 = -[_INPBDataString hash](self->_organizationName, "hash");
  if (-[_INPBSearchForAccountsIntent hasRequestedBalanceType](self, "hasRequestedBalanceType"))
    v7 = 2654435761 * self->_requestedBalanceType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSearchForAccountsIntent accountNickname](self, "accountNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountNickname"));

  if (-[_INPBSearchForAccountsIntent hasAccountType](self, "hasAccountType"))
  {
    v6 = -[_INPBSearchForAccountsIntent accountType](self, "accountType");
    if ((v6 - 1) >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228C510[(v6 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accountType"));

  }
  -[_INPBSearchForAccountsIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  -[_INPBSearchForAccountsIntent organizationName](self, "organizationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("organizationName"));

  if (-[_INPBSearchForAccountsIntent hasRequestedBalanceType](self, "hasRequestedBalanceType"))
  {
    v12 = -[_INPBSearchForAccountsIntent requestedBalanceType](self, "requestedBalanceType");
    if ((v12 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E228C548[(v12 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("requestedBalanceType"));

  }
  return v3;
}

- (_INPBDataString)accountNickname
{
  return self->_accountNickname;
}

- (int)accountType
{
  return self->_accountType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)organizationName
{
  return self->_organizationName;
}

- (int)requestedBalanceType
{
  return self->_requestedBalanceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_accountNickname, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
