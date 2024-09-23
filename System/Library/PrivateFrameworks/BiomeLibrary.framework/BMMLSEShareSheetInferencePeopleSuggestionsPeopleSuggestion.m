@implementation BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion)initWithIdentifier:(id)a3 model:(id)a4 modelIdentifier:(id)a5 transportBundleId:(id)a6 rank:(id)a7 score:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *v19;
  unsigned int v20;
  double v21;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion;
  v19 = -[BMEventBase init](&v25, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v23, v24);
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_model, a4);
    objc_storeStrong((id *)&v19->_modelIdentifier, a5);
    objc_storeStrong((id *)&v19->_transportBundleId, a6);
    if (v17)
    {
      v19->_hasRank = 1;
      v20 = objc_msgSend(v17, "unsignedIntValue");
    }
    else
    {
      v20 = 0;
      v19->_hasRank = 0;
    }
    v19->_rank = v20;
    if (v18)
    {
      v19->_hasScore = 1;
      objc_msgSend(v18, "doubleValue");
    }
    else
    {
      v19->_hasScore = 0;
      v21 = -1.0;
    }
    v19->_score = v21;
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
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion modelIdentifier](self, "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion transportBundleId](self, "transportBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion rank](self, "rank"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion score](self, "score");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion with identifier: %@, model: %@, modelIdentifier: %@, transportBundleId: %@, rank: %@, score: %@"), v4, v5, v6, v7, v8, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *v5;
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
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *v33;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *modelIdentifier;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *v35;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion;
  v5 = -[BMEventBase init](&v37, sel_init);
  if (!v5)
    goto LABEL_48;
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
          v21 = 32;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_25:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          v5->_hasRank = 1;
          break;
        case 5u:
          v5->_hasScore = 1;
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v32 = *(double *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v32 = 0.0;
          }
          v5->_score = v32;
          continue;
        case 6u:
          v38 = 0;
          v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_47;
          v33 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier initByReadFrom:]([BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier alloc], "initByReadFrom:", v4);
          if (!v33)
            goto LABEL_47;
          modelIdentifier = v5->_modelIdentifier;
          v5->_modelIdentifier = v33;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_47;
          continue;
      }
      while (1)
      {
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        v28 = v27 + 1;
        if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
        *(_QWORD *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0)
          goto LABEL_40;
        v23 += 7;
        v17 = v24++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_42;
        }
      }
      v4[*v8] = 1;
LABEL_40:
      if (v4[*v8])
        LODWORD(v25) = 0;
LABEL_42:
      v5->_rank = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_47:
    v35 = 0;
  else
LABEL_48:
    v35 = v5;

  return v35;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_model)
    PBDataWriterWriteStringField();
  if (self->_modelIdentifier)
  {
    PBDataWriterPlaceMark();
    -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier writeTo:](self->_modelIdentifier, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_transportBundleId)
    PBDataWriterWriteStringField();
  if (self->_hasRank)
    PBDataWriterWriteUint32Field();
  if (self->_hasScore)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *v17;
  id v18;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id *v52;
  id v53;
  id v54;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *v55;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v17 = 0;
          goto LABEL_26;
        }
        v26 = v8;
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v66 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("model"));
        v67 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v27;
        v8 = v26;
        v55 = (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)v29;
        v17 = 0;
        v10 = 0;
        *v52 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2);
        goto LABEL_24;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = self;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v52)
        {
          v17 = 0;
          goto LABEL_25;
        }
        v54 = v8;
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v64 = *MEMORY[0x1E0CB2D50];
        v32 = v10;
        v33 = objc_alloc(MEMORY[0x1E0CB3940]);
        v46 = objc_opt_class();
        v34 = v33;
        v10 = v32;
        v55 = (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)objc_msgSend(v34, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v46, CFSTR("modelIdentifier"));
        v65 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v31;
        v8 = v54;
        *v52 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v51, 2, v35);

        v17 = 0;
        goto LABEL_23;
      }
      v20 = v8;
      v18 = v11;
      v57 = 0;
      v55 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier initWithJSONDictionary:error:]([BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier alloc], "initWithJSONDictionary:error:", v18, &v57);
      v21 = v57;
      if (v21)
      {
        v22 = v21;
        if (v52)
          *v52 = objc_retainAutorelease(v21);

        v17 = 0;
        v8 = v20;
        goto LABEL_24;
      }

    }
    else
    {
      v55 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transportBundleId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v8;
    v49 = v10;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v52)
        {
          v17 = 0;
          v50 = 0;
          goto LABEL_22;
        }
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v38 = *MEMORY[0x1E0D025B8];
        v62 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("transportBundleId"));
        v63 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37;
        v8 = v53;
        v40 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v38, 2, v13);
        v17 = 0;
        v50 = 0;
        *v52 = v40;
LABEL_21:

        v10 = v49;
LABEL_22:

