@implementation BMPlaceInference

- (BMPlaceInference)initWithIdentifier:(id)a3 placeType:(int)a4 userSpecificPlaceType:(int)a5 userSpecificPlaceTypeSource:(int)a6 mapItem:(id)a7
{
  id v12;
  id v13;
  BMPlaceInference *v14;
  uint64_t v15;
  NSString *raw_identifier;
  objc_super v18;

  v12 = a3;
  v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)BMPlaceInference;
  v14 = -[BMEventBase init](&v18, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      objc_msgSend(v12, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = (NSString *)v15;
    }
    else
    {
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = 0;
    }

    v14->_placeType = a4;
    v14->_userSpecificPlaceType = a5;
    v14->_userSpecificPlaceTypeSource = a6;
    objc_storeStrong((id *)&v14->_mapItem, a7);
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
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPlaceInference identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMPlaceInferencePlaceTypeAsString(-[BMPlaceInference placeType](self, "placeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMPlaceInferenceUserSpecificPlaceTypeAsString(-[BMPlaceInference userSpecificPlaceType](self, "userSpecificPlaceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMPlaceInferenceUserSpecificPlaceTypeSourceAsString(-[BMPlaceInference userSpecificPlaceTypeSource](self, "userSpecificPlaceTypeSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPlaceInference mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPlaceInference with identifier: %@, placeType: %@, userSpecificPlaceType: %@, userSpecificPlaceTypeSource: %@, mapItem: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPlaceInference *v5;
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
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  BMPlaceInferenceMapItem *v41;
  BMPlaceInferenceMapItem *mapItem;
  uint64_t v43;
  BMPlaceInference *v44;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMPlaceInference;
  v5 = -[BMEventBase init](&v46, sel_init);
  if (!v5)
    goto LABEL_69;
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
              goto LABEL_48;
            v22 += 7;
            v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_50;
            }
          }
          v4[*v8] = 1;
LABEL_48:
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_50:
          if (v24 >= 5)
            LODWORD(v24) = 0;
          v43 = 28;
          goto LABEL_65;
        case 3u:
          v29 = 0;
          v30 = 0;
          v24 = 0;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v24 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_56:
          if (v24 >= 5)
            LODWORD(v24) = 0;
          v43 = 32;
          goto LABEL_65;
        case 4u:
          v35 = 0;
          v36 = 0;
          v24 = 0;
          break;
        case 5u:
          v47 = 0;
          v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_68;
          v41 = -[BMPlaceInferenceMapItem initByReadFrom:]([BMPlaceInferenceMapItem alloc], "initByReadFrom:", v4);
          if (!v41)
            goto LABEL_68;
          mapItem = v5->_mapItem;
          v5->_mapItem = v41;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_68;
          continue;
      }
      while (1)
      {
        v37 = *v6;
        v38 = *(_QWORD *)&v4[v37];
        v39 = v38 + 1;
        if (v38 == -1 || v39 > *(_QWORD *)&v4[*v7])
          break;
        v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
        *(_QWORD *)&v4[v37] = v39;
        v24 |= (unint64_t)(v40 & 0x7F) << v35;
        if ((v40 & 0x80) == 0)
          goto LABEL_60;
        v35 += 7;
        v17 = v36++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_62;
        }
      }
      v4[*v8] = 1;
LABEL_60:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_62:
      if (v24 >= 5)
        LODWORD(v24) = 0;
      v43 = 36;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v43) = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_68:
    v44 = 0;
  else
LABEL_69:
    v44 = v5;

  return v44;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_raw_identifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_mapItem)
  {
    PBDataWriterPlaceMark();
    -[BMPlaceInferenceMapItem writeTo:](self->_mapItem, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPlaceInference writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPlaceInference)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  BMPlaceInference *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  BMPlaceInference *v22;
  BMPlaceInferenceMapItem *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  BMPlaceInference *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  id v40;
  id v41;
  id *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  BMPlaceInferenceMapItem *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (!v10)
    {
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v62 = *MEMORY[0x1E0CB2D50];
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("identifier"));
        v63[0] = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v32);

        v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_60;
    }
    v11 = (void *)v10;

    v8 = v11;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placeType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v47 = 0;
            v15 = 0;
LABEL_58:

            goto LABEL_60;
          }
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v58 = *MEMORY[0x1E0CB2D50];
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeType"));
          v59 = v45;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v28, 2, v16);
          v47 = 0;
          v15 = 0;
          *v42 = v29;
LABEL_57:

          goto LABEL_58;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPlaceInferencePlaceTypeFromString(v9));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v47 = v12;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userSpecificPlaceType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v8;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v45 = 0;
            v15 = 0;
            goto LABEL_57;
          }
          v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = *MEMORY[0x1E0D025B8];
          v56 = *MEMORY[0x1E0CB2D50];
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userSpecificPlaceType"));
          v57 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v33, 2, v18);
          v45 = 0;
          v15 = 0;
          *v42 = v34;
          goto LABEL_56;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPlaceInferenceUserSpecificPlaceTypeFromString(v16));
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v45 = v17;
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userSpecificPlaceTypeSource"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v7;
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v18;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v19 = 0;
            v15 = 0;
            goto LABEL_56;
          }
          v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = self;
          v36 = *MEMORY[0x1E0D025B8];
          v54 = *MEMORY[0x1E0CB2D50];
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userSpecificPlaceTypeSource"));
          v55 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
          v23 = (BMPlaceInferenceMapItem *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          self = v35;
          v19 = 0;
          v15 = 0;
          *v42 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v37, 2, v23);
          goto LABEL_54;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPlaceInferenceUserSpecificPlaceTypeSourceFromString(v18));
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v20;
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mapItem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = self;
    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = 0;
