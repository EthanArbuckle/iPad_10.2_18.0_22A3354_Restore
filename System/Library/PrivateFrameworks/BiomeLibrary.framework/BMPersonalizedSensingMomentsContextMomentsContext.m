@implementation BMPersonalizedSensingMomentsContextMomentsContext

- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7
{
  return -[BMPersonalizedSensingMomentsContextMomentsContext initWithContextIdentifier:contextStrings:contextCreationTimestamp:associatedPatternType:metadataContentBitmap:actionType:](self, "initWithContextIdentifier:contextStrings:contextCreationTimestamp:associatedPatternType:metadataContentBitmap:actionType:", a3, a4, a5, a6, a7, 0);
}

- (BMPersonalizedSensingMomentsContextMomentsContext)initWithContextIdentifier:(id)a3 contextStrings:(id)a4 contextCreationTimestamp:(id)a5 associatedPatternType:(id)a6 metadataContentBitmap:(id)a7 actionType:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMPersonalizedSensingMomentsContextMomentsContext *v20;
  uint64_t v21;
  NSString *raw_contextIdentifier;
  double v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContext;
  v20 = -[BMEventBase init](&v28, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      objc_msgSend(v14, "UUIDString");
      v21 = objc_claimAutoreleasedReturnValue();
      raw_contextIdentifier = v20->_raw_contextIdentifier;
      v20->_raw_contextIdentifier = (NSString *)v21;
    }
    else
    {
      raw_contextIdentifier = v20->_raw_contextIdentifier;
      v20->_raw_contextIdentifier = 0;
    }

    objc_storeStrong((id *)&v20->_contextStrings, a4);
    if (v16)
    {
      v20->_hasRaw_contextCreationTimestamp = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_contextCreationTimestamp = 0;
      v23 = -1.0;
    }
    v20->_raw_contextCreationTimestamp = v23;
    if (v17)
    {
      v20->_hasAssociatedPatternType = 1;
      v24 = objc_msgSend(v17, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v20->_hasAssociatedPatternType = 0;
    }
    v20->_associatedPatternType = v24;
    if (v18)
    {
      v20->_hasMetadataContentBitmap = 1;
      v25 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v25 = 0;
      v20->_hasMetadataContentBitmap = 0;
    }
    v20->_metadataContentBitmap = v25;
    if (v19)
    {
      v20->_hasActionType = 1;
      v26 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v26 = 0;
      v20->_hasActionType = 0;
    }
    v20->_actionType = v26;
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
  -[BMPersonalizedSensingMomentsContextMomentsContext contextIdentifier](self, "contextIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextMomentsContext contextStrings](self, "contextStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextMomentsContext contextCreationTimestamp](self, "contextCreationTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext associatedPatternType](self, "associatedPatternType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext metadataContentBitmap](self, "metadataContentBitmap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext actionType](self, "actionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPersonalizedSensingMomentsContextMomentsContext with contextIdentifier: %@, contextStrings: %@, contextCreationTimestamp: %@, associatedPatternType: %@, metadataContentBitmap: %@, actionType: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPersonalizedSensingMomentsContextMomentsContext *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  NSString *raw_contextIdentifier;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  NSArray *contextStrings;
  int v50;
  BMPersonalizedSensingMomentsContextMomentsContext *v51;
  objc_super v53;
  uint64_t v54;
  uint64_t v55;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContext;
  v5 = -[BMEventBase init](&v53, sel_init);
  if (!v5)
    goto LABEL_68;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          raw_contextIdentifier = v5->_raw_contextIdentifier;
          v5->_raw_contextIdentifier = (NSString *)v21;

          continue;
        case 2u:
          v54 = 0;
          v55 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_70;
          v23 = -[BMPersonalizedSensingMomentsContextMomentsContextString initByReadFrom:]([BMPersonalizedSensingMomentsContextMomentsContextString alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_70;
          v24 = v23;
          objc_msgSend(v6, "addObject:", v23);
          PBReaderRecallMark();

          continue;
        case 3u:
          v5->_hasRaw_contextCreationTimestamp = 1;
          v25 = *v7;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v27 = *(double *)(*(_QWORD *)&v4[*v10] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v27 = 0.0;
          }
          v5->_raw_contextCreationTimestamp = v27;
          continue;
        case 4u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasAssociatedPatternType = 1;
          while (2)
          {
            v31 = *v7;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                v18 = v29++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v30) = 0;
LABEL_53:
          v47 = 48;
          goto LABEL_62;
        case 5u:
          v35 = 0;
          v36 = 0;
          v30 = 0;
          v5->_hasMetadataContentBitmap = 1;
          while (2)
          {
            v37 = *v7;
            v38 = *(_QWORD *)&v4[v37];
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v38);
              *(_QWORD *)&v4[v37] = v39;
              v30 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v18 = v36++ >= 9;
                if (v18)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v30) = 0;
LABEL_57:
          v47 = 52;
          goto LABEL_62;
        case 6u:
          v41 = 0;
          v42 = 0;
          v30 = 0;
          v5->_hasActionType = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_70:

          goto LABEL_67;
      }
      while (1)
      {
        v43 = *v7;
        v44 = *(_QWORD *)&v4[v43];
        v45 = v44 + 1;
        if (v44 == -1 || v45 > *(_QWORD *)&v4[*v8])
          break;
        v46 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v44);
        *(_QWORD *)&v4[v43] = v45;
        v30 |= (unint64_t)(v46 & 0x7F) << v41;
        if ((v46 & 0x80) == 0)
          goto LABEL_59;
        v41 += 7;
        v18 = v42++ >= 9;
        if (v18)
        {
          LODWORD(v30) = 0;
          goto LABEL_61;
        }
      }
      v4[*v9] = 1;
LABEL_59:
      if (v4[*v9])
        LODWORD(v30) = 0;
LABEL_61:
      v47 = 56;
LABEL_62:
      *(_DWORD *)((char *)&v5->super.super.isa + v47) = v30;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v48 = objc_msgSend(v6, "copy");
  contextStrings = v5->_contextStrings;
  v5->_contextStrings = (NSArray *)v48;

  v50 = v4[*v9];
  if (v50)
LABEL_67:
    v51 = 0;
  else
LABEL_68:
    v51 = v5;

  return v51;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_raw_contextIdentifier)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_contextStrings;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_hasRaw_contextCreationTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_hasAssociatedPatternType)
    PBDataWriterWriteUint32Field();
  if (self->_hasMetadataContentBitmap)
    PBDataWriterWriteUint32Field();
  if (self->_hasActionType)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPersonalizedSensingMomentsContextMomentsContext writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPersonalizedSensingMomentsContextMomentsContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  BMPersonalizedSensingMomentsContextMomentsContextString *v16;
  BMPersonalizedSensingMomentsContextMomentsContextString *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  BMPersonalizedSensingMomentsContextMomentsContext *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id *v39;
  uint64_t *v40;
  id v41;
  id v43;
  uint64_t v44;
  id v45;
  objc_class *v46;
  id v47;
  id v48;
  double v49;
  double v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  BMPersonalizedSensingMomentsContextMomentsContext *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  id v101;
  _BYTE v102[128];
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  _QWORD v108[3];

  v108[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contextIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v105 = *MEMORY[0x1E0CB2D50];
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contextIdentifier"));
        v106 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v7);
        v28 = 0;
        *a4 = v34;
        goto LABEL_53;
      }
      v28 = 0;
      goto LABEL_55;
    }
    v29 = v6;
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v29);
    if (!v30)
    {
      v27 = v29;
      if (a4)
      {
        v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v52 = *MEMORY[0x1E0D025B8];
        v107 = *MEMORY[0x1E0CB2D50];
        v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("contextIdentifier"));
        v108[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2, v53);

        v28 = 0;
        goto LABEL_53;
      }
      v28 = 0;
      goto LABEL_54;
    }
    v31 = v30;

    v81 = (void *)v31;
  }
  else
  {
    v81 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contextStrings"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v82 = v6;
  if (v9)
  {
    v78 = self;

    v7 = 0;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v103 = *MEMORY[0x1E0CB2D50];
          v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("contextStrings"));
          v104 = v84;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v19);
          v28 = 0;
          *a4 = v45;
          v27 = v81;
          goto LABEL_52;
        }
        v28 = 0;
        v27 = v81;
        goto LABEL_53;
      }
    }
    v78 = self;
  }
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v7 = v7;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  v12 = *(_QWORD *)v87;
  v77 = v5;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v87 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = a4;
        if (a4)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v100 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("contextStrings"));
          v101 = v15;
          v38 = (void *)MEMORY[0x1E0C99D80];
          v39 = &v101;
          v40 = &v100;
