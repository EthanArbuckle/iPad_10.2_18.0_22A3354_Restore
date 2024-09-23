@implementation BMIntelligencePlatformMessageTermsTermCount

- (BMIntelligencePlatformMessageTermsTermCount)initWithTerm:(id)a3 termCount:(id)a4
{
  id v7;
  id v8;
  BMIntelligencePlatformMessageTermsTermCount *v9;
  int v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMIntelligencePlatformMessageTermsTermCount;
  v9 = -[BMEventBase init](&v12, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_term, a3);
    if (v8)
    {
      v9->_hasTermCount = 1;
      v10 = objc_msgSend(v8, "intValue");
    }
    else
    {
      v9->_hasTermCount = 0;
      v10 = -1;
    }
    v9->_termCount = v10;
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMIntelligencePlatformMessageTermsTermCount term](self, "term");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformMessageTermsTermCount termCount](self, "termCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformMessageTermsTermCount with term: %@, termCount: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformMessageTermsTermCount *v5;
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
  BMIntelligencePlatformMessageTermsTermCountTerm *v20;
  BMIntelligencePlatformMessageTermsTermCountTerm *term;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  BMIntelligencePlatformMessageTermsTermCount *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMIntelligencePlatformMessageTermsTermCount;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_40;
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
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v5->_hasTermCount = 1;
        while (1)
        {
          v25 = *v6;
          v26 = *(_QWORD *)&v4[v25];
          v27 = v26 + 1;
          if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            break;
          v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
          *(_QWORD *)&v4[v25] = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0)
            goto LABEL_34;
          v22 += 7;
          v17 = v23++ >= 9;
          if (v17)
          {
            LODWORD(v24) = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8])
          LODWORD(v24) = 0;
LABEL_36:
        v5->_termCount = v24;
      }
      else if ((v12 >> 3) == 1)
      {
        v32 = 0;
        v33 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_39;
        v20 = -[BMIntelligencePlatformMessageTermsTermCountTerm initByReadFrom:]([BMIntelligencePlatformMessageTermsTermCountTerm alloc], "initByReadFrom:", v4);
        if (!v20)
          goto LABEL_39;
        term = v5->_term;
        v5->_term = v20;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_39;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_39:
    v29 = 0;
  else
LABEL_40:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_term)
  {
    PBDataWriterPlaceMark();
    -[BMIntelligencePlatformMessageTermsTermCountTerm writeTo:](self->_term, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasTermCount)
    PBDataWriterWriteInt32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformMessageTermsTermCount writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformMessageTermsTermCount)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMIntelligencePlatformMessageTermsTermCountTerm *v8;
  void *v9;
  id v10;
  BMIntelligencePlatformMessageTermsTermCount *v11;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("term"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    v22 = 0;
    v8 = -[BMIntelligencePlatformMessageTermsTermCountTerm initWithJSONDictionary:error:]([BMIntelligencePlatformMessageTermsTermCountTerm alloc], "initWithJSONDictionary:error:", v10, &v22);
    v13 = v22;
    if (v13)
    {
      v14 = v13;
      if (a4)
        *a4 = objc_retainAutorelease(v13);

      v11 = 0;
      goto LABEL_9;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("termCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v19 = *MEMORY[0x1E0D025B8];
          v23 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("termCount"));
          v24 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v21);

        }
        v11 = 0;
        v10 = 0;
        goto LABEL_8;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    self = -[BMIntelligencePlatformMessageTermsTermCount initWithTerm:termCount:](self, "initWithTerm:termCount:", v8, v10);
    v11 = self;
LABEL_8:

    goto LABEL_9;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v25 = *MEMORY[0x1E0CB2D50];
  v8 = (BMIntelligencePlatformMessageTermsTermCountTerm *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("term"));
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v10);
  v11 = 0;
  *a4 = v17;
LABEL_9:

LABEL_10:
  return v11;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMIntelligencePlatformMessageTermsTermCount term](self, "term");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMIntelligencePlatformMessageTermsTermCount hasTermCount](self, "hasTermCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformMessageTermsTermCount termCount](self, "termCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v10[0] = CFSTR("term");
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("termCount");
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    if (v4)
      goto LABEL_10;
LABEL_12:

    goto LABEL_10;
  }
  if (!v4)
    goto LABEL_12;
LABEL_10:

  return v8;
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
  int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligencePlatformMessageTermsTermCount term](self, "term");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "term");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligencePlatformMessageTermsTermCount term](self, "term");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "term");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_12;
    }
    if (!-[BMIntelligencePlatformMessageTermsTermCount hasTermCount](self, "hasTermCount")
      && !objc_msgSend(v5, "hasTermCount"))
    {
      v12 = 1;
      goto LABEL_13;
    }
    if (-[BMIntelligencePlatformMessageTermsTermCount hasTermCount](self, "hasTermCount")
      && objc_msgSend(v5, "hasTermCount"))
    {
      v13 = -[BMIntelligencePlatformMessageTermsTermCount termCount](self, "termCount");
      v12 = v13 == objc_msgSend(v5, "termCount");
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMIntelligencePlatformMessageTermsTermCountTerm)term
{
  return self->_term;
}

- (int)termCount
{
  return self->_termCount;
}

- (BOOL)hasTermCount
{
  return self->_hasTermCount;
}

- (void)setHasTermCount:(BOOL)a3
{
  self->_hasTermCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_term, 0);
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

    v4 = -[BMIntelligencePlatformMessageTermsTermCount initByReadFrom:]([BMIntelligencePlatformMessageTermsTermCount alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("term_json"), 5, 1, &__block_literal_global_153);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("termCount"), 0, 0, 2, 2, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C168;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("term"), 1, 14, objc_opt_class());
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("termCount"), 2, 2, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__BMIntelligencePlatformMessageTermsTermCount_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "term");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
