@implementation BMIntelligencePlatformEntityTaggingPersonInference

- (BMIntelligencePlatformEntityTaggingPersonInference)initWithEntityIdentifier:(id)a3 entityTagID:(int)a4 score:(id)a5 feedbackEventID:(id)a6
{
  id v10;
  id v11;
  id v12;
  BMIntelligencePlatformEntityTaggingPersonInference *v13;
  uint64_t v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMIntelligencePlatformEntityTaggingPersonInference;
  v13 = -[BMEventBase init](&v17, sel_init);
  if (v13)
  {
    v13->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v13->_hasEntityIdentifier = 1;
      v14 = objc_msgSend(v10, "unsignedLongLongValue");
    }
    else
    {
      v14 = 0;
      v13->_hasEntityIdentifier = 0;
    }
    v13->_entityIdentifier = v14;
    v13->_entityTagID = a4;
    if (v11)
    {
      v13->_hasScore = 1;
      objc_msgSend(v11, "doubleValue");
    }
    else
    {
      v13->_hasScore = 0;
      v15 = -1.0;
    }
    v13->_score = v15;
    objc_storeStrong((id *)&v13->_feedbackEventID, a6);
  }

  return v13;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMIntelligencePlatformEntityTaggingPersonInference entityIdentifier](self, "entityIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDAsString(-[BMIntelligencePlatformEntityTaggingPersonInference entityTagID](self, "entityTagID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMIntelligencePlatformEntityTaggingPersonInference score](self, "score");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformEntityTaggingPersonInference feedbackEventID](self, "feedbackEventID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformEntityTaggingPersonInference with entityIdentifier: %@, entityTagID: %@, score: %@, feedbackEventID: %@"), v4, v5, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformEntityTaggingPersonInference *v5;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  uint64_t v37;
  NSString *feedbackEventID;
  BMIntelligencePlatformEntityTaggingPersonInference *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMIntelligencePlatformEntityTaggingPersonInference;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_55;
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
          v5->_hasEntityIdentifier = 1;
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
              goto LABEL_41;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8])
            v22 = 0;
LABEL_43:
          v5->_entityIdentifier = v22;
          break;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
              break;
            v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0)
              goto LABEL_45;
            v27 += 7;
            v17 = v28++ >= 9;
            if (v17)
            {
              LODWORD(v29) = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8])
            LODWORD(v29) = 0;
LABEL_47:
          if (v29 >= 0x19)
            LODWORD(v29) = 0;
          v5->_entityTagID = v29;
          break;
        case 3u:
          v5->_hasScore = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v36 = *(double *)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v36 = 0.0;
          }
          v5->_score = v36;
          break;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          feedbackEventID = v5->_feedbackEventID;
          v5->_feedbackEventID = (NSString *)v37;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_54;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_54:
    v39 = 0;
  else
LABEL_55:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasEntityIdentifier)
    PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasScore)
    PBDataWriterWriteDoubleField();
  if (self->_feedbackEventID)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformEntityTaggingPersonInference writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformEntityTaggingPersonInference)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  BMIntelligencePlatformEntityTaggingPersonInference *v12;
  void *v13;
  BMIntelligencePlatformEntityTaggingPersonInference *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entityIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v31 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entityTagID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v30 = 0;
            v12 = 0;
            goto LABEL_35;
          }
          v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v26 = *MEMORY[0x1E0D025B8];
          v36 = *MEMORY[0x1E0CB2D50];
          v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("entityTagID"));
          v37 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v12 = 0;
          *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v13);
          goto LABEL_34;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDFromString(v8));
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          v12 = 0;
          goto LABEL_34;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v34 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("score"));
        v35 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v14 = self;
        v20 = a4;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v19, 2, v17);
        v12 = 0;
        v16 = 0;
        *v20 = v21;
        goto LABEL_32;
      }
      v14 = self;
      v15 = a4;
      v16 = v13;
    }
    else
    {
      v14 = self;
      v15 = a4;
      v16 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("feedbackEventID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v18 = 0;
LABEL_22:
      self = -[BMIntelligencePlatformEntityTaggingPersonInference initWithEntityIdentifier:entityTagID:score:feedbackEventID:](v14, "initWithEntityIdentifier:entityTagID:score:feedbackEventID:", v31, objc_msgSend(v30, "intValue"), v16, v18);
      v12 = self;
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      goto LABEL_22;
    }
    if (v15)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0D025B8];
      v32 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("feedbackEventID"));
      v33 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *v15 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v27, 2, v23);

    }
    v18 = 0;
    v12 = 0;
