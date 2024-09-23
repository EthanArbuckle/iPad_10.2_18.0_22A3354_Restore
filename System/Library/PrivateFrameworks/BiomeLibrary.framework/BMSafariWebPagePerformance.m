@implementation BMSafariWebPagePerformance

- (BMSafariWebPagePerformance)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 performanceEvent:(int)a6
{
  return -[BMSafariWebPagePerformance initWithDomain:visited:platform:performanceEvent:privacyProxy:](self, "initWithDomain:visited:platform:performanceEvent:privacyProxy:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, &unk_1E5F20398);
}

- (BMSafariWebPagePerformance)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 performanceEvent:(int)a6 privacyProxy:(id)a7
{
  id v13;
  id v14;
  id v15;
  BMSafariWebPagePerformance *v16;
  double v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSafariWebPagePerformance;
  v16 = -[BMEventBase init](&v19, sel_init);
  if (v16)
  {
    v16->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v16->_domain, a3);
    if (v14)
    {
      v16->_hasRaw_visited = 1;
      objc_msgSend(v14, "timeIntervalSince1970");
    }
    else
    {
      v16->_hasRaw_visited = 0;
      v17 = -1.0;
    }
    v16->_raw_visited = v17;
    v16->_platform = a5;
    v16->_performanceEvent = a6;
    if (v15)
    {
      v16->_hasPrivacyProxy = 1;
      v16->_privacyProxy = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v16->_hasPrivacyProxy = 0;
      v16->_privacyProxy = 0;
    }
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
  -[BMSafariWebPagePerformance domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariWebPagePerformance visited](self, "visited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariWebPagePerformancePlatformAsString(-[BMSafariWebPagePerformance platform](self, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariWebPagePerformanceWebPerformanceEventAsString(-[BMSafariWebPagePerformance performanceEvent](self, "performanceEvent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariWebPagePerformance privacyProxy](self, "privacyProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariWebPagePerformance with domain: %@, visited: %@, platform: %@, performanceEvent: %@, privacyProxy: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariWebPagePerformance *v5;
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
  NSString *domain;
  uint64_t v22;
  unint64_t v23;
  double v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  BMSafariWebPagePerformance *v46;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMSafariWebPagePerformance;
  v5 = -[BMEventBase init](&v48, sel_init);
  if (!v5)
    goto LABEL_69;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          domain = v5->_domain;
          v5->_domain = (NSString *)v20;

          continue;
        case 2u:
          v5->_hasRaw_visited = 1;
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(double *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0.0;
          }
          v5->_raw_visited = v24;
          continue;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (1)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
              break;
            v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
            *(_QWORD *)&v4[v28] = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if ((v31 & 0x80) == 0)
              goto LABEL_48;
            v25 += 7;
            v17 = v26++ >= 9;
            if (v17)
            {
              LODWORD(v27) = 0;
              goto LABEL_50;
            }
          }
          v4[*v8] = 1;
LABEL_48:
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_50:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v45 = 40;
          goto LABEL_59;
        case 4u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_56:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v45 = 44;
LABEL_59:
          *(_DWORD *)((char *)&v5->super.super.isa + v45) = v27;
          continue;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasPrivacyProxy = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_68;
          continue;
      }
      while (1)
      {
        v41 = *v6;
        v42 = *(_QWORD *)&v4[v41];
        v43 = v42 + 1;
        if (v42 == -1 || v43 > *(_QWORD *)&v4[*v7])
          break;
        v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
        *(_QWORD *)&v4[v41] = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0)
          goto LABEL_61;
        v38 += 7;
        v17 = v39++ >= 9;
        if (v17)
        {
          v40 = 0;
          goto LABEL_63;
        }
      }
      v4[*v8] = 1;
LABEL_61:
      if (v4[*v8])
        v40 = 0;
LABEL_63:
      v5->_privacyProxy = v40 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_68:
    v46 = 0;
  else
LABEL_69:
    v46 = v5;

  return v46;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_visited)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasPrivacyProxy)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariWebPagePerformance writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariWebPagePerformance)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id *v14;
  id v15;
  uint64_t v16;
  id *v17;
  BMSafariWebPagePerformance *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visited"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (objc_class *)MEMORY[0x1E0C99D68];
        v10 = v8;
        v11 = [v9 alloc];
        objc_msgSend(v10, "doubleValue");
        v13 = v12;

        v14 = (id *)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v19, "dateFromString:", v8);
          v38 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            goto LABEL_39;
          }
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = *MEMORY[0x1E0D025B8];
          v48 = *MEMORY[0x1E0CB2D50];
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("visited"));
          v49 = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v20);
          a4 = 0;
          goto LABEL_38;
        }
        v14 = v8;
      }
      v38 = v14;
    }
    else
    {
      v38 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("platform"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v7;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v40 = 0;
            v18 = 0;
            a4 = v38;
            goto LABEL_38;
          }
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v31 = *MEMORY[0x1E0D025B8];
          v46 = *MEMORY[0x1E0CB2D50];
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("platform"));
          v47 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          v18 = 0;
          *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v22);
          goto LABEL_58;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariWebPagePerformancePlatformFromString(v20));
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v40 = v21;
    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("performanceEvent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = 0;
      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v22;
LABEL_31:
      v23 = v24;
LABEL_32:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("privacyProxy"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v26 = 0;
LABEL_35:
        a4 = v38;
        v18 = -[BMSafariWebPagePerformance initWithDomain:visited:platform:performanceEvent:privacyProxy:](self, "initWithDomain:visited:platform:performanceEvent:privacyProxy:", v41, v38, objc_msgSend(v40, "intValue"), objc_msgSend(v23, "intValue"), v26);
        self = v18;
LABEL_36:

LABEL_37:
        v7 = v39;
LABEL_38:

        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v25;
        goto LABEL_35;
      }
      if (a4)
      {
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("privacyProxy"));
        v43 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v34, 2, v29);

      }
      v26 = 0;
      v18 = 0;
