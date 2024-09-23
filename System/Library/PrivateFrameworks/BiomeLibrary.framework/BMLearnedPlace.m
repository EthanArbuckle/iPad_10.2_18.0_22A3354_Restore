@implementation BMLearnedPlace

- (BMLearnedPlace)initWithIdentifier:(id)a3 learnedPlaceType:(int)a4 learnedPlaceTypeSource:(int)a5 mapItem:(id)a6
{
  id v10;
  id v11;
  BMLearnedPlace *v12;
  uint64_t v13;
  NSString *raw_identifier;
  objc_super v16;

  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMLearnedPlace;
  v12 = -[BMEventBase init](&v16, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      objc_msgSend(v10, "UUIDString");
      v13 = objc_claimAutoreleasedReturnValue();
      raw_identifier = v12->_raw_identifier;
      v12->_raw_identifier = (NSString *)v13;
    }
    else
    {
      raw_identifier = v12->_raw_identifier;
      v12->_raw_identifier = 0;
    }

    v12->_learnedPlaceType = a4;
    v12->_learnedPlaceTypeSource = a5;
    objc_storeStrong((id *)&v12->_mapItem, a6);
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
  -[BMLearnedPlace identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMLearnedPlaceTypeAsString(-[BMLearnedPlace learnedPlaceType](self, "learnedPlaceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMLearnedPlaceTypeSourceAsString(-[BMLearnedPlace learnedPlaceTypeSource](self, "learnedPlaceTypeSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLearnedPlace mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLearnedPlace with identifier: %@, learnedPlaceType: %@, learnedPlaceTypeSource: %@, mapItem: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLearnedPlace *v5;
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
  NSString *raw_identifier;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  BMMapItem *v35;
  BMMapItem *mapItem;
  uint64_t v37;
  BMLearnedPlace *v38;
  objc_super v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMLearnedPlace;
  v5 = -[BMEventBase init](&v40, sel_init);
  if (!v5)
    goto LABEL_56;
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
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          raw_identifier = v5->_raw_identifier;
          v5->_raw_identifier = (NSString *)v20;

          continue;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (1)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
              break;
            v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
            *(_QWORD *)&v4[v25] = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if ((v28 & 0x80) == 0)
              goto LABEL_41;
            v22 += 7;
            v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_43:
          if (v24 >= 5)
            LODWORD(v24) = 0;
          v37 = 28;
          goto LABEL_52;
        case 3u:
          v29 = 0;
          v30 = 0;
          v24 = 0;
          break;
        case 4u:
          v41 = 0;
          v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_55;
          v35 = -[BMMapItem initByReadFrom:]([BMMapItem alloc], "initByReadFrom:", v4);
          if (!v35)
            goto LABEL_55;
          mapItem = v5->_mapItem;
          v5->_mapItem = v35;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_55;
          continue;
      }
      while (1)
      {
        v31 = *v6;
        v32 = *(_QWORD *)&v4[v31];
        v33 = v32 + 1;
        if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
          break;
        v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
        *(_QWORD *)&v4[v31] = v33;
        v24 |= (unint64_t)(v34 & 0x7F) << v29;
        if ((v34 & 0x80) == 0)
          goto LABEL_47;
        v29 += 7;
        v17 = v30++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_49;
        }
      }
      v4[*v8] = 1;
LABEL_47:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_49:
      if (v24 >= 5)
        LODWORD(v24) = 0;
      v37 = 32;
LABEL_52:
      *(_DWORD *)((char *)&v5->super.super.isa + v37) = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_55:
    v38 = 0;
  else
LABEL_56:
    v38 = v5;

  return v38;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_raw_identifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_mapItem)
  {
    PBDataWriterPlaceMark();
    -[BMMapItem writeTo:](self->_mapItem, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLearnedPlace writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLearnedPlace)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMLearnedPlace *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  BMLearnedPlace *v15;
  id v16;
  BMLearnedPlace *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BMLearnedPlace *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  void *v27;
  BMMapItem *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  id v43;
  BMLearnedPlace *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  BMMapItem *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("learnedPlaceType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v8;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v14 = a4;
      v15 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v14)
          {
            v20 = 0;
            v22 = 0;
            goto LABEL_47;
          }
          v33 = v14;
          v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v53 = *MEMORY[0x1E0CB2D50];
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("learnedPlaceType"));
          v54 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v22 = 0;
          *v33 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v34, 2, v23);
          self = v15;
LABEL_46:

          v8 = v47;
