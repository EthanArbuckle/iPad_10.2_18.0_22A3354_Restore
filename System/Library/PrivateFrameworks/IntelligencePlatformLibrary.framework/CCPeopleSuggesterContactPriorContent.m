@implementation CCPeopleSuggesterContactPriorContent

- (CCPeopleSuggesterContactPriorContent)initWithVersion:(id)a3 minVersion:(id)a4 sourceSharedIdentifier:(id)a5 priorScore:(id)a6 modelName:(id)a7 modelVersion:(id)a8 referenceDate:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int IsInstanceOfExpectedClass;
  id v23;
  id v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  CCPeopleSuggesterContactPriorContent *v31;
  CCPeopleSuggesterContactPriorContent *v32;
  void *v34;
  id *v35;
  uint64_t v36;
  id v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v38 = a9;
  v21 = (void *)objc_opt_new();
  if (v15)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v23 = 0;
    if (!IsInstanceOfExpectedClass)
      goto LABEL_26;
    v35 = a10;
    objc_msgSend(v15, "unsignedIntValue");
    CCPBDataWriterWriteUint32Field();
    if (!v16)
    {
LABEL_4:
      v24 = v23;
      if (v17)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  else
  {
    v35 = a10;
    v23 = 0;
    if (!v16)
      goto LABEL_4;
  }
  objc_opt_class();
  v26 = CCValidateIsInstanceOfExpectedClass();
  v24 = v23;

  if (!v26)
    goto LABEL_25;
  objc_msgSend(v16, "unsignedIntValue");
  CCPBDataWriterWriteUint32Field();
  if (v17)
  {
LABEL_5:
    objc_opt_class();
    v25 = CCValidateIsInstanceOfExpectedClass();
    v23 = v24;

    if (!v25)
      goto LABEL_26;
    CCPBDataWriterWriteRepeatedInt64Field();
    if (!v18)
      goto LABEL_7;
    goto LABEL_12;
  }
LABEL_11:
  v23 = v24;
  if (!v18)
  {
LABEL_7:
    v24 = v23;
    goto LABEL_14;
  }
LABEL_12:
  objc_opt_class();
  v27 = CCValidateIsInstanceOfExpectedClass();
  v24 = v23;

  if (!v27)
    goto LABEL_25;
  CCPBDataWriterWriteRepeatedFloatField();
LABEL_14:
  if (v19)
  {
    objc_opt_class();
    v28 = CCValidateIsInstanceOfExpectedClass();
    v23 = v24;

    if (v28)
    {
      CCPBDataWriterWriteStringField();
      if (!v20)
      {
LABEL_17:
        v24 = v23;
LABEL_22:
        if (!v38)
        {
          v23 = v24;
          goto LABEL_30;
        }
        objc_opt_class();
        v30 = CCValidateIsInstanceOfExpectedClass();
        v23 = v24;

        if (v30)
        {
          objc_msgSend(v38, "doubleValue");
          CCPBDataWriterWriteDoubleField();
LABEL_30:
          objc_msgSend(v21, "immutableData", v35);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v34, v36);

          v32 = v31;
          goto LABEL_28;
        }
        goto LABEL_26;
      }
      goto LABEL_20;
    }
LABEL_26:
    CCSetError();
    v31 = 0;
    goto LABEL_27;
  }
  v23 = v24;
  if (!v20)
    goto LABEL_17;
LABEL_20:
  objc_opt_class();
  v29 = CCValidateIsInstanceOfExpectedClass();
  v24 = v23;

  if (v29)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_22;
  }
LABEL_25:
  CCSetError();
  v31 = 0;
  v23 = v24;
LABEL_27:
  v32 = self;
