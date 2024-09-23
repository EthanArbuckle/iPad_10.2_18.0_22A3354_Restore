@implementation BMAirPlayPredictionFeedback

- (BMAirPlayPredictionFeedback)initWithType:(int)a3 outputDeviceID:(id)a4 subtype:(id)a5
{
  id v9;
  id v10;
  BMAirPlayPredictionFeedback *v11;
  objc_super v13;

  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMAirPlayPredictionFeedback;
  v11 = -[BMEventBase init](&v13, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_outputDeviceID, a4);
    objc_storeStrong((id *)&v11->_subtype, a5);
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
  BMAirPlayPredictionFeedbackTypeAsString(-[BMAirPlayPredictionFeedback type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAirPlayPredictionFeedback outputDeviceID](self, "outputDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAirPlayPredictionFeedback subtype](self, "subtype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAirPlayPredictionFeedback with type: %@, outputDeviceID: %@, subtype: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAirPlayPredictionFeedback *v5;
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
  uint64_t v27;
  void *v28;
  BMAirPlayPredictionFeedback *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMAirPlayPredictionFeedback;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_43;
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
      if ((v12 >> 3) == 3)
      {
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 32;
      }
      else
      {
        if ((_DWORD)v19 != 2)
        {
          if ((_DWORD)v19 == 1)
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
                goto LABEL_35;
              v20 += 7;
              v16 = v21++ >= 9;
              if (v16)
              {
                LODWORD(v22) = 0;
                goto LABEL_37;
              }
            }
            v4[*v8] = 1;
LABEL_35:
            if (v4[*v8])
              LODWORD(v22) = 0;
LABEL_37:
            if (v22 >= 5)
              LODWORD(v22) = 0;
            v5->_type = v22;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_42;
          }
          continue;
        }
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 24;
      }
      v28 = *(Class *)((char *)&v5->super.super.isa + v27);
      *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;

    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_42:
    v29 = 0;
  else
LABEL_43:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_outputDeviceID)
    PBDataWriterWriteStringField();
  if (self->_subtype)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAirPlayPredictionFeedback writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAirPlayPredictionFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BMAirPlayPredictionFeedback *v14;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputDeviceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v14 = 0;
          goto LABEL_17;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("outputDeviceID"));
        v28 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v16, 2, v12);
        v14 = 0;
        v11 = 0;
        *a4 = v17;
        goto LABEL_16;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtype"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("subtype"));
          v26 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v19);

        }
        v13 = 0;
        v14 = 0;
        goto LABEL_16;
      }
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    self = -[BMAirPlayPredictionFeedback initWithType:outputDeviceID:subtype:](self, "initWithType:outputDeviceID:subtype:", objc_msgSend(v8, "intValue"), v11, v13);
    v14 = self;
LABEL_16:

    goto LABEL_17;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAirPlayPredictionFeedbackTypeFromString(v7));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v21 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v14 = 0;
  *a4 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v10);
LABEL_17:

LABEL_18:
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAirPlayPredictionFeedback type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAirPlayPredictionFeedback outputDeviceID](self, "outputDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAirPlayPredictionFeedback subtype](self, "subtype");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("type");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("outputDeviceID");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("subtype");
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
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMAirPlayPredictionFeedback type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      -[BMAirPlayPredictionFeedback outputDeviceID](self, "outputDeviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outputDeviceID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMAirPlayPredictionFeedback outputDeviceID](self, "outputDeviceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "outputDeviceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[BMAirPlayPredictionFeedback subtype](self, "subtype");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subtype");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v13 = 1;
      }
      else
      {
        -[BMAirPlayPredictionFeedback subtype](self, "subtype");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subtype");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v16, "isEqual:", v17);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)type
{
  return self->_type;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
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

    v4 = -[BMAirPlayPredictionFeedback initByReadFrom:]([BMAirPlayPredictionFeedback alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("outputDeviceID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("subtype"), 2, 0, 3, 13, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1EC88;
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outputDeviceID"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("subtype"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
