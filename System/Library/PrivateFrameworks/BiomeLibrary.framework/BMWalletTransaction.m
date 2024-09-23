@implementation BMWalletTransaction

- (BMWalletTransaction)initWithPassUniqueID:(id)a3 passLocalizedDescription:(id)a4 transactionType:(int)a5 transactionID:(id)a6 merchantType:(int)a7 poiCategory:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMWalletTransaction *v18;
  objc_super v21;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMWalletTransaction;
  v18 = -[BMEventBase init](&v21, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_passUniqueID, a3);
    objc_storeStrong((id *)&v18->_passLocalizedDescription, a4);
    v18->_transactionType = a5;
    objc_storeStrong((id *)&v18->_transactionID, a6);
    v18->_merchantType = a7;
    objc_storeStrong((id *)&v18->_poiCategory, a8);
  }

  return v18;
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
  -[BMWalletTransaction passUniqueID](self, "passUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletTransactionTypeAsString(-[BMWalletTransaction transactionType](self, "transactionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletTransaction transactionID](self, "transactionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletTransactionMerchantTypeAsString(-[BMWalletTransaction merchantType](self, "merchantType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletTransaction poiCategory](self, "poiCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMWalletTransaction with passUniqueID: %@, passLocalizedDescription: %@, transactionType: %@, transactionID: %@, merchantType: %@, poiCategory: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMWalletTransaction *v5;
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
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  uint64_t v33;
  BMWalletTransaction *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMWalletTransaction;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_57;
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
          v20 = 32;
          goto LABEL_40;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_40;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_44:
          if (v23 >= 7)
            LODWORD(v23) = 0;
          v33 = 20;
          goto LABEL_53;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_40;
        case 5u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          break;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
LABEL_40:
          v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_56;
          continue;
      }
      while (1)
      {
        v29 = *v6;
        v30 = *(_QWORD *)&v4[v29];
        if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
          break;
        v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
        *(_QWORD *)&v4[v29] = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0)
          goto LABEL_48;
        v27 += 7;
        v16 = v28++ >= 9;
        if (v16)
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
      if (v23 >= 8)
        LODWORD(v23) = 0;
      v33 = 24;
LABEL_53:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_56:
    v34 = 0;
  else
LABEL_57:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_passUniqueID)
    PBDataWriterWriteStringField();
  if (self->_passLocalizedDescription)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_transactionID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_poiCategory)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMWalletTransaction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMWalletTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  BMWalletTransaction *v16;
  id v17;
  id v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  id *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  BMWalletTransaction *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passUniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passLocalizedDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v14 = 0;
          v16 = 0;
          goto LABEL_46;
        }
        v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v18 = v8;
        v19 = *MEMORY[0x1E0D025B8];
        v58 = *MEMORY[0x1E0CB2D50];
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passLocalizedDescription"));
        v59 = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v20 = a4;
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v19;
        v8 = v18;
        v14 = 0;
        v16 = 0;
        *v20 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v21, 2, v10);
        goto LABEL_45;
      }
      v46 = v9;
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v47 = 0;
            v16 = 0;
            v14 = v46;
            goto LABEL_45;
          }
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = v8;
          v34 = *MEMORY[0x1E0D025B8];
          v56 = *MEMORY[0x1E0CB2D50];
          v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("transactionType"));
          v57 = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          v8 = v33;
          v36 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v35, 2, v22);
          v47 = 0;
          v16 = 0;
          *v42 = v36;
LABEL_44:
          v14 = v46;

          self = v49;
LABEL_45:

          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletTransactionTypeFromString(v10));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v47 = v11;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v8;
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v42)
        {
          v44 = 0;
          v16 = 0;
          goto LABEL_44;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v54 = *MEMORY[0x1E0CB2D50];
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("transactionID"));
        v55 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v26, 2, v23);
        v44 = 0;
        v16 = 0;
        *v42 = v27;
        goto LABEL_43;
      }
      v44 = v22;
    }
    else
    {
      v44 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("merchantType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v24 = 0;
            v16 = 0;
            goto LABEL_43;
          }
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v52 = *MEMORY[0x1E0CB2D50];
          v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("merchantType"));
          v53 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v28);
          v24 = 0;
          v16 = 0;
          *v42 = v39;
          goto LABEL_42;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletTransactionMerchantTypeFromString(v23));
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = v25;
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("poiCategory"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v42)
        {
          v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v50 = *MEMORY[0x1E0CB2D50];
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("poiCategory"));
          v51 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *v42 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v40, 2, v32);

        }
        v29 = 0;
        v16 = 0;
        goto LABEL_42;
      }
      v29 = v28;
    }
    else
    {
      v29 = 0;
    }
    v16 = -[BMWalletTransaction initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:](v49, "initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", v43, v46, objc_msgSend(v47, "intValue"), v44, objc_msgSend(v24, "intValue"), v29);
    v49 = v16;