LABEL_47:

          goto LABEL_48;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLearnedPlaceTypeFromString(v9));
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v16;
      a4 = v14;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("learnedPlaceTypeSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v10;
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v24 = a4;
      v44 = self;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v25 = 0;
            v22 = 0;
            v20 = v45;
            goto LABEL_46;
          }
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v51 = *MEMORY[0x1E0CB2D50];
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("learnedPlaceTypeSource"));
          v52 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v28 = (BMMapItem *)objc_claimAutoreleasedReturnValue();
          v40 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v28);
          v25 = 0;
          v22 = 0;
          *v24 = v40;
          goto LABEL_43;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLearnedPlaceTypeSourceFromString(v23));
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v26;
    }
    else
    {
      v24 = a4;
      v25 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mapItem"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v28 = 0;
LABEL_28:
      v20 = v45;
      self = -[BMLearnedPlace initWithIdentifier:learnedPlaceType:learnedPlaceTypeSource:mapItem:](self, "initWithIdentifier:learnedPlaceType:learnedPlaceTypeSource:mapItem:", v47, objc_msgSend(v45, "intValue"), objc_msgSend(v25, "intValue"), v28);
      v22 = self;
LABEL_44:

LABEL_45:
      goto LABEL_46;
    }
    v44 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v27;
      v48 = 0;
      v28 = -[BMMapItem initWithJSONDictionary:error:]([BMMapItem alloc], "initWithJSONDictionary:error:", v29, &v48);
      v30 = v48;
      if (!v30)
      {

        self = v44;
        goto LABEL_28;
      }
      v31 = v30;
      if (v24)
        *v24 = objc_retainAutorelease(v30);

      v22 = 0;
      v27 = v29;
    }
    else
    {
      if (!v24)
      {
        v22 = 0;
        v20 = v45;
        goto LABEL_45;
      }
      v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v42 = *MEMORY[0x1E0D025B8];
      v49 = *MEMORY[0x1E0CB2D50];
      v28 = (BMMapItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("mapItem"));
      v50 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *v24 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v42, 2, v32);

      v22 = 0;
    }
LABEL_43:
    self = v44;
    v20 = v45;
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = self;
    v8 = v7;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (v12)
    {
      v13 = (void *)v12;

      v8 = v13;
      self = v11;
      goto LABEL_4;
    }
    if (!a4)
    {
      v22 = 0;
      goto LABEL_49;
    }
    v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v36 = *MEMORY[0x1E0D025B8];
    v57 = *MEMORY[0x1E0CB2D50];
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("identifier"));
    v58[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v37);

    v22 = 0;
    self = v11;
LABEL_48:

LABEL_49:
    goto LABEL_50;
  }
  if (a4)
  {
    v17 = self;
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = *MEMORY[0x1E0D025B8];
    v55 = *MEMORY[0x1E0CB2D50];
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
    v56 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    self = v17;
    v22 = 0;
    *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v19, 2, v20);
    goto LABEL_48;
  }
  v22 = 0;
LABEL_50:

  return v22;
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
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  -[BMLearnedPlace identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLearnedPlace learnedPlaceType](self, "learnedPlaceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLearnedPlace learnedPlaceTypeSource](self, "learnedPlaceTypeSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLearnedPlace mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = CFSTR("identifier");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("learnedPlaceType");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("learnedPlaceTypeSource");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("mapItem");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      goto LABEL_11;
  }
  else
  {

    if (v6)
    {
LABEL_11:
      if (v5)
        goto LABEL_12;
LABEL_16:

      if (v4)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v5)
    goto LABEL_16;
LABEL_12:
  if (!v4)
    goto LABEL_17;
LABEL_13:

  return v13;
}

- (NSUUID)identifier
{
  NSString *raw_identifier;
  void *v3;

  raw_identifier = self->_raw_identifier;
  if (raw_identifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_identifier, 3);
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
  char v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLearnedPlace identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLearnedPlace identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_11;
    }
    v13 = -[BMLearnedPlace learnedPlaceType](self, "learnedPlaceType");
    if (v13 == objc_msgSend(v5, "learnedPlaceType"))
    {
      v14 = -[BMLearnedPlace learnedPlaceTypeSource](self, "learnedPlaceTypeSource");
      if (v14 == objc_msgSend(v5, "learnedPlaceTypeSource"))
      {
        -[BMLearnedPlace mapItem](self, "mapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
        {
          v12 = 1;
        }
        else
        {
          -[BMLearnedPlace mapItem](self, "mapItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "mapItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v17, "isEqual:", v18);

        }
        goto LABEL_12;
      }
    }
LABEL_11:
    v12 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)learnedPlaceType
{
  return self->_learnedPlaceType;
}

- (int)learnedPlaceTypeSource
{
  return self->_learnedPlaceTypeSource;
}

- (BMMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_raw_identifier, 0);
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

    v4 = -[BMLearnedPlace initByReadFrom:]([BMLearnedPlace alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 6, 0, 1, 13, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("learnedPlaceType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("learnedPlaceTypeSource"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("mapItem_json"), 5, 1, &__block_literal_global_162);
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
  return &unk_1E5F1B4D8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("learnedPlaceType"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("learnedPlaceTypeSource"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mapItem"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __25__BMLearnedPlace_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
