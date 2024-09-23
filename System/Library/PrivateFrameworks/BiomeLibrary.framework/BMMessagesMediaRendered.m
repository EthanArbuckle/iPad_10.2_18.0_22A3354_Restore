@implementation BMMessagesMediaRendered

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("mediaAttributes_json"), 5, 1, &__block_literal_global_61876);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isOnScreen"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFirstView"), 0, 0, 4, 12, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BMMessagesMediaRendered)initWithAbsoluteTimestamp:(id)a3 mediaAttributes:(id)a4 isOnScreen:(id)a5 isFirstView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMMessagesMediaRendered *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMMessagesMediaRendered;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v14->_hasRaw_absoluteTimestamp = 0;
      v15 = -1.0;
    }
    v14->_raw_absoluteTimestamp = v15;
    objc_storeStrong((id *)&v14->_mediaAttributes, a4);
    if (v12)
    {
      v14->_hasIsOnScreen = 1;
      v14->_isOnScreen = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v14->_hasIsOnScreen = 0;
      v14->_isOnScreen = 0;
    }
    if (v13)
    {
      v14->_hasIsFirstView = 1;
      v14->_isFirstView = objc_msgSend(v13, "BOOLValue");
    }
    else
    {
      v14->_hasIsFirstView = 0;
      v14->_isFirstView = 0;
    }
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
  -[BMMessagesMediaRendered absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMessagesMediaRendered mediaAttributes](self, "mediaAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesMediaRendered isOnScreen](self, "isOnScreen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesMediaRendered isFirstView](self, "isFirstView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMessagesMediaRendered with absoluteTimestamp: %@, mediaAttributes: %@, isOnScreen: %@, isFirstView: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMessagesMediaRendered *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  unint64_t v22;
  double v23;
  id v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  NSArray *mediaAttributes;
  int v44;
  BMMessagesMediaRendered *v45;
  objc_super v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMMessagesMediaRendered;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
    goto LABEL_56;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v21 = *v7;
          v22 = *(_QWORD *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v23 = *(double *)(*(_QWORD *)&v4[*v10] + v22);
            *(_QWORD *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v23 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v23;
          continue;
        case 2u:
          v48 = 0;
          v49 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_58;
          v24 = -[BMMessagesMediaRenderedMediaAttributes initByReadFrom:]([BMMessagesMediaRenderedMediaAttributes alloc], "initByReadFrom:", v4);
          if (!v24)
            goto LABEL_58;
          v25 = v24;
          objc_msgSend(v6, "addObject:", v24);
          PBReaderRecallMark();

          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasIsOnScreen = 1;
          while (2)
          {
            v29 = *v7;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v18 = v27++ >= 9;
                if (v18)
                {
                  v28 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v28 = 0;
LABEL_45:
          v40 = v28 != 0;
          v41 = 32;
          goto LABEL_50;
        case 4u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasIsFirstView = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_58:

          goto LABEL_55;
      }
      while (1)
      {
        v36 = *v7;
        v37 = *(_QWORD *)&v4[v36];
        v38 = v37 + 1;
        if (v37 == -1 || v38 > *(_QWORD *)&v4[*v8])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v37);
        *(_QWORD *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0)
          goto LABEL_47;
        v33 += 7;
        v18 = v34++ >= 9;
        if (v18)
        {
          v35 = 0;
          goto LABEL_49;
        }
      }
      v4[*v9] = 1;
LABEL_47:
      if (v4[*v9])
        v35 = 0;
LABEL_49:
      v40 = v35 != 0;
      v41 = 34;
LABEL_50:
      *((_BYTE *)&v5->super.super.isa + v41) = v40;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v42 = objc_msgSend(v6, "copy");
  mediaAttributes = v5->_mediaAttributes;
  v5->_mediaAttributes = (NSArray *)v42;

  v44 = v4[*v9];
  if (v44)
LABEL_55:
    v45 = 0;
  else
LABEL_56:
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_mediaAttributes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_hasIsOnScreen)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsFirstView)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMessagesMediaRendered writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMessagesMediaRendered)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  BMMessagesMediaRenderedMediaAttributes *v24;
  BMMessagesMediaRenderedMediaAttributes *v25;
  id v26;
  id v27;
  id *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id *v32;
  uint64_t *v33;
  id v34;
  id v35;
  BMMessagesMediaRendered *v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  BMMessagesMediaRendered *v52;
  id v53;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  _BYTE v71[128];
  uint64_t v72;
  void *v73;
  uint64_t v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (objc_class *)MEMORY[0x1E0C99D68];
      v9 = v6;
      v10 = [v8 alloc];
      objc_msgSend(v9, "doubleValue");
      v12 = v11;

      v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:", v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v14, "dateFromString:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v47 = *MEMORY[0x1E0D025B8];
          v74 = *MEMORY[0x1E0CB2D50];
          v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v75[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = 0;
          v36 = 0;
          *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);

          goto LABEL_51;
        }
        v7 = 0;
        v36 = 0;
        goto LABEL_52;
      }
      v13 = v6;
    }
    v7 = v13;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaAttributes"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  v55 = v6;
  if (v17)
  {
    v50 = v7;
    v52 = self;

    v15 = 0;
LABEL_14:
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v15 = v15;
    v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (!v18)
      goto LABEL_24;
    v19 = v18;
    v20 = *(_QWORD *)v60;
    v49 = v5;
LABEL_16:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v20)
        objc_enumerationMutation(v15);
      v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v21);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = a4;
        if (a4)
        {
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v67 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("mediaAttributes"));
          v68 = v23;
          v31 = (void *)MEMORY[0x1E0C99D80];
          v32 = &v68;
          v33 = &v67;
          goto LABEL_31;
        }
        goto LABEL_38;
      }
      v23 = v22;
      v24 = [BMMessagesMediaRenderedMediaAttributes alloc];
      v58 = 0;
      v25 = -[BMMessagesMediaRenderedMediaAttributes initWithJSONDictionary:error:](v24, "initWithJSONDictionary:error:", v23, &v58);
      v26 = v58;
      if (v26)
      {
        v34 = v26;
        if (a4)
          *a4 = objc_retainAutorelease(v26);

        v36 = 0;
        goto LABEL_35;
      }
      objc_msgSend(v56, "addObject:", v25);

      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
        v5 = v49;
        if (v19)
          goto LABEL_16;
