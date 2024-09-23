@implementation BMSiriInferredHelpfulness

- (BMSiriInferredHelpfulness)initWithAbsoluteTimestamp:(id)a3 inferredHelpfulnessScore:(id)a4 restatementScore:(id)a5 turnID:(id)a6 modelID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BMSiriInferredHelpfulness *v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BMSiriInferredHelpfulness;
  v17 = -[BMEventBase init](&v22, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v17->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v17->_hasRaw_absoluteTimestamp = 0;
      v18 = -1.0;
    }
    v17->_raw_absoluteTimestamp = v18;
    if (v13)
    {
      v17->_hasInferredHelpfulnessScore = 1;
      objc_msgSend(v13, "doubleValue");
    }
    else
    {
      v17->_hasInferredHelpfulnessScore = 0;
      v19 = -1.0;
    }
    v17->_inferredHelpfulnessScore = v19;
    if (v14)
    {
      v17->_hasRestatementScore = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v17->_hasRestatementScore = 0;
      v20 = -1.0;
    }
    v17->_restatementScore = v20;
    objc_storeStrong((id *)&v17->_turnID, a6);
    objc_storeStrong((id *)&v17->_modelID, a7);
  }

  return v17;
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
  -[BMSiriInferredHelpfulness absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriInferredHelpfulness inferredHelpfulnessScore](self, "inferredHelpfulnessScore");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriInferredHelpfulness restatementScore](self, "restatementScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriInferredHelpfulness turnID](self, "turnID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriInferredHelpfulness modelID](self, "modelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriInferredHelpfulness with absoluteTimestamp: %@, inferredHelpfulnessScore: %@, restatementScore: %@, turnID: %@, modelID: %@"), v4, v6, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriInferredHelpfulness *v5;
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
  int v18;
  uint64_t v20;
  unint64_t v21;
  objc_class *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  BMSiriInferredHelpfulness *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMSiriInferredHelpfulness;
  v5 = -[BMEventBase init](&v33, sel_init);
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
        if (v11++ >= 9)
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
          v5->_hasRaw_absoluteTimestamp = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v30 = 24;
          goto LABEL_40;
        case 2u:
          v5->_hasInferredHelpfulnessScore = 1;
          v28 = *v6;
          v29 = *(_QWORD *)&v4[v28];
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v29);
            *(_QWORD *)&v4[v28] = v29 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v30 = 40;
          goto LABEL_40;
        case 3u:
          v5->_hasRestatementScore = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v30 = 48;
LABEL_40:
          *(Class *)((char *)&v5->super.super.isa + v30) = v22;
          break;
        case 4u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 56;
          goto LABEL_28;
        case 5u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 64;
LABEL_28:
          v27 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_43;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_43:
    v31 = 0;
  else
LABEL_44:
    v31 = v5;

  return v31;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasInferredHelpfulnessScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRestatementScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_turnID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_modelID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriInferredHelpfulness writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriInferredHelpfulness)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  BMSiriInferredHelpfulness *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  BMSiriInferredHelpfulness *v22;
  id v23;
  id *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  id *v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  uint64_t v40;
  id *v41;
  id v42;
  void *v43;
  id *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v46 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inferredHelpfulnessScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          goto LABEL_43;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = a4;
        v25 = *MEMORY[0x1E0D025B8];
        v53 = *MEMORY[0x1E0CB2D50];
        v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("inferredHelpfulnessScore"));
        v54 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v25, 2, v16);
        v22 = 0;
        a4 = 0;
        *v24 = v26;
        goto LABEL_42;
      }
      v44 = v15;
    }
    else
    {
      v44 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("restatementScore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v7;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v45 = 0;
          v22 = 0;
          a4 = v44;
          goto LABEL_42;
        }
        v17 = self;
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v51 = *MEMORY[0x1E0CB2D50];
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("restatementScore"));
        v52 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v45 = 0;
        *a4 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v18);
        goto LABEL_50;
      }
      v17 = self;
      v45 = v16;
    }
    else
    {
      v17 = self;
      v45 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("turnID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v18;
LABEL_18:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v21 = 0;
LABEL_21:
        a4 = v44;
        v22 = -[BMSiriInferredHelpfulness initWithAbsoluteTimestamp:inferredHelpfulnessScore:restatementScore:turnID:modelID:](v17, "initWithAbsoluteTimestamp:inferredHelpfulnessScore:restatementScore:turnID:modelID:", v46, v44, v45, v19, v21);
        v17 = v22;
LABEL_40:

LABEL_41:
        self = v17;
        v7 = v43;
LABEL_42:

        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
        goto LABEL_21;
      }
      if (a4)
      {
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v47 = *MEMORY[0x1E0CB2D50];
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("modelID"));
        v48 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v40, 2, v33);

      }
      v21 = 0;
      v22 = 0;
LABEL_39:
      a4 = v44;
      goto LABEL_40;
    }
    if (a4)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = a4;
      v30 = *MEMORY[0x1E0D025B8];
      v49 = *MEMORY[0x1E0CB2D50];
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("turnID"));
      v50 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v20);
      v22 = 0;
      v19 = 0;
      *v41 = v31;
      goto LABEL_39;
    }
    v19 = 0;
    v22 = 0;
