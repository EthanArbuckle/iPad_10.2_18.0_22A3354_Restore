@implementation BMUserFocusSleepMode

- (BMUserFocusSleepMode)initWithState:(int)a3 changeReason:(int)a4 expectedEndDate:(id)a5
{
  id v8;
  BMUserFocusSleepMode *v9;
  double v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BMUserFocusSleepMode;
  v9 = -[BMEventBase init](&v12, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v9->_state = a3;
    v9->_changeReason = a4;
    if (v8)
    {
      v9->_hasRaw_expectedEndDate = 1;
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v9->_hasRaw_expectedEndDate = 0;
      v10 = -1.0;
    }
    v9->_raw_expectedEndDate = v10;
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMUserFocusSleepModeStateAsString(-[BMUserFocusSleepMode state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMUserFocusSleepModeChangeReasonAsString(-[BMUserFocusSleepMode changeReason](self, "changeReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusSleepMode expectedEndDate](self, "expectedEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMUserFocusSleepMode with state: %@, changeReason: %@, expectedEndDate: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMUserFocusSleepMode *v5;
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
  uint64_t v34;
  unint64_t v35;
  double v36;
  uint64_t v37;
  BMUserFocusSleepMode *v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMUserFocusSleepMode;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_59;
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
            goto LABEL_48;
          v28 += 7;
          v17 = v29++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_50;
          }
        }
        v4[*v8] = 1;
LABEL_48:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_50:
        if (v23 >= 4)
          LODWORD(v23) = 0;
        v37 = 36;
      }
      else
      {
        if ((_DWORD)v20 == 3)
        {
          v5->_hasRaw_expectedEndDate = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v36 = *(double *)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v36 = 0.0;
          }
          v5->_raw_expectedEndDate = v36;
          continue;
        }
        if ((_DWORD)v20 != 2)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_58;
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
            goto LABEL_42;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_44;
          }
        }
        v4[*v8] = 1;
LABEL_42:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_44:
        if (v23 >= 0xA)
          LODWORD(v23) = 0;
        v37 = 40;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + v37) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_58:
    v38 = 0;
  else
LABEL_59:
    v38 = v5;

  return v38;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_expectedEndDate)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMUserFocusSleepMode writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMUserFocusSleepMode)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  BMUserFocusSleepMode *v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("changeReason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v11 = 0;
            v22 = 0;
            goto LABEL_27;
          }
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v26 = *MEMORY[0x1E0D025B8];
          v35 = *MEMORY[0x1E0CB2D50];
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("changeReason"));
          v36 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v26, 2, v13);
          v11 = 0;
          v22 = 0;
          *a4 = v27;
          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMUserFocusSleepModeChangeReasonFromString(v10));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v12;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("expectedEndDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (objc_class *)MEMORY[0x1E0C99D68];
        v16 = v13;
        v17 = [v15 alloc];
        objc_msgSend(v16, "doubleValue");
        v19 = v18;

        v20 = (id)objc_msgSend(v17, "initWithTimeIntervalSinceReferenceDate:", v19);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v21, "dateFromString:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v30 = *MEMORY[0x1E0D025B8];
            v33 = *MEMORY[0x1E0CB2D50];
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("expectedEndDate"));
            v34 = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v30, 2, v29);

          }
          v14 = 0;
          v22 = 0;
          goto LABEL_26;
        }
        v20 = v13;
      }
      v14 = v20;
    }
    else
    {
      v14 = 0;
    }
LABEL_25:
    self = -[BMUserFocusSleepMode initWithState:changeReason:expectedEndDate:](self, "initWithState:changeReason:expectedEndDate:", objc_msgSend(v8, "intValue"), objc_msgSend(v11, "intValue"), v14);
    v22 = self;
LABEL_26:

    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMUserFocusSleepModeStateFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v22 = 0;
    goto LABEL_28;
  }
  v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v25 = *MEMORY[0x1E0D025B8];
  v37 = *MEMORY[0x1E0CB2D50];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("state"));
  v38[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v22 = 0;
  *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v10);
LABEL_27:

LABEL_28:
  return v22;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMUserFocusSleepMode state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMUserFocusSleepMode changeReason](self, "changeReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusSleepMode expectedEndDate](self, "expectedEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMUserFocusSleepMode expectedEndDate](self, "expectedEndDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  v14[0] = CFSTR("state");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v14[1] = CFSTR("changeReason");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  v14[2] = CFSTR("expectedEndDate");
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

  return v12;
}

- (NSDate)expectedEndDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_expectedEndDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_expectedEndDate);
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
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMUserFocusSleepMode state](self, "state");
    if (v6 == objc_msgSend(v5, "state")
      && (v7 = -[BMUserFocusSleepMode changeReason](self, "changeReason"),
          v7 == objc_msgSend(v5, "changeReason")))
    {
      -[BMUserFocusSleepMode expectedEndDate](self, "expectedEndDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expectedEndDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        -[BMUserFocusSleepMode expectedEndDate](self, "expectedEndDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "expectedEndDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)state
{
  return self->_state;
}

- (int)changeReason
{
  return self->_changeReason;
}

+ (unsigned)latestDataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 3)
  {
    v6 = off_1E5E4B770;
  }
  else
  {
    if (a4 != 2)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4B778;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[8] = a4;

LABEL_7:
  return v8;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("state"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("changeReason"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("expectedEndDate"), 3, 0, 3, 0, 1);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B610;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("state"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("changeReason"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("expectedEndDate"), 3, 0, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
