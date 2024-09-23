@implementation BMDeviceCellularQualityStatus

- (BMDeviceCellularQualityStatus)initWithStarting:(id)a3 rat:(int)a4 deviceRegistrationState:(int)a5 quality:(id)a6 rrcStatus:(int)a7
{
  id v12;
  id v13;
  BMDeviceCellularQualityStatus *v14;
  int v15;
  objc_super v17;

  v12 = a3;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMDeviceCellularQualityStatus;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v14->_hasStarting = 1;
      v14->_starting = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v14->_hasStarting = 0;
      v14->_starting = 0;
    }
    v14->_rat = a4;
    v14->_deviceRegistrationState = a5;
    if (v13)
    {
      v14->_hasQuality = 1;
      v15 = objc_msgSend(v13, "intValue");
    }
    else
    {
      v14->_hasQuality = 0;
      v15 = -1;
    }
    v14->_quality = v15;
    v14->_rrcStatus = a7;
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
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceCellularQualityStatus starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceCellularQualityStatusRATAsString(-[BMDeviceCellularQualityStatus rat](self, "rat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceCellularQualityStatusStateAsString(-[BMDeviceCellularQualityStatus deviceRegistrationState](self, "deviceRegistrationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularQualityStatus quality](self, "quality"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceCellularQualityStatusRRCAsString(-[BMDeviceCellularQualityStatus rrcStatus](self, "rrcStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceCellularQualityStatus with starting: %@, rat: %@, deviceRegistrationState: %@, quality: %@, rrcStatus: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceCellularQualityStatus *v5;
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  BMDeviceCellularQualityStatus *v48;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMDeviceCellularQualityStatus;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_87;
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
          v19 = 0;
          v20 = 0;
          v21 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
              *(_QWORD *)&v4[v22] = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                v16 = v20++ >= 9;
                if (v16)
                {
                  v21 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v21 = 0;
LABEL_60:
          v5->_starting = v21 != 0;
          continue;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (1)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
              break;
            v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
            *(_QWORD *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0)
              goto LABEL_62;
            v25 += 7;
            v16 = v26++ >= 9;
            if (v16)
            {
              LODWORD(v27) = 0;
              goto LABEL_64;
            }
          }
          v4[*v8] = 1;
LABEL_62:
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_64:
          if (v27 >= 7)
            LODWORD(v27) = 0;
          v47 = 24;
          goto LABEL_83;
        case 3u:
          v31 = 0;
          v32 = 0;
          v27 = 0;
          while (2)
          {
            v33 = *v6;
            v34 = *(_QWORD *)&v4[v33];
            if (v34 == -1 || v34 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
              *(_QWORD *)&v4[v33] = v34 + 1;
              v27 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v16 = v32++ >= 9;
                if (v16)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_70:
          if (v27 >= 5)
            LODWORD(v27) = 0;
          v47 = 28;
          goto LABEL_83;
        case 4u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v5->_hasQuality = 1;
          while (2)
          {
            v39 = *v6;
            v40 = *(_QWORD *)&v4[v39];
            if (v40 == -1 || v40 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
              *(_QWORD *)&v4[v39] = v40 + 1;
              v38 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                v16 = v37++ >= 9;
                if (v16)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v38) = 0;
LABEL_76:
          v5->_quality = v38;
          continue;
        case 5u:
          v42 = 0;
          v43 = 0;
          v27 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_86;
          continue;
      }
      while (1)
      {
        v44 = *v6;
        v45 = *(_QWORD *)&v4[v44];
        if (v45 == -1 || v45 >= *(_QWORD *)&v4[*v7])
          break;
        v46 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
        *(_QWORD *)&v4[v44] = v45 + 1;
        v27 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0)
          goto LABEL_78;
        v42 += 7;
        v16 = v43++ >= 9;
        if (v16)
        {
          LODWORD(v27) = 0;
          goto LABEL_80;
        }
      }
      v4[*v8] = 1;
LABEL_78:
      if (v4[*v8])
        LODWORD(v27) = 0;
LABEL_80:
      if (v27 >= 3)
        LODWORD(v27) = 0;
      v47 = 36;
LABEL_83:
      *(_DWORD *)((char *)&v5->super.super.isa + v47) = v27;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_86:
    v48 = 0;
  else
LABEL_87:
    v48 = v5;

  return v48;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasQuality)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceCellularQualityStatus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceCellularQualityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  BMDeviceCellularQualityStatus *v13;
  void *v14;
  id v15;
  void *v16;
  id *v17;
  uint64_t v18;
  id *v19;
  id v20;
  BMDeviceCellularQualityStatus *v21;
  id v23;
  uint64_t v24;
  id v25;
  id *v26;
  uint64_t v27;
  id *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("starting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v37 = 0;
        v13 = 0;
        v21 = self;
        goto LABEL_43;
      }
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = *MEMORY[0x1E0D025B8];
      v46 = *MEMORY[0x1E0CB2D50];
      v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
      v47[0] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v13 = 0;
      *a4 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, v7);
      goto LABEL_56;
    }
    v37 = v6;
  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v7;
        goto LABEL_7;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceCellularQualityStatusRATFromString(v7));
        v36 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (a4)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v44 = *MEMORY[0x1E0CB2D50];
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("rat"));
        v45 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        v13 = 0;
        *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v8);
        goto LABEL_58;
      }
      v36 = 0;
      v13 = 0;
