@implementation BMSiriTaskAggregationDimensions

- (BMSiriTaskAggregationDimensions)initWithProductArea:(int)a3 siriInputLocale:(id)a4 systemLocale:(id)a5 countryCode:(id)a6 deviceType:(id)a7 systemBuild:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMSiriTaskAggregationDimensions *v18;
  id v20;
  id v21;
  objc_super v22;

  v21 = a4;
  v20 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMSiriTaskAggregationDimensions;
  v18 = -[BMEventBase init](&v22, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v20, v21);
    v18->_productArea = a3;
    objc_storeStrong((id *)&v18->_siriInputLocale, a4);
    objc_storeStrong((id *)&v18->_systemLocale, a5);
    objc_storeStrong((id *)&v18->_countryCode, a6);
    objc_storeStrong((id *)&v18->_deviceType, a7);
    objc_storeStrong((id *)&v18->_systemBuild, a8);
  }

  return v18;
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
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSiriTaskAggregationDimensionsSiriProductAreaAsString(-[BMSiriTaskAggregationDimensions productArea](self, "productArea"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions siriInputLocale](self, "siriInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions systemLocale](self, "systemLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions countryCode](self, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions deviceType](self, "deviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions systemBuild](self, "systemBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriTaskAggregationDimensions with productArea: %@, siriInputLocale: %@, systemLocale: %@, countryCode: %@, deviceType: %@, systemBuild: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriTaskAggregationDimensions *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BMSiriTaskAggregationDimensions *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriTaskAggregationDimensions;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
    goto LABEL_45;
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
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          break;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 24;
          goto LABEL_34;
        case 3u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 32;
          goto LABEL_34;
        case 4u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 40;
          goto LABEL_34;
        case 5u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 48;
          goto LABEL_34;
        case 6u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 56;
LABEL_34:
          v29 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_44;
          continue;
      }
      while (1)
      {
        v23 = *v6;
        v24 = *(_QWORD *)&v4[v23];
        v25 = v24 + 1;
        if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
          break;
        v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
        *(_QWORD *)&v4[v23] = v25;
        v22 |= (unint64_t)(v26 & 0x7F) << v20;
        if ((v26 & 0x80) == 0)
          goto LABEL_38;
        v20 += 7;
        v17 = v21++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_40:
      if (v22 >= 4)
        LODWORD(v22) = 0;
      v5->_productArea = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_44:
    v30 = 0;
  else
LABEL_45:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_siriInputLocale)
    PBDataWriterWriteStringField();
  if (self->_systemLocale)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_systemBuild)
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
  -[BMSiriTaskAggregationDimensions writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriTaskAggregationDimensions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  BMSiriTaskAggregationDimensions *v18;
  id v19;
  void *v20;
  id v21;
  BMSiriTaskAggregationDimensions *v22;
  void *v23;
  id v24;
  id *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productArea"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriInputLocale"));
    v10 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v10;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v22 = 0;
          goto LABEL_53;
        }
        v23 = v8;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = a4;
        v26 = *MEMORY[0x1E0D025B8];
        v63 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("siriInputLocale"));
        v64 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v24;
        v8 = v23;
        v22 = 0;
        *v25 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v26, 2, v13);
        v12 = 0;
        goto LABEL_52;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemLocale"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v12;
    v51 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v14 = 0;
          v22 = 0;
          goto LABEL_52;
        }
        v28 = v8;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = a4;
        v31 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("systemLocale"));
        v62 = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v29;
        v8 = v28;
        v22 = 0;
        v14 = 0;
        *v30 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v31, 2, v15);
        goto LABEL_58;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v8;
    v16 = a4;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v54 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = v15;
LABEL_18:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v14;
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v18 = self;
        v19 = 0;
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = self;
        v19 = v17;
LABEL_21:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemBuild"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v21 = 0;
LABEL_24:
          v12 = v50;
          v22 = -[BMSiriTaskAggregationDimensions initWithProductArea:siriInputLocale:systemLocale:countryCode:deviceType:systemBuild:](v18, "initWithProductArea:siriInputLocale:systemLocale:countryCode:deviceType:systemBuild:", objc_msgSend(v52, "intValue"), v50, v49, v54, v19, v21);
          v18 = v22;
LABEL_49:

          self = v18;
          v14 = v49;
LABEL_50:

          v8 = v52;
LABEL_51:

          v7 = v51;
