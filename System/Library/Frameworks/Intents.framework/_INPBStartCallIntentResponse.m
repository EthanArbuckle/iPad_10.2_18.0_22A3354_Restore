@implementation _INPBStartCallIntentResponse

- (void)setConfirmationReason:(int)a3
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
    self->_confirmationReason = a3;
  }
}

- (BOOL)hasConfirmationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfirmationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)confirmationReasonAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return *(&off_1E2293AE8 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConfirmationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALLS_ON_HOMEPOD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REDIAL_EMERGENCY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALL_BACK_EMERGENCY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_RESTRICTED_CONTACTS")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setRestrictedContacts:(id)a3
{
  NSArray *v4;
  NSArray *restrictedContacts;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  restrictedContacts = self->_restrictedContacts;
  self->_restrictedContacts = v4;

}

- (void)clearRestrictedContacts
{
  -[NSArray removeAllObjects](self->_restrictedContacts, "removeAllObjects");
}

- (void)addRestrictedContacts:(id)a3
{
  id v4;
  NSArray *restrictedContacts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  restrictedContacts = self->_restrictedContacts;
  v8 = v4;
  if (!restrictedContacts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_restrictedContacts;
    self->_restrictedContacts = v6;

    v4 = v8;
    restrictedContacts = self->_restrictedContacts;
  }
  -[NSArray addObject:](restrictedContacts, "addObject:", v4);

}

- (unint64_t)restrictedContactsCount
{
  return -[NSArray count](self->_restrictedContacts, "count");
}

- (id)restrictedContactsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_restrictedContacts, "objectAtIndexedSubscript:", a3);
}

- (void)setShouldDoEmergencyCountdown:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldDoEmergencyCountdown = a3;
}

- (BOOL)hasShouldDoEmergencyCountdown
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasShouldDoEmergencyCountdown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setStartedCall:(id)a3
{
  objc_storeStrong((id *)&self->_startedCall, a3);
}

- (BOOL)hasStartedCall
{
  return self->_startedCall != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartCallIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBStartCallIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_restrictedContacts;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (-[_INPBStartCallIntentResponse hasShouldDoEmergencyCountdown](self, "hasShouldDoEmergencyCountdown", v12))
    PBDataWriterWriteBOOLField();
  -[_INPBStartCallIntentResponse startedCall](self, "startedCall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBStartCallIntentResponse startedCall](self, "startedCall");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBStartCallIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartCallIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartCallIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartCallIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartCallIntentResponse *v5;
  void *v6;
  id v7;

  v5 = -[_INPBStartCallIntentResponse init](+[_INPBStartCallIntentResponse allocWithZone:](_INPBStartCallIntentResponse, "allocWithZone:"), "init");
  if (-[_INPBStartCallIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    -[_INPBStartCallIntentResponse setConfirmationReason:](v5, "setConfirmationReason:", -[_INPBStartCallIntentResponse confirmationReason](self, "confirmationReason"));
  v6 = (void *)-[NSArray copyWithZone:](self->_restrictedContacts, "copyWithZone:", a3);
  -[_INPBStartCallIntentResponse setRestrictedContacts:](v5, "setRestrictedContacts:", v6);

  if (-[_INPBStartCallIntentResponse hasShouldDoEmergencyCountdown](self, "hasShouldDoEmergencyCountdown"))
    -[_INPBStartCallIntentResponse setShouldDoEmergencyCountdown:](v5, "setShouldDoEmergencyCountdown:", -[_INPBStartCallIntentResponse shouldDoEmergencyCountdown](self, "shouldDoEmergencyCountdown"));
  v7 = -[_INPBConnectedCall copyWithZone:](self->_startedCall, "copyWithZone:", a3);
  -[_INPBStartCallIntentResponse setStartedCall:](v5, "setStartedCall:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int confirmationReason;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int shouldDoEmergencyCountdown;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  v5 = -[_INPBStartCallIntentResponse hasConfirmationReason](self, "hasConfirmationReason");
  if (v5 != objc_msgSend(v4, "hasConfirmationReason"))
    goto LABEL_20;
  if (-[_INPBStartCallIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
  {
    if (objc_msgSend(v4, "hasConfirmationReason"))
    {
      confirmationReason = self->_confirmationReason;
      if (confirmationReason != objc_msgSend(v4, "confirmationReason"))
        goto LABEL_20;
    }
  }
  -[_INPBStartCallIntentResponse restrictedContacts](self, "restrictedContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restrictedContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_19;
  -[_INPBStartCallIntentResponse restrictedContacts](self, "restrictedContacts");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBStartCallIntentResponse restrictedContacts](self, "restrictedContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restrictedContacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_20;
  }
  else
  {

  }
  v14 = -[_INPBStartCallIntentResponse hasShouldDoEmergencyCountdown](self, "hasShouldDoEmergencyCountdown");
  if (v14 != objc_msgSend(v4, "hasShouldDoEmergencyCountdown"))
    goto LABEL_20;
  if (-[_INPBStartCallIntentResponse hasShouldDoEmergencyCountdown](self, "hasShouldDoEmergencyCountdown"))
  {
    if (objc_msgSend(v4, "hasShouldDoEmergencyCountdown"))
    {
      shouldDoEmergencyCountdown = self->_shouldDoEmergencyCountdown;
      if (shouldDoEmergencyCountdown != objc_msgSend(v4, "shouldDoEmergencyCountdown"))
        goto LABEL_20;
    }
  }
  -[_INPBStartCallIntentResponse startedCall](self, "startedCall");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedCall");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBStartCallIntentResponse startedCall](self, "startedCall");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {

LABEL_23:
      v21 = 1;
      goto LABEL_21;
    }
    v17 = (void *)v16;
    -[_INPBStartCallIntentResponse startedCall](self, "startedCall");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedCall");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v21 = 0;
LABEL_21:

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (-[_INPBStartCallIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    v3 = 2654435761 * self->_confirmationReason;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_restrictedContacts, "hash");
  if (-[_INPBStartCallIntentResponse hasShouldDoEmergencyCountdown](self, "hasShouldDoEmergencyCountdown"))
    v5 = 2654435761 * self->_shouldDoEmergencyCountdown;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_INPBConnectedCall hash](self->_startedCall, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBStartCallIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
  {
    v4 = -[_INPBStartCallIntentResponse confirmationReason](self, "confirmationReason");
    if ((v4 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E2293AE8 + (v4 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confirmationReason"));

  }
  if (-[NSArray count](self->_restrictedContacts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_restrictedContacts;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("restrictedContacts"));
  }
  if (-[_INPBStartCallIntentResponse hasShouldDoEmergencyCountdown](self, "hasShouldDoEmergencyCountdown"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBStartCallIntentResponse shouldDoEmergencyCountdown](self, "shouldDoEmergencyCountdown"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("shouldDoEmergencyCountdown"));

  }
  -[_INPBStartCallIntentResponse startedCall](self, "startedCall");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("startedCall"));

  return v3;
}

- (int)confirmationReason
{
  return self->_confirmationReason;
}

- (NSArray)restrictedContacts
{
  return self->_restrictedContacts;
}

- (BOOL)shouldDoEmergencyCountdown
{
  return self->_shouldDoEmergencyCountdown;
}

- (_INPBConnectedCall)startedCall
{
  return self->_startedCall;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startedCall, 0);
  objc_storeStrong((id *)&self->_restrictedContacts, 0);
}

+ (Class)restrictedContactsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
