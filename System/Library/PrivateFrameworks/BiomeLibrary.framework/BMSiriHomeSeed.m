@implementation BMSiriHomeSeed

- (BMSiriHomeSeed)initWithHomeIdentifier:(id)a3 seed:(id)a4 effectiveFrom:(id)a5 validityDays:(id)a6 createdOn:(id)a7 adoptedOn:(id)a8 switchedCount:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BMSiriHomeSeed *v22;
  uint64_t v23;
  NSData *raw_homeIdentifier;
  uint64_t v25;
  NSData *raw_seed;
  double v27;
  unsigned int v28;
  double v29;
  double v30;
  unsigned int v31;
  objc_super v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v33.receiver = self;
  v33.super_class = (Class)BMSiriHomeSeed;
  v22 = -[BMEventBase init](&v33, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v15)
    {
      v34 = 0;
      v35 = 0;
      objc_msgSend(v15, "getUUIDBytes:", &v34);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v34, 16);
      raw_homeIdentifier = v22->_raw_homeIdentifier;
      v22->_raw_homeIdentifier = (NSData *)v23;
    }
    else
    {
      raw_homeIdentifier = v22->_raw_homeIdentifier;
      v22->_raw_homeIdentifier = 0;
    }

    if (v16)
    {
      v34 = 0;
      v35 = 0;
      objc_msgSend(v16, "getUUIDBytes:", &v34);
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v34, 16);
      raw_seed = v22->_raw_seed;
      v22->_raw_seed = (NSData *)v25;
    }
    else
    {
      raw_seed = v22->_raw_seed;
      v22->_raw_seed = 0;
    }

    if (v17)
    {
      v22->_hasRaw_effectiveFrom = 1;
      objc_msgSend(v17, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_effectiveFrom = 0;
      v27 = -1.0;
    }
    v22->_raw_effectiveFrom = v27;
    if (v18)
    {
      v22->_hasValidityDays = 1;
      v28 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v28 = 0;
      v22->_hasValidityDays = 0;
    }
    v22->_validityDays = v28;
    if (v19)
    {
      v22->_hasRaw_createdOn = 1;
      objc_msgSend(v19, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_createdOn = 0;
      v29 = -1.0;
    }
    v22->_raw_createdOn = v29;
    if (v20)
    {
      v22->_hasRaw_adoptedOn = 1;
      objc_msgSend(v20, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_adoptedOn = 0;
      v30 = -1.0;
    }
    v22->_raw_adoptedOn = v30;
    if (v21)
    {
      v22->_hasSwitchedCount = 1;
      v31 = objc_msgSend(v21, "unsignedIntValue");
    }
    else
    {
      v31 = 0;
      v22->_hasSwitchedCount = 0;
    }
    v22->_switchedCount = v31;
  }

  return v22;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriHomeSeed homeIdentifier](self, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriHomeSeed seed](self, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriHomeSeed effectiveFrom](self, "effectiveFrom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriHomeSeed validityDays](self, "validityDays"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriHomeSeed createdOn](self, "createdOn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriHomeSeed adoptedOn](self, "adoptedOn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriHomeSeed switchedCount](self, "switchedCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriHomeSeed with homeIdentifier: %@, seed: %@, effectiveFrom: %@, validityDays: %@, createdOn: %@, adoptedOn: %@, switchedCount: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriHomeSeed *v5;
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
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  objc_class *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  BMSiriHomeSeed *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMSiriHomeSeed;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
  {
LABEL_69:
    v45 = v5;
    goto LABEL_70;
  }
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_67:
    if (v4[*v8])
      goto LABEL_68;
    goto LABEL_69;
  }
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v8])
      goto LABEL_67;
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
      goto LABEL_67;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length") != 16)
          goto LABEL_71;
        v21 = 16;
        goto LABEL_26;
      case 2u:
        PBReaderReadData();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length") == 16)
        {
          v21 = 24;
LABEL_26:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

LABEL_66:
          if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
            goto LABEL_67;
          continue;
        }
LABEL_71:

LABEL_68:
        v45 = 0;
LABEL_70:

        return v45;
      case 3u:
        v5->_hasRaw_effectiveFrom = 1;
        v23 = *v6;
        v24 = *(_QWORD *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v25 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v24);
          *(_QWORD *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v25 = 0;
        }
        v44 = 40;
        goto LABEL_65;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v5->_hasValidityDays = 1;
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
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8])
          LODWORD(v28) = 0;
