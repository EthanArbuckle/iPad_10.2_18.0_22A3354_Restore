@implementation BMHumanUnderstandingPersonalInference

- (BMHumanUnderstandingPersonalInference)initWithConfidence:(id)a3 fact:(id)a4 qualifiers:(id)a5 modelVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMHumanUnderstandingPersonalInference *v14;
  double v15;
  unsigned int v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMHumanUnderstandingPersonalInference;
  v14 = -[BMEventBase init](&v18, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasConfidence = 1;
      objc_msgSend(v10, "doubleValue");
    }
    else
    {
      v14->_hasConfidence = 0;
      v15 = -1.0;
    }
    v14->_confidence = v15;
    objc_storeStrong((id *)&v14->_fact, a4);
    objc_storeStrong((id *)&v14->_qualifiers, a5);
    if (v13)
    {
      v14->_hasModelVersion = 1;
      v16 = objc_msgSend(v13, "unsignedIntValue");
    }
    else
    {
      v16 = 0;
      v14->_hasModelVersion = 0;
    }
    v14->_modelVersion = v16;
  }

  return v14;
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
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMHumanUnderstandingPersonalInference confidence](self, "confidence");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInference fact](self, "fact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHumanUnderstandingPersonalInference qualifiers](self, "qualifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMHumanUnderstandingPersonalInference modelVersion](self, "modelVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMHumanUnderstandingPersonalInference with confidence: %@, fact: %@, qualifiers: %@, modelVersion: %@"), v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v3;
  _BYTE *v5;
  BMHumanUnderstandingPersonalInference *v6;
  void *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  unint64_t v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  BMHumanUnderstandingPersonalInferenceFact *fact;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  NSArray *qualifiers;
  int v41;
  BMHumanUnderstandingPersonalInference *v42;
  objc_super v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMHumanUnderstandingPersonalInference;
  v6 = -[BMEventBase init](&v44, sel_init);
  if (!v6)
    goto LABEL_47;
  v7 = (void *)objc_opt_new();
  v8 = (int *)MEMORY[0x1E0D82BF0];
  v9 = (int *)MEMORY[0x1E0D82BD8];
  v10 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v5[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v5[*MEMORY[0x1E0D82BD8]])
  {
    v11 = (int *)MEMORY[0x1E0D82BB8];
    v12 = 0x1E5E4A000uLL;
    do
    {
      if (v5[*v10])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v8;
        v17 = *(_QWORD *)&v5[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v5[*v9])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v17);
        *(_QWORD *)&v5[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v5[*v10];
          goto LABEL_15;
        }
      }
      v5[*v10] = 1;
LABEL_13:
      v21 = v5[*v10];
      if (v5[*v10])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          v6->_hasConfidence = 1;
          v23 = *v8;
          v24 = *(_QWORD *)&v5[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v5[*v9])
          {
            v25 = *(double *)(*(_QWORD *)&v5[*v11] + v24);
            *(_QWORD *)&v5[v23] = v24 + 8;
          }
          else
          {
            v5[*v10] = 1;
            v25 = 0.0;
          }
          v6->_confidence = v25;
          continue;
        case 2u:
          v45 = 0;
          v46 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v26 = objc_msgSend(objc_alloc(*(Class *)(v12 + 2912)), "initByReadFrom:", v5);
          if (!v26)
            goto LABEL_49;
          fact = v6->_fact;
          v6->_fact = (BMHumanUnderstandingPersonalInferenceFact *)v26;

          PBReaderRecallMark();
          continue;
        case 3u:
          v45 = 0;
          v46 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v28 = v3;
          v29 = v12;
          v30 = objc_msgSend(objc_alloc(*(Class *)(v12 + 2912)), "initByReadFrom:", v5);
          if (!v30)
            goto LABEL_49;
          v31 = (void *)v30;
          objc_msgSend(v7, "addObject:", v30);
          PBReaderRecallMark();

          v12 = v29;
          v3 = v28;
          continue;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v6->_hasModelVersion = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_49:

          goto LABEL_46;
      }
      while (1)
      {
        v35 = *v8;
        v36 = *(_QWORD *)&v5[v35];
        v37 = v36 + 1;
        if (v36 == -1 || v37 > *(_QWORD *)&v5[*v9])
          break;
        v38 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v36);
        *(_QWORD *)&v5[v35] = v37;
        v34 |= (unint64_t)(v38 & 0x7F) << v32;
        if ((v38 & 0x80) == 0)
          goto LABEL_39;
        v32 += 7;
        v20 = v33++ >= 9;
        if (v20)
        {
          LODWORD(v34) = 0;
          goto LABEL_41;
        }
      }
      v5[*v10] = 1;
LABEL_39:
      if (v5[*v10])
        LODWORD(v34) = 0;
