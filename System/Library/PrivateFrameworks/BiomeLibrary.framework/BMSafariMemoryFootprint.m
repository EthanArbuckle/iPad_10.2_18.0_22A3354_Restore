@implementation BMSafariMemoryFootprint

- (BMSafariMemoryFootprint)initWithDomain:(id)a3 visited:(id)a4 footprint:(int)a5 pageCount:(int)a6 lifetime:(int)a7 countryCode:(id)a8 inForeground:(id)a9 privacyProxy:(id)a10 canSuspend:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMSafariMemoryFootprint *v22;
  double v23;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v18 = a4;
  v25 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariMemoryFootprint;
  v22 = -[BMEventBase init](&v27, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v25, v26);
    objc_storeStrong((id *)&v22->_domain, a3);
    if (v18)
    {
      v22->_hasRaw_visited = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_visited = 0;
      v23 = -1.0;
    }
    v22->_raw_visited = v23;
    v22->_footprint = a5;
    v22->_pageCount = a6;
    v22->_lifetime = a7;
    objc_storeStrong((id *)&v22->_countryCode, a8);
    if (v19)
    {
      v22->_hasInForeground = 1;
      v22->_inForeground = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v22->_hasInForeground = 0;
      v22->_inForeground = 0;
    }
    if (v20)
    {
      v22->_hasPrivacyProxy = 1;
      v22->_privacyProxy = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v22->_hasPrivacyProxy = 0;
      v22->_privacyProxy = 0;
    }
    if (v21)
    {
      v22->_hasCanSuspend = 1;
      v22->_canSuspend = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v22->_hasCanSuspend = 0;
      v22->_canSuspend = 0;
    }
  }

  return v22;
}

