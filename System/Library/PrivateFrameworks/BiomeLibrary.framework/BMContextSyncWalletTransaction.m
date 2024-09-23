@implementation BMContextSyncWalletTransaction

- (BMContextSyncWalletTransaction)initWithID:(id)a3 deviceUUID:(id)a4 passUniqueID:(id)a5 passLocalizedDescription:(id)a6 transactionType:(int)a7 transactionID:(id)a8 merchantType:(int)a9 poiCategory:(id)a10
{
  id v16;
  id v17;
  id v18;
  BMContextSyncWalletTransaction *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v17 = a8;
  v18 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMContextSyncWalletTransaction;
  v19 = -[BMEventBase init](&v25, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v19->_ID, a3);
    objc_storeStrong((id *)&v19->_deviceUUID, a4);
    objc_storeStrong((id *)&v19->_passUniqueID, a5);
    objc_storeStrong((id *)&v19->_passLocalizedDescription, a6);
    v19->_transactionType = a7;
    objc_storeStrong((id *)&v19->_transactionID, a8);
    v19->_merchantType = a9;
    objc_storeStrong((id *)&v19->_poiCategory, a10);
  }

  return v19;
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
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMContextSyncWalletTransaction ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction passUniqueID](self, "passUniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMContextSyncWalletTransactionTypeAsString(-[BMContextSyncWalletTransaction transactionType](self, "transactionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction transactionID](self, "transactionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMContextSyncWalletTransactionMerchantTypeAsString(-[BMContextSyncWalletTransaction merchantType](self, "merchantType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction poiCategory](self, "poiCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextSyncWalletTransaction with ID: %@, deviceUUID: %@, passUniqueID: %@, passLocalizedDescription: %@, transactionType: %@, transactionID: %@, merchantType: %@, poiCategory: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextSyncWalletTransaction *v5;
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
  BMContextSyncWalletTransaction *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMContextSyncWalletTransaction;
  v5 = -[BMEventBase init](&v36, sel_init);
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
          goto LABEL_42;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_42;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_42;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_42;
        case 5u:
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
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_46:
          if (v23 >= 7)
            LODWORD(v23) = 0;
          v33 = 20;
          goto LABEL_55;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_42;
        case 7u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          break;
        case 8u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
LABEL_42:
          v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_58;
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
          goto LABEL_50;
        v27 += 7;
        v16 = v28++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_52;
        }
      }
      v4[*v8] = 1;
LABEL_50:
      if (v4[*v8])
        LODWORD(v23) = 0;
LABEL_52:
      if (v23 >= 8)
        LODWORD(v23) = 0;
      v33 = 24;
LABEL_55:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_58:
    v34 = 0;
  else
LABEL_59:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_ID)
    PBDataWriterWriteStringField();
  if (self->_deviceUUID)
    PBDataWriterWriteStringField();
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
  -[BMContextSyncWalletTransaction writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextSyncWalletTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  BMContextSyncWalletTransaction *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BMContextSyncWalletTransaction *v20;
  void *v21;
  id *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  id *v60;
  id *v61;
  id *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v25 = 0;
          goto LABEL_66;
        }
        v61 = a4;
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v84 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceUUID"));
        v85 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v28;
        v11 = (void *)v29;
        v31 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v30, 2, v29);
        v25 = 0;
        a4 = 0;
        *v61 = v31;
        goto LABEL_65;
      }
      v71 = v9;
    }
    else
    {
      v71 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passUniqueID"));
    v10 = objc_claimAutoreleasedReturnValue();
    v70 = v7;
    v65 = (void *)v10;
    if (v10 && (v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          v25 = v71;
          goto LABEL_65;
        }
        v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v62 = a4;
        v33 = *MEMORY[0x1E0D025B8];
        v82 = *MEMORY[0x1E0CB2D50];
        v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passUniqueID"));
        v83 = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v33, 2, v34);
        v15 = 0;
        a4 = 0;
        *v62 = v35;
        v25 = v71;
LABEL_64:

        v11 = v65;
LABEL_65:

        goto LABEL_66;
      }
      v12 = v8;
      v13 = v9;
      v14 = self;
      v15 = v11;
    }
    else
    {
      v12 = v8;
      v13 = v9;
      v14 = self;
      v15 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passLocalizedDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v15;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v69 = 0;
          v34 = v16;
          self = v14;
          v9 = v13;
          v8 = v12;
          v7 = v70;
          v25 = v71;
          goto LABEL_64;
        }
        v36 = a4;
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v38 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("passLocalizedDescription"));
        v81 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v34 = v16;
        v40 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v39, 2, v17);
        v69 = 0;
        a4 = 0;
        *v36 = v40;
        self = v14;
        v9 = v13;
        v8 = v12;
        v7 = v70;
        v25 = v71;
        goto LABEL_63;
      }
      v59 = v16;
      v69 = v16;
    }
    else
    {
      v59 = v16;
      v69 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self = v14;
    v60 = a4;
    if (v17)
    {
      objc_opt_class();
      v9 = v13;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        v8 = v12;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          v7 = v70;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v66 = 0;
              v25 = v71;
              v34 = v59;
              goto LABEL_63;
            }
            v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v51 = *MEMORY[0x1E0D025B8];
            v78 = *MEMORY[0x1E0CB2D50];
            v64 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("transactionType"));
            v79 = v64;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v18);
            v66 = 0;
            a4 = 0;
            *v60 = v52;