LABEL_41:
      v6->_modelVersion = v34;
    }
    while (*(_QWORD *)&v5[*v8] < *(_QWORD *)&v5[*v9]);
  }
  v39 = objc_msgSend(v7, "copy");
  qualifiers = v6->_qualifiers;
  v6->_qualifiers = (NSArray *)v39;

  v41 = v5[*v10];
  if (v41)
LABEL_46:
    v42 = 0;
  else
LABEL_47:
    v42 = v6;

  return v42;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasConfidence)
    PBDataWriterWriteDoubleField();
  if (self->_fact)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMHumanUnderstandingPersonalInferenceFact writeTo:](self->_fact, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_qualifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (_QWORD)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  if (self->_hasModelVersion)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHumanUnderstandingPersonalInference writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHumanUnderstandingPersonalInference)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  BMHumanUnderstandingPersonalInferenceFact *v19;
  BMHumanUnderstandingPersonalInferenceFact *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id *v39;
  uint64_t *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  BMHumanUnderstandingPersonalInference *v54;
  id v55;
  BMHumanUnderstandingPersonalInferenceFact *v56;
  id *v57;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v27 = p_isa;
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = v7;
        v30 = *MEMORY[0x1E0D025B8];
        v77 = *MEMORY[0x1E0CB2D50];
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidence"));
        v78[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        v7 = v29;
        v32 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v31, 2, v26);
        p_isa = 0;
        v8 = 0;
        *v27 = v32;
        goto LABEL_55;
      }
      v8 = 0;
      goto LABEL_57;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fact"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v57 = p_isa;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (p_isa)
      {
        v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v75 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("fact"));
        v76 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *v57 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v33, 2, v34);

        p_isa = 0;
        goto LABEL_55;
      }
      goto LABEL_56;
    }
    v23 = v9;
    v9 = v9;
    v65 = 0;
    v56 = -[BMHumanUnderstandingPersonalInferenceFact initWithJSONDictionary:error:]([BMHumanUnderstandingPersonalInferenceFact alloc], "initWithJSONDictionary:error:", v9, &v65);
    v24 = v65;
    if (v24)
    {
      v25 = v24;
      if (v57)
        *v57 = objc_retainAutorelease(v24);

      p_isa = 0;
      v26 = v56;
      goto LABEL_55;
    }

    v9 = v23;
  }
  else
  {
    v56 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("qualifiers"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  v55 = v9;
  if (v12)
  {
    v52 = v8;
    v53 = v7;
    v54 = self;

    v10 = 0;
  }
  else
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        p_isa = v57;
        if (!v57)
        {
          v26 = v56;
          goto LABEL_54;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v73 = *MEMORY[0x1E0CB2D50];
        v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("qualifiers"));
        v74 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v22);
        p_isa = 0;
        *v57 = v45;
LABEL_48:
        v26 = v56;
        goto LABEL_53;
      }
    }
    v52 = v8;
    v53 = v7;
    v54 = self;
  }
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v10 = v10;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (!v13)
    goto LABEL_22;
  v14 = v13;
  v15 = *(_QWORD *)v62;
  v51 = v6;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v62 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v57;
        if (v57)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v70 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("qualifiers"));
          v71 = v18;
          v38 = (void *)MEMORY[0x1E0C99D80];
          v39 = &v71;
          v40 = &v70;
LABEL_40:
          objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *v35 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v41);

          p_isa = 0;
          v22 = v10;
          v6 = v51;
          v7 = v53;
          self = v54;
LABEL_44:
          v8 = v52;
          v26 = v56;
          goto LABEL_52;
        }
        goto LABEL_47;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = v57;
        if (v57)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v68 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("qualifiers"));
          v69 = v18;
          v38 = (void *)MEMORY[0x1E0C99D80];
          v39 = &v69;
          v40 = &v68;
          goto LABEL_40;
        }
LABEL_47:
        p_isa = 0;
        v22 = v10;
        v6 = v51;
        v8 = v52;
        v7 = v53;
        self = v54;
        goto LABEL_48;
      }
      v18 = v17;
      v19 = [BMHumanUnderstandingPersonalInferenceFact alloc];
      v60 = 0;
      v20 = -[BMHumanUnderstandingPersonalInferenceFact initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v18, &v60);
      v21 = v60;
      if (v21)
      {
        v42 = v21;
        v7 = v53;
        if (v57)
          *v57 = objc_retainAutorelease(v21);

        p_isa = 0;
        v22 = v10;
        v6 = v51;
        self = v54;
        goto LABEL_44;
      }
      objc_msgSend(v58, "addObject:", v20);

    }
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    v6 = v51;
    if (v14)
      continue;
    break;
  }