LABEL_52:

          v11 = v53;
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v20;
          goto LABEL_24;
        }
        if (v16)
        {
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v46 = *MEMORY[0x1E0D025B8];
          v55 = *MEMORY[0x1E0CB2D50];
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("systemBuild"));
          v56 = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *v16 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v46, 2, v44);

        }
        v21 = 0;
        v22 = 0;
LABEL_48:
        v12 = v50;
        goto LABEL_49;
      }
      if (v16)
      {
        v18 = self;
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceType"));
        v58 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v37, 2, v20);
        v22 = 0;
        v19 = 0;
        *v16 = v38;
        goto LABEL_48;
      }
      v19 = 0;
      v22 = 0;
LABEL_60:
      v12 = v50;
      goto LABEL_50;
    }
    if (a4)
    {
      v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = v14;
      v35 = *MEMORY[0x1E0D025B8];
      v59 = *MEMORY[0x1E0CB2D50];
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
      v60 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      v14 = v34;
      v22 = 0;
      v54 = 0;
      *v16 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v36, 2, v17);
      goto LABEL_60;
    }
    v54 = 0;
    v22 = 0;
LABEL_58:
    v12 = v50;
    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriTaskAggregationDimensionsSiriProductAreaFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v22 = 0;
    goto LABEL_54;
  }
  v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v40 = a4;
  v41 = *MEMORY[0x1E0D025B8];
  v65 = *MEMORY[0x1E0CB2D50];
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("productArea"));
  v66[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v41, 2, v11);
  v8 = 0;
  v22 = 0;
  *v40 = v42;
LABEL_53:

LABEL_54:
  return v22;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriTaskAggregationDimensions productArea](self, "productArea"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions siriInputLocale](self, "siriInputLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions systemLocale](self, "systemLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions countryCode](self, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions deviceType](self, "deviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregationDimensions systemBuild](self, "systemBuild");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("productArea");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = CFSTR("siriInputLocale");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("systemLocale");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("countryCode");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("deviceType");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("systemBuild");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_15;
LABEL_21:

    if (v6)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v7)
    goto LABEL_21;
LABEL_15:
  if (v6)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v5)
  {
    if (v4)
      goto LABEL_18;
LABEL_24:

    if (v20)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v4)
    goto LABEL_24;
LABEL_18:
  if (!v20)
    goto LABEL_25;
LABEL_19:

  return v15;
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
  char v13;
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
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSiriTaskAggregationDimensions productArea](self, "productArea");
    if (v6 == objc_msgSend(v5, "productArea"))
    {
      -[BMSiriTaskAggregationDimensions siriInputLocale](self, "siriInputLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "siriInputLocale");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMSiriTaskAggregationDimensions siriInputLocale](self, "siriInputLocale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "siriInputLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_18;
      }
      -[BMSiriTaskAggregationDimensions systemLocale](self, "systemLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemLocale");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMSiriTaskAggregationDimensions systemLocale](self, "systemLocale");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "systemLocale");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_18;
      }
      -[BMSiriTaskAggregationDimensions countryCode](self, "countryCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMSiriTaskAggregationDimensions countryCode](self, "countryCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "countryCode");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_18;
      }
      -[BMSiriTaskAggregationDimensions deviceType](self, "deviceType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceType");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMSiriTaskAggregationDimensions deviceType](self, "deviceType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deviceType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_18;
      }
      -[BMSiriTaskAggregationDimensions systemBuild](self, "systemBuild");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemBuild");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 == v34)
      {
        v13 = 1;
      }
      else
      {
        -[BMSiriTaskAggregationDimensions systemBuild](self, "systemBuild");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "systemBuild");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v35, "isEqual:", v36);

      }
      goto LABEL_19;
    }
LABEL_18:
    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)productArea
{
  return self->_productArea;
}

- (NSString)siriInputLocale
{
  return self->_siriInputLocale;
}

- (NSString)systemLocale
{
  return self->_systemLocale;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
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

    v4 = -[BMSiriTaskAggregationDimensions initByReadFrom:]([BMSiriTaskAggregationDimensions alloc], "initByReadFrom:", v7);
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
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("productArea"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("siriInputLocale"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("systemLocale"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceType"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("systemBuild"), 2, 0, 6, 13, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F090;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("productArea"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("siriInputLocale"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("systemLocale"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceType"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("systemBuild"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
