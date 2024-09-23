@implementation BMSafariPageLoad

- (BMSafariPageLoad)initWithSearch:(id)a3 visited:(id)a4 mode:(id)a5 platform:(int)a6 userAgent:(int)a7 countryCode:(id)a8 entryPoint:(int)a9 actualized:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BMSafariPageLoad *v21;
  double v22;
  objc_super v24;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a10;
  v24.receiver = self;
  v24.super_class = (Class)BMSafariPageLoad;
  v21 = -[BMEventBase init](&v24, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v21->_hasSearch = 1;
      v21->_search = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v21->_hasSearch = 0;
      v21->_search = 0;
    }
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
    if (v18)
    {
      v21->_hasMode = 1;
      v21->_mode = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v21->_hasMode = 0;
      v21->_mode = 0;
    }
    v21->_platform = a6;
    v21->_userAgent = a7;
    objc_storeStrong((id *)&v21->_countryCode, a8);
    v21->_entryPoint = a9;
    if (v20)
    {
      v21->_hasActualized = 1;
      v21->_actualized = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v21->_hasActualized = 0;
      v21->_actualized = 0;
    }
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariPageLoad search](self, "search"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariPageLoad visited](self, "visited");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariPageLoad mode](self, "mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariPageLoadPlatformAsString(-[BMSafariPageLoad platform](self, "platform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariPageLoadDeviceClassAsString(-[BMSafariPageLoad userAgent](self, "userAgent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariPageLoad countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariPageLoadEntryPointAsString(-[BMSafariPageLoad entryPoint](self, "entryPoint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariPageLoad actualized](self, "actualized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariPageLoad with search: %@, visited: %@, mode: %@, platform: %@, userAgent: %@, countryCode: %@, entryPoint: %@, actualized: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariPageLoad *v5;
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
  unint64_t v28;
  double v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  NSString *countryCode;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  BMSafariPageLoad *v68;
  objc_super v70;

  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)BMSafariPageLoad;
  v5 = -[BMEventBase init](&v70, sel_init);
  if (!v5)
    goto LABEL_105;
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
          v5->_hasSearch = 1;
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
              goto LABEL_69;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_71;
            }
          }
          v4[*v8] = 1;
LABEL_69:
          if (v4[*v8])
            v22 = 0;
