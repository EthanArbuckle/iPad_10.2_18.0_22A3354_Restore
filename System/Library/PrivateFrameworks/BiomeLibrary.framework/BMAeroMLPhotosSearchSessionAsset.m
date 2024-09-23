@implementation BMAeroMLPhotosSearchSessionAsset

- (BMAeroMLPhotosSearchSessionAsset)initWithAssetUUID:(id)a3 rankingIndex:(id)a4 cosDistance:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMAeroMLPhotosSearchSessionAsset *v12;
  unsigned int v13;
  double v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMAeroMLPhotosSearchSessionAsset;
  v12 = -[BMEventBase init](&v16, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_assetUUID, a3);
    if (v10)
    {
      v12->_hasRankingIndex = 1;
      v13 = objc_msgSend(v10, "unsignedIntValue");
    }
    else
    {
      v13 = 0;
      v12->_hasRankingIndex = 0;
    }
    v12->_rankingIndex = v13;
    if (v11)
    {
      v12->_hasCosDistance = 1;
      objc_msgSend(v11, "doubleValue");
    }
    else
    {
      v12->_hasCosDistance = 0;
      v14 = -1.0;
    }
    v12->_cosDistance = v14;
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
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAeroMLPhotosSearchSessionAsset assetUUID](self, "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchSessionAsset rankingIndex](self, "rankingIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMAeroMLPhotosSearchSessionAsset cosDistance](self, "cosDistance");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAeroMLPhotosSearchSessionAsset with assetUUID: %@, rankingIndex: %@, cosDistance: %@"), v4, v5, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAeroMLPhotosSearchSessionAsset *v5;
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
  uint64_t v21;
  NSString *assetUUID;
  uint64_t v23;
  unint64_t v24;
  double v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  BMAeroMLPhotosSearchSessionAsset *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMAeroMLPhotosSearchSessionAsset;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_44;
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
        v5->_hasCosDistance = 1;
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
        v5->_cosDistance = v25;
      }
      else if ((_DWORD)v20 == 2)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v5->_hasRankingIndex = 1;
        while (1)
        {
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
            break;
          v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
          *(_QWORD *)&v4[v29] = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0)
            goto LABEL_36;
          v26 += 7;
          v17 = v27++ >= 9;
          if (v17)
          {
            LODWORD(v28) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8])
          LODWORD(v28) = 0;
LABEL_38:
        v5->_rankingIndex = v28;
      }
      else if ((_DWORD)v20 == 1)
      {
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        assetUUID = v5->_assetUUID;
        v5->_assetUUID = (NSString *)v21;

      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_43:
    v33 = 0;
  else
LABEL_44:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_assetUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasRankingIndex)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasCosDistance)
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
  -[BMAeroMLPhotosSearchSessionAsset writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAeroMLPhotosSearchSessionAsset)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  BMAeroMLPhotosSearchSessionAsset *v13;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rankingIndex"));
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
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rankingIndex"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cosDistance"));
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
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cosDistance"));
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
    self = -[BMAeroMLPhotosSearchSessionAsset initWithAssetUUID:rankingIndex:cosDistance:](self, "initWithAssetUUID:rankingIndex:cosDistance:", v8, v10, v12);
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
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("assetUUID"));
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
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[BMAeroMLPhotosSearchSessionAsset assetUUID](self, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAeroMLPhotosSearchSessionAsset hasRankingIndex](self, "hasRankingIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAeroMLPhotosSearchSessionAsset rankingIndex](self, "rankingIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!-[BMAeroMLPhotosSearchSessionAsset hasCosDistance](self, "hasCosDistance")
    || (-[BMAeroMLPhotosSearchSessionAsset cosDistance](self, "cosDistance"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMAeroMLPhotosSearchSessionAsset cosDistance](self, "cosDistance");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAeroMLPhotosSearchSessionAsset cosDistance](self, "cosDistance");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = CFSTR("assetUUID");
  v8 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v8;
  v13[1] = CFSTR("rankingIndex");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v9;
  v13[2] = CFSTR("cosDistance");
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v4)
      goto LABEL_16;
LABEL_19:

    if (v3)
      goto LABEL_17;
LABEL_20:

    goto LABEL_17;
  }

  if (!v4)
    goto LABEL_19;
LABEL_16:
  if (!v3)
    goto LABEL_20;
LABEL_17:

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
  BOOL v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAeroMLPhotosSearchSessionAsset assetUUID](self, "assetUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetUUID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAeroMLPhotosSearchSessionAsset assetUUID](self, "assetUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    if (!-[BMAeroMLPhotosSearchSessionAsset hasRankingIndex](self, "hasRankingIndex")
      && !objc_msgSend(v5, "hasRankingIndex")
      || -[BMAeroMLPhotosSearchSessionAsset hasRankingIndex](self, "hasRankingIndex")
      && objc_msgSend(v5, "hasRankingIndex")
      && (v13 = -[BMAeroMLPhotosSearchSessionAsset rankingIndex](self, "rankingIndex"),
          v13 == objc_msgSend(v5, "rankingIndex")))
    {
      if (!-[BMAeroMLPhotosSearchSessionAsset hasCosDistance](self, "hasCosDistance")
        && !objc_msgSend(v5, "hasCosDistance"))
      {
        v12 = 1;
        goto LABEL_18;
      }
      if (-[BMAeroMLPhotosSearchSessionAsset hasCosDistance](self, "hasCosDistance")
        && objc_msgSend(v5, "hasCosDistance"))
      {
        -[BMAeroMLPhotosSearchSessionAsset cosDistance](self, "cosDistance");
        v15 = v14;
        objc_msgSend(v5, "cosDistance");
        v12 = v15 == v16;
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (unsigned)rankingIndex
{
  return self->_rankingIndex;
}

- (BOOL)hasRankingIndex
{
  return self->_hasRankingIndex;
}

- (void)setHasRankingIndex:(BOOL)a3
{
  self->_hasRankingIndex = a3;
}

- (double)cosDistance
{
  return self->_cosDistance;
}

- (BOOL)hasCosDistance
{
  return self->_hasCosDistance;
}

- (void)setHasCosDistance:(BOOL)a3
{
  self->_hasCosDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUID, 0);
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

    v4 = -[BMAeroMLPhotosSearchSessionAsset initByReadFrom:]([BMAeroMLPhotosSearchSessionAsset alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("assetUUID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rankingIndex"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cosDistance"), 1, 0, 3, 0, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AA28;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assetUUID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rankingIndex"), 2, 4, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cosDistance"), 3, 0, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
