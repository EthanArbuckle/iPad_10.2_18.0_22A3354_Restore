@implementation BMMLSEVirtualFeatureStoreFeatureFeatureValue

- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7 missingReason:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v18;
  unsigned int v19;
  double v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMMLSEVirtualFeatureStoreFeatureFeatureValue;
  v18 = -[BMEventBase init](&v22, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v18->_hasIntValue = 1;
      v19 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v19 = 0;
      v18->_hasIntValue = 0;
    }
    v18->_intValue = v19;
    if (v15)
    {
      v18->_hasDoubleValue = 1;
      objc_msgSend(v15, "doubleValue");
    }
    else
    {
      v18->_hasDoubleValue = 0;
      v20 = -1.0;
    }
    v18->_doubleValue = v20;
    objc_storeStrong((id *)&v18->_stringValue, a5);
    if (v17)
    {
      v18->_hasBoolValue = 1;
      v18->_BOOLValue = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v18->_hasBoolValue = 0;
      v18->_BOOLValue = 0;
    }
    v18->_timeBucketValue = a7;
    v18->_missingReason = a8;
  }

  return v18;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue intValue](self, "intValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMLSEVirtualFeatureStoreFeatureFeatureValue doubleValue](self, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStoreFeatureFeatureValue stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue BOOLValue](self, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketAsString(-[BMMLSEVirtualFeatureStoreFeatureFeatureValue timeBucketValue](self, "timeBucketValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonAsString(-[BMMLSEVirtualFeatureStoreFeatureFeatureValue missingReason](self, "missingReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEVirtualFeatureStoreFeatureFeatureValue with intValue: %@, doubleValue: %@, stringValue: %@, BOOLValue: %@, timeBucketValue: %@, missingReason: %@"), v4, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v5;
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
  NSString *stringValue;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMMLSEVirtualFeatureStoreFeatureFeatureValue;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_80;
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
          v5->_hasIntValue = 1;
          while (2)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
              *(_QWORD *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_57:
          v5->_intValue = v22;
          continue;
        case 2u:
          v5->_hasDoubleValue = 1;
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
          v5->_doubleValue = v29;
          continue;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          stringValue = v5->_stringValue;
          v5->_stringValue = (NSString *)v30;

          continue;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v5->_hasBoolValue = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                v17 = v33++ >= 9;
                if (v17)
                {
                  v34 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v34 = 0;
LABEL_61:
          v5->_BOOLValue = v34 != 0;
          continue;
        case 5u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          while (1)
          {
            v42 = *v6;
            v43 = *(_QWORD *)&v4[v42];
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)&v4[*v7])
              break;
            v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
            *(_QWORD *)&v4[v42] = v44;
            v41 |= (unint64_t)(v45 & 0x7F) << v39;
            if ((v45 & 0x80) == 0)
              goto LABEL_63;
            v39 += 7;
            v17 = v40++ >= 9;
            if (v17)
            {
              LODWORD(v41) = 0;
              goto LABEL_65;
            }
          }
          v4[*v8] = 1;
LABEL_63:
          if (v4[*v8])
            LODWORD(v41) = 0;
LABEL_65:
          if (v41 >= 0x17)
            LODWORD(v41) = 0;
          v52 = 28;
          goto LABEL_74;
        case 6u:
          v46 = 0;
          v47 = 0;
          v41 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_79;
          continue;
      }
      while (1)
      {
        v48 = *v6;
        v49 = *(_QWORD *)&v4[v48];
        v50 = v49 + 1;
        if (v49 == -1 || v50 > *(_QWORD *)&v4[*v7])
          break;
        v51 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v49);
        *(_QWORD *)&v4[v48] = v50;
        v41 |= (unint64_t)(v51 & 0x7F) << v46;
        if ((v51 & 0x80) == 0)
          goto LABEL_69;
        v46 += 7;
        v17 = v47++ >= 9;
        if (v17)
        {
          LODWORD(v41) = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8])
        LODWORD(v41) = 0;
LABEL_71:
      if (v41 >= 2)
        LODWORD(v41) = 0;
      v52 = 32;
LABEL_74:
      *(_DWORD *)((char *)&v5->super.super.isa + v52) = v41;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_79:
    v53 = 0;
  else
