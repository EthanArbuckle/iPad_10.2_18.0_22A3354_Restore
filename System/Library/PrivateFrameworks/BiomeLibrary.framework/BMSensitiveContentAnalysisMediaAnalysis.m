@implementation BMSensitiveContentAnalysisMediaAnalysis

- (BMSensitiveContentAnalysisMediaAnalysis)initWithContentType:(int)a3 ageGroup:(int)a4 isSensitive:(int)a5 clientBundleID:(id)a6 trackingVersion:(id)a7
{
  id v13;
  id v14;
  BMSensitiveContentAnalysisMediaAnalysis *v15;
  objc_super v17;

  v13 = a6;
  v14 = a7;
  v17.receiver = self;
  v17.super_class = (Class)BMSensitiveContentAnalysisMediaAnalysis;
  v15 = -[BMEventBase init](&v17, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v15->_contentType = a3;
    v15->_ageGroup = a4;
    v15->_isSensitive = a5;
    objc_storeStrong((id *)&v15->_clientBundleID, a6);
    objc_storeStrong((id *)&v15->_trackingVersion, a7);
  }

  return v15;
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
  BMSensitiveContentAnalysisMediaAnalysisContentTypeAsString(-[BMSensitiveContentAnalysisMediaAnalysis contentType](self, "contentType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMSensitiveContentAnalysisMediaAnalysisAgeGroupAsString(-[BMSensitiveContentAnalysisMediaAnalysis ageGroup](self, "ageGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSensitiveContentAnalysisMediaAnalysisIsSensitiveAsString(-[BMSensitiveContentAnalysisMediaAnalysis isSensitive](self, "isSensitive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisMediaAnalysis clientBundleID](self, "clientBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisMediaAnalysis trackingVersion](self, "trackingVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSensitiveContentAnalysisMediaAnalysis with contentType: %@, ageGroup: %@, isSensitive: %@, clientBundleID: %@, trackingVersion: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSensitiveContentAnalysisMediaAnalysis *v5;
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
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  BMSensitiveContentAnalysisMediaAnalysis *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMSensitiveContentAnalysisMediaAnalysis;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_68;
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
              goto LABEL_47;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_49;
            }
          }
          v4[*v8] = 1;
LABEL_47:
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_49:
          if (v21 >= 3)
            LODWORD(v21) = 0;
          v38 = 20;
          goto LABEL_64;
        case 2u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          while (2)
          {
            v27 = *v6;
            v28 = *(_QWORD *)&v4[v27];
            if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
              *(_QWORD *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_55:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v38 = 24;
          goto LABEL_64;
        case 3u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          break;
        case 4u:
          PBReaderReadString();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = 32;
          goto LABEL_45;
        case 5u:
          PBReaderReadString();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = 40;
LABEL_45:
          v37 = *(Class *)((char *)&v5->super.super.isa + v36);
          *(Class *)((char *)&v5->super.super.isa + v36) = (Class)v35;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_67;
          continue;
      }
      while (1)
      {
        v32 = *v6;
        v33 = *(_QWORD *)&v4[v32];
        if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v7])
          break;
        v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
        *(_QWORD *)&v4[v32] = v33 + 1;
        v21 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0)
          goto LABEL_59;
        v30 += 7;
        v16 = v31++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8])
        LODWORD(v21) = 0;
LABEL_61:
      if (v21 >= 3)
        LODWORD(v21) = 0;
      v38 = 28;
LABEL_64:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_67:
    v39 = 0;
  else
LABEL_68:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_clientBundleID)
    PBDataWriterWriteStringField();
  if (self->_trackingVersion)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSensitiveContentAnalysisMediaAnalysis writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSensitiveContentAnalysisMediaAnalysis)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  BMSensitiveContentAnalysisMediaAnalysis *v15;
  BMSensitiveContentAnalysisMediaAnalysis *v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v36;
  void *v37;
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v16 = 0;
          v15 = self;
          goto LABEL_45;
        }
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("contentType"));
        v47[0] = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v16 = 0;
        *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v8);
        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisMediaAnalysisContentTypeFromString(v6));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v37 = v7;
  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ageGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v8;
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisMediaAnalysisAgeGroupFromString(v8));
        v36 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (a4)
      {
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v44 = *MEMORY[0x1E0CB2D50];
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("ageGroup"));
        v45 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        v16 = 0;
        *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v9);
        goto LABEL_58;
      }
      v36 = 0;
      v16 = 0;
