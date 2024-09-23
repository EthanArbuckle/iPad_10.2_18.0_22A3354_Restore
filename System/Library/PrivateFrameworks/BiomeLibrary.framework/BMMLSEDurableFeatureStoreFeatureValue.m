@implementation BMMLSEDurableFeatureStoreFeatureValue

- (BMMLSEDurableFeatureStoreFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 histogramValue:(id)a7 missingReason:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BMMLSEDurableFeatureStoreFeatureValue *v19;
  unsigned int v20;
  double v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValue;
  v19 = -[BMEventBase init](&v23, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v19->_hasIntValue = 1;
      v20 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v20 = 0;
      v19->_hasIntValue = 0;
    }
    v19->_intValue = v20;
    if (v15)
    {
      v19->_hasDoubleValue = 1;
      objc_msgSend(v15, "doubleValue");
    }
    else
    {
      v19->_hasDoubleValue = 0;
      v21 = -1.0;
    }
    v19->_doubleValue = v21;
    objc_storeStrong((id *)&v19->_stringValue, a5);
    if (v17)
    {
      v19->_hasBoolValue = 1;
      v19->_BOOLValue = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v19->_hasBoolValue = 0;
      v19->_BOOLValue = 0;
    }
    objc_storeStrong((id *)&v19->_histogramValue, a7);
    v19->_missingReason = a8;
  }

  return v19;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStoreFeatureValue intValue](self, "intValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMLSEDurableFeatureStoreFeatureValue doubleValue](self, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEDurableFeatureStoreFeatureValue stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValue BOOLValue](self, "BOOLValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEDurableFeatureStoreFeatureValue histogramValue](self, "histogramValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSEDurableFeatureStoreFeatureValueMissingReasonAsString(-[BMMLSEDurableFeatureStoreFeatureValue missingReason](self, "missingReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEDurableFeatureStoreFeatureValue with intValue: %@, doubleValue: %@, stringValue: %@, BOOLValue: %@, histogramValue: %@, missingReason: %@"), v4, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEDurableFeatureStoreFeatureValue *v5;
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
  BMMLSEDurableFeatureStoreFeatureValueHistogram *v39;
  BMMLSEDurableFeatureStoreFeatureValueHistogram *histogramValue;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  BMMLSEDurableFeatureStoreFeatureValue *v48;
  objc_super v50;
  uint64_t v51;
  uint64_t v52;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMMLSEDurableFeatureStoreFeatureValue;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_69;
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
              goto LABEL_51;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_53:
          v5->_intValue = v22;
          break;
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
          break;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          stringValue = v5->_stringValue;
          v5->_stringValue = (NSString *)v30;

          break;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v5->_hasBoolValue = 1;
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
          v5->_BOOLValue = v34 != 0;
          break;
        case 5u:
          v51 = 0;
          v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_68;
          v39 = -[BMMLSEDurableFeatureStoreFeatureValueHistogram initByReadFrom:]([BMMLSEDurableFeatureStoreFeatureValueHistogram alloc], "initByReadFrom:", v4);
          if (!v39)
            goto LABEL_68;
          histogramValue = v5->_histogramValue;
          v5->_histogramValue = v39;

          PBReaderRecallMark();
          break;
        case 6u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          while (1)
          {
            v44 = *v6;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v7])
              break;
            v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
            *(_QWORD *)&v4[v44] = v46;
            v43 |= (unint64_t)(v47 & 0x7F) << v41;
            if ((v47 & 0x80) == 0)
              goto LABEL_59;
            v41 += 7;
            v17 = v42++ >= 9;
            if (v17)
            {
              LODWORD(v43) = 0;
              goto LABEL_61;
            }
          }
          v4[*v8] = 1;
LABEL_59:
          if (v4[*v8])
            LODWORD(v43) = 0;
LABEL_61:
          if (v43 >= 2)
            LODWORD(v43) = 0;
          v5->_missingReason = v43;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_68;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_68:
    v48 = 0;
  else
