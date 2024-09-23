@implementation BMSafariWindowProxy

- (BMSafariWindowProxy)initWithDomain:(id)a3 openedDomain:(id)a4 visited:(id)a5 property:(int)a6 accessedPropertyDirectly:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSafariWindowProxy *v17;
  double v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSafariWindowProxy;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_domain, a3);
    objc_storeStrong((id *)&v17->_openedDomain, a4);
    if (v15)
    {
      v17->_hasRaw_visited = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_visited = 0;
      v18 = -1.0;
    }
    v17->_raw_visited = v18;
    v17->_property = a6;
    if (v16)
    {
      v17->_hasAccessedPropertyDirectly = 1;
      v17->_accessedPropertyDirectly = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v17->_hasAccessedPropertyDirectly = 0;
      v17->_accessedPropertyDirectly = 0;
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
  -[BMSafariWindowProxy domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariWindowProxy openedDomain](self, "openedDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariWindowProxy visited](self, "visited");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariWindowProxyPropertyAsString(-[BMSafariWindowProxy property](self, "property"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariWindowProxy accessedPropertyDirectly](self, "accessedPropertyDirectly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariWindowProxy with domain: %@, openedDomain: %@, visited: %@, property: %@, accessedPropertyDirectly: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariWindowProxy *v5;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  BMSafariWindowProxy *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMSafariWindowProxy;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
LABEL_24:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v5->_hasRaw_visited = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v25 = *(double *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v25 = 0.0;
          }
          v5->_raw_visited = v25;
          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v17 = v27++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v28) = 0;
LABEL_45:
          if (v28 >= 5)
            LODWORD(v28) = 0;
          v5->_property = v28;
          continue;
        case 5u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasAccessedPropertyDirectly = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_56;
          continue;
      }
      while (1)
      {
        v36 = *v6;
        v37 = *(_QWORD *)&v4[v36];
        v38 = v37 + 1;
        if (v37 == -1 || v38 > *(_QWORD *)&v4[*v7])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
        *(_QWORD *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0)
          goto LABEL_49;
        v33 += 7;
        v17 = v34++ >= 9;
        if (v17)
        {
          v35 = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8])
        v35 = 0;
LABEL_51:
      v5->_accessedPropertyDirectly = v35 != 0;
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
  id v4;

  v4 = a3;
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_openedDomain)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_visited)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_hasAccessedPropertyDirectly)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariWindowProxy writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariWindowProxy)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id *v15;
  id v16;
  uint64_t v17;
  BMSafariWindowProxy *v18;
  id v19;
  uint64_t v20;
  id *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  id *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
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
  void *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v42 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("openedDomain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v41 = 0;
          v18 = 0;
          goto LABEL_38;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = *MEMORY[0x1E0D025B8];
        v49 = *MEMORY[0x1E0CB2D50];
        v21 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("openedDomain"));
        v50 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v18 = 0;
        *v21 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
        goto LABEL_37;
      }
      v41 = v8;
    }
    else
    {
      v41 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visited"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = a4;
    v40 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (objc_class *)MEMORY[0x1E0C99D68];
        v11 = v9;
        v12 = [v10 alloc];
        objc_msgSend(v11, "doubleValue");
        v14 = v13;

        v15 = (id *)objc_msgSend(v12, "initWithTimeIntervalSince1970:", v14);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v22, "dateFromString:", v9);
          a4 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            goto LABEL_37;
          }
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v32 = *MEMORY[0x1E0D025B8];
          v47 = *MEMORY[0x1E0CB2D50];
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("visited"));
          v48 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 2, v23);
          v34 = a4;
          a4 = 0;
          v18 = 0;
          *v34 = v33;
LABEL_36:

          v7 = v40;
LABEL_37:

          goto LABEL_38;
        }
        v15 = v9;
      }
      a4 = v15;
    }
    else
    {
      a4 = 0;
    }
