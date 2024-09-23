@implementation CKCDPTrustedTargetCryptoMetadata

- (BOOL)hasEncryptedInvocationKey
{
  return self->_encryptedInvocationKey != 0;
}

- (BOOL)hasProtectionSource
{
  return self->_protectionSource != 0;
}

- (void)setKeyVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_keyVersion = a3;
}

- (void)setHasKeyVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)scheme
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_scheme;
  else
    return 0;
}

- (void)setScheme:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_scheme = a3;
}

- (void)setHasScheme:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScheme
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)schemeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("unspecified");
  if (a3 == 1)
  {
    v3 = CFSTR("cloudMediaProcessing");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsScheme:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("unspecified")) & 1) != 0)
    isEqualToString = 0;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("cloudMediaProcessing"));

  return isEqualToString;
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
  v11.super_class = (Class)CKCDPTrustedTargetCryptoMetadata;
  -[CKCDPTrustedTargetCryptoMetadata description](&v11, sel_description);
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
  NSData *encryptedInvocationKey;
  NSString *protectionSource;
  char has;
  void *v10;
  const char *v11;
  int scheme;
  __CFString *v13;
  const char *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  encryptedInvocationKey = self->_encryptedInvocationKey;
  if (encryptedInvocationKey)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)encryptedInvocationKey, CFSTR("encryptedInvocationKey"));
  protectionSource = self->_protectionSource;
  if (protectionSource)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectionSource, CFSTR("protectionSource"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v5, self->_keyVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("keyVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    scheme = self->_scheme;
    if (scheme)
    {
      if (scheme == 1)
      {
        v13 = CFSTR("cloudMediaProcessing");
        objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("cloudMediaProcessing"), CFSTR("scheme"));
      }
      else
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_scheme);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("scheme"));
      }
    }
    else
    {
      v13 = CFSTR("unspecified");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("unspecified"), CFSTR("scheme"));
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC444E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_encryptedInvocationKey)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_protectionSource)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *encryptedInvocationKey;
  NSString *protectionSource;
  char has;
  id v9;

  v4 = a3;
  encryptedInvocationKey = self->_encryptedInvocationKey;
  v9 = v4;
  if (encryptedInvocationKey)
  {
    objc_msgSend_setEncryptedInvocationKey_(v4, v5, (uint64_t)encryptedInvocationKey);
    v4 = v9;
  }
  protectionSource = self->_protectionSource;
  if (protectionSource)
  {
    objc_msgSend_setProtectionSource_(v9, v5, (uint64_t)protectionSource);
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_keyVersion;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_scheme;
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
  v12 = objc_msgSend_copyWithZone_(self->_encryptedInvocationKey, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_protectionSource, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_keyVersion;
    *(_BYTE *)(v10 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_scheme;
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
  NSData *encryptedInvocationKey;
  uint64_t v9;
  NSString *protectionSource;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_15;
  encryptedInvocationKey = self->_encryptedInvocationKey;
  v9 = v4[2];
  if ((unint64_t)encryptedInvocationKey | v9)
  {
    if (!objc_msgSend_isEqual_(encryptedInvocationKey, v7, v9))
      goto LABEL_15;
  }
  protectionSource = self->_protectionSource;
  v11 = v4[3];
  if ((unint64_t)protectionSource | v11)
  {
    if (!objc_msgSend_isEqual_(protectionSource, v7, v11))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_keyVersion != v4[1])
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v12 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_scheme != *((_DWORD *)v4 + 8))
      goto LABEL_15;
    v12 = 1;
  }
LABEL_16:

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

  v4 = objc_msgSend_hash(self->_encryptedInvocationKey, a2, v2);
  v7 = objc_msgSend_hash(self->_protectionSource, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_keyVersion;
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
  v9 = 2654435761 * self->_scheme;
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
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
  if (v6)
  {
    objc_msgSend_setEncryptedInvocationKey_(self, v5, v6);
    v4 = v9;
  }
  v7 = *((_QWORD *)v4 + 3);
  if (v7)
  {
    objc_msgSend_setProtectionSource_(self, v5, v7);
    v4 = v9;
  }
  v8 = *((_BYTE *)v4 + 36);
  if ((v8 & 1) != 0)
  {
    self->_keyVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v8 = *((_BYTE *)v4 + 36);
  }
  if ((v8 & 2) != 0)
  {
    self->_scheme = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)encryptedInvocationKey
{
  return self->_encryptedInvocationKey;
}

- (void)setEncryptedInvocationKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedInvocationKey, a3);
}

- (NSString)protectionSource
{
  return self->_protectionSource;
}

- (void)setProtectionSource:(id)a3
{
  objc_storeStrong((id *)&self->_protectionSource, a3);
}

- (int64_t)keyVersion
{
  return self->_keyVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionSource, 0);
  objc_storeStrong((id *)&self->_encryptedInvocationKey, 0);
}

@end
