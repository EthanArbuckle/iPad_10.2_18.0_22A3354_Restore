@implementation BMOSAnalyticsHighEngagementDevices

- (BMOSAnalyticsHighEngagementDevices)initWithTopCategory1:(id)a3 topCategory2:(id)a4 topCategory3:(id)a5 highEngagementCategory1:(id)a6 highEngagementCategory2:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMOSAnalyticsHighEngagementDevices *v17;
  id v19;
  objc_super v20;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMOSAnalyticsHighEngagementDevices;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_topCategory1, a3);
    objc_storeStrong((id *)&v17->_topCategory2, a4);
    objc_storeStrong((id *)&v17->_topCategory3, a5);
    objc_storeStrong((id *)&v17->_highEngagementCategory1, a6);
    objc_storeStrong((id *)&v17->_highEngagementCategory2, a7);
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
  -[BMOSAnalyticsHighEngagementDevices topCategory1](self, "topCategory1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices topCategory2](self, "topCategory2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices topCategory3](self, "topCategory3");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices highEngagementCategory1](self, "highEngagementCategory1");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices highEngagementCategory2](self, "highEngagementCategory2");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMOSAnalyticsHighEngagementDevices with topCategory1: %@, topCategory2: %@, topCategory3: %@, highEngagementCategory1: %@, highEngagementCategory2: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMOSAnalyticsHighEngagementDevices *v5;
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
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BMOSAnalyticsHighEngagementDevices *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMOSAnalyticsHighEngagementDevices;
  v5 = -[BMEventBase init](&v24, sel_init);
  if (!v5)
    goto LABEL_31;
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
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 24;
          goto LABEL_27;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_27;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_27;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_27;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
LABEL_27:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_30;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_30:
    v22 = 0;
  else
LABEL_31:
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_topCategory1)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_topCategory2)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_topCategory3)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_highEngagementCategory1)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_highEngagementCategory2)
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
  -[BMOSAnalyticsHighEngagementDevices writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMOSAnalyticsHighEngagementDevices)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  BMOSAnalyticsHighEngagementDevices *v16;
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
  BMOSAnalyticsHighEngagementDevices *v36;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topCategory1"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topCategory2"));
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
        v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("topCategory2"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topCategory3"));
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
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("topCategory3"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highEngagementCategory1"));
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
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("highEngagementCategory1"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highEngagementCategory2"));
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
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("highEngagementCategory2"));
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
    v16 = -[BMOSAnalyticsHighEngagementDevices initWithTopCategory1:topCategory2:topCategory3:highEngagementCategory1:highEngagementCategory2:](v36, "initWithTopCategory1:topCategory2:topCategory3:highEngagementCategory1:highEngagementCategory2:", v34, v37, v35, v13, v15);
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
  v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("topCategory1"));
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
  -[BMOSAnalyticsHighEngagementDevices topCategory1](self, "topCategory1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices topCategory2](self, "topCategory2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices topCategory3](self, "topCategory3");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices highEngagementCategory1](self, "highEngagementCategory1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMOSAnalyticsHighEngagementDevices highEngagementCategory2](self, "highEngagementCategory2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("topCategory1");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("topCategory2");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("topCategory3");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("highEngagementCategory1");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("highEngagementCategory2");
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
      goto LABEL_13;
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4)
      goto LABEL_15;
LABEL_20:

    if (v3)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v4)
    goto LABEL_20;
LABEL_15:
  if (!v3)
    goto LABEL_21;
LABEL_16:

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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMOSAnalyticsHighEngagementDevices topCategory1](self, "topCategory1");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topCategory1");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMOSAnalyticsHighEngagementDevices topCategory1](self, "topCategory1");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topCategory1");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMOSAnalyticsHighEngagementDevices topCategory2](self, "topCategory2");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topCategory2");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMOSAnalyticsHighEngagementDevices topCategory2](self, "topCategory2");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topCategory2");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMOSAnalyticsHighEngagementDevices topCategory3](self, "topCategory3");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topCategory3");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMOSAnalyticsHighEngagementDevices topCategory3](self, "topCategory3");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topCategory3");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMOSAnalyticsHighEngagementDevices highEngagementCategory1](self, "highEngagementCategory1");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highEngagementCategory1");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMOSAnalyticsHighEngagementDevices highEngagementCategory1](self, "highEngagementCategory1");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "highEngagementCategory1");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
      {
LABEL_17:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMOSAnalyticsHighEngagementDevices highEngagementCategory2](self, "highEngagementCategory2");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highEngagementCategory2");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMOSAnalyticsHighEngagementDevices highEngagementCategory2](self, "highEngagementCategory2");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "highEngagementCategory2");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v33, "isEqual:", v34);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)topCategory1
{
  return self->_topCategory1;
}

- (NSString)topCategory2
{
  return self->_topCategory2;
}

- (NSString)topCategory3
{
  return self->_topCategory3;
}

- (NSString)highEngagementCategory1
{
  return self->_highEngagementCategory1;
}

- (NSString)highEngagementCategory2
{
  return self->_highEngagementCategory2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highEngagementCategory2, 0);
  objc_storeStrong((id *)&self->_highEngagementCategory1, 0);
  objc_storeStrong((id *)&self->_topCategory3, 0);
  objc_storeStrong((id *)&self->_topCategory2, 0);
  objc_storeStrong((id *)&self->_topCategory1, 0);
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

    v4 = -[BMOSAnalyticsHighEngagementDevices initByReadFrom:]([BMOSAnalyticsHighEngagementDevices alloc], "initByReadFrom:", v7);
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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("topCategory1"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("topCategory2"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("topCategory3"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("highEngagementCategory1"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("highEngagementCategory2"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1A8C0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topCategory1"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topCategory2"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topCategory3"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("highEngagementCategory1"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("highEngagementCategory2"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