LABEL_36:
      self = -[BMPlaceInference initWithIdentifier:placeType:userSpecificPlaceType:userSpecificPlaceTypeSource:mapItem:](v22, "initWithIdentifier:placeType:userSpecificPlaceType:userSpecificPlaceTypeSource:mapItem:", v44, objc_msgSend(v47, "intValue"), objc_msgSend(v45, "intValue"), objc_msgSend(v19, "intValue"), v23);
      v15 = self;
LABEL_54:

LABEL_55:
      v7 = v43;

LABEL_56:
      v8 = v44;
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v21;
      v51 = 0;
      v23 = -[BMPlaceInferenceMapItem initWithJSONDictionary:error:]([BMPlaceInferenceMapItem alloc], "initWithJSONDictionary:error:", v24, &v51);
      v25 = v51;
      if (!v25)
      {

        goto LABEL_36;
      }
      v26 = v25;
      if (v42)
        *v42 = objc_retainAutorelease(v25);

      v15 = 0;
      v21 = v24;
    }
    else
    {
      if (!v42)
      {
        v15 = 0;
        goto LABEL_55;
      }
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v39 = *MEMORY[0x1E0D025B8];
      v52 = *MEMORY[0x1E0CB2D50];
      v23 = (BMPlaceInferenceMapItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("mapItem"));
      v53 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v39, 2, v27);

      v15 = 0;
    }
    self = v22;
    goto LABEL_54;
  }
  if (a4)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = *MEMORY[0x1E0D025B8];
    v60 = *MEMORY[0x1E0CB2D50];
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
    v61 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    *a4 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2);

LABEL_60:
    goto LABEL_61;
  }
  v15 = 0;
LABEL_61:

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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  -[BMPlaceInference identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPlaceInference placeType](self, "placeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPlaceInference userSpecificPlaceType](self, "userSpecificPlaceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPlaceInference userSpecificPlaceTypeSource](self, "userSpecificPlaceTypeSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPlaceInference mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = CFSTR("identifier");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v24[0] = v10;
  v20 = CFSTR("placeType");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v11;
  v21 = CFSTR("userSpecificPlaceType");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[2] = v12;
  v22 = CFSTR("userSpecificPlaceTypeSource");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v13;
  v23 = CFSTR("mapItem");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v19, 5, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v7)
      goto LABEL_13;
  }
  else
  {

    if (v7)
    {
LABEL_13:
      if (v6)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v6)
  {
LABEL_14:
    if (v5)
      goto LABEL_15;
LABEL_20:

    if (v4)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v5)
    goto LABEL_20;
LABEL_15:
  if (!v4)
    goto LABEL_21;
LABEL_16:

  return v15;
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
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPlaceInference identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPlaceInference identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_12;
    }
    v13 = -[BMPlaceInference placeType](self, "placeType");
    if (v13 == objc_msgSend(v5, "placeType"))
    {
      v14 = -[BMPlaceInference userSpecificPlaceType](self, "userSpecificPlaceType");
      if (v14 == objc_msgSend(v5, "userSpecificPlaceType"))
      {
        v15 = -[BMPlaceInference userSpecificPlaceTypeSource](self, "userSpecificPlaceTypeSource");
        if (v15 == objc_msgSend(v5, "userSpecificPlaceTypeSource"))
        {
          -[BMPlaceInference mapItem](self, "mapItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "mapItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16 == v17)
          {
            v12 = 1;
          }
          else
          {
            -[BMPlaceInference mapItem](self, "mapItem");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "mapItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v18, "isEqual:", v19);

          }
          goto LABEL_13;
        }
      }
    }
LABEL_12:
    v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)placeType
{
  return self->_placeType;
}

- (int)userSpecificPlaceType
{
  return self->_userSpecificPlaceType;
}

- (int)userSpecificPlaceTypeSource
{
  return self->_userSpecificPlaceTypeSource;
}

- (BMPlaceInferenceMapItem)mapItem
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

    v4 = -[BMPlaceInference initByReadFrom:]([BMPlaceInference alloc], "initByReadFrom:", v7);
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
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 6, 0, 1, 13, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userSpecificPlaceType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userSpecificPlaceTypeSource"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("mapItem_json"), 5, 1, &__block_literal_global_192_58387);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E6D0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userSpecificPlaceType"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userSpecificPlaceTypeSource"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mapItem"), 5, 14, objc_opt_class());
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __27__BMPlaceInference_columns__block_invoke(uint64_t a1, void *a2)
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
