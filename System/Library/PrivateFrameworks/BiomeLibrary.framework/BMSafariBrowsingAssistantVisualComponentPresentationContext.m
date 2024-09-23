@implementation BMSafariBrowsingAssistantVisualComponentPresentationContext

- (BMSafariBrowsingAssistantVisualComponentPresentationContext)initWithWebpageViewIdentifier:(id)a3 visualComponent:(id)a4 started:(id)a5 ended:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMSafariBrowsingAssistantVisualComponentPresentationContext *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationContext;
  v15 = -[BMEventBase init](&v17, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v15->_visualComponent, a4);
    objc_storeStrong((id *)&v15->_started, a5);
    objc_storeStrong((id *)&v15->_ended, a6);
  }

  return v15;
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
  -[BMSafariBrowsingAssistantVisualComponentPresentationContext webpageViewIdentifier](self, "webpageViewIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantVisualComponentPresentationContext visualComponent](self, "visualComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantVisualComponentPresentationContext started](self, "started");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantVisualComponentPresentationContext ended](self, "ended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantVisualComponentPresentationContext with webpageViewIdentifier: %@, visualComponent: %@, started: %@, ended: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantVisualComponentPresentationContext *v5;
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
  int v17;
  uint64_t v19;
  NSData *webpageViewIdentifier;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  BMSafariBrowsingAssistantVisualComponentPresentationContext *v24;
  objc_super v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationContext;
  v5 = -[BMEventBase init](&v26, sel_init);
  if (!v5)
    goto LABEL_36;
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
        if (v11++ >= 9)
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

          break;
        case 2u:
          v27 = 0;
          v28 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_35;
          v21 = -[BMSafariBrowsingAssistantVisualComponent initByReadFrom:]([BMSafariBrowsingAssistantVisualComponent alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_35;
          v22 = 32;
          goto LABEL_32;
        case 3u:
          v27 = 0;
          v28 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_35;
          v21 = -[BMSafariBrowsingAssistantVisualComponentPresentationStarted initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentPresentationStarted alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_35;
          v22 = 40;
          goto LABEL_32;
        case 4u:
          v27 = 0;
          v28 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_35;
          v21 = -[BMSafariBrowsingAssistantVisualComponentPresentationEnded initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentPresentationEnded alloc], "initByReadFrom:", v4);
          if (!v21)
            goto LABEL_35;
          v22 = 48;
LABEL_32:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = v21;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_35;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_35:
    v24 = 0;
  else
LABEL_36:
    v24 = v5;

  return v24;
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
  if (self->_started)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantVisualComponentPresentationStarted writeTo:](self->_started, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_ended)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantVisualComponentPresentationEnded writeTo:](self->_ended, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantVisualComponentPresentationContext writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BMSafariBrowsingAssistantVisualComponent *v9;
  void *v10;
  BMSafariBrowsingAssistantVisualComponentPresentationStarted *v11;
  id v12;
  BMSafariBrowsingAssistantVisualComponentPresentationEnded *v13;
  BMSafariBrowsingAssistantVisualComponentPresentationContext *v14;
  BMSafariBrowsingAssistantVisualComponentPresentationContext *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v32;
  uint64_t v33;
  BMSafariBrowsingAssistantVisualComponent *v34;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  BMSafariBrowsingAssistantVisualComponentPresentationEnded *v42;
  uint64_t v43;
  BMSafariBrowsingAssistantVisualComponentPresentationStarted *v44;
  uint64_t v45;
  BMSafariBrowsingAssistantVisualComponent *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("webpageViewIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v15 = 0;
        v7 = 0;
        v14 = self;
        goto LABEL_47;
      }
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0D025B8];
      v47 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("webpageViewIdentifier"));
      v48[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v9 = (BMSafariBrowsingAssistantVisualComponent *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v7 = 0;
      *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
      goto LABEL_36;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visualComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
LABEL_7:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("started"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v7;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          v14 = self;
          goto LABEL_44;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v43 = *MEMORY[0x1E0CB2D50];
        v11 = (BMSafariBrowsingAssistantVisualComponentPresentationStarted *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("started"));
        v44 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v29, 2, v12);
        goto LABEL_42;
      }
      v12 = v10;
      v39 = 0;
      v11 = -[BMSafariBrowsingAssistantVisualComponentPresentationStarted initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponentPresentationStarted alloc], "initWithJSONDictionary:error:", v12, &v39);
      v19 = v39;
      if (v19)
      {
        v20 = v19;
        if (a4)
          *a4 = objc_retainAutorelease(v19);

LABEL_41:
        v15 = 0;
LABEL_42:
        v14 = self;
        goto LABEL_43;
      }

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ended"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
LABEL_13:
      v14 = -[BMSafariBrowsingAssistantVisualComponentPresentationContext initWithWebpageViewIdentifier:visualComponent:started:ended:](self, "initWithWebpageViewIdentifier:visualComponent:started:ended:", v36, v9, v11, v13);
      v15 = v14;
