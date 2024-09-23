@implementation BMAppWebUsage

- (BMAppWebUsage)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 usageState:(int)a5 webpageURL:(id)a6 webDomain:(id)a7 applicationID:(id)a8 deviceID:(id)a9 isUsageTrusted:(id)a10 safariProfileID:(id)a11
{
  id v17;
  id v18;
  id v19;
  BMAppWebUsage *v20;
  double v21;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v17 = a4;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v18 = a10;
  v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)BMAppWebUsage;
  v20 = -[BMEventBase init](&v29, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_uniqueID, a3);
    if (v17)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      v21 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v21;
    v20->_usageState = a5;
    objc_storeStrong((id *)&v20->_webpageURL, a6);
    objc_storeStrong((id *)&v20->_webDomain, a7);
    objc_storeStrong((id *)&v20->_applicationID, a8);
    objc_storeStrong((id *)&v20->_deviceID, a9);
    if (v18)
    {
      v20->_hasIsUsageTrusted = 1;
      v20->_isUsageTrusted = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v20->_hasIsUsageTrusted = 0;
      v20->_isUsageTrusted = 0;
    }
    objc_storeStrong((id *)&v20->_safariProfileID, a11);
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
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppWebUsage uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppWebUsageStateAsString(-[BMAppWebUsage usageState](self, "usageState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage webpageURL](self, "webpageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage webDomain](self, "webDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage applicationID](self, "applicationID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage deviceID](self, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppWebUsage isUsageTrusted](self, "isUsageTrusted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage safariProfileID](self, "safariProfileID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppWebUsage with uniqueID: %@, absoluteTimestamp: %@, usageState: %@, webpageURL: %@, webDomain: %@, applicationID: %@, deviceID: %@, isUsageTrusted: %@, safariProfileID: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppWebUsage *v5;
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
  uint64_t v36;
  unint64_t v37;
  char v38;
  void *v39;
  BMAppWebUsage *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMAppWebUsage;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
    goto LABEL_62;
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
          goto LABEL_45;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
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
          v5->_raw_absoluteTimestamp = v24;
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
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_51:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v5->_usageState = v27;
          continue;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_45;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_45;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_45;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
          goto LABEL_45;
        case 8u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v5->_hasIsUsageTrusted = 1;
          break;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
LABEL_45:
          v39 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_61;
          continue;
      }
      while (1)
      {
        v35 = *v6;
        v36 = *(_QWORD *)&v4[v35];
        v37 = v36 + 1;
        if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
          break;
        v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
        *(_QWORD *)&v4[v35] = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0)
          goto LABEL_55;
        v32 += 7;
        v17 = v33++ >= 9;
        if (v17)
        {
          v34 = 0;
          goto LABEL_57;
        }
      }
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8])
        v34 = 0;
LABEL_57:
      v5->_isUsageTrusted = v34 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_61:
    v40 = 0;
  else
LABEL_62:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_webpageURL)
    PBDataWriterWriteStringField();
  if (self->_webDomain)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_applicationID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsUsageTrusted)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_safariProfileID)
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
  -[BMAppWebUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppWebUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BMAppWebUsage *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  BMAppWebUsage *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (objc_class *)MEMORY[0x1E0C99D68];
        v11 = v8;
        v12 = [v10 alloc];
        objc_msgSend(v11, "doubleValue");
        v14 = v13;

        v15 = (id)objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:", v14);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v21, "dateFromString:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v9 = 0;
            v20 = 0;
            goto LABEL_45;
          }
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = *MEMORY[0x1E0D025B8];
          v86 = *MEMORY[0x1E0CB2D50];
          v70 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v87 = v70;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2);
          v9 = 0;
          v20 = 0;
          *a4 = v57;
          goto LABEL_44;
        }
        v15 = v8;
      }
      v9 = v15;
    }
    else
    {
      v9 = 0;
    }
LABEL_16:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("usageState"));
    v22 = objc_claimAutoreleasedReturnValue();
    v65 = v8;
    v68 = (void *)v22;
    if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v70 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v70 = 0;
            v20 = 0;
            goto LABEL_44;
          }
          v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = v9;
          v48 = *MEMORY[0x1E0D025B8];
          v84 = *MEMORY[0x1E0CB2D50];
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("usageState"));
          v85 = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48;
          v9 = v47;
          v70 = 0;
          v20 = 0;
          *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v49, 2, v24);