LABEL_24:

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isOnScreen"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          v27 = 0;
          v7 = v50;
          self = v52;
          goto LABEL_42;
        }
        objc_opt_class();
        v7 = v50;
        self = v52;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = 0;
LABEL_42:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFirstView"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v34 = 0;
            goto LABEL_45;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = v40;
LABEL_45:
            self = -[BMMessagesMediaRendered initWithAbsoluteTimestamp:mediaAttributes:isOnScreen:isFirstView:](self, "initWithAbsoluteTimestamp:mediaAttributes:isOnScreen:isFirstView:", v7, v56, v27, v34);
            v36 = self;
          }
          else
          {
            if (a4)
            {
              v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v51 = *MEMORY[0x1E0D025B8];
              v63 = *MEMORY[0x1E0CB2D50];
              v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFirstView"));
              v64 = v44;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v51, 2, v45);

            }
            v34 = 0;
            v36 = 0;
          }
LABEL_46:

LABEL_47:
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v23;
            goto LABEL_42;
          }
          if (a4)
          {
            v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v42 = *MEMORY[0x1E0D025B8];
            v65 = *MEMORY[0x1E0CB2D50];
            v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isOnScreen"));
            v66 = v34;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v42, 2, v40);
            v36 = 0;
            v27 = 0;
            *a4 = v43;
            goto LABEL_46;
          }
          v27 = 0;
          v36 = 0;
        }

LABEL_49:
        v6 = v55;

        goto LABEL_51;
      }
    }
    v28 = a4;
    if (a4)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0D025B8];
      v69 = *MEMORY[0x1E0CB2D50];
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("mediaAttributes"));
      v70 = v23;
      v31 = (void *)MEMORY[0x1E0C99D80];
      v32 = &v70;
      v33 = &v69;
LABEL_31:
      objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 1);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v34);
      v36 = 0;
      *v28 = v35;
