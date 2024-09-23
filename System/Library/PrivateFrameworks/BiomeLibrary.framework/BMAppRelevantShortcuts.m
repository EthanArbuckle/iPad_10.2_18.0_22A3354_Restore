@implementation BMAppRelevantShortcuts

- (BMAppRelevantShortcuts)initWithBundleID:(id)a3 keyImageProxyIdentifier:(id)a4 serializedRelevantShortcut:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMAppRelevantShortcuts *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMAppRelevantShortcuts;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_bundleID, a3);
    objc_storeStrong((id *)&v12->_keyImageProxyIdentifier, a4);
    objc_storeStrong((id *)&v12->_serializedRelevantShortcut, a5);
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppRelevantShortcuts bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppRelevantShortcuts keyImageProxyIdentifier](self, "keyImageProxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppRelevantShortcuts serializedRelevantShortcut](self, "serializedRelevantShortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppRelevantShortcuts with bundleID: %@, keyImageProxyIdentifier: %@, serializedRelevantShortcut: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppRelevantShortcuts *v5;
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
  int v17;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BMAppRelevantShortcuts *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMAppRelevantShortcuts;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_30;
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
        if (v11++ >= 9)
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
        PBReaderReadData();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 40;
      }
      else if ((_DWORD)v19 == 2)
      {
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 32;
      }
      else
      {
        if ((_DWORD)v19 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_29;
          continue;
        }
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 24;
      }
      v22 = *(Class *)((char *)&v5->super.super.isa + v21);
      *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_29:
    v23 = 0;
  else
LABEL_30:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_keyImageProxyIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_serializedRelevantShortcut)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppRelevantShortcuts writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppRelevantShortcuts)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMAppRelevantShortcuts *v13;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keyImageProxyIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v13 = 0;
          goto LABEL_12;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("keyImageProxyIdentifier"));
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v18, 2, v11);
        v13 = 0;
        v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serializedRelevantShortcut"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v22 = *MEMORY[0x1E0D025B8];
          v25 = *MEMORY[0x1E0CB2D50];
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("serializedRelevantShortcut"));
          v26 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v21);

        }
        v12 = 0;
        v13 = 0;
        goto LABEL_11;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMAppRelevantShortcuts initWithBundleID:keyImageProxyIdentifier:serializedRelevantShortcut:](self, "initWithBundleID:keyImageProxyIdentifier:serializedRelevantShortcut:", v8, v10, v12);
    v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v13 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
  v13 = 0;
  v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
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
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[BMAppRelevantShortcuts bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppRelevantShortcuts keyImageProxyIdentifier](self, "keyImageProxyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppRelevantShortcuts serializedRelevantShortcut](self, "serializedRelevantShortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("bundleID");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v7;
  v12[1] = CFSTR("keyImageProxyIdentifier");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v8;
  v12[2] = CFSTR("serializedRelevantShortcut");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
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

  return v10;
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
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppRelevantShortcuts bundleID](self, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppRelevantShortcuts bundleID](self, "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMAppRelevantShortcuts keyImageProxyIdentifier](self, "keyImageProxyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyImageProxyIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppRelevantShortcuts keyImageProxyIdentifier](self, "keyImageProxyIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyImageProxyIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMAppRelevantShortcuts serializedRelevantShortcut](self, "serializedRelevantShortcut");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serializedRelevantShortcut");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppRelevantShortcuts serializedRelevantShortcut](self, "serializedRelevantShortcut");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serializedRelevantShortcut");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)keyImageProxyIdentifier
{
  return self->_keyImageProxyIdentifier;
}

- (NSData)serializedRelevantShortcut
{
  return self->_serializedRelevantShortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedRelevantShortcut, 0);
  objc_storeStrong((id *)&self->_keyImageProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
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

    v4 = -[BMAppRelevantShortcuts initByReadFrom:]([BMAppRelevantShortcuts alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("keyImageProxyIdentifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("serializedRelevantShortcut"), 4, 0, 3, 14, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1ED48;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("keyImageProxyIdentifier"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("serializedRelevantShortcut"), 3, 14, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
