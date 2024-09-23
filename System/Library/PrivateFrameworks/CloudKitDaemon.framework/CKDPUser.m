@implementation CKDPUser

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAlias
{
  return self->_alias != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)isInNetwork
{
  return (*(_BYTE *)&self->_has & 1) != 0 && self->_isInNetwork;
}

- (void)setIsInNetwork:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isInNetwork = a3;
}

- (void)setHasIsInNetwork:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsInNetwork
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKDPUser;
  -[CKDPUser description](&v11, sel_description);
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
  uint64_t v5;
  void *v6;
  CKDPIdentifier *identifier;
  void *v8;
  const char *v9;
  CKDPUserAlias *alias;
  void *v11;
  const char *v12;
  NSString *firstName;
  NSString *lastName;
  CKDPProtectionInfo *protectionInfo;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("identifier"));

  }
  alias = self->_alias;
  if (alias)
  {
    objc_msgSend_dictionaryRepresentation(alias, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("alias"));

  }
  firstName = self->_firstName;
  if (firstName)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)firstName, CFSTR("firstName"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)lastName, CFSTR("lastName"));
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(protectionInfo, v4, (uint64_t)lastName);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("protectionInfo"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isInNetwork);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, CFSTR("isInNetwork"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB367B8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_alias)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_firstName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_lastName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPIdentifier *identifier;
  CKDPUserAlias *alias;
  NSString *firstName;
  NSString *lastName;
  CKDPProtectionInfo *protectionInfo;
  _BYTE *v11;

  v4 = a3;
  identifier = self->_identifier;
  v11 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    v4 = v11;
  }
  alias = self->_alias;
  if (alias)
  {
    objc_msgSend_setAlias_(v11, v5, (uint64_t)alias);
    v4 = v11;
  }
  firstName = self->_firstName;
  if (firstName)
  {
    objc_msgSend_setFirstName_(v11, v5, (uint64_t)firstName);
    v4 = v11;
  }
  lastName = self->_lastName;
  if (lastName)
  {
    objc_msgSend_setLastName_(v11, v5, (uint64_t)lastName);
    v4 = v11;
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v11, v5, (uint64_t)protectionInfo);
    v4 = v11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[48] = self->_isInNetwork;
    v4[52] |= 1u;
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
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_alias, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_firstName, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_lastName, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v21;

  v24 = objc_msgSend_copyWithZone_(self->_protectionInfo, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 48) = self->_isInNetwork;
    *(_BYTE *)(v10 + 52) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPIdentifier *identifier;
  uint64_t v9;
  CKDPUserAlias *alias;
  uint64_t v11;
  NSString *firstName;
  uint64_t v13;
  NSString *lastName;
  uint64_t v15;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v17;
  BOOL v18;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_14;
  identifier = self->_identifier;
  v9 = v4[3];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9))
      goto LABEL_14;
  }
  alias = self->_alias;
  v11 = v4[1];
  if ((unint64_t)alias | v11)
  {
    if (!objc_msgSend_isEqual_(alias, v7, v11))
      goto LABEL_14;
  }
  firstName = self->_firstName;
  v13 = v4[2];
  if ((unint64_t)firstName | v13)
  {
    if (!objc_msgSend_isEqual_(firstName, v7, v13))
      goto LABEL_14;
  }
  lastName = self->_lastName;
  v15 = v4[4];
  if ((unint64_t)lastName | v15)
  {
    if (!objc_msgSend_isEqual_(lastName, v7, v15))
      goto LABEL_14;
  }
  protectionInfo = self->_protectionInfo;
  v17 = v4[5];
  if ((unint64_t)protectionInfo | v17)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v17))
      goto LABEL_14;
  }
  v18 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0)
    {
LABEL_14:
      v18 = 0;
      goto LABEL_15;
    }
    if (self->_isInNetwork)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_14;
    }
    v18 = 1;
  }
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  v7 = objc_msgSend_hash(self->_alias, v5, v6);
  v10 = objc_msgSend_hash(self->_firstName, v8, v9);
  v13 = objc_msgSend_hash(self->_lastName, v11, v12);
  v16 = objc_msgSend_hash(self->_protectionInfo, v14, v15);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v17 = 2654435761 * self->_isInNetwork;
  else
    v17 = 0;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPIdentifier *identifier;
  uint64_t v6;
  CKDPUserAlias *alias;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v12;
  id v13;

  v4 = a3;
  identifier = self->_identifier;
  v6 = *((_QWORD *)v4 + 3);
  v13 = v4;
  if (identifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(identifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v13;
LABEL_7:
  alias = self->_alias;
  v8 = *((_QWORD *)v4 + 1);
  if (alias)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(alias, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setAlias_(self, (const char *)v4, v8);
  }
  v4 = v13;
LABEL_13:
  v9 = *((_QWORD *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setFirstName_(self, (const char *)v4, v9);
    v4 = v13;
  }
  v10 = *((_QWORD *)v4 + 4);
  if (v10)
  {
    objc_msgSend_setLastName_(self, (const char *)v4, v10);
    v4 = v13;
  }
  protectionInfo = self->_protectionInfo;
  v12 = *((_QWORD *)v4 + 5);
  if (protectionInfo)
  {
    if (!v12)
      goto LABEL_23;
    objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v12);
  }
  else
  {
    if (!v12)
      goto LABEL_23;
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v12);
  }
  v4 = v13;
LABEL_23:
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_isInNetwork = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (CKDPIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CKDPUserAlias)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_storeStrong((id *)&self->_alias, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end