LABEL_62:
            v34 = v59;

            v25 = v71;
LABEL_63:

            v15 = v67;
            goto LABEL_64;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextSyncWalletTransactionTypeFromString(v17));
          v66 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transactionID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v8;
          if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v64 = 0;
                goto LABEL_61;
              }
              v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v42 = *MEMORY[0x1E0D025B8];
              v76 = *MEMORY[0x1E0CB2D50];
              v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("transactionID"));
              v77 = v21;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v19);
              v64 = 0;
              a4 = 0;
              *v60 = v43;
LABEL_60:

LABEL_61:
              v8 = v63;
              goto LABEL_62;
            }
            v64 = v18;
          }
          else
          {
            v64 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("merchantType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v20 = self;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = v19;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v21 = 0;
                  a4 = 0;
                  goto LABEL_59;
                }
                v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v53 = *MEMORY[0x1E0D025B8];
                v74 = *MEMORY[0x1E0CB2D50];
                v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("merchantType"));
                v75 = v45;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v53, 2, v44);
                v21 = 0;
                a4 = 0;
                *v60 = v54;
                goto LABEL_58;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextSyncWalletTransactionMerchantTypeFromString(v19));
              v32 = (id)objc_claimAutoreleasedReturnValue();
            }
            v21 = v32;
          }
          else
          {
            v20 = self;
            v21 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("poiCategory"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v56 = *MEMORY[0x1E0D025B8];
                v72 = *MEMORY[0x1E0CB2D50];
                v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("poiCategory"));
                v73 = v48;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *v60 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v56, 2, v49);

              }
              v45 = 0;
              a4 = 0;
              goto LABEL_58;
            }
            v45 = v44;
          }
          else
          {
            v45 = 0;
          }
          v46 = objc_msgSend(v66, "intValue");
          LODWORD(v55) = objc_msgSend(v21, "intValue");
          a4 = -[BMContextSyncWalletTransaction initWithID:deviceUUID:passUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:](v20, "initWithID:deviceUUID:passUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", v63, v71, v67, v69, v46, v64, v55, v45);
          v20 = (BMContextSyncWalletTransaction *)a4;
LABEL_58:

LABEL_59:
          self = v20;
          v7 = v70;
          goto LABEL_60;
        }
        v66 = v17;
LABEL_24:
        v7 = v70;
        goto LABEL_25;
      }
      v66 = 0;
    }
    else
    {
      v66 = 0;
      v9 = v13;
    }
    v8 = v12;
    goto LABEL_24;
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
    goto LABEL_67;
  }
  v22 = a4;
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = *MEMORY[0x1E0D025B8];
  v86 = *MEMORY[0x1E0CB2D50];
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("ID"));
  v87[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v9);
  v8 = 0;
  a4 = 0;
  *v22 = v26;
