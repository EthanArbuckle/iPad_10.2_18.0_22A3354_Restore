@implementation BMContextualUnderstandingActivityInferenceInferredActivity

- (BMContextualUnderstandingActivityInferenceInferredActivity)initWithActivityType:(int)a3 confidence:(id)a4
{
  id v6;
  BMContextualUnderstandingActivityInferenceInferredActivity *v7;
  float v8;
  double v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMContextualUnderstandingActivityInferenceInferredActivity;
  v7 = -[BMEventBase init](&v11, sel_init);
  if (v7)
  {
    v7->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v7->_activityType = a3;
    if (v6)
    {
      v7->_hasConfidence = 1;
      objc_msgSend(v6, "floatValue");
      v9 = v8;
    }
    else
    {
      v7->_hasConfidence = 0;
      v9 = -1.0;
    }
    v7->_confidence = v9;
  }

  return v7;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMContextualUnderstandingActivityInferenceActivityTypeAsString(-[BMContextualUnderstandingActivityInferenceInferredActivity activityType](self, "activityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMContextualUnderstandingActivityInferenceInferredActivity confidence](self, "confidence");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextualUnderstandingActivityInferenceInferredActivity with activityType: %@, confidence: %@"), v4, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextualUnderstandingActivityInferenceInferredActivity *v5;
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
  float v29;
  BMContextualUnderstandingActivityInferenceInferredActivity *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMContextualUnderstandingActivityInferenceInferredActivity;
  v5 = -[BMEventBase init](&v32, sel_init);
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
      if ((v12 >> 3) == 2)
      {
        v5->_hasConfidence = 1;
        v27 = *v6;
        v28 = *(_QWORD *)&v4[v27];
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(_QWORD *)&v4[*v7])
        {
          v29 = *(float *)(*(_QWORD *)&v4[*v9] + v28);
          *(_QWORD *)&v4[v27] = v28 + 4;
        }
        else
        {
          v4[*v8] = 1;
          v29 = 0.0;
        }
        v5->_confidence = v29;
      }
      else if ((v12 >> 3) == 1)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
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
            goto LABEL_34;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_36:
        if (v22 >= 4)
          LODWORD(v22) = 0;
        v5->_activityType = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_43:
    v30 = 0;
  else
LABEL_44:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasConfidence)
    PBDataWriterWriteFloatField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMContextualUnderstandingActivityInferenceInferredActivity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextualUnderstandingActivityInferenceInferredActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  BMContextualUnderstandingActivityInferenceInferredActivity *v12;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v8 = 0;
          v12 = 0;
          goto LABEL_14;
        }
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v23 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("activityType"));
        v24[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v10);
        v8 = 0;
        v12 = 0;
        *a4 = v20;
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextualUnderstandingActivityInferenceActivityTypeFromString(v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v15 = *MEMORY[0x1E0D025B8];
        v21 = *MEMORY[0x1E0CB2D50];
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidence"));
        v22 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v17);

      }
      v11 = 0;
      v12 = 0;
      goto LABEL_13;
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  self = -[BMContextualUnderstandingActivityInferenceInferredActivity initWithActivityType:confidence:](self, "initWithActivityType:confidence:", objc_msgSend(v8, "intValue"), v11);
  v12 = self;
LABEL_13:

LABEL_14:
  return v12;
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
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextualUnderstandingActivityInferenceInferredActivity activityType](self, "activityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMContextualUnderstandingActivityInferenceInferredActivity hasConfidence](self, "hasConfidence")
    || (-[BMContextualUnderstandingActivityInferenceInferredActivity confidence](self, "confidence"),
        fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMContextualUnderstandingActivityInferenceInferredActivity confidence](self, "confidence");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextualUnderstandingActivityInferenceInferredActivity confidence](self, "confidence");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = CFSTR("activityType");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = CFSTR("confidence");
  v12[0] = v7;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    if (v3)
      goto LABEL_11;
LABEL_13:

    goto LABEL_11;
  }
  if (!v3)
    goto LABEL_13;
LABEL_11:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMContextualUnderstandingActivityInferenceInferredActivity activityType](self, "activityType");
    if (v6 != objc_msgSend(v5, "activityType"))
      goto LABEL_9;
    if (!-[BMContextualUnderstandingActivityInferenceInferredActivity hasConfidence](self, "hasConfidence")
      && !objc_msgSend(v5, "hasConfidence"))
    {
      v10 = 1;
      goto LABEL_10;
    }
    if (-[BMContextualUnderstandingActivityInferenceInferredActivity hasConfidence](self, "hasConfidence")
      && objc_msgSend(v5, "hasConfidence"))
    {
      -[BMContextualUnderstandingActivityInferenceInferredActivity confidence](self, "confidence");
      v8 = v7;
      objc_msgSend(v5, "confidence");
      v10 = v8 == v9;
    }
    else
    {
LABEL_9:
      v10 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)activityType
{
  return self->_activityType;
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

    v4 = -[BMContextualUnderstandingActivityInferenceInferredActivity initByReadFrom:]([BMContextualUnderstandingActivityInferenceInferredActivity alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 2, 1, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DF98;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityType"), 1, 4, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 2, 1, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
