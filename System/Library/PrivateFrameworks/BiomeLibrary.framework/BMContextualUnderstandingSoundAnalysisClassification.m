@implementation BMContextualUnderstandingSoundAnalysisClassification

- (BMContextualUnderstandingSoundAnalysisClassification)initWithSoundName:(id)a3 confidence:(id)a4 startOffsetInSecs:(id)a5 durationInSecs:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMContextualUnderstandingSoundAnalysisClassification *v15;
  double v16;
  unsigned int v17;
  unsigned int v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMContextualUnderstandingSoundAnalysisClassification;
  v15 = -[BMEventBase init](&v20, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_soundName, a3);
    if (v12)
    {
      v15->_hasConfidence = 1;
      objc_msgSend(v12, "doubleValue");
    }
    else
    {
      v15->_hasConfidence = 0;
      v16 = -1.0;
    }
    v15->_confidence = v16;
    if (v13)
    {
      v15->_hasStartOffsetInSecs = 1;
      v17 = objc_msgSend(v13, "unsignedIntValue");
    }
    else
    {
      v17 = 0;
      v15->_hasStartOffsetInSecs = 0;
    }
    v15->_startOffsetInSecs = v17;
    if (v14)
    {
      v15->_hasDurationInSecs = 1;
      v18 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v18 = 0;
      v15->_hasDurationInSecs = 0;
    }
    v15->_durationInSecs = v18;
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
  -[BMContextualUnderstandingSoundAnalysisClassification soundName](self, "soundName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMContextualUnderstandingSoundAnalysisClassification confidence](self, "confidence");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification startOffsetInSecs](self, "startOffsetInSecs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification durationInSecs](self, "durationInSecs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextualUnderstandingSoundAnalysisClassification with soundName: %@, confidence: %@, startOffsetInSecs: %@, durationInSecs: %@"), v4, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextualUnderstandingSoundAnalysisClassification *v5;
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
  NSString *soundName;
  uint64_t v22;
  unint64_t v23;
  double v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  BMContextualUnderstandingSoundAnalysisClassification *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMContextualUnderstandingSoundAnalysisClassification;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_54;
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
          soundName = v5->_soundName;
          v5->_soundName = (NSString *)v20;

          continue;
        case 2u:
          v5->_hasConfidence = 1;
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
          v5->_confidence = v24;
          continue;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasStartOffsetInSecs = 1;
          while (1)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
              break;
            v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
            *(_QWORD *)&v4[v28] = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if ((v31 & 0x80) == 0)
              goto LABEL_41;
            v25 += 7;
            v17 = v26++ >= 9;
            if (v17)
            {
              LODWORD(v27) = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_43:
          v38 = 24;
          goto LABEL_48;
        case 4u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          v5->_hasDurationInSecs = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_53;
          continue;
      }
      while (1)
      {
        v34 = *v6;
        v35 = *(_QWORD *)&v4[v34];
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
          break;
        v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
        *(_QWORD *)&v4[v34] = v36;
        v27 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_45;
        v32 += 7;
        v17 = v33++ >= 9;
        if (v17)
        {
          LODWORD(v27) = 0;
          goto LABEL_47;
        }
      }
      v4[*v8] = 1;
LABEL_45:
      if (v4[*v8])
        LODWORD(v27) = 0;
LABEL_47:
      v38 = 28;
LABEL_48:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v27;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_53:
    v39 = 0;
  else
