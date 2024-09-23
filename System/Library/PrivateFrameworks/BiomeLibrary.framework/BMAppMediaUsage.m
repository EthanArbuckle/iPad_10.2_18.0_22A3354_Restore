@implementation BMAppMediaUsage

- (BMAppMediaUsage)initWithStarting:(id)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 isUsageTrusted:(id)a7 absoluteTimestamp:(id)a8 safariProfileID:(id)a9
{
  return -[BMAppMediaUsage initWithStarting:bundleID:URL:mediaURL:isUsageTrusted:absoluteTimestamp:safariProfileID:uniqueID:](self, "initWithStarting:bundleID:URL:mediaURL:isUsageTrusted:absoluteTimestamp:safariProfileID:uniqueID:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (BMAppMediaUsage)initWithStarting:(id)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 isUsageTrusted:(id)a7 absoluteTimestamp:(id)a8 safariProfileID:(id)a9 uniqueID:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  BMAppMediaUsage *v20;
  double v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v16 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v17 = a7;
  v18 = a8;
  v23 = a9;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMAppMediaUsage;
  v20 = -[BMEventBase init](&v27, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v23, v24, v25, v26);
    if (v16)
    {
      v20->_hasStarting = 1;
      v20->_starting = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v20->_hasStarting = 0;
      v20->_starting = 0;
    }
    objc_storeStrong((id *)&v20->_bundleID, a4);
    objc_storeStrong((id *)&v20->_URL, a5);
    objc_storeStrong((id *)&v20->_mediaURL, a6);
    if (v17)
    {
      v20->_hasIsUsageTrusted = 1;
      v20->_isUsageTrusted = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v20->_hasIsUsageTrusted = 0;
      v20->_isUsageTrusted = 0;
    }
    if (v18)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      v21 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v21;
    objc_storeStrong((id *)&v20->_safariProfileID, a9);
    objc_storeStrong((id *)&v20->_uniqueID, a10);
  }

  return v20;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppMediaUsage starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage mediaURL](self, "mediaURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppMediaUsage isUsageTrusted](self, "isUsageTrusted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage absoluteTimestamp](self, "absoluteTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage safariProfileID](self, "safariProfileID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage uniqueID](self, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppMediaUsage with starting: %@, bundleID: %@, URL: %@, mediaURL: %@, isUsageTrusted: %@, absoluteTimestamp: %@, safariProfileID: %@, uniqueID: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppMediaUsage *v5;
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
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  unint64_t v37;
  double v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  BMAppMediaUsage *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMAppMediaUsage;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
    goto LABEL_59;
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
          v5->_hasStarting = 1;
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
              goto LABEL_46;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_48;
            }
          }
          v4[*v8] = 1;
LABEL_46:
          if (v4[*v8])
            v22 = 0;
LABEL_48:
          v40 = v22 != 0;
          v41 = 32;
          goto LABEL_53;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 40;
          goto LABEL_44;
        case 3u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 48;
          goto LABEL_44;
        case 4u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 56;
          goto LABEL_44;
        case 5u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasIsUsageTrusted = 1;
          break;
        case 6u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v38 = *(double *)(*(_QWORD *)&v4[*v9] + v37);
            *(_QWORD *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v38 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v38;
          continue;
        case 7u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 64;
          goto LABEL_44;
        case 8u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 72;
LABEL_44:
          v39 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_58;
          continue;
      }
      while (1)
      {
        v32 = *v6;
        v33 = *(_QWORD *)&v4[v32];
        v34 = v33 + 1;
        if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
          break;
        v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
        *(_QWORD *)&v4[v32] = v34;
        v31 |= (unint64_t)(v35 & 0x7F) << v29;
        if ((v35 & 0x80) == 0)
          goto LABEL_50;
        v29 += 7;
        v17 = v30++ >= 9;
        if (v17)
        {
          v31 = 0;
          goto LABEL_52;
        }
      }
      v4[*v8] = 1;
LABEL_50:
      if (v4[*v8])
        v31 = 0;
LABEL_52:
      v40 = v31 != 0;
      v41 = 34;
LABEL_53:
      *((_BYTE *)&v5->super.super.isa + v41) = v40;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_58:
    v42 = 0;
  else
