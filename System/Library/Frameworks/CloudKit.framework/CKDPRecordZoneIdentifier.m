@implementation CKDPRecordZoneIdentifier

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_ownerIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (CKDPIdentifier)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)setOwnerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ownerIdentifier, a3);
}

- (void)setDatabaseType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_databaseType = a3;
}

- (CKDPIdentifier)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasOwnerIdentifier
{
  return self->_ownerIdentifier != 0;
}

- (int)databaseType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_databaseType;
  else
    return 1;
}

- (void)setHasDatabaseType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDatabaseType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)databaseTypeAsString:(int)a3
{
  uint64_t v3;

  if ((a3 - 1) < 4)
    return *((id *)&off_1E1F62F50 + a3 - 1);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDatabaseType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("privateDB"), v5) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("publicDB"), v7) & 1) != 0)
  {
    v8 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("sharedDB"), v10) & 1) != 0)
  {
    v8 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("orgDB"), v12))
  {
    v8 = 4;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKDPRecordZoneIdentifier;
  -[CKDPRecordZoneIdentifier description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CKDPIdentifier *value;
  void *v10;
  const char *v11;
  CKDPIdentifier *ownerIdentifier;
  void *v13;
  const char *v14;
  int v15;
  void *v16;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value)
  {
    objc_msgSend_dictionaryRepresentation(value, v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, (uint64_t)CFSTR("value"));

  }
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(ownerIdentifier, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, (uint64_t)CFSTR("ownerIdentifier"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = self->_databaseType - 1;
    if (v15 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v7, self->_databaseType);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)*((_QWORD *)&off_1E1F62F50 + v15);
    }
    objc_msgSend_setObject_forKey_(v8, v5, (uint64_t)v16, (uint64_t)CFSTR("databaseType"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordZoneIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDPIdentifier *value;
  CKDPIdentifier *ownerIdentifier;
  id v9;

  v4 = a3;
  value = self->_value;
  v9 = v4;
  if (value)
  {
    objc_msgSend_setValue_(v4, v5, (uint64_t)value, v6);
    v4 = v9;
  }
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier)
  {
    objc_msgSend_setOwnerIdentifier_(v9, v5, (uint64_t)ownerIdentifier, v6);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_databaseType;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_value, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v15;

  v19 = objc_msgSend_copyWithZone_(self->_ownerIdentifier, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 8) = self->_databaseType;
    *(_BYTE *)(v12 + 32) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKDPIdentifier *value;
  uint64_t v11;
  CKDPIdentifier *ownerIdentifier;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_10;
  value = self->_value;
  v11 = v4[3];
  if ((unint64_t)value | v11)
  {
    if (!objc_msgSend_isEqual_(value, v8, v11, v9))
      goto LABEL_10;
  }
  ownerIdentifier = self->_ownerIdentifier;
  v13 = v4[2];
  if ((unint64_t)ownerIdentifier | v13)
  {
    if (!objc_msgSend_isEqual_(ownerIdentifier, v8, v13, v9))
      goto LABEL_10;
  }
  v14 = (v4[4] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) != 0 && self->_databaseType == *((_DWORD *)v4 + 2))
    {
      v14 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend_hash(self->_value, a2, v2, v3);
  v9 = objc_msgSend_hash(self->_ownerIdentifier, v6, v7, v8);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_databaseType;
  else
    v10 = 0;
  return v9 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  CKDPIdentifier *value;
  uint64_t v7;
  CKDPIdentifier *ownerIdentifier;
  uint64_t v9;
  id v10;

  v4 = a3;
  value = self->_value;
  v7 = *((_QWORD *)v4 + 3);
  v10 = v4;
  if (value)
  {
    if (!v7)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(value, (const char *)v4, v7, v5);
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    objc_msgSend_setValue_(self, (const char *)v4, v7, v5);
  }
  v4 = v10;
LABEL_7:
  ownerIdentifier = self->_ownerIdentifier;
  v9 = *((_QWORD *)v4 + 2);
  if (ownerIdentifier)
  {
    if (!v9)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(ownerIdentifier, (const char *)v4, v9, v5);
  }
  else
  {
    if (!v9)
      goto LABEL_13;
    objc_msgSend_setOwnerIdentifier_(self, (const char *)v4, v9, v5);
  }
  v4 = v10;
LABEL_13:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_databaseType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

@end