LABEL_56:
      v15 = self;
      goto LABEL_44;
    }
  }
  v36 = 0;
LABEL_12:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isSensitive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v6;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v9;
LABEL_23:
        v10 = v11;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSensitiveContentAnalysisMediaAnalysisIsSensitiveFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (a4)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = a4;
        v30 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("isSensitive"));
        v43 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        v16 = 0;
        *v29 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v30, 2, v12);
        goto LABEL_53;
      }
      v10 = 0;
      v16 = 0;
LABEL_58:
      v15 = self;
      goto LABEL_43;
    }
  }
  v10 = 0;
LABEL_24:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientBundleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        goto LABEL_27;
      }
      if (a4)
      {
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v40 = *MEMORY[0x1E0CB2D50];
        v18 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientBundleID"));
        v41 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v17, 2, v14);
        v16 = 0;
        v13 = 0;
        *v18 = v19;
        goto LABEL_40;
      }
      v13 = 0;
      v16 = 0;
LABEL_53:
      v15 = self;
      goto LABEL_42;
    }
  }
  v13 = 0;
LABEL_27:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trackingVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a4 = v14;
        goto LABEL_30;
      }
      if (a4)
      {
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v38 = *MEMORY[0x1E0CB2D50];
        v20 = a4;
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("trackingVersion"));
        v39 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *v20 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v31, 2, v22);

        a4 = 0;
      }
      v16 = 0;
LABEL_40:
      v15 = self;
      goto LABEL_41;
    }
  }
  a4 = 0;
LABEL_30:
  v15 = -[BMSensitiveContentAnalysisMediaAnalysis initWithContentType:ageGroup:isSensitive:clientBundleID:trackingVersion:](self, "initWithContentType:ageGroup:isSensitive:clientBundleID:trackingVersion:", objc_msgSend(v37, "intValue"), objc_msgSend(v36, "intValue"), objc_msgSend(v10, "intValue"), v13, a4);
  v16 = v15;
LABEL_41:

LABEL_42:
  v6 = v34;
LABEL_43:

LABEL_44:
LABEL_45:

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisMediaAnalysis contentType](self, "contentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisMediaAnalysis ageGroup](self, "ageGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSensitiveContentAnalysisMediaAnalysis isSensitive](self, "isSensitive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisMediaAnalysis clientBundleID](self, "clientBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSensitiveContentAnalysisMediaAnalysis trackingVersion](self, "trackingVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("contentType");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("ageGroup");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("isSensitive");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("clientBundleID");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("trackingVersion");
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
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = -[BMSensitiveContentAnalysisMediaAnalysis contentType](self, "contentType");
  if (v6 != objc_msgSend(v5, "contentType"))
    goto LABEL_7;
  v7 = -[BMSensitiveContentAnalysisMediaAnalysis ageGroup](self, "ageGroup");
  if (v7 != objc_msgSend(v5, "ageGroup"))
    goto LABEL_7;
  v8 = -[BMSensitiveContentAnalysisMediaAnalysis isSensitive](self, "isSensitive");
  if (v8 != objc_msgSend(v5, "isSensitive"))
    goto LABEL_7;
  -[BMSensitiveContentAnalysisMediaAnalysis clientBundleID](self, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientBundleID");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v10)
  {

    goto LABEL_12;
  }
  v11 = (void *)v10;
  -[BMSensitiveContentAnalysisMediaAnalysis clientBundleID](self, "clientBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
LABEL_12:
    -[BMSensitiveContentAnalysisMediaAnalysis trackingVersion](self, "trackingVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackingVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v18)
    {
      v15 = 1;
    }
    else
    {
      -[BMSensitiveContentAnalysisMediaAnalysis trackingVersion](self, "trackingVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trackingVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v19, "isEqual:", v20);

    }
    goto LABEL_8;
  }
LABEL_7:
  v15 = 0;
LABEL_8:

LABEL_10:
  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (int)isSensitive
{
  return self->_isSensitive;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)trackingVersion
{
  return self->_trackingVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingVersion, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
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

    v4 = -[BMSensitiveContentAnalysisMediaAnalysis initByReadFrom:]([BMSensitiveContentAnalysisMediaAnalysis alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ageGroup"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSensitive"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientBundleID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("trackingVersion"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1BE68;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentType"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ageGroup"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSensitive"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientBundleID"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("trackingVersion"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