LABEL_43:

          v8 = v65;
LABEL_44:

          goto LABEL_45;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppWebUsageStateFromString(v23));
        v70 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v70 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("webpageURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v7;
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v20 = 0;
          goto LABEL_43;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = v9;
        v36 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("webpageURL"));
        v83 = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        v9 = v35;
        v20 = 0;
        v32 = 0;
        *a4 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v37, 2, v25);
        goto LABEL_42;
      }
      v64 = v24;
    }
    else
    {
      v64 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("webDomain"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v6;
    v63 = v9;
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v67 = 0;
          v20 = 0;
          v32 = v64;
          goto LABEL_42;
        }
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("webDomain"));
        v81 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v67 = 0;
        *a4 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v26);
        goto LABEL_86;
      }
      v67 = v25;
    }
    else
    {
      v67 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("applicationID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v62 = 0;
LABEL_28:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = self;
      if (v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v61 = 0;
            v20 = 0;
            goto LABEL_40;
          }
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v76 = *MEMORY[0x1E0CB2D50];
          v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceID"));
          v77 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v28);
          v20 = 0;
          v61 = 0;
          *a4 = v45;
          goto LABEL_39;
        }
        v61 = v27;
      }
      else
      {
        v61 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isUsageTrusted"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v29 = 0;
            v20 = 0;
            goto LABEL_39;
          }
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = *MEMORY[0x1E0D025B8];
          v74 = *MEMORY[0x1E0CB2D50];
          v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isUsageTrusted"));
          v75 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v30);
          v20 = 0;
          v29 = 0;
          *a4 = v52;
          goto LABEL_38;
        }
        v29 = v28;
      }
      else
      {
        v29 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("safariProfileID"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v58 = *MEMORY[0x1E0D025B8];
            v72 = *MEMORY[0x1E0CB2D50];
            v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("safariProfileID"));
            v73 = v53;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v58, 2, v54);

          }
          v31 = 0;
          v20 = 0;
          goto LABEL_38;
        }
        v31 = v30;
      }
      else
      {
        v31 = 0;
      }
      v20 = -[BMAppWebUsage initWithUniqueID:absoluteTimestamp:usageState:webpageURL:webDomain:applicationID:deviceID:isUsageTrusted:safariProfileID:](v66, "initWithUniqueID:absoluteTimestamp:usageState:webpageURL:webDomain:applicationID:deviceID:isUsageTrusted:safariProfileID:", v69, v63, objc_msgSend(v70, "intValue"), v64, v67, v62, v61, v29, v31);
      v66 = v20;
LABEL_38:

LABEL_39:
      self = v66;
LABEL_40:
      v32 = v64;

LABEL_41:
      v6 = v60;
      v9 = v63;
LABEL_42:

      v7 = v69;
      goto LABEL_43;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v62 = v26;
      goto LABEL_28;
    }
    if (a4)
    {
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = *MEMORY[0x1E0D025B8];
      v78 = *MEMORY[0x1E0CB2D50];
      v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("applicationID"));
      v79 = v61;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v27);
      v20 = 0;
      v62 = 0;
      *a4 = v42;
      goto LABEL_40;
    }
    v62 = 0;
    v20 = 0;
LABEL_86:
    v32 = v64;
    goto LABEL_41;
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
    v20 = 0;
    goto LABEL_46;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v88 = *MEMORY[0x1E0CB2D50];
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
  v89[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v9 = (void *)v18;
  v7 = 0;
  v20 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v19, 2, v8);
LABEL_45:

LABEL_46:
  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[9];
  _QWORD v34[11];

  v34[9] = *MEMORY[0x1E0C80C00];
  -[BMAppWebUsage uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppWebUsage absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppWebUsage usageState](self, "usageState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage webpageURL](self, "webpageURL");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage webDomain](self, "webDomain");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage applicationID](self, "applicationID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppWebUsage deviceID](self, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAppWebUsage hasIsUsageTrusted](self, "hasIsUsageTrusted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppWebUsage isUsageTrusted](self, "isUsageTrusted"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[BMAppWebUsage safariProfileID](self, "safariProfileID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("uniqueID");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v13;
  v34[0] = v13;
  v33[1] = CFSTR("absoluteTimestamp");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  v34[1] = v14;
  v33[2] = CFSTR("usageState");
  v15 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v15;
  v34[2] = v15;
  v33[3] = CFSTR("webpageURL");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v3;
  v24 = (void *)v16;
  v34[3] = v16;
  v33[4] = CFSTR("webDomain");
  v17 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v7;
  v34[4] = v17;
  v33[5] = CFSTR("applicationID");
  v18 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[5] = v18;
  v33[6] = CFSTR("deviceID");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v9;
  v34[6] = v19;
  v33[7] = CFSTR("isUsageTrusted");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[7] = v21;
  v33[8] = CFSTR("safariProfileID");
  v22 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[8] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 9);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_27;