- (NSString)description
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
  id v14;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSafariMemoryFootprint domain](self, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariMemoryFootprint visited](self, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariMemoryFootprintFootprintAsString(-[BMSafariMemoryFootprint footprint](self, "footprint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariMemoryFootprintPageCountAsString(-[BMSafariMemoryFootprint pageCount](self, "pageCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariMemoryFootprintLifetimeAsString(-[BMSafariMemoryFootprint lifetime](self, "lifetime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariMemoryFootprint countryCode](self, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariMemoryFootprint inForeground](self, "inForeground"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariMemoryFootprint privacyProxy](self, "privacyProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariMemoryFootprint canSuspend](self, "canSuspend"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("BMSafariMemoryFootprint with domain: %@, visited: %@, footprint: %@, pageCount: %@, lifetime: %@, countryCode: %@, inForeground: %@, privacyProxy: %@, canSuspend: %@"), v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariMemoryFootprint *v5;
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
  unint64_t v42;
  char v43;
  void *v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  BMSafariMemoryFootprint *v69;
  objc_super v71;

  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)BMSafariMemoryFootprint;
  v5 = -[BMEventBase init](&v71, sel_init);
  if (!v5)
    goto LABEL_107;
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
          goto LABEL_48;
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
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_73:
          if (v27 >= 6)
            LODWORD(v27) = 0;
          v66 = 44;
          goto LABEL_88;
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
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_79:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v66 = 48;
          goto LABEL_88;
        case 5u:
          v38 = 0;
          v39 = 0;
          v27 = 0;
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
              v27 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v17 = v39++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_85:
          if (v27 >= 9)
            LODWORD(v27) = 0;
          v66 = 52;
LABEL_88:
          *(_DWORD *)((char *)&v5->super.super.isa + v66) = v27;
          continue;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
LABEL_48:
          v44 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 7u:
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v5->_hasInForeground = 1;
          while (2)
          {
            v48 = *v6;
            v49 = *(_QWORD *)&v4[v48];
            v50 = v49 + 1;
            if (v49 == -1 || v50 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v51 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v49);
              *(_QWORD *)&v4[v48] = v50;
              v47 |= (unint64_t)(v51 & 0x7F) << v45;
              if (v51 < 0)
              {
                v45 += 7;
                v17 = v46++ >= 9;
                if (v17)
                {
                  v47 = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v47 = 0;
LABEL_92:
          v67 = v47 != 0;
          v68 = 32;
          goto LABEL_101;
        case 8u:
          v52 = 0;
          v53 = 0;
          v54 = 0;
          v5->_hasPrivacyProxy = 1;
          while (2)
          {
            v55 = *v6;
            v56 = *(_QWORD *)&v4[v55];
            v57 = v56 + 1;
            if (v56 == -1 || v57 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v56);
              *(_QWORD *)&v4[v55] = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                v17 = v53++ >= 9;
                if (v17)
                {
                  v54 = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v54 = 0;
LABEL_96:
          v67 = v54 != 0;
          v68 = 34;
          goto LABEL_101;
        case 9u:
          v59 = 0;
          v60 = 0;
          v61 = 0;
          v5->_hasCanSuspend = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_106;
          continue;
      }
      while (1)
      {
        v62 = *v6;
        v63 = *(_QWORD *)&v4[v62];
        v64 = v63 + 1;
        if (v63 == -1 || v64 > *(_QWORD *)&v4[*v7])
          break;
        v65 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v63);
        *(_QWORD *)&v4[v62] = v64;
        v61 |= (unint64_t)(v65 & 0x7F) << v59;
        if ((v65 & 0x80) == 0)
          goto LABEL_98;
        v59 += 7;
        v17 = v60++ >= 9;
        if (v17)
        {
          v61 = 0;
          goto LABEL_100;
        }
      }
      v4[*v8] = 1;
LABEL_98:
      if (v4[*v8])
        v61 = 0;
LABEL_100:
      v67 = v61 != 0;
      v68 = 36;
LABEL_101:
      *((_BYTE *)&v5->super.super.isa + v68) = v67;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_106:
    v69 = 0;
  else
LABEL_107:
    v69 = v5;

  return v69;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_visited)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_hasInForeground)
    PBDataWriterWriteBOOLField();
  v4 = v5;
  if (self->_hasPrivacyProxy)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasCanSuspend)
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
  -[BMSafariMemoryFootprint writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariMemoryFootprint)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  BMSafariMemoryFootprint *v19;
  id v20;
  void *v21;
  BMSafariMemoryFootprint *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  BMSafariMemoryFootprint *v32;
  id *v33;
  BMSafariMemoryFootprint *v34;
  void *v35;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  id *v59;
  uint64_t v60;
  id v61;
  id *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  BMSafariMemoryFootprint *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id *v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
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
        v10 = (objc_class *)MEMORY[0x1E0C99D68];
        v11 = v9;
        v12 = [v10 alloc];
        objc_msgSend(v11, "doubleValue");
        v14 = v13;

        v15 = (id)objc_msgSend(v12, "initWithTimeIntervalSince1970:", v14);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v20, "dateFromString:", v9);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v80 = 0;
            v19 = 0;
            goto LABEL_60;
          }
          v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v62 = a4;
          v63 = *MEMORY[0x1E0D025B8];
          v95 = *MEMORY[0x1E0CB2D50];
          v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("visited"));
          v96 = v79;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = 0;
          v19 = 0;
          *v62 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v63, 2, v21);
          goto LABEL_59;
        }
        v15 = v9;
      }
      v80 = v15;
    }
    else
    {
      v80 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("footprint"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v8;
    v78 = v7;
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = self;
        v79 = v21;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v79 = 0;
            v19 = 0;
            goto LABEL_59;
          }
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v75 = a4;
          v48 = *MEMORY[0x1E0D025B8];
          v93 = *MEMORY[0x1E0CB2D50];
          v76 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("footprint"));
          v94 = v76;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v47;
          v23 = (void *)v49;
          v79 = 0;
          v19 = 0;
          *v75 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v48, 2, v49);
LABEL_58:

LABEL_59:
          goto LABEL_60;
        }
        v22 = self;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariMemoryFootprintFootprintFromString(v21));
        v79 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v22 = self;
      v79 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pageCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v21;
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v76 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self = v22;
          if (!a4)
          {
            v76 = 0;
            v19 = 0;
            v7 = v78;
            goto LABEL_58;
          }
          v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v54 = a4;
          v55 = *MEMORY[0x1E0D025B8];
          v91 = *MEMORY[0x1E0CB2D50];
          v74 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("pageCount"));
          v92 = v74;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = v53;
          v35 = (void *)v56;
          v76 = 0;
          v19 = 0;
          *v54 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v55, 2, v56);
          v7 = v78;
          goto LABEL_57;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariMemoryFootprintPageCountFromString(v23));
        v76 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v76 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lifetime"));
    v24 = objc_claimAutoreleasedReturnValue();
    v69 = v9;
    v70 = v23;
    v68 = (void *)v24;
    if (v24 && (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v74 = v25;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v74 = 0;
            v19 = 0;
            v35 = v25;
            self = v22;
            v7 = v78;
            goto LABEL_57;
          }
          v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v59 = a4;
          v60 = *MEMORY[0x1E0D025B8];
          v89 = *MEMORY[0x1E0CB2D50];
          v73 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("lifetime"));
          v90 = v73;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = 0;
          v19 = 0;
          *v59 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v60, 2, v26);
          v35 = v25;
          v23 = v70;
          self = v22;
          v7 = v78;
LABEL_56:

          v9 = v69;
LABEL_57:

          goto LABEL_58;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariMemoryFootprintLifetimeFromString(v25));
        v74 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v74 = 0;
    }
    v67 = v22;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = a4;
    if (v26)
    {
      objc_opt_class();
      v7 = v78;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = 0;
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
            self = v67;
            v35 = v68;
            goto LABEL_56;
          }
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = v21;
          v39 = *MEMORY[0x1E0D025B8];
          v87 = *MEMORY[0x1E0CB2D50];
          v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
          v88 = v72;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v37;
          v23 = v70;
          v41 = v39;
          v21 = v38;
          v19 = 0;
          v73 = 0;
          *v27 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v28);
          goto LABEL_90;
        }
        v73 = v26;
      }
    }
    else
    {
      v73 = 0;
      v7 = v78;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inForeground"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v72 = 0;
      goto LABEL_46;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = v28;
LABEL_46:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("privacyProxy"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v30 = 0;
        goto LABEL_49;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = v29;
LABEL_49:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("canSuspend"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v34 = v67;
            v33 = v27;
            if (v27)
            {
              v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v64 = *MEMORY[0x1E0D025B8];
              v81 = *MEMORY[0x1E0CB2D50];
              v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("canSuspend"));
              v82 = v51;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *v33 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v64, 2, v52);

              v33 = 0;
            }
            v19 = 0;
            goto LABEL_53;
          }
          v32 = v67;
          v33 = v31;
        }
        else
        {
          v32 = v67;
          v33 = 0;
        }
        v19 = -[BMSafariMemoryFootprint initWithDomain:visited:footprint:pageCount:lifetime:countryCode:inForeground:privacyProxy:canSuspend:](v32, "initWithDomain:visited:footprint:pageCount:lifetime:countryCode:inForeground:privacyProxy:canSuspend:", v77, v80, objc_msgSend(v79, "intValue"), objc_msgSend(v76, "intValue"), objc_msgSend(v74, "intValue"), v73, v72, v30, v33);
        v34 = v19;
LABEL_53:

        self = v34;
        v8 = v77;
        v7 = v78;
LABEL_54:

        v23 = v70;
        v21 = v71;
LABEL_55:
        v35 = v68;

        goto LABEL_56;
      }
      if (v27)
      {
        v34 = v67;
        v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = *MEMORY[0x1E0D025B8];
        v83 = *MEMORY[0x1E0CB2D50];
        v33 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("privacyProxy"));
        v84 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v45, 2, v31);
        v19 = 0;
        v30 = 0;
        *v27 = v46;
        goto LABEL_53;
      }
      v30 = 0;
      v19 = 0;
