@implementation BMSiriAssistantSuggestionFeaturesTemporalFeatures

- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)initWithTimeOfDay:(id)a3 dayOfWeek:(id)a4 timePeriod:(int)a5
{
  id v8;
  id v9;
  BMSiriAssistantSuggestionFeaturesTemporalFeatures *v10;
  int v11;
  int v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriAssistantSuggestionFeaturesTemporalFeatures;
  v10 = -[BMEventBase init](&v14, sel_init);
  if (v10)
  {
    v10->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v10->_hasTimeOfDay = 1;
      v11 = objc_msgSend(v8, "intValue");
    }
    else
    {
      v10->_hasTimeOfDay = 0;
      v11 = -1;
    }
    v10->_timeOfDay = v11;
    if (v9)
    {
      v10->_hasDayOfWeek = 1;
      v12 = objc_msgSend(v9, "intValue");
    }
    else
    {
      v10->_hasDayOfWeek = 0;
      v12 = -1;
    }
    v10->_dayOfWeek = v12;
    v10->_timePeriod = a5;
  }

  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timeOfDay](self, "timeOfDay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures dayOfWeek](self, "dayOfWeek"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodAsString(-[BMSiriAssistantSuggestionFeaturesTemporalFeatures timePeriod](self, "timePeriod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesTemporalFeatures with timeOfDay: %@, dayOfWeek: %@, timePeriod: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesTemporalFeatures *v5;
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
  unint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  int *v40;
  BMSiriAssistantSuggestionFeaturesTemporalFeatures *v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriAssistantSuggestionFeaturesTemporalFeatures;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
    goto LABEL_63;
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
      v20 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        v28 = 0;
        v29 = 0;
        v23 = 0;
        v5->_hasTimeOfDay = 1;
        while (1)
        {
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
            break;
          v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
          *(_QWORD *)&v4[v30] = v32;
          v23 |= (unint64_t)(v33 & 0x7F) << v28;
          if ((v33 & 0x80) == 0)
            goto LABEL_52;
          v28 += 7;
          v17 = v29++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_54;
          }
        }
        v4[*v8] = 1;
LABEL_52:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_54:
        v40 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesTemporalFeatures__timeOfDay;
      }
      else if ((_DWORD)v20 == 2)
      {
        v34 = 0;
        v35 = 0;
        v23 = 0;
        v5->_hasDayOfWeek = 1;
        while (1)
        {
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          v38 = v37 + 1;
          if (v37 == -1 || v38 > *(_QWORD *)&v4[*v7])
            break;
          v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
          *(_QWORD *)&v4[v36] = v38;
          v23 |= (unint64_t)(v39 & 0x7F) << v34;
          if ((v39 & 0x80) == 0)
            goto LABEL_56;
          v34 += 7;
          v17 = v35++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_58;
          }
        }
        v4[*v8] = 1;
LABEL_56:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_58:
        v40 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesTemporalFeatures__dayOfWeek;
      }
      else
      {
        if ((_DWORD)v20 != 3)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_62;
          continue;
        }
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (1)
        {
          v24 = *v6;
          v25 = *(_QWORD *)&v4[v24];
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)&v4[*v7])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
          *(_QWORD *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0)
            goto LABEL_46;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_48:
        if (v23 >= 5)
          LODWORD(v23) = 0;
        v40 = &OBJC_IVAR___BMSiriAssistantSuggestionFeaturesTemporalFeatures__timePeriod;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + *v40) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_62:
    v41 = 0;
  else
LABEL_63:
    v41 = v5;

  return v41;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasTimeOfDay)
    PBDataWriterWriteInt32Field();
  if (self->_hasDayOfWeek)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesTemporalFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  BMSiriAssistantSuggestionFeaturesTemporalFeatures *v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeOfDay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dayOfWeek"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("dayOfWeek"));
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v17, 2, v11);
        v10 = 0;
        v16 = 0;
        *a4 = v18;
        goto LABEL_24;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timePeriod"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v22 = *MEMORY[0x1E0D025B8];
            v25 = *MEMORY[0x1E0CB2D50];
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("timePeriod"));
            v26 = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v21);

          }
          v12 = 0;
          v16 = 0;
          goto LABEL_24;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodFromString(v11));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures initWithTimeOfDay:dayOfWeek:timePeriod:](self, "initWithTimeOfDay:dayOfWeek:timePeriod:", v8, v10, objc_msgSend(v12, "intValue"));
    v16 = self;
LABEL_24:

    goto LABEL_25;
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
    v16 = 0;
    goto LABEL_26;
  }
  v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v15 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timeOfDay"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v16 = 0;
  *a4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v9);
LABEL_25:

LABEL_26:
  return v16;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriAssistantSuggestionFeaturesTemporalFeatures hasTimeOfDay](self, "hasTimeOfDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timeOfDay](self, "timeOfDay"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesTemporalFeatures hasDayOfWeek](self, "hasDayOfWeek"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures dayOfWeek](self, "dayOfWeek"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timePeriod](self, "timePeriod"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("timeOfDay");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("dayOfWeek");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("timePeriod");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      goto LABEL_15;
LABEL_18:

    if (v3)
      goto LABEL_16;
LABEL_19:

    goto LABEL_16;
  }

  if (!v4)
    goto LABEL_18;
LABEL_15:
  if (!v3)
    goto LABEL_19;
LABEL_16:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMSiriAssistantSuggestionFeaturesTemporalFeatures hasTimeOfDay](self, "hasTimeOfDay")
       && !objc_msgSend(v5, "hasTimeOfDay")
       || -[BMSiriAssistantSuggestionFeaturesTemporalFeatures hasTimeOfDay](self, "hasTimeOfDay")
       && objc_msgSend(v5, "hasTimeOfDay")
       && (v6 = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timeOfDay](self, "timeOfDay"),
           v6 == objc_msgSend(v5, "timeOfDay")))
      && (!-[BMSiriAssistantSuggestionFeaturesTemporalFeatures hasDayOfWeek](self, "hasDayOfWeek")
       && !objc_msgSend(v5, "hasDayOfWeek")
       || -[BMSiriAssistantSuggestionFeaturesTemporalFeatures hasDayOfWeek](self, "hasDayOfWeek")
       && objc_msgSend(v5, "hasDayOfWeek")
       && (v7 = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures dayOfWeek](self, "dayOfWeek"),
           v7 == objc_msgSend(v5, "dayOfWeek"))))
    {
      v8 = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures timePeriod](self, "timePeriod");
      v9 = v8 == objc_msgSend(v5, "timePeriod");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)timeOfDay
{
  return self->_timeOfDay;
}

- (BOOL)hasTimeOfDay
{
  return self->_hasTimeOfDay;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  self->_hasTimeOfDay = a3;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (BOOL)hasDayOfWeek
{
  return self->_hasDayOfWeek;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  self->_hasDayOfWeek = a3;
}

- (int)timePeriod
{
  return self->_timePeriod;
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

    v4 = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesTemporalFeatures alloc], "initByReadFrom:", v7);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeOfDay"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dayOfWeek"), 0, 0, 2, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timePeriod"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B310;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeOfDay"), 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dayOfWeek"), 2, 2, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timePeriod"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