LABEL_14:

LABEL_43:
LABEL_44:

      v16 = v8;
      v7 = v36;
      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v9;
      v23 = v12;
      v38 = 0;
      v13 = -[BMSafariBrowsingAssistantVisualComponentPresentationEnded initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponentPresentationEnded alloc], "initWithJSONDictionary:error:", v23, &v38);
      v24 = v38;
      if (v24)
      {
        v25 = v24;
        if (a4)
          *a4 = objc_retainAutorelease(v24);

        v15 = 0;
        v14 = self;
        v9 = v34;
        goto LABEL_14;
      }

      v9 = v34;
      goto LABEL_13;
    }
    if (a4)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v33 = *MEMORY[0x1E0D025B8];
      v41 = *MEMORY[0x1E0CB2D50];
      v13 = (BMSafariBrowsingAssistantVisualComponentPresentationEnded *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("ended"));
      v42 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v33, 2, v30);

      v15 = 0;
      v14 = self;
      goto LABEL_14;
    }
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v8;
    v40 = 0;
    v9 = -[BMSafariBrowsingAssistantVisualComponent initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponent alloc], "initWithJSONDictionary:error:", v16, &v40);
    v17 = v40;
    if (!v17)
    {

      goto LABEL_7;
    }
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);

    v15 = 0;
  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      v14 = self;
      goto LABEL_46;
    }
    v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = *MEMORY[0x1E0D025B8];
    v45 = *MEMORY[0x1E0CB2D50];
    v9 = (BMSafariBrowsingAssistantVisualComponent *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("visualComponent"));
    v46 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v28);

    v15 = 0;
    v16 = v8;
  }
LABEL_36:
  v14 = self;
LABEL_45:

  v8 = v16;
LABEL_46:

LABEL_47:
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantVisualComponentPresentationContext webpageViewIdentifier](self, "webpageViewIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantVisualComponentPresentationContext visualComponent](self, "visualComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantVisualComponentPresentationContext started](self, "started");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantVisualComponentPresentationContext ended](self, "ended");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("webpageViewIdentifier");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v11;
  v17[1] = CFSTR("visualComponent");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v12;
  v17[2] = CFSTR("started");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v13;
  v17[3] = CFSTR("ended");
  v14 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v8)
      goto LABEL_11;
  }
  else
  {

    if (v8)
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

  return v15;
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
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistantVisualComponentPresentationContext webpageViewIdentifier](self, "webpageViewIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webpageViewIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantVisualComponentPresentationContext webpageViewIdentifier](self, "webpageViewIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "webpageViewIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMSafariBrowsingAssistantVisualComponentPresentationContext visualComponent](self, "visualComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualComponent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariBrowsingAssistantVisualComponentPresentationContext visualComponent](self, "visualComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMSafariBrowsingAssistantVisualComponentPresentationContext started](self, "started");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "started");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSafariBrowsingAssistantVisualComponentPresentationContext started](self, "started");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "started");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMSafariBrowsingAssistantVisualComponentPresentationContext ended](self, "ended");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ended");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v12 = 1;
    }
    else
    {
      -[BMSafariBrowsingAssistantVisualComponentPresentationContext ended](self, "ended");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ended");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

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

- (BMSafariBrowsingAssistantVisualComponentPresentationStarted)started
{
  return self->_started;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationEnded)ended
{
  return self->_ended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_started, 0);
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

    v4 = -[BMSafariBrowsingAssistantVisualComponentPresentationContext initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentPresentationContext alloc], "initByReadFrom:", v7);
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
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("visualComponent_json"), 5, 1, &__block_literal_global_306);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("started_json"), 5, 1, &__block_literal_global_307);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("ended_json"), 5, 1, &__block_literal_global_308);
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
  return &unk_1E5F1D278;
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
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("started"), 3, 14, objc_opt_class());
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ended"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __70__BMSafariBrowsingAssistantVisualComponentPresentationContext_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ended");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __70__BMSafariBrowsingAssistantVisualComponentPresentationContext_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "started");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __70__BMSafariBrowsingAssistantVisualComponentPresentationContext_columns__block_invoke(uint64_t a1, void *a2)
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
