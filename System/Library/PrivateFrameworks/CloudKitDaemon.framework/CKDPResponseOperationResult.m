@implementation CKDPResponseOperationResult

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)code
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_code;
  else
    return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)codeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7830798[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCode:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("success")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("partial")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("failure")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("indeterminate")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasError
{
  return self->_error != 0;
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
  v11.super_class = (Class)CKDPResponseOperationResult;
  -[CKDPResponseOperationResult description](&v11, sel_description);
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
  unsigned int v7;
  __CFString *v8;
  CKDPResponseOperationResultError *error;
  void *v10;
  const char *v11;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = self->_code - 1;
    if (v7 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_code);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7830798[v7];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v8, CFSTR("code"));

  }
  error = self->_error;
  if (error)
  {
    objc_msgSend_dictionaryRepresentation(error, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("error"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  CKDPResponseOperationResultError *error;
  _DWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_code;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  error = self->_error;
  if (error)
  {
    v7 = v4;
    objc_msgSend_setError_(v4, v5, (uint64_t)error);
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
    *(_DWORD *)(v10 + 8) = self->_code;
    *(_BYTE *)(v10 + 24) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_error, v11, (uint64_t)a3);
  v14 = (void *)v12[2];
  v12[2] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPResponseOperationResultError *error;
  uint64_t v9;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[3] & 1) == 0 || self->_code != *((_DWORD *)v4 + 2))
      goto LABEL_9;
  }
  else if ((v4[3] & 1) != 0)
  {
LABEL_9:
    isEqual = 0;
    goto LABEL_10;
  }
  error = self->_error;
  v9 = v4[2];
  if ((unint64_t)error | v9)
    isEqual = objc_msgSend_isEqual_(error, v7, v9);
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
    v3 = 2654435761 * self->_code;
  else
    v3 = 0;
  return objc_msgSend_hash(self->_error, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;
  CKDPResponseOperationResultError *error;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[6] & 1) != 0)
  {
    self->_code = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  error = self->_error;
  v7 = v5[2];
  if (error)
  {
    if (v7)
    {
      v8 = v5;
      objc_msgSend_mergeFrom_(error, (const char *)v5, v7);
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    objc_msgSend_setError_(self, (const char *)v5, v7);
    goto LABEL_8;
  }

}

- (CKDPResponseOperationResultError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  switch(objc_msgSend_code(self, v6, v7))
  {
    case 1u:
      v13 = CFSTR("success");
      objc_msgSend_writeString_(v21, v8, (uint64_t)CFSTR("success"));
      break;
    case 2u:
    case 4u:
      v10 = objc_msgSend_code(self, v8, v9);
      if ((v10 - 1) >= 4)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("(unknown: %i)"), v10);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E78343A0[(int)v10 - 1];
      }
      objc_msgSend_stringByAppendingString_(v12, v11, (uint64_t)CFSTR(" failure"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_writeString_(v21, v16, (uint64_t)v13);
      break;
    case 3u:
      v13 = CFSTR("failure");
      objc_msgSend_writeString_(v21, v8, (uint64_t)CFSTR("failure"));
      break;
    default:
      v13 = 0;
      objc_msgSend_writeString_(v21, v8, 0);
      break;
  }
  if (objc_msgSend_hasError(self, v14, v15))
  {
    objc_msgSend_error(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__CKLogToFileHandle_atDepth_(v19, v20, (uint64_t)v21, (a4 + 1));

  }
}

@end