LABEL_45:
          objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, 1);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v41 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v22);
          v28 = 0;
          *v35 = v41;
          v19 = v7;
          v5 = v77;
LABEL_49:
          self = v78;
          v27 = v81;
          goto LABEL_50;
        }
LABEL_58:
        v28 = 0;
        v19 = v7;
        v5 = v77;
        self = v78;
        v27 = v81;
        goto LABEL_52;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = a4;
        if (a4)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v98 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("contextStrings"));
          v99 = v15;
          v38 = (void *)MEMORY[0x1E0C99D80];
          v39 = &v99;
          v40 = &v98;
          goto LABEL_45;
        }
        goto LABEL_58;
      }
      v15 = v14;
      v16 = [BMPersonalizedSensingMomentsContextMomentsContextString alloc];
      v85 = 0;
      v17 = -[BMPersonalizedSensingMomentsContextMomentsContextString initWithJSONDictionary:error:](v16, "initWithJSONDictionary:error:", v15, &v85);
      v18 = v85;
      if (v18)
      {
        v22 = v18;
        v5 = v77;
        if (a4)
          *a4 = objc_retainAutorelease(v18);

        v28 = 0;
        v19 = v7;
        goto LABEL_49;
      }
      objc_msgSend(v84, "addObject:", v17);

    }
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
    v5 = v77;
    if (v11)
      continue;
    break;
  }
