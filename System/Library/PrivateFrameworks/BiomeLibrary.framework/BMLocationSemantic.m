@implementation BMLocationSemantic

- (BMLocationSemantic)initWithStarting:(id)a3 userSpecificPlaceType:(int)a4 placeType:(int)a5
{
  return -[BMLocationSemantic initWithStarting:userSpecificPlaceType:placeType:loiIdentifier:](self, "initWithStarting:userSpecificPlaceType:placeType:loiIdentifier:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
}

- (BMLocationSemantic)initWithStarting:(id)a3 userSpecificPlaceType:(int)a4 placeType:(int)a5 loiIdentifier:(id)a6
{
  id v10;
  id v11;
  BMLocationSemantic *v12;
  uint64_t v13;
  NSString *raw_loiIdentifier;
  objc_super v16;

  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMLocationSemantic;
  v12 = -[BMEventBase init](&v16, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v12->_hasStarting = 1;
      v12->_starting = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v12->_hasStarting = 0;
      v12->_starting = 0;
    }
    v12->_userSpecificPlaceType = a4;
    v12->_placeType = a5;
    if (v11)
    {
      objc_msgSend(v11, "UUIDString");
      v13 = objc_claimAutoreleasedReturnValue();
      raw_loiIdentifier = v12->_raw_loiIdentifier;
      v12->_raw_loiIdentifier = (NSString *)v13;
    }
    else
    {
      raw_loiIdentifier = v12->_raw_loiIdentifier;
      v12->_raw_loiIdentifier = 0;
    }

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
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLocationSemantic starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationSemanticUserSpecificPlaceTypeAsString(-[BMLocationSemantic userSpecificPlaceType](self, "userSpecificPlaceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationSemanticPlaceTypeAsString(-[BMLocationSemantic placeType](self, "placeType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationSemantic loiIdentifier](self, "loiIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationSemantic with starting: %@, userSpecificPlaceType: %@, placeType: %@, loiIdentifier: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationSemantic *v5;
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
  uint64_t v36;
  NSString *raw_loiIdentifier;
  uint64_t v38;
  BMLocationSemantic *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMLocationSemantic;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_64;
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
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v21 = 0;
LABEL_47:
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
              goto LABEL_49;
            v25 += 7;
            v16 = v26++ >= 9;
            if (v16)
            {
              LODWORD(v27) = 0;
              goto LABEL_51;
            }
          }
          v4[*v8] = 1;
LABEL_49:
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_51:
          if (v27 >= 5)
            LODWORD(v27) = 0;
          v38 = 32;
          goto LABEL_60;
        case 3u:
          v31 = 0;
          v32 = 0;
          v27 = 0;
          break;
        case 4u:
          PBReaderReadString();
          v36 = objc_claimAutoreleasedReturnValue();
          raw_loiIdentifier = v5->_raw_loiIdentifier;
          v5->_raw_loiIdentifier = (NSString *)v36;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_63;
          continue;
      }
      while (1)
      {
        v33 = *v6;
        v34 = *(_QWORD *)&v4[v33];
        if (v34 == -1 || v34 >= *(_QWORD *)&v4[*v7])
          break;
        v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
        *(_QWORD *)&v4[v33] = v34 + 1;
        v27 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0)
          goto LABEL_55;
        v31 += 7;
        v16 = v32++ >= 9;
        if (v16)
        {
          LODWORD(v27) = 0;
          goto LABEL_57;
        }
      }
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8])
        LODWORD(v27) = 0;
LABEL_57:
      if (v27 >= 4)
        LODWORD(v27) = 0;
      v38 = 36;
LABEL_60:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v27;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_63:
    v39 = 0;
  else
