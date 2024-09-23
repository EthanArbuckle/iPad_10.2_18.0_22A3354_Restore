@implementation BMAmbientMusicDetection

- (BMAmbientMusicDetection)initWithAbsoluteTimestamp:(id)a3 detected:(id)a4
{
  id v6;
  id v7;
  BMAmbientMusicDetection *v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMAmbientMusicDetection;
  v8 = -[BMEventBase init](&v11, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v6, "timeIntervalSince1970");
    }
    else
    {
      v8->_hasRaw_absoluteTimestamp = 0;
      v9 = -1.0;
    }
    v8->_raw_absoluteTimestamp = v9;
    if (v7)
    {
      v8->_hasDetected = 1;
      v8->_detected = objc_msgSend(v7, "BOOLValue");
    }
    else
    {
      v8->_hasDetected = 0;
      v8->_detected = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAmbientMusicDetection absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAmbientMusicDetection detected](self, "detected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAmbientMusicDetection with absoluteTimestamp: %@, detected: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAmbientMusicDetection *v5;
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
  unint64_t v21;
  double v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  BMAmbientMusicDetection *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMAmbientMusicDetection;
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
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v5->_hasDetected = 1;
        while (1)
        {
          v26 = *v6;
          v27 = *(_QWORD *)&v4[v26];
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            break;
          v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
          *(_QWORD *)&v4[v26] = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0)
            goto LABEL_34;
          v23 += 7;
          v17 = v24++ >= 9;
          if (v17)
          {
            v25 = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8])
          v25 = 0;
LABEL_36:
        v5->_detected = v25 != 0;
      }
      else if ((v12 >> 3) == 1)
      {
        v5->_hasRaw_absoluteTimestamp = 1;
        v20 = *v6;
        v21 = *(_QWORD *)&v4[v20];
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
        {
          v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
          *(_QWORD *)&v4[v20] = v21 + 8;
        }
        else
        {
          v4[*v8] = 1;
          v22 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v22;
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
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasDetected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAmbientMusicDetection writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAmbientMusicDetection)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  BMAmbientMusicDetection *v18;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D68];
    v10 = v7;
    v11 = [v9 alloc];
    objc_msgSend(v10, "doubleValue");
    v13 = v12;

    v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v8 = 0;
        v18 = 0;
        goto LABEL_14;
      }
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v25 = *MEMORY[0x1E0D025B8];
      v29 = *MEMORY[0x1E0CB2D50];
      v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v30[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v16);
      v8 = 0;
      v18 = 0;
      *a4 = v26;
      goto LABEL_13;
    }
    v14 = v7;
    goto LABEL_6;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v15, "dateFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detected"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("detected"));
        v28 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v23);

      }
      v17 = 0;
      v18 = 0;
      goto LABEL_13;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  self = -[BMAmbientMusicDetection initWithAbsoluteTimestamp:detected:](self, "initWithAbsoluteTimestamp:detected:", v8, v17);
  v18 = self;
LABEL_13:

LABEL_14:
  return v18;
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
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[BMAmbientMusicDetection absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAmbientMusicDetection absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  if (-[BMAmbientMusicDetection hasDetected](self, "hasDetected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAmbientMusicDetection detected](self, "detected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v12[0] = CFSTR("absoluteTimestamp");
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = CFSTR("detected");
  v13[0] = v8;
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    if (v6)
      goto LABEL_13;
LABEL_15:

    goto LABEL_13;
  }
  if (!v6)
    goto LABEL_15;
LABEL_13:

  return v10;
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
  int v12;
  _BOOL4 v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAmbientMusicDetection absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAmbientMusicDetection absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_12;
    }
    if (!-[BMAmbientMusicDetection hasDetected](self, "hasDetected") && !objc_msgSend(v5, "hasDetected"))
    {
      LOBYTE(v12) = 1;
      goto LABEL_13;
    }
    if (-[BMAmbientMusicDetection hasDetected](self, "hasDetected") && objc_msgSend(v5, "hasDetected"))
    {
      v13 = -[BMAmbientMusicDetection detected](self, "detected");
      v12 = v13 ^ objc_msgSend(v5, "detected") ^ 1;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  LOBYTE(v12) = 0;
LABEL_14:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)detected
{
  return self->_detected;
}

- (BOOL)hasDetected
{
  return self->_hasDetected;
}

- (void)setHasDetected:(BOOL)a3
{
  self->_hasDetected = a3;
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

    v4 = -[BMAmbientMusicDetection initByReadFrom:]([BMAmbientMusicDetection alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("detected"), 0, 0, 2, 12, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DE00;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("detected"), 2, 12, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