LABEL_69:
    v48 = v5;

  return v48;
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
  if (self->_histogramValue)
  {
    PBDataWriterPlaceMark();
    -[BMMLSEDurableFeatureStoreFeatureValueHistogram writeTo:](self->_histogramValue, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEDurableFeatureStoreFeatureValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEDurableFeatureStoreFeatureValue)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  BMMLSEDurableFeatureStoreFeatureValueHistogram *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  BMMLSEDurableFeatureStoreFeatureValue *v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  BMMLSEDurableFeatureStoreFeatureValue *v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  BMMLSEDurableFeatureStoreFeatureValueHistogram *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("doubleValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v25 = 0;
          v21 = 0;
          goto LABEL_54;
        }
        v27 = a4;
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = v8;
        v30 = *MEMORY[0x1E0D025B8];
        v66 = *MEMORY[0x1E0CB2D50];
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("doubleValue"));
        v67 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v30;
        v8 = v29;
        v25 = 0;
        v21 = 0;
        *v27 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v32, 2, v10);
        v11 = (id)v31;
        goto LABEL_53;
      }
      v55 = v9;
    }
    else
    {
      v55 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stringValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v21 = 0;
          v25 = v55;
          goto LABEL_53;
        }
        v34 = a4;
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = v8;
        v37 = *MEMORY[0x1E0D025B8];
        v64 = *MEMORY[0x1E0CB2D50];
        v54 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("stringValue"));
        v65 = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        v8 = v36;
        v21 = 0;
        *v34 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v38, 2, v12);
        v11 = 0;
        goto LABEL_60;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BOOLValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v11;
    v52 = v8;
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v54 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = v12;
LABEL_13:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("histogramValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a4;
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v15 = 0;
LABEL_16:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("missingReason"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = v16;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v48 = *MEMORY[0x1E0D025B8];
                v58 = *MEMORY[0x1E0CB2D50];
                v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("missingReason"));
                v59 = v46;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *v14 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v48, 2, v47);

              }
              v17 = 0;
              v21 = 0;
              v11 = v51;
              goto LABEL_49;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", bsearch_b(v16, &BMMLSEDurableFeatureStoreFeatureValueMissingReasonFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_16_33100) != 0);
            v33 = (id)objc_claimAutoreleasedReturnValue();
          }
          v17 = v33;
        }
        else
        {
          v17 = 0;
        }
        v11 = v51;
        v21 = -[BMMLSEDurableFeatureStoreFeatureValue initWithIntValue:doubleValue:stringValue:BOOLValue:histogramValue:missingReason:](v56, "initWithIntValue:doubleValue:stringValue:BOOLValue:histogramValue:missingReason:", v52, v55, v51, v54, v15, objc_msgSend(v17, "intValue"));
        v56 = v21;
LABEL_49:

        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v13;
        v57 = 0;
        v15 = -[BMMLSEDurableFeatureStoreFeatureValueHistogram initWithJSONDictionary:error:]([BMMLSEDurableFeatureStoreFeatureValueHistogram alloc], "initWithJSONDictionary:error:", v18, &v57);
        v19 = v57;
        if (!v19)
        {

          goto LABEL_16;
        }
        v20 = v19;
        if (v14)
          *v14 = objc_retainAutorelease(v19);

        v21 = 0;
        v13 = v18;
      }
      else
      {
        if (!a4)
        {
          v21 = 0;
          v25 = v55;
          v11 = v51;
          goto LABEL_51;
        }
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v15 = (BMMLSEDurableFeatureStoreFeatureValueHistogram *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("histogramValue"));
        v61 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v43, 2, v44);

        v21 = 0;
      }
LABEL_44:
      v11 = v51;
LABEL_50:

      v8 = v52;
      v25 = v55;
LABEL_51:

LABEL_52:
      self = v56;
LABEL_53:

      v7 = v53;
      goto LABEL_54;
    }
    if (a4)
    {
      v39 = a4;
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = *MEMORY[0x1E0D025B8];
      v62 = *MEMORY[0x1E0CB2D50];
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("BOOLValue"));
      v63 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v15 = (BMMLSEDurableFeatureStoreFeatureValueHistogram *)objc_claimAutoreleasedReturnValue();
      v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v15);
      v54 = 0;
      v21 = 0;
      *v39 = v42;
      goto LABEL_44;
    }
    v54 = 0;
    v21 = 0;
LABEL_60:
    v25 = v55;
    goto LABEL_52;
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
    v21 = 0;
    goto LABEL_55;
  }
  v22 = a4;
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = *MEMORY[0x1E0D025B8];
  v68 = *MEMORY[0x1E0CB2D50];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("intValue"));
  v69[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v9);
  v8 = 0;
  v21 = 0;
  *v22 = v26;
LABEL_54:

LABEL_55:
  return v21;
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  if (-[BMMLSEDurableFeatureStoreFeatureValue hasIntValue](self, "hasIntValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEDurableFeatureStoreFeatureValue intValue](self, "intValue"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!-[BMMLSEDurableFeatureStoreFeatureValue hasDoubleValue](self, "hasDoubleValue")
    || (-[BMMLSEDurableFeatureStoreFeatureValue doubleValue](self, "doubleValue"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMMLSEDurableFeatureStoreFeatureValue doubleValue](self, "doubleValue");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMLSEDurableFeatureStoreFeatureValue doubleValue](self, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMMLSEDurableFeatureStoreFeatureValue stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEDurableFeatureStoreFeatureValue hasBoolValue](self, "hasBoolValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSEDurableFeatureStoreFeatureValue BOOLValue](self, "BOOLValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[BMMLSEDurableFeatureStoreFeatureValue histogramValue](self, "histogramValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEDurableFeatureStoreFeatureValue missingReason](self, "missingReason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("intValue");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v23 = (void *)v3;
  v25[0] = v12;
  v24[1] = CFSTR("doubleValue");
  v13 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v20 = v13;
  v25[1] = v13;
  v24[2] = CFSTR("stringValue");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v13, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v14;
  v24[3] = CFSTR("BOOLValue");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v15;
  v24[4] = CFSTR("histogramValue");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v16;
  v24[5] = CFSTR("missingReason");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_25;
  }
  else
  {

    if (v10)
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
  if (!v23)

  return v18;
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
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMMLSEDurableFeatureStoreFeatureValue hasIntValue](self, "hasIntValue")
      || objc_msgSend(v5, "hasIntValue"))
    {
      if (!-[BMMLSEDurableFeatureStoreFeatureValue hasIntValue](self, "hasIntValue"))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasIntValue"))
        goto LABEL_24;
      v6 = -[BMMLSEDurableFeatureStoreFeatureValue intValue](self, "intValue");
      if (v6 != objc_msgSend(v5, "intValue"))
        goto LABEL_24;
    }
    if (-[BMMLSEDurableFeatureStoreFeatureValue hasDoubleValue](self, "hasDoubleValue")
      || objc_msgSend(v5, "hasDoubleValue"))
    {
      if (!-[BMMLSEDurableFeatureStoreFeatureValue hasDoubleValue](self, "hasDoubleValue"))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasDoubleValue"))
        goto LABEL_24;
      -[BMMLSEDurableFeatureStoreFeatureValue doubleValue](self, "doubleValue");
      v8 = v7;
      objc_msgSend(v5, "doubleValue");
      if (v8 != v9)
        goto LABEL_24;
    }
    -[BMMLSEDurableFeatureStoreFeatureValue stringValue](self, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v11)
    {

    }
    else
    {
      v12 = (void *)v11;
      -[BMMLSEDurableFeatureStoreFeatureValue stringValue](self, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (!v15)
        goto LABEL_24;
    }
    if (-[BMMLSEDurableFeatureStoreFeatureValue hasBoolValue](self, "hasBoolValue")
      || objc_msgSend(v5, "hasBoolValue"))
    {
      if (!-[BMMLSEDurableFeatureStoreFeatureValue hasBoolValue](self, "hasBoolValue"))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasBoolValue"))
        goto LABEL_24;
      v17 = -[BMMLSEDurableFeatureStoreFeatureValue BOOLValue](self, "BOOLValue");
      if (v17 != objc_msgSend(v5, "BOOLValue"))
        goto LABEL_24;
    }
    -[BMMLSEDurableFeatureStoreFeatureValue histogramValue](self, "histogramValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "histogramValue");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v18 == (void *)v19)
    {

    }
    else
    {
      v20 = (void *)v19;
      -[BMMLSEDurableFeatureStoreFeatureValue histogramValue](self, "histogramValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "histogramValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      if (!v23)
      {
LABEL_24:
        v16 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v25 = -[BMMLSEDurableFeatureStoreFeatureValue missingReason](self, "missingReason");
    v16 = v25 == objc_msgSend(v5, "missingReason");
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

- (BMMLSEDurableFeatureStoreFeatureValueHistogram)histogramValue
{
  return self->_histogramValue;
}

- (int)missingReason
{
  return self->_missingReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramValue, 0);
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

    v4 = -[BMMLSEDurableFeatureStoreFeatureValue initByReadFrom:]([BMMLSEDurableFeatureStoreFeatureValue alloc], "initByReadFrom:", v7);
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
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("histogramValue_json"), 5, 1, &__block_literal_global_1241);
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
  return &unk_1E5F1C690;
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
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("histogramValue"), 5, 14, objc_opt_class());
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("missingReason"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __48__BMMLSEDurableFeatureStoreFeatureValue_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histogramValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMMLSEDurableFeatureStoreFeatureValue)initWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 histogramValue:(id)a7
{
  return -[BMMLSEDurableFeatureStoreFeatureValue initWithIntValue:doubleValue:stringValue:BOOLValue:histogramValue:missingReason:](self, "initWithIntValue:doubleValue:stringValue:BOOLValue:histogramValue:missingReason:", a3, a4, a5, a6, a7, 0);
}

@end
