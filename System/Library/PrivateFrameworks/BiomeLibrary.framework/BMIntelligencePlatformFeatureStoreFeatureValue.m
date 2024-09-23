@implementation BMIntelligencePlatformFeatureStoreFeatureValue

- (BMIntelligencePlatformFeatureStoreFeatureValue)initWithValue_sequence:(id)a3 value_sequence_shape:(id)a4 value_dictionary:(id)a5 value:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMIntelligencePlatformFeatureStoreFeatureValue *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValue;
  v15 = -[BMEventBase init](&v17, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_value_sequence, a3);
    objc_storeStrong((id *)&v15->_value_sequence_shape, a4);
    objc_storeStrong((id *)&v15->_value_dictionary, a5);
    objc_storeStrong((id *)&v15->_value, a6);
  }

  return v15;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence](self, "value_sequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence_shape](self, "value_sequence_shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValue value_dictionary](self, "value_dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValue value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformFeatureStoreFeatureValue with value_sequence: %@, value_sequence_shape: %@, value_dictionary: %@, value: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformFeatureStoreFeatureValue *v5;
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  id v23;
  void *v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  id v35;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v36;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *value;
  uint64_t v38;
  uint64_t v39;
  NSArray *value_sequence;
  uint64_t v41;
  NSArray *value_sequence_shape;
  uint64_t v43;
  NSArray *value_dictionary;
  int v45;
  BMIntelligencePlatformFeatureStoreFeatureValue *v46;
  objc_super v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValue;
  v5 = -[BMEventBase init](&v48, sel_init);
  if (!v5)
    goto LABEL_48;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (int *)MEMORY[0x1E0D82BF0];
  v10 = (int *)MEMORY[0x1E0D82BD8];
  v11 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v11])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v9;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v10])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      v21 = v4[*v11];
      if (v4[*v11])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          v49 = 0;
          v50 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v23 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_49;
          v24 = v23;
          v25 = v6;
          goto LABEL_35;
        case 2u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = (void *)MEMORY[0x1E0CB37E8];
          break;
        case 3u:
          v49 = 0;
          v50 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v35 = -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValueNamedValue alloc], "initByReadFrom:", v4);
          if (!v35)
            goto LABEL_49;
          v24 = v35;
          v25 = v8;
LABEL_35:
          objc_msgSend(v25, "addObject:", v24);
          PBReaderRecallMark();
          goto LABEL_45;
        case 4u:
          v49 = 0;
          v50 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_49;
          v36 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc], "initByReadFrom:", v4);
          if (!v36)
            goto LABEL_49;
          value = v5->_value;
          v5->_value = v36;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_49;
          continue;
      }
      while (1)
      {
        v30 = *v9;
        v31 = *(_QWORD *)&v4[v30];
        v32 = v31 + 1;
        if (v31 == -1 || v32 > *(_QWORD *)&v4[*v10])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v31);
        *(_QWORD *)&v4[v30] = v32;
        v28 |= (unint64_t)(v33 & 0x7F) << v26;
        if ((v33 & 0x80) == 0)
          goto LABEL_40;
        v26 += 7;
        v20 = v27++ >= 9;
        if (v20)
        {
          v34 = 0;
          goto LABEL_43;
        }
      }
      v4[*v11] = 1;
LABEL_40:
      if (v4[*v11])
        v34 = 0;
      else
        v34 = v28;
LABEL_43:
      objc_msgSend(v29, "numberWithInt:", v34);
      v38 = objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
LABEL_49:

        goto LABEL_50;
      }
      v24 = (void *)v38;
      objc_msgSend(v7, "addObject:", v38);
LABEL_45:

    }
    while (*(_QWORD *)&v4[*v9] < *(_QWORD *)&v4[*v10]);
  }
  v39 = objc_msgSend(v6, "copy");
  value_sequence = v5->_value_sequence;
  v5->_value_sequence = (NSArray *)v39;

  v41 = objc_msgSend(v7, "copy");
  value_sequence_shape = v5->_value_sequence_shape;
  v5->_value_sequence_shape = (NSArray *)v41;

  v43 = objc_msgSend(v8, "copy");
  value_dictionary = v5->_value_dictionary;
  v5->_value_dictionary = (NSArray *)v43;

  v45 = v4[*v11];
  if (v45)
