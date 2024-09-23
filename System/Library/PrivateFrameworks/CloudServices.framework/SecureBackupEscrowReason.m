@implementation SecureBackupEscrowReason

- (int)reason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_reason;
  else
    return 0;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)reasonAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("FEDERATION_MOVE");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsReason:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("UNKNOWN")) & 1) != 0)
    isEqualToString = 0;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("FEDERATION_MOVE"));

  return isEqualToString;
}

- (BOOL)hasExpectedFederationID
{
  return self->_expectedFederationID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)SecureBackupEscrowReason;
  -[SecureBackupEscrowReason description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  void *v5;
  int reason;
  __CFString *v7;
  const char *v8;
  NSString *expectedFederationID;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason)
    {
      if (reason == 1)
      {
        v7 = CFSTR("FEDERATION_MOVE");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("FEDERATION_MOVE"), CFSTR("reason"));
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_reason);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, CFSTR("reason"));
      }
    }
    else
    {
      v7 = CFSTR("UNKNOWN");
      objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("UNKNOWN"), CFSTR("reason"));
    }

  }
  expectedFederationID = self->_expectedFederationID;
  if (expectedFederationID)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)expectedFederationID, CFSTR("expectedFederationID"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return SecureBackupEscrowReasonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_expectedFederationID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  NSString *expectedFederationID;
  _DWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_reason;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  expectedFederationID = self->_expectedFederationID;
  if (expectedFederationID)
  {
    v7 = v4;
    objc_msgSend_setExpectedFederationID_(v4, v5, (uint64_t)expectedFederationID);
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_reason;
    *(_BYTE *)(v10 + 20) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_expectedFederationID, v11, (uint64_t)a3);
  v14 = (void *)v12[1];
  v12[1] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *expectedFederationID;
  uint64_t v9;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    isEqual = 0;
    goto LABEL_10;
  }
  expectedFederationID = self->_expectedFederationID;
  v9 = v4[1];
  if ((unint64_t)expectedFederationID | v9)
    isEqual = objc_msgSend_isEqual_(expectedFederationID, v7, v9);
  else
    isEqual = 1;
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_reason;
  else
    v3 = 0;
  return objc_msgSend_hash(self->_expectedFederationID, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_reason = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = *((_QWORD *)v4 + 1);
  if (v6)
  {
    v7 = v4;
    objc_msgSend_setExpectedFederationID_(self, v5, v6);
    v4 = v7;
  }

}

- (NSString)expectedFederationID
{
  return self->_expectedFederationID;
}

- (void)setExpectedFederationID:(id)a3
{
  objc_storeStrong((id *)&self->_expectedFederationID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedFederationID, 0);
}

@end
