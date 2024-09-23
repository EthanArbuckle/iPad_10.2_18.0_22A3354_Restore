@implementation BMSafariBrowsingAssistantUserInteractionDetected

- (BMSafariBrowsingAssistantUserInteractionDetected)initWithWebpageViewIdentifier:(id)a3 visualComponent:(id)a4 userInteractionType:(int)a5 visualComponentInteractionInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  BMSafariBrowsingAssistantUserInteractionDetected *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMSafariBrowsingAssistantUserInteractionDetected;
  v14 = -[BMEventBase init](&v16, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v14->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v14->_visualComponent, a4);
    v14->_userInteractionType = a5;
    objc_storeStrong((id *)&v14->_visualComponentInteractionInfo, a6);
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
  -[BMSafariBrowsingAssistantUserInteractionDetected webpageViewIdentifier](self, "webpageViewIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantUserInteractionDetected visualComponent](self, "visualComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantUserInteractionTypeAsString(-[BMSafariBrowsingAssistantUserInteractionDetected userInteractionType](self, "userInteractionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantUserInteractionDetected visualComponentInteractionInfo](self, "visualComponentInteractionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantUserInteractionDetected with webpageViewIdentifier: %@, visualComponent: %@, userInteractionType: %@, visualComponentInteractionInfo: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantUserInteractionDetected *v5;
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
  NSData *webpageViewIdentifier;
  objc_class *v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  BMSafariBrowsingAssistantUserInteractionDetected *v30;
  objc_super v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSafariBrowsingAssistantUserInteractionDetected;
  v5 = -[BMEventBase init](&v32, sel_init);
  if (!v5)
    goto LABEL_46;
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
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          webpageViewIdentifier = v5->_webpageViewIdentifier;
          v5->_webpageViewIdentifier = (NSData *)v19;

          continue;
        case 2u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_45;
          v21 = -[BMSafariBrowsingAssistantVisualComponent initByReadFrom:]([BMSafariBrowsingAssistantVisualComponent alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_45;
          v22 = 32;
          goto LABEL_36;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          break;
        case 4u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_45;
          v21 = -[BMSafariBrowsingAssistantVisualComponentInteractionInfo initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentInteractionInfo alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_45;
          v22 = 40;
LABEL_36:
          v29 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = v21;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_45;
          continue;
      }
      while (1)
      {
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        if (v27 == -1 || v27 >= *(_QWORD *)&v4[*v7])
          break;
        v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
        *(_QWORD *)&v4[v26] = v27 + 1;
        v25 |= (unint64_t)(v28 & 0x7F) << v23;
        if ((v28 & 0x80) == 0)
          goto LABEL_38;
        v23 += 7;
        v16 = v24++ >= 9;
        if (v16)
        {
          LODWORD(v25) = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8])
        LODWORD(v25) = 0;
LABEL_40:
      if (v25 >= 5)
        LODWORD(v25) = 0;
      v5->_userInteractionType = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_45:
    v30 = 0;
  else
LABEL_46:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_webpageViewIdentifier)
    PBDataWriterWriteDataField();
  if (self->_visualComponent)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantVisualComponent writeTo:](self->_visualComponent, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_visualComponentInteractionInfo)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantVisualComponentInteractionInfo writeTo:](self->_visualComponentInteractionInfo, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantUserInteractionDetected writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantUserInteractionDetected)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BMSafariBrowsingAssistantVisualComponent *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BMSafariBrowsingAssistantUserInteractionDetected *v16;
  BMSafariBrowsingAssistantUserInteractionDetected *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BMSafariBrowsingAssistantVisualComponentInteractionInfo *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v34;
  id v35;
  BMSafariBrowsingAssistantVisualComponent *v36;
  id v37;
  id v39;
  id v40;
  uint64_t v41;
  BMSafariBrowsingAssistantVisualComponentInteractionInfo *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  BMSafariBrowsingAssistantVisualComponent *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("webpageViewIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visualComponent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v8;
      v40 = 0;
      v9 = -[BMSafariBrowsingAssistantVisualComponent initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponent alloc], "initWithJSONDictionary:error:", v13, &v40);
      v14 = v40;
      if (v14)
      {
        v15 = v14;
        v16 = self;
        if (a4)
          *a4 = objc_retainAutorelease(v14);

        v17 = 0;
        goto LABEL_47;
      }

LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userInteractionType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v9;
      v37 = v7;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v11 = a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v10;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v12 = 0;
              v17 = 0;
              v16 = self;
              v9 = v36;
              goto LABEL_46;
            }
            v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v31 = *MEMORY[0x1E0D025B8];
            v43 = *MEMORY[0x1E0CB2D50];
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userInteractionType"));
            v44 = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
            v25 = (BMSafariBrowsingAssistantVisualComponentInteractionInfo *)objc_claimAutoreleasedReturnValue();
            v32 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v25);
            v12 = 0;
            v17 = 0;
            *v11 = v32;
            goto LABEL_43;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantUserInteractionTypeFromString(v10));
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v18;
      }
      else
      {
        v11 = a4;
        v12 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visualComponentInteractionInfo"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = 0;
LABEL_30:
        v9 = v36;
        v16 = -[BMSafariBrowsingAssistantUserInteractionDetected initWithWebpageViewIdentifier:visualComponent:userInteractionType:visualComponentInteractionInfo:](self, "initWithWebpageViewIdentifier:visualComponent:userInteractionType:visualComponentInteractionInfo:", v37, v36, objc_msgSend(v12, "intValue"), v25);
        v17 = v16;
LABEL_44:

LABEL_45:
LABEL_46:

        v13 = v8;
        v7 = v37;
        goto LABEL_47;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v24;
        v39 = 0;
        v25 = -[BMSafariBrowsingAssistantVisualComponentInteractionInfo initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponentInteractionInfo alloc], "initWithJSONDictionary:error:", v26, &v39);
        v27 = v39;
        if (!v27)
        {

          goto LABEL_30;
        }
        v28 = v27;
        if (v11)
          *v11 = objc_retainAutorelease(v27);

        v17 = 0;
        v24 = v26;
      }
      else
      {
        if (!v11)
        {
          v17 = 0;
          v16 = self;
          v9 = v36;
          goto LABEL_45;
        }
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v41 = *MEMORY[0x1E0CB2D50];
        v25 = (BMSafariBrowsingAssistantVisualComponentInteractionInfo *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("visualComponentInteractionInfo"));
        v42 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *v11 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v34, 2, v29);

        v17 = 0;
      }