LABEL_64:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_raw_loiIdentifier)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationSemantic writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationSemantic)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  BMLocationSemantic *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  BMLocationSemantic *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v39 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userSpecificPlaceType"));
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
            goto LABEL_44;
          }
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v25 = *MEMORY[0x1E0D025B8];
          v46 = *MEMORY[0x1E0CB2D50];
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userSpecificPlaceType"));
          v47 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v14);
          v9 = 0;
          v13 = 0;
          *a4 = v26;
          goto LABEL_43;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationSemanticUserSpecificPlaceTypeFromString(v8));
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v10;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placeType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self;
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
            self = v38;
            goto LABEL_43;
          }
          v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v44 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeType"));
          v45 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *v15 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v29);

          v16 = 0;
          goto LABEL_37;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationSemanticPlaceTypeFromString(v14));
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v17;
    }
    else
    {
      v15 = a4;
      v16 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loiIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
LABEL_27:
      self = -[BMLocationSemantic initWithStarting:userSpecificPlaceType:placeType:loiIdentifier:](v38, "initWithStarting:userSpecificPlaceType:placeType:loiIdentifier:", v39, objc_msgSend(v9, "intValue"), objc_msgSend(v16, "intValue"), v19);

      v13 = self;
LABEL_42:

LABEL_43:
      goto LABEL_44;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v9;
      v20 = v18;
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v20);
      if (!v21)
      {
        if (v15)
        {
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v42 = *MEMORY[0x1E0CB2D50];
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("loiIdentifier"));
          v43 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *v15 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v30, 2, v32);

        }
        v13 = 0;
        v18 = v20;
        v9 = v36;
        self = v38;
        goto LABEL_42;
      }
      v19 = (void *)v21;

      v9 = v36;
      goto LABEL_27;
    }
    if (v15)
    {
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D025B8];
      v40 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("loiIdentifier"));
      v41 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *v15 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v34, 2, v23);

    }
LABEL_37:
    v13 = 0;
    self = v38;
    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0D025B8];
    v48 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
    v49[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v13 = 0;
    *a4 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 2, v8);
LABEL_44:

    goto LABEL_45;
  }
  v39 = 0;
  v13 = 0;
LABEL_45:

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
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  if (-[BMLocationSemantic hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMLocationSemantic starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationSemantic userSpecificPlaceType](self, "userSpecificPlaceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationSemantic placeType](self, "placeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationSemantic loiIdentifier](self, "loiIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = CFSTR("starting");
  v8 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v8;
  v14[1] = CFSTR("userSpecificPlaceType");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v9;
  v14[2] = CFSTR("placeType");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v10;
  v14[3] = CFSTR("loiIdentifier");
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
    if (v5)
      goto LABEL_14;
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4)
        goto LABEL_15;
LABEL_19:

      if (v3)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v4)
    goto LABEL_19;
LABEL_15:
  if (!v3)
    goto LABEL_20;
LABEL_16:

  return v12;
}

- (NSUUID)loiIdentifier
{
  NSString *raw_loiIdentifier;
  void *v3;

  raw_loiIdentifier = self->_raw_loiIdentifier;
  if (raw_loiIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_loiIdentifier, 3);
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
  int v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMLocationSemantic hasStarting](self, "hasStarting") && !objc_msgSend(v5, "hasStarting")
       || -[BMLocationSemantic hasStarting](self, "hasStarting")
       && objc_msgSend(v5, "hasStarting")
       && (v6 = -[BMLocationSemantic starting](self, "starting"), v6 == objc_msgSend(v5, "starting")))
      && (v7 = -[BMLocationSemantic userSpecificPlaceType](self, "userSpecificPlaceType"),
          v7 == objc_msgSend(v5, "userSpecificPlaceType"))
      && (v8 = -[BMLocationSemantic placeType](self, "placeType"), v8 == objc_msgSend(v5, "placeType")))
    {
      -[BMLocationSemantic loiIdentifier](self, "loiIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loiIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {
        v13 = 1;
      }
      else
      {
        -[BMLocationSemantic loiIdentifier](self, "loiIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "loiIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
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
  objc_storeStrong((id *)&self->_raw_loiIdentifier, 0);
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
    v6 = off_1E5E4AD58;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AD60;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[7] = a4;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userSpecificPlaceType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("loiIdentifier"), 6, 0, 4, 13, 3);
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
  return &unk_1E5F1B658;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userSpecificPlaceType"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeType"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("loiIdentifier"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
