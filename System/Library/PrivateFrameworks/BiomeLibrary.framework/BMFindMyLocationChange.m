@implementation BMFindMyLocationChange

- (BMFindMyLocationChange)initWithIdsHandle:(id)a3 stateChange:(int)a4 activityState:(int)a5 latitude:(id)a6 longitude:(id)a7 name:(id)a8
{
  return -[BMFindMyLocationChange initWithIdsHandle:stateChange:activityState:name:](self, "initWithIdsHandle:stateChange:activityState:name:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a8, a7);
}

- (BMFindMyLocationChange)initWithIdsHandle:(id)a3 stateChange:(int)a4 activityState:(int)a5 name:(id)a6
{
  id v11;
  id v12;
  BMFindMyLocationChange *v13;
  objc_super v15;

  v11 = a3;
  v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BMFindMyLocationChange;
  v13 = -[BMEventBase init](&v15, sel_init);
  if (v13)
  {
    v13->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v13->_idsHandle, a3);
    v13->_stateChange = a4;
    v13->_activityState = a5;
    objc_storeStrong((id *)&v13->_name, a6);
  }

  return v13;
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
  -[BMFindMyLocationChange idsHandle](self, "idsHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMFindMyLocationChangeStateChangeAsString(-[BMFindMyLocationChange stateChange](self, "stateChange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMFindMyLocationChangeActivityStateAsString(-[BMFindMyLocationChange activityState](self, "activityState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFindMyLocationChange name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMFindMyLocationChange with idsHandle: %@, stateChange: %@, activityState: %@, name: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFindMyLocationChange *v5;
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
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  uint64_t v33;
  BMFindMyLocationChange *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMFindMyLocationChange;
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
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_38;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_42:
          if (v23 >= 4)
            LODWORD(v23) = 0;
          v33 = 20;
          goto LABEL_51;
        case 3u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          break;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
LABEL_38:
          v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_54;
          continue;
      }
      while (1)
      {
        v29 = *v6;
        v30 = *(_QWORD *)&v4[v29];
        if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
          break;
        v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
        *(_QWORD *)&v4[v29] = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0)
          goto LABEL_46;
        v27 += 7;
        v16 = v28++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_48;
        }
      }
      v4[*v8] = 1;
LABEL_46:
      if (v4[*v8])
        LODWORD(v23) = 0;
LABEL_48:
      if (v23 >= 6)
        LODWORD(v23) = 0;
      v33 = 24;
LABEL_51:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
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
  if (self->_idsHandle)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_name)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFindMyLocationChange writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFindMyLocationChange)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  BMFindMyLocationChange *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  BMFindMyLocationChange *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("idsHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v32 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stateChange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v9 = 0;
            v13 = 0;
            goto LABEL_30;
          }
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v24 = *MEMORY[0x1E0D025B8];
          v37 = *MEMORY[0x1E0CB2D50];
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("stateChange"));
          v38 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v14);
          v9 = 0;
          v13 = 0;
          *a4 = v25;
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFindMyLocationChangeStateChangeFromString(v8));
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v10;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = self;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            v13 = 0;
            self = v31;
            goto LABEL_29;
          }
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v26 = *MEMORY[0x1E0D025B8];
          v35 = *MEMORY[0x1E0CB2D50];
          v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("activityState"));
          v36 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v26, 2, v18);
          v16 = 0;
          v13 = 0;
          *v15 = v27;
          goto LABEL_41;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFindMyLocationChangeActivityStateFromString(v14));
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v17;
    }
    else
    {
      v15 = a4;
      v16 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
LABEL_27:
      self = -[BMFindMyLocationChange initWithIdsHandle:stateChange:activityState:name:](v31, "initWithIdsHandle:stateChange:activityState:name:", v32, objc_msgSend(v9, "intValue"), objc_msgSend(v16, "intValue"), v19);
      v13 = self;
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v18;
      goto LABEL_27;
    }
    if (v15)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v33 = *MEMORY[0x1E0CB2D50];
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
      v34 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *v15 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v28, 2, v22);

    }
    v19 = 0;
    v13 = 0;
LABEL_41:
    self = v31;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v32 = 0;
    v13 = 0;
    goto LABEL_31;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0D025B8];
  v39 = *MEMORY[0x1E0CB2D50];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("idsHandle"));
  v40[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v13 = 0;
  *a4 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, v8);
LABEL_30:

LABEL_31:
  return v13;
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
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[BMFindMyLocationChange idsHandle](self, "idsHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFindMyLocationChange stateChange](self, "stateChange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFindMyLocationChange activityState](self, "activityState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFindMyLocationChange name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("idsHandle");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("stateChange");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("activityState");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("name");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4)
        goto LABEL_12;
LABEL_16:

      if (v3)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v4)
    goto LABEL_16;
LABEL_12:
  if (!v3)
    goto LABEL_17;
LABEL_13:

  return v11;
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
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFindMyLocationChange idsHandle](self, "idsHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "idsHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFindMyLocationChange idsHandle](self, "idsHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "idsHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_11;
    }
    v13 = -[BMFindMyLocationChange stateChange](self, "stateChange");
    if (v13 == objc_msgSend(v5, "stateChange"))
    {
      v14 = -[BMFindMyLocationChange activityState](self, "activityState");
      if (v14 == objc_msgSend(v5, "activityState"))
      {
        -[BMFindMyLocationChange name](self, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
        {
          v12 = 1;
        }
        else
        {
          -[BMFindMyLocationChange name](self, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v17, "isEqual:", v18);

        }
        goto LABEL_12;
      }
    }
LABEL_11:
    v12 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (int)stateChange
{
  return self->_stateChange;
}

- (int)activityState
{
  return self->_activityState;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_idsHandle, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4AAB8;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AAC0;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[4] = a4;

LABEL_7:
  return v8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("idsHandle"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stateChange"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityState"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 6, 13, 0);
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
  return &unk_1E5F1DF68;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("idsHandle"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stateChange"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityState"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 6, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
