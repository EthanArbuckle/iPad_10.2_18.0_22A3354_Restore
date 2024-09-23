@implementation BMIntelligencePlatformEmailMessageIds

- (BMIntelligencePlatformEmailMessageIds)initWithCreationTimeStamp:(id)a3 classifierType:(id)a4 messageUUID:(id)a5 messageSourceType:(int)a6
{
  id v10;
  id v11;
  id v12;
  BMIntelligencePlatformEmailMessageIds *v13;
  double v14;
  uint64_t v15;
  NSData *raw_messageUUID;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BMIntelligencePlatformEmailMessageIds;
  v13 = -[BMEventBase init](&v18, sel_init);
  if (v13)
  {
    v13->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v13->_hasRaw_creationTimeStamp = 1;
      objc_msgSend(v10, "timeIntervalSince1970");
    }
    else
    {
      v13->_hasRaw_creationTimeStamp = 0;
      v14 = -1.0;
    }
    v13->_raw_creationTimeStamp = v14;
    objc_storeStrong((id *)&v13->_classifierType, a4);
    if (v12)
    {
      v19[0] = 0;
      v19[1] = 0;
      objc_msgSend(v12, "getUUIDBytes:", v19);
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v19, 16);
      raw_messageUUID = v13->_raw_messageUUID;
      v13->_raw_messageUUID = (NSData *)v15;
    }
    else
    {
      raw_messageUUID = v13->_raw_messageUUID;
      v13->_raw_messageUUID = 0;
    }

    v13->_messageSourceType = a6;
  }

  return v13;
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
  -[BMIntelligencePlatformEmailMessageIds creationTimeStamp](self, "creationTimeStamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformEmailMessageIds classifierType](self, "classifierType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformEmailMessageIds messageUUID](self, "messageUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMIntelligencePlatformEmailMessageIdsSourceTypeAsString(-[BMIntelligencePlatformEmailMessageIds messageSourceType](self, "messageSourceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformEmailMessageIds with creationTimeStamp: %@, classifierType: %@, messageUUID: %@, messageSourceType: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformEmailMessageIds *v5;
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
  uint64_t v23;
  NSData *classifierType;
  NSData *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  BMIntelligencePlatformEmailMessageIds *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMIntelligencePlatformEmailMessageIds;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
  {
LABEL_47:
    v33 = v5;
    goto LABEL_48;
  }
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_45:
    if (v4[*v8])
      goto LABEL_46;
    goto LABEL_47;
  }
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v8])
      goto LABEL_45;
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
      goto LABEL_45;
    switch((v12 >> 3))
    {
      case 1u:
        v5->_hasRaw_creationTimeStamp = 1;
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
        v5->_raw_creationTimeStamp = v22;
        goto LABEL_44;
      case 2u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        classifierType = (NSData *)v5->_classifierType;
        v5->_classifierType = (NSString *)v23;
        goto LABEL_28;
      case 3u:
        PBReaderReadData();
        v25 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (-[NSData length](v25, "length") == 16)
        {
          classifierType = v5->_raw_messageUUID;
          v5->_raw_messageUUID = v25;
LABEL_28:

LABEL_44:
          if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
            goto LABEL_45;
          continue;
        }

LABEL_46:
        v33 = 0;
LABEL_48:

        return v33;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        while (2)
        {
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              v17 = v27++ >= 9;
              if (v17)
              {
                LODWORD(v28) = 0;
                goto LABEL_39;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8])
          LODWORD(v28) = 0;
LABEL_39:
        if (v28 >= 3)
          LODWORD(v28) = 0;
        v5->_messageSourceType = v28;
        goto LABEL_44;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_46;
        goto LABEL_44;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_creationTimeStamp)
    PBDataWriterWriteDoubleField();
  if (self->_classifierType)
    PBDataWriterWriteStringField();
  if (self->_raw_messageUUID)
    PBDataWriterWriteDataField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMIntelligencePlatformEmailMessageIds writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformEmailMessageIds)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  BMIntelligencePlatformEmailMessageIds *v24;
  BMIntelligencePlatformEmailMessageIds *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  id v40;
  id *v41;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("creationTimeStamp"));
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

      v12 = (id)objc_msgSend(v9, "initWithTimeIntervalSince1970:", v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v13, "dateFromString:", v6);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v43 = 0;
          v24 = 0;
          v25 = self;
          goto LABEL_37;
        }
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v38 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("creationTimeStamp"));
        v53[0] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
        v24 = 0;
        *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v14);
        a4 = v38;
        goto LABEL_51;
      }
      v12 = v6;
    }
    v43 = v12;
  }
  else
  {
    v43 = 0;
  }
LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("classifierType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = 0;
LABEL_12:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = 0;
LABEL_15:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageSourceType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v17;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v39 = *MEMORY[0x1E0D025B8];
              v44 = *MEMORY[0x1E0CB2D50];
              v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("messageSourceType"));
              v45 = v30;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v39, 2, v31);

            }
            v18 = 0;
            v24 = 0;
            a4 = v41;
            v25 = self;
            goto LABEL_33;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMIntelligencePlatformEmailMessageIdsSourceTypeFromString(v17));
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v21;
      }
      else
      {
        v18 = 0;
      }
      a4 = v41;
      v25 = -[BMIntelligencePlatformEmailMessageIds initWithCreationTimeStamp:classifierType:messageUUID:messageSourceType:](self, "initWithCreationTimeStamp:classifierType:messageUUID:messageSourceType:", v43, v41, v16, objc_msgSend(v18, "intValue"));
      v24 = v25;
LABEL_33:

      goto LABEL_34;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v16);
      if (v19)
      {
        v20 = (void *)v19;

        v16 = v20;
        goto LABEL_15;
      }
      if (a4)
      {
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v48 = *MEMORY[0x1E0CB2D50];
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("messageUUID"));
        v49 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v35);

      }
      v24 = 0;
      v15 = v16;
    }
    else
    {
      if (!a4)
      {
        v24 = 0;
        a4 = v41;
        v25 = self;
        goto LABEL_35;
      }
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v27 = *MEMORY[0x1E0D025B8];
      v46 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("messageUUID"));
      v47 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v28);

      v24 = 0;
    }
    a4 = v41;
    v25 = self;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v14;
    goto LABEL_12;
  }
  if (!a4)
  {
    v24 = 0;
LABEL_51:
    v25 = self;
    goto LABEL_36;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v23 = *MEMORY[0x1E0D025B8];
  v50 = *MEMORY[0x1E0CB2D50];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("classifierType"));
  v51 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  *a4 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v16);
  a4 = 0;
  v25 = self;
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
  return v24;
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
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[BMIntelligencePlatformEmailMessageIds creationTimeStamp](self, "creationTimeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMIntelligencePlatformEmailMessageIds creationTimeStamp](self, "creationTimeStamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMIntelligencePlatformEmailMessageIds classifierType](self, "classifierType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformEmailMessageIds messageUUID](self, "messageUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMIntelligencePlatformEmailMessageIds messageSourceType](self, "messageSourceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("creationTimeStamp");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v11;
  v17[1] = CFSTR("classifierType");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v12;
  v17[2] = CFSTR("messageUUID");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v13;
  v17[3] = CFSTR("messageSourceType");
  v14 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_14;
  }
  else
  {

    if (v9)
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

  return v15;
}

- (NSDate)creationTimeStamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_creationTimeStamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_creationTimeStamp);
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

- (NSUUID)messageUUID
{
  NSData *raw_messageUUID;
  void *v3;

  raw_messageUUID = self->_raw_messageUUID;
  if (raw_messageUUID)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_messageUUID, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
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
  int v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMIntelligencePlatformEmailMessageIds creationTimeStamp](self, "creationTimeStamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationTimeStamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMIntelligencePlatformEmailMessageIds creationTimeStamp](self, "creationTimeStamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "creationTimeStamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMIntelligencePlatformEmailMessageIds classifierType](self, "classifierType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classifierType");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMIntelligencePlatformEmailMessageIds classifierType](self, "classifierType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "classifierType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMIntelligencePlatformEmailMessageIds messageUUID](self, "messageUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageUUID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMIntelligencePlatformEmailMessageIds messageUUID](self, "messageUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v25 = -[BMIntelligencePlatformEmailMessageIds messageSourceType](self, "messageSourceType");
    v12 = v25 == objc_msgSend(v5, "messageSourceType");
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)classifierType
{
  return self->_classifierType;
}

- (int)messageSourceType
{
  return self->_messageSourceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifierType, 0);
  objc_storeStrong((id *)&self->_raw_messageUUID, 0);
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

    v4 = -[BMIntelligencePlatformEmailMessageIds initByReadFrom:]([BMIntelligencePlatformEmailMessageIds alloc], "initByReadFrom:", v7);
    v4[10] = 0;

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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("creationTimeStamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("classifierType"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageUUID"), 6, 0, 3, 14, 3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("messageSourceType"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1A5C0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("creationTimeStamp"), 1, 0, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("classifierType"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageUUID"), 3, 14, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("messageSourceType"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
