@implementation BMSafariNavigations

- (BMSafariNavigations)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 userAgent:(int)a6 countryCode:(id)a7 privacyProxy:(id)a8 error:(int)a9
{
  uint64_t v10;

  LODWORD(v10) = a9;
  return -[BMSafariNavigations initWithDomain:visited:platform:userAgent:countryCode:privacyProxy:error:url:](self, "initWithDomain:visited:platform:userAgent:countryCode:privacyProxy:error:url:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8, v10, 0);
}

- (BMSafariNavigations)initWithDomain:(id)a3 visited:(id)a4 platform:(int)a5 userAgent:(int)a6 countryCode:(id)a7 privacyProxy:(id)a8 error:(int)a9 url:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  BMSafariNavigations *v21;
  double v22;
  id v24;
  objc_super v25;

  v24 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMSafariNavigations;
  v21 = -[BMEventBase init](&v25, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v21->_domain, a3);
    if (v17)
    {
      v21->_hasRaw_visited = 1;
      objc_msgSend(v17, "timeIntervalSince1970");
    }
    else
    {
      v21->_hasRaw_visited = 0;
      v22 = -1.0;
    }
    v21->_raw_visited = v22;
    v21->_platform = a5;
    v21->_userAgent = a6;
    objc_storeStrong((id *)&v21->_countryCode, a7);
    if (v19)
    {
      v21->_hasPrivacyProxy = 1;
      v21->_privacyProxy = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v21->_hasPrivacyProxy = 0;
      v21->_privacyProxy = 0;
    }
    v21->_error = a9;
    objc_storeStrong((id *)&v21->_url, a10);
  }

  return v21;
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
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSafariNavigations domain](self, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariNavigations visited](self, "visited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariNavigationsPlatformAsString(-[BMSafariNavigations platform](self, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariNavigationsDeviceClassAsString(-[BMSafariNavigations userAgent](self, "userAgent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariNavigations countryCode](self, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariNavigations privacyProxy](self, "privacyProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariNavigationsErrorResponseAsString(-[BMSafariNavigations error](self, "error"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariNavigations url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariNavigations with domain: %@, visited: %@, platform: %@, userAgent: %@, countryCode: %@, privacyProxy: %@, error: %@, url: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariNavigations *v5;
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
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  void *v51;
  uint64_t v52;
  BMSafariNavigations *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMSafariNavigations;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_85;
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
          v21 = 56;
          goto LABEL_56;
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
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v17 = v26++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_60:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v52 = 40;
          goto LABEL_79;
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
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_66:
          if (v27 >= 3)
            LODWORD(v27) = 0;
          v52 = 44;
          goto LABEL_79;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_56;
        case 6u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasPrivacyProxy = 1;
          while (2)
          {
            v41 = *v6;
            v42 = *(_QWORD *)&v4[v41];
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
              *(_QWORD *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                v17 = v39++ >= 9;
                if (v17)
                {
                  v40 = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v40 = 0;
LABEL_72:
          v5->_privacyProxy = v40 != 0;
          continue;
        case 7u:
          v45 = 0;
          v46 = 0;
          v27 = 0;
          break;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
LABEL_56:
          v51 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_84;
          continue;
      }
      while (1)
      {
        v47 = *v6;
        v48 = *(_QWORD *)&v4[v47];
        v49 = v48 + 1;
        if (v48 == -1 || v49 > *(_QWORD *)&v4[*v7])
          break;
        v50 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
        *(_QWORD *)&v4[v47] = v49;
        v27 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
          goto LABEL_74;
        v45 += 7;
        v17 = v46++ >= 9;
        if (v17)
        {
          LODWORD(v27) = 0;
          goto LABEL_76;
        }
      }
      v4[*v8] = 1;
LABEL_74:
      if (v4[*v8])
        LODWORD(v27) = 0;
LABEL_76:
      if (v27 >= 0x26)
        LODWORD(v27) = 0;
      v52 = 48;
LABEL_79:
      *(_DWORD *)((char *)&v5->super.super.isa + v52) = v27;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_84:
    v53 = 0;
  else
LABEL_85:
    v53 = v5;

  return v53;
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
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_hasPrivacyProxy)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_url)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariNavigations writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariNavigations)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BMSafariNavigations *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  BMSafariNavigations *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  id *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visited"));
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

        v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v20, "dateFromString:", v8);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v74 = 0;
            v19 = 0;
            goto LABEL_64;
          }
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = v8;
          v57 = *MEMORY[0x1E0D025B8];
          v87 = *MEMORY[0x1E0CB2D50];
          v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("visited"));
          v88 = v73;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = v57;
          v8 = v56;
          v69 = (void *)v58;
          v74 = 0;
          v19 = 0;
          *a4 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v59, 2);
          goto LABEL_63;
        }
        v14 = v8;
      }
      v74 = v14;
    }
    else
    {
      v74 = 0;
    }