LABEL_28:

  return v31;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  char *v5;
  int *v6;
  int *v7;
  void *v8;
  void *v9;
  void *v10;
  int *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  BOOL v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  objc_class *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  double v42;
  uint64_t v43;
  objc_class *v44;
  void *v45;
  CCRepeatedInt64 *v46;
  CCRepeatedInt64 *sourceSharedIdentifier;
  CCRepeatedFloat *v48;
  CCRepeatedFloat *priorScore;
  objc_class *v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v56;
  id v57;

  v57 = a3;
  v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v57);
  v6 = (int *)MEMORY[0x24BE15728];
  v7 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v5[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v5[*MEMORY[0x24BE15720]])
  {
    v9 = 0;
    v8 = 0;
LABEL_63:
    v10 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = (int *)MEMORY[0x24BE15718];
    v12 = (int *)MEMORY[0x24BE15710];
    do
    {
      if (*(_QWORD *)&v5[*v11])
        v13 = 0;
      else
        v13 = v10 == 0;
      if (!v13)
        break;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      while (1)
      {
        v17 = *v6;
        v18 = *(_QWORD *)&v5[v17];
        v19 = v18 + 1;
        if (v18 == -1 || v19 > *(_QWORD *)&v5[*v7])
          break;
        v20 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v18);
        *(_QWORD *)&v5[v17] = v19;
        v16 |= (unint64_t)(v20 & 0x7F) << v14;
        if ((v20 & 0x80) == 0)
          goto LABEL_17;
        v14 += 7;
        v21 = v15++ >= 9;
        if (v21)
        {
          v16 = 0;
          v22 = *v11;
          if (*(_QWORD *)&v5[v22])
            goto LABEL_63;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v5[*v11] = 1;
LABEL_17:
      v22 = *v11;
      if (*(_QWORD *)&v5[v22])
        goto LABEL_63;
LABEL_18:
      switch((v16 >> 3))
      {
        case 1u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (1)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v5[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v5[*v7])
              break;
            v29 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v27);
            *(_QWORD *)&v5[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0)
              goto LABEL_49;
            v23 += 7;
            v21 = v24++ >= 9;
            if (v21)
            {
              LODWORD(v25) = 0;
              goto LABEL_51;
            }
          }
          *(_QWORD *)&v5[*v11] = 1;
LABEL_49:
          if (*(_QWORD *)&v5[*v11])
            LODWORD(v25) = 0;
LABEL_51:
          v10 = 0;
          self->_version = v25;
          v43 = 16;
          goto LABEL_59;
        case 2u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          break;
        case 3u:
          if (!v9)
            v9 = (void *)objc_opt_new();
          CCPBReaderAppendRepeatedInt64FieldValues();
          goto LABEL_44;
        case 4u:
          if (!v8)
            v8 = (void *)objc_opt_new();
          CCPBReaderAppendRepeatedFloatFieldValues();
          goto LABEL_44;
        case 5u:
          CCPBReaderReadStringNoCopy();
          v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v38 = 48;
          goto LABEL_43;
        case 6u:
          CCPBReaderReadStringNoCopy();
          v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v38 = 56;
LABEL_43:
          v39 = *(Class *)((char *)&self->super.super.isa + v38);
          *(Class *)((char *)&self->super.super.isa + v38) = v37;

LABEL_44:
          v10 = 0;
          continue;
        case 7u:
          v40 = *v6;
          v41 = *(_QWORD *)&v5[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)&v5[*v7])
          {
            v42 = *(double *)(*(_QWORD *)&v5[*v12] + v41);
            *(_QWORD *)&v5[v40] = v41 + 8;
          }
          else
          {
            *(_QWORD *)&v5[v22] = 1;
            v42 = 0.0;
          }
          v10 = 0;
          self->_referenceDate = v42;
          v43 = 18;
          goto LABEL_59;
        default:
          if ((CCPBReaderSkipValueWithTag() & 1) != 0)
          {
            v10 = 0;
          }
          else
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v56 = v9;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            CCSkipFieldErrorForMessage();
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v56;
          }
          continue;
      }
      while (1)
      {
        v33 = *v6;
        v34 = *(_QWORD *)&v5[v33];
        v35 = v34 + 1;
        if (v34 == -1 || v35 > *(_QWORD *)&v5[*v7])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v5[*v12] + v34);
        *(_QWORD *)&v5[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0)
          goto LABEL_54;
        v30 += 7;
        v21 = v31++ >= 9;
        if (v21)
        {
          LODWORD(v32) = 0;
          goto LABEL_56;
        }
      }
      *(_QWORD *)&v5[*v11] = 1;