LABEL_42:

LABEL_43:
    v8 = v43;
    goto LABEL_44;
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
    v16 = 0;
    goto LABEL_47;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v13 = *MEMORY[0x1E0D025B8];
  v60 = *MEMORY[0x1E0CB2D50];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passUniqueID"));
  v61[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 2, v9);
  v8 = 0;
  v16 = 0;
  *a4 = v15;
LABEL_46:

LABEL_47:
  return v16;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  -[BMWalletTransaction passUniqueID](self, "passUniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletTransaction transactionType](self, "transactionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletTransaction transactionID](self, "transactionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletTransaction merchantType](self, "merchantType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWalletTransaction poiCategory](self, "poiCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("passUniqueID");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v9;
  v21 = (void *)v4;
  v23[0] = v9;
  v22[1] = CFSTR("passLocalizedDescription");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v10;
  v23[1] = v10;
  v22[2] = CFSTR("transactionType");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v11;
  v22[3] = CFSTR("transactionID");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v3;
  v23[3] = v12;
  v22[4] = CFSTR("merchantType");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v14;
  v22[5] = CFSTR("poiCategory");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_15;
  }
  else
  {

    if (v7)
    {
LABEL_15:
      if (v6)
        goto LABEL_16;
LABEL_22:

      if (v5)
        goto LABEL_17;
      goto LABEL_23;
    }
  }

  if (!v6)
    goto LABEL_22;
LABEL_16:
  if (v5)
    goto LABEL_17;
LABEL_23:

LABEL_17:
  if (!v21)
  {

    if (v13)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }
  if (!v13)
    goto LABEL_25;
LABEL_19:

  return v16;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMWalletTransaction passUniqueID](self, "passUniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passUniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMWalletTransaction passUniqueID](self, "passUniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passUniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_19;
    }
    -[BMWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passLocalizedDescription");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passLocalizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_19;
    }
    v19 = -[BMWalletTransaction transactionType](self, "transactionType");
    if (v19 == objc_msgSend(v5, "transactionType"))
    {
      -[BMWalletTransaction transactionID](self, "transactionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transactionID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMWalletTransaction transactionID](self, "transactionID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "transactionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_19;
      }
      v26 = -[BMWalletTransaction merchantType](self, "merchantType");
      if (v26 == objc_msgSend(v5, "merchantType"))
      {
        -[BMWalletTransaction poiCategory](self, "poiCategory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "poiCategory");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27 == v28)
        {
          v12 = 1;
        }
        else
        {
          -[BMWalletTransaction poiCategory](self, "poiCategory");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "poiCategory");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v29, "isEqual:", v30);

        }
        goto LABEL_20;
      }
    }
LABEL_19:
    v12 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v12 = 0;
LABEL_21:

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

- (NSString)passLocalizedDescription
{
  return self->_passLocalizedDescription;
}

- (int)transactionType
{
  return self->_transactionType;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (int)merchantType
{
  return self->_merchantType;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_passLocalizedDescription, 0);
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

    v4 = -[BMWalletTransaction initByReadFrom:]([BMWalletTransaction alloc], "initByReadFrom:", v7);
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
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passUniqueID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passLocalizedDescription"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transactionType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transactionID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("merchantType"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("poiCategory"), 2, 0, 6, 13, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AC08;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passUniqueID"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passLocalizedDescription"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transactionType"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transactionID"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("merchantType"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("poiCategory"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BMWalletTransaction)initWithPassUniqueID:(id)a3 passLocalizedDescription:(id)a4 transactionType:(int)a5 transactionID:(id)a6
{
  return -[BMWalletTransaction initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:](self, "initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", a3, a4, *(_QWORD *)&a5, a6, 0, 0);
}

@end
