@implementation AWDSymptomsSignificantOperationalEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)name
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_name;
  else
    return 1;
}

- (void)setName:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_name = a3;
}

- (void)setHasName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasName
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)nameAsString:(int)a3
{
  if ((a3 - 1) < 0xB)
    return off_1EA3B4BD8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DatabaseIntegrityCheckFailed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DestroyPersistentStoreFailed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DatabaseFileDeletionFailed")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InvalidMetadataForPersistentStore")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InsufficientDiskStorageAvailable")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QueryReturnedInconsistentContent")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationTokenUnavailable")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIPSRulesSuspectInDatabase")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIPSRulesFailedToLoad")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIPSRulesFailedDuringRun")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLIPSRulesLoopDetected")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasAlternateName
{
  return self->_alternateName != 0;
}

- (int)error
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_error;
  else
    return 1;
}

- (void)setError:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)errorAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return off_1EA3B4C30[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsError:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Uninitialized")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExpectedFailure")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnexpectedFailure")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MissingValue")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmptyValue")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TimedOut")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("InsufficientPermission")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_status;
  else
    return 1;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1EA3B4C68[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fail")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Undetermined")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDSymptomsSignificantOperationalEvent;
  -[AWDSymptomsSignificantOperationalEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDSymptomsSignificantOperationalEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  NSString *alternateName;
  unsigned int v9;
  __CFString *v10;
  NSString *errorDomain;
  char v12;
  void *v13;
  unsigned int v14;
  __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v6 = self->_name - 1;
    if (v6 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_name);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1EA3B4BD8[v6];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("name"));

  }
  alternateName = self->_alternateName;
  if (alternateName)
    objc_msgSend(v3, "setObject:forKey:", alternateName, CFSTR("alternateName"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v9 = self->_error - 1;
    if (v9 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_error);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1EA3B4C30[v9];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("error"));

  }
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  v12 = (char)self->_has;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_errorCode);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("errorCode"));

    v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    v14 = self->_status - 1;
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_status);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1EA3B4C68[v14];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("status"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSymptomsSignificantOperationalEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_alternateName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 0x10) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_name;
    *((_BYTE *)v4 + 56) |= 8u;
  }
  v7 = v4;
  if (self->_alternateName)
  {
    objc_msgSend(v4, "setAlternateName:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_error;
    *((_BYTE *)v4 + 56) |= 4u;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v7, "setErrorDomain:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[1] = self->_errorCode;
    *((_BYTE *)v4 + 56) |= 1u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_status;
    *((_BYTE *)v4 + 56) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_name;
    *(_BYTE *)(v5 + 56) |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_alternateName, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_error;
    *(_BYTE *)(v6 + 56) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v10;

  v12 = (char)self->_has;
  if ((v12 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_errorCode;
    *(_BYTE *)(v6 + 56) |= 1u;
    v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_status;
    *(_BYTE *)(v6 + 56) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *alternateName;
  NSString *errorDomain;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_name != *((_DWORD *)v4 + 12))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_32;
  }
  alternateName = self->_alternateName;
  if ((unint64_t)alternateName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](alternateName, "isEqual:"))
      goto LABEL_32;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_error != *((_DWORD *)v4 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_32;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 5))
  {
    if (-[NSString isEqual:](errorDomain, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_32:
    v8 = 0;
    goto LABEL_33;
  }
LABEL_23:
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_32;
  }
  v8 = (*((_BYTE *)v4 + 56) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_status != *((_DWORD *)v4 + 13))
      goto LABEL_32;
    v8 = 1;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_name;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_alternateName, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_error;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_13:
    v9 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_11:
  v9 = 2654435761 * self->_status;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 8) != 0)
  {
    self->_name = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[AWDSymptomsSignificantOperationalEvent setAlternateName:](self, "setAlternateName:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    self->_error = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[AWDSymptomsSignificantOperationalEvent setErrorDomain:](self, "setErrorDomain:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 1) != 0)
  {
    self->_errorCode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 56);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_status = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 0x10u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_alternateName, a3);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
}

@end