LABEL_23:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("property"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v39)
          {
            v24 = 0;
            v18 = 0;
            goto LABEL_36;
          }
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v45 = *MEMORY[0x1E0CB2D50];
          v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("property"));
          v46 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0;
          v18 = 0;
          *v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v36, 2, v26);
          goto LABEL_35;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariWindowProxyPropertyFromString(v23));
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = v25;
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessedPropertyDirectly"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v39)
        {
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = *MEMORY[0x1E0D025B8];
          v43 = *MEMORY[0x1E0CB2D50];
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("accessedPropertyDirectly"));
          v44 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *v39 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v35, 2, v30);

        }
        v27 = 0;
        v18 = 0;
        goto LABEL_35;
      }
      v27 = v26;
    }
    else
    {
      v27 = 0;
    }
    v18 = -[BMSafariWindowProxy initWithDomain:openedDomain:visited:property:accessedPropertyDirectly:](self, "initWithDomain:openedDomain:visited:property:accessedPropertyDirectly:", v42, v41, a4, objc_msgSend(v24, "intValue"), v27);
    self = v18;
LABEL_35:

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v42 = 0;
    v18 = 0;
    goto LABEL_39;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v51 = *MEMORY[0x1E0CB2D50];
  v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domain"));
  v52[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v18 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v8);
LABEL_38:

LABEL_39:
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
  -[BMSafariWindowProxy domain](self, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariWindowProxy openedDomain](self, "openedDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariWindowProxy visited](self, "visited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSafariWindowProxy visited](self, "visited");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariWindowProxy property](self, "property"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSafariWindowProxy hasAccessedPropertyDirectly](self, "hasAccessedPropertyDirectly"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariWindowProxy accessedPropertyDirectly](self, "accessedPropertyDirectly"));
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
  v21 = CFSTR("openedDomain");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v12;
  v22 = CFSTR("visited");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v13;
  v23 = CFSTR("property");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v14;
  v24 = CFSTR("accessedPropertyDirectly");
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  _BOOL4 v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariWindowProxy domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariWindowProxy domain](self, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMSafariWindowProxy openedDomain](self, "openedDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openedDomain");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariWindowProxy openedDomain](self, "openedDomain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "openedDomain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMSafariWindowProxy visited](self, "visited");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visited");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSafariWindowProxy visited](self, "visited");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visited");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    v25 = -[BMSafariWindowProxy property](self, "property");
    if (v25 == objc_msgSend(v5, "property"))
    {
      if (!-[BMSafariWindowProxy hasAccessedPropertyDirectly](self, "hasAccessedPropertyDirectly")
        && !objc_msgSend(v5, "hasAccessedPropertyDirectly"))
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if (-[BMSafariWindowProxy hasAccessedPropertyDirectly](self, "hasAccessedPropertyDirectly")
        && objc_msgSend(v5, "hasAccessedPropertyDirectly"))
      {
        v26 = -[BMSafariWindowProxy accessedPropertyDirectly](self, "accessedPropertyDirectly");
        v12 = v26 ^ objc_msgSend(v5, "accessedPropertyDirectly") ^ 1;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_23:

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

- (NSString)openedDomain
{
  return self->_openedDomain;
}

- (int)property
{
  return self->_property;
}

- (BOOL)accessedPropertyDirectly
{
  return self->_accessedPropertyDirectly;
}

- (BOOL)hasAccessedPropertyDirectly
{
  return self->_hasAccessedPropertyDirectly;
}

- (void)setHasAccessedPropertyDirectly:(BOOL)a3
{
  self->_hasAccessedPropertyDirectly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openedDomain, 0);
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

    v4 = -[BMSafariWindowProxy initByReadFrom:]([BMSafariWindowProxy alloc], "initByReadFrom:", v7);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("openedDomain"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visited"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("property"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accessedPropertyDirectly"), 0, 0, 5, 12, 0);
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
  return &unk_1E5F1B850;
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("openedDomain"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visited"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("property"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accessedPropertyDirectly"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