LABEL_16:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("platform"));
    v21 = objc_claimAutoreleasedReturnValue();
    v69 = (void *)v21;
    v67 = v8;
    if (v21 && (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v73 = 0;
            v19 = 0;
            goto LABEL_63;
          }
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v85 = *MEMORY[0x1E0CB2D50];
          v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("platform"));
          v86 = v72;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = 0;
          v19 = 0;
          *a4 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v24);
LABEL_62:

          v8 = v67;
LABEL_63:

          goto LABEL_64;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariNavigationsPlatformFromString(v22));
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v73 = v23;
    }
    else
    {
      v73 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userAgent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v24;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v72 = 0;
            v19 = 0;
            goto LABEL_62;
          }
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v50 = v24;
          v51 = *MEMORY[0x1E0D025B8];
          v83 = *MEMORY[0x1E0CB2D50];
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userAgent"));
          v84 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          v24 = v50;
          v72 = 0;
          v19 = 0;
          *a4 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v52, 2, v26);
          goto LABEL_61;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariNavigationsDeviceClassFromString(v24));
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v72 = v25;
    }
    else
    {
      v72 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v7;
    v66 = v24;
    if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          v19 = 0;
          goto LABEL_61;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v81 = *MEMORY[0x1E0CB2D50];
        v70 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
        v82 = v70;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        v24 = v66;
        v35 = 0;
        v19 = 0;
        *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v34, 2, v27);
LABEL_60:

        v7 = v71;
LABEL_61:

        goto LABEL_62;
      }
      v65 = v26;
    }
    else
    {
      v65 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("privacyProxy"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v6;
    if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v70 = 0;
          v19 = 0;
          v35 = v65;
          goto LABEL_60;
        }
        v28 = self;
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v79 = *MEMORY[0x1E0CB2D50];
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("privacyProxy"));
        v80 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v29);
        v70 = 0;
        v19 = 0;
        *a4 = v38;
        goto LABEL_88;
      }
      v28 = self;
      v70 = v27;
    }
    else
    {
      v28 = self;
      v70 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v30 = 0;
      goto LABEL_54;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v29;
LABEL_53:
      v30 = v31;
LABEL_54:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v40 = 0;
LABEL_57:
        v41 = objc_msgSend(v73, "intValue");
        v42 = objc_msgSend(v72, "intValue");
        LODWORD(v60) = objc_msgSend(v30, "intValue");
        v43 = v42;
        v35 = v65;
        v19 = -[BMSafariNavigations initWithDomain:visited:platform:userAgent:countryCode:privacyProxy:error:url:](v28, "initWithDomain:visited:platform:userAgent:countryCode:privacyProxy:error:url:", v71, v74, v41, v43, v65, v70, v60, v40);
        v28 = v19;
LABEL_58:

LABEL_59:
        self = v28;
        v6 = v64;
        v24 = v66;
        goto LABEL_60;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v39;
        goto LABEL_57;
      }
      v40 = a4;
      if (a4)
      {
        v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v61 = *MEMORY[0x1E0D025B8];
        v75 = *MEMORY[0x1E0CB2D50];
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("url"));
        v76 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v61, 2, v46);

        v40 = 0;
      }
      v19 = 0;
LABEL_81:
      v35 = v65;
      goto LABEL_58;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariNavigationsErrorResponseFromString(v29));
      v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    if (a4)
    {
      v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0D025B8];
      v77 = *MEMORY[0x1E0CB2D50];
      v40 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("error"));
      v78 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v53, 2, v39);
      v30 = 0;
      v19 = 0;
      *a4 = v54;
      goto LABEL_81;
    }
    v30 = 0;
    v19 = 0;