LABEL_19:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contextCreationTimestamp"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      objc_msgSend(v54, "dateFromString:", v15);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v67 = *MEMORY[0x1E0D025B8];
          v96 = *MEMORY[0x1E0CB2D50];
          v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("contextCreationTimestamp"));
          v97 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = v66;
          v21 = (void *)v68;
          v70 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v67, 2, v68);
          v19 = 0;
          v28 = 0;
          *a4 = v70;
          self = v78;
          v27 = v81;
          goto LABEL_35;
        }
        v19 = 0;
        v28 = 0;
        self = v78;
        v27 = v81;
        goto LABEL_51;
      }
      v19 = v15;
    }
    self = v78;
    goto LABEL_23;
  }
  v46 = (objc_class *)MEMORY[0x1E0C99D68];
  v47 = v15;
  v48 = [v46 alloc];
  objc_msgSend(v47, "doubleValue");
  v50 = v49;

  v19 = (id)objc_msgSend(v48, "initWithTimeIntervalSince1970:", v50);
LABEL_22:
  self = v78;
LABEL_23:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("associatedPatternType"));
  v20 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v20;
  if (v20)
  {
    v21 = (void *)v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        goto LABEL_26;
      }
      if (!a4)
      {
        v22 = 0;
        v28 = 0;
        v27 = v81;
        goto LABEL_35;
      }
      v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v55 = *MEMORY[0x1E0D025B8];
      v94 = *MEMORY[0x1E0CB2D50];
      v56 = v6;
      v57 = objc_alloc(MEMORY[0x1E0CB3940]);
      v71 = objc_opt_class();
      v58 = v57;
      v6 = v56;
      v79 = (id)objc_msgSend(v58, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v71, CFSTR("associatedPatternType"));
      v95 = v79;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = v76;
      v75 = (void *)v59;
      v61 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v55, 2);
      v28 = 0;
      v22 = 0;
      *a4 = v61;
LABEL_86:
      v27 = v81;
      goto LABEL_34;
    }
  }
  v22 = 0;
LABEL_26:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadataContentBitmap"));
  v23 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v23;
  if (v23)
  {
    v24 = (void *)v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v79 = v24;
        goto LABEL_29;
      }
      if (a4)
      {
        v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v62 = *MEMORY[0x1E0D025B8];
        v92 = *MEMORY[0x1E0CB2D50];
        v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("metadataContentBitmap"));
        v93 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v62, 2, v25);
        v28 = 0;
        v79 = 0;
        *a4 = v63;
        v27 = v81;
        goto LABEL_33;
      }
      v79 = 0;
      v28 = 0;
      goto LABEL_86;
    }
  }
  v79 = 0;
