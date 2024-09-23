@implementation BMMLSEShareSheetMetricsSystemResourceUsage

- (BMMLSEShareSheetMetricsSystemResourceUsage)initWithDuration:(id)a3 userType:(int)a4 timeoutOccured:(id)a5 identifier:(id)a6 subidentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMMLSEShareSheetMetricsSystemResourceUsage *v16;
  double v17;
  objc_super v19;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMMLSEShareSheetMetricsSystemResourceUsage;
  v16 = -[BMEventBase init](&v19, sel_init);
  if (v16)
  {
    v16->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v16->_hasDuration = 1;
      objc_msgSend(v12, "doubleValue");
    }
    else
    {
      v16->_hasDuration = 0;
      v17 = -1.0;
    }
    v16->_duration = v17;
    v16->_userType = a4;
    if (v13)
    {
      v16->_hasTimeoutOccured = 1;
      v16->_timeoutOccured = objc_msgSend(v13, "BOOLValue");
    }
    else
    {
      v16->_hasTimeoutOccured = 0;
      v16->_timeoutOccured = 0;
    }
    objc_storeStrong((id *)&v16->_identifier, a6);
    objc_storeStrong((id *)&v16->_subidentifier, a7);
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
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMLSEShareSheetMetricsSystemResourceUsage duration](self, "duration");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEShareSheetMetricsSystemResourceUsageUserTypeAsString(-[BMMLSEShareSheetMetricsSystemResourceUsage userType](self, "userType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEShareSheetMetricsSystemResourceUsage timeoutOccured](self, "timeoutOccured"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetMetricsSystemResourceUsage identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetMetricsSystemResourceUsage subidentifier](self, "subidentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEShareSheetMetricsSystemResourceUsage with duration: %@, userType: %@, timeoutOccured: %@, identifier: %@, subidentifier: %@"), v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEShareSheetMetricsSystemResourceUsage *v5;
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
  uint64_t v20;
  unint64_t v21;
  double v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  BMMLSEShareSheetMetricsSystemResourceUsage *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMMLSEShareSheetMetricsSystemResourceUsage;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
    goto LABEL_57;
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
          v5->_hasDuration = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0.0;
          }
          v5->_duration = v22;
          continue;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v25) = 0;
LABEL_45:
          if (v25 >= 7)
            LODWORD(v25) = 0;
          v5->_userType = v25;
          continue;
        case 3u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasTimeoutOccured = 1;
          break;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 40;
          goto LABEL_41;
        case 5u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 48;
LABEL_41:
          v39 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = (Class)v37;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_56;
          continue;
      }
      while (1)
      {
        v33 = *v6;
        v34 = *(_QWORD *)&v4[v33];
        v35 = v34 + 1;
        if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
        *(_QWORD *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0)
          goto LABEL_49;
        v30 += 7;
        v17 = v31++ >= 9;
        if (v17)
        {
          v32 = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8])
        v32 = 0;
LABEL_51:
      v5->_timeoutOccured = v32 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_56:
    v40 = 0;
  else
LABEL_57:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_hasDuration)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_hasTimeoutOccured)
    PBDataWriterWriteBOOLField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_subidentifier)
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
  -[BMMLSEShareSheetMetricsSystemResourceUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEShareSheetMetricsSystemResourceUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  id v11;
  id *v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  BMMLSEShareSheetMetricsSystemResourceUsage *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v23;
  uint64_t v24;
  id v25;
  id *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id *v37;
  id v38;
  id *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            goto LABEL_29;
          }
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = a4;
          v34 = *MEMORY[0x1E0D025B8];
          v49 = *MEMORY[0x1E0CB2D50];
          v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userType"));
          v50 = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v34, 2, v17);
          a4 = 0;
          v16 = 0;
          *v33 = v35;
LABEL_28:

LABEL_29:
          v7 = v40;
          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEShareSheetMetricsSystemResourceUsageUserTypeFromString(v9));
        v10 = (id *)objc_claimAutoreleasedReturnValue();
      }
      v39 = v10;
    }
    else
    {
      v39 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeoutOccured"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v8;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v42 = 0;
          v16 = 0;
          a4 = v39;
          goto LABEL_28;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v47 = *MEMORY[0x1E0CB2D50];
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timeoutOccured"));
        v48 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v18);
        v16 = 0;
        v42 = 0;
        v26 = a4;
        a4 = v39;
        *v26 = v25;
        goto LABEL_27;
      }
      v42 = v17;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v19 = 0;
          v16 = 0;
          a4 = v39;
          goto LABEL_27;
        }
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = a4;
        v28 = *MEMORY[0x1E0D025B8];
        v45 = *MEMORY[0x1E0CB2D50];
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v46 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v20);
        v16 = 0;
        v19 = 0;
        a4 = v39;
        *v37 = v29;
        goto LABEL_26;
      }
      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subidentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v43 = *MEMORY[0x1E0CB2D50];
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subidentifier"));
          v44 = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v36, 2, v31);

        }
        v21 = 0;
        v16 = 0;
        a4 = v39;
        goto LABEL_26;
      }
      v21 = v20;
    }
    else
    {
      v21 = 0;
    }
    a4 = v39;
    v16 = -[BMMLSEShareSheetMetricsSystemResourceUsage initWithDuration:userType:timeoutOccured:identifier:subidentifier:](self, "initWithDuration:userType:timeoutOccured:identifier:subidentifier:", v41, objc_msgSend(v39, "intValue"), v42, v19, v21);
    self = v16;
