@implementation CKCDPStopContainerRequest

- (BOOL)hasContainerName
{
  return self->_containerName != 0;
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
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
  v11.super_class = (Class)CKCDPStopContainerRequest;
  -[CKCDPStopContainerRequest description](&v11, sel_description);
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
  NSString *environment;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  containerName = self->_containerName;
  if (containerName)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)containerName, CFSTR("containerName"));
  environment = self->_environment;
  if (environment)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)environment, CFSTR("environment"));
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
  int v16;
  objc_class *v18;
  uint64_t v19;
  void *v20;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        return *((_BYTE *)a3 + *v6) == 0;
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
        if (v10++ >= 9)
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
        return *((_BYTE *)a3 + *v6) == 0;
      if ((v11 >> 3) == 2)
        break;
      if ((v11 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_22:
        v20 = *(Class *)((char *)&self->super.super.super.isa + v19);
        *(Class *)((char *)&self->super.super.super.isa + v19) = v18;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        return *((_BYTE *)a3 + *v6) == 0;
    }
    PBReaderReadString();
    v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v19 = 16;
    goto LABEL_22;
  }
  return *((_BYTE *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_containerName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_environment)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 87;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *containerName;
  NSString *environment;
  id v8;

  v4 = a3;
  containerName = self->_containerName;
  v8 = v4;
  if (containerName)
  {
    objc_msgSend_setContainerName_(v4, v5, (uint64_t)containerName);
    v4 = v8;
  }
  environment = self->_environment;
  if (environment)
  {
    objc_msgSend_setEnvironment_(v8, v5, (uint64_t)environment);
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_containerName, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_environment, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *containerName;
  uint64_t v9;
  NSString *environment;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((containerName = self->_containerName, v9 = v4[1], !((unint64_t)containerName | v9))
     || objc_msgSend_isEqual_(containerName, v7, v9)))
  {
    environment = self->_environment;
    v11 = v4[2];
    if ((unint64_t)environment | v11)
      isEqual = objc_msgSend_isEqual_(environment, v7, v11);
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
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_containerName, a2, v2);
  return objc_msgSend_hash(self->_environment, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v6 = v4[1];
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setContainerName_(self, v5, v6);
    v4 = v8;
  }
  v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setEnvironment_(self, v5, v7);
    v4 = v8;
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

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end
