@implementation FCCKPRequestOperation

- (void)setHeader:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_recordRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_queryRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (id)recordRetrieveRequest
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (void)setRequest:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setRecordRetrieveRequest:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);

}

- (id)queryRetrieveRequest
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)setQueryRetrieveRequest:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);

}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_recordRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_queryRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

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
  v8.super_class = (Class)FCCKPRequestOperation;
  -[FCCKPRequestOperation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPRequestOperation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  FCCKPRequestOperationHeader *header;
  void *v5;
  FCCKPOperation *request;
  void *v7;
  FCCKPRecordRetrieveRequest *recordRetrieveRequest;
  void *v9;
  FCCKPQueryRetrieveRequest *queryRetrieveRequest;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (header)
  {
    -[FCCKPRequestOperationHeader dictionaryRepresentation](header, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("header"));

  }
  request = self->_request;
  if (request)
  {
    -[FCCKPOperation dictionaryRepresentation](request, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("request"));

  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  if (recordRetrieveRequest)
  {
    -[FCCKPRecordRetrieveRequest dictionaryRepresentation](recordRetrieveRequest, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("recordRetrieveRequest"));

  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  if (queryRetrieveRequest)
  {
    -[FCCKPQueryRetrieveRequest dictionaryRepresentation](queryRetrieveRequest, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("queryRetrieveRequest"));

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
  FCCKPRecordRetrieveRequest *v19;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    do
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
      v18 = v11 >> 3;
      if ((int)(v11 >> 3) > 210)
      {
        if ((_DWORD)v18 == 211)
        {
          v19 = objc_alloc_init(FCCKPRecordRetrieveRequest);
          objc_storeStrong((id *)&self->_recordRetrieveRequest, v19);
          if (!PBReaderPlaceMark() || !FCCKPRecordRetrieveRequestReadFrom((uint64_t)v19, (uint64_t)a3))
          {
LABEL_38:

            return 0;
          }
          goto LABEL_34;
        }
        if ((_DWORD)v18 == 220)
        {
          v19 = objc_alloc_init(FCCKPQueryRetrieveRequest);
          objc_storeStrong((id *)&self->_queryRetrieveRequest, v19);
          if (!PBReaderPlaceMark()
            || (FCCKPQueryRetrieveRequestReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
      }
      else
      {
        if ((_DWORD)v18 == 1)
        {
          v19 = objc_alloc_init(FCCKPRequestOperationHeader);
          objc_storeStrong((id *)&self->_header, v19);
          if (!PBReaderPlaceMark()
            || (FCCKPRequestOperationHeaderReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
        if ((_DWORD)v18 == 2)
        {
          v19 = objc_alloc_init(FCCKPOperation);
          objc_storeStrong((id *)&self->_request, v19);
          if (!PBReaderPlaceMark() || (FCCKPOperationReadFrom((uint64_t)v19, (uint64_t)a3) & 1) == 0)
            goto LABEL_38;
LABEL_34:
          PBReaderRecallMark();

          continue;
        }
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  return *((_BYTE *)a3 + *v6) == 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[FCCKPRequestOperationHeader copyWithZone:](self->_header, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[FCCKPOperation copyWithZone:](self->_request, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[FCCKPRecordRetrieveRequest copyWithZone:](self->_recordRetrieveRequest, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[FCCKPQueryRetrieveRequest copyWithZone:](self->_queryRetrieveRequest, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  FCCKPRequestOperationHeader *header;
  FCCKPOperation *request;
  FCCKPRecordRetrieveRequest *recordRetrieveRequest;
  FCCKPQueryRetrieveRequest *queryRetrieveRequest;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((header = self->_header, !((unint64_t)header | v4[1]))
     || -[FCCKPRequestOperationHeader isEqual:](header, "isEqual:"))
    && ((request = self->_request, !((unint64_t)request | v4[4]))
     || -[FCCKPOperation isEqual:](request, "isEqual:"))
    && ((recordRetrieveRequest = self->_recordRetrieveRequest, !((unint64_t)recordRetrieveRequest | v4[3]))
     || -[FCCKPRecordRetrieveRequest isEqual:](recordRetrieveRequest, "isEqual:")))
  {
    queryRetrieveRequest = self->_queryRetrieveRequest;
    if ((unint64_t)queryRetrieveRequest | v4[2])
      v9 = -[FCCKPQueryRetrieveRequest isEqual:](queryRetrieveRequest, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[FCCKPRequestOperationHeader hash](self->_header, "hash");
  v4 = -[FCCKPOperation hash](self->_request, "hash") ^ v3;
  v5 = -[FCCKPRecordRetrieveRequest hash](self->_recordRetrieveRequest, "hash");
  return v4 ^ v5 ^ -[FCCKPQueryRetrieveRequest hash](self->_queryRetrieveRequest, "hash");
}

@end