LABEL_29:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actionType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v26 = 0;
    v27 = v81;
    goto LABEL_32;
  }
  objc_opt_class();
  v27 = v81;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
LABEL_32:
    self = -[BMPersonalizedSensingMomentsContextMomentsContext initWithContextIdentifier:contextStrings:contextCreationTimestamp:associatedPatternType:metadataContentBitmap:actionType:](self, "initWithContextIdentifier:contextStrings:contextCreationTimestamp:associatedPatternType:metadataContentBitmap:actionType:", v27, v84, v19, v22, v79, v26);
    v28 = self;
  }
  else
  {
    if (a4)
    {
      v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v72 = *MEMORY[0x1E0D025B8];
      v90 = *MEMORY[0x1E0CB2D50];
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("actionType"));
      v91 = v64;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v72, 2, v65);

    }
    v26 = 0;
    v28 = 0;
  }
LABEL_33:

  v6 = v82;
LABEL_34:

  v21 = v74;
LABEL_35:

LABEL_50:
LABEL_51:

LABEL_52:
LABEL_53:

LABEL_54:
LABEL_55:

  return v28;
}

- (id)_contextStringsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMPersonalizedSensingMomentsContextMomentsContext contextStrings](self, "contextStrings", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  -[BMPersonalizedSensingMomentsContextMomentsContext contextIdentifier](self, "contextIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMPersonalizedSensingMomentsContextMomentsContext _contextStringsJSONArray](self, "_contextStringsJSONArray");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextMomentsContext contextCreationTimestamp](self, "contextCreationTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPersonalizedSensingMomentsContextMomentsContext contextCreationTimestamp](self, "contextCreationTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  if (-[BMPersonalizedSensingMomentsContextMomentsContext hasAssociatedPatternType](self, "hasAssociatedPatternType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext associatedPatternType](self, "associatedPatternType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (-[BMPersonalizedSensingMomentsContextMomentsContext hasMetadataContentBitmap](self, "hasMetadataContentBitmap"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext metadataContentBitmap](self, "metadataContentBitmap"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (-[BMPersonalizedSensingMomentsContextMomentsContext hasActionType](self, "hasActionType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContext actionType](self, "actionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v24 = (void *)v4;
  v25[0] = CFSTR("contextIdentifier");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v21 = v13;
  v23 = (void *)v5;
  v26[0] = v13;
  v25[1] = CFSTR("contextStrings");
  v14 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[1] = v14;
  v25[2] = CFSTR("contextCreationTimestamp");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[2] = v15;
  v25[3] = CFSTR("associatedPatternType");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[3] = v16;
  v25[4] = CFSTR("metadataContentBitmap");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v17;
  v25[5] = CFSTR("actionType");
  v18 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_27;
  }
  else
  {

    if (v11)
    {
LABEL_27:
      if (v10)
        goto LABEL_28;
LABEL_36:

      if (v9)
        goto LABEL_29;
      goto LABEL_37;
    }
  }

  if (!v10)
    goto LABEL_36;
LABEL_28:
  if (v9)
    goto LABEL_29;
LABEL_37:

LABEL_29:
  if (!v23)

  if (!v24)
  return v19;
}

