@implementation BMLocationPlaceInferenceStats

- (BMLocationPlaceInferenceStats)initWithVisitCount:(id)a3 familiarityIndex:(id)a4
{
  id v6;
  id v7;
  BMLocationPlaceInferenceStats *v8;
  int v9;
  double v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMLocationPlaceInferenceStats;
  v8 = -[BMEventBase init](&v12, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasVisitCount = 1;
      v9 = objc_msgSend(v6, "intValue");
    }
    else
    {
      v8->_hasVisitCount = 0;
      v9 = -1;
    }
    v8->_visitCount = v9;
    if (v7)
    {
      v8->_hasFamiliarityIndex = 1;
      objc_msgSend(v7, "doubleValue");
    }
    else
    {
      v8->_hasFamiliarityIndex = 0;
      v10 = -1.0;
    }
    v8->_familiarityIndex = v10;
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationPlaceInferenceStats visitCount](self, "visitCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationPlaceInferenceStats familiarityIndex](self, "familiarityIndex");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationPlaceInferenceStats with visitCount: %@, familiarityIndex: %@"), v4, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationPlaceInferenceStats *v5;
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
  BMLocationPlaceInferenceStats *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMLocationPlaceInferenceStats;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
    goto LABEL_42;
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
        v5->_hasFamiliarityIndex = 1;
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
        v5->_familiarityIndex = v29;
      }
      else if ((v12 >> 3) == 1)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v5->_hasVisitCount = 1;
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
        v5->_visitCount = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_41;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_41:
    v30 = 0;
  else
LABEL_42:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasVisitCount)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasFamiliarityIndex)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationPlaceInferenceStats writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationPlaceInferenceStats)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMLocationPlaceInferenceStats *v11;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visitCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        v8 = 0;
        goto LABEL_9;
      }
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = *MEMORY[0x1E0D025B8];
      v22 = *MEMORY[0x1E0CB2D50];
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("visitCount"));
      v23[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2, v9);
      v11 = 0;
      v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familiarityIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v20 = *MEMORY[0x1E0CB2D50];
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("familiarityIndex"));
        v21 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v19);

      }
      v10 = 0;
      v11 = 0;
      goto LABEL_8;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  self = -[BMLocationPlaceInferenceStats initWithVisitCount:familiarityIndex:](self, "initWithVisitCount:familiarityIndex:", v8, v10);
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
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
  if (-[BMLocationPlaceInferenceStats hasVisitCount](self, "hasVisitCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationPlaceInferenceStats visitCount](self, "visitCount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!-[BMLocationPlaceInferenceStats hasFamiliarityIndex](self, "hasFamiliarityIndex")
    || (-[BMLocationPlaceInferenceStats familiarityIndex](self, "familiarityIndex"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMLocationPlaceInferenceStats familiarityIndex](self, "familiarityIndex");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationPlaceInferenceStats familiarityIndex](self, "familiarityIndex");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = CFSTR("visitCount");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = CFSTR("familiarityIndex");
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
      goto LABEL_14;
LABEL_16:

    goto LABEL_14;
  }
  if (!v3)
    goto LABEL_16;
LABEL_14:

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
    if (-[BMLocationPlaceInferenceStats hasVisitCount](self, "hasVisitCount")
      || objc_msgSend(v5, "hasVisitCount"))
    {
      if (!-[BMLocationPlaceInferenceStats hasVisitCount](self, "hasVisitCount"))
        goto LABEL_13;
      if (!objc_msgSend(v5, "hasVisitCount"))
        goto LABEL_13;
      v6 = -[BMLocationPlaceInferenceStats visitCount](self, "visitCount");
      if (v6 != objc_msgSend(v5, "visitCount"))
        goto LABEL_13;
    }
    if (!-[BMLocationPlaceInferenceStats hasFamiliarityIndex](self, "hasFamiliarityIndex")
      && !objc_msgSend(v5, "hasFamiliarityIndex"))
    {
      v10 = 1;
      goto LABEL_14;
    }
    if (-[BMLocationPlaceInferenceStats hasFamiliarityIndex](self, "hasFamiliarityIndex")
      && objc_msgSend(v5, "hasFamiliarityIndex"))
    {
      -[BMLocationPlaceInferenceStats familiarityIndex](self, "familiarityIndex");
      v8 = v7;
      objc_msgSend(v5, "familiarityIndex");
      v10 = v8 == v9;
    }
    else
    {
LABEL_13:
      v10 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)visitCount
{
  return self->_visitCount;
}

- (BOOL)hasVisitCount
{
  return self->_hasVisitCount;
}

- (void)setHasVisitCount:(BOOL)a3
{
  self->_hasVisitCount = a3;
}

- (double)familiarityIndex
{
  return self->_familiarityIndex;
}

- (BOOL)hasFamiliarityIndex
{
  return self->_hasFamiliarityIndex;
}

- (void)setHasFamiliarityIndex:(BOOL)a3
{
  self->_hasFamiliarityIndex = a3;
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

    v4 = -[BMLocationPlaceInferenceStats initByReadFrom:]([BMLocationPlaceInferenceStats alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visitCount"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("familiarityIndex"), 1, 0, 2, 0, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B508;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visitCount"), 1, 2, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("familiarityIndex"), 2, 0, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