LABEL_71:
          v65 = v22 != 0;
          v66 = 32;
          goto LABEL_99;
        case 2u:
          v5->_hasRaw_visited = 1;
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(double *)(*(_QWORD *)&v4[*v9] + v28);
            *(_QWORD *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0.0;
          }
          v5->_raw_visited = v29;
          continue;
        case 3u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          v5->_hasMode = 1;
          while (2)
          {
            v33 = *v6;
            v34 = *(_QWORD *)&v4[v33];
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
              *(_QWORD *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  v32 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v32 = 0;
LABEL_75:
          v65 = v32 != 0;
          v66 = 34;
          goto LABEL_99;
        case 4u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          while (2)
          {
            v40 = *v6;
            v41 = *(_QWORD *)&v4[v40];
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
              *(_QWORD *)&v4[v40] = v42;
              v39 |= (unint64_t)(v43 & 0x7F) << v37;
              if (v43 < 0)
              {
                v37 += 7;
                v17 = v38++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v39) = 0;
LABEL_79:
          if (v39 >= 4)
            LODWORD(v39) = 0;
          v67 = 44;
          goto LABEL_94;
        case 5u:
          v44 = 0;
          v45 = 0;
          v39 = 0;
          while (2)
          {
            v46 = *v6;
            v47 = *(_QWORD *)&v4[v46];
            v48 = v47 + 1;
            if (v47 == -1 || v48 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v47);
              *(_QWORD *)&v4[v46] = v48;
              v39 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v39) = 0;
LABEL_85:
          if (v39 >= 3)
            LODWORD(v39) = 0;
          v67 = 48;
          goto LABEL_94;
        case 6u:
          PBReaderReadString();
          v50 = objc_claimAutoreleasedReturnValue();
          countryCode = v5->_countryCode;
          v5->_countryCode = (NSString *)v50;

          continue;
        case 7u:
          v52 = 0;
          v53 = 0;
          v39 = 0;
          while (2)
          {
            v54 = *v6;
            v55 = *(_QWORD *)&v4[v54];
            v56 = v55 + 1;
            if (v55 == -1 || v56 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v55);
              *(_QWORD *)&v4[v54] = v56;
              v39 |= (unint64_t)(v57 & 0x7F) << v52;
              if (v57 < 0)
              {
                v52 += 7;
                v17 = v53++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v39) = 0;
LABEL_91:
          if (v39 >= 3)
            LODWORD(v39) = 0;
          v67 = 52;
LABEL_94:
          *(_DWORD *)((char *)&v5->super.super.isa + v67) = v39;
          continue;
        case 8u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v5->_hasActualized = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_104;
          continue;
      }
      while (1)
      {
        v61 = *v6;
        v62 = *(_QWORD *)&v4[v61];
        v63 = v62 + 1;
        if (v62 == -1 || v63 > *(_QWORD *)&v4[*v7])
          break;
        v64 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v62);
        *(_QWORD *)&v4[v61] = v63;
        v60 |= (unint64_t)(v64 & 0x7F) << v58;
        if ((v64 & 0x80) == 0)
          goto LABEL_96;
        v58 += 7;
        v17 = v59++ >= 9;
        if (v17)
        {
          v60 = 0;
          goto LABEL_98;
        }
      }
      v4[*v8] = 1;
LABEL_96:
      if (v4[*v8])
        v60 = 0;
LABEL_98:
      v65 = v60 != 0;
      v66 = 36;
LABEL_99:
      *((_BYTE *)&v5->super.super.isa + v66) = v65;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_104:
    v68 = 0;
  else
LABEL_105:
    v68 = v5;

  return v68;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasSearch)
    PBDataWriterWriteBOOLField();
  if (self->_hasRaw_visited)
    PBDataWriterWriteDoubleField();
  if (self->_hasMode)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasActualized)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariPageLoad writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariPageLoad)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id *v18;
  uint64_t v19;
  id v20;
  BMSafariPageLoad *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  id *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  id *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  BMSafariPageLoad *v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  _QWORD v100[3];

  v100[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("search"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visited"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (objc_class *)MEMORY[0x1E0C99D68];
        v12 = v9;
        v13 = [v11 alloc];
        objc_msgSend(v12, "doubleValue");
        v15 = v14;

        v16 = (id)objc_msgSend(v13, "initWithTimeIntervalSince1970:", v15);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v22, "dateFromString:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            v21 = 0;
            goto LABEL_65;
          }
          v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v67 = a4;
          v68 = *MEMORY[0x1E0D025B8];
          v97 = *MEMORY[0x1E0CB2D50];
          v84 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("visited"));
          v98 = v84;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v68, 2);
          v10 = 0;
          v21 = 0;
          *v67 = v69;
          goto LABEL_64;
        }
        v16 = v9;
      }
      v10 = v16;
    }
    else
    {
      v10 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mode"));
    v23 = objc_claimAutoreleasedReturnValue();
    v81 = (void *)v23;
    v75 = a4;
    if (v23 && (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v84 = 0;
          v21 = 0;
          goto LABEL_64;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v95 = *MEMORY[0x1E0CB2D50];
        v30 = v10;
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        v71 = objc_opt_class();
        v32 = v31;
        v10 = v30;
        v83 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v71, CFSTR("mode"));
        v96 = v83;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
        v84 = 0;
        v21 = 0;
        *v75 = v33;
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      v84 = v24;
    }
    else
    {
      v84 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("platform"));
    v25 = objc_claimAutoreleasedReturnValue();
    v79 = v10;
    v77 = (void *)v25;
    if (v25 && (v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = v26;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v83 = 0;
            v21 = 0;
            goto LABEL_63;
          }
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = *MEMORY[0x1E0D025B8];
          v93 = *MEMORY[0x1E0CB2D50];
          v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("platform"));
          v94 = v80;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          v10 = v79;
          v58 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v57, 2, v34);
          v83 = 0;
          v21 = 0;
          *v75 = v58;
          goto LABEL_62;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariPageLoadPlatformFromString(v26));
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v83 = v27;
    }
    else
    {
      v83 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userAgent"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v9;
    v78 = v8;
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v34;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            v80 = 0;
            v21 = 0;
            goto LABEL_61;
          }
          v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v60 = *MEMORY[0x1E0D025B8];
          v91 = *MEMORY[0x1E0CB2D50];
          v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userAgent"));
          v92 = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          v10 = v79;
          v62 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v61, 2, v36);
          v80 = 0;
          v21 = 0;
          *v75 = v62;
