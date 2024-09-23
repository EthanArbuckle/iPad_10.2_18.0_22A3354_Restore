@implementation _INPBBillPayeeValue

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

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
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
  return _INPBBillPayeeValueReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  -[_INPBBillPayeeValue accountNumber](self, "accountNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBBillPayeeValue nickname](self, "nickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBBillPayeeValue nickname](self, "nickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBillPayeeValue organizationName](self, "organizationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBBillPayeeValue organizationName](self, "organizationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBBillPayeeValue valueMetadata](self, "valueMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBBillPayeeValue valueMetadata](self, "valueMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBBillPayeeValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBBillPayeeValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBBillPayeeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBBillPayeeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBBillPayeeValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBBillPayeeValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBBillPayeeValue *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBBillPayeeValue init](+[_INPBBillPayeeValue allocWithZone:](_INPBBillPayeeValue, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_accountNumber, "copyWithZone:", a3);
  -[_INPBBillPayeeValue setAccountNumber:](v5, "setAccountNumber:", v6);

  v7 = -[_INPBDataString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  -[_INPBBillPayeeValue setNickname:](v5, "setNickname:", v7);

  v8 = -[_INPBDataString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  -[_INPBBillPayeeValue setOrganizationName:](v5, "setOrganizationName:", v8);

  v9 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBBillPayeeValue setValueMetadata:](v5, "setValueMetadata:", v9);

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBBillPayeeValue accountNumber](self, "accountNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBBillPayeeValue accountNumber](self, "accountNumber");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBBillPayeeValue accountNumber](self, "accountNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBBillPayeeValue nickname](self, "nickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBBillPayeeValue nickname](self, "nickname");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBBillPayeeValue nickname](self, "nickname");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nickname");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBBillPayeeValue organizationName](self, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBBillPayeeValue organizationName](self, "organizationName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBBillPayeeValue organizationName](self, "organizationName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBBillPayeeValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBBillPayeeValue valueMetadata](self, "valueMetadata");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBBillPayeeValue valueMetadata](self, "valueMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_accountNumber, "hash");
  v4 = -[_INPBDataString hash](self->_nickname, "hash") ^ v3;
  v5 = -[_INPBDataString hash](self->_organizationName, "hash");
  return v4 ^ v5 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accountNumber)
  {
    -[_INPBBillPayeeValue accountNumber](self, "accountNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountNumber"));

  }
  -[_INPBBillPayeeValue nickname](self, "nickname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("nickname"));

  -[_INPBBillPayeeValue organizationName](self, "organizationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("organizationName"));

  -[_INPBBillPayeeValue valueMetadata](self, "valueMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("valueMetadata"));

  return v3;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (_INPBDataString)nickname
{
  return self->_nickname;
}

- (_INPBDataString)organizationName
{
  return self->_organizationName;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
