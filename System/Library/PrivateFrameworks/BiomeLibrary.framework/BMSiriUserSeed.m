@implementation BMSiriUserSeed

- (BMSiriUserSeed)initWithSeed:(id)a3 effectiveFrom:(id)a4 validityDays:(id)a5 createdOn:(id)a6 adoptedOn:(id)a7 switchedCount:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMSiriUserSeed *v20;
  uint64_t v21;
  NSData *raw_seed;
  double v23;
  unsigned int v24;
  double v25;
  double v26;
  unsigned int v27;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriUserSeed;
  v20 = -[BMEventBase init](&v29, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v30[0] = 0;
      v30[1] = 0;
      objc_msgSend(v14, "getUUIDBytes:", v30);
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v30, 16);
      raw_seed = v20->_raw_seed;
      v20->_raw_seed = (NSData *)v21;
    }
    else
    {
      raw_seed = v20->_raw_seed;
      v20->_raw_seed = 0;
    }

    if (v15)
    {
      v20->_hasRaw_effectiveFrom = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_effectiveFrom = 0;
      v23 = -1.0;
    }
    v20->_raw_effectiveFrom = v23;
    if (v16)
    {
      v20->_hasValidityDays = 1;
      v24 = objc_msgSend(v16, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v20->_hasValidityDays = 0;
    }
    v20->_validityDays = v24;
    if (v17)
    {
      v20->_hasRaw_createdOn = 1;
      objc_msgSend(v17, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_createdOn = 0;
      v25 = -1.0;
    }
    v20->_raw_createdOn = v25;
    if (v18)
    {
      v20->_hasRaw_adoptedOn = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_adoptedOn = 0;
      v26 = -1.0;
    }
    v20->_raw_adoptedOn = v26;
    if (v19)
    {
      v20->_hasSwitchedCount = 1;
      v27 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v27 = 0;
      v20->_hasSwitchedCount = 0;
    }
    v20->_switchedCount = v27;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriUserSeed seed](self, "seed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserSeed effectiveFrom](self, "effectiveFrom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriUserSeed validityDays](self, "validityDays"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserSeed createdOn](self, "createdOn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriUserSeed adoptedOn](self, "adoptedOn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriUserSeed switchedCount](self, "switchedCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriUserSeed with seed: %@, effectiveFrom: %@, validityDays: %@, createdOn: %@, adoptedOn: %@, switchedCount: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriUserSeed *v5;
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
  NSData *v20;
  NSData *raw_seed;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  objc_class *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  BMSiriUserSeed *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMSiriUserSeed;
  v5 = -[BMEventBase init](&v46, sel_init);
  if (!v5)
    goto LABEL_66;
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
          PBReaderReadData();
          v20 = (NSData *)objc_claimAutoreleasedReturnValue();
          if (-[NSData length](v20, "length") == 16)
          {
            raw_seed = v5->_raw_seed;
            v5->_raw_seed = v20;

            continue;
          }

          goto LABEL_65;
        case 2u:
          v5->_hasRaw_effectiveFrom = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v43 = 32;
          goto LABEL_62;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasValidityDays = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_50:
          v42 = 80;
          goto LABEL_55;
        case 4u:
          v5->_hasRaw_createdOn = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v43 = 48;
          goto LABEL_62;
        case 5u:
          v5->_hasRaw_adoptedOn = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v43 = 64;
LABEL_62:
          *(Class *)((char *)&v5->super.super.isa + v43) = v31;
          continue;
        case 6u:
          v36 = 0;
          v37 = 0;
          v24 = 0;
          v5->_hasSwitchedCount = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_65;
          continue;
      }
      while (1)
      {
        v38 = *v6;
        v39 = *(_QWORD *)&v4[v38];
        v40 = v39 + 1;
        if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
          break;
        v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
        *(_QWORD *)&v4[v38] = v40;
        v24 |= (unint64_t)(v41 & 0x7F) << v36;
        if ((v41 & 0x80) == 0)
          goto LABEL_52;
        v36 += 7;
        v17 = v37++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_54;
        }
      }
      v4[*v8] = 1;
LABEL_52:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_54:
      v42 = 84;
LABEL_55:
      *(_DWORD *)((char *)&v5->super.super.isa + v42) = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_65:
    v44 = 0;
  else