LABEL_50:
    v46 = 0;
  else
LABEL_48:
    v46 = v5;

  return v46;
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
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = self->_value_sequence;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        v30 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_value_sequence_shape;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "intValue");
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v13);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = self->_value_dictionary;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v20);
        v30 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v21, "writeTo:", v4, (_QWORD)v22);
        PBDataWriterRecallMark();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
    }
    while (v18);
  }

  if (self->_value)
  {
    v30 = 0;
    PBDataWriterPlaceMark();
    -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue writeTo:](self->_value, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformFeatureStoreFeatureValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformFeatureStoreFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v15;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  id *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id *v25;
  uint64_t *v26;
  id v27;
  BMIntelligencePlatformFeatureStoreFeatureValue *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;
  id *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void **v42;
  uint64_t *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v49;
  BMIntelligencePlatformFeatureStoreFeatureValueNamedValue *v50;
  BMIntelligencePlatformFeatureStoreFeatureValueNamedValue *v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  id *v56;
  id v57;
  uint64_t v58;
  void *v59;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue **v60;
  uint64_t *v61;
  void *v62;
  void *v63;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  BMIntelligencePlatformFeatureStoreFeatureValue *v75;
  void *v77;
  void *v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v95;
  uint64_t v96;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v97;
  uint64_t v98;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v99;
  _BYTE v100[128];
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  _BYTE v107[128];
  uint64_t v108;
  id v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  _BYTE v114[128];
  uint64_t v115;
  _QWORD v116[3];

  v116[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value_sequence"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v75 = self;

    v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = *MEMORY[0x1E0D025B8];
          v115 = *MEMORY[0x1E0CB2D50];
          v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("value_sequence"));
          v116[0] = v78;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, &v115, 1);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v28 = 0;
          *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v18);
          goto LABEL_83;
        }
        v28 = 0;
        goto LABEL_84;
      }
    }
    v75 = self;
  }
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v6 = v6;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v90, v114, 16);
  v77 = v5;
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v91;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v91 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = a4;
        if (a4)
        {
          v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v23 = *MEMORY[0x1E0D025B8];
          v112 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("value_sequence"));
          v113 = v14;
          v24 = (void *)MEMORY[0x1E0C99D80];
          v25 = &v113;
          v26 = &v112;
          goto LABEL_22;
        }
LABEL_42:
        v28 = 0;
        v18 = v6;
        v5 = v77;
        self = v75;
        goto LABEL_83;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = a4;
        if (!a4)
          goto LABEL_42;
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v110 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("value_sequence"));
        v111 = v14;
        v24 = (void *)MEMORY[0x1E0C99D80];
        v25 = &v111;
        v26 = &v110;
LABEL_22:
        objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        *v21 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v27);
LABEL_26:
        v18 = v6;
        goto LABEL_80;
      }
      v14 = v13;
      v15 = [BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc];
      v89 = 0;
      v16 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initWithJSONDictionary:error:](v15, "initWithJSONDictionary:error:", v14, &v89);
      v17 = v89;
      if (v17)
      {
        v27 = v17;
        if (a4)
          *a4 = objc_retainAutorelease(v17);

        v28 = 0;
        goto LABEL_26;
      }
      objc_msgSend(v78, "addObject:", v16);

    }
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v90, v114, 16);
    v5 = v77;
  }
  while (v10);
LABEL_16:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value_sequence_shape"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if (v20)
  {

    v18 = 0;
    goto LABEL_29;
  }
  if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_29:
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v18 = v18;
    v29 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
    if (!v29)
    {
LABEL_38:

      objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("value_dictionary"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v27, "isEqual:", v34);

      if (v35)
      {

        v27 = 0;
      }
      else if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v66 = *MEMORY[0x1E0D025B8];
            v101 = *MEMORY[0x1E0CB2D50];
            v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("value_dictionary"));
            v102 = v74;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            *a4 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v44);
            goto LABEL_79;
          }
          v28 = 0;
          goto LABEL_80;
        }
      }
      v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v27 = v27;
      v45 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
      if (!v45)
        goto LABEL_62;
      v46 = v45;
      v72 = *(_QWORD *)v82;
