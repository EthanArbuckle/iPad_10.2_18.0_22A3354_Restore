@implementation BMSpringBoardDisplayConnected

- (BMSpringBoardDisplayConnected)initWithStarting:(id)a3 deviceName:(id)a4 uniqueId:(id)a5 productName:(id)a6 mirroringMode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BMSpringBoardDisplayConnected *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSpringBoardDisplayConnected;
  v17 = -[BMEventBase init](&v19, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v17->_hasStarting = 1;
      v17->_starting = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v17->_hasStarting = 0;
      v17->_starting = 0;
    }
    objc_storeStrong((id *)&v17->_deviceName, a4);
    objc_storeStrong((id *)&v17->_uniqueId, a5);
    objc_storeStrong((id *)&v17->_productName, a6);
    if (v16)
    {
      v17->_hasMirroringMode = 1;
      v17->_mirroringMode = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v17->_hasMirroringMode = 0;
      v17->_mirroringMode = 0;
    }
  }

  return v17;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardDisplayConnected starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardDisplayConnected deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardDisplayConnected uniqueId](self, "uniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardDisplayConnected productName](self, "productName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardDisplayConnected mirroringMode](self, "mirroringMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSpringBoardDisplayConnected with starting: %@, deviceName: %@, uniqueId: %@, productName: %@, mirroringMode: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSpringBoardDisplayConnected *v5;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BOOL v34;
  uint64_t v35;
  BMSpringBoardDisplayConnected *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMSpringBoardDisplayConnected;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_52;
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
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
              break;
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_41;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              v21 = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8])
            v21 = 0;
LABEL_43:
          v34 = v21 != 0;
          v35 = 16;
          goto LABEL_48;
        case 2u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 24;
          goto LABEL_32;
        case 3u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 32;
          goto LABEL_32;
        case 4u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 40;
LABEL_32:
          v27 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        case 5u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasMirroringMode = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_51;
          continue;
      }
      while (1)
      {
        v31 = *v6;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
        *(_QWORD *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
          goto LABEL_45;
        v28 += 7;
        v16 = v29++ >= 9;
        if (v16)
        {
          v30 = 0;
          goto LABEL_47;
        }
      }
      v4[*v8] = 1;
LABEL_45:
      if (v4[*v8])
        v30 = 0;
LABEL_47:
      v34 = v30 != 0;
      v35 = 18;
LABEL_48:
      *((_BYTE *)&v5->super.super.isa + v35) = v34;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v36 = 0;
  else
LABEL_52:
    v36 = v5;

  return v36;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_productName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasMirroringMode)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSpringBoardDisplayConnected writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSpringBoardDisplayConnected)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  id v15;
  BMSpringBoardDisplayConnected *v16;
  id *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BMSpringBoardDisplayConnected *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v16 = 0;
          goto LABEL_20;
        }
        v31 = a4;
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v44 = *MEMORY[0x1E0CB2D50];
        v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceName"));
        v45 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v37 = 0;
        *v31 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v10);
        goto LABEL_19;
      }
      v37 = v9;
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v8;
    v36 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          v16 = 0;
          goto LABEL_19;
        }
        v23 = a4;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueId"));
        v43 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v35 = 0;
        *v23 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v11);
LABEL_18:

        self = v36;
        v8 = v34;
LABEL_19:

        goto LABEL_20;
      }
      v35 = v10;
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a4;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v13 = 0;
          v16 = 0;
          goto LABEL_18;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v40 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("productName"));
        v41 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v26, 2, v14);
        v16 = 0;
        v13 = 0;
        *v12 = v27;
        goto LABEL_17;
      }
      v13 = v11;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mirroringMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v12)
        {
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v38 = *MEMORY[0x1E0CB2D50];
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("mirroringMode"));
          v39 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *v12 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v30, 2, v29);

        }
        v15 = 0;
        v16 = 0;
        goto LABEL_17;
      }
      v15 = v14;
    }
    else
    {
      v15 = 0;
    }
    v16 = -[BMSpringBoardDisplayConnected initWithStarting:deviceName:uniqueId:productName:mirroringMode:](v36, "initWithStarting:deviceName:uniqueId:productName:mirroringMode:", v34, v37, v35, v13, v15);
    v36 = v16;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    v8 = 0;
    goto LABEL_21;
  }
  v18 = a4;
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v46 = *MEMORY[0x1E0CB2D50];
  v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
  v47[0] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v8 = 0;
  *v18 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
LABEL_20:

LABEL_21:
  return v16;
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
  if (-[BMSpringBoardDisplayConnected hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardDisplayConnected starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMSpringBoardDisplayConnected deviceName](self, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardDisplayConnected uniqueId](self, "uniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardDisplayConnected productName](self, "productName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSpringBoardDisplayConnected hasMirroringMode](self, "hasMirroringMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardDisplayConnected mirroringMode](self, "mirroringMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v17 = CFSTR("starting");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("deviceName");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("uniqueId");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("productName");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("mirroringMode");
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
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSpringBoardDisplayConnected hasStarting](self, "hasStarting")
      || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMSpringBoardDisplayConnected hasStarting](self, "hasStarting"))
        goto LABEL_25;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_25;
      v6 = -[BMSpringBoardDisplayConnected starting](self, "starting");
      if (v6 != objc_msgSend(v5, "starting"))
        goto LABEL_25;
    }
    -[BMSpringBoardDisplayConnected deviceName](self, "deviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMSpringBoardDisplayConnected deviceName](self, "deviceName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_25;
    }
    -[BMSpringBoardDisplayConnected uniqueId](self, "uniqueId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueId");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMSpringBoardDisplayConnected uniqueId](self, "uniqueId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_25;
    }
    -[BMSpringBoardDisplayConnected productName](self, "productName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productName");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMSpringBoardDisplayConnected productName](self, "productName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "productName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_25;
    }
    if (!-[BMSpringBoardDisplayConnected hasMirroringMode](self, "hasMirroringMode")
      && !objc_msgSend(v5, "hasMirroringMode"))
    {
      LOBYTE(v13) = 1;
      goto LABEL_26;
    }
    if (-[BMSpringBoardDisplayConnected hasMirroringMode](self, "hasMirroringMode")
      && objc_msgSend(v5, "hasMirroringMode"))
    {
      v26 = -[BMSpringBoardDisplayConnected mirroringMode](self, "mirroringMode");
      v13 = v26 ^ objc_msgSend(v5, "mirroringMode") ^ 1;
LABEL_26:

      goto LABEL_27;
    }
LABEL_25:
    LOBYTE(v13) = 0;
    goto LABEL_26;
  }
  LOBYTE(v13) = 0;
LABEL_27:

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

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)productName
{
  return self->_productName;
}

- (BOOL)mirroringMode
{
  return self->_mirroringMode;
}

- (BOOL)hasMirroringMode
{
  return self->_hasMirroringMode;
}

- (void)setHasMirroringMode:(BOOL)a3
{
  self->_hasMirroringMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
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

    v4 = -[BMSpringBoardDisplayConnected initByReadFrom:]([BMSpringBoardDisplayConnected alloc], "initByReadFrom:", v7);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceName"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("productName"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mirroringMode"), 0, 0, 5, 12, 0);
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
  return &unk_1E5F1ABC0;
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceName"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueId"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("productName"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mirroringMode"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
