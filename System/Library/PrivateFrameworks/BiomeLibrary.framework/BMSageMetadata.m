@implementation BMSageMetadata

- (BMSageMetadata)initWithRawSessionId:(id)a3 clientId:(id)a4 clientRequestId:(id)a5 clientSessionId:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMSageMetadata *v14;
  uint64_t v15;
  NSData *raw_rawSessionId;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSageMetadata;
  v14 = -[BMEventBase init](&v18, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v19[0] = 0;
      v19[1] = 0;
      objc_msgSend(v10, "getUUIDBytes:", v19);
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v19, 16);
      raw_rawSessionId = v14->_raw_rawSessionId;
      v14->_raw_rawSessionId = (NSData *)v15;
    }
    else
    {
      raw_rawSessionId = v14->_raw_rawSessionId;
      v14->_raw_rawSessionId = 0;
    }

    objc_storeStrong((id *)&v14->_clientId, a4);
    objc_storeStrong((id *)&v14->_clientRequestId, a5);
    objc_storeStrong((id *)&v14->_clientSessionId, a6);
  }

  return v14;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSageMetadata rawSessionId](self, "rawSessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageMetadata clientId](self, "clientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageMetadata clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageMetadata clientSessionId](self, "clientSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSageMetadata with rawSessionId: %@, clientId: %@, clientRequestId: %@, clientSessionId: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSageMetadata *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  NSData *v19;
  NSData *raw_rawSessionId;
  uint64_t v21;
  uint64_t v22;
  BMSageMetadata *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMSageMetadata;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_32;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v19 = (NSData *)objc_claimAutoreleasedReturnValue();
          if (-[NSData length](v19, "length") == 16)
          {
            raw_rawSessionId = v5->_raw_rawSessionId;
            v5->_raw_rawSessionId = v19;
            goto LABEL_28;
          }

          goto LABEL_31;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 32;
          goto LABEL_27;
        case 3u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 40;
          goto LABEL_27;
        case 4u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 48;
LABEL_27:
          raw_rawSessionId = *(NSData **)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
LABEL_28:

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_31;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_31:
    v23 = 0;
  else
LABEL_32:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_raw_rawSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_clientId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientRequestId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientSessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSageMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSageMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  BMSageMetadata *v14;
  BMSageMetadata *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id *v20;
  id v21;
  uint64_t v22;
  id v23;
  id *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  id *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rawSessionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v6;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          v14 = self;
          goto LABEL_35;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v43 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientId"));
        v44 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
        a4 = 0;
        v14 = self;
LABEL_34:

        v6 = v37;
LABEL_35:

        goto LABEL_36;
      }
      v36 = v8;
    }
    else
    {
      v36 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientRequestId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v15 = 0;
          v14 = self;
          a4 = v36;
          goto LABEL_34;
        }
        v10 = v7;
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = a4;
        v25 = *MEMORY[0x1E0D025B8];
        v41 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientRequestId"));
        v42 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v25, 2, v12);
        v15 = 0;
        v11 = 0;
        *v24 = v26;
        v14 = self;
        goto LABEL_32;
      }
      v10 = v7;
      v11 = v9;
    }
    else
    {
      v10 = v7;
      v11 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientSessionId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
      v14 = self;
LABEL_13:
      a4 = v36;
      v14 = -[BMSageMetadata initWithRawSessionId:clientId:clientRequestId:clientSessionId:](v14, "initWithRawSessionId:clientId:clientRequestId:clientSessionId:", v10, v36, v11, v13);
      v15 = v14;
LABEL_33:

      v7 = v10;
      goto LABEL_34;
    }
    objc_opt_class();
    v14 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      goto LABEL_13;
    }
    if (a4)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D025B8];
      v39 = *MEMORY[0x1E0CB2D50];
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientSessionId"));
      v40 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v34, 2, v28);

    }
    v13 = 0;
    v15 = 0;
LABEL_32:
    a4 = v36;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v15 = 0;
      v14 = self;
      goto LABEL_38;
    }
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = *MEMORY[0x1E0D025B8];
    v45 = *MEMORY[0x1E0CB2D50];
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("rawSessionId"));
    v46 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v20 = (id *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v20);
    a4 = v20;
    v14 = self;
    goto LABEL_36;
  }
  v7 = v6;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
  if (v16)
  {
    v17 = (void *)v16;

    v7 = v17;
    goto LABEL_4;
  }
  v14 = self;
  if (!a4)
  {
    v15 = 0;
    goto LABEL_37;
  }
  v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v31 = *MEMORY[0x1E0D025B8];
  v47 = *MEMORY[0x1E0CB2D50];
  v32 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("rawSessionId"));
  v48[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v33);
  a4 = v32;

  v15 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  -[BMSageMetadata rawSessionId](self, "rawSessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSageMetadata clientId](self, "clientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageMetadata clientRequestId](self, "clientRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSageMetadata clientSessionId](self, "clientSessionId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("rawSessionId");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v8;
  v14[1] = CFSTR("clientId");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v9;
  v14[2] = CFSTR("clientRequestId");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v10;
  v14[3] = CFSTR("clientSessionId");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_11;
  }
  else
  {

    if (v6)
    {
LABEL_11:
      if (v5)
        goto LABEL_12;
LABEL_16:

      if (v4)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v5)
    goto LABEL_16;
LABEL_12:
  if (!v4)
    goto LABEL_17;
LABEL_13:

  return v12;
}

- (NSUUID)rawSessionId
{
  NSData *raw_rawSessionId;
  void *v3;

  raw_rawSessionId = self->_raw_rawSessionId;
  if (raw_rawSessionId)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_rawSessionId, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSageMetadata rawSessionId](self, "rawSessionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rawSessionId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSageMetadata rawSessionId](self, "rawSessionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rawSessionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMSageMetadata clientId](self, "clientId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSageMetadata clientId](self, "clientId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMSageMetadata clientRequestId](self, "clientRequestId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientRequestId");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSageMetadata clientRequestId](self, "clientRequestId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientRequestId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMSageMetadata clientSessionId](self, "clientSessionId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientSessionId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v12 = 1;
    }
    else
    {
      -[BMSageMetadata clientSessionId](self, "clientSessionId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientSessionId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (NSString)clientRequestId
{
  return self->_clientRequestId;
}

- (NSString)clientSessionId
{
  return self->_clientSessionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSessionId, 0);
  objc_storeStrong((id *)&self->_clientRequestId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_raw_rawSessionId, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMSageMetadata initByReadFrom:]([BMSageMetadata alloc], "initByReadFrom:", v7);
    v4[6] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rawSessionId"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientRequestId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientSessionId"), 2, 0, 4, 13, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BF10;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rawSessionId"), 1, 14, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientId"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientRequestId"), 3, 13, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientSessionId"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