LABEL_54:
      if (*(_QWORD *)&v5[*v11])
        LODWORD(v32) = 0;
LABEL_56:
      v10 = 0;
      self->_minVersion = v32;
      v43 = 17;
LABEL_59:
      *((_BYTE *)&self->super.super.isa + v43) = 1;
    }
    while (*(_QWORD *)&v5[*v6] < *(_QWORD *)&v5[*v7]);
  }
  v46 = (CCRepeatedInt64 *)objc_msgSend(v9, "copy");
  sourceSharedIdentifier = self->_sourceSharedIdentifier;
  self->_sourceSharedIdentifier = v46;

  v48 = (CCRepeatedFloat *)objc_msgSend(v8, "copy");
  priorScore = self->_priorScore;
  self->_priorScore = v48;

  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v54 = 1;
      goto LABEL_69;
    }
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v52 = v8;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v8 = v52;
  }
  v54 = 0;
LABEL_69:

  return v54;
}

- (NSString)modelName
{
  return (NSString *)(id)-[NSString copy](self->_modelName, "copy");
}

- (NSString)modelVersion
{
  return (NSString *)(id)-[NSString copy](self->_modelVersion, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a3;
  if (self->_hasVersion)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", 40569, self->_version);
    v12[2](v12, v5);

  }
  if (self->_hasMinVersion)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", 40570, self->_minVersion);
    v12[2](v12, v6);

  }
  if (self->_sourceSharedIdentifier)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedInt64Value:", 40571, self->_sourceSharedIdentifier);
    v12[2](v12, v7);

  }
  if (self->_priorScore)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedFloatValue:", 40572, self->_priorScore);
    v12[2](v12, v8);

  }
  if (self->_modelName)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 40573, self->_modelName);
    v12[2](v12, v9);

  }
  if (self->_modelVersion)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 40574, self->_modelVersion);
    v12[2](v12, v10);

  }
  if (self->_hasReferenceDate)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:doubleValue:", 40575, self->_referenceDate);
    v12[2](v12, v11);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = (void *)objc_opt_new();
  if (self->_hasVersion)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCPeopleSuggesterContactPriorContent version](self, "version"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("version"));

  }
  if (self->_hasMinVersion)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCPeopleSuggesterContactPriorContent minVersion](self, "minVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("minVersion"));

  }
  v6 = MEMORY[0x24BDAC760];
  if (self->_sourceSharedIdentifier)
  {
    v7 = (void *)objc_opt_new();
    -[CCPeopleSuggesterContactPriorContent sourceSharedIdentifier](self, "sourceSharedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke;
    v24[3] = &unk_251030B88;
    v25 = v7;
    v9 = v7;
    objc_msgSend(v8, "enumerateInt64ValuesWithBlock:", v24);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sourceSharedIdentifier"));
  }
  if (self->_priorScore)
  {
    v10 = (void *)objc_opt_new();
    -[CCPeopleSuggesterContactPriorContent priorScore](self, "priorScore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    v20 = 3221225472;
    v21 = __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke_2;
    v22 = &unk_251030BB0;
    v23 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateFloatValuesWithBlock:", &v19);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("priorScore"), v19, v20, v21, v22);
  }
  if (self->_modelName)
  {
    -[CCPeopleSuggesterContactPriorContent modelName](self, "modelName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("modelName"));

  }
  if (self->_modelVersion)
  {
    -[CCPeopleSuggesterContactPriorContent modelVersion](self, "modelVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("modelVersion"));

  }
  if (self->_hasReferenceDate)
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    -[CCPeopleSuggesterContactPriorContent referenceDate](self, "referenceDate");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("referenceDate"));

  }
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (CCPeopleSuggesterContactPriorContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  CCPeopleSuggesterContactPriorContent *v24;
  uint64_t v25;
  id v26;
  char v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  CCPeopleSuggesterContactPriorContent *v44;
  CCPeopleSuggesterContactPriorContent *v45;
  void *v46;
  id *v47;
  id *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v60 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("minVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceSharedIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      v59 = v8;
      v13 = CCValidateIsInstanceOfExpectedClass();
      v14 = v8;

      if ((v13 & 1) == 0)
      {
        CCSetError();
        v24 = 0;
        v15 = v12;
LABEL_33:

        v8 = v14;
        goto LABEL_34;
      }
      v40 = v10;
      v41 = v9;
      v44 = self;
      v15 = (void *)objc_opt_new();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      v47 = a4;
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v56;
        while (2)
        {
          v20 = 0;
          v21 = v14;
          do
          {
            if (*(_QWORD *)v56 != v19)
              objc_enumerationMutation(v16);
            v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v20);
            objc_opt_class();
            v54 = v21;
            v23 = CCValidateIsInstanceOfExpectedClass();
            v14 = v21;

            if (!v23)
            {
              CCSetError();

              v24 = 0;
              v15 = v16;
              self = v44;
              v10 = v40;
              v9 = v41;
              goto LABEL_33;
            }
            objc_msgSend(v15, "appendInt64Value:", objc_msgSend(v22, "longLongValue"));
            ++v20;
            v21 = v14;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
          if (v18)
            continue;
          break;
        }
      }

      v8 = v14;
      self = v44;
      v10 = v40;
      v9 = v41;
      a4 = v47;
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("priorScore"));
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (id)v25;
      objc_opt_class();
      v53 = v8;
      v27 = CCValidateIsInstanceOfExpectedClass();
      v14 = v8;

      if ((v27 & 1) == 0)
      {
        CCSetError();
        v24 = 0;
        goto LABEL_32;
      }
      v39 = v15;
      v45 = self;
      v48 = a4;
      v42 = v9;
      v43 = v6;
      v28 = (void *)objc_opt_new();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v26 = v26;
      v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v50;
        while (2)
        {
          v32 = 0;
          v33 = v14;
          do
          {
            if (*(_QWORD *)v50 != v31)
              objc_enumerationMutation(v26);
            v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v32);
            objc_opt_class();
            v35 = CCValidateIsInstanceOfExpectedClass();
            v14 = v33;

            if (!v35)
            {
              CCSetError();

              v24 = 0;
              v6 = v43;
              self = v45;
              v9 = v42;
              v15 = v39;
              goto LABEL_32;
            }
            objc_msgSend(v34, "floatValue");
            objc_msgSend(v28, "appendFloatValue:");
            ++v32;
            v33 = v14;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          if (v30)
            continue;
          break;
        }
      }

      v6 = v43;
      self = v45;
      v9 = v42;
    }
    else
    {
      v39 = v15;
      v48 = a4;
      v28 = 0;
      v14 = v8;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelVersion"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceDate"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[CCPeopleSuggesterContactPriorContent initWithVersion:minVersion:sourceSharedIdentifier:priorScore:modelName:modelVersion:referenceDate:error:]([CCPeopleSuggesterContactPriorContent alloc], "initWithVersion:minVersion:sourceSharedIdentifier:priorScore:modelName:modelVersion:referenceDate:error:", v9, v10, v39, v28, v46, v36, v37, v48);

    v26 = v28;
    v15 = v39;
LABEL_32:

    goto LABEL_33;
  }
  CCSetError();
  v24 = 0;
LABEL_34:

  return v24;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)minVersion
{
  return self->_minVersion;
}

- (CCRepeatedInt64)sourceSharedIdentifier
{
  return self->_sourceSharedIdentifier;
}

- (CCRepeatedFloat)priorScore
{
  return self->_priorScore;
}

- (double)referenceDate
{
  return self->_referenceDate;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasMinVersion
{
  return self->_hasMinVersion;
}

- (void)setHasMinVersion:(BOOL)a3
{
  self->_hasMinVersion = a3;
}

- (BOOL)hasReferenceDate
{
  return self->_hasReferenceDate;
}

- (void)setHasReferenceDate:(BOOL)a3
{
  self->_hasReferenceDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_priorScore, 0);
  objc_storeStrong((id *)&self->_sourceSharedIdentifier, 0);
}

void __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

+ (unsigned)itemType
{
  return -24968;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 24968) > 7u)
    return 0;
  else
    return *(&off_251030BD0 + (unsigned __int16)(a3 + 24968));
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