LABEL_92:
      self = v67;
      goto LABEL_54;
    }
    if (v27)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v43 = *MEMORY[0x1E0D025B8];
      v85 = *MEMORY[0x1E0CB2D50];
      v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("inForeground"));
      v86 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v8 = v77;
      v19 = 0;
      v72 = 0;
      *v27 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v44, 2, v29);
      goto LABEL_92;
    }
    v72 = 0;
    v19 = 0;
LABEL_90:
    self = v67;
    goto LABEL_55;
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
    v19 = 0;
    goto LABEL_61;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = a4;
  v18 = *MEMORY[0x1E0D025B8];
  v97 = *MEMORY[0x1E0CB2D50];
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("domain"));
  v98[0] = v80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, &v97, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v19 = 0;
  *v17 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v18, 2, v9);
LABEL_60:

LABEL_61:
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[9];
  _QWORD v41[11];

  v41[9] = *MEMORY[0x1E0C80C00];
  -[BMSafariMemoryFootprint domain](self, "domain");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSafariMemoryFootprint visited](self, "visited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSafariMemoryFootprint visited](self, "visited");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariMemoryFootprint footprint](self, "footprint"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariMemoryFootprint pageCount](self, "pageCount"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariMemoryFootprint lifetime](self, "lifetime"));
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMSafariMemoryFootprint countryCode](self, "countryCode");
  v11 = objc_claimAutoreleasedReturnValue();
  if (-[BMSafariMemoryFootprint hasInForeground](self, "hasInForeground"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariMemoryFootprint inForeground](self, "inForeground"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  if (-[BMSafariMemoryFootprint hasPrivacyProxy](self, "hasPrivacyProxy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSafariMemoryFootprint privacyProxy](self, "privacyProxy"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  if (-[BMSafariMemoryFootprint hasCanSuspend](self, "hasCanSuspend"))
  {
    v12 = v11;
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = -[BMSafariMemoryFootprint canSuspend](self, "canSuspend");
    v15 = v13;
    v11 = v12;
    objc_msgSend(v15, "numberWithBool:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v40[0] = CFSTR("domain");
  v17 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v17;
  v41[0] = v17;
  v40[1] = CFSTR("visited");
  v18 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v18;
  v41[1] = v18;
  v40[2] = CFSTR("footprint");
  v19 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v19;
  v41[2] = v19;
  v40[3] = CFSTR("pageCount");
  v20 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v3;
  v31 = (void *)v20;
  v41[3] = v20;
  v40[4] = CFSTR("lifetime");
  v21 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v7;
  v41[4] = v21;
  v40[5] = CFSTR("countryCode");
  v22 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v11;
  v24 = (void *)v10;
  v25 = (void *)v8;
  v41[5] = v22;
  v40[6] = CFSTR("inForeground");
  v26 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v9;
  v41[6] = v26;
  v40[7] = CFSTR("privacyProxy");
  v28 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[7] = v28;
  v40[8] = CFSTR("canSuspend");
  v29 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[8] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 9);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)

  if (!v38)
  if (v39)
  {
    if (v23)
      goto LABEL_37;
  }
  else
  {

    if (v23)
      goto LABEL_37;
  }

LABEL_37:
  if (!v24)

  if (v27)
  {
    if (v25)
      goto LABEL_41;
  }
  else
  {

    if (v25)
    {
LABEL_41:
      if (v36)
        goto LABEL_42;
LABEL_48:

      if (v37)
        goto LABEL_43;
LABEL_49:

      goto LABEL_43;
    }
  }

  if (!v36)
    goto LABEL_48;
LABEL_42:
  if (!v37)
    goto LABEL_49;
LABEL_43:

  return v35;
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
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  _BOOL4 v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariMemoryFootprint domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariMemoryFootprint domain](self, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[BMSafariMemoryFootprint visited](self, "visited");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visited");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariMemoryFootprint visited](self, "visited");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visited");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_33;
    }
    v19 = -[BMSafariMemoryFootprint footprint](self, "footprint");
    if (v19 != objc_msgSend(v5, "footprint"))
      goto LABEL_33;
    v20 = -[BMSafariMemoryFootprint pageCount](self, "pageCount");
    if (v20 != objc_msgSend(v5, "pageCount"))
      goto LABEL_33;
    v21 = -[BMSafariMemoryFootprint lifetime](self, "lifetime");
    if (v21 != objc_msgSend(v5, "lifetime"))
      goto LABEL_33;
    -[BMSafariMemoryFootprint countryCode](self, "countryCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[BMSafariMemoryFootprint countryCode](self, "countryCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_33;
    }
    if (!-[BMSafariMemoryFootprint hasInForeground](self, "hasInForeground")
      && !objc_msgSend(v5, "hasInForeground")
      || -[BMSafariMemoryFootprint hasInForeground](self, "hasInForeground")
      && objc_msgSend(v5, "hasInForeground")
      && (v28 = -[BMSafariMemoryFootprint inForeground](self, "inForeground"),
          v28 == objc_msgSend(v5, "inForeground")))
    {
      if (!-[BMSafariMemoryFootprint hasPrivacyProxy](self, "hasPrivacyProxy")
        && !objc_msgSend(v5, "hasPrivacyProxy")
        || -[BMSafariMemoryFootprint hasPrivacyProxy](self, "hasPrivacyProxy")
        && objc_msgSend(v5, "hasPrivacyProxy")
        && (v29 = -[BMSafariMemoryFootprint privacyProxy](self, "privacyProxy"),
            v29 == objc_msgSend(v5, "privacyProxy")))
      {
        if (!-[BMSafariMemoryFootprint hasCanSuspend](self, "hasCanSuspend")
          && !objc_msgSend(v5, "hasCanSuspend"))
        {
          LOBYTE(v12) = 1;
          goto LABEL_34;
        }
        if (-[BMSafariMemoryFootprint hasCanSuspend](self, "hasCanSuspend")
          && objc_msgSend(v5, "hasCanSuspend"))
        {
          v30 = -[BMSafariMemoryFootprint canSuspend](self, "canSuspend");
          v12 = v30 ^ objc_msgSend(v5, "canSuspend") ^ 1;
LABEL_34:

          goto LABEL_35;
        }
      }
    }
LABEL_33:
    LOBYTE(v12) = 0;
    goto LABEL_34;
  }
  LOBYTE(v12) = 0;
LABEL_35:

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

- (int)footprint
{
  return self->_footprint;
}

- (int)pageCount
{
  return self->_pageCount;
}

- (int)lifetime
{
  return self->_lifetime;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (BOOL)inForeground
{
  return self->_inForeground;
}

- (BOOL)hasInForeground
{
  return self->_hasInForeground;
}

- (void)setHasInForeground:(BOOL)a3
{
  self->_hasInForeground = a3;
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

- (BOOL)canSuspend
{
  return self->_canSuspend;
}

- (BOOL)hasCanSuspend
{
  return self->_hasCanSuspend;
}

- (void)setHasCanSuspend:(BOOL)a3
{
  self->_hasCanSuspend = a3;
}

- (void).cxx_destruct
{
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

    v4 = -[BMSafariMemoryFootprint initByReadFrom:]([BMSafariMemoryFootprint alloc], "initByReadFrom:", v7);
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
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("domain"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visited"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("footprint"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pageCount"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("lifetime"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inForeground"), 0, 0, 7, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("privacyProxy"), 0, 0, 8, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("canSuspend"), 0, 0, 9, 12, 0);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D848;
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
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("domain"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visited"), 2, 0, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("footprint"), 3, 4, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pageCount"), 4, 4, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("lifetime"), 5, 4, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 6, 13, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inForeground"), 7, 12, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("privacyProxy"), 8, 12, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("canSuspend"), 9, 12, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
