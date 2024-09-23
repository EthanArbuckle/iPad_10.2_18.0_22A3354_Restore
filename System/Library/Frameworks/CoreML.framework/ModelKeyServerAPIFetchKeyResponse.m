@implementation ModelKeyServerAPIFetchKeyResponse

- (BOOL)hasSuccess
{
  return self->_success != 0;
}

- (void)setSuccess:(id)a3
{
  ModelKeyServerAPIFetchKeyResult *v4;
  ModelKeyServerAPIFetchKeyResult *success;

  v4 = (ModelKeyServerAPIFetchKeyResult *)a3;
  -[ModelKeyServerAPIFetchKeyResponse clearOneofValuesForResult](self, "clearOneofValuesForResult");
  *(_BYTE *)&self->_has |= 1u;
  self->_result = 1;
  success = self->_success;
  self->_success = v4;

}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setError:(id)a3
{
  ModelKeyServerAPIResultError *v4;
  ModelKeyServerAPIResultError *error;

  v4 = (ModelKeyServerAPIResultError *)a3;
  -[ModelKeyServerAPIFetchKeyResponse clearOneofValuesForResult](self, "clearOneofValuesForResult");
  *(_BYTE *)&self->_has |= 1u;
  self->_result = 2;
  error = self->_error;
  self->_error = v4;

}

- (int)result
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_result;
  else
    return 0;
}

- (void)setResult:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)resultAsString:(int)a3
{
  if (a3 < 3)
    return *((id *)&off_1E3D65568 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResult:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("error")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForResult
{
  ModelKeyServerAPIFetchKeyResult *success;
  ModelKeyServerAPIResultError *error;

  *(_BYTE *)&self->_has &= ~1u;
  self->_result = 0;
  success = self->_success;
  self->_success = 0;

  error = self->_error;
  self->_error = 0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ModelKeyServerAPIFetchKeyResponse;
  -[ModelKeyServerAPIFetchKeyResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ModelKeyServerAPIFetchKeyResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ModelKeyServerAPIFetchKeyResult *success;
  void *v5;
  ModelKeyServerAPIResultError *error;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  success = self->_success;
  if (success)
  {
    -[ModelKeyServerAPIFetchKeyResult dictionaryRepresentation](success, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("success"));

  }
  error = self->_error;
  if (error)
  {
    -[ModelKeyServerAPIResultError dictionaryRepresentation](error, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("error"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = self->_result;
    if (v8 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_result);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)*((_QWORD *)&off_1E3D65568 + v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Result"));

  }
  return v3;
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
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  ModelKeyServerAPIResultError *v25;
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
        break;
      v18 = v11 >> 3;
      if ((v11 >> 3) == 2)
      {
        -[ModelKeyServerAPIFetchKeyResponse clearOneofValuesForResult](self, "clearOneofValuesForResult");
        *(_BYTE *)&self->_has |= 1u;
        self->_result = 2;
        v25 = objc_alloc_init(ModelKeyServerAPIResultError);
        objc_storeStrong((id *)&self->_error, v25);
        if (!PBReaderPlaceMark()
          || (ModelKeyServerAPIResultErrorReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
        {
LABEL_39:

          LOBYTE(v26) = 0;
          return v26;
        }
      }
      else
      {
        if ((_DWORD)v18 != 1)
        {
          if ((_DWORD)v18)
          {
            v26 = PBReaderSkipValueWithTag();
            if (!v26)
              return v26;
          }
          else
          {
            v19 = 0;
            while (1)
            {
              v20 = *v4;
              v21 = *(_QWORD *)((char *)a3 + v20);
              if (v21 == -1 || v21 >= *(_QWORD *)((char *)a3 + *v5))
                break;
              v22 = v21 + 1;
              v23 = *(char *)(*(_QWORD *)((char *)a3 + *v8) + v21);
              *(_QWORD *)((char *)a3 + v20) = v22;
              if (v23 < 0 && v19++ <= 8)
                continue;
              goto LABEL_37;
            }
            *((_BYTE *)a3 + *v6) = 1;
          }
          continue;
        }
        -[ModelKeyServerAPIFetchKeyResponse clearOneofValuesForResult](self, "clearOneofValuesForResult");
        *(_BYTE *)&self->_has |= 1u;
        self->_result = 1;
        v25 = objc_alloc_init(ModelKeyServerAPIFetchKeyResult);
        objc_storeStrong((id *)&self->_success, v25);
        if (!PBReaderPlaceMark()
          || (ModelKeyServerAPIFetchKeyResultReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
        {
          goto LABEL_39;
        }
      }
      PBReaderRecallMark();

LABEL_37:
      ;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((_BYTE *)a3 + *v6) == 0;
  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_success)
  {
    PBDataWriterWriteSubmessage();
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
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_result;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_success)
  {
    objc_msgSend(v4, "setSuccess:");
    v4 = v5;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_result;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[ModelKeyServerAPIFetchKeyResult copyWithZone:](self->_success, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[ModelKeyServerAPIResultError copyWithZone:](self->_error, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ModelKeyServerAPIFetchKeyResult *success;
  ModelKeyServerAPIResultError *error;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_result != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  success = self->_success;
  if ((unint64_t)success | *((_QWORD *)v4 + 3)
    && !-[ModelKeyServerAPIFetchKeyResult isEqual:](success, "isEqual:"))
  {
    goto LABEL_11;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
    v7 = -[ModelKeyServerAPIResultError isEqual:](error, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_result;
  else
    v3 = 0;
  v4 = -[ModelKeyServerAPIFetchKeyResult hash](self->_success, "hash") ^ v3;
  return v4 ^ -[ModelKeyServerAPIResultError hash](self->_error, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  ModelKeyServerAPIFetchKeyResult *success;
  uint64_t v7;
  ModelKeyServerAPIResultError *error;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_result = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  success = self->_success;
  v7 = v5[3];
  v10 = v5;
  if (success)
  {
    if (!v7)
      goto LABEL_9;
    -[ModelKeyServerAPIFetchKeyResult mergeFrom:](success, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[ModelKeyServerAPIFetchKeyResponse setSuccess:](self, "setSuccess:");
  }
  v5 = v10;
LABEL_9:
  error = self->_error;
  v9 = v5[1];
  if (error)
  {
    if (v9)
    {
      -[ModelKeyServerAPIResultError mergeFrom:](error, "mergeFrom:");
LABEL_14:
      v5 = v10;
    }
  }
  else if (v9)
  {
    -[ModelKeyServerAPIFetchKeyResponse setError:](self, "setError:");
    goto LABEL_14;
  }

}

- (ModelKeyServerAPIFetchKeyResult)success
{
  return self->_success;
}

- (ModelKeyServerAPIResultError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_success, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
