@implementation BMPhotosMemoriesViewed

- (BMPhotosMemoriesViewed)initWithIdentifier:(id)a3 viewedDurationBucket:(int)a4 watchedToEnd:(id)a5
{
  id v9;
  id v10;
  BMPhotosMemoriesViewed *v11;
  objc_super v13;

  v9 = a3;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMPhotosMemoriesViewed;
  v11 = -[BMEventBase init](&v13, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v11->_identifier, a3);
    v11->_viewedDurationBucket = a4;
    if (v10)
    {
      v11->_hasWatchedToEnd = 1;
      v11->_watchedToEnd = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v11->_hasWatchedToEnd = 0;
      v11->_watchedToEnd = 0;
    }
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPhotosMemoriesViewed identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosMemoriesViewedDurationAsString(-[BMPhotosMemoriesViewed viewedDurationBucket](self, "viewedDurationBucket"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoriesViewed watchedToEnd](self, "watchedToEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPhotosMemoriesViewed with identifier: %@, viewedDurationBucket: %@, watchedToEnd: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPhotosMemoriesViewed *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  unint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  NSString *identifier;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BMPhotosMemoriesViewed *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMPhotosMemoriesViewed;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_52;
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      v19 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        identifier = v5->_identifier;
        v5->_identifier = (NSString *)v26;

      }
      else if ((_DWORD)v19 == 3)
      {
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v5->_hasWatchedToEnd = 1;
        while (1)
        {
          v31 = *v6;
          v32 = *(_QWORD *)&v4[v31];
          if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
            break;
          v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
          *(_QWORD *)&v4[v31] = v32 + 1;
          v30 |= (unint64_t)(v33 & 0x7F) << v28;
          if ((v33 & 0x80) == 0)
            goto LABEL_46;
          v28 += 7;
          v16 = v29++ >= 9;
          if (v16)
          {
            v30 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8])
          v30 = 0;
LABEL_48:
        v5->_watchedToEnd = v30 != 0;
      }
      else if ((_DWORD)v19 == 2)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        while (1)
        {
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 == -1 || v24 >= *(_QWORD *)&v4[*v7])
            break;
          v25 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
          *(_QWORD *)&v4[v23] = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_40;
          v20 += 7;
          v16 = v21++ >= 9;
          if (v16)
          {
            LODWORD(v22) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_42:
        if (v22 >= 4)
          LODWORD(v22) = 0;
        v5->_viewedDurationBucket = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_51;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v34 = 0;
  else
LABEL_52:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasWatchedToEnd)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPhotosMemoriesViewed writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPhotosMemoriesViewed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  BMPhotosMemoriesViewed *v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("viewedDurationBucket"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            v14 = 0;
            goto LABEL_21;
          }
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v20 = *MEMORY[0x1E0D025B8];
          v27 = *MEMORY[0x1E0CB2D50];
          v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("viewedDurationBucket"));
          v28 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v20, 2, v15);
          v10 = 0;
          v14 = 0;
          *a4 = v21;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosMemoriesViewedDurationFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("watchedToEnd"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("watchedToEnd"));
          v26 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v22, 2, v19);

        }
        v16 = 0;
        v14 = 0;
        goto LABEL_20;
      }
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }
    self = -[BMPhotosMemoriesViewed initWithIdentifier:viewedDurationBucket:watchedToEnd:](self, "initWithIdentifier:viewedDurationBucket:watchedToEnd:", v8, objc_msgSend(v10, "intValue"), v16);
    v14 = self;
LABEL_20:

    goto LABEL_21;
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
    v14 = 0;
    goto LABEL_22;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v13 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v14 = 0;
  *a4 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2, v9);
LABEL_21:

LABEL_22:
  return v14;
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
  -[BMPhotosMemoriesViewed identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosMemoriesViewed viewedDurationBucket](self, "viewedDurationBucket"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMPhotosMemoriesViewed hasWatchedToEnd](self, "hasWatchedToEnd"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoriesViewed watchedToEnd](self, "watchedToEnd"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v11[0] = CFSTR("identifier");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("viewedDurationBucket");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("watchedToEnd");
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
      goto LABEL_12;
LABEL_15:

    if (v3)
      goto LABEL_13;
LABEL_16:

    goto LABEL_13;
  }

  if (!v4)
    goto LABEL_15;
LABEL_12:
  if (!v3)
    goto LABEL_16;
LABEL_13:

  return v9;
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
  int v12;
  int v13;
  _BOOL4 v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPhotosMemoriesViewed identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPhotosMemoriesViewed identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    v13 = -[BMPhotosMemoriesViewed viewedDurationBucket](self, "viewedDurationBucket");
    if (v13 == objc_msgSend(v5, "viewedDurationBucket"))
    {
      if (!-[BMPhotosMemoriesViewed hasWatchedToEnd](self, "hasWatchedToEnd")
        && !objc_msgSend(v5, "hasWatchedToEnd"))
      {
        LOBYTE(v12) = 1;
        goto LABEL_14;
      }
      if (-[BMPhotosMemoriesViewed hasWatchedToEnd](self, "hasWatchedToEnd")
        && objc_msgSend(v5, "hasWatchedToEnd"))
      {
        v14 = -[BMPhotosMemoriesViewed watchedToEnd](self, "watchedToEnd");
        v12 = v14 ^ objc_msgSend(v5, "watchedToEnd") ^ 1;
LABEL_14:

        goto LABEL_15;
      }
    }
LABEL_13:
    LOBYTE(v12) = 0;
    goto LABEL_14;
  }
  LOBYTE(v12) = 0;
LABEL_15:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)viewedDurationBucket
{
  return self->_viewedDurationBucket;
}

- (BOOL)watchedToEnd
{
  return self->_watchedToEnd;
}

- (BOOL)hasWatchedToEnd
{
  return self->_hasWatchedToEnd;
}

- (void)setHasWatchedToEnd:(BOOL)a3
{
  self->_hasWatchedToEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMPhotosMemoriesViewed initByReadFrom:]([BMPhotosMemoriesViewed alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("viewedDurationBucket"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("watchedToEnd"), 0, 0, 3, 12, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1FF78;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("viewedDurationBucket"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("watchedToEnd"), 3, 12, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