LABEL_26:

LABEL_27:
    v8 = v41;
    goto LABEL_28;
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
    v16 = 0;
    goto LABEL_31;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = a4;
  v13 = *MEMORY[0x1E0D025B8];
  v51 = *MEMORY[0x1E0CB2D50];
  v14 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("duration"));
  v52[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  a4 = v14;
  v8 = 0;
  v16 = 0;
  *v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v15, 2, v9);
LABEL_30:

LABEL_31:
  return v16;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  if (!-[BMMLSEShareSheetMetricsSystemResourceUsage hasDuration](self, "hasDuration")
    || (-[BMMLSEShareSheetMetricsSystemResourceUsage duration](self, "duration"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMMLSEShareSheetMetricsSystemResourceUsage duration](self, "duration");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMLSEShareSheetMetricsSystemResourceUsage duration](self, "duration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEShareSheetMetricsSystemResourceUsage userType](self, "userType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEShareSheetMetricsSystemResourceUsage hasTimeoutOccured](self, "hasTimeoutOccured"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEShareSheetMetricsSystemResourceUsage timeoutOccured](self, "timeoutOccured"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[BMMLSEShareSheetMetricsSystemResourceUsage identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetMetricsSystemResourceUsage subidentifier](self, "subidentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("duration");
  v10 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v24[0] = v10;
  v20 = CFSTR("userType");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v11;
  v21 = CFSTR("timeoutOccured");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[2] = v12;
  v22 = CFSTR("identifier");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v13;
  v23 = CFSTR("subidentifier");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v19, 5, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_20;
  }
  else
  {

    if (v8)
    {
LABEL_20:
      if (v7)
        goto LABEL_21;
      goto LABEL_26;
    }
  }

  if (v7)
  {
LABEL_21:
    if (v6)
      goto LABEL_22;
LABEL_27:

    if (v5)
      goto LABEL_23;
LABEL_28:

    goto LABEL_23;
  }
LABEL_26:

  if (!v6)
    goto LABEL_27;
LABEL_22:
  if (!v5)
    goto LABEL_28;
LABEL_23:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    goto LABEL_18;
  }
  v5 = v4;
  if (-[BMMLSEShareSheetMetricsSystemResourceUsage hasDuration](self, "hasDuration")
    || objc_msgSend(v5, "hasDuration"))
  {
    if (!-[BMMLSEShareSheetMetricsSystemResourceUsage hasDuration](self, "hasDuration"))
      goto LABEL_15;
    if (!objc_msgSend(v5, "hasDuration"))
      goto LABEL_15;
    -[BMMLSEShareSheetMetricsSystemResourceUsage duration](self, "duration");
    v7 = v6;
    objc_msgSend(v5, "duration");
    if (v7 != v8)
      goto LABEL_15;
  }
  v9 = -[BMMLSEShareSheetMetricsSystemResourceUsage userType](self, "userType");
  if (v9 != objc_msgSend(v5, "userType"))
    goto LABEL_15;
  if (-[BMMLSEShareSheetMetricsSystemResourceUsage hasTimeoutOccured](self, "hasTimeoutOccured")
    || objc_msgSend(v5, "hasTimeoutOccured"))
  {
    if (!-[BMMLSEShareSheetMetricsSystemResourceUsage hasTimeoutOccured](self, "hasTimeoutOccured"))
      goto LABEL_15;
    if (!objc_msgSend(v5, "hasTimeoutOccured"))
      goto LABEL_15;
    v10 = -[BMMLSEShareSheetMetricsSystemResourceUsage timeoutOccured](self, "timeoutOccured");
    if (v10 != objc_msgSend(v5, "timeoutOccured"))
      goto LABEL_15;
  }
  -[BMMLSEShareSheetMetricsSystemResourceUsage identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_20;
  }
  v13 = (void *)v12;
  -[BMMLSEShareSheetMetricsSystemResourceUsage identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
LABEL_20:
    -[BMMLSEShareSheetMetricsSystemResourceUsage subidentifier](self, "subidentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subidentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v17 = 1;
    }
    else
    {
      -[BMMLSEShareSheetMetricsSystemResourceUsage subidentifier](self, "subidentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subidentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_16;
  }
LABEL_15:
  v17 = 0;
LABEL_16:

LABEL_18:
  return v17;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (int)userType
{
  return self->_userType;
}

- (BOOL)timeoutOccured
{
  return self->_timeoutOccured;
}

- (BOOL)hasTimeoutOccured
{
  return self->_hasTimeoutOccured;
}

- (void)setHasTimeoutOccured:(BOOL)a3
{
  self->_hasTimeoutOccured = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subidentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMMLSEShareSheetMetricsSystemResourceUsage initByReadFrom:]([BMMLSEShareSheetMetricsSystemResourceUsage alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("duration"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeoutOccured"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subidentifier"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1F510;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("duration"), 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeoutOccured"), 3, 12, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subidentifier"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