LABEL_53:
        v43 = 88;
        goto LABEL_58;
      case 5u:
        v5->_hasRaw_createdOn = 1;
        v33 = *v6;
        v34 = *(_QWORD *)&v4[v33];
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v25 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v34);
          *(_QWORD *)&v4[v33] = v34 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v25 = 0;
        }
        v44 = 56;
        goto LABEL_65;
      case 6u:
        v5->_hasRaw_adoptedOn = 1;
        v35 = *v6;
        v36 = *(_QWORD *)&v4[v35];
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v25 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v36);
          *(_QWORD *)&v4[v35] = v36 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v25 = 0;
        }
        v44 = 72;
LABEL_65:
        *(Class *)((char *)&v5->super.super.isa + v44) = v25;
        goto LABEL_66;
      case 7u:
        v37 = 0;
        v38 = 0;
        v28 = 0;
        v5->_hasSwitchedCount = 1;
        while (2)
        {
          v39 = *v6;
          v40 = *(_QWORD *)&v4[v39];
          v41 = v40 + 1;
          if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
            *(_QWORD *)&v4[v39] = v41;
            v28 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              v17 = v38++ >= 9;
              if (v17)
              {
                LODWORD(v28) = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8])
          LODWORD(v28) = 0;
LABEL_57:
        v43 = 92;
LABEL_58:
        *(_DWORD *)((char *)&v5->super.super.isa + v43) = v28;
        goto LABEL_66;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_68;
        goto LABEL_66;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_raw_homeIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
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
  -[BMSiriHomeSeed writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriHomeSeed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  BMSiriHomeSeed *v26;
  objc_class *v27;
  id v28;
  id v29;
  double v30;
  double v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  BMSiriHomeSeed *v44;
  void *v45;
  objc_class *v46;
  id v47;
  id v48;
  double v49;
  double v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  id *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
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
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeIdentifier"));
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
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (!v15)
    {
      if (!a4)
      {
        v26 = 0;
        goto LABEL_72;
      }
      v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v54 = *MEMORY[0x1E0D025B8];
      v105 = *MEMORY[0x1E0CB2D50];
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("homeIdentifier"));
      v106[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v55);

      v26 = 0;
      goto LABEL_71;
    }
    v16 = (void *)v15;

    v8 = v16;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
      if (!v17)
      {
        if (a4)
        {
          v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v85 = v10;
          v57 = *MEMORY[0x1E0D025B8];
          v101 = *MEMORY[0x1E0CB2D50];
          v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("seed"));
          v102 = v88;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v57;
          v10 = v85;
          *a4 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v59, 2, v58);

          v26 = 0;
        }
        else
        {
          v26 = 0;
        }
        goto LABEL_70;
      }
      v18 = (void *)v17;

      v10 = v18;
LABEL_7:
      v75 = a4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("effectiveFrom"));
      v11 = objc_claimAutoreleasedReturnValue();
      v84 = v10;
      v79 = (void *)v11;
      if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (objc_class *)MEMORY[0x1E0C99D68];
          v20 = v12;
          v21 = [v19 alloc];
          objc_msgSend(v20, "doubleValue");
          v23 = v22;

          v86 = (id)objc_msgSend(v21, "initWithTimeIntervalSince1970:", v23);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            objc_msgSend(v38, "dateFromString:", v12);
            v86 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v86 = 0;
                v26 = 0;
LABEL_68:

                goto LABEL_70;
              }
              v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v66 = *MEMORY[0x1E0D025B8];
              v97 = *MEMORY[0x1E0CB2D50];
              v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("effectiveFrom"));
              v98 = v82;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v66;
              v10 = v84;
              v86 = 0;
              v26 = 0;
              *v75 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v67, 2, v13);
