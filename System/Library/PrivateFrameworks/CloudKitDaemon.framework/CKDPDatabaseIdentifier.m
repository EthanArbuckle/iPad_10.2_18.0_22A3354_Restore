@implementation CKDPDatabaseIdentifier

- (id)databaseTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7836780[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDatabaseType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("privateDB")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("publicDB")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("sharedDB")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("orgDB")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasDatabaseOwnerId
{
  return self->_databaseOwnerId != 0;
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
  v11.super_class = (Class)CKDPDatabaseIdentifier;
  -[CKDPDatabaseIdentifier description](&v11, sel_description);
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
  NSString *containerName;
  unsigned int v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  CKDPIdentifier *databaseOwnerId;
  void *v13;
  const char *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  containerName = self->_containerName;
  if (containerName)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)containerName, CFSTR("containerName"));
  v8 = self->_databaseType - 1;
  if (v8 >= 4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_databaseType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E7836780[v8];
  }
  objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v9, CFSTR("databaseType"));

  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    objc_msgSend_dictionaryRepresentation(databaseOwnerId, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("databaseOwnerId"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  NSString *v25;
  NSString *containerName;
  id v27;
  int v28;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      v18 = v11 >> 3;
      if ((v11 >> 3) == 1)
      {
        PBReaderReadString();
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        containerName = self->_containerName;
        self->_containerName = v25;

      }
      else if ((_DWORD)v18 == 3)
      {
        v27 = objc_alloc_init(MEMORY[0x1E0C94C70]);
        objc_storeStrong((id *)&self->_databaseOwnerId, v27);
        if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0)
        {

          LOBYTE(v28) = 0;
          return v28;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v18 == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        while (1)
        {
          v22 = *v4;
          v23 = *(_QWORD *)((char *)a3 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v23);
          *(_QWORD *)((char *)a3 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_35;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_37;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_35:
        if (*((_BYTE *)a3 + *v6))
          LODWORD(v21) = 0;
LABEL_37:
        self->_databaseType = v21;
      }
      else
      {
        v28 = PBReaderSkipValueWithTag();
        if (!v28)
          return v28;
      }
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v28) = *((_BYTE *)a3 + *v6) == 0;
  return v28;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_containerName)
    __assert_rtn("-[CKDPDatabaseIdentifier writeTo:]", "CKDPDatabaseIdentifier.m", 116, "nil != self->_containerName");
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_databaseOwnerId)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  const char *v5;
  void *v6;
  CKDPIdentifier *databaseOwnerId;
  _DWORD *v8;

  v8 = a3;
  objc_msgSend_setContainerName_(v8, v4, (uint64_t)self->_containerName);
  v6 = v8;
  v8[6] = self->_databaseType;
  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    objc_msgSend_setDatabaseOwnerId_(v8, v5, (uint64_t)databaseOwnerId);
    v6 = v8;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_containerName, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  *(_DWORD *)(v10 + 24) = self->_databaseType;
  v15 = objc_msgSend_copyWithZone_(self->_databaseOwnerId, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *containerName;
  uint64_t v9;
  CKDPIdentifier *databaseOwnerId;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((containerName = self->_containerName, v9 = v4[1], !((unint64_t)containerName | v9))
     || objc_msgSend_isEqual_(containerName, v7, v9))
    && self->_databaseType == *((_DWORD *)v4 + 6))
  {
    databaseOwnerId = self->_databaseOwnerId;
    v11 = v4[2];
    if ((unint64_t)databaseOwnerId | v11)
      isEqual = objc_msgSend_isEqual_(databaseOwnerId, v7, v11);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v4 = objc_msgSend_hash(self->_containerName, a2, v2);
  v5 = 2654435761 * self->_databaseType;
  return v5 ^ v4 ^ objc_msgSend_hash(self->_databaseOwnerId, v6, v7);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  CKDPIdentifier *databaseOwnerId;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 1);
  v8 = v4;
  if (v5)
  {
    objc_msgSend_setContainerName_(self, (const char *)v4, v5);
    v4 = v8;
  }
  self->_databaseType = *((_DWORD *)v4 + 6);
  databaseOwnerId = self->_databaseOwnerId;
  v7 = *((_QWORD *)v4 + 2);
  if (databaseOwnerId)
  {
    if (v7)
    {
      objc_msgSend_mergeFrom_(databaseOwnerId, (const char *)v4, v7);
LABEL_8:
      v4 = v8;
    }
  }
  else if (v7)
  {
    objc_msgSend_setDatabaseOwnerId_(self, (const char *)v4, v7);
    goto LABEL_8;
  }

}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
  objc_storeStrong((id *)&self->_containerName, a3);
}

- (int)databaseType
{
  return self->_databaseType;
}

- (void)setDatabaseType:(int)a3
{
  self->_databaseType = a3;
}

- (CKDPIdentifier)databaseOwnerId
{
  return self->_databaseOwnerId;
}

- (void)setDatabaseOwnerId:(id)a3
{
  objc_storeStrong((id *)&self->_databaseOwnerId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseOwnerId, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end
