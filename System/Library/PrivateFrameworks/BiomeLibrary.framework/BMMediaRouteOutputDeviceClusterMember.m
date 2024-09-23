@implementation BMMediaRouteOutputDeviceClusterMember

- (BMMediaRouteOutputDeviceClusterMember)initWithOutputDeviceID:(id)a3 type:(int)a4 subType:(int)a5
{
  id v9;
  BMMediaRouteOutputDeviceClusterMember *v10;
  objc_super v12;

  v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMMediaRouteOutputDeviceClusterMember;
  v10 = -[BMEventBase init](&v12, sel_init);
  if (v10)
  {
    v10->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v10->_outputDeviceID, a3);
    v10->_type = a4;
    v10->_subType = a5;
  }

  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMediaRouteOutputDeviceClusterMember outputDeviceID](self, "outputDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaRouteOutputDeviceTypeAsString(-[BMMediaRouteOutputDeviceClusterMember type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaRouteOutputDeviceSubTypeAsString(-[BMMediaRouteOutputDeviceClusterMember subType](self, "subType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMediaRouteOutputDeviceClusterMember with outputDeviceID: %@, type: %@, subType: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMediaRouteOutputDeviceClusterMember *v5;
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
  BOOL v16;
  int v17;
  unint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  NSString *outputDeviceID;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  BMMediaRouteOutputDeviceClusterMember *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMMediaRouteOutputDeviceClusterMember;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_55;
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
        v16 = v11++ >= 9;
        if (v16)
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
      v19 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        outputDeviceID = v5->_outputDeviceID;
        v5->_outputDeviceID = (NSString *)v26;

      }
      else
      {
        if ((_DWORD)v19 == 2)
        {
          v28 = 0;
          v29 = 0;
          v22 = 0;
          while (1)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v7])
              break;
            v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 1;
            v22 |= (unint64_t)(v32 & 0x7F) << v28;
            if ((v32 & 0x80) == 0)
              goto LABEL_46;
            v28 += 7;
            v16 = v29++ >= 9;
            if (v16)
            {
              LODWORD(v22) = 0;
              goto LABEL_48;
            }
          }
          v4[*v8] = 1;
LABEL_46:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_48:
          if (v22 >= 6)
            LODWORD(v22) = 0;
          v33 = 20;
        }
        else
        {
          if ((_DWORD)v19 != 3)
          {
            if (!PBReaderSkipValueWithTag())
              goto LABEL_54;
            continue;
          }
          v20 = 0;
          v21 = 0;
          v22 = 0;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            if (v24 == -1 || v24 >= *(_QWORD *)&v4[*v7])
              break;
            v25 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0)
              goto LABEL_40;
            v20 += 7;
            v16 = v21++ >= 9;
            if (v16)
            {
              LODWORD(v22) = 0;
              goto LABEL_42;
            }
          }
          v4[*v8] = 1;
LABEL_40:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_42:
          if (v22 >= 0x16)
            LODWORD(v22) = 0;
          v33 = 24;
        }
        *(_DWORD *)((char *)&v5->super.super.isa + v33) = v22;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_54:
    v34 = 0;
  else
LABEL_55:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_outputDeviceID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMediaRouteOutputDeviceClusterMember writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMediaRouteOutputDeviceClusterMember)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  BMMediaRouteOutputDeviceClusterMember *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputDeviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            v14 = 0;
            goto LABEL_26;
          }
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v19 = *MEMORY[0x1E0D025B8];
          v28 = *MEMORY[0x1E0CB2D50];
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v29 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v19, 2, v15);
          v10 = 0;
          v14 = 0;
          *a4 = v20;
          goto LABEL_25;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaRouteOutputDeviceTypeFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v23 = *MEMORY[0x1E0D025B8];
            v26 = *MEMORY[0x1E0CB2D50];
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("subType"));
            v27 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v23, 2, v22);

          }
          v16 = 0;
          v14 = 0;
          goto LABEL_25;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaRouteOutputDeviceSubTypeFromString(v15));
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v17;
    }
    else
    {
      v16 = 0;
    }
    self = -[BMMediaRouteOutputDeviceClusterMember initWithOutputDeviceID:type:subType:](self, "initWithOutputDeviceID:type:subType:", v8, objc_msgSend(v10, "intValue"), objc_msgSend(v16, "intValue"));
    v14 = self;
LABEL_25:

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    v14 = 0;
    goto LABEL_27;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v13 = *MEMORY[0x1E0D025B8];
  v30 = *MEMORY[0x1E0CB2D50];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("outputDeviceID"));
  v31[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v14 = 0;
  *a4 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2, v9);
LABEL_26:

LABEL_27:
  return v14;
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
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[BMMediaRouteOutputDeviceClusterMember outputDeviceID](self, "outputDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaRouteOutputDeviceClusterMember type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaRouteOutputDeviceClusterMember subType](self, "subType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("outputDeviceID");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("type");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("subType");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v4)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v9;
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
  BOOL v12;
  int v13;
  int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMediaRouteOutputDeviceClusterMember outputDeviceID](self, "outputDeviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputDeviceID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMediaRouteOutputDeviceClusterMember outputDeviceID](self, "outputDeviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outputDeviceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    v13 = -[BMMediaRouteOutputDeviceClusterMember type](self, "type");
    if (v13 == objc_msgSend(v5, "type"))
    {
      v14 = -[BMMediaRouteOutputDeviceClusterMember subType](self, "subType");
      v12 = v14 == objc_msgSend(v5, "subType");
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (int)type
{
  return self->_type;
}

- (int)subType
{
  return self->_subType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
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

    v4 = -[BMMediaRouteOutputDeviceClusterMember initByReadFrom:]([BMMediaRouteOutputDeviceClusterMember alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("outputDeviceID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subType"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C3A8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outputDeviceID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subType"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