LABEL_67:

              goto LABEL_68;
            }
            v86 = v12;
          }
        }
      }
      else
      {
        v86 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("validityDays"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v9;
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            v82 = 0;
            v26 = 0;
            goto LABEL_67;
          }
          v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v95 = *MEMORY[0x1E0CB2D50];
          v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("validityDays"));
          v96 = v80;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v39, 2, v14);
          v82 = 0;
          v26 = 0;
          *v75 = v40;
          goto LABEL_65;
        }
        v82 = v13;
      }
      else
      {
        v82 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("createdOn"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v13;
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = (objc_class *)MEMORY[0x1E0C99D68];
          v28 = v14;
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
            v41 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            objc_msgSend(v41, "dateFromString:", v14);
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_39;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v75)
            {
              v80 = 0;
              v26 = 0;
              goto LABEL_66;
            }
            v43 = v8;
            v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v81 = *MEMORY[0x1E0D025B8];
            v93 = *MEMORY[0x1E0CB2D50];
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("createdOn"));
            v94 = v45;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v81, 2, v42);
            v80 = 0;
            v26 = 0;
            *v75 = v69;
            v13 = v77;
            goto LABEL_64;
          }
          v32 = v14;
        }
        v80 = v32;
      }
      else
      {
        v80 = 0;
      }
LABEL_39:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("adoptedOn"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v7;
      if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v43 = v8;
        v44 = self;
        v45 = 0;
        goto LABEL_59;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v8;
        v44 = self;
        v46 = (objc_class *)MEMORY[0x1E0C99D68];
        v47 = v42;
        v48 = [v46 alloc];
        objc_msgSend(v47, "doubleValue");
        v50 = v49;

        v51 = (id)objc_msgSend(v48, "initWithTimeIntervalSince1970:", v50);
      }
      else
      {
        v44 = self;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v43 = v8;
          v52 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v52, "dateFromString:", v42);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_59;
        }
        objc_opt_class();
        v43 = v8;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v75)
          {
            v45 = 0;
            v26 = 0;
            v7 = v76;
            goto LABEL_64;
          }
          v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v70 = *MEMORY[0x1E0D025B8];
          v91 = *MEMORY[0x1E0CB2D50];
          v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("adoptedOn"));
          v92 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v70, 2, v60);
          v45 = 0;
          v26 = 0;
          *v75 = v71;
          goto LABEL_63;
        }
        v51 = v42;
      }
      v45 = v51;
LABEL_59:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("switchedCount"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v75)
          {
            v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v72 = *MEMORY[0x1E0D025B8];
            v89 = *MEMORY[0x1E0CB2D50];
            v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("switchedCount"));
            v90 = v63;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *v75 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v72, 2, v64);

          }
          v61 = 0;
          v26 = 0;
          goto LABEL_63;
        }
        v61 = v60;
      }
      else
      {
        v61 = 0;
      }
      v26 = -[BMSiriHomeSeed initWithHomeIdentifier:seed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:](v44, "initWithHomeIdentifier:seed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:", v43, v84, v86, v82, v80, v45, v61);
      v44 = v26;
LABEL_63:

      self = v44;
      v7 = v76;
LABEL_64:

      v8 = v43;
LABEL_65:
      v10 = v84;
LABEL_66:

      v9 = v78;
      goto LABEL_67;
    }
    if (a4)
    {
      v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D025B8];
      v99 = *MEMORY[0x1E0CB2D50];
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("seed"));
      v100 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v34;
      v10 = (id)v35;
      v87 = (void *)v36;
      v26 = 0;
      *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2);

LABEL_70:
      goto LABEL_71;
    }
    v26 = 0;
LABEL_71:

LABEL_72:
    goto LABEL_73;
  }
  if (a4)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = *MEMORY[0x1E0D025B8];
    v103 = *MEMORY[0x1E0CB2D50];
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("homeIdentifier"));
    v104 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v9);
    goto LABEL_71;
  }
  v26 = 0;
