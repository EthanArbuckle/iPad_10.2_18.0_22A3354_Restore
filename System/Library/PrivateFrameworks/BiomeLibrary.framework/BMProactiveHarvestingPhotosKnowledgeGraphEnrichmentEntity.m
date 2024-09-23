@implementation BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity)initWithName:(id)a3 score:(id)a4 language:(id)a5 category:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *v15;
  double v16;
  unsigned int v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity;
  v15 = -[BMEventBase init](&v19, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_name, a3);
    if (v12)
    {
      v15->_hasScore = 1;
      objc_msgSend(v12, "doubleValue");
    }
    else
    {
      v15->_hasScore = 0;
      v16 = -1.0;
    }
    v15->_score = v16;
    objc_storeStrong((id *)&v15->_language, a5);
    if (v14)
    {
      v15->_hasCategory = 1;
      v17 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v17 = 0;
      v15->_hasCategory = 0;
    }
    v15->_category = v17;
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
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity score](self, "score");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity language](self, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity category](self, "category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity with name: %@, score: %@, language: %@, category: %@"), v4, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *v5;
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
  uint64_t v22;
  unint64_t v23;
  double v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity;
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
          goto LABEL_27;
        case 2u:
          v5->_hasScore = 1;
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(double *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0.0;
          }
          v5->_score = v24;
          continue;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_27:
          v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasCategory = 1;
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
      v5->_category = v28;
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
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasCategory)
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
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *v11;
  id v12;
  void *v13;
  id v14;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *v15;
  id v17;
  uint64_t v18;
  id *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  id v29;
  id *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("score"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_16;
        }
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v36 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("score"));
        v37 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v10);
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("language"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v34 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("language"));
        v35 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        a4 = v30;
        *v28 = v24;
        goto LABEL_14;
      }
      v12 = v10;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("category"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v32 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("category"));
          v33 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v27, 2, v26);

        }
        v14 = 0;
        v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    a4 = v30;
    v15 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity initWithName:score:language:category:](v11, "initWithName:score:language:category:", v8, v30, v12, v14);
    v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    v7 = v31;
    goto LABEL_16;
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
    goto LABEL_17;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = *MEMORY[0x1E0D025B8];
  v38 = *MEMORY[0x1E0CB2D50];
  v19 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
  v39[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2, v9);
  a4 = v19;
LABEL_16:

LABEL_17:
  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  double v4;
  void *v5;
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
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity hasScore](self, "hasScore")
    || (-[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity score](self, "score"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity score](self, "score");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity score](self, "score");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity language](self, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity hasCategory](self, "hasCategory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity category](self, "category"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v15[0] = CFSTR("name");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("score");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("language");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("category");
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
      if (v6)
        goto LABEL_19;
LABEL_23:

      if (v3)
        goto LABEL_20;
LABEL_24:

      goto LABEL_20;
    }
  }

  if (!v6)
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
  double v13;
  double v14;
  double v15;
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
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    if (-[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity hasScore](self, "hasScore")
      || objc_msgSend(v5, "hasScore"))
    {
      if (!-[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity hasScore](self, "hasScore"))
        goto LABEL_21;
      if (!objc_msgSend(v5, "hasScore"))
        goto LABEL_21;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity score](self, "score");
      v14 = v13;
      objc_msgSend(v5, "score");
      if (v14 != v15)
        goto LABEL_21;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity language](self, "language");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "language");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity language](self, "language");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "language");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_21;
    }
    if (!-[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity hasCategory](self, "hasCategory")
      && !objc_msgSend(v5, "hasCategory"))
    {
      v12 = 1;
      goto LABEL_22;
    }
    if (-[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity hasCategory](self, "hasCategory")
      && objc_msgSend(v5, "hasCategory"))
    {
      v22 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity category](self, "category");
      v12 = v22 == objc_msgSend(v5, "category");
LABEL_22:

      goto LABEL_23;
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

- (NSString)name
{
  return self->_name;
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

- (NSString)language
{
  return self->_language;
}

- (unsigned)category
{
  return self->_category;
}

- (BOOL)hasCategory
{
  return self->_hasCategory;
}

- (void)setHasCategory:(BOOL)a3
{
  self->_hasCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 2)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity initByReadFrom:]([BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity alloc], "initByReadFrom:", v6);
    v7[5] = 2;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("score"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("language"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1E5E0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("score"), 2, 0, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("language"), 3, 13, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