LABEL_54:
      v47 = 0;
      while (1)
      {
        if (*(_QWORD *)v82 != v72)
          objc_enumerationMutation(v27);
        v48 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v47);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v56 = a4;
          if (a4)
          {
            v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v58 = *MEMORY[0x1E0D025B8];
            v96 = *MEMORY[0x1E0CB2D50];
            v49 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("value_dictionary"));
            v97 = v49;
            v59 = (void *)MEMORY[0x1E0C99D80];
            v60 = &v97;
            v61 = &v96;
            goto LABEL_73;
          }
          goto LABEL_87;
        }
        v49 = v48;
        v50 = [BMIntelligencePlatformFeatureStoreFeatureValueNamedValue alloc];
        v80 = 0;
        v51 = -[BMIntelligencePlatformFeatureStoreFeatureValueNamedValue initWithJSONDictionary:error:](v50, "initWithJSONDictionary:error:", v49, &v80);
        v52 = v80;
        if (v52)
        {
          v63 = v52;
          if (a4)
            *a4 = objc_retainAutorelease(v52);

          goto LABEL_77;
        }
        objc_msgSend(v74, "addObject:", v51);

        if (v46 == ++v47)
        {
          v46 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
          if (v46)
            goto LABEL_54;
LABEL_62:

          objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("value"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v49 = 0;
            goto LABEL_65;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v67 = v44;
            v79 = 0;
            v49 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initWithJSONDictionary:error:]([BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc], "initWithJSONDictionary:error:", v67, &v79);
            v68 = v79;
            if (v68)
            {
              v69 = v68;
              if (a4)
                *a4 = objc_retainAutorelease(v68);

              v28 = 0;
              v44 = v67;
            }
            else
            {

LABEL_65:
              v28 = -[BMIntelligencePlatformFeatureStoreFeatureValue initWithValue_sequence:value_sequence_shape:value_dictionary:value:](v75, "initWithValue_sequence:value_sequence_shape:value_dictionary:value:", v78, v14, v74, v49);
              v75 = v28;
            }
LABEL_78:

          }
          else
          {
            if (a4)
            {
              v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v70 = *MEMORY[0x1E0D025B8];
              v94 = *MEMORY[0x1E0CB2D50];
              v49 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("value"));
              v95 = v49;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *a4 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v70, 2, v71);

              v28 = 0;
              goto LABEL_78;
            }
            v28 = 0;
          }
LABEL_79:

LABEL_80:
          self = v75;
LABEL_81:

          goto LABEL_82;
        }
      }
      v56 = a4;
      if (a4)
      {
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v58 = *MEMORY[0x1E0D025B8];
        v98 = *MEMORY[0x1E0CB2D50];
        v49 = (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("value_dictionary"));
        v99 = v49;
        v59 = (void *)MEMORY[0x1E0C99D80];
        v60 = &v99;
        v61 = &v98;
LABEL_73:
        objc_msgSend(v59, "dictionaryWithObjects:forKeys:count:", v60, v61, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *v56 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v62);

LABEL_77:
        v28 = 0;
        v44 = v27;
        goto LABEL_78;
      }
LABEL_87:
      v28 = 0;
      v44 = v27;
      goto LABEL_79;
    }
    v30 = v29;
    v31 = *(_QWORD *)v86;