LABEL_32:
    self = v14;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v31 = 0;
    v12 = 0;
    goto LABEL_36;
  }
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0D025B8];
  v38 = *MEMORY[0x1E0CB2D50];
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("entityIdentifier"));
  v39[0] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v12 = 0;
  *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v8);
LABEL_35:

LABEL_36:
  return v12;
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
  if (-[BMIntelligencePlatformEntityTaggingPersonInference hasEntityIdentifier](self, "hasEntityIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMIntelligencePlatformEntityTaggingPersonInference entityIdentifier](self, "entityIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformEntityTaggingPersonInference entityTagID](self, "entityTagID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMIntelligencePlatformEntityTaggingPersonInference hasScore](self, "hasScore")
    || (-[BMIntelligencePlatformEntityTaggingPersonInference score](self, "score"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMIntelligencePlatformEntityTaggingPersonInference score](self, "score");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMIntelligencePlatformEntityTaggingPersonInference score](self, "score");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMIntelligencePlatformEntityTaggingPersonInference feedbackEventID](self, "feedbackEventID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("entityIdentifier");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("entityTagID");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("score");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("feedbackEventID");
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
  unint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMIntelligencePlatformEntityTaggingPersonInference hasEntityIdentifier](self, "hasEntityIdentifier")
       && !objc_msgSend(v5, "hasEntityIdentifier")
       || -[BMIntelligencePlatformEntityTaggingPersonInference hasEntityIdentifier](self, "hasEntityIdentifier")
       && objc_msgSend(v5, "hasEntityIdentifier")
       && (v6 = -[BMIntelligencePlatformEntityTaggingPersonInference entityIdentifier](self, "entityIdentifier"),
           v6 == objc_msgSend(v5, "entityIdentifier")))
      && (v7 = -[BMIntelligencePlatformEntityTaggingPersonInference entityTagID](self, "entityTagID"),
          v7 == objc_msgSend(v5, "entityTagID"))
      && (!-[BMIntelligencePlatformEntityTaggingPersonInference hasScore](self, "hasScore")
       && !objc_msgSend(v5, "hasScore")
       || -[BMIntelligencePlatformEntityTaggingPersonInference hasScore](self, "hasScore")
       && objc_msgSend(v5, "hasScore")
       && (-[BMIntelligencePlatformEntityTaggingPersonInference score](self, "score"),
           v9 = v8,
           objc_msgSend(v5, "score"),
           v9 == v10)))
    {
      -[BMIntelligencePlatformEntityTaggingPersonInference feedbackEventID](self, "feedbackEventID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "feedbackEventID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v15 = 1;
      }
      else
      {
        -[BMIntelligencePlatformEntityTaggingPersonInference feedbackEventID](self, "feedbackEventID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "feedbackEventID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unint64_t)entityIdentifier
{
  return self->_entityIdentifier;
}

- (BOOL)hasEntityIdentifier
{
  return self->_hasEntityIdentifier;
}

- (void)setHasEntityIdentifier:(BOOL)a3
{
  self->_hasEntityIdentifier = a3;
}

- (int)entityTagID
{
  return self->_entityTagID;
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

- (NSString)feedbackEventID
{
  return self->_feedbackEventID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackEventID, 0);
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

    v4 = -[BMIntelligencePlatformEntityTaggingPersonInference initByReadFrom:]([BMIntelligencePlatformEntityTaggingPersonInference alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("entityIdentifier"), 0, 0, 1, 5, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("entityTagID"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("score"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("feedbackEventID"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1CCD8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entityIdentifier"), 1, 5, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entityTagID"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("score"), 3, 0, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("feedbackEventID"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
