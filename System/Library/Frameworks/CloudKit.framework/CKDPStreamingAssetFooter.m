@implementation CKDPStreamingAssetFooter

- (id)statusAsString:(int)a3
{
  uint64_t v3;
  __CFString *v4;

  if (!a3)
    return CFSTR("COMPLETED");
  if (a3 == 1)
  {
    v4 = CFSTR("TERMINATED_BY_UPLOADER");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("COMPLETED"), v5) & 1) != 0)
    isEqualToString = 0;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("TERMINATED_BY_UPLOADER"), v7);

  return isEqualToString;
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
  v13.super_class = (Class)CKDPStreamingAssetFooter;
  -[CKDPStreamingAssetFooter description](&v13, sel_description);
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
  void *v7;
  int status;
  __CFString *v9;
  const char *v10;
  const char *v11;
  NSData *md5;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  if (status)
  {
    if (status == 1)
    {
      v9 = CFSTR("TERMINATED_BY_UPLOADER");
      objc_msgSend_setObject_forKey_(v7, v5, (uint64_t)CFSTR("TERMINATED_BY_UPLOADER"), (uint64_t)CFSTR("status"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), v6, self->_status);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v7, v10, (uint64_t)v9, (uint64_t)CFSTR("status"));
    }
  }
  else
  {
    v9 = CFSTR("COMPLETED");
    objc_msgSend_setObject_forKey_(v7, v5, (uint64_t)CFSTR("COMPLETED"), (uint64_t)CFSTR("status"));
  }

  md5 = self->_md5;
  if (md5)
    objc_msgSend_setObject_forKey_(v7, v11, (uint64_t)md5, (uint64_t)CFSTR("md5"));
  return v7;
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
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  NSData *v24;
  NSData *md5;
  int v26;

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
      if ((v11 >> 3) == 2)
      {
        PBReaderReadData();
        v24 = (NSData *)objc_claimAutoreleasedReturnValue();
        md5 = self->_md5;
        self->_md5 = v24;

      }
      else if ((v11 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v4;
          v22 = *(_QWORD *)((char *)a3 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
          *(_QWORD *)((char *)a3 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_33;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_31:
        if (*((_BYTE *)a3 + *v6))
          LODWORD(v20) = 0;
LABEL_33:
        self->_status = v20;
      }
      else
      {
        v26 = PBReaderSkipValueWithTag();
        if (!v26)
          return v26;
      }
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((_BYTE *)a3 + *v6) == 0;
  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_md5)
    __assert_rtn("-[CKDPStreamingAssetFooter writeTo:]", "CKDPStreamingAssetFooter.m", 91, "nil != self->_md5");
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  uint64_t v3;

  *((_DWORD *)a3 + 4) = self->_status;
  objc_msgSend_setMd5_(a3, a2, (uint64_t)self->_md5, v3);
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

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 16) = self->_status;
  v15 = objc_msgSend_copyWithZone_(self->_md5, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v15;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *md5;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_status == *((_DWORD *)v4 + 4))
  {
    md5 = self->_md5;
    v11 = v4[1];
    if ((unint64_t)md5 | v11)
      isEqual = objc_msgSend_isEqual_(md5, v8, v11, v9);
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
  uint64_t v3;
  uint64_t v4;

  v4 = 2654435761 * self->_status;
  return objc_msgSend_hash(self->_md5, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  self->_status = *((_DWORD *)a3 + 4);
  v4 = *((_QWORD *)a3 + 1);
  if (v4)
    objc_msgSend_setMd5_(self, a2, v4, v3);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSData)md5
{
  return self->_md5;
}

- (void)setMd5:(id)a3
{
  objc_storeStrong((id *)&self->_md5, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_md5, 0);
}

@end
