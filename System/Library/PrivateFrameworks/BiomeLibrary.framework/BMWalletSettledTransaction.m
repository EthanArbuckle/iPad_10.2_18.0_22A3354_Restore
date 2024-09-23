@implementation BMWalletSettledTransaction

- (BMWalletSettledTransaction)initWithPassUniqueID:(id)a3 transactionID:(id)a4 merchantType:(int)a5 geoPOICategory:(id)a6
{
  id v11;
  id v12;
  id v13;
  BMWalletSettledTransaction *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMWalletSettledTransaction;
  v14 = -[BMEventBase init](&v16, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v14->_passUniqueID, a3);
    objc_storeStrong((id *)&v14->_transactionID, a4);
    v14->_merchantType = a5;
    objc_storeStrong((id *)&v14->_geoPOICategory, a6);
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
  -[BMWalletSettledTransaction passUniqueID](self, "passUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletSettledTransaction transactionID](self, "transactionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletSettledTransactionMerchantTypeAsString(-[BMWalletSettledTransaction merchantType](self, "merchantType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletSettledTransaction geoPOICategory](self, "geoPOICategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMWalletSettledTransaction with passUniqueID: %@, transactionID: %@, merchantType: %@, geoPOICategory: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMWalletSettledTransaction *v5;
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
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;
  BMWalletSettledTransaction *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMWalletSettledTransaction;
  v5 = -[BMEventBase init](&v30, sel_init);
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
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 24;
          goto LABEL_32;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_32;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          break;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
LABEL_32:
          v27 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_41;
          continue;
      }
      while (1)
      {
        v24 = *v6;
        v25 = *(_QWORD *)&v4[v24];
        if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
          break;
        v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
        *(_QWORD *)&v4[v24] = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_34;
        v21 += 7;
        v16 = v22++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_36;
        }
      }
      v4[*v8] = 1;
LABEL_34:
      if (v4[*v8])
        LODWORD(v23) = 0;
LABEL_36:
      if (v23 >= 8)
        LODWORD(v23) = 0;
      v5->_merchantType = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_41:
    v28 = 0;
  else
LABEL_42:
    v28 = v5;

  return v28;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_passUniqueID)
    PBDataWriterWriteStringField();
  if (self->_transactionID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_geoPOICategory)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMWalletSettledTransaction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMWalletSettledTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id *v11;
  BMWalletSettledTransaction *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  BMWalletSettledTransaction *v17;
  uint64_t v18;
  void *v19;
  id *v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passUniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v33 = 0;
          v17 = 0;
          goto LABEL_29;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v19 = v7;
        v20 = a4;
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("transactionID"));
        v40 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v18, 2, v10);
        v33 = 0;
        v17 = 0;
        *v20 = v21;
        v7 = v19;
        goto LABEL_28;
      }
      v33 = v9;
    }
    else
    {
      v33 = 0;
    }
    v32 = v7;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("merchantType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v13 = 0;
            v17 = 0;
            v7 = v32;
            goto LABEL_28;
          }
          v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v27 = *MEMORY[0x1E0D025B8];
          v37 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("merchantType"));
          v38 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v27, 2, v22);
          v13 = 0;
          v17 = 0;
          *v11 = v28;
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletSettledTransactionMerchantTypeFromString(v10));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v14;
    }
    else
    {
      v12 = self;
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("geoPOICategory"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v11)
        {
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v29 = *MEMORY[0x1E0D025B8];
          v35 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("geoPOICategory"));
          v36 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *v11 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v29, 2, v26);

        }
        v23 = 0;
        v17 = 0;
        goto LABEL_27;
      }
      v23 = v22;
    }
    else
    {
      v23 = 0;
    }
    v17 = -[BMWalletSettledTransaction initWithPassUniqueID:transactionID:merchantType:geoPOICategory:](v12, "initWithPassUniqueID:transactionID:merchantType:geoPOICategory:", v8, v33, objc_msgSend(v13, "intValue"), v23);
    v12 = v17;
LABEL_27:
    v7 = v32;

    self = v12;
LABEL_28:

    goto LABEL_29;
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
    v17 = 0;
    goto LABEL_30;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v41 = *MEMORY[0x1E0CB2D50];
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passUniqueID"));
  v42[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v17 = 0;
  *a4 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
LABEL_29:

LABEL_30:
  return v17;
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
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[BMWalletSettledTransaction passUniqueID](self, "passUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletSettledTransaction transactionID](self, "transactionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletSettledTransaction merchantType](self, "merchantType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletSettledTransaction geoPOICategory](self, "geoPOICategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("passUniqueID");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("transactionID");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("merchantType");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("geoPOICategory");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4)
        goto LABEL_12;
LABEL_16:

      if (v3)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v4)
    goto LABEL_16;
LABEL_12:
  if (!v3)
    goto LABEL_17;
LABEL_13:

  return v11;
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
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMWalletSettledTransaction passUniqueID](self, "passUniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passUniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMWalletSettledTransaction passUniqueID](self, "passUniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passUniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_14;
    }
    -[BMWalletSettledTransaction transactionID](self, "transactionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transactionID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMWalletSettledTransaction transactionID](self, "transactionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transactionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_14;
    }
    v19 = -[BMWalletSettledTransaction merchantType](self, "merchantType");
    if (v19 == objc_msgSend(v5, "merchantType"))
    {
      -[BMWalletSettledTransaction geoPOICategory](self, "geoPOICategory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "geoPOICategory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v21)
      {
        v12 = 1;
      }
      else
      {
        -[BMWalletSettledTransaction geoPOICategory](self, "geoPOICategory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "geoPOICategory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v22, "isEqual:", v23);

      }
      goto LABEL_17;
    }
LABEL_14:
    v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (int)merchantType
{
  return self->_merchantType;
}

- (NSString)geoPOICategory
{
  return self->_geoPOICategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoPOICategory, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
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

    v4 = -[BMWalletSettledTransaction initByReadFrom:]([BMWalletSettledTransaction alloc], "initByReadFrom:", v7);
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
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passUniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transactionID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("merchantType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("geoPOICategory"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1FE88;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passUniqueID"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transactionID"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("merchantType"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("geoPOICategory"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