LABEL_22:

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelVersion"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    self = v54;
    v8 = v52;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 0;
      v7 = v53;
      goto LABEL_50;
    }
    objc_opt_class();
    v26 = v56;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v18;
      v7 = v53;
      goto LABEL_51;
    }
    v7 = v53;
    v22 = v57;
    if (v57)
    {
      v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v49 = *MEMORY[0x1E0D025B8];
      v66 = *MEMORY[0x1E0CB2D50];
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("modelVersion"));
      v67 = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *v57 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v49, 2, v48);

      v22 = 0;
    }
    p_isa = 0;
  }
  else
  {
    v22 = 0;
    v7 = v53;
    self = v54;
    v8 = v52;
LABEL_50:
    v26 = v56;
LABEL_51:
    self = -[BMHumanUnderstandingPersonalInference initWithConfidence:fact:qualifiers:modelVersion:](self, "initWithConfidence:fact:qualifiers:modelVersion:", v8, v26, v58, v22);
    p_isa = (id *)&self->super.super.isa;
  }
LABEL_52:

LABEL_53:
  v9 = v55;
LABEL_54:

LABEL_55:
LABEL_56:

LABEL_57:
  return (BMHumanUnderstandingPersonalInference *)p_isa;
}

- (id)_qualifiersJSONArray
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
  -[BMHumanUnderstandingPersonalInference qualifiers](self, "qualifiers", 0);
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
  double v3;
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
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  if (!-[BMHumanUnderstandingPersonalInference hasConfidence](self, "hasConfidence")
    || (-[BMHumanUnderstandingPersonalInference confidence](self, "confidence"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMHumanUnderstandingPersonalInference confidence](self, "confidence");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMHumanUnderstandingPersonalInference confidence](self, "confidence");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMHumanUnderstandingPersonalInference fact](self, "fact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMHumanUnderstandingPersonalInference _qualifiersJSONArray](self, "_qualifiersJSONArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMHumanUnderstandingPersonalInference hasModelVersion](self, "hasModelVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMHumanUnderstandingPersonalInference modelVersion](self, "modelVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v16[0] = CFSTR("confidence");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v10;
  v16[1] = CFSTR("fact");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v11;
  v16[2] = CFSTR("qualifiers");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v12;
  v16[3] = CFSTR("modelVersion");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_18;
  }
  else
  {

    if (v8)
    {
LABEL_18:
      if (v7)
        goto LABEL_19;
LABEL_23:

      if (v5)
        goto LABEL_20;
LABEL_24:

      goto LABEL_20;
    }
  }

  if (!v7)
    goto LABEL_23;
LABEL_19:
  if (!v5)
    goto LABEL_24;
LABEL_20:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unsigned int v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMHumanUnderstandingPersonalInference hasConfidence](self, "hasConfidence")
      || objc_msgSend(v5, "hasConfidence"))
    {
      if (!-[BMHumanUnderstandingPersonalInference hasConfidence](self, "hasConfidence"))
        goto LABEL_21;
      if (!objc_msgSend(v5, "hasConfidence"))
        goto LABEL_21;
      -[BMHumanUnderstandingPersonalInference confidence](self, "confidence");
      v7 = v6;
      objc_msgSend(v5, "confidence");
      if (v7 != v8)
        goto LABEL_21;
    }
    -[BMHumanUnderstandingPersonalInference fact](self, "fact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fact");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[BMHumanUnderstandingPersonalInference fact](self, "fact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_21;
    }
    -[BMHumanUnderstandingPersonalInference qualifiers](self, "qualifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "qualifiers");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMHumanUnderstandingPersonalInference qualifiers](self, "qualifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "qualifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_21;
    }
    if (!-[BMHumanUnderstandingPersonalInference hasModelVersion](self, "hasModelVersion")
      && !objc_msgSend(v5, "hasModelVersion"))
    {
      v15 = 1;
      goto LABEL_22;
    }
    if (-[BMHumanUnderstandingPersonalInference hasModelVersion](self, "hasModelVersion")
      && objc_msgSend(v5, "hasModelVersion"))
    {
      v22 = -[BMHumanUnderstandingPersonalInference modelVersion](self, "modelVersion");
      v15 = v22 == objc_msgSend(v5, "modelVersion");
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (BMHumanUnderstandingPersonalInferenceFact)fact
{
  return self->_fact;
}

- (NSArray)qualifiers
{
  return self->_qualifiers;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (BOOL)hasModelVersion
{
  return self->_hasModelVersion;
}

- (void)setHasModelVersion:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifiers, 0);
  objc_storeStrong((id *)&self->_fact, 0);
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

    v7 = -[BMHumanUnderstandingPersonalInference initByReadFrom:]([BMHumanUnderstandingPersonalInference alloc], "initByReadFrom:", v6);
    v7[5] = 1;

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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("fact_json"), 5, 1, &__block_literal_global_156_74072);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("qualifiers_json"), 5, 1, &__block_literal_global_157_74073);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelVersion"), 0, 0, 4, 4, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FBA0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 1, 0, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fact"), 2, 14, objc_opt_class());
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("qualifiers"), 3, 14, objc_opt_class());
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelVersion"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __48__BMHumanUnderstandingPersonalInference_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_qualifiersJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__BMHumanUnderstandingPersonalInference_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
