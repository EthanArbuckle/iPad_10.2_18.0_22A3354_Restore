@implementation BMMicroLocationTruthTag

- (BMMicroLocationTruthTag)initWithAbsoluteTimestamp:(id)a3 truthTagID:(id)a4 recordingRequestID:(id)a5 clientBundleID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMMicroLocationTruthTag *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMMicroLocationTruthTag;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v14->_hasRaw_absoluteTimestamp = 0;
      v15 = -1.0;
    }
    v14->_raw_absoluteTimestamp = v15;
    objc_storeStrong((id *)&v14->_truthTagID, a4);
    objc_storeStrong((id *)&v14->_recordingRequestID, a5);
    objc_storeStrong((id *)&v14->_clientBundleID, a6);
  }

  return v14;
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
  -[BMMicroLocationTruthTag absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationTruthTag truthTagID](self, "truthTagID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationTruthTag recordingRequestID](self, "recordingRequestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationTruthTag clientBundleID](self, "clientBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMicroLocationTruthTag with absoluteTimestamp: %@, truthTagID: %@, recordingRequestID: %@, clientBundleID: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMicroLocationTruthTag *v5;
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
  int v18;
  uint64_t v20;
  unint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BMMicroLocationTruthTag *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMMicroLocationTruthTag;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_34;
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
        if (v11++ >= 9)
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
          break;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 40;
          goto LABEL_28;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 48;
          goto LABEL_28;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
LABEL_28:
          v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_33;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_33:
    v26 = 0;
  else
LABEL_34:
    v26 = v5;

  return v26;
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
  if (self->_truthTagID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recordingRequestID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMicroLocationTruthTag writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMicroLocationTruthTag)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  BMMicroLocationTruthTag *v20;
  BMMicroLocationTruthTag *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id *v26;
  id v27;
  id *v28;
  void *v29;
  void *v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (objc_class *)MEMORY[0x1E0C99D68];
      v8 = v6;
      v9 = [v7 alloc];
      objc_msgSend(v8, "doubleValue");
      v11 = v10;

      v12 = (id)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:", v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v13, "dateFromString:", v6);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v38 = 0;
          v21 = 0;
          v20 = self;
          goto LABEL_36;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v45 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
        v46[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v21 = 0;
        *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v14);
        goto LABEL_44;
      }
      v12 = v6;
    }
    v38 = v12;
  }
  else
  {
    v38 = 0;
  }
LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("truthTagID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        goto LABEL_12;
      }
      if (a4)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v43 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("truthTagID"));
        v44 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v16);
        v21 = 0;
        v15 = 0;
        *a4 = v24;
        goto LABEL_41;
      }
      v15 = 0;
      v21 = 0;
LABEL_44:
      v20 = self;
      goto LABEL_35;
    }
  }
  v15 = 0;
LABEL_12:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recordingRequestID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = a4;
        v18 = v16;
        goto LABEL_15;
      }
      if (a4)
      {
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = *MEMORY[0x1E0D025B8];
        v41 = *MEMORY[0x1E0CB2D50];
        v17 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("recordingRequestID"));
        v42 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v26 = a4;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v25, 2, v19);
        v21 = 0;
        v18 = 0;
        *v26 = v27;
        goto LABEL_32;
      }
      v18 = 0;
      v21 = 0;
LABEL_41:
      v20 = self;
      goto LABEL_34;
    }
  }
  v17 = a4;
  v18 = 0;
LABEL_15:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientBundleID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v19;
        goto LABEL_18;
      }
      if (v17)
      {
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v28 = v17;
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientBundleID"));
        v40 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *v28 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v34, 2, v30);

        v17 = 0;
      }
      v21 = 0;
LABEL_32:
      v20 = self;
      goto LABEL_33;
    }
  }
  v17 = 0;
LABEL_18:
  v20 = -[BMMicroLocationTruthTag initWithAbsoluteTimestamp:truthTagID:recordingRequestID:clientBundleID:](self, "initWithAbsoluteTimestamp:truthTagID:recordingRequestID:clientBundleID:", v38, v15, v18, v17);
  v21 = v20;
LABEL_33:

LABEL_34:
LABEL_35:

LABEL_36:
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
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  -[BMMicroLocationTruthTag absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMicroLocationTruthTag absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMMicroLocationTruthTag truthTagID](self, "truthTagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationTruthTag recordingRequestID](self, "recordingRequestID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMicroLocationTruthTag clientBundleID](self, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("absoluteTimestamp");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v10;
  v16[1] = CFSTR("truthTagID");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v11;
  v16[2] = CFSTR("recordingRequestID");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v12;
  v16[3] = CFSTR("clientBundleID");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_14;
  }
  else
  {

    if (v8)
    {
LABEL_14:
      if (v7)
        goto LABEL_15;
LABEL_19:

      if (v6)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v7)
    goto LABEL_19;
LABEL_15:
  if (!v6)
    goto LABEL_20;
LABEL_16:

  return v14;
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMicroLocationTruthTag absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMicroLocationTruthTag absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMMicroLocationTruthTag truthTagID](self, "truthTagID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "truthTagID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMicroLocationTruthTag truthTagID](self, "truthTagID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "truthTagID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMMicroLocationTruthTag recordingRequestID](self, "recordingRequestID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordingRequestID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMMicroLocationTruthTag recordingRequestID](self, "recordingRequestID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordingRequestID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMMicroLocationTruthTag clientBundleID](self, "clientBundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientBundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v12 = 1;
    }
    else
    {
      -[BMMicroLocationTruthTag clientBundleID](self, "clientBundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientBundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)truthTagID
{
  return self->_truthTagID;
}

- (NSString)recordingRequestID
{
  return self->_recordingRequestID;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_recordingRequestID, 0);
  objc_storeStrong((id *)&self->_truthTagID, 0);
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

    v7 = -[BMMicroLocationTruthTag initByReadFrom:]([BMMicroLocationTruthTag alloc], "initByReadFrom:", v6);
    v7[8] = 1;

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
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("truthTagID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("recordingRequestID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientBundleID"), 2, 0, 4, 13, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F4E0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("truthTagID"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("recordingRequestID"), 3, 13, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientBundleID"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