LABEL_80:
    v53 = v5;

  return v53;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasIntValue)
    PBDataWriterWriteUint32Field();
  if (self->_hasDoubleValue)
    PBDataWriterWriteDoubleField();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if (self->_hasBoolValue)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEVirtualFeatureStoreFeatureFeatureValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  id v15;
  id *v16;
  uint64_t v17;
  void *v18;
  id v19;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  id *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id *v44;
  id *v45;
  id *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("doubleValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v18 = 0;
          v20 = 0;
          goto LABEL_50;
        }
        v21 = v8;
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("doubleValue"));
        v61 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v22;
        v8 = v21;
        v18 = 0;
        v20 = 0;
        *v45 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v23, 2, v10);
        goto LABEL_49;
      }
      v50 = v9;
    }
    else
    {
      v50 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stringValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v20 = 0;
          v18 = v50;
          goto LABEL_49;
        }
        v25 = v8;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = a4;
        v27 = *MEMORY[0x1E0D025B8];
        v58 = *MEMORY[0x1E0CB2D50];
        v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("stringValue"));
        v59 = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26;
        v8 = v25;
        v11 = 0;
        v20 = 0;
        *v46 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v27, 2, v12);
LABEL_48:
        v18 = v50;

        self = v51;
LABEL_49:

        goto LABEL_50;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BOOLValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v11;
    v48 = v8;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v49 = 0;
          v20 = 0;
          goto LABEL_48;
        }
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v56 = *MEMORY[0x1E0CB2D50];
        v31 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("BOOLValue"));
        v57 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v13);
        v49 = 0;
        v20 = 0;
        *v31 = v32;
        goto LABEL_47;
      }
      v49 = v12;
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeBucketValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = a4;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v20 = 0;
            goto LABEL_47;
          }
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v54 = *MEMORY[0x1E0CB2D50];
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("timeBucketValue"));
          v55 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v33);
          a4 = 0;
          v20 = 0;
          *v44 = v39;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString(v13));
        v14 = (id *)objc_claimAutoreleasedReturnValue();
      }
      a4 = v14;
    }
    else
    {
      a4 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("missingReason"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v33;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v44)
          {
            v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v42 = *MEMORY[0x1E0D025B8];
            v52 = *MEMORY[0x1E0CB2D50];
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("missingReason"));
            v53 = v40;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *v44 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v42, 2, v41);

          }
          v34 = 0;
          v20 = 0;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", bsearch_b(v33, BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_50) != 0);
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v35;
    }
    else
    {
      v34 = 0;
    }
    v20 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:missingReason:](v51, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:missingReason:", v48, v50, v47, v49, objc_msgSend(a4, "intValue"), objc_msgSend(v34, "intValue"));
    v51 = v20;
LABEL_46:

LABEL_47:
    v11 = v47;
    v8 = v48;
    goto LABEL_48;
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
    v20 = 0;
    goto LABEL_51;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = a4;
  v17 = *MEMORY[0x1E0D025B8];
  v62 = *MEMORY[0x1E0CB2D50];
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("intValue"));
  v63[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v17, 2, v9);
  v8 = 0;
  v20 = 0;
  *v16 = v19;
LABEL_50:

LABEL_51:
  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  if (-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasIntValue](self, "hasIntValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue intValue](self, "intValue"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasDoubleValue](self, "hasDoubleValue")
    || (-[BMMLSEVirtualFeatureStoreFeatureFeatureValue doubleValue](self, "doubleValue"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMMLSEVirtualFeatureStoreFeatureFeatureValue doubleValue](self, "doubleValue");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMLSEVirtualFeatureStoreFeatureFeatureValue doubleValue](self, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMMLSEVirtualFeatureStoreFeatureFeatureValue stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasBoolValue](self, "hasBoolValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue BOOLValue](self, "BOOLValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue timeBucketValue](self, "timeBucketValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEVirtualFeatureStoreFeatureFeatureValue missingReason](self, "missingReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("intValue");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v11;
  v22 = (void *)v3;
  v24[0] = v11;
  v23[1] = CFSTR("doubleValue");
  v12 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  v24[1] = v12;
  v23[2] = CFSTR("stringValue");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[2] = v13;
  v23[3] = CFSTR("BOOLValue");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v14;
  v23[4] = CFSTR("timeBucketValue");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v15;
  v23[5] = CFSTR("missingReason");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_25;
  }
  else
  {

    if (v9)
    {
LABEL_25:
      if (v8)
        goto LABEL_26;
      goto LABEL_33;
    }
  }

  if (v8)
  {
LABEL_26:
    if (v7)
      goto LABEL_27;
LABEL_34:

    if (v6)
      goto LABEL_28;
    goto LABEL_35;
  }
LABEL_33:

  if (!v7)
    goto LABEL_34;
LABEL_27:
  if (v6)
    goto LABEL_28;
LABEL_35:

LABEL_28:
  if (!v22)

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  int v17;
  int v18;
  int v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasIntValue](self, "hasIntValue")
      || objc_msgSend(v5, "hasIntValue"))
    {
      if (!-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasIntValue](self, "hasIntValue"))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasIntValue"))
        goto LABEL_24;
      v6 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue intValue](self, "intValue");
      if (v6 != objc_msgSend(v5, "intValue"))
        goto LABEL_24;
    }
    if (-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasDoubleValue](self, "hasDoubleValue")
      || objc_msgSend(v5, "hasDoubleValue"))
    {
      if (!-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasDoubleValue](self, "hasDoubleValue"))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasDoubleValue"))
        goto LABEL_24;
      -[BMMLSEVirtualFeatureStoreFeatureFeatureValue doubleValue](self, "doubleValue");
      v8 = v7;
      objc_msgSend(v5, "doubleValue");
      if (v8 != v9)
        goto LABEL_24;
    }
    -[BMMLSEVirtualFeatureStoreFeatureFeatureValue stringValue](self, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v11)
    {

    }
    else
    {
      v12 = (void *)v11;
      -[BMMLSEVirtualFeatureStoreFeatureFeatureValue stringValue](self, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (!v15)
        goto LABEL_24;
    }
    if (!-[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasBoolValue](self, "hasBoolValue")
      && !objc_msgSend(v5, "hasBoolValue")
      || -[BMMLSEVirtualFeatureStoreFeatureFeatureValue hasBoolValue](self, "hasBoolValue")
      && objc_msgSend(v5, "hasBoolValue")
      && (v17 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue BOOLValue](self, "BOOLValue"),
          v17 == objc_msgSend(v5, "BOOLValue")))
    {
      v18 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue timeBucketValue](self, "timeBucketValue");
      if (v18 == objc_msgSend(v5, "timeBucketValue"))
      {
        v19 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue missingReason](self, "missingReason");
        v16 = v19 == objc_msgSend(v5, "missingReason");
LABEL_25:

        goto LABEL_26;
      }
    }
LABEL_24:
    v16 = 0;
    goto LABEL_25;
  }
  v16 = 0;
LABEL_26:

  return v16;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)intValue
{
  return self->_intValue;
}

- (BOOL)hasIntValue
{
  return self->_hasIntValue;
}

- (void)setHasIntValue:(BOOL)a3
{
  self->_hasIntValue = a3;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (BOOL)hasDoubleValue
{
  return self->_hasDoubleValue;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  self->_hasDoubleValue = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (BOOL)hasBoolValue
{
  return self->_hasBoolValue;
}

- (void)setHasBoolValue:(BOOL)a3
{
  self->_hasBoolValue = a3;
}

- (int)timeBucketValue
{
  return self->_timeBucketValue;
}

- (int)missingReason
{
  return self->_missingReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
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

    v4 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue initByReadFrom:]([BMMLSEVirtualFeatureStoreFeatureFeatureValue alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intValue"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("doubleValue"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stringValue"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("BOOLValue"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeBucketValue"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("missingReason"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1B478;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intValue"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("doubleValue"), 2, 0, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stringValue"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("BOOLValue"), 4, 12, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeBucketValue"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("missingReason"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucketValue:(int)a7
{
  return -[BMMLSEVirtualFeatureStoreFeatureFeatureValue initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:missingReason:](self, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:missingReason:", a3, a4, a5, a6, *(_QWORD *)&a7, 0);
}

@end
