@implementation BMSiriRequestContextUser

- (BMSiriRequestContextUser)initWithUserID:(id)a3 isOnlyUserInHome:(id)a4 classification:(int)a5
{
  id v9;
  id v10;
  BMSiriRequestContextUser *v11;
  objc_super v13;

  v9 = a3;
  v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSiriRequestContextUser;
  v11 = -[BMEventBase init](&v13, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v11->_userID, a3);
    if (v10)
    {
      v11->_hasIsOnlyUserInHome = 1;
      v11->_isOnlyUserInHome = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v11->_hasIsOnlyUserInHome = 0;
      v11->_isOnlyUserInHome = 0;
    }
    v11->_classification = a5;
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
  -[BMSiriRequestContextUser userID](self, "userID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContextUser isOnlyUserInHome](self, "isOnlyUserInHome"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriRequestContextUserClassificationAsString(-[BMSiriRequestContextUser classification](self, "classification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRequestContextUser with userID: %@, isOnlyUserInHome: %@, classification: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRequestContextUser *v5;
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
  NSString *userID;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  BMSiriRequestContextUser *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMSiriRequestContextUser;
  v5 = -[BMEventBase init](&v39, sel_init);
  if (!v5)
    goto LABEL_52;
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
      if ((v12 >> 3) == 1)
      {
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        userID = v5->_userID;
        v5->_userID = (NSString *)v28;

      }
      else if ((_DWORD)v20 == 2)
      {
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v5->_hasIsOnlyUserInHome = 1;
        while (1)
        {
          v33 = *v6;
          v34 = *(_QWORD *)&v4[v33];
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
            break;
          v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
          *(_QWORD *)&v4[v33] = v35;
          v32 |= (unint64_t)(v36 & 0x7F) << v30;
          if ((v36 & 0x80) == 0)
            goto LABEL_46;
          v30 += 7;
          v17 = v31++ >= 9;
          if (v17)
          {
            v32 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8])
          v32 = 0;
LABEL_48:
        v5->_isOnlyUserInHome = v32 != 0;
      }
      else if ((_DWORD)v20 == 3)
      {
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
        if (v23 >= 5)
          LODWORD(v23) = 0;
        v5->_classification = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_51;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v37 = 0;
  else
LABEL_52:
    v37 = v5;

  return v37;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_userID)
    PBDataWriterWriteStringField();
  if (self->_hasIsOnlyUserInHome)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriRequestContextUser writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRequestContextUser)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  BMSiriRequestContextUser *v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isOnlyUserInHome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isOnlyUserInHome"));
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v17, 2, v11);
        v10 = 0;
        v16 = 0;
        *a4 = v18;
        goto LABEL_24;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("classification"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v22 = *MEMORY[0x1E0D025B8];
            v25 = *MEMORY[0x1E0CB2D50];
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("classification"));
            v26 = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v21);

          }
          v12 = 0;
          v16 = 0;
          goto LABEL_24;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriRequestContextUserClassificationFromString(v11));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMSiriRequestContextUser initWithUserID:isOnlyUserInHome:classification:](self, "initWithUserID:isOnlyUserInHome:classification:", v8, v10, objc_msgSend(v12, "intValue"));
    v16 = self;
LABEL_24:

    goto LABEL_25;
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
    goto LABEL_26;
  }
  v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v15 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userID"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v16 = 0;
  *a4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v9);
LABEL_25:

LABEL_26:
  return v16;
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
  -[BMSiriRequestContextUser userID](self, "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriRequestContextUser hasIsOnlyUserInHome](self, "hasIsOnlyUserInHome"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRequestContextUser isOnlyUserInHome](self, "isOnlyUserInHome"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriRequestContextUser classification](self, "classification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("userID");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("isOnlyUserInHome");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("classification");
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriRequestContextUser userID](self, "userID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriRequestContextUser userID](self, "userID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_12;
    }
    if (!-[BMSiriRequestContextUser hasIsOnlyUserInHome](self, "hasIsOnlyUserInHome")
      && !objc_msgSend(v5, "hasIsOnlyUserInHome")
      || -[BMSiriRequestContextUser hasIsOnlyUserInHome](self, "hasIsOnlyUserInHome")
      && objc_msgSend(v5, "hasIsOnlyUserInHome")
      && (v13 = -[BMSiriRequestContextUser isOnlyUserInHome](self, "isOnlyUserInHome"),
          v13 == objc_msgSend(v5, "isOnlyUserInHome")))
    {
      v14 = -[BMSiriRequestContextUser classification](self, "classification");
      v12 = v14 == objc_msgSend(v5, "classification");
      goto LABEL_14;
    }
LABEL_12:
    v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)userID
{
  return self->_userID;
}

- (BOOL)isOnlyUserInHome
{
  return self->_isOnlyUserInHome;
}

- (BOOL)hasIsOnlyUserInHome
{
  return self->_hasIsOnlyUserInHome;
}

- (void)setHasIsOnlyUserInHome:(BOOL)a3
{
  self->_hasIsOnlyUserInHome = a3;
}

- (int)classification
{
  return self->_classification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
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

    v4 = -[BMSiriRequestContextUser initByReadFrom:]([BMSiriRequestContextUser alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isOnlyUserInHome"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("classification"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CD20;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userID"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isOnlyUserInHome"), 2, 12, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("classification"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
