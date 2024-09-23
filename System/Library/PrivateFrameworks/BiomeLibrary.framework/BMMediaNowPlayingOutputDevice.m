@implementation BMMediaNowPlayingOutputDevice

- (BMMediaNowPlayingOutputDevice)initWithType:(int)a3 subType:(int)a4 outputDeviceID:(id)a5
{
  id v9;
  BMMediaNowPlayingOutputDevice *v10;
  objc_super v12;

  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BMMediaNowPlayingOutputDevice;
  v10 = -[BMEventBase init](&v12, sel_init);
  if (v10)
  {
    v10->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v10->_type = a3;
    v10->_subType = a4;
    objc_storeStrong((id *)&v10->_outputDeviceID, a5);
  }

  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMediaNowPlayingOutputDeviceTypeAsString(-[BMMediaNowPlayingOutputDevice type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaNowPlayingOutputDeviceSubTypeAsString(-[BMMediaNowPlayingOutputDevice subType](self, "subType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlayingOutputDevice outputDeviceID](self, "outputDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMediaNowPlayingOutputDevice with type: %@, subType: %@, outputDeviceID: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMediaNowPlayingOutputDevice *v5;
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
  NSString *outputDeviceID;
  uint64_t v36;
  BMMediaNowPlayingOutputDevice *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMMediaNowPlayingOutputDevice;
  v5 = -[BMEventBase init](&v39, sel_init);
  if (!v5)
    goto LABEL_55;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v8])
        goto LABEL_53;
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
        goto LABEL_53;
      v20 = v12 >> 3;
      if ((v12 >> 3) == 1)
        break;
      if ((_DWORD)v20 != 3)
      {
        if ((_DWORD)v20 != 2)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_54;
          goto LABEL_52;
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
            goto LABEL_40;
          v21 += 7;
          v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8])
          LODWORD(v23) = 0;
LABEL_42:
        if (v23 >= 0x15)
          LODWORD(v23) = 0;
        v36 = 24;
        goto LABEL_51;
      }
      PBReaderReadString();
      v34 = objc_claimAutoreleasedReturnValue();
      outputDeviceID = v5->_outputDeviceID;
      v5->_outputDeviceID = (NSString *)v34;

LABEL_52:
      if (*(_QWORD *)&v4[*v6] >= *(_QWORD *)&v4[*v7])
        goto LABEL_53;
    }
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
        goto LABEL_46;
      v28 += 7;
      v17 = v29++ >= 9;
      if (v17)
      {
        LODWORD(v23) = 0;
        goto LABEL_48;
      }
    }
    v4[*v8] = 1;
LABEL_46:
    if (v4[*v8])
      LODWORD(v23) = 0;
LABEL_48:
    if (v23 >= 6)
      LODWORD(v23) = 0;
    v36 = 20;
LABEL_51:
    *(_DWORD *)((char *)&v5->super.super.isa + v36) = v23;
    goto LABEL_52;
  }
LABEL_53:
  if (v4[*v8])
LABEL_54:
    v37 = 0;
  else
LABEL_55:
    v37 = v5;

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_outputDeviceID)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMediaNowPlayingOutputDevice writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMediaNowPlayingOutputDevice)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BMMediaNowPlayingOutputDevice *v15;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subType"));
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
            v15 = 0;
            goto LABEL_22;
          }
          v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v21 = *MEMORY[0x1E0D025B8];
          v28 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("subType"));
          v29 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v21, 2, v13);
          v11 = 0;
          v15 = 0;
          *a4 = v22;
          goto LABEL_21;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaNowPlayingOutputDeviceSubTypeFromString(v10));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v12;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputDeviceID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v23 = *MEMORY[0x1E0D025B8];
          v26 = *MEMORY[0x1E0CB2D50];
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("outputDeviceID"));
          v27 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v23, 2, v18);

        }
        v14 = 0;
        v15 = 0;
        goto LABEL_21;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    self = -[BMMediaNowPlayingOutputDevice initWithType:subType:outputDeviceID:](self, "initWithType:subType:outputDeviceID:", objc_msgSend(v8, "intValue"), objc_msgSend(v11, "intValue"), v14);
    v15 = self;
LABEL_21:

    goto LABEL_22;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaNowPlayingOutputDeviceTypeFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v15 = 0;
    goto LABEL_23;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v30 = *MEMORY[0x1E0CB2D50];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
  v31[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v15 = 0;
  *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v10);
LABEL_22:

LABEL_23:
  return v15;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaNowPlayingOutputDevice type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaNowPlayingOutputDevice subType](self, "subType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlayingOutputDevice outputDeviceID](self, "outputDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("type");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("subType");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("outputDeviceID");
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
      goto LABEL_9;
LABEL_12:

    if (v3)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v4)
    goto LABEL_12;
LABEL_9:
  if (!v3)
    goto LABEL_13;
LABEL_10:

  return v9;
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
    v6 = -[BMMediaNowPlayingOutputDevice type](self, "type");
    if (v6 == objc_msgSend(v5, "type")
      && (v7 = -[BMMediaNowPlayingOutputDevice subType](self, "subType"), v7 == objc_msgSend(v5, "subType")))
    {
      -[BMMediaNowPlayingOutputDevice outputDeviceID](self, "outputDeviceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outputDeviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        -[BMMediaNowPlayingOutputDevice outputDeviceID](self, "outputDeviceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "outputDeviceID");
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

- (int)type
{
  return self->_type;
}

- (int)subType
{
  return self->_subType;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
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

    v7 = -[BMMediaNowPlayingOutputDevice initByReadFrom:]([BMMediaNowPlayingOutputDevice alloc], "initByReadFrom:", v6);
    v7[4] = 1;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("outputDeviceID"), 2, 0, 3, 13, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AED8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subType"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outputDeviceID"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
