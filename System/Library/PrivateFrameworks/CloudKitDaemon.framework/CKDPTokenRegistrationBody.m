@implementation CKDPTokenRegistrationBody

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (int)apnsEnv
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_apnsEnv;
  else
    return 0;
}

- (void)setApnsEnv:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_apnsEnv = a3;
}

- (void)setHasApnsEnv:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApnsEnv
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)apnsEnvAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("production");
  if (a3 == 1)
  {
    v3 = CFSTR("development");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsApnsEnv:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("production")) & 1) != 0)
    isEqualToString = 0;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("development"));

  return isEqualToString;
}

- (void)setSkipBundleIDCheck:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_skipBundleIDCheck = a3;
}

- (void)setHasSkipBundleIDCheck:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSkipBundleIDCheck
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
  v11.super_class = (Class)CKDPTokenRegistrationBody;
  -[CKDPTokenRegistrationBody description](&v11, sel_description);
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
  NSData *token;
  NSString *bundleIdentifier;
  char has;
  int apnsEnv;
  __CFString *v11;
  const char *v12;
  void *v13;
  const char *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  token = self->_token;
  if (token)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)token, CFSTR("token"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)bundleIdentifier, CFSTR("bundleIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    apnsEnv = self->_apnsEnv;
    if (apnsEnv)
    {
      if (apnsEnv == 1)
      {
        v11 = CFSTR("development");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("development"), CFSTR("apnsEnv"));
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_apnsEnv);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("apnsEnv"));
      }
    }
    else
    {
      v11 = CFSTR("production");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("production"), CFSTR("apnsEnv"));
    }

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_skipBundleIDCheck);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("skipBundleIDCheck"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAFFBE8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_token)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *token;
  NSString *bundleIdentifier;
  char has;
  id v9;

  v4 = a3;
  token = self->_token;
  v9 = v4;
  if (token)
  {
    objc_msgSend_setToken_(v4, v5, (uint64_t)token);
    v4 = v9;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    objc_msgSend_setBundleIdentifier_(v9, v5, (uint64_t)bundleIdentifier);
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_apnsEnv;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_skipBundleIDCheck;
    *((_BYTE *)v4 + 36) |= 2u;
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
  const char *v14;
  uint64_t v15;
  void *v16;
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_token, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_bundleIdentifier, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 8) = self->_apnsEnv;
    *(_BYTE *)(v10 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 32) = self->_skipBundleIDCheck;
    *(_BYTE *)(v10 + 36) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *token;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  token = self->_token;
  v9 = v4[3];
  if ((unint64_t)token | v9)
  {
    if (!objc_msgSend_isEqual_(token, v7, v9))
      goto LABEL_13;
  }
  bundleIdentifier = self->_bundleIdentifier;
  v11 = v4[2];
  if ((unint64_t)bundleIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(bundleIdentifier, v7, v11))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_apnsEnv != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_13;
  }
  v12 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
    {
LABEL_13:
      v12 = 0;
      goto LABEL_14;
    }
    if (self->_skipBundleIDCheck)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_13;
    }
    v12 = 1;
  }
LABEL_14:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend_hash(self->_token, a2, v2);
  v7 = objc_msgSend_hash(self->_bundleIdentifier, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_apnsEnv;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v7 ^ v4 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_skipBundleIDCheck;
  return v7 ^ v4 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (v6)
  {
    objc_msgSend_setToken_(self, v5, v6);
    v4 = v9;
  }
  v7 = *((_QWORD *)v4 + 2);
  if (v7)
  {
    objc_msgSend_setBundleIdentifier_(self, v5, v7);
    v4 = v9;
  }
  v8 = *((_BYTE *)v4 + 36);
  if ((v8 & 1) != 0)
  {
    self->_apnsEnv = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v8 = *((_BYTE *)v4 + 36);
  }
  if ((v8 & 2) != 0)
  {
    self->_skipBundleIDCheck = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (BOOL)skipBundleIDCheck
{
  return self->_skipBundleIDCheck;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