LABEL_59:
    v42 = v5;

  return v42;
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
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_URL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_mediaURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsUsageTrusted)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_safariProfileID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uniqueID)
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
  -[BMAppMediaUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppMediaUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BMAppMediaUsage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  uint64_t v21;
  id v22;
  objc_class *v23;
  id v24;
  id v25;
  double v26;
  double v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  BMAppMediaUsage *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  BMAppMediaUsage *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id *v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = a4;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("URL"));
      v11 = objc_claimAutoreleasedReturnValue();
      v73 = (void *)v11;
      if (!v11 || (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v68 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = v12;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaURL"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v8;
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v14 = self;
          v15 = v9;
          v16 = v7;
          v71 = 0;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUsageTrusted"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v10;
          v62 = v13;
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v70)
              {
                v67 = 0;
                a4 = 0;
                v31 = v68;
                v39 = v17;
                v7 = v16;
                v9 = v15;
                self = v14;
                v8 = v66;
                goto LABEL_64;
              }
              v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v42 = *MEMORY[0x1E0D025B8];
              v80 = *MEMORY[0x1E0CB2D50];
              v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isUsageTrusted"));
              v81 = v63;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v18);
              v67 = 0;
              a4 = 0;
              v31 = v68;
              *v70 = v43;
              v13 = v62;
              v39 = v17;
              v7 = v16;
              v9 = v15;
              self = v14;
              v8 = v66;
              goto LABEL_63;
            }
            v61 = v17;
            v67 = v17;
          }
          else
          {
            v61 = v17;
            v67 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v16;
          if (v18)
          {
            objc_opt_class();
            v9 = v15;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              self = v14;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = (objc_class *)MEMORY[0x1E0C99D68];
                v24 = v18;
                v25 = [v23 alloc];
                objc_msgSend(v24, "doubleValue");
                v27 = v26;

                v28 = (id)objc_msgSend(v25, "initWithTimeIntervalSince1970:", v27);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v44 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                  objc_msgSend(v44, "dateFromString:", v18);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_52;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v70)
                  {
                    v63 = 0;
                    a4 = 0;
                    goto LABEL_62;
                  }
                  v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v56 = *MEMORY[0x1E0D025B8];
                  v78 = *MEMORY[0x1E0CB2D50];
                  v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
                  v79 = v47;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2, v45);
                  v63 = 0;
                  a4 = 0;
                  *v70 = v57;
LABEL_61:

LABEL_62:
                  v8 = v66;
                  v31 = v68;
                  v39 = v61;
                  v13 = v62;
LABEL_63:

                  v10 = v65;
                  goto LABEL_64;
                }
                v28 = v18;
              }
              v63 = v28;
              goto LABEL_52;
            }
            v63 = 0;
          }
          else
          {
            v63 = 0;
            v9 = v15;
          }
          self = v14;
LABEL_52:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("safariProfileID"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = self;
          if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v70)
              {
                v47 = 0;
                a4 = 0;
                goto LABEL_60;
              }
              v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v51 = *MEMORY[0x1E0D025B8];
              v76 = *MEMORY[0x1E0CB2D50];
              v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("safariProfileID"));
              v77 = v49;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v51, 2, v48);
              a4 = 0;
              v47 = 0;
              *v70 = v52;
              goto LABEL_59;
            }
            v47 = v45;
          }
          else
          {
            v47 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uniqueID"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v70)
              {
                v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v58 = *MEMORY[0x1E0D025B8];
                v74 = *MEMORY[0x1E0CB2D50];
                v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
                v75 = v53;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *v70 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v58, 2, v54);

              }
              v49 = 0;
              a4 = 0;
              goto LABEL_59;
            }
            v49 = v48;
          }
          else
          {
            v49 = 0;
          }
          a4 = -[BMAppMediaUsage initWithStarting:bundleID:URL:mediaURL:isUsageTrusted:absoluteTimestamp:safariProfileID:uniqueID:](v46, "initWithStarting:bundleID:URL:mediaURL:isUsageTrusted:absoluteTimestamp:safariProfileID:uniqueID:", v66, v65, v68, v71, v67, v63, v47, v49);
          v46 = (BMAppMediaUsage *)a4;
LABEL_59:

LABEL_60:
          self = v46;
          goto LABEL_61;
        }
        v64 = self;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v9;
          v16 = v7;
          v71 = v13;
          v14 = v64;
          goto LABEL_13;
        }
        a4 = v70;
        if (v70)
        {
          v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v82 = *MEMORY[0x1E0CB2D50];
          v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mediaURL"));
          v83 = v67;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v36;
          v39 = (void *)v37;
          v40 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v38, 2, v37);
          v71 = 0;
          a4 = 0;
          v31 = v68;
          *v70 = v40;
LABEL_64:

          goto LABEL_65;
        }
        v71 = 0;
        v31 = v68;
LABEL_65:

        goto LABEL_66;
      }
      a4 = v70;
      if (v70)
      {
        v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("URL"));
        v85 = v71;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v33, 2, v34);
        v31 = 0;
        a4 = 0;
        *v70 = v35;
        v13 = (void *)v34;
        goto LABEL_65;
      }
      v31 = 0;
LABEL_66:

      goto LABEL_67;
    }
    if (a4)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0D025B8];
      v86 = *MEMORY[0x1E0CB2D50];
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
      v87 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2);
      v10 = 0;
      a4 = 0;
      *v70 = v32;
      goto LABEL_66;
    }
    v10 = 0;
LABEL_67:

    goto LABEL_68;
  }
  if (a4)
  {
    v19 = a4;
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0D025B8];
    v88 = *MEMORY[0x1E0CB2D50];
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
    v89[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v9);
    v8 = 0;
    a4 = 0;
    *v19 = v22;
    goto LABEL_67;
  }
  v8 = 0;
