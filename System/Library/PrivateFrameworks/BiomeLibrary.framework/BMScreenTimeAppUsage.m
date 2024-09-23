@implementation BMScreenTimeAppUsage

- (BMScreenTimeAppUsage)initWithStarting:(id)a3 absoluteTimestamp:(id)a4 bundleID:(id)a5 parentBundleID:(id)a6 isUsageTrusted:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BMScreenTimeAppUsage *v17;
  double v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMScreenTimeAppUsage;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v17->_hasStarting = 1;
      v17->_starting = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v17->_hasStarting = 0;
      v17->_starting = 0;
    }
    if (v13)
    {
      v17->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v13, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_absoluteTimestamp = 0;
      v18 = -1.0;
    }
    v17->_raw_absoluteTimestamp = v18;
    objc_storeStrong((id *)&v17->_bundleID, a5);
    objc_storeStrong((id *)&v17->_parentBundleID, a6);
    if (v16)
    {
      v17->_hasIsUsageTrusted = 1;
      v17->_isUsageTrusted = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v17->_hasIsUsageTrusted = 0;
      v17->_isUsageTrusted = 0;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMScreenTimeAppUsage starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeAppUsage absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeAppUsage bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeAppUsage parentBundleID](self, "parentBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMScreenTimeAppUsage isUsageTrusted](self, "isUsageTrusted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMScreenTimeAppUsage with starting: %@, absoluteTimestamp: %@, bundleID: %@, parentBundleID: %@, isUsageTrusted: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMScreenTimeAppUsage *v5;
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
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  BOOL v40;
  uint64_t v41;
  BMScreenTimeAppUsage *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMScreenTimeAppUsage;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
    goto LABEL_56;
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
              goto LABEL_43;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_45;
            }
          }
          v4[*v8] = 1;
LABEL_43:
          if (v4[*v8])
            v22 = 0;
LABEL_45:
          v40 = v22 != 0;
          v41 = 32;
          goto LABEL_50;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
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
          v5->_raw_absoluteTimestamp = v29;
          continue;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 40;
          goto LABEL_34;
        case 4u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 48;
LABEL_34:
          v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        case 5u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasIsUsageTrusted = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_55;
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
          goto LABEL_47;
        v33 += 7;
        v17 = v34++ >= 9;
        if (v17)
        {
          v35 = 0;
          goto LABEL_49;
        }
      }
      v4[*v8] = 1;
LABEL_47:
      if (v4[*v8])
        v35 = 0;
LABEL_49:
      v40 = v35 != 0;
      v41 = 34;
LABEL_50:
      *((_BYTE *)&v5->super.super.isa + v41) = v40;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_55:
    v42 = 0;
  else
LABEL_56:
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
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_parentBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasIsUsageTrusted)
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
  -[BMScreenTimeAppUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMScreenTimeAppUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  BMScreenTimeAppUsage *v18;
  id v19;
  void *v20;
  BMScreenTimeAppUsage *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
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
          v39 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            goto LABEL_43;
          }
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v48 = *MEMORY[0x1E0CB2D50];
          v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v49 = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v20);
          a4 = 0;
          goto LABEL_42;
        }
        v14 = v8;
      }
      v39 = v14;
    }
    else
    {
      v39 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v7;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v40 = 0;
          v18 = 0;
          a4 = v39;
          goto LABEL_42;
        }
        v21 = self;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v47 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v40 = 0;
        *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v22);
        goto LABEL_50;
      }
      v21 = self;
      v40 = v20;
    }
    else
    {
      v21 = self;
      v40 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parentBundleID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
LABEL_22:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUsageTrusted"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = 0;
LABEL_25:
        a4 = v39;
        v18 = -[BMScreenTimeAppUsage initWithStarting:absoluteTimestamp:bundleID:parentBundleID:isUsageTrusted:](v21, "initWithStarting:absoluteTimestamp:bundleID:parentBundleID:isUsageTrusted:", v41, v39, v40, v23, v25);
        v21 = v18;
LABEL_40:

LABEL_41:
        self = v21;
        v7 = v38;
LABEL_42:

        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v24;
        goto LABEL_25;
      }
      if (a4)
      {
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isUsageTrusted"));
        v43 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v35, 2, v31);

      }
      v25 = 0;
      v18 = 0;
