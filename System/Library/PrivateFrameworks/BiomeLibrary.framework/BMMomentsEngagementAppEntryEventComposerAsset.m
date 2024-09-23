@implementation BMMomentsEngagementAppEntryEventComposerAsset

- (BMMomentsEngagementAppEntryEventComposerAsset)initWithIsSelected:(id)a3 assetType:(id)a4 assetTransferMechanism:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMMomentsEngagementAppEntryEventComposerAsset *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMMomentsEngagementAppEntryEventComposerAsset;
  v11 = -[BMEventBase init](&v13, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v8)
    {
      v11->_hasIsSelected = 1;
      v11->_isSelected = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      v11->_hasIsSelected = 0;
      v11->_isSelected = 0;
    }
    objc_storeStrong((id *)&v11->_assetType, a4);
    objc_storeStrong((id *)&v11->_assetTransferMechanism, a5);
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagementAppEntryEventComposerAsset isSelected](self, "isSelected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEventComposerAsset assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEventComposerAsset assetTransferMechanism](self, "assetTransferMechanism");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMomentsEngagementAppEntryEventComposerAsset with isSelected: %@, assetType: %@, assetTransferMechanism: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEngagementAppEntryEventComposerAsset *v5;
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
  uint64_t v28;
  uint64_t v29;
  void *v30;
  BMMomentsEngagementAppEntryEventComposerAsset *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMMomentsEngagementAppEntryEventComposerAsset;
  v5 = -[BMEventBase init](&v33, sel_init);
  if (!v5)
    goto LABEL_41;
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
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 32;
      }
      else
      {
        if ((_DWORD)v20 != 2)
        {
          if ((_DWORD)v20 == 1)
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
            v5->_hasIsSelected = 1;
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
                goto LABEL_35;
              v21 += 7;
              v17 = v22++ >= 9;
              if (v17)
              {
                v23 = 0;
                goto LABEL_37;
              }
            }
            v4[*v8] = 1;
LABEL_35:
            if (v4[*v8])
              v23 = 0;
LABEL_37:
            v5->_isSelected = v23 != 0;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_40;
          }
          continue;
        }
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 24;
      }
      v30 = *(Class *)((char *)&v5->super.super.isa + v29);
      *(Class *)((char *)&v5->super.super.isa + v29) = (Class)v28;

    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_40:
    v31 = 0;
  else
LABEL_41:
    v31 = v5;

  return v31;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasIsSelected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_assetType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_assetTransferMechanism)
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
  -[BMMomentsEngagementAppEntryEventComposerAsset writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEngagementAppEntryEventComposerAsset)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMMomentsEngagementAppEntryEventComposerAsset *v13;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSelected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetType"));
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
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("assetType"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetTransferMechanism"));
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
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("assetTransferMechanism"));
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
    self = -[BMMomentsEngagementAppEntryEventComposerAsset initWithIsSelected:assetType:assetTransferMechanism:](self, "initWithIsSelected:assetType:assetTransferMechanism:", v8, v10, v12);
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
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isSelected"));
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
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (-[BMMomentsEngagementAppEntryEventComposerAsset hasIsSelected](self, "hasIsSelected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMomentsEngagementAppEntryEventComposerAsset isSelected](self, "isSelected"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMMomentsEngagementAppEntryEventComposerAsset assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMomentsEngagementAppEntryEventComposerAsset assetTransferMechanism](self, "assetTransferMechanism");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("isSelected");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("assetType");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("assetTransferMechanism");
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
      goto LABEL_12;
LABEL_15:

    if (v3)
      goto LABEL_13;
LABEL_16:

    goto LABEL_13;
  }

  if (!v4)
    goto LABEL_15;
LABEL_12:
  if (!v3)
    goto LABEL_16;
LABEL_13:

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
    if (-[BMMomentsEngagementAppEntryEventComposerAsset hasIsSelected](self, "hasIsSelected")
      || objc_msgSend(v5, "hasIsSelected"))
    {
      if (!-[BMMomentsEngagementAppEntryEventComposerAsset hasIsSelected](self, "hasIsSelected"))
        goto LABEL_9;
      if (!objc_msgSend(v5, "hasIsSelected"))
        goto LABEL_9;
      v6 = -[BMMomentsEngagementAppEntryEventComposerAsset isSelected](self, "isSelected");
      if (v6 != objc_msgSend(v5, "isSelected"))
        goto LABEL_9;
    }
    -[BMMomentsEngagementAppEntryEventComposerAsset assetType](self, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetType");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMMomentsEngagementAppEntryEventComposerAsset assetType](self, "assetType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
      {
LABEL_9:
        v13 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    -[BMMomentsEngagementAppEntryEventComposerAsset assetTransferMechanism](self, "assetTransferMechanism");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetTransferMechanism");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == v15)
    {
      v13 = 1;
    }
    else
    {
      -[BMMomentsEngagementAppEntryEventComposerAsset assetTransferMechanism](self, "assetTransferMechanism");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetTransferMechanism");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v16, "isEqual:", v17);

    }
    goto LABEL_16;
  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)hasIsSelected
{
  return self->_hasIsSelected;
}

- (void)setHasIsSelected:(BOOL)a3
{
  self->_hasIsSelected = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetTransferMechanism
{
  return self->_assetTransferMechanism;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferMechanism, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
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

    v4 = -[BMMomentsEngagementAppEntryEventComposerAsset initByReadFrom:]([BMMomentsEngagementAppEntryEventComposerAsset alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isSelected"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("assetType"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("assetTransferMechanism"), 2, 0, 3, 13, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D638;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isSelected"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assetType"), 2, 13, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assetTransferMechanism"), 3, 13, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
