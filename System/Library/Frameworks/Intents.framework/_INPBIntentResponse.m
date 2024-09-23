@implementation _INPBIntentResponse

- (void)setPayloadFailure:(id)a3
{
  objc_storeStrong((id *)&self->_payloadFailure, a3);
}

- (BOOL)hasPayloadFailure
{
  return self->_payloadFailure != 0;
}

- (void)setPayloadSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_payloadSuccess, a3);
}

- (BOOL)hasPayloadSuccess
{
  return self->_payloadSuccess != 0;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requiresAuthentication = a3;
}

- (BOOL)hasRequiresAuthentication
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequiresAuthentication:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setRequiresProtectedData:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requiresProtectedData = a3;
}

- (BOOL)hasRequiresProtectedData
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequiresProtectedData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E228C900[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_PROGRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNSPECIFIED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTINUE_IN_APP")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTHENTICATION_REQUIRED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("USER_CONFIRMATION_REQUIRED")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (BOOL)hasUserActivity
{
  return self->_userActivity != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentResponseReadFrom(self, (uint64_t)a3);
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
  -[_INPBIntentResponse payloadFailure](self, "payloadFailure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBIntentResponse payloadFailure](self, "payloadFailure");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntentResponse payloadSuccess](self, "payloadSuccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBIntentResponse payloadSuccess](self, "payloadSuccess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBIntentResponse hasRequiresAuthentication](self, "hasRequiresAuthentication"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBIntentResponse hasRequiresProtectedData](self, "hasRequiresProtectedData"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBIntentResponse hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();
  -[_INPBIntentResponse userActivity](self, "userActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[_INPBIntentResponse userActivity](self, "userActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (_INPBIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentResponse *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBIntentResponse init](+[_INPBIntentResponse allocWithZone:](_INPBIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBIntentResponsePayloadFailure copyWithZone:](self->_payloadFailure, "copyWithZone:", a3);
  -[_INPBIntentResponse setPayloadFailure:](v5, "setPayloadFailure:", v6);

  v7 = -[_INPBIntentResponsePayloadSuccess copyWithZone:](self->_payloadSuccess, "copyWithZone:", a3);
  -[_INPBIntentResponse setPayloadSuccess:](v5, "setPayloadSuccess:", v7);

  if (-[_INPBIntentResponse hasRequiresAuthentication](self, "hasRequiresAuthentication"))
    -[_INPBIntentResponse setRequiresAuthentication:](v5, "setRequiresAuthentication:", -[_INPBIntentResponse requiresAuthentication](self, "requiresAuthentication"));
  if (-[_INPBIntentResponse hasRequiresProtectedData](self, "hasRequiresProtectedData"))
    -[_INPBIntentResponse setRequiresProtectedData:](v5, "setRequiresProtectedData:", -[_INPBIntentResponse requiresProtectedData](self, "requiresProtectedData"));
  if (-[_INPBIntentResponse hasType](self, "hasType"))
    -[_INPBIntentResponse setType:](v5, "setType:", -[_INPBIntentResponse type](self, "type"));
  v8 = -[_INPBUserActivity copyWithZone:](self->_userActivity, "copyWithZone:", a3);
  -[_INPBIntentResponse setUserActivity:](v5, "setUserActivity:", v8);

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
  int requiresAuthentication;
  int v19;
  int requiresProtectedData;
  int v21;
  int type;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[_INPBIntentResponse payloadFailure](self, "payloadFailure");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadFailure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_INPBIntentResponse payloadFailure](self, "payloadFailure");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentResponse payloadFailure](self, "payloadFailure");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadFailure");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  else
  {

  }
  -[_INPBIntentResponse payloadSuccess](self, "payloadSuccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadSuccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_INPBIntentResponse payloadSuccess](self, "payloadSuccess");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentResponse payloadSuccess](self, "payloadSuccess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadSuccess");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_29;
  }
  else
  {

  }
  v17 = -[_INPBIntentResponse hasRequiresAuthentication](self, "hasRequiresAuthentication");
  if (v17 != objc_msgSend(v4, "hasRequiresAuthentication"))
    goto LABEL_29;
  if (-[_INPBIntentResponse hasRequiresAuthentication](self, "hasRequiresAuthentication"))
  {
    if (objc_msgSend(v4, "hasRequiresAuthentication"))
    {
      requiresAuthentication = self->_requiresAuthentication;
      if (requiresAuthentication != objc_msgSend(v4, "requiresAuthentication"))
        goto LABEL_29;
    }
  }
  v19 = -[_INPBIntentResponse hasRequiresProtectedData](self, "hasRequiresProtectedData");
  if (v19 != objc_msgSend(v4, "hasRequiresProtectedData"))
    goto LABEL_29;
  if (-[_INPBIntentResponse hasRequiresProtectedData](self, "hasRequiresProtectedData"))
  {
    if (objc_msgSend(v4, "hasRequiresProtectedData"))
    {
      requiresProtectedData = self->_requiresProtectedData;
      if (requiresProtectedData != objc_msgSend(v4, "requiresProtectedData"))
        goto LABEL_29;
    }
  }
  v21 = -[_INPBIntentResponse hasType](self, "hasType");
  if (v21 != objc_msgSend(v4, "hasType"))
    goto LABEL_29;
  if (-[_INPBIntentResponse hasType](self, "hasType"))
  {
    if (objc_msgSend(v4, "hasType"))
    {
      type = self->_type;
      if (type != objc_msgSend(v4, "type"))
        goto LABEL_29;
    }
  }
  -[_INPBIntentResponse userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntentResponse userActivity](self, "userActivity");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_32:
      v28 = 1;
      goto LABEL_30;
    }
    v24 = (void *)v23;
    -[_INPBIntentResponse userActivity](self, "userActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_32;
  }
  else
  {
LABEL_28:

  }
LABEL_29:
  v28 = 0;
LABEL_30:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[_INPBIntentResponsePayloadFailure hash](self->_payloadFailure, "hash");
  v4 = -[_INPBIntentResponsePayloadSuccess hash](self->_payloadSuccess, "hash");
  if (-[_INPBIntentResponse hasRequiresAuthentication](self, "hasRequiresAuthentication"))
    v5 = 2654435761 * self->_requiresAuthentication;
  else
    v5 = 0;
  if (-[_INPBIntentResponse hasRequiresProtectedData](self, "hasRequiresProtectedData"))
    v6 = 2654435761 * self->_requiresProtectedData;
  else
    v6 = 0;
  if (-[_INPBIntentResponse hasType](self, "hasType"))
    v7 = 2654435761 * self->_type;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[_INPBUserActivity hash](self->_userActivity, "hash");
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
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBIntentResponse payloadFailure](self, "payloadFailure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_payloadFailure"));

  -[_INPBIntentResponse payloadSuccess](self, "payloadSuccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_payloadSuccess"));

  if (-[_INPBIntentResponse hasRequiresAuthentication](self, "hasRequiresAuthentication"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentResponse requiresAuthentication](self, "requiresAuthentication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("requiresAuthentication"));

  }
  if (-[_INPBIntentResponse hasRequiresProtectedData](self, "hasRequiresProtectedData"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentResponse requiresProtectedData](self, "requiresProtectedData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("requires_protected_data"));

  }
  if (-[_INPBIntentResponse hasType](self, "hasType"))
  {
    v10 = -[_INPBIntentResponse type](self, "type");
    if (v10 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E228C900[v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("type"));

  }
  -[_INPBIntentResponse userActivity](self, "userActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("userActivity"));

  return v3;
}

- (_INPBIntentResponsePayloadFailure)payloadFailure
{
  return self->_payloadFailure;
}

- (_INPBIntentResponsePayloadSuccess)payloadSuccess
{
  return self->_payloadSuccess;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (BOOL)requiresProtectedData
{
  return self->_requiresProtectedData;
}

- (int)type
{
  return self->_type;
}

- (_INPBUserActivity)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_payloadSuccess, 0);
  objc_storeStrong((id *)&self->_payloadFailure, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