LABEL_73:

  return v26;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[7];
  _QWORD v35[9];

  v35[7] = *MEMORY[0x1E0C80C00];
  -[BMSiriHomeSeed homeIdentifier](self, "homeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMSiriHomeSeed seed](self, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMSiriHomeSeed effectiveFrom](self, "effectiveFrom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriHomeSeed effectiveFrom](self, "effectiveFrom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }

  if (-[BMSiriHomeSeed hasValidityDays](self, "hasValidityDays"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriHomeSeed validityDays](self, "validityDays"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  -[BMSiriHomeSeed createdOn](self, "createdOn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriHomeSeed createdOn](self, "createdOn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  -[BMSiriHomeSeed adoptedOn](self, "adoptedOn");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriHomeSeed adoptedOn](self, "adoptedOn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    objc_msgSend(v15, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  if (-[BMSiriHomeSeed hasSwitchedCount](self, "hasSwitchedCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriHomeSeed switchedCount](self, "switchedCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v34[0] = CFSTR("homeIdentifier");
  v19 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v19;
  v31 = (void *)v6;
  v35[0] = v19;
  v34[1] = CFSTR("seed");
  v20 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v20;
  v35[1] = v20;
  v34[2] = CFSTR("effectiveFrom");
  v21 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[2] = v21;
  v34[3] = CFSTR("validityDays");
  v22 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v4;
  v35[3] = v22;
  v34[4] = CFSTR("createdOn");
  v24 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[4] = v24;
  v34[5] = CFSTR("adoptedOn");
  v25 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[5] = v25;
  v34[6] = CFSTR("switchedCount");
  v26 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[6] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_32;
LABEL_41:

    if (v13)
      goto LABEL_33;
    goto LABEL_42;
  }

  if (!v17)
    goto LABEL_41;
LABEL_32:
  if (v13)
    goto LABEL_33;
LABEL_42:

LABEL_33:
  if (!v32)

  if (!v33)
  if (!v31)
  {

    if (v23)
      goto LABEL_39;
LABEL_44:

    goto LABEL_39;
  }
  if (!v23)
    goto LABEL_44;
LABEL_39:

  return v27;
}

- (NSUUID)homeIdentifier
{
  NSData *raw_homeIdentifier;
  void *v3;

  raw_homeIdentifier = self->_raw_homeIdentifier;
  if (raw_homeIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_homeIdentifier, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  unsigned int v25;
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
  unsigned int v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriHomeSeed homeIdentifier](self, "homeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriHomeSeed homeIdentifier](self, "homeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[BMSiriHomeSeed seed](self, "seed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "seed");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriHomeSeed seed](self, "seed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "seed");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_33;
    }
    -[BMSiriHomeSeed effectiveFrom](self, "effectiveFrom");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveFrom");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriHomeSeed effectiveFrom](self, "effectiveFrom");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveFrom");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_33;
    }
    if (-[BMSiriHomeSeed hasValidityDays](self, "hasValidityDays") || objc_msgSend(v5, "hasValidityDays"))
    {
      if (!-[BMSiriHomeSeed hasValidityDays](self, "hasValidityDays"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasValidityDays"))
        goto LABEL_33;
      v25 = -[BMSiriHomeSeed validityDays](self, "validityDays");
      if (v25 != objc_msgSend(v5, "validityDays"))
        goto LABEL_33;
    }
    -[BMSiriHomeSeed createdOn](self, "createdOn");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createdOn");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[BMSiriHomeSeed createdOn](self, "createdOn");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createdOn");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_33;
    }
    -[BMSiriHomeSeed adoptedOn](self, "adoptedOn");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adoptedOn");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[BMSiriHomeSeed adoptedOn](self, "adoptedOn");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "adoptedOn");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_33;
    }
    if (!-[BMSiriHomeSeed hasSwitchedCount](self, "hasSwitchedCount")
      && !objc_msgSend(v5, "hasSwitchedCount"))
    {
      v12 = 1;
      goto LABEL_34;
    }
    if (-[BMSiriHomeSeed hasSwitchedCount](self, "hasSwitchedCount")
      && objc_msgSend(v5, "hasSwitchedCount"))
    {
      v38 = -[BMSiriHomeSeed switchedCount](self, "switchedCount");
      v12 = v38 == objc_msgSend(v5, "switchedCount");
LABEL_34:

      goto LABEL_35;
    }
LABEL_33:
    v12 = 0;
    goto LABEL_34;
  }
  v12 = 0;
LABEL_35:

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
  objc_storeStrong((id *)&self->_raw_homeIdentifier, 0);
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

    v4 = -[BMSiriHomeSeed initByReadFrom:]([BMSiriHomeSeed alloc], "initByReadFrom:", v7);
    v4[21] = 0;

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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("homeIdentifier"), 6, 0, 1, 14, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("seed"), 6, 0, 2, 14, 3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("effectiveFrom"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("validityDays"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("createdOn"), 3, 0, 5, 0, 2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("adoptedOn"), 3, 0, 6, 0, 2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("switchedCount"), 0, 0, 7, 4, 0);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CF00;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeIdentifier"), 1, 14, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("seed"), 2, 14, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("effectiveFrom"), 3, 0, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("validityDays"), 4, 4, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("createdOn"), 5, 0, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("adoptedOn"), 6, 0, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("switchedCount"), 7, 4, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