LABEL_43:
      v16 = self;
      v9 = v36;
      goto LABEL_44;
    }
    if (!a4)
    {
      v17 = 0;
      v16 = self;
LABEL_48:

      goto LABEL_49;
    }
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = *MEMORY[0x1E0D025B8];
    v45 = *MEMORY[0x1E0CB2D50];
    v9 = (BMSafariBrowsingAssistantVisualComponent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("visualComponent"));
    v46 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v23);

    v17 = 0;
    v13 = v8;
LABEL_23:
    v16 = self;
LABEL_47:

    v8 = v13;
    goto LABEL_48;
  }
  if (a4)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0D025B8];
    v47 = *MEMORY[0x1E0CB2D50];
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("webpageViewIdentifier"));
    v48[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v9 = (BMSafariBrowsingAssistantVisualComponent *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v17 = 0;
    *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
    goto LABEL_23;
  }
  v7 = 0;
  v17 = 0;
  v16 = self;
LABEL_49:

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
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantUserInteractionDetected webpageViewIdentifier](self, "webpageViewIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantUserInteractionDetected visualComponent](self, "visualComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantUserInteractionDetected userInteractionType](self, "userInteractionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantUserInteractionDetected visualComponentInteractionInfo](self, "visualComponentInteractionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("webpageViewIdentifier");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v10;
  v16[1] = CFSTR("visualComponent");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v11;
  v16[2] = CFSTR("userInteractionType");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v12;
  v16[3] = CFSTR("visualComponentInteractionInfo");
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
    if (v7)
      goto LABEL_11;
  }
  else
  {

    if (v7)
    {
LABEL_11:
      if (v6)
        goto LABEL_12;
LABEL_16:

      if (v4)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v6)
    goto LABEL_16;
LABEL_12:
  if (!v4)
    goto LABEL_17;
LABEL_13:

  return v14;
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
    -[BMSafariBrowsingAssistantUserInteractionDetected webpageViewIdentifier](self, "webpageViewIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webpageViewIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantUserInteractionDetected webpageViewIdentifier](self, "webpageViewIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webpageViewIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_14;
    }
    -[BMSafariBrowsingAssistantUserInteractionDetected visualComponent](self, "visualComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualComponent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariBrowsingAssistantUserInteractionDetected visualComponent](self, "visualComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_14;
    }
    v19 = -[BMSafariBrowsingAssistantUserInteractionDetected userInteractionType](self, "userInteractionType");
    if (v19 == objc_msgSend(v5, "userInteractionType"))
    {
      -[BMSafariBrowsingAssistantUserInteractionDetected visualComponentInteractionInfo](self, "visualComponentInteractionInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualComponentInteractionInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v21)
      {
        v12 = 1;
      }
      else
      {
        -[BMSafariBrowsingAssistantUserInteractionDetected visualComponentInteractionInfo](self, "visualComponentInteractionInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "visualComponentInteractionInfo");
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

- (NSData)webpageViewIdentifier
{
  return self->_webpageViewIdentifier;
}

- (BMSafariBrowsingAssistantVisualComponent)visualComponent
{
  return self->_visualComponent;
}

- (int)userInteractionType
{
  return self->_userInteractionType;
}

- (BMSafariBrowsingAssistantVisualComponentInteractionInfo)visualComponentInteractionInfo
{
  return self->_visualComponentInteractionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualComponentInteractionInfo, 0);
  objc_storeStrong((id *)&self->_visualComponent, 0);
  objc_storeStrong((id *)&self->_webpageViewIdentifier, 0);
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

    v4 = -[BMSafariBrowsingAssistantUserInteractionDetected initByReadFrom:]([BMSafariBrowsingAssistantUserInteractionDetected alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("webpageViewIdentifier"), 4, 0, 1, 14, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("visualComponent_json"), 5, 1, &__block_literal_global_474);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userInteractionType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("visualComponentInteractionInfo_json"), 5, 1, &__block_literal_global_475);
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
  return &unk_1E5F1D308;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("webpageViewIdentifier"), 1, 14, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visualComponent"), 2, 14, objc_opt_class());
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userInteractionType"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visualComponentInteractionInfo"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __59__BMSafariBrowsingAssistantUserInteractionDetected_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualComponentInteractionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__BMSafariBrowsingAssistantUserInteractionDetected_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