LABEL_38:

    if (v10)
      goto LABEL_28;
    goto LABEL_39;
  }

  if (!v11)
    goto LABEL_38;
LABEL_27:
  if (v10)
    goto LABEL_28;
LABEL_39:

LABEL_28:
  if (!v31)

  if (!v32)
  if (v20)
  {
    if (v8)
      goto LABEL_34;
  }
  else
  {

    if (v8)
    {
LABEL_34:
      if (v29)
        goto LABEL_35;
LABEL_42:

      if (v30)
        goto LABEL_36;
LABEL_43:

      goto LABEL_36;
    }
  }

  if (!v29)
    goto LABEL_42;
LABEL_35:
  if (!v30)
    goto LABEL_43;
LABEL_36:

  return v28;
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
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
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
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppWebUsage uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppWebUsage uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[BMAppWebUsage absoluteTimestamp](self, "absoluteTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppWebUsage absoluteTimestamp](self, "absoluteTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_33;
    }
    v19 = -[BMAppWebUsage usageState](self, "usageState");
    if (v19 == objc_msgSend(v5, "usageState"))
    {
      -[BMAppWebUsage webpageURL](self, "webpageURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webpageURL");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMAppWebUsage webpageURL](self, "webpageURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "webpageURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_33;
      }
      -[BMAppWebUsage webDomain](self, "webDomain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webDomain");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMAppWebUsage webDomain](self, "webDomain");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "webDomain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_33;
      }
      -[BMAppWebUsage applicationID](self, "applicationID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "applicationID");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMAppWebUsage applicationID](self, "applicationID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "applicationID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_33;
      }
      -[BMAppWebUsage deviceID](self, "deviceID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceID");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[BMAppWebUsage deviceID](self, "deviceID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deviceID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_33;
      }
      if (!-[BMAppWebUsage hasIsUsageTrusted](self, "hasIsUsageTrusted")
        && !objc_msgSend(v5, "hasIsUsageTrusted")
        || -[BMAppWebUsage hasIsUsageTrusted](self, "hasIsUsageTrusted")
        && objc_msgSend(v5, "hasIsUsageTrusted")
        && (v44 = -[BMAppWebUsage isUsageTrusted](self, "isUsageTrusted"),
            v44 == objc_msgSend(v5, "isUsageTrusted")))
      {
        -[BMAppWebUsage safariProfileID](self, "safariProfileID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safariProfileID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46 == v47)
        {
          v12 = 1;
        }
        else
        {
          -[BMAppWebUsage safariProfileID](self, "safariProfileID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "safariProfileID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v48, "isEqual:", v49);

        }
        goto LABEL_34;
      }
    }
LABEL_33:
    v12 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v12 = 0;
LABEL_35:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (int)usageState
{
  return self->_usageState;
}

- (NSString)webpageURL
{
  return self->_webpageURL;
}

- (NSString)webDomain
{
  return self->_webDomain;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)deviceID
{
  return self->_deviceID;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariProfileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_webDomain, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
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

    v7 = -[BMAppWebUsage initByReadFrom:]([BMAppWebUsage alloc], "initByReadFrom:", v6);
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
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("usageState"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("webpageURL"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("webDomain"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("applicationID"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceID"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUsageTrusted"), 0, 0, 8, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("safariProfileID"), 2, 0, 9, 13, 0);
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
  return &unk_1E5F1C378;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("usageState"), 3, 4, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webpageURL"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webDomain"), 5, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("applicationID"), 6, 13, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceID"), 7, 13, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUsageTrusted"), 8, 12, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("safariProfileID"), 9, 13, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
