@implementation LIGHTHOUSE_BITACORA_PROTOTaskEvent

- (void)setSucceeded:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_succeeded = a3;
}

- (void)setHasSucceeded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSucceeded
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
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

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOTaskEvent;
  -[LIGHTHOUSE_BITACORA_PROTOTaskEvent description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("%@ %@"), v11, v12, v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSString *errorDomain;
  void *v14;
  const char *v15;
  uint64_t v16;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v6, self->_succeeded, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v9, v11, (uint64_t)v10, (uint64_t)CFSTR("succeeded"), v12);

  }
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend_setObject_forKey_(v9, v6, (uint64_t)errorDomain, (uint64_t)CFSTR("errorDomain"), v8);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v6, self->_errorCode, v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v9, v15, (uint64_t)v14, (uint64_t)CFSTR("errorCode"), v16);

  }
  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOTaskEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *errorDomain;
  _BYTE *v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[24] = self->_succeeded;
    v4[28] |= 2u;
  }
  errorDomain = self->_errorDomain;
  if (errorDomain)
  {
    v9 = v4;
    objc_msgSend_setErrorDomain_(v4, v5, (uint64_t)errorDomain, v6, v7);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_errorCode;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = v14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v14 + 24) = self->_succeeded;
    *(_BYTE *)(v14 + 28) |= 2u;
  }
  v19 = objc_msgSend_copyWithZone_(self->_errorDomain, v15, (uint64_t)a3, v16, v17);
  v20 = *(void **)(v18 + 16);
  *(_QWORD *)(v18 + 16) = v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v18 + 8) = self->_errorCode;
    *(_BYTE *)(v18 + 28) |= 1u;
  }
  return (id)v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char has;
  NSString *errorDomain;
  uint64_t v14;
  BOOL v15;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8))
    goto LABEL_17;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_17;
    if (self->_succeeded)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  errorDomain = self->_errorDomain;
  v14 = v4[2];
  if (!((unint64_t)errorDomain | v14))
    goto LABEL_13;
  if (!objc_msgSend_isEqual_(errorDomain, v9, v14, v10, v11))
  {
LABEL_17:
    v15 = 0;
    goto LABEL_18;
  }
  has = (char)self->_has;
LABEL_13:
  v15 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2))
      goto LABEL_17;
    v15 = 1;
  }
LABEL_18:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_succeeded;
  else
    v6 = 0;
  v7 = objc_msgSend_hash(self->_errorDomain, a2, v2, v3, v4);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_errorCode;
  else
    v8 = 0;
  return v7 ^ v6 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    self->_succeeded = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = *((_QWORD *)v4 + 2);
  if (v8)
  {
    v9 = v4;
    objc_msgSend_setErrorDomain_(self, v5, v8, v6, v7);
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