LABEL_68:

  return (BMAppMediaUsage *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  if (-[BMAppMediaUsage hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppMediaUsage starting](self, "starting"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMAppMediaUsage bundleID](self, "bundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage URL](self, "URL");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage mediaURL](self, "mediaURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAppMediaUsage hasIsUsageTrusted](self, "hasIsUsageTrusted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppMediaUsage isUsageTrusted](self, "isUsageTrusted"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
  -[BMAppMediaUsage absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppMediaUsage absoluteTimestamp](self, "absoluteTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[BMAppMediaUsage safariProfileID](self, "safariProfileID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppMediaUsage uniqueID](self, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("starting");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v12;
  v31[0] = v12;
  v30[1] = CFSTR("bundleID");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v13;
  v31[1] = v13;
  v30[2] = CFSTR("URL");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v14;
  v31[2] = v14;
  v30[3] = CFSTR("mediaURL");
  v15 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v3;
  v31[3] = v15;
  v30[4] = CFSTR("isUsageTrusted");
  v16 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v4;
  v31[4] = v16;
  v30[5] = CFSTR("absoluteTimestamp");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v5;
  v31[5] = v17;
  v30[6] = CFSTR("safariProfileID");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[6] = v19;
  v30[7] = CFSTR("uniqueID");
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[7] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_28;
  }
  else
  {

    if (v10)
      goto LABEL_28;
  }

LABEL_28:
  if (!v9)

  if (!v28)
  if (v29)
  {
    if (v18)
      goto LABEL_34;
  }
  else
  {

    if (v18)
    {
LABEL_34:
      if (v26)
        goto LABEL_35;
LABEL_41:

      if (v27)
        goto LABEL_36;
LABEL_42:

      goto LABEL_36;
    }
  }

  if (!v26)
    goto LABEL_41;
LABEL_35:
  if (!v27)
    goto LABEL_42;
LABEL_36:

  return v21;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
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
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMAppMediaUsage hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMAppMediaUsage hasStarting](self, "hasStarting"))
        goto LABEL_31;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_31;
      v6 = -[BMAppMediaUsage starting](self, "starting");
      if (v6 != objc_msgSend(v5, "starting"))
        goto LABEL_31;
    }
    -[BMAppMediaUsage bundleID](self, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMAppMediaUsage bundleID](self, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_31;
    }
    -[BMAppMediaUsage URL](self, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMAppMediaUsage URL](self, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_31;
    }
    -[BMAppMediaUsage mediaURL](self, "mediaURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaURL");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMAppMediaUsage mediaURL](self, "mediaURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_31;
    }
    if (-[BMAppMediaUsage hasIsUsageTrusted](self, "hasIsUsageTrusted")
      || objc_msgSend(v5, "hasIsUsageTrusted"))
    {
      if (!-[BMAppMediaUsage hasIsUsageTrusted](self, "hasIsUsageTrusted"))
        goto LABEL_31;
      if (!objc_msgSend(v5, "hasIsUsageTrusted"))
        goto LABEL_31;
      v26 = -[BMAppMediaUsage isUsageTrusted](self, "isUsageTrusted");
      if (v26 != objc_msgSend(v5, "isUsageTrusted"))
        goto LABEL_31;
    }
    -[BMAppMediaUsage absoluteTimestamp](self, "absoluteTimestamp");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[BMAppMediaUsage absoluteTimestamp](self, "absoluteTimestamp");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_31;
    }
    -[BMAppMediaUsage safariProfileID](self, "safariProfileID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safariProfileID");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[BMAppMediaUsage safariProfileID](self, "safariProfileID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safariProfileID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
      {
LABEL_31:
        v13 = 0;
LABEL_32:

        goto LABEL_33;
      }
    }
    -[BMAppMediaUsage uniqueID](self, "uniqueID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 == v41)
    {
      v13 = 1;
    }
    else
    {
      -[BMAppMediaUsage uniqueID](self, "uniqueID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v42, "isEqual:", v43);

    }
    goto LABEL_32;
  }
  v13 = 0;
LABEL_33:

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

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)URL
{
  return self->_URL;
}

- (NSString)mediaURL
{
  return self->_mediaURL;
}

- (BOOL)isUsageTrusted
{
  return self->_isUsageTrusted;
}

- (BOOL)hasIsUsageTrusted
{
  return self->_hasIsUsageTrusted;
}

- (void)setHasIsUsageTrusted:(BOOL)a3
{
  self->_hasIsUsageTrusted = a3;
}

- (NSString)safariProfileID
{
  return self->_safariProfileID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_safariProfileID, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMAppMediaUsage initByReadFrom:]([BMAppMediaUsage alloc], "initByReadFrom:", v6);
    v7[9] = 1;

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("URL"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaURL"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUsageTrusted"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 6, 0, 2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("safariProfileID"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 8, 13, 0);
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
  return &unk_1E5F1C4E0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("URL"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaURL"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUsageTrusted"), 5, 12, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 6, 0, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("safariProfileID"), 7, 13, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