LABEL_66:

LABEL_67:
  return (BMContextSyncWalletTransaction *)a4;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[8];
  _QWORD v29[10];

  v29[8] = *MEMORY[0x1E0C80C00];
  -[BMContextSyncWalletTransaction ID](self, "ID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction deviceUUID](self, "deviceUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction passUniqueID](self, "passUniqueID");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextSyncWalletTransaction transactionType](self, "transactionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction transactionID](self, "transactionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextSyncWalletTransaction merchantType](self, "merchantType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncWalletTransaction poiCategory](self, "poiCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("ID");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v11;
  v29[0] = v11;
  v28[1] = CFSTR("deviceUUID");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v3;
  v22 = (void *)v12;
  v29[1] = v12;
  v28[2] = CFSTR("passUniqueID");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v4;
  v21 = (void *)v13;
  v29[2] = v13;
  v28[3] = CFSTR("passLocalizedDescription");
  v14 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v5;
  v29[3] = v14;
  v28[4] = CFSTR("transactionType");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v6;
  v29[4] = v15;
  v28[5] = CFSTR("transactionID");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[5] = v16;
  v28[6] = CFSTR("merchantType");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[6] = v17;
  v28[7] = CFSTR("poiCategory");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_19;
LABEL_30:

    if (v8)
      goto LABEL_20;
    goto LABEL_31;
  }

  if (!v9)
    goto LABEL_30;
LABEL_19:
  if (v8)
    goto LABEL_20;
LABEL_31:

LABEL_20:
  if (!v7)

  if (!v24)
  if (!v25)

  if (!v26)
  {

    if (v27)
      goto LABEL_28;
LABEL_33:

    goto LABEL_28;
  }
  if (!v27)
    goto LABEL_33;
LABEL_28:

  return v19;
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
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMContextSyncWalletTransaction ID](self, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMContextSyncWalletTransaction ID](self, "ID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_27;
    }
    -[BMContextSyncWalletTransaction deviceUUID](self, "deviceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMContextSyncWalletTransaction deviceUUID](self, "deviceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_27;
    }
    -[BMContextSyncWalletTransaction passUniqueID](self, "passUniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passUniqueID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMContextSyncWalletTransaction passUniqueID](self, "passUniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passUniqueID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_27;
    }
    -[BMContextSyncWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passLocalizedDescription");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMContextSyncWalletTransaction passLocalizedDescription](self, "passLocalizedDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passLocalizedDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_27;
    }
    v31 = -[BMContextSyncWalletTransaction transactionType](self, "transactionType");
    if (v31 == objc_msgSend(v5, "transactionType"))
    {
      -[BMContextSyncWalletTransaction transactionID](self, "transactionID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transactionID");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[BMContextSyncWalletTransaction transactionID](self, "transactionID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "transactionID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_27;
      }
      v38 = -[BMContextSyncWalletTransaction merchantType](self, "merchantType");
      if (v38 == objc_msgSend(v5, "merchantType"))
      {
        -[BMContextSyncWalletTransaction poiCategory](self, "poiCategory");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "poiCategory");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39 == v40)
        {
          v12 = 1;
        }
        else
        {
          -[BMContextSyncWalletTransaction poiCategory](self, "poiCategory");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "poiCategory");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v41, "isEqual:", v42);

        }
        goto LABEL_28;
      }
    }
LABEL_27:
    v12 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v12 = 0;
LABEL_29:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
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
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
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

    v4 = -[BMContextSyncWalletTransaction initByReadFrom:]([BMContextSyncWalletTransaction alloc], "initByReadFrom:", v7);
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
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceUUID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passUniqueID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passLocalizedDescription"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transactionType"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transactionID"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("merchantType"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("poiCategory"), 2, 0, 8, 13, 0);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D9C8;
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
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ID"), 1, 13, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceUUID"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passUniqueID"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passLocalizedDescription"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transactionType"), 5, 4, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transactionID"), 6, 13, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("merchantType"), 7, 4, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("poiCategory"), 8, 13, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