LABEL_54:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_soundName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasConfidence)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasStartOffsetInSecs)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasDurationInSecs)
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
  -[BMContextualUnderstandingSoundAnalysisClassification writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextualUnderstandingSoundAnalysisClassification)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMContextualUnderstandingSoundAnalysisClassification *v11;
  id v12;
  void *v13;
  id v14;
  BMContextualUnderstandingSoundAnalysisClassification *v15;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("soundName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
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
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidence"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startOffsetInSecs"));
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
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("startOffsetInSecs"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("durationInSecs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMContextualUnderstandingSoundAnalysisClassification initWithSoundName:confidence:startOffsetInSecs:durationInSecs:](v11, "initWithSoundName:confidence:startOffsetInSecs:durationInSecs:", v8, v31, v12, v14);
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
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("durationInSecs"));
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
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("soundName"));
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
  -[BMContextualUnderstandingSoundAnalysisClassification soundName](self, "soundName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMContextualUnderstandingSoundAnalysisClassification hasConfidence](self, "hasConfidence")
    || (-[BMContextualUnderstandingSoundAnalysisClassification confidence](self, "confidence"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMContextualUnderstandingSoundAnalysisClassification confidence](self, "confidence");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextualUnderstandingSoundAnalysisClassification confidence](self, "confidence");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[BMContextualUnderstandingSoundAnalysisClassification hasStartOffsetInSecs](self, "hasStartOffsetInSecs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification startOffsetInSecs](self, "startOffsetInSecs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMContextualUnderstandingSoundAnalysisClassification hasDurationInSecs](self, "hasDurationInSecs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingSoundAnalysisClassification durationInSecs](self, "durationInSecs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v15[0] = CFSTR("soundName");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("confidence");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("startOffsetInSecs");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("durationInSecs");
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
      goto LABEL_21;
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6)
        goto LABEL_22;
LABEL_26:

      if (v3)
        goto LABEL_23;
LABEL_27:

      goto LABEL_23;
    }
  }

  if (!v6)
    goto LABEL_26;
LABEL_22:
  if (!v3)
    goto LABEL_27;
LABEL_23:

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
  unsigned int v16;
  unsigned int v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMContextualUnderstandingSoundAnalysisClassification soundName](self, "soundName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "soundName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMContextualUnderstandingSoundAnalysisClassification soundName](self, "soundName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "soundName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_22;
    }
    if (!-[BMContextualUnderstandingSoundAnalysisClassification hasConfidence](self, "hasConfidence")
      && !objc_msgSend(v5, "hasConfidence")
      || -[BMContextualUnderstandingSoundAnalysisClassification hasConfidence](self, "hasConfidence")
      && objc_msgSend(v5, "hasConfidence")
      && (-[BMContextualUnderstandingSoundAnalysisClassification confidence](self, "confidence"),
          v14 = v13,
          objc_msgSend(v5, "confidence"),
          v14 == v15))
    {
      if (!-[BMContextualUnderstandingSoundAnalysisClassification hasStartOffsetInSecs](self, "hasStartOffsetInSecs")
        && !objc_msgSend(v5, "hasStartOffsetInSecs")
        || -[BMContextualUnderstandingSoundAnalysisClassification hasStartOffsetInSecs](self, "hasStartOffsetInSecs")
        && objc_msgSend(v5, "hasStartOffsetInSecs")
        && (v16 = -[BMContextualUnderstandingSoundAnalysisClassification startOffsetInSecs](self, "startOffsetInSecs"),
            v16 == objc_msgSend(v5, "startOffsetInSecs")))
      {
        if (!-[BMContextualUnderstandingSoundAnalysisClassification hasDurationInSecs](self, "hasDurationInSecs")
          && !objc_msgSend(v5, "hasDurationInSecs"))
        {
          v12 = 1;
          goto LABEL_23;
        }
        if (-[BMContextualUnderstandingSoundAnalysisClassification hasDurationInSecs](self, "hasDurationInSecs")
          && objc_msgSend(v5, "hasDurationInSecs"))
        {
          v17 = -[BMContextualUnderstandingSoundAnalysisClassification durationInSecs](self, "durationInSecs");
          v12 = v17 == objc_msgSend(v5, "durationInSecs");
LABEL_23:

          goto LABEL_24;
        }
      }
    }
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)soundName
{
  return self->_soundName;
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

- (unsigned)startOffsetInSecs
{
  return self->_startOffsetInSecs;
}

- (BOOL)hasStartOffsetInSecs
{
  return self->_hasStartOffsetInSecs;
}

- (void)setHasStartOffsetInSecs:(BOOL)a3
{
  self->_hasStartOffsetInSecs = a3;
}

- (unsigned)durationInSecs
{
  return self->_durationInSecs;
}

- (BOOL)hasDurationInSecs
{
  return self->_hasDurationInSecs;
}

- (void)setHasDurationInSecs:(BOOL)a3
{
  self->_hasDurationInSecs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundName, 0);
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

    v4 = -[BMContextualUnderstandingSoundAnalysisClassification initByReadFrom:]([BMContextualUnderstandingSoundAnalysisClassification alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("soundName"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startOffsetInSecs"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("durationInSecs"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1A650;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("soundName"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 2, 0, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startOffsetInSecs"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("durationInSecs"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
