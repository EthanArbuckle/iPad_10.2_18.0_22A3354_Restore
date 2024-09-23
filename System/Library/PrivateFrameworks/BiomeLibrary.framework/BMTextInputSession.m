@implementation BMTextInputSession

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("duration"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionInput"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sessionID"), 2, 0, 5, 13, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BMTextInputSession)initWithDuration:(id)a3 timestamp:(id)a4 bundleID:(id)a5 sessionInput:(int)a6 sessionID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMTextInputSession *v16;
  double v17;
  double v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMTextInputSession;
  v16 = -[BMEventBase init](&v20, sel_init);
  if (v16)
  {
    v16->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v16->_hasDuration = 1;
      objc_msgSend(v12, "doubleValue");
    }
    else
    {
      v16->_hasDuration = 0;
      v17 = -1.0;
    }
    v16->_duration = v17;
    if (v13)
    {
      v16->_hasRaw_timestamp = 1;
      objc_msgSend(v13, "timeIntervalSince1970");
    }
    else
    {
      v16->_hasRaw_timestamp = 0;
      v18 = -1.0;
    }
    v16->_raw_timestamp = v18;
    objc_storeStrong((id *)&v16->_bundleID, a5);
    v16->_sessionInput = a6;
    objc_storeStrong((id *)&v16->_sessionID, a7);
  }

  return v16;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

- (BMTextInputSession)initWithDuration:(id)a3 timestamp:(id)a4 bundleID:(id)a5 sessionInput:(int)a6
{
  return -[BMTextInputSession initWithDuration:timestamp:bundleID:sessionInput:sessionID:](self, "initWithDuration:timestamp:bundleID:sessionInput:sessionID:", a3, a4, a5, *(_QWORD *)&a6, 0);
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
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMTextInputSession duration](self, "duration");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextInputSession timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextInputSession bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMTextInputSessionInputAsString(-[BMTextInputSession sessionInput](self, "sessionInput"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextInputSession sessionID](self, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMTextInputSession with duration: %@, timestamp: %@, bundleID: %@, sessionInput: %@, sessionID: %@"), v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMTextInputSession *v5;
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
  objc_class *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  void *v34;
  uint64_t v35;
  BMTextInputSession *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMTextInputSession;
  v5 = -[BMEventBase init](&v38, sel_init);
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
          v5->_hasDuration = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v35 = 48;
          goto LABEL_48;
        case 2u:
          v5->_hasRaw_timestamp = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v35 = 24;
LABEL_48:
          *(Class *)((char *)&v5->super.super.isa + v35) = v22;
          continue;
        case 3u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 56;
          goto LABEL_37;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          break;
        case 5u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 64;
LABEL_37:
          v34 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_51;
          continue;
      }
      while (1)
      {
        v30 = *v6;
        v31 = *(_QWORD *)&v4[v30];
        v32 = v31 + 1;
        if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
        *(_QWORD *)&v4[v30] = v32;
        v29 |= (unint64_t)(v33 & 0x7F) << v27;
        if ((v33 & 0x80) == 0)
          goto LABEL_39;
        v27 += 7;
        v17 = v28++ >= 9;
        if (v17)
        {
          LODWORD(v29) = 0;
          goto LABEL_41;
        }
      }
      v4[*v8] = 1;
LABEL_39:
      if (v4[*v8])
        LODWORD(v29) = 0;
LABEL_41:
      if (v29 >= 5)
        LODWORD(v29) = 0;
      v5->_sessionInput = v29;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v36 = 0;
  else
LABEL_52:
    v36 = v5;

  return v36;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasDuration)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_timestamp)
    PBDataWriterWriteDoubleField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_sessionID)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMTextInputSession writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMTextInputSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id *v14;
  id v15;
  uint64_t v16;
  id *v17;
  BMTextInputSession *v18;
  id v19;
  void *v20;
  BMTextInputSession *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (objc_class *)MEMORY[0x1E0C99D68];
        v10 = v8;
        v11 = [v9 alloc];
        objc_msgSend(v10, "doubleValue");
        v13 = v12;

        v14 = (id *)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v19, "dateFromString:", v8);
          v39 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            goto LABEL_38;
          }
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = *MEMORY[0x1E0D025B8];
          v48 = *MEMORY[0x1E0CB2D50];
          v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
          v49 = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v20);
          a4 = 0;
          goto LABEL_37;
        }
        v14 = v8;
      }
      v39 = v14;
    }
    else
    {
      v39 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v7;
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v40 = 0;
          v18 = 0;
          a4 = v39;
          goto LABEL_37;
        }
        v21 = self;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v47 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        v18 = 0;
        *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v22);
        goto LABEL_55;
      }
      v21 = self;
      v40 = v20;
    }
    else
    {
      v21 = self;
      v40 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionInput"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = 0;
      goto LABEL_31;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v22;
LABEL_30:
      v23 = v24;
LABEL_31:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v28 = 0;
LABEL_34:
        a4 = v39;
        v18 = -[BMTextInputSession initWithDuration:timestamp:bundleID:sessionInput:sessionID:](v21, "initWithDuration:timestamp:bundleID:sessionInput:sessionID:", v41, v39, v40, objc_msgSend(v23, "intValue"), v28);
        v21 = v18;
LABEL_35:

LABEL_36:
        self = v21;
        v7 = v38;
LABEL_37:

        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v27;
        goto LABEL_34;
      }
      if (a4)
      {
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sessionID"));
        v43 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v34, 2, v31);

      }
      v28 = 0;
      v18 = 0;
