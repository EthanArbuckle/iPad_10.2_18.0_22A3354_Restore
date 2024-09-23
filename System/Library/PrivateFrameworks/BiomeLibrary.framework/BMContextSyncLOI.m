@implementation BMContextSyncLOI

- (BMContextSyncLOI)initWithID:(id)a3 deviceUUID:(id)a4 starting:(id)a5 userSpecificPlaceType:(int)a6 placeType:(int)a7
{
  id v13;
  id v14;
  id v15;
  BMContextSyncLOI *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BMContextSyncLOI;
  v16 = -[BMEventBase init](&v18, sel_init);
  if (v16)
  {
    v16->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v16->_ID, a3);
    objc_storeStrong((id *)&v16->_deviceUUID, a4);
    if (v15)
    {
      v16->_hasStarting = 1;
      v16->_starting = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v16->_hasStarting = 0;
      v16->_starting = 0;
    }
    v16->_userSpecificPlaceType = a6;
    v16->_placeType = a7;
  }

  return v16;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMContextSyncLOI ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncLOI deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMContextSyncLOI starting](self, "starting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMContextSyncLOIUserSpecificPlaceTypeAsString(-[BMContextSyncLOI userSpecificPlaceType](self, "userSpecificPlaceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMContextSyncLOIPlaceTypeAsString(-[BMContextSyncLOI placeType](self, "placeType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextSyncLOI with ID: %@, deviceUUID: %@, starting: %@, userSpecificPlaceType: %@, placeType: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextSyncLOI *v5;
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
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  BMContextSyncLOI *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMContextSyncLOI;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
    goto LABEL_66;
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
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
LABEL_24:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v16 = v23++ >= 9;
                if (v16)
                {
                  v24 = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v24 = 0;
LABEL_49:
          v5->_starting = v24 != 0;
          continue;
        case 4u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v30) = 0;
LABEL_53:
          if (v30 >= 5)
            LODWORD(v30) = 0;
          v39 = 24;
          goto LABEL_62;
        case 5u:
          v34 = 0;
          v35 = 0;
          v30 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_65;
          continue;
      }
      while (1)
      {
        v36 = *v6;
        v37 = *(_QWORD *)&v4[v36];
        if (v37 == -1 || v37 >= *(_QWORD *)&v4[*v7])
          break;
        v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
        *(_QWORD *)&v4[v36] = v37 + 1;
        v30 |= (unint64_t)(v38 & 0x7F) << v34;
        if ((v38 & 0x80) == 0)
          goto LABEL_57;
        v34 += 7;
        v16 = v35++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_59;
        }
      }
      v4[*v8] = 1;
LABEL_57:
      if (v4[*v8])
        LODWORD(v30) = 0;
LABEL_59:
      if (v30 >= 4)
        LODWORD(v30) = 0;
      v39 = 28;
LABEL_62:
      *(_DWORD *)((char *)&v5->super.super.isa + v39) = v30;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_65:
    v40 = 0;
  else
LABEL_66:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_ID)
    PBDataWriterWriteStringField();
  if (self->_deviceUUID)
    PBDataWriterWriteStringField();
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMContextSyncLOI writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextSyncLOI)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  id v15;
  uint64_t v16;
  BMContextSyncLOI *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          v17 = 0;
          goto LABEL_42;
        }
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceUUID"));
        v43 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        v17 = 0;
        *v32 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v10);
        goto LABEL_41;
      }
      v35 = v9;
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v34 = 0;
          v17 = 0;
          goto LABEL_41;
        }
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v40 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
        v41 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v17 = 0;
        *v32 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v11);
LABEL_40:

        v8 = v33;
LABEL_41:

        goto LABEL_42;
      }
      v34 = v10;
    }
    else
    {
      v34 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userSpecificPlaceType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v12 = 0;
            v17 = 0;
            goto LABEL_40;
          }
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v38 = *MEMORY[0x1E0CB2D50];
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userSpecificPlaceType"));
          v39 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v17 = 0;
          *v32 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v22);
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextSyncLOIUserSpecificPlaceTypeFromString(v11));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placeType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v32)
          {
            v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v29 = *MEMORY[0x1E0D025B8];
            v36 = *MEMORY[0x1E0CB2D50];
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeType"));
            v37 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *v32 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v29, 2, v27);

          }
          v23 = 0;
          v17 = 0;
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextSyncLOIPlaceTypeFromString(v22));
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v23 = v24;
    }
    else
    {
      v23 = 0;
    }
    v17 = -[BMContextSyncLOI initWithID:deviceUUID:starting:userSpecificPlaceType:placeType:](self, "initWithID:deviceUUID:starting:userSpecificPlaceType:placeType:", v33, v35, v34, objc_msgSend(v12, "intValue"), objc_msgSend(v23, "intValue"));
    self = v17;
LABEL_39:

    goto LABEL_40;
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
    v17 = 0;
    goto LABEL_43;
  }
  v14 = a4;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v44 = *MEMORY[0x1E0CB2D50];
  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("ID"));
  v45[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v17 = 0;
  *v14 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
LABEL_42:

LABEL_43:
  return v17;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[BMContextSyncLOI ID](self, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncLOI deviceUUID](self, "deviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMContextSyncLOI hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMContextSyncLOI starting](self, "starting"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextSyncLOI userSpecificPlaceType](self, "userSpecificPlaceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextSyncLOI placeType](self, "placeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("ID");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("deviceUUID");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("starting");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("userSpecificPlaceType");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("placeType");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_16;
  }
  else
  {

    if (v6)
    {
LABEL_16:
      if (v5)
        goto LABEL_17;
      goto LABEL_22;
    }
  }

  if (v5)
  {
LABEL_17:
    if (v4)
      goto LABEL_18;
LABEL_23:

    if (v3)
      goto LABEL_19;
LABEL_24:

    goto LABEL_19;
  }
LABEL_22:

  if (!v4)
    goto LABEL_23;
LABEL_18:
  if (!v3)
    goto LABEL_24;
LABEL_19:

  return v13;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  int v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMContextSyncLOI ID](self, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMContextSyncLOI ID](self, "ID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_18;
    }
    -[BMContextSyncLOI deviceUUID](self, "deviceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMContextSyncLOI deviceUUID](self, "deviceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_18;
    }
    if (!-[BMContextSyncLOI hasStarting](self, "hasStarting") && !objc_msgSend(v5, "hasStarting")
      || -[BMContextSyncLOI hasStarting](self, "hasStarting")
      && objc_msgSend(v5, "hasStarting")
      && (v19 = -[BMContextSyncLOI starting](self, "starting"), v19 == objc_msgSend(v5, "starting")))
    {
      v20 = -[BMContextSyncLOI userSpecificPlaceType](self, "userSpecificPlaceType");
      if (v20 == objc_msgSend(v5, "userSpecificPlaceType"))
      {
        v21 = -[BMContextSyncLOI placeType](self, "placeType");
        v12 = v21 == objc_msgSend(v5, "placeType");
LABEL_19:

        goto LABEL_20;
      }
    }
LABEL_18:
    v12 = 0;
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

- (NSString)ID
{
  return self->_ID;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (BOOL)starting
{
  return self->_starting;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (int)userSpecificPlaceType
{
  return self->_userSpecificPlaceType;
}

- (int)placeType
{
  return self->_placeType;
}

- (void).cxx_destruct
{
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

    v4 = -[BMContextSyncLOI initByReadFrom:]([BMContextSyncLOI alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceUUID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userSpecificPlaceType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeType"), 0, 0, 5, 4, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A950;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceUUID"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 3, 12, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userSpecificPlaceType"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeType"), 5, 4, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
