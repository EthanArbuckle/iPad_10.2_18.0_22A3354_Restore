@implementation BMMLSEPeopleSuggestionsMetricsStore

- (BMMLSEPeopleSuggestionsMetricsStore)initWithEventIdentifier:(id)a3 model:(id)a4 reciprocalRank:(id)a5 reciprocalRankDefinitionVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMMLSEPeopleSuggestionsMetricsStore *v15;
  double v16;
  unsigned int v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMMLSEPeopleSuggestionsMetricsStore;
  v15 = -[BMEventBase init](&v19, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_eventIdentifier, a3);
    objc_storeStrong((id *)&v15->_model, a4);
    if (v13)
    {
      v15->_hasReciprocalRank = 1;
      objc_msgSend(v13, "doubleValue");
    }
    else
    {
      v15->_hasReciprocalRank = 0;
      v16 = -1.0;
    }
    v15->_reciprocalRank = v16;
    if (v14)
    {
      v15->_hasReciprocalRankDefinitionVersion = 1;
      v17 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v17 = 0;
      v15->_hasReciprocalRankDefinitionVersion = 0;
    }
    v15->_reciprocalRankDefinitionVersion = v17;
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
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMLSEPeopleSuggestionsMetricsStore eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEPeopleSuggestionsMetricsStore model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRank](self, "reciprocalRank");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRankDefinitionVersion](self, "reciprocalRankDefinitionVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEPeopleSuggestionsMetricsStore with eventIdentifier: %@, model: %@, reciprocalRank: %@, reciprocalRankDefinitionVersion: %@"), v4, v5, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEPeopleSuggestionsMetricsStore *v5;
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
  uint64_t v23;
  unint64_t v24;
  double v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  BMMLSEPeopleSuggestionsMetricsStore *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMMLSEPeopleSuggestionsMetricsStore;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_44;
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
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
LABEL_24:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v5->_hasReciprocalRank = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v25 = *(double *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v25 = 0.0;
          }
          v5->_reciprocalRank = v25;
          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasReciprocalRankDefinitionVersion = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_43;
          continue;
      }
      while (1)
      {
        v29 = *v6;
        v30 = *(_QWORD *)&v4[v29];
        v31 = v30 + 1;
        if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
          break;
        v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
        *(_QWORD *)&v4[v29] = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0)
          goto LABEL_36;
        v26 += 7;
        v17 = v27++ >= 9;
        if (v17)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      v4[*v8] = 1;
LABEL_36:
      if (v4[*v8])
        LODWORD(v28) = 0;
LABEL_38:
      v5->_reciprocalRankDefinitionVersion = v28;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_43:
    v33 = 0;
  else
LABEL_44:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_eventIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasReciprocalRank)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasReciprocalRankDefinitionVersion)
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
  -[BMMLSEPeopleSuggestionsMetricsStore writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEPeopleSuggestionsMetricsStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMMLSEPeopleSuggestionsMetricsStore *v11;
  id v12;
  void *v13;
  id v14;
  BMMLSEPeopleSuggestionsMetricsStore *v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("model"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = a4;
        v21 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("model"));
        v38 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v10);
        v15 = 0;
        a4 = 0;
        *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reciprocalRank"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("reciprocalRank"));
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      v12 = v10;
    }
    else
    {
      v11 = self;
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reciprocalRankDefinitionVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMMLSEPeopleSuggestionsMetricsStore initWithEventIdentifier:model:reciprocalRank:reciprocalRankDefinitionVersion:](v11, "initWithEventIdentifier:model:reciprocalRank:reciprocalRankDefinitionVersion:", v8, v31, v12, v14);
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v33 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("reciprocalRankDefinitionVersion"));
      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v26);

    }
    v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    v8 = 0;
    goto LABEL_36;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v39 = *MEMORY[0x1E0CB2D50];
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventIdentifier"));
  v40[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[BMMLSEPeopleSuggestionsMetricsStore eventIdentifier](self, "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEPeopleSuggestionsMetricsStore model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRank](self, "hasReciprocalRank")
    || (-[BMMLSEPeopleSuggestionsMetricsStore reciprocalRank](self, "reciprocalRank"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRank](self, "reciprocalRank");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRank](self, "reciprocalRank");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRankDefinitionVersion](self, "hasReciprocalRankDefinitionVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRankDefinitionVersion](self, "reciprocalRankDefinitionVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v15[0] = CFSTR("eventIdentifier");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("model");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("reciprocalRank");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("reciprocalRankDefinitionVersion");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_18;
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v4)
        goto LABEL_19;
LABEL_23:

      if (v3)
        goto LABEL_20;
LABEL_24:

      goto LABEL_20;
    }
  }

  if (!v4)
    goto LABEL_23;
LABEL_19:
  if (!v3)
    goto LABEL_24;
LABEL_20:

  return v13;
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
  double v19;
  double v20;
  double v21;
  unsigned int v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSEPeopleSuggestionsMetricsStore eventIdentifier](self, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSEPeopleSuggestionsMetricsStore eventIdentifier](self, "eventIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMMLSEPeopleSuggestionsMetricsStore model](self, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMLSEPeopleSuggestionsMetricsStore model](self, "model");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    if (!-[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRank](self, "hasReciprocalRank")
      && !objc_msgSend(v5, "hasReciprocalRank")
      || -[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRank](self, "hasReciprocalRank")
      && objc_msgSend(v5, "hasReciprocalRank")
      && (-[BMMLSEPeopleSuggestionsMetricsStore reciprocalRank](self, "reciprocalRank"),
          v20 = v19,
          objc_msgSend(v5, "reciprocalRank"),
          v20 == v21))
    {
      if (!-[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRankDefinitionVersion](self, "hasReciprocalRankDefinitionVersion")&& !objc_msgSend(v5, "hasReciprocalRankDefinitionVersion"))
      {
        v12 = 1;
        goto LABEL_22;
      }
      if (-[BMMLSEPeopleSuggestionsMetricsStore hasReciprocalRankDefinitionVersion](self, "hasReciprocalRankDefinitionVersion")&& objc_msgSend(v5, "hasReciprocalRankDefinitionVersion"))
      {
        v22 = -[BMMLSEPeopleSuggestionsMetricsStore reciprocalRankDefinitionVersion](self, "reciprocalRankDefinitionVersion");
        v12 = v22 == objc_msgSend(v5, "reciprocalRankDefinitionVersion");
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSString)model
{
  return self->_model;
}

- (double)reciprocalRank
{
  return self->_reciprocalRank;
}

- (BOOL)hasReciprocalRank
{
  return self->_hasReciprocalRank;
}

- (void)setHasReciprocalRank:(BOOL)a3
{
  self->_hasReciprocalRank = a3;
}

- (unsigned)reciprocalRankDefinitionVersion
{
  return self->_reciprocalRankDefinitionVersion;
}

- (BOOL)hasReciprocalRankDefinitionVersion
{
  return self->_hasReciprocalRankDefinitionVersion;
}

- (void)setHasReciprocalRankDefinitionVersion:(BOOL)a3
{
  self->_hasReciprocalRankDefinitionVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
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

    v4 = -[BMMLSEPeopleSuggestionsMetricsStore initByReadFrom:]([BMMLSEPeopleSuggestionsMetricsStore alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("model"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reciprocalRank"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reciprocalRankDefinitionVersion"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1CD80;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventIdentifier"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("model"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reciprocalRank"), 3, 0, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reciprocalRankDefinitionVersion"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