LABEL_50:
      a4 = v39;
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMTextInputSessionInputFromString(v22));
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (a4)
    {
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0D025B8];
      v44 = *MEMORY[0x1E0CB2D50];
      v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("sessionInput"));
      v45 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v18 = 0;
      *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v35, 2, v27);
      goto LABEL_50;
    }
    v23 = 0;
    v18 = 0;
LABEL_55:
    a4 = v39;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v41 = 0;
    v18 = 0;
    goto LABEL_39;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v50 = *MEMORY[0x1E0CB2D50];
  v17 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("duration"));
  v51[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v18 = 0;
  *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v8);
  a4 = v17;
LABEL_38:

LABEL_39:
  return v18;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  if (!-[BMTextInputSession hasDuration](self, "hasDuration")
    || (-[BMTextInputSession duration](self, "duration"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMTextInputSession duration](self, "duration");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMTextInputSession duration](self, "duration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMTextInputSession timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMTextInputSession timestamp](self, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[BMTextInputSession bundleID](self, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMTextInputSession sessionInput](self, "sessionInput"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextInputSession sessionID](self, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("duration");
  v13 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v20 = v13;
  v27[0] = v13;
  v23 = CFSTR("timestamp");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v13, v22, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[1] = v14;
  v24 = CFSTR("bundleID");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[2] = v15;
  v25 = CFSTR("sessionInput");
  v16 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v16;
  v26 = CFSTR("sessionID");
  v17 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v22, 5, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_20;
  }
  else
  {

    if (v11)
    {
LABEL_20:
      if (v10)
        goto LABEL_21;
      goto LABEL_26;
    }
  }

  if (v10)
  {
LABEL_21:
    if (v9)
      goto LABEL_22;
LABEL_27:

    if (v5)
      goto LABEL_23;
LABEL_28:

    goto LABEL_23;
  }
LABEL_26:

  if (!v9)
    goto LABEL_27;
LABEL_22:
  if (!v5)
    goto LABEL_28;
LABEL_23:

  return v18;
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
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMTextInputSession hasDuration](self, "hasDuration") || objc_msgSend(v5, "hasDuration"))
    {
      if (!-[BMTextInputSession hasDuration](self, "hasDuration"))
        goto LABEL_19;
      if (!objc_msgSend(v5, "hasDuration"))
        goto LABEL_19;
      -[BMTextInputSession duration](self, "duration");
      v7 = v6;
      objc_msgSend(v5, "duration");
      if (v7 != v8)
        goto LABEL_19;
    }
    -[BMTextInputSession timestamp](self, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[BMTextInputSession timestamp](self, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_19;
    }
    -[BMTextInputSession bundleID](self, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMTextInputSession bundleID](self, "bundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_19;
    }
    v22 = -[BMTextInputSession sessionInput](self, "sessionInput");
    if (v22 == objc_msgSend(v5, "sessionInput"))
    {
      -[BMTextInputSession sessionID](self, "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 == v24)
      {
        v15 = 1;
      }
      else
      {
        -[BMTextInputSession sessionID](self, "sessionID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sessionID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v25, "isEqual:", v26);

      }
      goto LABEL_20;
    }
LABEL_19:
    v15 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v15 = 0;
LABEL_21:

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)sessionInput
{
  return self->_sessionInput;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4B6D0;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4B6D8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[9] = a4;

LABEL_7:
  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F3F0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("duration"), 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 2, 0, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionInput"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sessionID"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