LABEL_88:
    v35 = v65;
    goto LABEL_59;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v7 = 0;
    v19 = 0;
    goto LABEL_65;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v89 = *MEMORY[0x1E0CB2D50];
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domain"));
  v90[0] = v74;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v8 = (void *)v17;
  v7 = 0;
  v19 = 0;
  *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v18, 2, v17);
LABEL_64:

LABEL_65:
  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[8];
  _QWORD v31[10];

  v31[8] = *MEMORY[0x1E0C80C00];
  -[BMSafariNavigations domain](self, "domain");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSafariNavigations visited](self, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSafariNavigations visited](self, "visited");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariNavigations platform](self, "platform"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariNavigations userAgent](self, "userAgent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariNavigations countryCode](self, "countryCode");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSafariNavigations hasPrivacyProxy](self, "hasPrivacyProxy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariNavigations privacyProxy](self, "privacyProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariNavigations error](self, "error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariNavigations url](self, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("domain");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v13;
  v31[0] = v13;
  v30[1] = CFSTR("visited");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v14;
  v31[1] = v14;
  v30[2] = CFSTR("platform");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v15;
  v31[2] = v15;
  v30[3] = CFSTR("userAgent");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v3;
  v31[3] = v16;
  v30[4] = CFSTR("countryCode");
  v17 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v7;
  v27 = (void *)v8;
  v31[4] = v17;
  v30[5] = CFSTR("privacyProxy");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = v18;
  v30[6] = CFSTR("error");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[6] = v19;
  v30[7] = CFSTR("url");
  v20 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[7] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_25;
  }
  else
  {

    if (v11)
      goto LABEL_25;
  }

LABEL_25:
  if (!v10)

  if (!v29)
  if (v9)
  {
    if (v27)
      goto LABEL_31;
  }
  else
  {

    if (v27)
    {
LABEL_31:
      if (v26)
        goto LABEL_32;
LABEL_38:

      if (v28)
        goto LABEL_33;
LABEL_39:

      goto LABEL_33;
    }
  }

  if (!v26)
    goto LABEL_38;
LABEL_32:
  if (!v28)
    goto LABEL_39;
LABEL_33:

  return v21;
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
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariNavigations domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariNavigations domain](self, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_25;
    }
    -[BMSafariNavigations visited](self, "visited");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visited");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariNavigations visited](self, "visited");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visited");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_25;
    }
    v19 = -[BMSafariNavigations platform](self, "platform");
    if (v19 != objc_msgSend(v5, "platform"))
      goto LABEL_25;
    v20 = -[BMSafariNavigations userAgent](self, "userAgent");
    if (v20 != objc_msgSend(v5, "userAgent"))
      goto LABEL_25;
    -[BMSafariNavigations countryCode](self, "countryCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[BMSafariNavigations countryCode](self, "countryCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_25;
    }
    if (!-[BMSafariNavigations hasPrivacyProxy](self, "hasPrivacyProxy")
      && !objc_msgSend(v5, "hasPrivacyProxy")
      || -[BMSafariNavigations hasPrivacyProxy](self, "hasPrivacyProxy")
      && objc_msgSend(v5, "hasPrivacyProxy")
      && (v27 = -[BMSafariNavigations privacyProxy](self, "privacyProxy"),
          v27 == objc_msgSend(v5, "privacyProxy")))
    {
      v28 = -[BMSafariNavigations error](self, "error");
      if (v28 == objc_msgSend(v5, "error"))
      {
        -[BMSafariNavigations url](self, "url");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "url");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 == v30)
        {
          v12 = 1;
        }
        else
        {
          -[BMSafariNavigations url](self, "url");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "url");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v31, "isEqual:", v32);

        }
        goto LABEL_26;
      }
    }
LABEL_25:
    v12 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v12 = 0;
LABEL_27:

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

- (int)userAgent
{
  return self->_userAgent;
}

- (NSString)countryCode
{
  return self->_countryCode;
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

- (int)error
{
  return self->_error;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
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

    v4 = -[BMSafariNavigations initByReadFrom:]([BMSafariNavigations alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visited"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("platform"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userAgent"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("privacyProxy"), 0, 0, 6, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("error"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("url"), 2, 0, 8, 13, 0);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1EC40;
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
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 1, 13, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visited"), 2, 0, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("platform"), 3, 4, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAgent"), 4, 4, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 5, 13, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("privacyProxy"), 6, 12, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("error"), 7, 4, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("url"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