LABEL_60:

          v8 = v78;
LABEL_61:
          v9 = v76;
LABEL_62:

          goto LABEL_63;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariPageLoadDeviceClassFromString(v34));
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v80 = v35;
    }
    else
    {
      v80 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v7;
    v82 = self;
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v75)
        {
          v37 = 0;
          v21 = 0;
          goto LABEL_60;
        }
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = *MEMORY[0x1E0D025B8];
        v89 = *MEMORY[0x1E0CB2D50];
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
        v90 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v38);
        v37 = 0;
        v21 = 0;
        *v75 = v43;
        goto LABEL_59;
      }
      v37 = v36;
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entryPoint"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v73 = v37;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v38;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            v39 = 0;
            v21 = 0;
            goto LABEL_59;
          }
          v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v64 = *MEMORY[0x1E0D025B8];
          v87 = *MEMORY[0x1E0CB2D50];
          v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("entryPoint"));
          v88 = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 2, v44);
          v39 = 0;
          v21 = 0;
          *v75 = v65;
          goto LABEL_82;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariPageLoadEntryPointFromString(v38));
        v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      v39 = v40;
    }
    else
    {
      v39 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actualized"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v45 = v34;
      v46 = v37;
      v47 = 0;
LABEL_57:
      v48 = objc_msgSend(v83, "intValue");
      v49 = objc_msgSend(v80, "intValue");
      LODWORD(v70) = objc_msgSend(v39, "intValue");
      v50 = v49;
      v37 = v46;
      v21 = -[BMSafariPageLoad initWithSearch:visited:mode:platform:userAgent:countryCode:entryPoint:actualized:](v82, "initWithSearch:visited:mode:platform:userAgent:countryCode:entryPoint:actualized:", v78, v79, v84, v48, v50, v46, v70, v47);
      v82 = v21;
      v34 = v45;
LABEL_58:

LABEL_59:
      self = v82;
      v7 = v74;
      v10 = v79;
      goto LABEL_60;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = v34;
      v46 = v37;
      v47 = v44;
      goto LABEL_57;
    }
    v73 = v37;
    if (v75)
    {
      v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v72 = *MEMORY[0x1E0D025B8];
      v85 = *MEMORY[0x1E0CB2D50];
      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("actualized"));
      v86 = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *v75 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v72, 2, v54);

    }
    v47 = 0;
    v21 = 0;
LABEL_82:
    v37 = v73;
    goto LABEL_58;
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
    v21 = 0;
    goto LABEL_66;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = a4;
  v19 = *MEMORY[0x1E0D025B8];
  v99 = *MEMORY[0x1E0CB2D50];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("search"));
  v100[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, &v99, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v19, 2, v9);
  v8 = 0;
  v21 = 0;
  *v18 = v20;
LABEL_65:

LABEL_66:
  return v21;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[10];

  v30[8] = *MEMORY[0x1E0C80C00];
  if (-[BMSafariPageLoad hasSearch](self, "hasSearch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariPageLoad search](self, "search"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMSafariPageLoad visited](self, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSafariPageLoad visited](self, "visited");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  if (-[BMSafariPageLoad hasMode](self, "hasMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariPageLoad mode](self, "mode"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariPageLoad platform](self, "platform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariPageLoad userAgent](self, "userAgent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariPageLoad countryCode](self, "countryCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariPageLoad entryPoint](self, "entryPoint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSafariPageLoad hasActualized](self, "hasActualized"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariPageLoad actualized](self, "actualized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v29[0] = CFSTR("search");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v12;
  v30[0] = v12;
  v29[1] = CFSTR("visited");
  v13 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v13;
  v30[1] = v13;
  v29[2] = CFSTR("mode");
  v14 = v8;
  v25 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v14;
  v30[2] = v14;
  v29[3] = CFSTR("platform");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v3;
  v30[3] = v15;
  v29[4] = CFSTR("userAgent");
  v16 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[4] = v16;
  v29[5] = CFSTR("countryCode");
  v17 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[5] = v17;
  v29[6] = CFSTR("entryPoint");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[6] = v18;
  v29[7] = CFSTR("actualized");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[7] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_31;
  }
  else
  {

    if (v10)
      goto LABEL_31;
  }

LABEL_31:
  if (!v27)

  if (!v28)
  if (!v9)

  if (v25)
  {
    if (v7)
      goto LABEL_39;
LABEL_44:

    if (v26)
      goto LABEL_40;
LABEL_45:

    goto LABEL_40;
  }

  if (!v7)
    goto LABEL_44;
LABEL_39:
  if (!v26)
    goto LABEL_45;
LABEL_40:

  return v20;
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
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  _BOOL4 v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSafariPageLoad hasSearch](self, "hasSearch") || objc_msgSend(v5, "hasSearch"))
    {
      if (!-[BMSafariPageLoad hasSearch](self, "hasSearch"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasSearch"))
        goto LABEL_29;
      v6 = -[BMSafariPageLoad search](self, "search");
      if (v6 != objc_msgSend(v5, "search"))
        goto LABEL_29;
    }
    -[BMSafariPageLoad visited](self, "visited");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visited");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMSafariPageLoad visited](self, "visited");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visited");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_29;
    }
    if (-[BMSafariPageLoad hasMode](self, "hasMode") || objc_msgSend(v5, "hasMode"))
    {
      if (!-[BMSafariPageLoad hasMode](self, "hasMode"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasMode"))
        goto LABEL_29;
      v14 = -[BMSafariPageLoad mode](self, "mode");
      if (v14 != objc_msgSend(v5, "mode"))
        goto LABEL_29;
    }
    v15 = -[BMSafariPageLoad platform](self, "platform");
    if (v15 != objc_msgSend(v5, "platform"))
      goto LABEL_29;
    v16 = -[BMSafariPageLoad userAgent](self, "userAgent");
    if (v16 != objc_msgSend(v5, "userAgent"))
      goto LABEL_29;
    -[BMSafariPageLoad countryCode](self, "countryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v18)
    {

    }
    else
    {
      v19 = (void *)v18;
      -[BMSafariPageLoad countryCode](self, "countryCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if (!v22)
        goto LABEL_29;
    }
    v23 = -[BMSafariPageLoad entryPoint](self, "entryPoint");
    if (v23 == objc_msgSend(v5, "entryPoint"))
    {
      if (!-[BMSafariPageLoad hasActualized](self, "hasActualized") && !objc_msgSend(v5, "hasActualized"))
      {
        LOBYTE(v13) = 1;
        goto LABEL_30;
      }
      if (-[BMSafariPageLoad hasActualized](self, "hasActualized") && objc_msgSend(v5, "hasActualized"))
      {
        v24 = -[BMSafariPageLoad actualized](self, "actualized");
        v13 = v24 ^ objc_msgSend(v5, "actualized") ^ 1;
LABEL_30:

        goto LABEL_31;
      }
    }
LABEL_29:
    LOBYTE(v13) = 0;
    goto LABEL_30;
  }
  LOBYTE(v13) = 0;
LABEL_31:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)search
{
  return self->_search;
}

- (BOOL)hasSearch
{
  return self->_hasSearch;
}

- (void)setHasSearch:(BOOL)a3
{
  self->_hasSearch = a3;
}

- (BOOL)mode
{
  return self->_mode;
}

- (BOOL)hasMode
{
  return self->_hasMode;
}

- (void)setHasMode:(BOOL)a3
{
  self->_hasMode = a3;
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

- (int)entryPoint
{
  return self->_entryPoint;
}

- (BOOL)actualized
{
  return self->_actualized;
}

- (BOOL)hasActualized
{
  return self->_hasActualized;
}

- (void)setHasActualized:(BOOL)a3
{
  self->_hasActualized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
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

    v4 = -[BMSafariPageLoad initByReadFrom:]([BMSafariPageLoad alloc], "initByReadFrom:", v7);
    v4[10] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("search"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visited"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mode"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("platform"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userAgent"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("entryPoint"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actualized"), 0, 0, 8, 12, 0);
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
  return &unk_1E5F1A8F0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("search"), 1, 12, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visited"), 2, 0, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mode"), 3, 12, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("platform"), 4, 4, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userAgent"), 5, 4, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 6, 13, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entryPoint"), 7, 4, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actualized"), 8, 12, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