LABEL_35:
      v27 = v15;
      v5 = v49;
      v7 = v50;
      self = v52;
      goto LABEL_47;
    }
LABEL_38:
    v36 = 0;
    v27 = v15;
    v5 = v49;
    v7 = v50;
    self = v52;
    goto LABEL_49;
  }
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v50 = v7;
    v52 = self;
    goto LABEL_14;
  }
  if (a4)
  {
    v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v38 = *MEMORY[0x1E0D025B8];
    v72 = *MEMORY[0x1E0CB2D50];
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("mediaAttributes"));
    v73 = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v27);
    v36 = 0;
    *a4 = v39;
    goto LABEL_49;
  }
  v36 = 0;
LABEL_51:

LABEL_52:
  return v36;
}

- (id)_mediaAttributesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMessagesMediaRendered mediaAttributes](self, "mediaAttributes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
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
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  -[BMMessagesMediaRendered absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMessagesMediaRendered absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMMessagesMediaRendered _mediaAttributesJSONArray](self, "_mediaAttributesJSONArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMessagesMediaRendered hasIsOnScreen](self, "hasIsOnScreen"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesMediaRendered isOnScreen](self, "isOnScreen"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (-[BMMessagesMediaRendered hasIsFirstView](self, "hasIsFirstView"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMessagesMediaRendered isFirstView](self, "isFirstView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v16[0] = CFSTR("absoluteTimestamp");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v10;
  v16[1] = CFSTR("mediaAttributes");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v11;
  v16[2] = CFSTR("isOnScreen");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v12;
  v16[3] = CFSTR("isFirstView");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_20;
  }
  else
  {

    if (v8)
    {
LABEL_20:
      if (v7)
        goto LABEL_21;
LABEL_25:

      if (v6)
        goto LABEL_22;
LABEL_26:

      goto LABEL_22;
    }
  }

  if (!v7)
    goto LABEL_25;
LABEL_21:
  if (!v6)
    goto LABEL_26;
LABEL_22:

  return v14;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  _BOOL4 v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMessagesMediaRendered absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMessagesMediaRendered absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMMessagesMediaRendered mediaAttributes](self, "mediaAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaAttributes");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMessagesMediaRendered mediaAttributes](self, "mediaAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaAttributes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    if (!-[BMMessagesMediaRendered hasIsOnScreen](self, "hasIsOnScreen")
      && !objc_msgSend(v5, "hasIsOnScreen")
      || -[BMMessagesMediaRendered hasIsOnScreen](self, "hasIsOnScreen")
      && objc_msgSend(v5, "hasIsOnScreen")
      && (v19 = -[BMMessagesMediaRendered isOnScreen](self, "isOnScreen"),
          v19 == objc_msgSend(v5, "isOnScreen")))
    {
      if (!-[BMMessagesMediaRendered hasIsFirstView](self, "hasIsFirstView")
        && !objc_msgSend(v5, "hasIsFirstView"))
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if (-[BMMessagesMediaRendered hasIsFirstView](self, "hasIsFirstView")
        && objc_msgSend(v5, "hasIsFirstView"))
      {
        v20 = -[BMMessagesMediaRendered isFirstView](self, "isFirstView");
        v12 = v20 ^ objc_msgSend(v5, "isFirstView") ^ 1;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)mediaAttributes
{
  return self->_mediaAttributes;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (BOOL)hasIsOnScreen
{
  return self->_hasIsOnScreen;
}

- (void)setHasIsOnScreen:(BOOL)a3
{
  self->_hasIsOnScreen = a3;
}

- (BOOL)isFirstView
{
  return self->_isFirstView;
}

- (BOOL)hasIsFirstView
{
  return self->_hasIsFirstView;
}

- (void)setHasIsFirstView:(BOOL)a3
{
  self->_hasIsFirstView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAttributes, 0);
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

    v4 = -[BMMessagesMediaRendered initByReadFrom:]([BMMessagesMediaRendered alloc], "initByReadFrom:", v7);
    v4[9] = 0;

  }
  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1EC70;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaAttributes"), 2, 14, objc_opt_class());
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isOnScreen"), 3, 12, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFirstView"), 4, 12, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __34__BMMessagesMediaRendered_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mediaAttributesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