LABEL_66:
    v44 = v5;

  return v44;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_raw_seed)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_hasRaw_effectiveFrom)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasValidityDays)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasRaw_createdOn)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRaw_adoptedOn)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasSwitchedCount)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriUserSeed writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriUserSeed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id *v20;
  uint64_t v21;
  BMSiriUserSeed *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  BMSiriUserSeed *v37;
  void *v38;
  objc_class *v39;
  id v40;
  id v41;
  double v42;
  double v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v49;
  void *v50;
  id v51;
  id *v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  id *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seed"));
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
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (!v11)
    {
      if (a4)
      {
        v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v52 = a4;
        v53 = *MEMORY[0x1E0D025B8];
        v85 = *MEMORY[0x1E0CB2D50];
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("seed"));
        v86[0] = v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v53, 2, v54);

        v22 = 0;
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_50;
    }
    v12 = (void *)v11;

    v8 = v12;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("effectiveFrom"));
    v9 = objc_claimAutoreleasedReturnValue();
    v65 = a4;
    v67 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (objc_class *)MEMORY[0x1E0C99D68];
        v14 = v10;
        v15 = [v13 alloc];
        objc_msgSend(v14, "doubleValue");
        v17 = v16;

        v18 = (id)objc_msgSend(v15, "initWithTimeIntervalSince1970:", v17);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v23, "dateFromString:", v10);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v70 = 0;
            v22 = 0;
LABEL_48:

            goto LABEL_50;
          }
          v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = *MEMORY[0x1E0D025B8];
          v81 = *MEMORY[0x1E0CB2D50];
          v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("effectiveFrom"));
          v82 = v69;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 0;
          v22 = 0;
          *v65 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2, v24);
LABEL_47:

          v10 = v67;
          goto LABEL_48;
        }
        v18 = v10;
      }
      v70 = v18;
    }
    else
    {
      v70 = 0;
    }
LABEL_17:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("validityDays"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v8;
    if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v69 = 0;
          v22 = 0;
          goto LABEL_47;
        }
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v79 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("validityDays"));
        v80 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        v22 = 0;
        *v65 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v25);
        goto LABEL_46;
      }
      v69 = v24;
    }
    else
    {
      v69 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("createdOn"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v7;
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (objc_class *)MEMORY[0x1E0C99D68];
        v28 = v25;
        v29 = [v27 alloc];
        objc_msgSend(v28, "doubleValue");
        v31 = v30;

        v32 = (id)objc_msgSend(v29, "initWithTimeIntervalSince1970:", v31);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v35, "dateFromString:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v26 = 0;
            v22 = 0;
            goto LABEL_46;
          }
          v37 = self;
          v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v58 = *MEMORY[0x1E0D025B8];
          v77 = *MEMORY[0x1E0CB2D50];
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("createdOn"));
          v78 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v36);
          v26 = 0;
          v22 = 0;
          *v65 = v59;
LABEL_45:

          self = v37;
          v7 = v66;
LABEL_46:

          v8 = v68;
          goto LABEL_47;
        }
        v32 = v25;
      }
      v26 = v32;
    }
    else
    {
      v26 = 0;
    }
LABEL_32:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adoptedOn"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = self;
        v39 = (objc_class *)MEMORY[0x1E0C99D68];
        v40 = v36;
        v41 = [v39 alloc];
        objc_msgSend(v40, "doubleValue");
        v43 = v42;

        v44 = (id)objc_msgSend(v41, "initWithTimeIntervalSince1970:", v43);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37 = self;
          v45 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v45, "dateFromString:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_40;
        }
        objc_opt_class();
        v37 = self;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v65)
          {
            v38 = 0;
            v22 = 0;
            goto LABEL_45;
          }
          v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = *MEMORY[0x1E0D025B8];
          v75 = *MEMORY[0x1E0CB2D50];
          v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("adoptedOn"));
          v76 = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2, v46);
          v38 = 0;
          v22 = 0;
          *v65 = v62;
          goto LABEL_44;
        }
        v44 = v36;
      }
      v38 = v44;
    }
    else
    {
      v37 = self;
      v38 = 0;
    }
LABEL_40:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("switchedCount"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v65)
        {
          v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v63 = *MEMORY[0x1E0D025B8];
          v73 = *MEMORY[0x1E0CB2D50];
          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("switchedCount"));
          v74 = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *v65 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v63, 2, v50);

        }
        v47 = 0;
        v22 = 0;
        goto LABEL_44;
      }
      v47 = v46;
    }
    else
    {
      v47 = 0;
    }
    v22 = -[BMSiriUserSeed initWithSeed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:](v37, "initWithSeed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:", v68, v70, v69, v26, v38, v47);
    v37 = v22;
LABEL_44:

    goto LABEL_45;
  }
  if (!a4)
  {
    v22 = 0;
    goto LABEL_51;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = a4;
  v21 = *MEMORY[0x1E0D025B8];
  v83 = *MEMORY[0x1E0CB2D50];
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("seed"));
  v84 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  *v20 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2);

