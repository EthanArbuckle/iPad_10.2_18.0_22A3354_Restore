@implementation BMLocationPointOfInterestCategory

- (BMLocationPointOfInterestCategory)initWithPoiCategory:(id)a3 rank:(id)a4 timestamp:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMLocationPointOfInterestCategory *v12;
  unsigned int v13;
  double v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMLocationPointOfInterestCategory;
  v12 = -[BMEventBase init](&v16, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_poiCategory, a3);
    if (v10)
    {
      v12->_hasRank = 1;
      v13 = objc_msgSend(v10, "unsignedIntValue");
    }
    else
    {
      v13 = 0;
      v12->_hasRank = 0;
    }
    v12->_rank = v13;
    if (v11)
    {
      v12->_hasRaw_timestamp = 1;
      objc_msgSend(v11, "timeIntervalSince1970");
    }
    else
    {
      v12->_hasRaw_timestamp = 0;
      v14 = -1.0;
    }
    v12->_raw_timestamp = v14;
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMLocationPointOfInterestCategory poiCategory](self, "poiCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMLocationPointOfInterestCategory rank](self, "rank"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationPointOfInterestCategory timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationPointOfInterestCategory with poiCategory: %@, rank: %@, timestamp: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationPointOfInterestCategory *v5;
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
  uint64_t v21;
  NSString *poiCategory;
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
  BMLocationPointOfInterestCategory *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMLocationPointOfInterestCategory;
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
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasRaw_timestamp = 1;
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
        v5->_raw_timestamp = v25;
      }
      else if ((_DWORD)v20 == 2)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v5->_hasRank = 1;
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
        v5->_rank = v28;
      }
      else if ((_DWORD)v20 == 1)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        poiCategory = v5->_poiCategory;
        v5->_poiCategory = (NSString *)v21;

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
  if (self->_poiCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRank)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasRaw_timestamp)
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
  -[BMLocationPointOfInterestCategory writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationPointOfInterestCategory)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v19;
  uint64_t v20;
  BMLocationPointOfInterestCategory *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("poiCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rank"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v21 = 0;
          goto LABEL_25;
        }
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v33 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rank"));
        v34 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v22, 2, v11);
        v10 = 0;
        v21 = 0;
        *a4 = v23;
        goto LABEL_24;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (objc_class *)MEMORY[0x1E0C99D68];
        v14 = v11;
        v15 = [v13 alloc];
        objc_msgSend(v14, "doubleValue");
        v17 = v16;

        v18 = (id)objc_msgSend(v15, "initWithTimeIntervalSince1970:", v17);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v24, "dateFromString:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v28 = *MEMORY[0x1E0D025B8];
            v31 = *MEMORY[0x1E0CB2D50];
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
            v32 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v27);

          }
          v12 = 0;
          v21 = 0;
          goto LABEL_24;
        }
        v18 = v11;
      }
      v12 = v18;
    }
    else
    {
      v12 = 0;
    }
LABEL_23:
    self = -[BMLocationPointOfInterestCategory initWithPoiCategory:rank:timestamp:](self, "initWithPoiCategory:rank:timestamp:", v8, v10, v12);
    v21 = self;
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
    v21 = 0;
    goto LABEL_26;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v35 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("poiCategory"));
  v36[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v21 = 0;
  *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
LABEL_25:

LABEL_26:
  return v21;
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
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  -[BMLocationPointOfInterestCategory poiCategory](self, "poiCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMLocationPointOfInterestCategory hasRank](self, "hasRank"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMLocationPointOfInterestCategory rank](self, "rank"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMLocationPointOfInterestCategory timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationPointOfInterestCategory timestamp](self, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  v14[0] = CFSTR("poiCategory");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v14[1] = CFSTR("rank");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  v14[2] = CFSTR("timestamp");
  v11 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
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

  return v12;
}

- (NSDate)timestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_timestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
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
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLocationPointOfInterestCategory poiCategory](self, "poiCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "poiCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLocationPointOfInterestCategory poiCategory](self, "poiCategory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "poiCategory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_14;
    }
    if (!-[BMLocationPointOfInterestCategory hasRank](self, "hasRank") && !objc_msgSend(v5, "hasRank")
      || -[BMLocationPointOfInterestCategory hasRank](self, "hasRank")
      && objc_msgSend(v5, "hasRank")
      && (v13 = -[BMLocationPointOfInterestCategory rank](self, "rank"), v13 == objc_msgSend(v5, "rank")))
    {
      -[BMLocationPointOfInterestCategory timestamp](self, "timestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v12 = 1;
      }
      else
      {
        -[BMLocationPointOfInterestCategory timestamp](self, "timestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v16, "isEqual:", v17);

      }
      goto LABEL_17;
    }
LABEL_14:
    v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategory, 0);
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

    v7 = -[BMLocationPointOfInterestCategory initByReadFrom:]([BMLocationPointOfInterestCategory alloc], "initByReadFrom:", v6);
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
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("poiCategory"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rank"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 3, 0, 2);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1BC40;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("poiCategory"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rank"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 3, 0, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