- (NSUUID)contextIdentifier
{
  NSString *raw_contextIdentifier;
  void *v3;

  raw_contextIdentifier = self->_raw_contextIdentifier;
  if (raw_contextIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_contextIdentifier, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
}

- (NSDate)contextCreationTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_contextCreationTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_contextCreationTimestamp);
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
  unsigned int v26;
  unsigned int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPersonalizedSensingMomentsContextMomentsContext contextIdentifier](self, "contextIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPersonalizedSensingMomentsContextMomentsContext contextIdentifier](self, "contextIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_30;
    }
    -[BMPersonalizedSensingMomentsContextMomentsContext contextStrings](self, "contextStrings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextStrings");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMPersonalizedSensingMomentsContextMomentsContext contextStrings](self, "contextStrings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextStrings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_30;
    }
    -[BMPersonalizedSensingMomentsContextMomentsContext contextCreationTimestamp](self, "contextCreationTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextCreationTimestamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMPersonalizedSensingMomentsContextMomentsContext contextCreationTimestamp](self, "contextCreationTimestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextCreationTimestamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_30;
    }
    if (!-[BMPersonalizedSensingMomentsContextMomentsContext hasAssociatedPatternType](self, "hasAssociatedPatternType")&& !objc_msgSend(v5, "hasAssociatedPatternType")|| -[BMPersonalizedSensingMomentsContextMomentsContext hasAssociatedPatternType](self, "hasAssociatedPatternType")&& objc_msgSend(v5, "hasAssociatedPatternType")&& (v25 = -[BMPersonalizedSensingMomentsContextMomentsContext associatedPatternType](self, "associatedPatternType"), v25 == objc_msgSend(v5, "associatedPatternType")))
    {
      if (!-[BMPersonalizedSensingMomentsContextMomentsContext hasMetadataContentBitmap](self, "hasMetadataContentBitmap")&& !objc_msgSend(v5, "hasMetadataContentBitmap")|| -[BMPersonalizedSensingMomentsContextMomentsContext hasMetadataContentBitmap](self, "hasMetadataContentBitmap")&& objc_msgSend(v5, "hasMetadataContentBitmap")&& (v26 = -[BMPersonalizedSensingMomentsContextMomentsContext metadataContentBitmap](self, "metadataContentBitmap"), v26 == objc_msgSend(v5, "metadataContentBitmap")))
      {
        if (!-[BMPersonalizedSensingMomentsContextMomentsContext hasActionType](self, "hasActionType")
          && !objc_msgSend(v5, "hasActionType"))
        {
          v12 = 1;
          goto LABEL_31;
        }
        if (-[BMPersonalizedSensingMomentsContextMomentsContext hasActionType](self, "hasActionType")
          && objc_msgSend(v5, "hasActionType"))
        {
          v27 = -[BMPersonalizedSensingMomentsContextMomentsContext actionType](self, "actionType");
          v12 = v27 == objc_msgSend(v5, "actionType");
LABEL_31:

          goto LABEL_32;
        }
      }
    }
LABEL_30:
    v12 = 0;
    goto LABEL_31;
  }
  v12 = 0;
LABEL_32:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)contextStrings
{
  return self->_contextStrings;
}

- (unsigned)associatedPatternType
{
  return self->_associatedPatternType;
}

- (BOOL)hasAssociatedPatternType
{
  return self->_hasAssociatedPatternType;
}

- (void)setHasAssociatedPatternType:(BOOL)a3
{
  self->_hasAssociatedPatternType = a3;
}

- (unsigned)metadataContentBitmap
{
  return self->_metadataContentBitmap;
}

- (BOOL)hasMetadataContentBitmap
{
  return self->_hasMetadataContentBitmap;
}

- (void)setHasMetadataContentBitmap:(BOOL)a3
{
  self->_hasMetadataContentBitmap = a3;
}

- (unsigned)actionType
{
  return self->_actionType;
}

- (BOOL)hasActionType
{
  return self->_hasActionType;
}

- (void)setHasActionType:(BOOL)a3
{
  self->_hasActionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStrings, 0);
  objc_storeStrong((id *)&self->_raw_contextIdentifier, 0);
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

    v4 = -[BMPersonalizedSensingMomentsContextMomentsContext initByReadFrom:]([BMPersonalizedSensingMomentsContextMomentsContext alloc], "initByReadFrom:", v7);
    v4[11] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextIdentifier"), 6, 0, 1, 13, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("contextStrings_json"), 5, 1, &__block_literal_global_263);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contextCreationTimestamp"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("associatedPatternType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("metadataContentBitmap"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionType"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1F450;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextIdentifier"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextStrings"), 2, 14, objc_opt_class());
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contextCreationTimestamp"), 3, 0, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("associatedPatternType"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("metadataContentBitmap"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionType"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__BMPersonalizedSensingMomentsContextMomentsContext_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contextStringsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