LABEL_31:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v86 != v31)
        objc_enumerationMutation(v18);
      v33 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v32);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v38 = a4;
        if (a4)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v103 = *MEMORY[0x1E0CB2D50];
          v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("value_sequence_shape"));
          v104 = v74;
          v41 = (void *)MEMORY[0x1E0C99D80];
          v42 = &v104;
          v43 = &v103;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      objc_msgSend(v14, "addObject:", v33);
      if (v30 == ++v32)
      {
        v30 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
        if (!v30)
          goto LABEL_38;
        goto LABEL_31;
      }
    }
    v38 = a4;
    if (a4)
    {
      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0D025B8];
      v105 = *MEMORY[0x1E0CB2D50];
      v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("value_sequence_shape"));
      v106 = v74;
      v41 = (void *)MEMORY[0x1E0C99D80];
      v42 = &v106;
      v43 = &v105;
LABEL_47:
      objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      *v38 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v44);
      v27 = v18;
      goto LABEL_79;
    }
LABEL_48:
    v28 = 0;
    v27 = v18;
    goto LABEL_80;
  }
  self = v75;
  if (a4)
  {
    v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v54 = *MEMORY[0x1E0D025B8];
    v108 = *MEMORY[0x1E0CB2D50];
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("value_sequence_shape"));
    v109 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2, v27);
    v28 = 0;
    *a4 = v55;
    goto LABEL_81;
  }
  v28 = 0;
LABEL_82:
  v5 = v77;
LABEL_83:

LABEL_84:
  return v28;
}

- (id)_value_sequenceJSONArray
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
  -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence](self, "value_sequence", 0);
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

- (id)_value_sequence_shapeJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence_shape](self, "value_sequence_shape", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_value_dictionaryJSONArray
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
  -[BMIntelligencePlatformFeatureStoreFeatureValue value_dictionary](self, "value_dictionary", 0);
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  -[BMIntelligencePlatformFeatureStoreFeatureValue _value_sequenceJSONArray](self, "_value_sequenceJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValue _value_sequence_shapeJSONArray](self, "_value_sequence_shapeJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValue _value_dictionaryJSONArray](self, "_value_dictionaryJSONArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = CFSTR("value_sequence");
  v8 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v8;
  v14[1] = CFSTR("value_sequence_shape");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v9;
  v14[2] = CFSTR("value_dictionary");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v10;
  v14[3] = CFSTR("value");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4)
        goto LABEL_12;
LABEL_16:

      if (v3)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v4)
    goto LABEL_16;
LABEL_12:
  if (!v3)
    goto LABEL_17;
LABEL_13:

  return v12;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence](self, "value_sequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value_sequence");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence](self, "value_sequence");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value_sequence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence_shape](self, "value_sequence_shape");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value_sequence_shape");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMIntelligencePlatformFeatureStoreFeatureValue value_sequence_shape](self, "value_sequence_shape");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value_sequence_shape");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMIntelligencePlatformFeatureStoreFeatureValue value_dictionary](self, "value_dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value_dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMIntelligencePlatformFeatureStoreFeatureValue value_dictionary](self, "value_dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value_dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMIntelligencePlatformFeatureStoreFeatureValue value](self, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v12 = 1;
    }
    else
    {
      -[BMIntelligencePlatformFeatureStoreFeatureValue value](self, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)value_sequence
{
  return self->_value_sequence;
}

- (NSArray)value_sequence_shape
{
  return self->_value_sequence_shape;
}

- (NSArray)value_dictionary
{
  return self->_value_dictionary;
}

- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_value_dictionary, 0);
  objc_storeStrong((id *)&self->_value_sequence_shape, 0);
  objc_storeStrong((id *)&self->_value_sequence, 0);
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

    v4 = -[BMIntelligencePlatformFeatureStoreFeatureValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValue alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_sequence_json"), 5, 1, &__block_literal_global_196);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_sequence_shape_json"), 5, 1, &__block_literal_global_197);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_dictionary_json"), 5, 1, &__block_literal_global_198);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("value_json"), 5, 1, &__block_literal_global_199);
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
  return &unk_1E5F1AFB0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value_sequence"), 1, 14, objc_opt_class());
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value_sequence_shape"), 2, 2, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value_dictionary"), 3, 14, objc_opt_class());
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_value_dictionaryJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_value_sequence_shapeJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__BMIntelligencePlatformFeatureStoreFeatureValue_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_value_sequenceJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