LABEL_39:
      a4 = v39;
      goto LABEL_40;
    }
    if (a4)
    {
      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v44 = *MEMORY[0x1E0CB2D50];
      v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("parentBundleID"));
      v45 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v28, 2, v24);
      v18 = 0;
      v23 = 0;
      *a4 = v29;
      goto LABEL_39;
    }
    v23 = 0;
    v18 = 0;
LABEL_50:
    a4 = v39;
    goto LABEL_41;
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
    goto LABEL_44;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v50 = *MEMORY[0x1E0CB2D50];
  v17 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
  v51[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v18 = 0;
  *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v8);
  a4 = v17;
LABEL_43:

LABEL_44:
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
  if (-[BMScreenTimeAppUsage hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMScreenTimeAppUsage starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMScreenTimeAppUsage absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMScreenTimeAppUsage absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMScreenTimeAppUsage bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeAppUsage parentBundleID](self, "parentBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMScreenTimeAppUsage hasIsUsageTrusted](self, "hasIsUsageTrusted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMScreenTimeAppUsage isUsageTrusted](self, "isUsageTrusted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v20 = CFSTR("starting");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v11;
  v25[0] = v11;
  v21 = CFSTR("absoluteTimestamp");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v12;
  v22 = CFSTR("bundleID");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v13;
  v23 = CFSTR("parentBundleID");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v14;
  v24 = CFSTR("isUsageTrusted");
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
      goto LABEL_22;
  }
  else
  {

    if (v9)
    {
LABEL_22:
      if (v8)
        goto LABEL_23;
      goto LABEL_28;
    }
  }

  if (v8)
  {
LABEL_23:
    if (v7)
      goto LABEL_24;
LABEL_29:

    if (v3)
      goto LABEL_25;
LABEL_30:

    goto LABEL_25;
  }
LABEL_28:

  if (!v7)
    goto LABEL_29;
LABEL_24:
  if (!v3)
    goto LABEL_30;
LABEL_25:

  return v16;
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
  int v13;
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
  _BOOL4 v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMScreenTimeAppUsage hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMScreenTimeAppUsage hasStarting](self, "hasStarting"))
        goto LABEL_25;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_25;
      v6 = -[BMScreenTimeAppUsage starting](self, "starting");
      if (v6 != objc_msgSend(v5, "starting"))
        goto LABEL_25;
    }
    -[BMScreenTimeAppUsage absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMScreenTimeAppUsage absoluteTimestamp](self, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_25;
    }
    -[BMScreenTimeAppUsage bundleID](self, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMScreenTimeAppUsage bundleID](self, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_25;
    }
    -[BMScreenTimeAppUsage parentBundleID](self, "parentBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentBundleID");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMScreenTimeAppUsage parentBundleID](self, "parentBundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentBundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_25;
    }
    if (!-[BMScreenTimeAppUsage hasIsUsageTrusted](self, "hasIsUsageTrusted")
      && !objc_msgSend(v5, "hasIsUsageTrusted"))
    {
      LOBYTE(v13) = 1;
      goto LABEL_26;
    }
    if (-[BMScreenTimeAppUsage hasIsUsageTrusted](self, "hasIsUsageTrusted")
      && objc_msgSend(v5, "hasIsUsageTrusted"))
    {
      v26 = -[BMScreenTimeAppUsage isUsageTrusted](self, "isUsageTrusted");
      v13 = v26 ^ objc_msgSend(v5, "isUsageTrusted") ^ 1;
LABEL_26:

      goto LABEL_27;
    }
LABEL_25:
    LOBYTE(v13) = 0;
    goto LABEL_26;
  }
  LOBYTE(v13) = 0;
LABEL_27:

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

- (NSString)parentBundleID
{
  return self->_parentBundleID;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
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

    v4 = -[BMScreenTimeAppUsage initByReadFrom:]([BMScreenTimeAppUsage alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("parentBundleID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUsageTrusted"), 0, 0, 5, 12, 0);
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
  return &unk_1E5F1DCF8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parentBundleID"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUsageTrusted"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