LABEL_53:
      a4 = v38;
      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariWebPagePerformanceWebPerformanceEventFromString(v22));
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    if (a4)
    {
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0D025B8];
      v44 = *MEMORY[0x1E0CB2D50];
      v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("performanceEvent"));
      v45 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v18 = 0;
      *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v35, 2, v25);
      goto LABEL_53;
    }
    v23 = 0;
    v18 = 0;
LABEL_58:
    a4 = v38;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v41 = 0;
    v18 = 0;
    goto LABEL_40;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v50 = *MEMORY[0x1E0CB2D50];
  v17 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domain"));
  v51[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v18 = 0;
  *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v8);
  a4 = v17;
LABEL_39:

LABEL_40:
  return v18;
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[BMSafariWebPagePerformance domain](self, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariWebPagePerformance visited](self, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSafariWebPagePerformance visited](self, "visited");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariWebPagePerformance platform](self, "platform"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariWebPagePerformance performanceEvent](self, "performanceEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSafariWebPagePerformance hasPrivacyProxy](self, "hasPrivacyProxy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariWebPagePerformance privacyProxy](self, "privacyProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v20 = CFSTR("domain");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v11;
  v25[0] = v11;
  v21 = CFSTR("visited");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v12;
  v22 = CFSTR("platform");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v13;
  v23 = CFSTR("performanceEvent");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v14;
  v24 = CFSTR("privacyProxy");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_19;
  }
  else
  {

    if (v9)
    {
LABEL_19:
      if (v8)
        goto LABEL_20;
      goto LABEL_25;
    }
  }

  if (v8)
  {
LABEL_20:
    if (v7)
      goto LABEL_21;
LABEL_26:

    if (v3)
      goto LABEL_22;
LABEL_27:

    goto LABEL_22;
  }
LABEL_25:

  if (!v7)
    goto LABEL_26;
LABEL_21:
  if (!v3)
    goto LABEL_27;
LABEL_22:

  return v16;
}

- (NSDate)visited
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_visited)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_visited);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  _BOOL4 v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariWebPagePerformance domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariWebPagePerformance domain](self, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_18;
    }
    -[BMSafariWebPagePerformance visited](self, "visited");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visited");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariWebPagePerformance visited](self, "visited");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visited");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_18;
    }
    v19 = -[BMSafariWebPagePerformance platform](self, "platform");
    if (v19 == objc_msgSend(v5, "platform"))
    {
      v20 = -[BMSafariWebPagePerformance performanceEvent](self, "performanceEvent");
      if (v20 == objc_msgSend(v5, "performanceEvent"))
      {
        if (!-[BMSafariWebPagePerformance hasPrivacyProxy](self, "hasPrivacyProxy")
          && !objc_msgSend(v5, "hasPrivacyProxy"))
        {
          LOBYTE(v12) = 1;
          goto LABEL_19;
        }
        if (-[BMSafariWebPagePerformance hasPrivacyProxy](self, "hasPrivacyProxy")
          && objc_msgSend(v5, "hasPrivacyProxy"))
        {
          v21 = -[BMSafariWebPagePerformance privacyProxy](self, "privacyProxy");
          v12 = v21 ^ objc_msgSend(v5, "privacyProxy") ^ 1;
LABEL_19:

          goto LABEL_20;
        }
      }
    }
LABEL_18:
    LOBYTE(v12) = 0;
    goto LABEL_19;
  }
  LOBYTE(v12) = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)domain
{
  return self->_domain;
}

- (int)platform
{
  return self->_platform;
}

- (int)performanceEvent
{
  return self->_performanceEvent;
}

- (BOOL)privacyProxy
{
  return self->_privacyProxy;
}

- (BOOL)hasPrivacyProxy
{
  return self->_hasPrivacyProxy;
}

- (void)setHasPrivacyProxy:(BOOL)a3
{
  self->_hasPrivacyProxy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
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

    v4 = -[BMSafariWebPagePerformance initByReadFrom:]([BMSafariWebPagePerformance alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visited"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("platform"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("performanceEvent"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("privacyProxy"), 0, 0, 5, 12, 0);
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
  return &unk_1E5F1EE80;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visited"), 2, 0, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("platform"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("performanceEvent"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("privacyProxy"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
