@implementation BMContextSyncAppInFocus

- (BMContextSyncAppInFocus)initWithID:(id)a3 deviceUUID:(id)a4 AppInFocus:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMContextSyncAppInFocus *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMContextSyncAppInFocus;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_ID, a3);
    objc_storeStrong((id *)&v12->_deviceUUID, a4);
    objc_storeStrong((id *)&v12->_AppInFocus, a5);
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMContextSyncAppInFocus ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncAppInFocus deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncAppInFocus AppInFocus](self, "AppInFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextSyncAppInFocus with ID: %@, deviceUUID: %@, AppInFocus: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextSyncAppInFocus *v5;
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BMAppInFocus *v22;
  BMAppInFocus *AppInFocus;
  void *v24;
  BMContextSyncAppInFocus *v25;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMContextSyncAppInFocus;
  v5 = -[BMEventBase init](&v27, sel_init);
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
      v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v28 = 0;
        v29 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_31;
        v22 = -[BMAppInFocus initByReadFrom:]([BMAppInFocus alloc], "initByReadFrom:", v4);
        if (!v22)
          goto LABEL_31;
        AppInFocus = v5->_AppInFocus;
        v5->_AppInFocus = v22;

        PBReaderRecallMark();
      }
      else
      {
        if ((_DWORD)v19 == 2)
        {
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
        }
        else
        {
          if ((_DWORD)v19 != 1)
          {
            if (!PBReaderSkipValueWithTag())
              goto LABEL_31;
            continue;
          }
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 24;
        }
        v24 = *(Class *)((char *)&v5->super.super.isa + v21);
        *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_31:
    v25 = 0;
  else
LABEL_32:
    v25 = v5;

  return v25;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_ID)
    PBDataWriterWriteStringField();
  if (self->_deviceUUID)
    PBDataWriterWriteStringField();
  if (self->_AppInFocus)
  {
    PBDataWriterPlaceMark();
    -[BMAppInFocus writeTo:](self->_AppInFocus, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMContextSyncAppInFocus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextSyncAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BMAppInFocus *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v25;
  id v26;
  id *v27;
  id *v28;
  id v29;
  uint64_t v30;
  BMAppInFocus *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!p_isa)
        {
          v10 = 0;
          goto LABEL_29;
        }
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = p_isa;
        v21 = *MEMORY[0x1E0D025B8];
        v32 = *MEMORY[0x1E0CB2D50];
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceUUID"));
        v33 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v12 = (BMAppInFocus *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v12);
        p_isa = 0;
        v10 = 0;
        *v28 = v22;
        goto LABEL_27;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AppInFocus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = 0;
LABEL_10:
      self = -[BMContextSyncAppInFocus initWithID:deviceUUID:AppInFocus:](self, "initWithID:deviceUUID:AppInFocus:", v8, v10, v12);
      p_isa = (id *)&self->super.super.isa;
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    v27 = p_isa;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v11;
      v29 = 0;
      v12 = -[BMAppInFocus initWithJSONDictionary:error:]([BMAppInFocus alloc], "initWithJSONDictionary:error:", v13, &v29);
      v14 = v29;
      if (!v14)
      {

        goto LABEL_10;
      }
      v15 = v14;
      v11 = v13;
      if (v27)
        *v27 = objc_retainAutorelease(v14);

    }
    else
    {
      if (!p_isa)
      {
        p_isa = 0;
        goto LABEL_28;
      }
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v25 = *MEMORY[0x1E0D025B8];
      v30 = *MEMORY[0x1E0CB2D50];
      v12 = (BMAppInFocus *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("AppInFocus"));
      v31 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *p_isa = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v25, 2, v23);

    }
    p_isa = 0;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!p_isa)
  {
    v8 = 0;
    goto LABEL_30;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v34 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("ID"));
  v35[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  v19 = p_isa;
  p_isa = 0;
  v8 = 0;
  *v19 = v18;
LABEL_29:

LABEL_30:
  return (BMContextSyncAppInFocus *)p_isa;
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
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[BMContextSyncAppInFocus ID](self, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncAppInFocus deviceUUID](self, "deviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncAppInFocus AppInFocus](self, "AppInFocus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("ID");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v7;
  v12[1] = CFSTR("deviceUUID");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  v12[2] = CFSTR("AppInFocus");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
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

  return v10;
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
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMContextSyncAppInFocus ID](self, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMContextSyncAppInFocus ID](self, "ID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMContextSyncAppInFocus deviceUUID](self, "deviceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMContextSyncAppInFocus deviceUUID](self, "deviceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMContextSyncAppInFocus AppInFocus](self, "AppInFocus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "AppInFocus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMContextSyncAppInFocus AppInFocus](self, "AppInFocus");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "AppInFocus");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (BMAppInFocus)AppInFocus
{
  return self->_AppInFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AppInFocus, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
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

    v4 = -[BMContextSyncAppInFocus initByReadFrom:]([BMContextSyncAppInFocus alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceUUID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("AppInFocus_json"), 5, 1, &__block_literal_global_9570);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B0D0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceUUID"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("AppInFocus"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__BMContextSyncAppInFocus_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AppInFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
