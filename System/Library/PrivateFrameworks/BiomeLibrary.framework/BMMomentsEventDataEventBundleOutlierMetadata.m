@implementation BMMomentsEventDataEventBundleOutlierMetadata

- (BMMomentsEventDataEventBundleOutlierMetadata)initWithIsSignificant:(id)a3 outlierScore:(id)a4 updatedDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMMomentsEventDataEventBundleOutlierMetadata *v11;
  double v12;
  double v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMMomentsEventDataEventBundleOutlierMetadata;
  v11 = -[BMEventBase init](&v15, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasIsSignificant = 1;
      v11->_isSignificant = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      v11->_hasIsSignificant = 0;
      v11->_isSignificant = 0;
    }
    if (v9)
    {
      v11->_hasOutlierScore = 1;
      objc_msgSend(v9, "doubleValue");
    }
    else
    {
      v11->_hasOutlierScore = 0;
      v12 = -1.0;
    }
    v11->_outlierScore = v12;
    if (v10)
    {
      v11->_hasRaw_updatedDate = 1;
      objc_msgSend(v10, "timeIntervalSince1970");
    }
    else
    {
      v11->_hasRaw_updatedDate = 0;
      v13 = -1.0;
    }
    v11->_raw_updatedDate = v13;
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleOutlierMetadata isSignificant](self, "isSignificant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundleOutlierMetadata outlierScore](self, "outlierScore");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEventDataEventBundleOutlierMetadata updatedDate](self, "updatedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMomentsEventDataEventBundleOutlierMetadata with isSignificant: %@, outlierScore: %@, updatedDate: %@"), v4, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEventDataEventBundleOutlierMetadata *v5;
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
  uint64_t v28;
  unint64_t v29;
  objc_class *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BMMomentsEventDataEventBundleOutlierMetadata *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMMomentsEventDataEventBundleOutlierMetadata;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_49;
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
        v5->_hasRaw_updatedDate = 1;
        v28 = *v6;
        v29 = *(_QWORD *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v30 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v29);
          *(_QWORD *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v30 = 0;
        }
        v33 = 24;
      }
      else
      {
        if ((_DWORD)v20 != 2)
        {
          if ((_DWORD)v20 == 1)
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
            v5->_hasIsSignificant = 1;
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
                goto LABEL_38;
              v21 += 7;
              v17 = v22++ >= 9;
              if (v17)
              {
                v23 = 0;
                goto LABEL_40;
              }
            }
            v4[*v8] = 1;
LABEL_38:
            if (v4[*v8])
              v23 = 0;
LABEL_40:
            v5->_isSignificant = v23 != 0;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_48;
          }
          continue;
        }
        v5->_hasOutlierScore = 1;
        v31 = *v6;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v30 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v32);
          *(_QWORD *)&v4[v31] = v32 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v30 = 0;
        }
        v33 = 40;
      }
      *(Class *)((char *)&v5->super.super.isa + v33) = v30;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_48:
    v34 = 0;
  else
LABEL_49:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasIsSignificant)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasOutlierScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasRaw_updatedDate)
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
  -[BMMomentsEventDataEventBundleOutlierMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundleOutlierMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  BMMomentsEventDataEventBundleOutlierMetadata *v21;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSignificant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outlierScore"));
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
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("outlierScore"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("updatedDate"));
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
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("updatedDate"));
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
    self = -[BMMomentsEventDataEventBundleOutlierMetadata initWithIsSignificant:outlierScore:updatedDate:](self, "initWithIsSignificant:outlierScore:updatedDate:", v8, v10, v12);
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
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSignificant"));
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
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  if (-[BMMomentsEventDataEventBundleOutlierMetadata hasIsSignificant](self, "hasIsSignificant"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEventDataEventBundleOutlierMetadata isSignificant](self, "isSignificant"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!-[BMMomentsEventDataEventBundleOutlierMetadata hasOutlierScore](self, "hasOutlierScore")
    || (-[BMMomentsEventDataEventBundleOutlierMetadata outlierScore](self, "outlierScore"), fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundleOutlierMetadata outlierScore](self, "outlierScore");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleOutlierMetadata outlierScore](self, "outlierScore");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMMomentsEventDataEventBundleOutlierMetadata updatedDate](self, "updatedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundleOutlierMetadata updatedDate](self, "updatedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  v16[0] = CFSTR("isSignificant");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v11;
  v16[1] = CFSTR("outlierScore");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v12;
  v16[2] = CFSTR("updatedDate");
  v13 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v6)
      goto LABEL_19;
LABEL_22:

    if (v3)
      goto LABEL_20;
LABEL_23:

    goto LABEL_20;
  }

  if (!v6)
    goto LABEL_22;
LABEL_19:
  if (!v3)
    goto LABEL_23;
LABEL_20:

  return v14;
}

- (NSDate)updatedDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_updatedDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_updatedDate);
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
  int v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMMomentsEventDataEventBundleOutlierMetadata hasIsSignificant](self, "hasIsSignificant")
       && !objc_msgSend(v5, "hasIsSignificant")
       || -[BMMomentsEventDataEventBundleOutlierMetadata hasIsSignificant](self, "hasIsSignificant")
       && objc_msgSend(v5, "hasIsSignificant")
       && (v6 = -[BMMomentsEventDataEventBundleOutlierMetadata isSignificant](self, "isSignificant"),
           v6 == objc_msgSend(v5, "isSignificant")))
      && (!-[BMMomentsEventDataEventBundleOutlierMetadata hasOutlierScore](self, "hasOutlierScore")
       && !objc_msgSend(v5, "hasOutlierScore")
       || -[BMMomentsEventDataEventBundleOutlierMetadata hasOutlierScore](self, "hasOutlierScore")
       && objc_msgSend(v5, "hasOutlierScore")
       && (-[BMMomentsEventDataEventBundleOutlierMetadata outlierScore](self, "outlierScore"),
           v8 = v7,
           objc_msgSend(v5, "outlierScore"),
           v8 == v9)))
    {
      -[BMMomentsEventDataEventBundleOutlierMetadata updatedDate](self, "updatedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updatedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {
        v14 = 1;
      }
      else
      {
        -[BMMomentsEventDataEventBundleOutlierMetadata updatedDate](self, "updatedDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "updatedDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (BOOL)hasIsSignificant
{
  return self->_hasIsSignificant;
}

- (void)setHasIsSignificant:(BOOL)a3
{
  self->_hasIsSignificant = a3;
}

- (double)outlierScore
{
  return self->_outlierScore;
}

- (BOOL)hasOutlierScore
{
  return self->_hasOutlierScore;
}

- (void)setHasOutlierScore:(BOOL)a3
{
  self->_hasOutlierScore = a3;
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

    v4 = -[BMMomentsEventDataEventBundleOutlierMetadata initByReadFrom:]([BMMomentsEventDataEventBundleOutlierMetadata alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSignificant"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("outlierScore"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("updatedDate"), 3, 0, 3, 0, 2);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A758;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSignificant"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outlierScore"), 2, 0, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("updatedDate"), 3, 0, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
