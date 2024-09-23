@implementation CKDPNotificationSyncRequest

+ (id)options
{
  if (qword_1ED7009A0 != -1)
    dispatch_once(&qword_1ED7009A0, &unk_1E7833700);
  return (id)qword_1ED700998;
}

- (BOOL)hasServerChangeToken
{
  return self->_serverChangeToken != 0;
}

- (void)setMaxChanges:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxChanges = a3;
}

- (void)setHasMaxChanges:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxChanges
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWantsChanges:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wantsChanges = a3;
}

- (void)setHasWantsChanges:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWantsChanges
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPNotificationSyncRequest;
  -[CKDPNotificationSyncRequest description](&v11, sel_description);
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
  void *v4;
  const char *v5;
  void *v6;
  NSData *serverChangeToken;
  char has;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  serverChangeToken = self->_serverChangeToken;
  if (serverChangeToken)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serverChangeToken, CFSTR("serverChangeToken"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, self->_maxChanges);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("maxChanges"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_wantsChanges);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("wantsChanges"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB055D8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_serverChangeToken)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (unsigned)requestTypeCode
{
  return 65;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *serverChangeToken;
  char has;
  id v8;

  v4 = a3;
  serverChangeToken = self->_serverChangeToken;
  if (serverChangeToken)
  {
    v8 = v4;
    objc_msgSend_setServerChangeToken_(v4, v5, (uint64_t)serverChangeToken);
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_maxChanges;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 24) = self->_wantsChanges;
    *((_BYTE *)v4 + 28) |= 2u;
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
  uint64_t v12;
  void *v13;
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_serverChangeToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 8) = self->_maxChanges;
    *(_BYTE *)(v10 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 24) = self->_wantsChanges;
    *(_BYTE *)(v10 + 28) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *serverChangeToken;
  uint64_t v9;
  BOOL v10;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  serverChangeToken = self->_serverChangeToken;
  v9 = v4[2];
  if ((unint64_t)serverChangeToken | v9)
  {
    if (!objc_msgSend_isEqual_(serverChangeToken, v7, v9))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_maxChanges != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_11;
  }
  v10 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
    {
LABEL_11:
      v10 = 0;
      goto LABEL_12;
    }
    if (self->_wantsChanges)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_11;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_11;
    }
    v10 = 1;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_serverChangeToken, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_maxChanges;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v5 ^ v4 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_wantsChanges;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 2);
  if (v6)
  {
    v8 = v4;
    objc_msgSend_setServerChangeToken_(self, v5, v6);
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 1) != 0)
  {
    self->_maxChanges = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_wantsChanges = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeToken, a3);
}

- (unsigned)maxChanges
{
  return self->_maxChanges;
}

- (BOOL)wantsChanges
{
  return self->_wantsChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
}

@end