LABEL_23:
        v18 = v11;
        self = v56;
LABEL_24:

        v11 = v18;
LABEL_25:

        goto LABEL_26;
      }
      v50 = v12;
    }
    else
    {
      v50 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rank"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v52)
        {
          v14 = 0;
          v17 = 0;
          goto LABEL_21;
        }
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rank"));
        v61 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v15);
        v17 = 0;
        v14 = 0;
        *v52 = v43;
        goto LABEL_20;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("score"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v52)
        {
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = *MEMORY[0x1E0D025B8];
          v58 = *MEMORY[0x1E0CB2D50];
          v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("score"));
          v59 = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *v52 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v47, 2, v45);

        }
        v16 = 0;
        v17 = 0;
        goto LABEL_20;
      }
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }
    v17 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion initWithIdentifier:model:modelIdentifier:transportBundleId:rank:score:](v56, "initWithIdentifier:model:modelIdentifier:transportBundleId:rank:score:", v53, v49, v55, v50, v14, v16);
    v56 = v17;
LABEL_20:

    v8 = v53;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    v8 = 0;
    goto LABEL_27;
  }
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = *MEMORY[0x1E0D025B8];
  v68 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
  v69[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v9);
  v17 = 0;
  v8 = 0;
  *a4 = v25;
LABEL_26:

LABEL_27:
  return v17;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion model](self, "model");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion modelIdentifier](self, "modelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion transportBundleId](self, "transportBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion hasRank](self, "hasRank"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion rank](self, "rank"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!-[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion hasScore](self, "hasScore")
    || (-[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion score](self, "score"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion score](self, "score");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion score](self, "score");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = CFSTR("identifier");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v21 = v12;
  v26[0] = v12;
  v25[1] = CFSTR("model");
  v13 = (void *)v4;
  v24 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[1] = v13;
  v25[2] = CFSTR("modelIdentifier");
  v14 = (void *)v6;
  v23 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v3;
  v26[2] = v14;
  v25[3] = CFSTR("transportBundleId");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[3] = v16;
  v25[4] = CFSTR("rank");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v17;
  v25[5] = CFSTR("score");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v8)
      goto LABEL_22;
LABEL_29:

    if (v7)
      goto LABEL_23;
    goto LABEL_30;
  }

  if (!v8)
    goto LABEL_29;
LABEL_22:
  if (v7)
    goto LABEL_23;
LABEL_30:

LABEL_23:
  if (!v23)

  if (!v24)
  {

    if (v15)
      goto LABEL_27;
LABEL_32:

    goto LABEL_27;
  }
  if (!v15)
    goto LABEL_32;
LABEL_27:

  return v19;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  unsigned int v31;
  double v32;
  double v33;
  double v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_29;
    }
    -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion model](self, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion model](self, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_29;
    }
    -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion modelIdentifier](self, "modelIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion modelIdentifier](self, "modelIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_29;
    }
    -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion transportBundleId](self, "transportBundleId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transportBundleId");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion transportBundleId](self, "transportBundleId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transportBundleId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_29;
    }
    if (!-[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion hasRank](self, "hasRank")
      && !objc_msgSend(v5, "hasRank")
      || -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion hasRank](self, "hasRank")
      && objc_msgSend(v5, "hasRank")
      && (v31 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion rank](self, "rank"),
          v31 == objc_msgSend(v5, "rank")))
    {
      if (!-[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion hasScore](self, "hasScore")
        && !objc_msgSend(v5, "hasScore"))
      {
        v12 = 1;
        goto LABEL_30;
      }
      if (-[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion hasScore](self, "hasScore")
        && objc_msgSend(v5, "hasScore"))
      {
        -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion score](self, "score");
        v33 = v32;
        objc_msgSend(v5, "score");
        v12 = v33 == v34;
LABEL_30:

        goto LABEL_31;
      }
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

- (NSString)identifier
{
  return self->_identifier;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)transportBundleId
{
  return self->_transportBundleId;
}

- (unsigned)rank
{
  return self->_rank;
}

- (BOOL)hasRank
{
  return self->_hasRank;
}

- (void)setHasRank:(BOOL)a3
{
  self->_hasRank = a3;
}

- (double)score
{
  return self->_score;
}

- (BOOL)hasScore
{
  return self->_hasScore;
}

- (void)setHasScore:(BOOL)a3
{
  self->_hasScore = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_transportBundleId, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion initByReadFrom:]([BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("model"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("modelIdentifier_json"), 5, 1, &__block_literal_global_210_75364);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transportBundleId"), 2, 0, 3, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rank"), 0, 0, 4, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("score"), 1, 0, 5, 0, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v5;
  v10[3] = v6;
  v10[4] = v7;
  v10[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FE58;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("model"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelIdentifier"), 6, 14, objc_opt_class());
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transportBundleId"), 3, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rank"), 4, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("score"), 5, 0, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __69__BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
