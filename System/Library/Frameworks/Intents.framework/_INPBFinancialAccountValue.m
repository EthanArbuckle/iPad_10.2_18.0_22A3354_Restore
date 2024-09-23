@implementation _INPBFinancialAccountValue

- (void)setAccountNickname:(id)a3
{
  objc_storeStrong((id *)&self->_accountNickname, a3);
}

- (BOOL)hasAccountNickname
{
  return self->_accountNickname != 0;
}

- (void)setAccountNumber:(id)a3
{
  NSString *v4;
  NSString *accountNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  accountNumber = self->_accountNumber;
  self->_accountNumber = v4;

}

- (BOOL)hasAccountNumber
{
  return self->_accountNumber != 0;
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
    return off_1E228F9D8[a3 - 1];
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

- (void)setBalance:(id)a3
{
  objc_storeStrong((id *)&self->_balance, a3);
}

- (BOOL)hasBalance
{
  return self->_balance != 0;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setSecondaryBalance:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryBalance, a3);
}

- (BOOL)hasSecondaryBalance
{
  return self->_secondaryBalance != 0;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFinancialAccountValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_INPBFinancialAccountValue accountNickname](self, "accountNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBFinancialAccountValue accountNickname](self, "accountNickname");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFinancialAccountValue accountNumber](self, "accountNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  if (-[_INPBFinancialAccountValue hasAccountType](self, "hasAccountType"))
    PBDataWriterWriteInt32Field();
  -[_INPBFinancialAccountValue balance](self, "balance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBFinancialAccountValue balance](self, "balance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFinancialAccountValue organizationName](self, "organizationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBFinancialAccountValue organizationName](self, "organizationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFinancialAccountValue secondaryBalance](self, "secondaryBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBFinancialAccountValue secondaryBalance](self, "secondaryBalance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBFinancialAccountValue valueMetadata](self, "valueMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v13)
  {
    -[_INPBFinancialAccountValue valueMetadata](self, "valueMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v14 = v16;
  }

}

- (_INPBFinancialAccountValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFinancialAccountValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFinancialAccountValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFinancialAccountValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFinancialAccountValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBFinancialAccountValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFinancialAccountValue *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = -[_INPBFinancialAccountValue init](+[_INPBFinancialAccountValue allocWithZone:](_INPBFinancialAccountValue, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_accountNickname, "copyWithZone:", a3);
  -[_INPBFinancialAccountValue setAccountNickname:](v5, "setAccountNickname:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_accountNumber, "copyWithZone:", a3);
  -[_INPBFinancialAccountValue setAccountNumber:](v5, "setAccountNumber:", v7);

  if (-[_INPBFinancialAccountValue hasAccountType](self, "hasAccountType"))
    -[_INPBFinancialAccountValue setAccountType:](v5, "setAccountType:", -[_INPBFinancialAccountValue accountType](self, "accountType"));
  v8 = -[_INPBBalanceAmountValue copyWithZone:](self->_balance, "copyWithZone:", a3);
  -[_INPBFinancialAccountValue setBalance:](v5, "setBalance:", v8);

  v9 = -[_INPBDataString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  -[_INPBFinancialAccountValue setOrganizationName:](v5, "setOrganizationName:", v9);

  v10 = -[_INPBBalanceAmountValue copyWithZone:](self->_secondaryBalance, "copyWithZone:", a3);
  -[_INPBFinancialAccountValue setSecondaryBalance:](v5, "setSecondaryBalance:", v10);

  v11 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBFinancialAccountValue setValueMetadata:](v5, "setValueMetadata:", v11);

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int accountType;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[_INPBFinancialAccountValue accountNickname](self, "accountNickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountNickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBFinancialAccountValue accountNickname](self, "accountNickname");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBFinancialAccountValue accountNickname](self, "accountNickname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountNickname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBFinancialAccountValue accountNumber](self, "accountNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBFinancialAccountValue accountNumber](self, "accountNumber");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBFinancialAccountValue accountNumber](self, "accountNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_36;
  }
  else
  {

  }
  v17 = -[_INPBFinancialAccountValue hasAccountType](self, "hasAccountType");
  if (v17 != objc_msgSend(v4, "hasAccountType"))
    goto LABEL_36;
  if (-[_INPBFinancialAccountValue hasAccountType](self, "hasAccountType"))
  {
    if (objc_msgSend(v4, "hasAccountType"))
    {
      accountType = self->_accountType;
      if (accountType != objc_msgSend(v4, "accountType"))
        goto LABEL_36;
    }
  }
  -[_INPBFinancialAccountValue balance](self, "balance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBFinancialAccountValue balance](self, "balance");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBFinancialAccountValue balance](self, "balance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "balance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBFinancialAccountValue organizationName](self, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBFinancialAccountValue organizationName](self, "organizationName");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBFinancialAccountValue organizationName](self, "organizationName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBFinancialAccountValue secondaryBalance](self, "secondaryBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_35;
  -[_INPBFinancialAccountValue secondaryBalance](self, "secondaryBalance");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBFinancialAccountValue secondaryBalance](self, "secondaryBalance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryBalance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_36;
  }
  else
  {

  }
  -[_INPBFinancialAccountValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBFinancialAccountValue valueMetadata](self, "valueMetadata");
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {

LABEL_39:
      v39 = 1;
      goto LABEL_37;
    }
    v35 = (void *)v34;
    -[_INPBFinancialAccountValue valueMetadata](self, "valueMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if ((v38 & 1) != 0)
      goto LABEL_39;
  }
  else
  {
LABEL_35:

  }
LABEL_36:
  v39 = 0;
LABEL_37:

  return v39;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[_INPBDataString hash](self->_accountNickname, "hash");
  v4 = -[NSString hash](self->_accountNumber, "hash");
  if (-[_INPBFinancialAccountValue hasAccountType](self, "hasAccountType"))
    v5 = 2654435761 * self->_accountType;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[_INPBBalanceAmountValue hash](self->_balance, "hash");
  v7 = -[_INPBDataString hash](self->_organizationName, "hash");
  v8 = v7 ^ -[_INPBBalanceAmountValue hash](self->_secondaryBalance, "hash");
  return v6 ^ v8 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBFinancialAccountValue accountNickname](self, "accountNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountNickname"));

  if (self->_accountNumber)
  {
    -[_INPBFinancialAccountValue accountNumber](self, "accountNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("accountNumber"));

  }
  if (-[_INPBFinancialAccountValue hasAccountType](self, "hasAccountType"))
  {
    v8 = -[_INPBFinancialAccountValue accountType](self, "accountType");
    if ((v8 - 1) >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228F9D8[(v8 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accountType"));

  }
  -[_INPBFinancialAccountValue balance](self, "balance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("balance"));

  -[_INPBFinancialAccountValue organizationName](self, "organizationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("organizationName"));

  -[_INPBFinancialAccountValue secondaryBalance](self, "secondaryBalance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("secondaryBalance"));

  -[_INPBFinancialAccountValue valueMetadata](self, "valueMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("valueMetadata"));

  return v3;
}

- (_INPBDataString)accountNickname
{
  return self->_accountNickname;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (int)accountType
{
  return self->_accountType;
}

- (_INPBBalanceAmountValue)balance
{
  return self->_balance;
}

- (_INPBDataString)organizationName
{
  return self->_organizationName;
}

- (_INPBBalanceAmountValue)secondaryBalance
{
  return self->_secondaryBalance;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_secondaryBalance, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_accountNickname, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
