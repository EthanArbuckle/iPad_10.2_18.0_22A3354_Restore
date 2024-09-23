@implementation BMLighthouseTaskStatusPushMetadata

- (BMLighthouseTaskStatusPushMetadata)initWithTopic:(id)a3 channelID:(id)a4 pushType:(id)a5 pushPriority:(id)a6 creationDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMLighthouseTaskStatusPushMetadata *v17;
  double v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMLighthouseTaskStatusPushMetadata;
  v17 = -[BMEventBase init](&v21, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_topic, a3);
    objc_storeStrong((id *)&v17->_channelID, a4);
    objc_storeStrong((id *)&v17->_pushType, a5);
    objc_storeStrong((id *)&v17->_pushPriority, a6);
    if (v16)
    {
      v17->_hasRaw_creationDate = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_creationDate = 0;
      v18 = -1.0;
    }
    v17->_raw_creationDate = v18;
  }

  return v17;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMLighthouseTaskStatusPushMetadata topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata channelID](self, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata pushType](self, "pushType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata pushPriority](self, "pushPriority");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLighthouseTaskStatusPushMetadata with topic: %@, channelID: %@, pushType: %@, pushPriority: %@, creationDate: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLighthouseTaskStatusPushMetadata *v5;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  BMLighthouseTaskStatusPushMetadata *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMLighthouseTaskStatusPushMetadata;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_36;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
LABEL_26:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        case 5u:
          v5->_hasRaw_creationDate = 1;
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
          v5->_raw_creationDate = v25;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_35;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_35:
    v26 = 0;
  else
LABEL_36:
    v26 = v5;

  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_topic)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channelID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_pushType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_pushPriority)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRaw_creationDate)
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
  -[BMLighthouseTaskStatusPushMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLighthouseTaskStatusPushMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  id *v22;
  id v23;
  uint64_t v24;
  BMLighthouseTaskStatusPushMetadata *v25;
  id v26;
  uint64_t v27;
  id *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v35;
  void *v36;
  uint64_t v37;
  id *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  BMLighthouseTaskStatusPushMetadata *v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("channelID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v44 = 0;
          v25 = 0;
          goto LABEL_41;
        }
        v38 = a4;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v51 = *MEMORY[0x1E0CB2D50];
        v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("channelID"));
        v52 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        v25 = 0;
        *v38 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v10);
        goto LABEL_40;
      }
      v44 = v9;
    }
    else
    {
      v44 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pushType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v8;
    v43 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v42 = 0;
          v25 = 0;
          goto LABEL_40;
        }
        v28 = a4;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v49 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("pushType"));
        v50 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v25 = 0;
        *v28 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v11);
LABEL_39:

        self = v43;
        v8 = v41;
LABEL_40:

        goto LABEL_41;
      }
      v42 = v10;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pushPriority"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a4;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v13 = 0;
          v25 = 0;
          goto LABEL_39;
        }
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v47 = *MEMORY[0x1E0CB2D50];
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("pushPriority"));
        v48 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v31, 2, v14);
        v13 = 0;
        v25 = 0;
        *v12 = v32;
        goto LABEL_38;
      }
      v13 = v11;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (objc_class *)MEMORY[0x1E0C99D68];
        v17 = v14;
        v18 = [v16 alloc];
        objc_msgSend(v17, "doubleValue");
        v20 = v19;

        v21 = (id)objc_msgSend(v18, "initWithTimeIntervalSince1970:", v20);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v33, "dateFromString:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_37;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v12)
          {
            v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v37 = *MEMORY[0x1E0D025B8];
            v45 = *MEMORY[0x1E0CB2D50];
            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("creationDate"));
            v46 = v35;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *v12 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v37, 2, v36);

          }
          v15 = 0;
          v25 = 0;
          goto LABEL_38;
        }
        v21 = v14;
      }
      v15 = v21;
    }
    else
    {
      v15 = 0;
    }
LABEL_37:
    v25 = -[BMLighthouseTaskStatusPushMetadata initWithTopic:channelID:pushType:pushPriority:creationDate:](v43, "initWithTopic:channelID:pushType:pushPriority:creationDate:", v41, v44, v42, v13, v15);
    v43 = v25;
LABEL_38:

    goto LABEL_39;
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
    v25 = 0;
    goto LABEL_42;
  }
  v22 = a4;
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = *MEMORY[0x1E0D025B8];
  v53 = *MEMORY[0x1E0CB2D50];
  v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("topic"));
  v54[0] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v25 = 0;
  *v22 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v9);
LABEL_41:

LABEL_42:
  return v25;
}

- (id)jsonDictionary
{
  uint64_t v3;
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
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  -[BMLighthouseTaskStatusPushMetadata topic](self, "topic");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata channelID](self, "channelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata pushType](self, "pushType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata pushPriority](self, "pushPriority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLighthouseTaskStatusPushMetadata creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLighthouseTaskStatusPushMetadata creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  v18 = v3;
  v20[0] = CFSTR("topic");
  v11 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v11;
  v20[1] = CFSTR("channelID");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v12;
  v20[2] = CFSTR("pushType");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[2] = v13;
  v20[3] = CFSTR("pushPriority");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[3] = v14;
  v20[4] = CFSTR("creationDate");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v6)
      goto LABEL_16;
  }
  else
  {

    if (v6)
    {
LABEL_16:
      if (v5)
        goto LABEL_17;
LABEL_23:

      if (v4)
        goto LABEL_18;
      goto LABEL_24;
    }
  }

  if (!v5)
    goto LABEL_23;
LABEL_17:
  if (v4)
    goto LABEL_18;
LABEL_24:

LABEL_18:
  if (!v19)

  return v16;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_creationDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_creationDate);
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLighthouseTaskStatusPushMetadata topic](self, "topic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topic");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLighthouseTaskStatusPushMetadata topic](self, "topic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topic");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMLighthouseTaskStatusPushMetadata channelID](self, "channelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "channelID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLighthouseTaskStatusPushMetadata channelID](self, "channelID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "channelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMLighthouseTaskStatusPushMetadata pushType](self, "pushType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushType");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMLighthouseTaskStatusPushMetadata pushType](self, "pushType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pushType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMLighthouseTaskStatusPushMetadata pushPriority](self, "pushPriority");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushPriority");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMLighthouseTaskStatusPushMetadata pushPriority](self, "pushPriority");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pushPriority");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
      {
LABEL_17:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMLighthouseTaskStatusPushMetadata creationDate](self, "creationDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMLighthouseTaskStatusPushMetadata creationDate](self, "creationDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "creationDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v33, "isEqual:", v34);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)pushType
{
  return self->_pushType;
}

- (NSString)pushPriority
{
  return self->_pushPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushPriority, 0);
  objc_storeStrong((id *)&self->_pushType, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_topic, 0);
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

    v4 = -[BMLighthouseTaskStatusPushMetadata initByReadFrom:]([BMLighthouseTaskStatusPushMetadata alloc], "initByReadFrom:", v7);
    v4[8] = 0;

  }
  return v4;
}

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("topic"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("channelID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pushType"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pushPriority"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("creationDate"), 3, 0, 5, 0, 2);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E148;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("topic"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("channelID"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pushType"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pushPriority"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("creationDate"), 5, 0, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