LABEL_50:
    a4 = v44;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v7;
    v10 = [v8 alloc];
    objc_msgSend(v9, "doubleValue");
    v12 = v11;

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v12);
LABEL_6:
    v46 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v14, "dateFromString:", v7);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v7;
    goto LABEL_6;
  }
  if (!a4)
  {
    v46 = 0;
    v22 = 0;
    goto LABEL_44;
  }
  v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v36 = a4;
  v37 = *MEMORY[0x1E0D025B8];
  v55 = *MEMORY[0x1E0CB2D50];
  v38 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
  v56[0] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v37;
  a4 = v38;
  v46 = 0;
  v22 = 0;
  *v36 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v39, 2, v15);
LABEL_43:

LABEL_44:
  return v22;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[BMSiriInferredHelpfulness absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriInferredHelpfulness absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  if (!-[BMSiriInferredHelpfulness hasInferredHelpfulnessScore](self, "hasInferredHelpfulnessScore")
    || (-[BMSiriInferredHelpfulness inferredHelpfulnessScore](self, "inferredHelpfulnessScore"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMSiriInferredHelpfulness inferredHelpfulnessScore](self, "inferredHelpfulnessScore");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriInferredHelpfulness inferredHelpfulnessScore](self, "inferredHelpfulnessScore");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMSiriInferredHelpfulness hasRestatementScore](self, "hasRestatementScore")
    || (-[BMSiriInferredHelpfulness restatementScore](self, "restatementScore"), fabs(v10) == INFINITY))
  {
    v12 = 0;
  }
  else
  {
    -[BMSiriInferredHelpfulness restatementScore](self, "restatementScore");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriInferredHelpfulness restatementScore](self, "restatementScore");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriInferredHelpfulness turnID](self, "turnID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriInferredHelpfulness modelID](self, "modelID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  v24[0] = CFSTR("absoluteTimestamp");
  v15 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[0] = v15;
  v24[1] = CFSTR("inferredHelpfulnessScore");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v16;
  v24[2] = CFSTR("restatementScore");
  v17 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v17;
  v24[3] = CFSTR("turnID");
  v18 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v18;
  v24[4] = CFSTR("modelID");
  v19 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_24;
  }
  else
  {

    if (v13)
    {
LABEL_24:
      if (v12)
        goto LABEL_25;
LABEL_31:

      if (v9)
        goto LABEL_26;
      goto LABEL_32;
    }
  }

  if (!v12)
    goto LABEL_31;
LABEL_25:
  if (v9)
    goto LABEL_26;
LABEL_32:

LABEL_26:
  if (!v23)

  return v20;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
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
  char v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriInferredHelpfulness absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriInferredHelpfulness absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_19;
    }
    if (-[BMSiriInferredHelpfulness hasInferredHelpfulnessScore](self, "hasInferredHelpfulnessScore")
      || objc_msgSend(v5, "hasInferredHelpfulnessScore"))
    {
      if (!-[BMSiriInferredHelpfulness hasInferredHelpfulnessScore](self, "hasInferredHelpfulnessScore"))
        goto LABEL_19;
      if (!objc_msgSend(v5, "hasInferredHelpfulnessScore"))
        goto LABEL_19;
      -[BMSiriInferredHelpfulness inferredHelpfulnessScore](self, "inferredHelpfulnessScore");
      v14 = v13;
      objc_msgSend(v5, "inferredHelpfulnessScore");
      if (v14 != v15)
        goto LABEL_19;
    }
    if (-[BMSiriInferredHelpfulness hasRestatementScore](self, "hasRestatementScore")
      || objc_msgSend(v5, "hasRestatementScore"))
    {
      if (!-[BMSiriInferredHelpfulness hasRestatementScore](self, "hasRestatementScore"))
        goto LABEL_19;
      if (!objc_msgSend(v5, "hasRestatementScore"))
        goto LABEL_19;
      -[BMSiriInferredHelpfulness restatementScore](self, "restatementScore");
      v17 = v16;
      objc_msgSend(v5, "restatementScore");
      if (v17 != v18)
        goto LABEL_19;
    }
    -[BMSiriInferredHelpfulness turnID](self, "turnID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "turnID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriInferredHelpfulness turnID](self, "turnID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "turnID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_19:
        v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    -[BMSiriInferredHelpfulness modelID](self, "modelID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 == v27)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriInferredHelpfulness modelID](self, "modelID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v28, "isEqual:", v29);

    }
    goto LABEL_20;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)inferredHelpfulnessScore
{
  return self->_inferredHelpfulnessScore;
}

- (BOOL)hasInferredHelpfulnessScore
{
  return self->_hasInferredHelpfulnessScore;
}

- (void)setHasInferredHelpfulnessScore:(BOOL)a3
{
  self->_hasInferredHelpfulnessScore = a3;
}

- (double)restatementScore
{
  return self->_restatementScore;
}

- (BOOL)hasRestatementScore
{
  return self->_hasRestatementScore;
}

- (void)setHasRestatementScore:(BOOL)a3
{
  self->_hasRestatementScore = a3;
}

- (NSString)turnID
{
  return self->_turnID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_turnID, 0);
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

    v7 = -[BMSiriInferredHelpfulness initByReadFrom:]([BMSiriInferredHelpfulness alloc], "initByReadFrom:", v6);
    v7[9] = 1;

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
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("inferredHelpfulnessScore"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("restatementScore"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("turnID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("modelID"), 2, 0, 5, 13, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B1F0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("inferredHelpfulnessScore"), 2, 0, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("restatementScore"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("turnID"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("modelID"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