LABEL_56:
      v21 = self;
      goto LABEL_42;
    }
  }
  v36 = 0;
LABEL_7:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceRegistrationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v8;
LABEL_22:
        v9 = v10;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceCellularQualityStatusStateFromString(v8));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (a4)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = a4;
        v27 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("deviceRegistrationState"));
        v43 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v13 = 0;
        *v26 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v27, 2, v14);
        goto LABEL_54;
      }
      v9 = 0;
      v13 = 0;
LABEL_58:
      v21 = self;
      goto LABEL_41;
    }
  }
  v9 = 0;
LABEL_23:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("quality"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        goto LABEL_26;
      }
      if (a4)
      {
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v40 = *MEMORY[0x1E0CB2D50];
        v19 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("quality"));
        v41 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v18, 2, v16);
        v15 = 0;
        v13 = 0;
        *v19 = v20;
        goto LABEL_52;
      }
      v15 = 0;
      v13 = 0;
LABEL_54:
      v21 = self;
      goto LABEL_40;
    }
  }
  v15 = 0;
LABEL_26:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rrcStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
LABEL_37:
        a4 = v17;
        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceCellularQualityStatusRRCFromString(v16));
        v17 = (id *)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      if (a4)
      {
        v28 = a4;
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v38 = *MEMORY[0x1E0CB2D50];
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("rrcStatus"));
        v39 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *v28 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v31, 2, v30);

        a4 = 0;
      }
      v13 = 0;
LABEL_52:
      v21 = self;
      goto LABEL_39;
    }
  }
  a4 = 0;
LABEL_38:
  v21 = -[BMDeviceCellularQualityStatus initWithStarting:rat:deviceRegistrationState:quality:rrcStatus:](self, "initWithStarting:rat:deviceRegistrationState:quality:rrcStatus:", v37, objc_msgSend(v36, "intValue"), objc_msgSend(v9, "intValue"), v15, objc_msgSend(a4, "intValue"));
  v13 = v21;
LABEL_39:

LABEL_40:
  v6 = v34;
LABEL_41:

LABEL_42:
LABEL_43:

  return v13;
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
  if (-[BMDeviceCellularQualityStatus hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceCellularQualityStatus starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularQualityStatus rat](self, "rat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularQualityStatus deviceRegistrationState](self, "deviceRegistrationState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceCellularQualityStatus hasQuality](self, "hasQuality"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularQualityStatus quality](self, "quality"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularQualityStatus rrcStatus](self, "rrcStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("starting");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("rat");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("deviceRegistrationState");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("quality");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("rrcStatus");
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
      goto LABEL_19;
  }
  else
  {

    if (v6)
    {
LABEL_19:
      if (v5)
        goto LABEL_20;
      goto LABEL_25;
    }
  }

  if (v5)
  {
LABEL_20:
    if (v4)
      goto LABEL_21;
LABEL_26:

    if (v3)
      goto LABEL_22;
LABEL_27:

    goto LABEL_22;
  }
LABEL_25:

  if (!v4)
    goto LABEL_26;
LABEL_21:
  if (!v3)
    goto LABEL_27;
LABEL_22:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMDeviceCellularQualityStatus hasStarting](self, "hasStarting")
       && !objc_msgSend(v5, "hasStarting")
       || -[BMDeviceCellularQualityStatus hasStarting](self, "hasStarting")
       && objc_msgSend(v5, "hasStarting")
       && (v6 = -[BMDeviceCellularQualityStatus starting](self, "starting"),
           v6 == objc_msgSend(v5, "starting")))
      && (v7 = -[BMDeviceCellularQualityStatus rat](self, "rat"), v7 == objc_msgSend(v5, "rat"))
      && (v8 = -[BMDeviceCellularQualityStatus deviceRegistrationState](self, "deviceRegistrationState"),
          v8 == objc_msgSend(v5, "deviceRegistrationState"))
      && (!-[BMDeviceCellularQualityStatus hasQuality](self, "hasQuality")
       && !objc_msgSend(v5, "hasQuality")
       || -[BMDeviceCellularQualityStatus hasQuality](self, "hasQuality")
       && objc_msgSend(v5, "hasQuality")
       && (v9 = -[BMDeviceCellularQualityStatus quality](self, "quality"),
           v9 == objc_msgSend(v5, "quality"))))
    {
      v10 = -[BMDeviceCellularQualityStatus rrcStatus](self, "rrcStatus");
      v11 = v10 == objc_msgSend(v5, "rrcStatus");
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
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

- (int)rat
{
  return self->_rat;
}

- (int)deviceRegistrationState
{
  return self->_deviceRegistrationState;
}

- (int)quality
{
  return self->_quality;
}

- (BOOL)hasQuality
{
  return self->_hasQuality;
}

- (void)setHasQuality:(BOOL)a3
{
  self->_hasQuality = a3;
}

- (int)rrcStatus
{
  return self->_rrcStatus;
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

    v4 = -[BMDeviceCellularQualityStatus initByReadFrom:]([BMDeviceCellularQualityStatus alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rat"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceRegistrationState"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("quality"), 0, 0, 4, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rrcStatus"), 0, 0, 5, 4, 0);
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
  return &unk_1E5F1F000;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rat"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceRegistrationState"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("quality"), 4, 2, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rrcStatus"), 5, 4, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