LABEL_50:
LABEL_51:

  return v22;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  _QWORD v32[7];

  v32[6] = *MEMORY[0x1E0C80C00];
  -[BMSiriUserSeed seed](self, "seed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMSiriUserSeed effectiveFrom](self, "effectiveFrom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserSeed effectiveFrom](self, "effectiveFrom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  if (-[BMSiriUserSeed hasValidityDays](self, "hasValidityDays"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriUserSeed validityDays](self, "validityDays"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[BMSiriUserSeed createdOn](self, "createdOn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserSeed createdOn](self, "createdOn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  -[BMSiriUserSeed adoptedOn](self, "adoptedOn");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriUserSeed adoptedOn](self, "adoptedOn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    objc_msgSend(v15, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  if (-[BMSiriUserSeed hasSwitchedCount](self, "hasSwitchedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriUserSeed switchedCount](self, "switchedCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v30 = (void *)v4;
  v31[0] = CFSTR("seed");
  v19 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v27 = v19;
  v29 = (void *)v8;
  v32[0] = v19;
  v31[1] = CFSTR("effectiveFrom");
  v20 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[1] = v20;
  v31[2] = CFSTR("validityDays");
  v21 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[2] = v21;
  v31[3] = CFSTR("createdOn");
  v22 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[3] = v22;
  v31[4] = CFSTR("adoptedOn");
  v23 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[4] = v23;
  v31[5] = CFSTR("switchedCount");
  v24 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 6, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_30;
  }
  else
  {

    if (v17)
    {
LABEL_30:
      if (v13)
        goto LABEL_31;
LABEL_39:

      if (v9)
        goto LABEL_32;
      goto LABEL_40;
    }
  }

  if (!v13)
    goto LABEL_39;
LABEL_31:
  if (v9)
    goto LABEL_32;
LABEL_40:

LABEL_32:
  if (!v29)

  if (!v30)
  return v25;
}

- (NSUUID)seed
{
  NSData *raw_seed;
  void *v3;

  raw_seed = self->_raw_seed;
  if (raw_seed)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_seed, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
}

- (NSDate)effectiveFrom
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_effectiveFrom)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_effectiveFrom);
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

- (NSDate)createdOn
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_createdOn)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_createdOn);
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

- (NSDate)adoptedOn
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_adoptedOn)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_adoptedOn);
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
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unsigned int v19;
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
  unsigned int v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriUserSeed seed](self, "seed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seed");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriUserSeed seed](self, "seed");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "seed");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_29;
    }
    -[BMSiriUserSeed effectiveFrom](self, "effectiveFrom");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveFrom");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriUserSeed effectiveFrom](self, "effectiveFrom");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveFrom");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_29;
    }
    if (-[BMSiriUserSeed hasValidityDays](self, "hasValidityDays") || objc_msgSend(v5, "hasValidityDays"))
    {
      if (!-[BMSiriUserSeed hasValidityDays](self, "hasValidityDays"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasValidityDays"))
        goto LABEL_29;
      v19 = -[BMSiriUserSeed validityDays](self, "validityDays");
      if (v19 != objc_msgSend(v5, "validityDays"))
        goto LABEL_29;
    }
    -[BMSiriUserSeed createdOn](self, "createdOn");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createdOn");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMSiriUserSeed createdOn](self, "createdOn");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createdOn");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_29;
    }
    -[BMSiriUserSeed adoptedOn](self, "adoptedOn");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adoptedOn");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMSiriUserSeed adoptedOn](self, "adoptedOn");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "adoptedOn");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_29;
    }
    if (!-[BMSiriUserSeed hasSwitchedCount](self, "hasSwitchedCount")
      && !objc_msgSend(v5, "hasSwitchedCount"))
    {
      v12 = 1;
      goto LABEL_30;
    }
    if (-[BMSiriUserSeed hasSwitchedCount](self, "hasSwitchedCount")
      && objc_msgSend(v5, "hasSwitchedCount"))
    {
      v32 = -[BMSiriUserSeed switchedCount](self, "switchedCount");
      v12 = v32 == objc_msgSend(v5, "switchedCount");
LABEL_30:

      goto LABEL_31;
    }
LABEL_29:
    v12 = 0;
    goto LABEL_30;
  }
  v12 = 0;
LABEL_31:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)validityDays
{
  return self->_validityDays;
}

- (BOOL)hasValidityDays
{
  return self->_hasValidityDays;
}

- (void)setHasValidityDays:(BOOL)a3
{
  self->_hasValidityDays = a3;
}

- (unsigned)switchedCount
{
  return self->_switchedCount;
}

- (BOOL)hasSwitchedCount
{
  return self->_hasSwitchedCount;
}

- (void)setHasSwitchedCount:(BOOL)a3
{
  self->_hasSwitchedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw_seed, 0);
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

    v4 = -[BMSiriUserSeed initByReadFrom:]([BMSiriUserSeed alloc], "initByReadFrom:", v7);
    v4[19] = 0;

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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("seed"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("effectiveFrom"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("validityDays"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("createdOn"), 3, 0, 4, 0, 2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("adoptedOn"), 3, 0, 5, 0, 2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("switchedCount"), 0, 0, 6, 4, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D7B8;
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("seed"), 1, 14, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("effectiveFrom"), 2, 0, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("validityDays"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("createdOn"), 4, 0, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("adoptedOn"), 5, 0, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("switchedCount"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
