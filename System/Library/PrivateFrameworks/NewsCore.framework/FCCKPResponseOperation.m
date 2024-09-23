@implementation FCCKPResponseOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_recordRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_queryRetrieveResponse, 0);
}

- (id)recordRetrieveResponse
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (id)queryRetrieveResponse
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
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
  FCCKPOperation *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
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
      v18 = v11 >> 3;
      if ((int)(v11 >> 3) <= 2)
      {
        if ((_DWORD)v18 == 1)
        {
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v23 = *v4;
            v24 = *(_QWORD *)((char *)a3 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v25 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v24);
            *(_QWORD *)((char *)a3 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0)
              goto LABEL_46;
            v20 += 7;
            v15 = v21++ >= 9;
            if (v15)
            {
              LODWORD(v22) = 0;
              goto LABEL_48;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_46:
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v22) = 0;
LABEL_48:
          self->_operationCost = v22;
          continue;
        }
        if ((_DWORD)v18 != 2)
        {
LABEL_43:
          v26 = PBReaderSkipValueWithTag();
          if (!v26)
            return v26;
          continue;
        }
        v19 = objc_alloc_init(FCCKPOperation);
        objc_storeStrong((id *)&self->_response, v19);
        if (!PBReaderPlaceMark() || (FCCKPOperationReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
        {
LABEL_51:

          LOBYTE(v26) = 0;
          return v26;
        }
      }
      else
      {
        switch((_DWORD)v18)
        {
          case 3:
            v19 = objc_alloc_init(FCCKPResponseOperationResult);
            objc_storeStrong((id *)&self->_result, v19);
            if (!PBReaderPlaceMark()
              || (FCCKPResponseOperationResultReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
            {
              goto LABEL_51;
            }
            break;
          case 0xD3:
            v19 = objc_alloc_init(FCCKPRecordRetrieveResponse);
            objc_storeStrong((id *)&self->_recordRetrieveResponse, v19);
            if (!PBReaderPlaceMark()
              || (FCCKPRecordRetrieveResponseReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
            {
              goto LABEL_51;
            }
            break;
          case 0xDC:
            v19 = objc_alloc_init(FCCKPQueryRetrieveResponse);
            objc_storeStrong((id *)&self->_queryRetrieveResponse, v19);
            if (!PBReaderPlaceMark() || !FCCKPQueryRetrieveResponseReadFrom((uint64_t)v19, (uint64_t)a3))
              goto LABEL_51;
            break;
          default:
            goto LABEL_43;
        }
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((_BYTE *)a3 + *v6) == 0;
  return v26;
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
  v8.super_class = (Class)FCCKPResponseOperation;
  -[FCCKPResponseOperation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPResponseOperation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  FCCKPOperation *response;
  void *v6;
  FCCKPResponseOperationResult *v7;
  void *v8;
  FCCKPRecordRetrieveResponse *recordRetrieveResponse;
  void *v10;
  FCCKPQueryRetrieveResponse *queryRetrieveResponse;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_operationCost);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("operationCost"));

  }
  response = self->_response;
  if (response)
  {
    -[FCCKPOperation dictionaryRepresentation](response, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("response"));

  }
  v7 = self->_result;
  if (v7)
  {
    -[FCCKPResponseOperationResult dictionaryRepresentation](v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("result"));

  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if (recordRetrieveResponse)
  {
    -[FCCKPRecordRetrieveResponse dictionaryRepresentation](recordRetrieveResponse, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("recordRetrieveResponse"));

  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if (queryRetrieveResponse)
  {
    -[FCCKPQueryRetrieveResponse dictionaryRepresentation](queryRetrieveResponse, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("queryRetrieveResponse"));

  }
  return v3;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_response)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_result)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_queryRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
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
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_operationCost;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[FCCKPOperation copyWithZone:](self->_response, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[FCCKPResponseOperationResult copyWithZone:](self->_result, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v11 = -[FCCKPRecordRetrieveResponse copyWithZone:](self->_recordRetrieveResponse, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  v13 = -[FCCKPQueryRetrieveResponse copyWithZone:](self->_queryRetrieveResponse, "copyWithZone:", a3);
  v14 = (void *)v6[2];
  v6[2] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  FCCKPOperation *response;
  FCCKPResponseOperationResult *v6;
  FCCKPRecordRetrieveResponse *recordRetrieveResponse;
  FCCKPQueryRetrieveResponse *queryRetrieveResponse;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_operationCost != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  response = self->_response;
  if ((unint64_t)response | *((_QWORD *)v4 + 4) && !-[FCCKPOperation isEqual:](response, "isEqual:"))
    goto LABEL_15;
  v6 = self->_result;
  if ((unint64_t)v6 | *((_QWORD *)v4 + 5))
  {
    if (!-[FCCKPResponseOperationResult isEqual:](v6, "isEqual:"))
      goto LABEL_15;
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if ((unint64_t)recordRetrieveResponse | *((_QWORD *)v4 + 3))
  {
    if (!-[FCCKPRecordRetrieveResponse isEqual:](recordRetrieveResponse, "isEqual:"))
      goto LABEL_15;
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if ((unint64_t)queryRetrieveResponse | *((_QWORD *)v4 + 2))
    v9 = -[FCCKPQueryRetrieveResponse isEqual:](queryRetrieveResponse, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_operationCost;
  else
    v3 = 0;
  v4 = -[FCCKPOperation hash](self->_response, "hash") ^ v3;
  v5 = -[FCCKPResponseOperationResult hash](self->_result, "hash");
  v6 = v4 ^ v5 ^ -[FCCKPRecordRetrieveResponse hash](self->_recordRetrieveResponse, "hash");
  return v6 ^ -[FCCKPQueryRetrieveResponse hash](self->_queryRetrieveResponse, "hash");
}

@end
